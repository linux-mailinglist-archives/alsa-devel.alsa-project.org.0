Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DCC3C9A13
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:03:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFCBB167A;
	Thu, 15 Jul 2021 10:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFCBB167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336193;
	bh=u0r0MMcEXuzys7gB+r1poMB/JHK06NbQ41Atw2AjXvI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4H5Zdx2lrGn30eQfLgvqeb860h7OIJjTYhFJ5lQsKj+56aJsR/ix57qxpiB29fL2
	 /gVC/0UT86HHB+6rK9CM6QOtdOLuGDJY2PfRHYYAh4exFkyNPNJLkL5aONejqwS7Nr
	 Ucp0j+fhpOuq27zrxeu5Lr6zyxSqJwN/RiOihMMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C172F8053C;
	Thu, 15 Jul 2021 10:00:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8FA6F8051D; Thu, 15 Jul 2021 10:00:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5B2FF80240
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B2FF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="o72VEIM0"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="6V6no7oH"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 05C811FDF1
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626335995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8pc2c6upT4f/IawpfVgQ9TB9w3B6L3EC07I8Ldp8lY=;
 b=o72VEIM0yT8mcc7Od/N6QahGy4KzckKv39HhCxTINCCrTilM5Oyn4qbZQCs3sdWFgwuJOR
 UYleXUN5RkE0E/OMx6WRSGCdqbWVb6FwqP1vI+fTmv8XY8tvsE2/2AEGd+awY63FrtSarn
 q2AsebjXGbi+JjYwcQgdvNoTFtO1mRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626335995;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8pc2c6upT4f/IawpfVgQ9TB9w3B6L3EC07I8Ldp8lY=;
 b=6V6no7oHOEOKuBpR64U1/fE6L/iuPI3f7VU+G1DC86TCfiNujHkk9DiqG8IKMjDRQsh/3X
 QOHvFl9XlKCP5DAA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E825AA3B8D;
 Thu, 15 Jul 2021 07:59:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 08/79] ALSA: ad1889: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:58:30 +0200
Message-Id: <20210715075941.23332-9-tiwai@suse.de>
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

This patch converts the resource management in PCI ad1889 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.
Also, the unnecessary ac97 free callbacks are removed, too.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ad1889.c | 144 ++++++++-------------------------------------
 1 file changed, 25 insertions(+), 119 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index 5c78951dd596..bba4dae8dcc7 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -740,20 +740,6 @@ snd_ad1889_ac97_xinit(struct snd_ad1889 *chip)
 
 }
 
-static void
-snd_ad1889_ac97_bus_free(struct snd_ac97_bus *bus)
-{
-	struct snd_ad1889 *chip = bus->private_data;
-	chip->ac97_bus = NULL;
-}
-
-static void
-snd_ad1889_ac97_free(struct snd_ac97 *ac97)
-{
-	struct snd_ad1889 *chip = ac97->private_data;
-	chip->ac97 = NULL;
-}
-
 static int
 snd_ad1889_ac97_init(struct snd_ad1889 *chip, const char *quirk_override)
 {
@@ -771,11 +757,8 @@ snd_ad1889_ac97_init(struct snd_ad1889 *chip, const char *quirk_override)
 	if (err < 0)
 		return err;
 	
-	chip->ac97_bus->private_free = snd_ad1889_ac97_bus_free;
-
 	memset(&ac97, 0, sizeof(ac97));
 	ac97.private_data = chip;
-	ac97.private_free = snd_ad1889_ac97_free;
 	ac97.pci = chip->pci;
 
 	err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97);
@@ -787,11 +770,10 @@ snd_ad1889_ac97_init(struct snd_ad1889 *chip, const char *quirk_override)
 	return 0;
 }
 
-static int
-snd_ad1889_free(struct snd_ad1889 *chip)
+static void
+snd_ad1889_free(struct snd_card *card)
 {
-	if (chip->irq < 0)
-		goto skip_hw;
+	struct snd_ad1889 *chip = card->private_data;
 
 	spin_lock_irq(&chip->lock);
 
@@ -805,125 +787,60 @@ snd_ad1889_free(struct snd_ad1889 *chip)
 	ad1889_readl(chip, AD_DMA_DISR);	/* flush, dammit! */
 
 	spin_unlock_irq(&chip->lock);
-
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
-
-skip_hw:
-	iounmap(chip->iobase);
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
-}
-
-static int
-snd_ad1889_dev_free(struct snd_device *device) 
-{
-	struct snd_ad1889 *chip = device->device_data;
-	return snd_ad1889_free(chip);
-}
-
-static int
-snd_ad1889_init(struct snd_ad1889 *chip) 
-{
-	ad1889_writew(chip, AD_DS_CCS, AD_DS_CCS_CLKEN); /* turn on clock */
-	ad1889_readw(chip, AD_DS_CCS);	/* flush posted write */
-
-	usleep_range(10000, 11000);
-
-	/* enable Master and Target abort interrupts */
-	ad1889_writel(chip, AD_DMA_DISR, AD_DMA_DISR_PMAE | AD_DMA_DISR_PTAE);
-
-	return 0;
 }
 
 static int
