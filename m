Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D033C9A44
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:12:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C1891718;
	Thu, 15 Jul 2021 10:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C1891718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336741;
	bh=kkFw+cG+OvXBXoonKwLOysgYvtzZDiCs0oiGkjoNbXQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y26uO2gL1KUZulp/IQIyHjN9G59gNRyp6I0pBYtJwsNds8PfrSqxu6Wb9BtBu959y
	 9o4AdzWEjSCxRM1QPc/u6BYTJln0RSl8G5vqOhRl8ydctkaX5gxeHYrrbTQdRk9EoO
	 DyyuZbPnCqgzI3+eZo5F8qpeRKG4NLLB9tK1eKDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B90A8F80510;
	Thu, 15 Jul 2021 10:00:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D13F2F805FC; Thu, 15 Jul 2021 10:00:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34E46F804FA
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34E46F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="iR94wLR7"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="CSRnuVSf"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0E7EE22852
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3mr/zNFJMS6D20lvwn61DOLlz7DX+1O7pzWKGYewfM8=;
 b=iR94wLR7y9hwV933SYZfonu54XE1skNTUKWydbzuksEqalRElygwJRD3CnWYfoyLy53Rcz
 08EDTw/5tmleqLkKas+fxiRUB1kwq1gRb4YZdvEthRuBdZKVl1CgkgjiKJYJeuWT924i9y
 6zmJj3YzsutcKP574u59KzvwNVVoRLs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336004;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3mr/zNFJMS6D20lvwn61DOLlz7DX+1O7pzWKGYewfM8=;
 b=CSRnuVSfjonociupxAAfqsKU8fvFluSovmokBxReU0aog43DMBRsQeUitgWJyJklBYEHx8
 f8/H9kG8LiDGglCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id F0D93A3B8D;
 Thu, 15 Jul 2021 08:00:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 27/79] ALSA: au88x0: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:58:49 +0200
Message-Id: <20210715075941.23332-28-tiwai@suse.de>
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

This patch converts the resource management in PCI au88x0 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/au88x0/au88x0.c | 134 +++++++++-----------------------------
 1 file changed, 29 insertions(+), 105 deletions(-)

diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
index 1f7fee470266..342ef2a6655e 100644
--- a/sound/pci/au88x0/au88x0.c
+++ b/sound/pci/au88x0/au88x0.c
@@ -123,56 +123,35 @@ static void snd_vortex_workaround(struct pci_dev *vortex, int fix)
 
 // component-destructor
 // (see "Management of Cards and Components")
-static int snd_vortex_dev_free(struct snd_device *device)
+static void snd_vortex_free(struct snd_card *card)
 {
-	vortex_t *vortex = device->device_data;
+	vortex_t *vortex = card->private_data;
 
 	vortex_gameport_unregister(vortex);
 	vortex_core_shutdown(vortex);
-	// Take down PCI interface.
-	free_irq(vortex->irq, vortex);
-	iounmap(vortex->mmio);
-	pci_release_regions(vortex->pci_dev);
-	pci_disable_device(vortex->pci_dev);
-	kfree(vortex);
-
-	return 0;
 }
 
 // chip-specific constructor
 // (see "Management of Cards and Components")
 static int
-snd_vortex_create(struct snd_card *card, struct pci_dev *pci, vortex_t ** rchip)
+snd_vortex_create(struct snd_card *card, struct pci_dev *pci)
 {
-	vortex_t *chip;
+	vortex_t *chip = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_vortex_dev_free,
-	};
-
-	*rchip = NULL;
 
 	// check PCI availability (DMA).
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32))) {
 		dev_err(card->dev, "error to set DMA mask\n");
-		pci_disable_device(pci);
 		return -ENXIO;
 	}
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
-
 	chip->card = card;
 
 	// initialize the stuff
 	chip->pci_dev = pci;
-	chip->io = pci_resource_start(pci, 0);
 	chip->vendor = pci->vendor;
 	chip->device = pci->device;
 	chip->card = card;
@@ -181,16 +160,12 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci, vortex_t ** rchip)
 	// (1) PCI resource allocation
 	// Get MMIO area
 	//
-	err = pci_request_regions(pci, CARD_NAME_SHORT);
+	err = pcim_iomap_regions(pci, 1 << 0, CARD_NAME_SHORT);
 	if (err)
-		goto regions_out;
+		return err;
 
