Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 963AD39F8F3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:24:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 364D9182F;
	Tue,  8 Jun 2021 16:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 364D9182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162244;
	bh=911+jmPkBius6j83n0O9C7FvusYJaz5xeY+iHY1XPkk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yuj+j764lTAZLUz4Mmi5rX14e82BALkVsEz0LokPXKWoG6T7sryxSakwBvqygzGGf
	 HrzgeDoz2tqIBLAgLGwa+Hnu00eH5ZFjw3D4+If8TG5dYjAsbP9OulCHreZIuq9M0U
	 82EUlwDpmpir4IMuU1Th+Lcff3+64iETgDFg5LIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE9C7F8065C;
	Tue,  8 Jun 2021 16:07:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40322F8060C; Tue,  8 Jun 2021 16:07:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AC97F804FE
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AC97F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="wsb0+OKm"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="nvp9P5PO"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4A87D219DF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oD2IyxSC/XolnBEa4F4v/ISC8iZKSqSsYZ4AEMT4QXU=;
 b=wsb0+OKmIKgMTDFIMzqBbaG0JEjpyn2yPOdaHREzNkVxUEvwSTrqI/Ei0wKQW8NtJC7gnT
 d4dc8LJnjulhNqgO6b8Bg1Hlk8BIRvnoJv1ftPztuD49IfqjDk60j+6BbFQEXliIUZ4krt
 PU6JkmZvPUF+5qFpQwQEX3jc23WqSAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oD2IyxSC/XolnBEa4F4v/ISC8iZKSqSsYZ4AEMT4QXU=;
 b=nvp9P5POeK5A0368jpcqo7sG6IP4SSQIPHJ3GRBIu5AqIhQPmQEiyeQ1ry6/ObDmvfvK8m
 fsxR6Kgc3GDrWuBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 3AD0DA3B85;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/66] ALSA: isa: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:48 +0200
Message-Id: <20210608140540.17885-15-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

ISA ES1688 and WSS  driver code contains a few assignments in if
condition, which is a bad coding style that may confuse readers and
occasionally lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/es1688/es1688_lib.c | 3 ++-
 sound/isa/wss/wss_lib.c       | 9 ++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/isa/es1688/es1688_lib.c b/sound/isa/es1688/es1688_lib.c
index 1816e55c6edf..8554cb2263c1 100644
--- a/sound/isa/es1688/es1688_lib.c
+++ b/sound/isa/es1688/es1688_lib.c
@@ -971,7 +971,8 @@ int snd_es1688_mixer(struct snd_card *card, struct snd_es1688 *chip)
 	strcpy(card->mixername, snd_es1688_chip_id(chip));
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_es1688_controls); idx++) {
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_es1688_controls[idx], chip))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_es1688_controls[idx], chip));
+		if (err < 0)
 			return err;
 	}
 	for (idx = 0; idx < ES1688_INIT_TABLE_SIZE; idx++) {
diff --git a/sound/isa/wss/wss_lib.c b/sound/isa/wss/wss_lib.c
index ea5d3cdfe4e4..743e0f05e335 100644
--- a/sound/isa/wss/wss_lib.c
+++ b/sound/isa/wss/wss_lib.c
@@ -1493,7 +1493,8 @@ static int snd_wss_playback_open(struct snd_pcm_substream *substream)
 	snd_pcm_limit_isa_dma_size(chip->dma1, &runtime->hw.period_bytes_max);
 
 	if (chip->claim_dma) {
-		if ((err = chip->claim_dma(chip, chip->dma_private_data, chip->dma1)) < 0)
+		err = chip->claim_dma(chip, chip->dma_private_data, chip->dma1);
+		if (err < 0)
 			return err;
 	}
 
@@ -1533,7 +1534,8 @@ static int snd_wss_capture_open(struct snd_pcm_substream *substream)
 	snd_pcm_limit_isa_dma_size(chip->dma2, &runtime->hw.period_bytes_max);
 
 	if (chip->claim_dma) {
-		if ((err = chip->claim_dma(chip, chip->dma_private_data, chip->dma2)) < 0)
+		err = chip->claim_dma(chip, chip->dma_private_data, chip->dma2);
+		if (err < 0)
 			return err;
 	}
 
@@ -1934,7 +1936,8 @@ int snd_wss_timer(struct snd_wss *chip, int device)
 	tid.card = chip->card->number;
 	tid.device = device;
 	tid.subdevice = 0;
-	if ((err = snd_timer_new(chip->card, "CS4231", &tid, &timer)) < 0)
+	err = snd_timer_new(chip->card, "CS4231", &tid, &timer);
+	if (err < 0)
 		return err;
 	strcpy(timer->name, snd_wss_chip_id(chip));
 	timer->private_data = chip;
-- 
2.26.2

