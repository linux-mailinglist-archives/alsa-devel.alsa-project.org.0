Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F93C7255
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:36:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C57971725;
	Tue, 13 Jul 2021 16:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C57971725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626186980;
	bh=DQC3G2XMkc7AsK5SEuBeyGUXU47UoamlJACL509eMwU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r9dfcM2xxMqLcqOQbf7sXqtQyWYvVyB8zkssMigEqg6nZLYLUptdhng187+HZcxaV
	 w0jTNEY++HuBA19sd2vRiy62VSGPIKSPKvGi4e8ZpxRdrRJgmhJOUXrEiUtuzi8LM4
	 ujo59kuhDUmMHPfClOe9QxStWwo5OaJPyc0TXB9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DD5DF80525;
	Tue, 13 Jul 2021 16:29:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B68EF80431; Tue, 13 Jul 2021 16:29:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DC84F80508
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DC84F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="p8fJDHWO"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="xDvE8s9Q"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4C93E22837
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNUmxcAtS4wVem+SPg7e0Sgp5Y/q4b/M/oRCZ/XAJ+c=;
 b=p8fJDHWOE4n1EgJ4ZrrK1x/EG6oH+CQWxLmbdYtHLn5KXUWklkf2tB9/pnpW/FKue/evRu
 dHtsZc0NMJdBO730tg0jIkEdu6GlKXOFSt6QEiyH5ZbBzzWhuRkIs/ZVLTgbb68cha8TmO
 oIyDTkTj4McIEGxipQVGraA2QvyyXYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186561;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNUmxcAtS4wVem+SPg7e0Sgp5Y/q4b/M/oRCZ/XAJ+c=;
 b=xDvE8s9QzcUxPzuhJfLemz+O7OfQTifM7d9e7m/9GoeNvPXpFnmAWTZ7LFuYbUdsZqN64q
 DUg/ccwiSVnQl/Ag==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 45E92A3B83;
 Tue, 13 Jul 2021 14:29:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/51] ALSA: cs5530: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:28:20 +0200
Message-Id: <20210713142857.19654-15-tiwai@suse.de>
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

This patch converts the resource management in PCI cs5530 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs5530.c | 86 +++++++---------------------------------------
 1 file changed, 13 insertions(+), 73 deletions(-)

diff --git a/sound/pci/cs5530.c b/sound/pci/cs5530.c
index 20b4faea50a6..93ff029e6583 100644
--- a/sound/pci/cs5530.c
+++ b/sound/pci/cs5530.c
@@ -65,25 +65,6 @@ static const struct pci_device_id snd_cs5530_ids[] = {
 
 MODULE_DEVICE_TABLE(pci, snd_cs5530_ids);
 
-static int snd_cs5530_free(struct snd_cs5530 *chip)
-{
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
-}
-
-static int snd_cs5530_dev_free(struct snd_device *device)
-{
-	struct snd_cs5530 *chip = device->device_data;
-	return snd_cs5530_free(chip);
-}
-
-static void snd_cs5530_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 static u8 snd_cs5530_mixer_read(unsigned long io, u8 reg)
 {
 	outb(reg, io + 4);
@@ -94,50 +75,28 @@ static u8 snd_cs5530_mixer_read(unsigned long io, u8 reg)
 }
 
 static int snd_cs5530_create(struct snd_card *card,
-			     struct pci_dev *pci,
-			     struct snd_cs5530 **rchip)
+			     struct pci_dev *pci)
 {
-	struct snd_cs5530 *chip;
+	struct snd_cs5530 *chip = card->private_data;
 	unsigned long sb_base;
 	u8 irq, dma8, dma16 = 0;
 	u16 map;
 	void __iomem *mem;
 	int err;
 
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_cs5530_dev_free,
-	};
-	*rchip = NULL;
-
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
  	if (err < 0)
 		return err;
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
-
 	chip->card = card;
 	chip->pci = pci;
 
