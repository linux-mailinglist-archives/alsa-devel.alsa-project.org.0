Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BCB3C9A42
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:11:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4A711714;
	Thu, 15 Jul 2021 10:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4A711714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336716;
	bh=fu11GM+ZB0D95X8OuNVx5SB/HWFmYfshIvHjM3NERmE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DPgH0pJ3QiDYCAs7nrhMPGCo6qyHqvQfJJvCJr7bfg5BVFkN90NT76K2ixVAJuicw
	 7VOvgA7f29PE9IVMuzpOXZb07NDccZWkqZ9H5tb16wkSk/jWQSKRzELD5/CSn3BBCQ
	 sOPWzve+PoGDhsEUQYWKez0QYeNiOlpGZvJ1arOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB232F8061D;
	Thu, 15 Jul 2021 10:00:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B56E3F805F8; Thu, 15 Jul 2021 10:00:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99A38F804FC
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99A38F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="G2PU+ySN"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="+7y2ruHF"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 6DA6022854
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yHOkfojWelSINRHgCcja7PJLZL2yqm6jelxRU/Mdrd0=;
 b=G2PU+ySNoar+Ykonx2Rztf9nPlgGxXeQlmQAjJy+oSKSsevO9DpLsCbWLLCRRIURb0ZCLl
 qchaJ8eAyp/UZqussb84C8J/Hzt/MKq4IkigKu8lVkqbWjrxFUh9yOQljZmL1B8m/JdYRS
 TdZxh5diOrvfdLxKmSwduySofRZ8IMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336004;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yHOkfojWelSINRHgCcja7PJLZL2yqm6jelxRU/Mdrd0=;
 b=+7y2ruHFF0cT21+gUxdU7TQfLi0zGdUOLDsceMjv88savUE3ZAgbUyaru9MpSpvejFGWwT
 W960ICYXTPcs3QDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 5CC4EA3B8D;
 Thu, 15 Jul 2021 08:00:04 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 28/79] ALSA: aw2: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:58:50 +0200
Message-Id: <20210715075941.23332-29-tiwai@suse.de>
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

This patch converts the resource management in PCI aw2 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/aw2/aw2-alsa.c | 102 +++++++--------------------------------
 1 file changed, 18 insertions(+), 84 deletions(-)

diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
index 43396849a01c..d56f126d6fdd 100644
--- a/sound/pci/aw2/aw2-alsa.c
+++ b/sound/pci/aw2/aw2-alsa.c
@@ -99,12 +99,9 @@ struct aw2 {
 /*********************************
  * FUNCTION DECLARATIONS
  ********************************/
-static int snd_aw2_dev_free(struct snd_device *device);
-static int snd_aw2_create(struct snd_card *card,
-			  struct pci_dev *pci, struct aw2 **rchip);
+static int snd_aw2_create(struct snd_card *card, struct pci_dev *pci);
 static int snd_aw2_probe(struct pci_dev *pci,
 			 const struct pci_device_id *pci_id);
-static void snd_aw2_remove(struct pci_dev *pci);
 static int snd_aw2_pcm_playback_open(struct snd_pcm_substream *substream);
 static int snd_aw2_pcm_playback_close(struct snd_pcm_substream *substream);
 static int snd_aw2_pcm_capture_open(struct snd_pcm_substream *substream);
@@ -157,7 +154,6 @@ static struct pci_driver aw2_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_aw2_ids,
 	.probe = snd_aw2_probe,
-	.remove = snd_aw2_remove,
 };
 
 module_pci_driver(aw2_driver);
