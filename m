Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B40383C7281
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:43:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D393172C;
	Tue, 13 Jul 2021 16:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D393172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187415;
	bh=Gx8Ju0LI1Yf83GMoEeBoCRWdCveBfW1BghwUSSMIQlE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AyNudAhP0FRtWDH36PD83Msploj2IvkUuJUoSwd2Bv7E3t91fOD13qTnuiB0HEEtA
	 +TqEJgAT9omf8MKm3xJzjaOPGui9YhXApsti9lvzLK5EMRxHn2paPatcGx6e2dQwJU
	 7ORuQof1TIQS/TN789Ts0lCiQuP+8RRy5vkZwMjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4601BF805F8;
	Tue, 13 Jul 2021 16:30:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0AC0F8058C; Tue, 13 Jul 2021 16:29:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B1F0F8052E
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B1F0F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="KPehyHhb"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="YIeniuZH"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 64996201DA
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBcKzorYb9+0sCrQplrVQnJeq0EmRZlXhtZN/SLyW74=;
 b=KPehyHhbaOBlAKXZH6VkDi++7vk4Z8HsnyAk9SaOFslWP7BZvnN+PTWUe3wlPoj7/gEZ94
 0c4DPMsF0tGR6GktMBbeLYqKHlwREPp9z6skpNMFK14ENGkXXXbfqn2KZrZkZE71A4eNYe
 gvYSP3KB/JyuM7SianYhEA/VmYIvkrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186576;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBcKzorYb9+0sCrQplrVQnJeq0EmRZlXhtZN/SLyW74=;
 b=YIeniuZHHsY2vvRP+k+xWiyi8tB+SsbwZPf8ls80P+AlDG8PnFzLbjNkjdSP9epWrdViX8
 gFewy9zVY8jP/ZDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 539AAA3B92;
 Tue, 13 Jul 2021 14:29:36 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 34/51] ALSA: ice1712: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:28:40 +0200
Message-Id: <20210713142857.19654-35-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713142857.19654-1-tiwai@suse.de>
References: <20210713142857.19654-1-tiwai@suse.de>
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

This patch converts the resource management in PCI ice1712 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.
Along with it, the chip_exit callback chain is moved into the card's
private_free instead of the PCI remove callback, too.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/ice1712.c | 133 ++++++++----------------------------
 1 file changed, 30 insertions(+), 103 deletions(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index d54cd5143e9f..a5241a287851 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2432,31 +2432,18 @@ static int snd_ice1712_build_controls(struct snd_ice1712 *ice)
 			   snd_ctl_new1(&snd_ice1712_mixer_pro_peak, ice));
 }
 
-static int snd_ice1712_free(struct snd_ice1712 *ice)
+static void snd_ice1712_free(struct snd_card *card)
 {
-	if (!ice->port)
-		goto __hw_end;
+	struct snd_ice1712 *ice = card->private_data;
+
+	if (ice->card_info && ice->card_info->chip_exit)
+		ice->card_info->chip_exit(ice);
+
 	/* mask all interrupts */
 	outb(ICE1712_MULTI_CAPTURE | ICE1712_MULTI_PLAYBACK, ICEMT(ice, IRQ));
 	outb(0xff, ICEREG(ice, IRQMASK));
-	/* --- */
-__hw_end:
-	if (ice->irq >= 0)
-		free_irq(ice->irq, ice);
 
-	if (ice->port)
-		pci_release_regions(ice->pci);
 	snd_ice1712_akm4xxx_free(ice);
-	pci_disable_device(ice->pci);
-	kfree(ice->spec);
-	kfree(ice);
-	return 0;
-}
-
-static int snd_ice1712_dev_free(struct snd_device *device)
-{
-	struct snd_ice1712 *ice = device->device_data;
-	return snd_ice1712_free(ice);
 }
 
 static int snd_ice1712_create(struct snd_card *card,
@@ -2464,34 +2451,22 @@ static int snd_ice1712_create(struct snd_card *card,
 			      const char *modelname,
 			      int omni,
 			      int cs8427_timeout,
-			      int dxr_enable,
-			      struct snd_ice1712 **r_ice1712)
+			      int dxr_enable)
 {
-	struct snd_ice1712 *ice;
+	struct snd_ice1712 *ice = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_ice1712_dev_free,
-	};
-
-	*r_ice1712 = NULL;
 
 	/* enable PCI device */
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 	/* check, if we can restrict PCI DMA transfers to 28 bits */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28))) {
 		dev_err(card->dev,
 			"architecture does not support 28bit PCI busmaster DMA\n");
-		pci_disable_device(pci);
 		return -ENXIO;
 	}
 
