Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9C23C9A1B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:05:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B580D16AA;
	Thu, 15 Jul 2021 10:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B580D16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336323;
	bh=0CHq83icnk0lyM3pxrlCAd8K+/mSoHI/DB7w6Nb0DpE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DNrfJOgub2IqylE2998c63OskcOChtA5XYemKcndQEoRrbnvcF5uPOppm2slh3DmH
	 NHMucMwssGVM0u5RUNFHsRbo2BdtIHQj80/rYYkDMsPdetMuyr2gnH/QlRfCkr0yEN
	 6lBTsgiZvmYfa/3gxdXaS7ppcBNkiKr2CtNcroRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9932FF805AC;
	Thu, 15 Jul 2021 10:00:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB25FF80551; Thu, 15 Jul 2021 10:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0D3CF804D2
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0D3CF804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="tDUlW/0w"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="cULpvaZZ"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id BD8B01FDE5
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626335996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ur5TcnpNUht5hJjxu5Icx9JkyUj2FHX6R1MyuDkEkcc=;
 b=tDUlW/0wF1M2pdx49B3JtGDH8WpK8DdWVzS0GvFPm/2Bt0ouE4jLEIgb6Sc7rK5klq12Dt
 IL5SSMIcbvP7PazuBajPbOCLKt2CHWivAtDjMMc3Wg3Lsq7/EVbbawtQtNsD9jJiF5x7Da
 lBuD3inKfKKo21C0lin48yiu2dcjQ6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626335996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ur5TcnpNUht5hJjxu5Icx9JkyUj2FHX6R1MyuDkEkcc=;
 b=cULpvaZZtDasgDCBS83zrYjnng0XY0RtcxKlfdYj1MCthDmhAZcB2E74VWeBDyS+jvk8mR
 kTMDAEYyQ2/prKDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id AACFBA3B99;
 Thu, 15 Jul 2021 07:59:56 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 11/79] ALSA: azt3328: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:58:33 +0200
Message-Id: <20210715075941.23332-12-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715075941.23332-1-tiwai@suse.de>
References: <20210715075941.23332-1-tiwai@suse.de>
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

This patch converts the resource management in PCI azt3328 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/azt3328.c | 124 +++++++++++---------------------------------
 1 file changed, 30 insertions(+), 94 deletions(-)

diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 4ee7ab409807..089050470ff2 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -2244,32 +2244,15 @@ snd_azf3328_timer(struct snd_azf3328 *chip, int device)
 
 /******************************************************************/
 
-static int
-snd_azf3328_free(struct snd_azf3328 *chip)
+static void
+snd_azf3328_free(struct snd_card *card)
 {
-	if (chip->irq < 0)
-		goto __end_hw;
+	struct snd_azf3328 *chip = card->private_data;
 
 	snd_azf3328_mixer_reset(chip);
 
 	snd_azf3328_timer_stop(chip->timer);
 	snd_azf3328_gameport_free(chip);
-
-__end_hw:
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-
-	kfree(chip);
-	return 0;
-}
-
-static int
-snd_azf3328_dev_free(struct snd_device *device)
-{
-	struct snd_azf3328 *chip = device->device_data;
-	return snd_azf3328_free(chip);
 }
 
 #if 0
@@ -2350,29 +2333,18 @@ snd_azf3328_debug_show_ports(const struct snd_azf3328 *chip)
 static int
 snd_azf3328_create(struct snd_card *card,
 		   struct pci_dev *pci,
-		   unsigned long device_type,
-		   struct snd_azf3328 **rchip)
+		   unsigned long device_type)
 {
-	struct snd_azf3328 *chip;
+	struct snd_azf3328 *chip = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =     snd_azf3328_dev_free,
-	};
 	u8 dma_init;
 	enum snd_azf3328_codec_type codec_type;
 	struct snd_azf3328_codec_data *codec_setup;
 
-	*rchip = NULL;
-
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL) {
-		err = -ENOMEM;
-		goto out_err;
-	}
 	spin_lock_init(&chip->reg_lock);
 	chip->card = card;
 	chip->pci = pci;
@@ -2383,13 +2355,12 @@ snd_azf3328_create(struct snd_card *card,
 		dev_err(card->dev,
 			"architecture does not support 24bit PCI busmaster DMA\n"
 		);
-		err = -ENXIO;
-		goto out_err;
+		return -ENXIO;
 	}
 
 	err = pci_request_regions(pci, "Aztech AZF3328");
 	if (err < 0)
