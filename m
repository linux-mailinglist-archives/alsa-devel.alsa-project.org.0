Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CCC3CB7DC
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 15:29:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 023D4168B;
	Fri, 16 Jul 2021 15:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 023D4168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626442145;
	bh=qlZXqrSdqTj6MgD+lQwa3QW81HnmfJ4uLQWkXJ8yoZk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RROHc4rlLl6EVipXl+vLFJTH2IBky9qCSEN1m5ZfRehE/JM5L2280BXJvG9PgDi41
	 tKDUFpvk5fe6cHeGqHygRfIdaEkeglcZ3PmiV1V6RFvdLcS86Hy4fNO+UdayZBu0i3
	 rkJD4cYbCq6EG2TRuxoWjBBCU0WbbTcMZ4sQY2Ns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DD2BF800FE;
	Fri, 16 Jul 2021 15:27:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8663FF80254; Fri, 16 Jul 2021 15:27:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56C53F8013C
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 15:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C53F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="cedmU5s1"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="FCzjPq7C"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D5490205E6;
 Fri, 16 Jul 2021 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626442044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=exJ4jCuu+MUrp8eZx7KSMYNQ0lXUk0+nqgJLOEz49tQ=;
 b=cedmU5s1xlvBHM4Yq4nUeCd5F/FtNSqMQK40SzyzFCTUt5BI2o+4zWMgqx5gT2cl0EnJdU
 CmgA86S8oLCD0tGVgWlWC9VsDRQymJfmXNdtpGrR+Ji6BJL8vyA65CcEB6+hB+JOxHWf/6
 W7Rmg+fcnFWagLnmFkEAonK31dIRZvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626442044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=exJ4jCuu+MUrp8eZx7KSMYNQ0lXUk0+nqgJLOEz49tQ=;
 b=FCzjPq7C6ZRggc6vCTHlF1qsmxpsaK2Us5zocrche18CDff+VVecBxWBRxjTzVGuYbe12E
 /fX+DkjASnypp3Dg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C538EA3BB0;
 Fri, 16 Jul 2021 13:27:24 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: sb: Fix potential ABBA deadlock in CSP driver
Date: Fri, 16 Jul 2021 15:27:23 +0200
Message-Id: <20210716132723.13216-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SB16 CSP driver may hit potentially a typical ABBA deadlock in two
code paths:

 In snd_sb_csp_stop():
     spin_lock_irqsave(&p->chip->mixer_lock, flags);
     spin_lock(&p->chip->reg_lock);

 In snd_sb_csp_load():
     spin_lock_irqsave(&p->chip->reg_lock, flags);
     spin_lock(&p->chip->mixer_lock);

Also the similar pattern is seen in snd_sb_csp_start().

Although the practical impact is very small (those states aren't
triggered in the same running state and this happens only on a real
hardware, decades old ISA sound boards -- which must be very difficult
to find nowadays), it's a real scenario and has to be fixed.

This patch addresses those deadlocks by splitting the locks in
snd_sb_csp_start() and snd_sb_csp_stop() for avoiding the nested
locks.

Reported-by: Jia-Ju Bai <baijiaju1990@gmail.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/7b0fcdaf-cd4f-4728-2eae-48c151a92e10@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/sb16_csp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
index 5bbe6695689d..7ad8c5f7b664 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -816,6 +816,7 @@ static int snd_sb_csp_start(struct snd_sb_csp * p, int sample_width, int channel
 	mixR = snd_sbmixer_read(p->chip, SB_DSP4_PCM_DEV + 1);
 	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL & 0x7);
 	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR & 0x7);
+	spin_unlock_irqrestore(&p->chip->mixer_lock, flags);
 
 	spin_lock(&p->chip->reg_lock);
 	set_mode_register(p->chip, 0xc0);	/* c0 = STOP */
@@ -855,6 +856,7 @@ static int snd_sb_csp_start(struct snd_sb_csp * p, int sample_width, int channel
 	spin_unlock(&p->chip->reg_lock);
 
 	/* restore PCM volume */
+	spin_lock_irqsave(&p->chip->mixer_lock, flags);
 	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL);
 	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR);
 	spin_unlock_irqrestore(&p->chip->mixer_lock, flags);
@@ -880,6 +882,7 @@ static int snd_sb_csp_stop(struct snd_sb_csp * p)
 	mixR = snd_sbmixer_read(p->chip, SB_DSP4_PCM_DEV + 1);
 	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL & 0x7);
 	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR & 0x7);
+	spin_unlock_irqrestore(&p->chip->mixer_lock, flags);
 
 	spin_lock(&p->chip->reg_lock);
 	if (p->running & SNDRV_SB_CSP_ST_QSOUND) {
@@ -894,6 +897,7 @@ static int snd_sb_csp_stop(struct snd_sb_csp * p)
 	spin_unlock(&p->chip->reg_lock);
 
 	/* restore PCM volume */
+	spin_lock_irqsave(&p->chip->mixer_lock, flags);
 	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL);
 	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR);
 	spin_unlock_irqrestore(&p->chip->mixer_lock, flags);
-- 
2.26.2

