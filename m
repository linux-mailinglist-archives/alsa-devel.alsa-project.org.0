Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3DE3C9A1F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:06:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAD5D16B4;
	Thu, 15 Jul 2021 10:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAD5D16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336411;
	bh=aaffqherV7sHeEFWzX3gpB5DYIo95fZe2Htu2XGac8Q=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cv2xPqZCbtagnnGVudPZbQwAz81YkL2+7gFDxDrfp6oVadviNUTB8oEWiZzSun8Pq
	 T4arxPA2tycz+Uu365hegbarEMoXrsRPYqBsbHAaAXQbiq1j8C3YU6IsTRfTIvU/VO
	 hZAWZzY9SKhUTPBJWNmgE1v6+yg50VM40csPlFA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9209F805D6;
	Thu, 15 Jul 2021 10:00:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB520F805B1; Thu, 15 Jul 2021 10:00:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2050BF804E5
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2050BF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="PIttmDGm"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="6mOs2Nlw"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id F3DFD1FD3E
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SfYa+T0T1CIGZh+UnessXxkDwVCKEl2xb+ela0F3Fq4=;
 b=PIttmDGmnPyQ4NUmoJ4Rvkb815MQuLoM6I/HyxA7NVlLMrU3HB4w/sK7S0bLQ1PH5sSpaf
 KWh4jH0o0TMntShwG/bbc6YtemnAjjydDHuNu3837WZSTdk377cDVXM7hqgyfKY4MN7dlr
 ctBR+Aax/KNF85HqDHhGgho2Kt3sJP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336000;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SfYa+T0T1CIGZh+UnessXxkDwVCKEl2xb+ela0F3Fq4=;
 b=6mOs2NlwViVMIePxrOzMID+4PhIAUr18QJE+Tuf3gVDXw8+N+7mmyYCifonQdOXIXg5Oz+
 /FeT3YrXzaqSkwBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E2018A3B99;
 Thu, 15 Jul 2021 07:59:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 17/79] ALSA: es1938: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:58:39 +0200
Message-Id: <20210715075941.23332-18-tiwai@suse.de>
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

This patch converts the resource management in PCI es1938 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1938.c | 97 ++++++++++++----------------------------------
 1 file changed, 24 insertions(+), 73 deletions(-)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index 33b1eb347a27..00b976f42a3d 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -1521,8 +1521,10 @@ static inline int snd_es1938_create_gameport(struct es1938 *chip) { return -ENOS
 static inline void snd_es1938_free_gameport(struct es1938 *chip) { }
 #endif /* SUPPORT_JOYSTICK */
 
-static int snd_es1938_free(struct es1938 *chip)
+static void snd_es1938_free(struct snd_card *card)
 {
+	struct es1938 *chip = card->private_data;
+
 	/* disable irqs */
 	outb(0x00, SLIO_REG(chip, IRQCONTROL));
 	if (chip->rmidi)
@@ -1532,71 +1534,47 @@ static int snd_es1938_free(struct es1938 *chip)
 
 	if (chip->irq >= 0)
 		free_irq(chip->irq, chip);
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
-}
-
-static int snd_es1938_dev_free(struct snd_device *device)
-{
-	struct es1938 *chip = device->device_data;
-	return snd_es1938_free(chip);
 }
 
 static int snd_es1938_create(struct snd_card *card,
-			     struct pci_dev *pci,
-			     struct es1938 **rchip)
+			     struct pci_dev *pci)
 {
-	struct es1938 *chip;
+	struct es1938 *chip = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_es1938_dev_free,
-	};
-
-	*rchip = NULL;
 
 	/* enable PCI device */
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
         /* check, if we can restrict PCI DMA transfers to 24 bits */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(24))) {
 		dev_err(card->dev,
 			"architecture does not support 24bit PCI busmaster DMA\n");
-		pci_disable_device(pci);
                 return -ENXIO;
         }
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
 	spin_lock_init(&chip->reg_lock);
 	spin_lock_init(&chip->mixer_lock);
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
 	err = pci_request_regions(pci, "ESS Solo-1");
-	if (err < 0) {
-		kfree(chip);
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 	chip->io_port = pci_resource_start(pci, 0);
 	chip->sb_port = pci_resource_start(pci, 1);
 	chip->vc_port = pci_resource_start(pci, 2);
 	chip->mpu_port = pci_resource_start(pci, 3);
 	chip->game_port = pci_resource_start(pci, 4);
+	/* still use non-managed irq handler as it's re-acquired at PM resume */
 	if (request_irq(pci->irq, snd_es1938_interrupt, IRQF_SHARED,
 			KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_es1938_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_es1938_free;
 	dev_dbg(card->dev,
 		"create: io: 0x%lx, sb: 0x%lx, vc: 0x%lx, mpu: 0x%lx, game: 0x%lx\n",
 		   chip->io_port, chip->sb_port, chip->vc_port, chip->mpu_port, chip->game_port);
@@ -1604,14 +1582,6 @@ static int snd_es1938_create(struct snd_card *card,
 	chip->ddma_port = chip->vc_port + 0x00;		/* fix from Thomas Sailer */
 
 	snd_es1938_chip_init(chip);
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_es1938_free(chip);
-		return err;
-	}
-
-	*rchip = chip;
 	return 0;
 }
 
@@ -1762,23 +1732,20 @@ static int snd_es1938_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
-	for (idx = 0; idx < 5; idx++) {
+	chip = card->private_data;
+
+	for (idx = 0; idx < 5; idx++)
 		if (pci_resource_start(pci, idx) == 0 ||
-		    !(pci_resource_flags(pci, idx) & IORESOURCE_IO)) {
-		    	snd_card_free(card);
-		    	return -ENODEV;
-		}
-	}
-	err = snd_es1938_create(card, pci, &chip);
-	if (err < 0) {
-		snd_card_free(card);
+		    !(pci_resource_flags(pci, idx) & IORESOURCE_IO))
+			return -ENODEV;
+
+	err = snd_es1938_create(card, pci);
+	if (err < 0)
 		return err;
-	}
-	card->private_data = chip;
 
 	strcpy(card->driver, "ES1938");
 	strcpy(card->shortname, "ESS ES1938 (Solo-1)");
@@ -1788,15 +1755,11 @@ static int snd_es1938_probe(struct pci_dev *pci,
 		chip->irq);
 
 	err = snd_es1938_new_pcm(chip, 0);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_es1938_mixer(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	if (snd_opl3_create(card,
 			    SLSB_REG(chip, FMLOWADDR),
 			    SLSB_REG(chip, FMHIGHADDR),
@@ -1805,15 +1768,11 @@ static int snd_es1938_probe(struct pci_dev *pci,
 			   SLSB_REG(chip, FMLOWADDR));
 	} else {
 		err = snd_opl3_timer_new(opl3, 0, 1);
-		if (err < 0) {
-	                snd_card_free(card);
+		if (err < 0)
 	                return err;
-		}
 		err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
-		if (err < 0) {
-	                snd_card_free(card);
+		if (err < 0)
 	                return err;
-		}
 	}
 	if (snd_mpu401_uart_new(card, 0, MPU401_HW_MPU401,
 				chip->mpu_port,
@@ -1829,26 +1788,18 @@ static int snd_es1938_probe(struct pci_dev *pci,
 	snd_es1938_create_gameport(chip);
 
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
 
-static void snd_es1938_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 static struct pci_driver es1938_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_es1938_ids,
 	.probe = snd_es1938_probe,
-	.remove = snd_es1938_remove,
 	.driver = {
 		.pm = ES1938_PM_OPS,
 	},
-- 
2.26.2

