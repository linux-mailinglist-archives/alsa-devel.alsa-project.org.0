Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7F039F879
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:09:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28A0F171D;
	Tue,  8 Jun 2021 16:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28A0F171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161354;
	bh=ydVdRkQbxp13pssRyVForQORkaQmDqSJPkRo6l4SR9M=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IIDJ2FMNlRCLKui75Ah0OObct3Am/bNHC4fHFV+Niegelnvx0D3MYs9ALLFspd5e6
	 uNOFAHqOZZTCAmNg2sE1cpBJ59Lf2de83Lzlz8WBGgOYgcCFvODM1C+LeVYTNQ1ot6
	 ANk0ejhHRmZ+49z8n6UH7nivjH/EkuBT77RFLEys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99FEDF8054A;
	Tue,  8 Jun 2021 16:06:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4EF3F804AB; Tue,  8 Jun 2021 16:06:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE2B6F804AC
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE2B6F804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="vj0ZXhyd"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="mr8idIHQ"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1D09F1FD54
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+YbAFWSunVYHLJi0fLHR5pXtHXD9rNtYkcdg/TCpuY=;
 b=vj0ZXhyd6RI80IBAxn1aXpJmLusnLq1It2BfvyvGLS6NfeXiMCkb3jYJjJ1b8JZdvcljaH
 1NFRCxM8V3A3fhdBDrzfHEoFP3mXuhxTn45hAW/XjVOrsVOTBTGOR0jvgdiaqDFjTOHvew
 bvEguV1N2UsugVjz1a5enjfqle0bZBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+YbAFWSunVYHLJi0fLHR5pXtHXD9rNtYkcdg/TCpuY=;
 b=mr8idIHQ05BEU6cj9edFacrB6OdKt7CkfsfzmnESbs57pw9XddxHNIengLR5qMOaJ3q7WU
 crFQU+O0zfbBm9CA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 0D7F2A3B85;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/66] ALSA: es18xx: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:44 +0200
Message-Id: <20210608140540.17885-11-tiwai@suse.de>
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

ISA ES18xx driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/es18xx.c | 51 ++++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
index 375a4a6a4717..68b9c59e1127 100644
--- a/sound/isa/es18xx.c
+++ b/sound/isa/es18xx.c
@@ -1573,7 +1573,8 @@ static int snd_es18xx_identify(struct snd_es18xx *chip)
 		udelay(10);
 		chip->ctrl_port += inb(chip->port + 0x05);
 
-		if ((chip->res_ctrl_port = request_region(chip->ctrl_port, 8, "ES18xx - CTRL")) == NULL) {
+		chip->res_ctrl_port = request_region(chip->ctrl_port, 8, "ES18xx - CTRL");
+		if (!chip->res_ctrl_port) {
 			snd_printk(KERN_ERR PFX "unable go grab port 0x%lx\n", chip->ctrl_port);
 			return -EBUSY;
 		}
@@ -1832,41 +1833,48 @@ static int snd_es18xx_mixer(struct snd_card *card)
 				break;
 			}
 		}
-		if ((err = snd_ctl_add(card, kctl)) < 0)
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			return err;
 	}
 	if (chip->caps & ES18XX_PCM2) {
 		for (idx = 0; idx < ARRAY_SIZE(snd_es18xx_pcm2_controls); idx++) {
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_es18xx_pcm2_controls[idx], chip))) < 0)
+			err = snd_ctl_add(card, snd_ctl_new1(&snd_es18xx_pcm2_controls[idx], chip));
+			if (err < 0)
 				return err;
 		} 
 	} else {
 		for (idx = 0; idx < ARRAY_SIZE(snd_es18xx_pcm1_controls); idx++) {
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_es18xx_pcm1_controls[idx], chip))) < 0)
+			err = snd_ctl_add(card, snd_ctl_new1(&snd_es18xx_pcm1_controls[idx], chip));
+			if (err < 0)
 				return err;
 		}
 	}
 
 	if (chip->caps & ES18XX_RECMIX) {
 		for (idx = 0; idx < ARRAY_SIZE(snd_es18xx_recmix_controls); idx++) {
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_es18xx_recmix_controls[idx], chip))) < 0)
+			err = snd_ctl_add(card, snd_ctl_new1(&snd_es18xx_recmix_controls[idx], chip));
+			if (err < 0)
 				return err;
 		}
 	}
 	switch (chip->version) {
 	default:
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_es18xx_micpre1_control, chip))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_es18xx_micpre1_control, chip));
+		if (err < 0)
 			return err;
 		break;
 	case 0x1869:
 	case 0x1879:
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_es18xx_micpre2_control, chip))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_es18xx_micpre2_control, chip));
+		if (err < 0)
 			return err;
 		break;
 	}
 	if (chip->caps & ES18XX_SPATIALIZER) {
 		for (idx = 0; idx < ARRAY_SIZE(snd_es18xx_spatializer_controls); idx++) {
-			if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_es18xx_spatializer_controls[idx], chip))) < 0)
+			err = snd_ctl_add(card, snd_ctl_new1(&snd_es18xx_spatializer_controls[idx], chip));
+			if (err < 0)
 				return err;
 		}
 	}
