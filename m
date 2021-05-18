Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD58387DEF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 18:54:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 231FB1763;
	Tue, 18 May 2021 18:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 231FB1763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621356868;
	bh=WlekRqsbcbo2BUjkWmxAuW3bKmtLBKPvgcTfxLOeArY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h/8e67jyawXHMQgzXW7Z3Uy5qSXWcjD31st2f5VWApzjNGnypot01uD3AAbwa1Exn
	 sBPXZQW/MD6A8uYcgypF4NrH5jOgcKbG4H/epFz31O+fbgtiX6vOmAiXqkmg95IdXP
	 /4KBn3c9qI4cM2Y7ZkDCYit3cTcdGmBSBW0sZss4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BC52F8042F;
	Tue, 18 May 2021 18:52:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C52A4F80475; Tue, 18 May 2021 18:52:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD548F8012C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 18:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD548F8012C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B2D9B1AE;
 Tue, 18 May 2021 16:52:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ALSA: control: Add power state check commonly for ioctl
 handlers
Date: Tue, 18 May 2021 18:51:56 +0200
Message-Id: <20210518165201.24376-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210518165201.24376-1-tiwai@suse.de>
References: <20210518165201.24376-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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

The card power state check can be better put in the common ioctl
handler, as basically we want to prevent ioctls during the power off
state.  Although this situation won't happen normally any longer (*),
it'll be helpful for catching this for the future implementation like
the faked suspend that is needed for PCI rescan.

(*) Long long time ago, before the proper PM framework was introduced,
it was still possible to reach SNDRV_CTL_IOCTL_POWER ioctl during the
power off state.  This ioctl existed as a main control for the suspend
resume state in the past, but the feature was already dropped along
with the standard PM framework.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c        | 3 +++
 sound/core/control_compat.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/sound/core/control.c b/sound/core/control.c
index 498e3701514a..c22c3fad0c64 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1772,6 +1772,9 @@ static long snd_ctl_ioctl(struct file *file, unsigned int cmd, unsigned long arg
 	card = ctl->card;
 	if (snd_BUG_ON(!card))
 		return -ENXIO;
+	err = snd_power_wait(card, SNDRV_CTL_POWER_D0);
+	if (err < 0)
+		return err;
 	switch (cmd) {
 	case SNDRV_CTL_IOCTL_PVERSION:
 		return put_user(SNDRV_CTL_VERSION, ip) ? -EFAULT : 0;
diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 1d708aab9c98..d5b562ff237b 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -438,6 +438,9 @@ static inline long snd_ctl_ioctl_compat(struct file *file, unsigned int cmd, uns
 	if (snd_BUG_ON(!ctl || !ctl->card))
 		return -ENXIO;
 
+	err = snd_power_wait(ctl->card, SNDRV_CTL_POWER_D0);
+	if (err < 0)
+		return err;
 	switch (cmd) {
 	case SNDRV_CTL_IOCTL_PVERSION:
 	case SNDRV_CTL_IOCTL_CARD_INFO:
-- 
2.26.2