-	ice = kzalloc(sizeof(*ice), GFP_KERNEL);
-	if (ice == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
 	ice->omni = omni ? 1 : 0;
 	if (cs8427_timeout < 1)
 		cs8427_timeout = 1;
@@ -2523,45 +2498,29 @@ static int snd_ice1712_create(struct snd_card *card,
 	pci_write_config_word(ice->pci, 0x42, 0x0006);
 	snd_ice1712_proc_init(ice);
 
-	card->private_data = ice;
-
 	err = pci_request_regions(pci, "ICE1712");
-	if (err < 0) {
-		kfree(ice);
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 	ice->port = pci_resource_start(pci, 0);
 	ice->ddma_port = pci_resource_start(pci, 1);
 	ice->dmapath_port = pci_resource_start(pci, 2);
 	ice->profi_port = pci_resource_start(pci, 3);
 
-	if (request_irq(pci->irq, snd_ice1712_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, ice)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_ice1712_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, ice)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_ice1712_free(ice);
 		return -EIO;
 	}
 
 	ice->irq = pci->irq;
 	card->sync_irq = ice->irq;
+	card->private_free = snd_ice1712_free;
 
-	if (snd_ice1712_read_eeprom(ice, modelname) < 0) {
-		snd_ice1712_free(ice);
+	if (snd_ice1712_read_eeprom(ice, modelname) < 0)
 		return -EIO;
-	}
-	if (snd_ice1712_chip_init(ice) < 0) {
-		snd_ice1712_free(ice);
+	if (snd_ice1712_chip_init(ice) < 0)
 		return -EIO;
-	}
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, ice, &ops);
-	if (err < 0) {
-		snd_ice1712_free(ice);
-		return err;
-	}
 
-	*r_ice1712 = ice;
 	return 0;
 }
 
@@ -2591,34 +2550,31 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 	}
 
 	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+			   sizeof(*ice), &card);
 	if (err < 0)
 		return err;
+	ice = card->private_data;
 
 	strcpy(card->driver, "ICE1712");
 	strcpy(card->shortname, "ICEnsemble ICE1712");
 
 	err = snd_ice1712_create(card, pci, model[dev], omni[dev],
-		cs8427_timeout[dev], dxr_enable[dev], &ice);
-	if (err < 0) {
-		snd_card_free(card);
+				 cs8427_timeout[dev], dxr_enable[dev]);
+	if (err < 0)
 		return err;
-	}
 
 	for (tbl = card_tables; *tbl; tbl++) {
 		for (c = *tbl; c->subvendor; c++) {
 			if (c->subvendor == ice->eeprom.subvendor) {
-				ice->card_info = c;
 				strcpy(card->shortname, c->name);
 				if (c->driver) /* specific driver? */
 					strcpy(card->driver, c->driver);
 				if (c->chip_init) {
 					err = c->chip_init(ice);
-					if (err < 0) {
-						snd_card_free(card);
+					if (err < 0)
 						return err;
-					}
 				}
+				ice->card_info = c;
 				goto __found;
 			}
 		}
@@ -2627,45 +2583,33 @@ static int snd_ice1712_probe(struct pci_dev *pci,
  __found:
 
 	err = snd_ice1712_pcm_profi(ice, pcm_dev++);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	if (ice_has_con_ac97(ice)) {
 		err = snd_ice1712_pcm(ice, pcm_dev++);
-		if (err < 0) {
-			snd_card_free(card);
+		if (err < 0)
 			return err;
-		}
 	}
 
 	err = snd_ice1712_ac97_mixer(ice);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	err = snd_ice1712_build_controls(ice);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	if (c->build_controls) {
 		err = c->build_controls(ice);
-		if (err < 0) {
-			snd_card_free(card);
+		if (err < 0)
 			return err;
-		}
 	}
 
 	if (ice_has_con_ac97(ice)) {
 		err = snd_ice1712_pcm_ds(ice, pcm_dev++);
-		if (err < 0) {
-			snd_card_free(card);
+		if (err < 0)
 			return err;
-		}
 	}
 
 	if (!c->no_mpu401) {
@@ -2674,10 +2618,8 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 			c->mpu401_1_info_flags |
 			MPU401_INFO_INTEGRATED | MPU401_INFO_IRQ_HOOK,
 			-1, &ice->rmidi[0]);
-		if (err < 0) {
-			snd_card_free(card);
+		if (err < 0)
 			return err;
-		}
 		if (c->mpu401_1_name)
 			/*  Preferred name available in card_info */
 			snprintf(ice->rmidi[0]->name,
@@ -2692,10 +2634,8 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 				MPU401_INFO_INTEGRATED | MPU401_INFO_IRQ_HOOK,
 				-1, &ice->rmidi[1]);
 
-			if (err < 0) {
-				snd_card_free(card);
+			if (err < 0)
 				return err;
-			}
 			if (c->mpu401_2_name)
 				/*  Preferred name available in card_info */
 				snprintf(ice->rmidi[1]->name,
@@ -2711,25 +2651,13 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 		card->shortname, ice->port, ice->irq);
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
 }
 
-static void snd_ice1712_remove(struct pci_dev *pci)
-{
-	struct snd_card *card = pci_get_drvdata(pci);
-	struct snd_ice1712 *ice = card->private_data;
-
-	if (ice->card_info && ice->card_info->chip_exit)
-		ice->card_info->chip_exit(ice);
-	snd_card_free(card);
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int snd_ice1712_suspend(struct device *dev)
 {
@@ -2810,7 +2738,6 @@ static struct pci_driver ice1712_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_ice1712_ids,
 	.probe = snd_ice1712_probe,
-	.remove = snd_ice1712_remove,
 	.driver = {
 		.pm = SND_VT1712_PM_OPS,
 	},
-- 
2.26.2

