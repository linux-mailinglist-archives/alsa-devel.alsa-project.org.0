Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18539F8A6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:13:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65479174B;
	Tue,  8 Jun 2021 16:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65479174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161602;
	bh=nhoCiR2R7d+Xtk/Nr/gkznCi1n0GGsrzUnJMhv2MM/s=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oBasMUBcBYIJ/sknpreudJEG4txBA/c3Oarqp7gsg06PcsCalcqs41sQBzBgRFUJf
	 QxQiv6D7rAQZp6M1BYKLlGfm6ei742F0lVViNnxNmEpW/6zix3g1EMn/Bznu2i1mR7
	 dd+kbYw5NJbqr0lchdqBmncXGA8e0M9WJZ3/D+dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7703CF804DA;
	Tue,  8 Jun 2021 16:06:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A030EF805A0; Tue,  8 Jun 2021 16:06:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 388AFF804CA
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 388AFF804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="if1NXR1d"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="h6/RPCg3"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id F4076219DE
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ovcWUwDWW2APDyCVNThkQWH3oKuh52b02uGwP/BMkzc=;
 b=if1NXR1ducw3m67ph+vNue8B9b8cJBFRo0rsGttwZTb97wsRnofPes7AbMSbC9/SlgqAqT
 DgNldQdl539RdwgcB3J/KSpvA2f1C4jsbroKvWK12TIq7A4Wa0fg/GIraIykDf/+81mOza
 aJCnrkGvQa9YyhCk0bVtRHrrWCWqbrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ovcWUwDWW2APDyCVNThkQWH3oKuh52b02uGwP/BMkzc=;
 b=h6/RPCg3K9X6WRV7bCg4SaZU7EhAfUZb7ax45/wuMh88ePDt5atUK/yd4lGehsSr7QcVhm
 ZuX5zmM3uF2HqWDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E42E8A3B85;
 Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/66] ALSA: opti9xx: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:42 +0200
Message-Id: <20210608140540.17885-9-tiwai@suse.de>
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

ISA Opti9xx driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/opti9xx/miro.c           | 27 ++++++++++++++++++---------
 sound/isa/opti9xx/opti92x-ad1848.c | 27 ++++++++++++++++++---------
 2 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/sound/isa/opti9xx/miro.c b/sound/isa/opti9xx/miro.c
index a510b201143c..e1fb7567fdcc 100644
--- a/sound/isa/opti9xx/miro.c
+++ b/sound/isa/opti9xx/miro.c
@@ -722,35 +722,43 @@ static int snd_miro_mixer(struct snd_card *card,
 	}
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_miro_controls); idx++) {
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_controls[idx], miro))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_controls[idx], miro));
+		if (err < 0)
 			return err;
 	}
 
 	if ((miro->aci->aci_product == 'A') ||
 	    (miro->aci->aci_product == 'B')) {
 		/* PCM1/PCM12 with power-amp and Line 2 */
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_line_control[0], miro))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_line_control[0], miro));
+		if (err < 0)
 			return err;
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_amp_control[0], miro))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_amp_control[0], miro));
+		if (err < 0)
 			return err;
 	}
 
 	if ((miro->aci->aci_product == 'B') ||
 	    (miro->aci->aci_product == 'C')) {
 		/* PCM12/PCM20 with mic-preamp */
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_preamp_control[0], miro))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_preamp_control[0], miro));
+		if (err < 0)
 			return err;
-		if (miro->aci->aci_version >= 176)
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_capture_control[0], miro))) < 0)
+		if (miro->aci->aci_version >= 176) {
+			err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_capture_control[0], miro));
+			if (err < 0)
 				return err;
+		}
 	}
 
 	if (miro->aci->aci_product == 'C') {
 		/* PCM20 with radio and 7 band equalizer */
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_radio_control[0], miro))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_radio_control[0], miro));
+		if (err < 0)
 			return err;
 		for (idx = 0; idx < ARRAY_SIZE(snd_miro_eq_controls); idx++) {
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_eq_controls[idx], miro))) < 0)
+			err = snd_ctl_add(card, snd_ctl_new1(&snd_miro_eq_controls[idx], miro));
+			if (err < 0)
 				return err;
 		}
 	}
