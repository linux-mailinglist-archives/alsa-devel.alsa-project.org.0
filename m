Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA11A3C9A21
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:07:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BEA816B6;
	Thu, 15 Jul 2021 10:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BEA816B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336461;
	bh=lGOOa1LeFFqXu5p3eOQzB3Lhx77Ow0bafGxSaLuoAF8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gwmTlM14rmv4tgDV5EACQEdipbs+X6SwOefX0Y5M4wAbW0UCfsFJ8+vt+BOHPx/Yp
	 pPfjAMjkhmI7/c6INZo6unfZtbi7vVdt7+lCouBX4EIXa0o3tZW3X6ZnMUhTD3YHCO
	 1jXfQSEM6WstjU+cWRyTTm0dEA86oaTeq8fq9a5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9AFEF805E5;
	Thu, 15 Jul 2021 10:00:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCBA9F805B5; Thu, 15 Jul 2021 10:00:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A365EF804E2
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A365EF804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="TCsG7TEI"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="uTU3vnvg"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7C3B42284E
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626335998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKX4RzaGLOOByHQccy0gSPoAmPX6pLVoY4RclGH9Ado=;
 b=TCsG7TEIB3qyqqTFDqnFZMXbIBOHjNMPR+BbPmMEbx33G7zNpWoLLvDXvUAYWG8JDBteRK
 HyARw+nQkyF+9XddwDO4rchvK9cSDIVzkEdW7+2244cIOfRnsT5dLGnTWfQJMNGBGSusZ3
 Rexqnk5079qa/FoliFLMLpAGl8E6/oc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626335998;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKX4RzaGLOOByHQccy0gSPoAmPX6pLVoY4RclGH9Ado=;
 b=uTU3vnvgNsIC5+qTHVVH/n72JHY6qobFIwpqzkJ1dOu0UZhXB7m7nnRaBp+6+SyPP/kG+z
 T37ed7OhAD+VZbBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6A431A3B99;
 Thu, 15 Jul 2021 07:59:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 14/79] ALSA: cs4281: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:58:36 +0200
Message-Id: <20210715075941.23332-15-tiwai@suse.de>
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

This patch converts the resource management in PCI cs4281 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs4281.c | 112 ++++++++++-----------------------------------
 1 file changed, 24 insertions(+), 88 deletions(-)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index e122a168c148..f338caf98354 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -1268,8 +1268,10 @@ static inline int snd_cs4281_create_gameport(struct cs4281 *chip) { return -ENOS
 static inline void snd_cs4281_free_gameport(struct cs4281 *chip) { }
 #endif /* IS_REACHABLE(CONFIG_GAMEPORT) */
 
-static int snd_cs4281_free(struct cs4281 *chip)
+static void snd_cs4281_free(struct snd_card *card)
 {
+	struct cs4281 *chip = card->private_data;
+
 	snd_cs4281_free_gameport(chip);
 
 	/* Mask interrupts */
@@ -1278,49 +1280,20 @@ static int snd_cs4281_free(struct cs4281 *chip)
 	snd_cs4281_pokeBA0(chip, BA0_CLKCR1, 0);
 	/* Sound System Power Management - Turn Everything OFF */
 	snd_cs4281_pokeBA0(chip, BA0_SSPM, 0);
-	/* PCI interface - D3 state */
-	pci_set_power_state(chip->pci, PCI_D3hot);
-
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
-	iounmap(chip->ba0);
-	iounmap(chip->ba1);
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-
-	kfree(chip);
-	return 0;
-}
-
-static int snd_cs4281_dev_free(struct snd_device *device)
-{
-	struct cs4281 *chip = device->device_data;
-	return snd_cs4281_free(chip);
 }
 
 static int snd_cs4281_chip_init(struct cs4281 *chip); /* defined below */
 
 static int snd_cs4281_create(struct snd_card *card,
 			     struct pci_dev *pci,
-			     struct cs4281 **rchip,
 			     int dual_codec)
 {
 	struct cs4281 *chip;
-	unsigned int tmp;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_cs4281_dev_free,
-	};
 
-	*rchip = NULL;
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
 	spin_lock_init(&chip->reg_lock);
 	chip->card = card;
 	chip->pci = pci;
@@ -1332,46 +1305,29 @@ static int snd_cs4281_create(struct snd_card *card,
 	}
 	chip->dual_codec = dual_codec;
 
-	err = pci_request_regions(pci, "CS4281");
-	if (err < 0) {
-		kfree(chip);
-		pci_disable_device(pci);
+	err = pcim_iomap_regions(pci, 0x03, "CS4281"); /* 2 BARs */
+	if (err < 0)
 		return err;
-	}
 	chip->ba0_addr = pci_resource_start(pci, 0);
 	chip->ba1_addr = pci_resource_start(pci, 1);
 
-	chip->ba0 = pci_ioremap_bar(pci, 0);
-	chip->ba1 = pci_ioremap_bar(pci, 1);
-	if (!chip->ba0 || !chip->ba1) {
-		snd_cs4281_free(chip);
-		return -ENOMEM;
-	}
+	chip->ba0 = pcim_iomap_table(pci)[0];
+	chip->ba1 = pcim_iomap_table(pci)[1];
 	
-	if (request_irq(pci->irq, snd_cs4281_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, chip)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_cs4281_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_cs4281_free(chip);
 		return -ENOMEM;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_cs4281_free;
 
-	tmp = snd_cs4281_chip_init(chip);
-	if (tmp) {
-		snd_cs4281_free(chip);
-		return tmp;
-	}
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_cs4281_free(chip);
+	err = snd_cs4281_chip_init(chip);
+	if (err)
 		return err;
-	}
 
 	snd_cs4281_proc_init(chip);
-
-	*rchip = chip;
 	return 0;
 }
 
@@ -1887,46 +1843,34 @@ static int snd_cs4281_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
-	err = snd_cs4281_create(card, pci, &chip, dual_codec[dev]);
-	if (err < 0) {
-		snd_card_free(card);
+	err = snd_cs4281_create(card, pci, dual_codec[dev]);
+	if (err < 0)
 		return err;
-	}
-	card->private_data = chip;
 
 	err = snd_cs4281_mixer(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_cs4281_pcm(chip, 0);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_cs4281_midi(chip, 0);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_opl3_new(card, OPL3_HW_OPL3_CS4281, &opl3);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	opl3->private_data = chip;
 	opl3->command = snd_cs4281_opl3_command;
 	snd_opl3_init(opl3);
 	err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	snd_cs4281_create_gameport(chip);
 	strcpy(card->driver, "CS4281");
 	strcpy(card->shortname, "Cirrus Logic CS4281");
@@ -1936,21 +1880,14 @@ static int snd_cs4281_probe(struct pci_dev *pci,
 		chip->irq);
 
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
 
-static void snd_cs4281_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 /*
  * Power Management
  */
@@ -2054,7 +1991,6 @@ static struct pci_driver cs4281_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_cs4281_ids,
 	.probe = snd_cs4281_probe,
-	.remove = snd_cs4281_remove,
 	.driver = {
 		.pm = CS4281_PM_OPS,
 	},
-- 
2.26.2

