Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1556E3C9A5B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:17:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 965711742;
	Thu, 15 Jul 2021 10:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 965711742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337023;
	bh=ojY2ns22gNmIbiSZuqC8tDbBP8YD7wZupaSJwoKaVLA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mDKeglltaJMNL+29RKj7ABsplzsmvrKMsQE/iFFrjSWcNPEDkcqdhZUz0BDyp+6Qn
	 jk6BaKFwdRpc7p6xRcTdoVkqqiZh5IR4cuLCRM5dC05J8EK6NR8LsSWZXXvFWi2egs
	 mXi6ZOCqV4ok8q9SUf7kUXts8c3ywv/C+Rr/m8Zc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54553F8068A;
	Thu, 15 Jul 2021 10:01:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9C25F80675; Thu, 15 Jul 2021 10:01:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A069BF8020C
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A069BF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="udHmXt+0"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="07zJWnpl"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7B4B122852
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=McwQc7u8XYrA7q8zKHKjObja8nqqF3KSiuHdWYAKW6A=;
 b=udHmXt+0lOXzuAvMTE5kUgh6trCaCQrsap+tmCggswdQZDB87uNbr8t1nIUukBifavRwtc
 1vpxQRRvuM/wnsJUn+c48RUOdqjE366dxaugKRAOOrHxO4U7Kn5TUGHS92DnqeELgcu82a
 A4x79Dxa9rU85Vf5Le9Q4XdIiNJ5Ir8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336009;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=McwQc7u8XYrA7q8zKHKjObja8nqqF3KSiuHdWYAKW6A=;
 b=07zJWnplT+pjgM8E4qB08Ft1zvjD5ZnBamr5IW1HyXOH9vU8uk8Du73C1Ht+QhFeXad0Bm
 +Ltv8HHAK+PFjFCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6A0D8A3BBA;
 Thu, 15 Jul 2021 08:00:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 41/79] ALSA: lx6464es: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:59:03 +0200
Message-Id: <20210715075941.23332-42-tiwai@suse.de>
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

This patch converts the resource management in PCI lx6464es driver
with devres as a clean up.  Each manual resource management is
converted with the corresponding devres helper, and the card object
release is managed now via card->private_free instead of a lowlevel
snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/lx6464es/lx6464es.c | 112 ++++++++--------------------------
 1 file changed, 24 insertions(+), 88 deletions(-)

diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index 1be97c38bc71..168a1084f730 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -524,29 +524,11 @@ static int lx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	return lx_pcm_trigger_dispatch(chip, stream, cmd);
 }
 
-static int snd_lx6464es_free(struct lx6464es *chip)
+static void snd_lx6464es_free(struct snd_card *card)
 {
-	dev_dbg(chip->card->dev, "->snd_lx6464es_free\n");
+	struct lx6464es *chip = card->private_data;
 
 	lx_irq_disable(chip);
-
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
-
-	iounmap(chip->port_dsp_bar);
-	ioport_unmap(chip->port_plx_remapped);
-
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-
-	kfree(chip);
-
-	return 0;
-}
-
-static int snd_lx6464es_dev_free(struct snd_device *device)
-{
-	return snd_lx6464es_free(device->device_data);
 }
 
 /* reset the dsp during initialization */
@@ -930,22 +912,15 @@ static int lx_proc_create(struct snd_card *card, struct lx6464es *chip)
 
 
 static int snd_lx6464es_create(struct snd_card *card,
-			       struct pci_dev *pci,
-			       struct lx6464es **rchip)
+			       struct pci_dev *pci)
 {
-	struct lx6464es *chip;
+	struct lx6464es *chip = card->private_data;
 	int err;
 
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_lx6464es_dev_free,
-	};
-
 	dev_dbg(card->dev, "->snd_lx6464es_create\n");
 
-	*rchip = NULL;
-
 	/* enable PCI device */
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
@@ -956,16 +931,9 @@ static int snd_lx6464es_create(struct snd_card *card,
 	if (err < 0) {
 		dev_err(card->dev,
 			"architecture does not support 32bit PCI busmaster DMA\n");
-		pci_disable_device(pci);
 		return -ENXIO;
 	}
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL) {
-		err = -ENOMEM;
-		goto alloc_failed;
-	}
-
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
@@ -978,33 +946,30 @@ static int snd_lx6464es_create(struct snd_card *card,
 	/* request resources */
 	err = pci_request_regions(pci, card_name);
 	if (err < 0)
-		goto request_regions_failed;
+		return err;
 
 	/* plx port */
 	chip->port_plx = pci_resource_start(pci, 1);
-	chip->port_plx_remapped = ioport_map(chip->port_plx,
-					     pci_resource_len(pci, 1));
+	chip->port_plx_remapped = devm_ioport_map(&pci->dev, chip->port_plx,
+						  pci_resource_len(pci, 1));
+	if (!chip->port_plx_remapped)
+		return -ENOMEM;
 
 	/* dsp port */
-	chip->port_dsp_bar = pci_ioremap_bar(pci, 2);
-	if (!chip->port_dsp_bar) {
-		dev_err(card->dev, "cannot remap PCI memory region\n");
-		err = -ENOMEM;
-		goto remap_pci_failed;
-	}
+	chip->port_dsp_bar = pcim_iomap(pci, 2, 0);
+	if (!chip->port_dsp_bar)
+		return -ENOMEM;
 
-	err = request_threaded_irq(pci->irq, lx_interrupt, lx_threaded_irq,
-				   IRQF_SHARED, KBUILD_MODNAME, chip);
+	err = devm_request_threaded_irq(&pci->dev, pci->irq, lx_interrupt,
+					lx_threaded_irq, IRQF_SHARED,
+					KBUILD_MODNAME, chip);
 	if (err) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		goto request_irq_failed;
+		return err;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0)
-		goto device_new_failed;
+	card->private_free = snd_lx6464es_free;
 
 	err = lx_init_dsp(chip);
 	if (err < 0) {
@@ -1025,25 +990,7 @@ static int snd_lx6464es_create(struct snd_card *card,
 	if (err < 0)
 		return err;
 
-	*rchip = chip;
 	return 0;
-
-device_new_failed:
-	free_irq(pci->irq, chip);
-
-request_irq_failed:
-	iounmap(chip->port_dsp_bar);
-
-remap_pci_failed:
-	pci_release_regions(pci);
-
-request_regions_failed:
-	kfree(chip);
-
-alloc_failed:
-	pci_disable_device(pci);
-
-	return err;
 }
 
 static int snd_lx6464es_probe(struct pci_dev *pci,
@@ -1063,15 +1010,16 @@ static int snd_lx6464es_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
-	err = snd_lx6464es_create(card, pci, &chip);
+	err = snd_lx6464es_create(card, pci);
 	if (err < 0) {
 		dev_err(card->dev, "error during snd_lx6464es_create\n");
-		goto out_free;
+		return err;
 	}
 
 	strcpy(card->driver, "LX6464ES");
@@ -1088,30 +1036,18 @@ static int snd_lx6464es_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto out_free;
+		return err;
 
 	dev_dbg(chip->card->dev, "initialization successful\n");
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
-
-out_free:
-	snd_card_free(card);
-	return err;
-
 }
 
-static void snd_lx6464es_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
-
 static struct pci_driver lx6464es_driver = {
 	.name =     KBUILD_MODNAME,
 	.id_table = snd_lx6464es_ids,
 	.probe =    snd_lx6464es_probe,
-	.remove = snd_lx6464es_remove,
 };
 
 module_pci_driver(lx6464es_driver);
-- 
2.26.2