-	chip->mmio = pci_ioremap_bar(pci, 0);
-	if (!chip->mmio) {
-		dev_err(card->dev, "MMIO area remap failed.\n");
-		err = -ENOMEM;
-		goto ioremap_out;
-	}
+	chip->io = pci_resource_start(pci, 0);
+	chip->mmio = pcim_iomap_table(pci)[0];
 
 	/* Init audio core.
 	 * This must be done before we do request_irq otherwise we can get spurious
@@ -198,44 +173,22 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci, vortex_t ** rchip)
 	err = vortex_core_init(chip);
 	if (err) {
 		dev_err(card->dev, "hw core init failed\n");
-		goto core_out;
+		return err;
 	}
 
-	err = request_irq(pci->irq, vortex_interrupt,
-			  IRQF_SHARED, KBUILD_MODNAME, chip);
+	err = devm_request_irq(&pci->dev, pci->irq, vortex_interrupt,
+			       IRQF_SHARED, KBUILD_MODNAME, chip);
 	if (err) {
 		dev_err(card->dev, "cannot grab irq\n");
-		goto irq_out;
+		return err;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_vortex_free;
 
 	pci_set_master(pci);
 	// End of PCI setup.
-
-	// Register alsa root device.
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0)
-		goto alloc_out;
-
-	*rchip = chip;
-
 	return 0;
-
-      alloc_out:
-	free_irq(chip->irq, chip);
-      irq_out:
-	vortex_core_shutdown(chip);
-      core_out:
-	iounmap(chip->mmio);
-      ioremap_out:
-	pci_release_regions(chip->pci_dev);
-      regions_out:
-	pci_disable_device(chip->pci_dev);
-	//FIXME: this not the right place to unregister the gameport
-	vortex_gameport_unregister(chip);
-	kfree(chip);
-	return err;
 }
 
 // constructor -- see "Constructor" sub-section
@@ -255,17 +208,16 @@ snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		return -ENOENT;
 	}
 	// (2)
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
 	// (3)
-	err = snd_vortex_create(card, pci, &chip);
-	if (err < 0) {
-		snd_card_free(card);
+	err = snd_vortex_create(card, pci);
+	if (err < 0)
 		return err;
-	}
 	snd_vortex_workaround(pci, pcifix[dev]);
 
 	// Card details needed in snd_vortex_midi
@@ -276,50 +228,37 @@ snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	// (4) Alloc components.
 	err = snd_vortex_mixer(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	// ADB pcm.
 	err = snd_vortex_new_pcm(chip, VORTEX_PCM_ADB, NR_PCM);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 #ifndef CHIP_AU8820
 	// ADB SPDIF
 	err = snd_vortex_new_pcm(chip, VORTEX_PCM_SPDIF, 1);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	// A3D
 	err = snd_vortex_new_pcm(chip, VORTEX_PCM_A3D, NR_A3D);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 #endif
 	/*
 	   // ADB I2S
 	   if ((err = snd_vortex_new_pcm(chip, VORTEX_PCM_I2S, 1)) < 0) {
-	   snd_card_free(card);
 	   return err;
 	   }
 	 */
 #ifndef CHIP_AU8810
 	// WT pcm.
 	err = snd_vortex_new_pcm(chip, VORTEX_PCM_WT, NR_WT);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 #endif
 	err = snd_vortex_midi(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	vortex_gameport_register(chip);
 
@@ -342,15 +281,11 @@ snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	// (5)
 	err = pci_read_config_word(pci, PCI_DEVICE_ID, &chip->device);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}	
 	err = pci_read_config_word(pci, PCI_VENDOR_ID, &chip->vendor);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	chip->rev = pci->revision;
 #ifdef CHIP_AU8830
 	if ((chip->rev) != 0xfe && (chip->rev) != 0xfa) {
@@ -359,18 +294,14 @@ snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		       chip->rev);
 		dev_alert(card->dev,
 			  "Please email the results of 'lspci -vv' to openvortex-dev@nongnu.org.\n");
-		snd_card_free(card);
-		err = -ENODEV;
-		return err;
+		return -ENODEV;
 	}
 #endif
 
 	// (6)
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	// (7)
 	pci_set_drvdata(pci, card);
 	dev++;
@@ -379,18 +310,11 @@ snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	return 0;
 }
 
-// destructor -- see "Destructor" sub-section
-static void snd_vortex_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 // pci_driver definition
 static struct pci_driver vortex_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_vortex_ids,
 	.probe = snd_vortex_probe,
-	.remove = snd_vortex_remove,
 };
 
 module_pci_driver(vortex_driver);
-- 
2.26.2