-	err = pci_request_regions(pci, "CS5530");
-	if (err < 0) {
-		kfree(chip); 
-		pci_disable_device(pci);
+	err = pcim_iomap_regions(pci, 1 << 0, "CS5530");
+	if (err < 0)
 		return err;
-	}
 	chip->pci_base = pci_resource_start(pci, 0);
-
-	mem = pci_ioremap_bar(pci, 0);
-	if (mem == NULL) {
-		snd_cs5530_free(chip);
-		return -EBUSY;
-	}
-
+	mem = pcim_iomap_table(pci)[0];
 	map = readw(mem + 0x18);
-	iounmap(mem);
 
 	/* Map bits
 		0:1	* 0x20 + 0x200 = sb base
@@ -154,7 +113,6 @@ static int snd_cs5530_create(struct snd_card *card,
 		dev_info(card->dev, "XpressAudio at 0x%lx\n", sb_base);
 	else {
 		dev_err(card->dev, "Could not find XpressAudio!\n");
-		snd_cs5530_free(chip);
 		return -ENODEV;
 	}
 
@@ -174,7 +132,6 @@ static int snd_cs5530_create(struct snd_card *card,
 		dma16 = 7;
 	else {
 		dev_err(card->dev, "No 16bit DMA enabled\n");
-		snd_cs5530_free(chip);
 		return -ENODEV;
 	}
 
@@ -186,7 +143,6 @@ static int snd_cs5530_create(struct snd_card *card,
 		dma8 = 3;
 	else {
 		dev_err(card->dev, "No 8bit DMA enabled\n");
-		snd_cs5530_free(chip);
 		return -ENODEV;
 	}
 
@@ -200,7 +156,6 @@ static int snd_cs5530_create(struct snd_card *card,
 		irq = 10;
 	else {
 		dev_err(card->dev, "SoundBlaster IRQ not set\n");
-		snd_cs5530_free(chip);
 		return -ENODEV;
 	}
 
@@ -210,31 +165,21 @@ static int snd_cs5530_create(struct snd_card *card,
 						dma16, SB_HW_CS5530, &chip->sb);
 	if (err < 0) {
 		dev_err(card->dev, "Could not create SoundBlaster\n");
-		snd_cs5530_free(chip);
 		return err;
 	}
 
 	err = snd_sb16dsp_pcm(chip->sb, 0);
 	if (err < 0) {
 		dev_err(card->dev, "Could not create PCM\n");
-		snd_cs5530_free(chip);
 		return err;
 	}
 
 	err = snd_sbmixer_new(chip->sb);
 	if (err < 0) {
 		dev_err(card->dev, "Could not create Mixer\n");
-		snd_cs5530_free(chip);
-		return err;
-	}
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_cs5530_free(chip);
 		return err;
 	}
 
-	*rchip = chip;
 	return 0;
 }
 
@@ -243,7 +188,7 @@ static int snd_cs5530_probe(struct pci_dev *pci,
 {
 	static int dev;
 	struct snd_card *card;
-	struct snd_cs5530 *chip = NULL;
+	struct snd_cs5530 *chip;
 	int err;
 
 	if (dev >= SNDRV_CARDS)
@@ -253,27 +198,23 @@ static int snd_cs5530_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
-
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
-	err = snd_cs5530_create(card, pci, &chip);
-	if (err < 0) {
-		snd_card_free(card);
+	err = snd_cs5530_create(card, pci);
+	if (err < 0)
 		return err;
-	}
 
 	strcpy(card->driver, "CS5530");
 	strcpy(card->shortname, "CS5530 Audio");
 	sprintf(card->longname, "%s at 0x%lx", card->shortname, chip->pci_base);
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
@@ -283,7 +224,6 @@ static struct pci_driver cs5530_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_cs5530_ids,
 	.probe = snd_cs5530_probe,
-	.remove = snd_cs5530_remove,
 };
 
 module_pci_driver(cs5530_driver);
-- 
2.26.2