-snd_ad1889_create(struct snd_card *card,
-		  struct pci_dev *pci,
-		  struct snd_ad1889 **rchip)
+snd_ad1889_create(struct snd_card *card, struct pci_dev *pci)
 {
+	struct snd_ad1889 *chip = card->private_data;
 	int err;
 
-	struct snd_ad1889 *chip;
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_ad1889_dev_free,
-	};
-
-	*rchip = NULL;
-
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
 	/* check PCI availability (32bit DMA) */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32))) {
 		dev_err(card->dev, "error setting 32-bit DMA mask.\n");
-		pci_disable_device(pci);
 		return -ENXIO;
 	}
 
-	/* allocate chip specific data with zero-filled memory */
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (!chip) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
-
 	chip->card = card;
-	card->private_data = chip;
 	chip->pci = pci;
 	chip->irq = -1;
 
 	/* (1) PCI resource allocation */
-	err = pci_request_regions(pci, card->driver);
+	err = pcim_iomap_regions(pci, 1 << 0, card->driver);
 	if (err < 0)
-		goto free_and_ret;
+		return err;
 
 	chip->bar = pci_resource_start(pci, 0);
-	chip->iobase = pci_ioremap_bar(pci, 0);
-	if (chip->iobase == NULL) {
-		dev_err(card->dev, "unable to reserve region.\n");
-		err = -EBUSY;
-		goto free_and_ret;
-	}
+	chip->iobase = pcim_iomap_table(pci)[0];
 	
 	pci_set_master(pci);
 
 	spin_lock_init(&chip->lock);	/* only now can we call ad1889_free */
 
-	if (request_irq(pci->irq, snd_ad1889_interrupt,
-			IRQF_SHARED, KBUILD_MODNAME, chip)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_ad1889_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "cannot obtain IRQ %d\n", pci->irq);
-		snd_ad1889_free(chip);
 		return -EBUSY;
 	}
 
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_ad1889_free;
 
 	/* (2) initialization of the chip hardware */
-	err = snd_ad1889_init(chip);
-	if (err < 0) {
-		snd_ad1889_free(chip);
-		return err;
-	}
+	ad1889_writew(chip, AD_DS_CCS, AD_DS_CCS_CLKEN); /* turn on clock */
+	ad1889_readw(chip, AD_DS_CCS);	/* flush posted write */
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_ad1889_free(chip);
-		return err;
-	}
+	usleep_range(10000, 11000);
 
-	*rchip = chip;
+	/* enable Master and Target abort interrupts */
+	ad1889_writel(chip, AD_DMA_DISR, AD_DMA_DISR_PMAE | AD_DMA_DISR_PTAE);
 
 	return 0;
-
-free_and_ret:
-	kfree(chip);
-	pci_disable_device(pci);
-
-	return err;
 }
 
 static int
@@ -944,19 +861,19 @@ snd_ad1889_probe(struct pci_dev *pci,
 	}
 
 	/* (2) */
-	err = snd_card_new(&pci->dev, index[devno], id[devno], THIS_MODULE,
-			   0, &card);
-	/* XXX REVISIT: we can probably allocate chip in this call */
+	err = snd_devm_card_new(&pci->dev, index[devno], id[devno], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
 	strcpy(card->driver, "AD1889");
 	strcpy(card->shortname, "Analog Devices AD1889");
 
 	/* (3) */
-	err = snd_ad1889_create(card, pci, &chip);
+	err = snd_ad1889_create(card, pci);
 	if (err < 0)
-		goto free_and_ret;
+		return err;
 
 	/* (4) */
 	sprintf(card->longname, "%s at 0x%lx irq %i",
@@ -966,11 +883,11 @@ snd_ad1889_probe(struct pci_dev *pci,
 	/* register AC97 mixer */
 	err = snd_ad1889_ac97_init(chip, ac97_quirk[devno]);
 	if (err < 0)
-		goto free_and_ret;
+		return err;
 	
 	err = snd_ad1889_pcm_init(chip, 0);
 	if (err < 0)
-		goto free_and_ret;
+		return err;
 
 	/* register proc interface */
 	snd_ad1889_proc_init(chip);
@@ -978,23 +895,13 @@ snd_ad1889_probe(struct pci_dev *pci,
 	/* (6) */
 	err = snd_card_register(card);
 	if (err < 0)
-		goto free_and_ret;
+		return err;
 
 	/* (7) */
 	pci_set_drvdata(pci, card);
 
 	devno++;
 	return 0;
-
-free_and_ret:
-	snd_card_free(card);
-	return err;
-}
-
-static void
-snd_ad1889_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 static const struct pci_device_id snd_ad1889_ids[] = {
@@ -1007,7 +914,6 @@ static struct pci_driver ad1889_pci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_ad1889_ids,
 	.probe = snd_ad1889_probe,
-	.remove = snd_ad1889_remove,
 };
 
 module_pci_driver(ad1889_pci_driver);
-- 
2.26.2