-		goto out_err;
+		return err;
 
 	chip->ctrl_io  = pci_resource_start(pci, 0);
 	chip->game_io  = pci_resource_start(pci, 1);
@@ -2415,26 +2386,22 @@ snd_azf3328_create(struct snd_card *card,
 	codec_setup->type = AZF_CODEC_I2S_OUT;
 	codec_setup->name = "I2S_OUT";
 
-	if (request_irq(pci->irq, snd_azf3328_interrupt,
-			IRQF_SHARED, KBUILD_MODNAME, chip)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_azf3328_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		err = -EBUSY;
-		goto out_err;
+		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_azf3328_free;
 	pci_set_master(pci);
 
 	snd_azf3328_debug_show_ports(chip);
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0)
-		goto out_err;
-
 	/* create mixer interface & switches */
 	err = snd_azf3328_mixer_new(chip);
 	if (err < 0)
-		goto out_err;
+		return err;
 
 	/* standard codec init stuff */
 		/* default DMA init value */
@@ -2456,18 +2423,7 @@ snd_azf3328_create(struct snd_card *card,
 		spin_unlock_irq(codec->lock);
 	}
 
-	*rchip = chip;
-
-	err = 0;
-	goto out;
-
-out_err:
-	if (chip)
-		snd_azf3328_free(chip);
-	pci_disable_device(pci);
-
-out:
-	return err;
+	return 0;
 }
 
 static int
@@ -2479,29 +2435,25 @@ snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	struct snd_opl3 *opl3;
 	int err;
 
-	if (dev >= SNDRV_CARDS) {
-		err = -ENODEV;
-		goto out;
-	}
+	if (dev >= SNDRV_CARDS)
+		return -ENODEV;
 	if (!enable[dev]) {
 		dev++;
-		err = -ENOENT;
-		goto out;
+		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
-		goto out;
+		return err;
+	chip = card->private_data;
 
 	strcpy(card->driver, "AZF3328");
 	strcpy(card->shortname, "Aztech AZF3328 (PCI168)");
 
-	err = snd_azf3328_create(card, pci, pci_id->driver_data, &chip);
+	err = snd_azf3328_create(card, pci, pci_id->driver_data);
 	if (err < 0)
-		goto out_err;
-
-	card->private_data = chip;
+		return err;
 
 	/* chose to use MPU401_HW_AZT2320 ID instead of MPU401_HW_MPU401,
 	   since our hardware ought to be similar, thus use same ID. */
@@ -2515,16 +2467,16 @@ snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		dev_err(card->dev, "no MPU-401 device at 0x%lx?\n",
 				chip->mpu_io
 		);
-		goto out_err;
+		return err;
 	}
 
 	err = snd_azf3328_timer(chip, 0);
 	if (err < 0)
-		goto out_err;
+		return err;
 
 	err = snd_azf3328_pcm(chip);
 	if (err < 0)
-		goto out_err;
+		return err;
 
 	if (snd_opl3_create(card, chip->opl3_io, chip->opl3_io+2,
 			    OPL3_HW_AUTO, 1, &opl3) < 0) {
@@ -2535,10 +2487,10 @@ snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		/* need to use IDs 1, 2 since ID 0 is snd_azf3328_timer above */
 		err = snd_opl3_timer_new(opl3, 1, 2);
 		if (err < 0)
-			goto out_err;
+			return err;
 		err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
 		if (err < 0)
-			goto out_err;
+			return err;
 		opl3->private_data = chip;
 	}
 
@@ -2547,7 +2499,7 @@ snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto out_err;
+		return err;
 
 #ifdef MODULE
 	dev_info(card->dev,
@@ -2565,22 +2517,7 @@ snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	pci_set_drvdata(pci, card);
 	dev++;
-
-	err = 0;
-	goto out;
-
-out_err:
-	dev_err(card->dev, "something failed, exiting\n");
-	snd_card_free(card);
-
-out:
-	return err;
-}
-
-static void
-snd_azf3328_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
+	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -2709,7 +2646,6 @@ static struct pci_driver azf3328_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_azf3328_ids,
 	.probe = snd_azf3328_probe,
-	.remove = snd_azf3328_remove,
 	.driver = {
 		.pm = SND_AZF3328_PM_OPS,
 	},
-- 
2.26.2