@@ -196,41 +192,23 @@ static const struct snd_kcontrol_new aw2_control = {
  ********************************/
 
 /* component-destructor */
-static int snd_aw2_dev_free(struct snd_device *device)
+static void snd_aw2_free(struct snd_card *card)
 {
-	struct aw2 *chip = device->device_data;
+	struct aw2 *chip = card->private_data;
 
 	/* Free hardware */
 	snd_aw2_saa7146_free(&chip->saa7146);
-
-	/* release the irq */
-	if (chip->irq >= 0)
-		free_irq(chip->irq, (void *)chip);
-	/* release the i/o ports & memory */
-	iounmap(chip->iobase_virt);
-	pci_release_regions(chip->pci);
-	/* disable the PCI entry */
-	pci_disable_device(chip->pci);
-	/* release the data */
-	kfree(chip);
-
-	return 0;
 }
 
 /* chip-specific constructor */
 static int snd_aw2_create(struct snd_card *card,
-			  struct pci_dev *pci, struct aw2 **rchip)
+			  struct pci_dev *pci)
 {
-	struct aw2 *chip;
+	struct aw2 *chip = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_aw2_dev_free,
-	};
-
-	*rchip = NULL;
 
 	/* initialize the PCI entry */
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 	pci_set_master(pci);
@@ -238,14 +216,8 @@ static int snd_aw2_create(struct snd_card *card,
 	/* check PCI availability (32bit DMA) */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32))) {
 		dev_err(card->dev, "Impossible to set 32bit mask DMA\n");
-		pci_disable_device(pci);
 		return -ENXIO;
 	}
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
 
 	/* initialize the stuff */
 	chip->card = card;
@@ -253,52 +225,23 @@ static int snd_aw2_create(struct snd_card *card,
 	chip->irq = -1;
 
 	/* (1) PCI resource allocation */
-	err = pci_request_regions(pci, "Audiowerk2");
-	if (err < 0) {
-		pci_disable_device(pci);
-		kfree(chip);
+	err = pcim_iomap_regions(pci, 1 << 0, "Audiowerk2");
+	if (err < 0)
 		return err;
-	}
 	chip->iobase_phys = pci_resource_start(pci, 0);
-	chip->iobase_virt =
-		ioremap(chip->iobase_phys,
-				pci_resource_len(pci, 0));
-
-	if (chip->iobase_virt == NULL) {
-		dev_err(card->dev, "unable to remap memory region");
-		pci_release_regions(pci);
-		pci_disable_device(pci);
-		kfree(chip);
-		return -ENOMEM;
-	}
+	chip->iobase_virt = pcim_iomap_table(pci)[0];
 
 	/* (2) initialization of the chip hardware */
 	snd_aw2_saa7146_setup(&chip->saa7146, chip->iobase_virt);
 
-	if (request_irq(pci->irq, snd_aw2_saa7146_interrupt,
-			IRQF_SHARED, KBUILD_MODNAME, chip)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_aw2_saa7146_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "Cannot grab irq %d\n", pci->irq);
-
-		iounmap(chip->iobase_virt);
-		pci_release_regions(chip->pci);
-		pci_disable_device(chip->pci);
-		kfree(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		free_irq(chip->irq, (void *)chip);
-		iounmap(chip->iobase_virt);
-		pci_release_regions(chip->pci);
-		pci_disable_device(chip->pci);
-		kfree(chip);
-		return err;
-	}
-
-	*rchip = chip;
+	card->private_free = snd_aw2_free;
 
 	dev_info(card->dev,
 		 "Audiowerk 2 sound card (saa7146 chipset) detected and managed\n");
@@ -323,17 +266,16 @@ static int snd_aw2_probe(struct pci_dev *pci,
 	}
 
 	/* (2) Create card instance */
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
 	/* (3) Create main component */
-	err = snd_aw2_create(card, pci, &chip);
-	if (err < 0) {
-		snd_card_free(card);
+	err = snd_aw2_create(card, pci);
+	if (err < 0)
 		return err;
-	}
 
 	/* initialize mutex */
 	mutex_init(&chip->mtx);
@@ -351,10 +293,8 @@ static int snd_aw2_probe(struct pci_dev *pci,
 
 	/* (6) Register card instance */
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	/* (7) Set PCI driver data */
 	pci_set_drvdata(pci, card);
@@ -363,12 +303,6 @@ static int snd_aw2_probe(struct pci_dev *pci,
 	return 0;
 }
 
-/* destructor */
-static void snd_aw2_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 /* open callback */
 static int snd_aw2_pcm_playback_open(struct snd_pcm_substream *substream)
 {
-- 
2.26.2