@@ -1178,7 +1186,8 @@ static int snd_card_miro_detect(struct snd_card *card,
 
 	for (i = OPTi9XX_HW_82C929; i <= OPTi9XX_HW_82C924; i++) {
 
-		if ((err = snd_miro_init(chip, i)) < 0)
+		err = snd_miro_init(chip, i);
+		if (err < 0)
 			return err;
 
 		err = snd_miro_opti_check(chip);
diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
index 08e61d90057b..4bd1dc6707fc 100644
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -970,32 +970,37 @@ static int snd_opti9xx_isa_probe(struct device *devptr,
 #endif	/* CS4231 || OPTi93X */
 
 	if (mpu_port == SNDRV_AUTO_PORT) {
-		if ((mpu_port = snd_legacy_find_free_ioport(possible_mpu_ports, 2)) < 0) {
+		mpu_port = snd_legacy_find_free_ioport(possible_mpu_ports, 2);
+		if (mpu_port < 0) {
 			snd_printk(KERN_ERR "unable to find a free MPU401 port\n");
 			return -EBUSY;
 		}
 	}
 	if (irq == SNDRV_AUTO_IRQ) {
-		if ((irq = snd_legacy_find_free_irq(possible_irqs)) < 0) {
+		irq = snd_legacy_find_free_irq(possible_irqs);
+		if (irq < 0) {
 			snd_printk(KERN_ERR "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
 	}
 	if (mpu_irq == SNDRV_AUTO_IRQ) {
-		if ((mpu_irq = snd_legacy_find_free_irq(possible_mpu_irqs)) < 0) {
+		mpu_irq = snd_legacy_find_free_irq(possible_mpu_irqs);
+		if (mpu_irq < 0) {
 			snd_printk(KERN_ERR "unable to find a free MPU401 IRQ\n");
 			return -EBUSY;
 		}
 	}
 	if (dma1 == SNDRV_AUTO_DMA) {
-		if ((dma1 = snd_legacy_find_free_dma(possible_dma1s)) < 0) {
+		dma1 = snd_legacy_find_free_dma(possible_dma1s);
+		if (dma1 < 0) {
 			snd_printk(KERN_ERR "unable to find a free DMA1\n");
 			return -EBUSY;
 		}
 	}
 #if defined(CS4231) || defined(OPTi93X)
 	if (dma2 == SNDRV_AUTO_DMA) {
-		if ((dma2 = snd_legacy_find_free_dma(possible_dma2s[dma1 % 4])) < 0) {
+		dma2 = snd_legacy_find_free_dma(possible_dma2s[dma1 % 4]);
+		if (dma2 < 0) {
 			snd_printk(KERN_ERR "unable to find a free DMA2\n");
 			return -EBUSY;
 		}
@@ -1006,11 +1011,13 @@ static int snd_opti9xx_isa_probe(struct device *devptr,
 	if (error < 0)
 		return error;
 
-	if ((error = snd_card_opti9xx_detect(card, card->private_data)) < 0) {
+	error = snd_card_opti9xx_detect(card, card->private_data);
+	if (error < 0) {
 		snd_card_free(card);
 		return error;
 	}
-	if ((error = snd_opti9xx_probe(card)) < 0) {
+	error = snd_opti9xx_probe(card);
+	if (error < 0) {
 		snd_card_free(card);
 		return error;
 	}
@@ -1111,7 +1118,8 @@ static int snd_opti9xx_pnp_probe(struct pnp_card_link *pcard,
 		return -ENODEV;
 	}
 
-	if ((error = snd_opti9xx_init(chip, hw))) {
+	error = snd_opti9xx_init(chip, hw);
+	if (error) {
 		snd_card_free(card);
 		return error;
 	}
@@ -1121,7 +1129,8 @@ static int snd_opti9xx_pnp_probe(struct pnp_card_link *pcard,
 		snd_card_free(card);
 		return error;
 	}
-	if ((error = snd_opti9xx_probe(card)) < 0) {
+	error = snd_opti9xx_probe(card);
+	if (error < 0) {
 		snd_card_free(card);
 		return error;
 	}
-- 
2.26.2