@@ -1879,7 +1887,8 @@ static int snd_es18xx_mixer(struct snd_card *card)
 			else
 				chip->hw_switch = kctl;
 			kctl->private_free = snd_es18xx_hwv_free;
-			if ((err = snd_ctl_add(card, kctl)) < 0)
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
 				return err;
 			
 		}
@@ -2154,7 +2163,8 @@ static int snd_es18xx_isa_probe1(int dev, struct device *devptr)
 	err = snd_es18xx_card_new(devptr, dev, &card);
 	if (err < 0)
 		return err;
-	if ((err = snd_audiodrive_probe(card, dev)) < 0) {
+	err = snd_audiodrive_probe(card, dev);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -2169,19 +2179,22 @@ static int snd_es18xx_isa_probe(struct device *pdev, unsigned int dev)
 	static const int possible_dmas[] = {1, 0, 3, 5, -1};
 
 	if (irq[dev] == SNDRV_AUTO_IRQ) {
-		if ((irq[dev] = snd_legacy_find_free_irq(possible_irqs)) < 0) {
+		irq[dev] = snd_legacy_find_free_irq(possible_irqs);
+		if (irq[dev] < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
 	}
 	if (dma1[dev] == SNDRV_AUTO_DMA) {
-		if ((dma1[dev] = snd_legacy_find_free_dma(possible_dmas)) < 0) {
+		dma1[dev] = snd_legacy_find_free_dma(possible_dmas);
+		if (dma1[dev] < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free DMA1\n");
 			return -EBUSY;
 		}
 	}
 	if (dma2[dev] == SNDRV_AUTO_DMA) {
-		if ((dma2[dev] = snd_legacy_find_free_dma(possible_dmas)) < 0) {
+		dma2[dev] = snd_legacy_find_free_dma(possible_dmas);
+		if (dma2[dev] < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free DMA2\n");
 			return -EBUSY;
 		}
@@ -2257,11 +2270,13 @@ static int snd_audiodrive_pnp_detect(struct pnp_dev *pdev,
 	err = snd_es18xx_card_new(&pdev->dev, dev, &card);
 	if (err < 0)
 		return err;
-	if ((err = snd_audiodrive_pnp(dev, card->private_data, pdev)) < 0) {
+	err = snd_audiodrive_pnp(dev, card->private_data, pdev);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_audiodrive_probe(card, dev)) < 0) {
+	err = snd_audiodrive_probe(card, dev);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -2315,11 +2330,13 @@ static int snd_audiodrive_pnpc_detect(struct pnp_card_link *pcard,
 	if (res < 0)
 		return res;
 
-	if ((res = snd_audiodrive_pnpc(dev, card->private_data, pcard, pid)) < 0) {
+	res = snd_audiodrive_pnpc(dev, card->private_data, pcard, pid);
+	if (res < 0) {
 		snd_card_free(card);
 		return res;
 	}
-	if ((res = snd_audiodrive_probe(card, dev)) < 0) {
+	res = snd_audiodrive_probe(card, dev);
+	if (res < 0) {
 		snd_card_free(card);
 		return res;
 	}
-- 
2.26.2

