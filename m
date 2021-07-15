Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0ED3C9A9A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:27:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 684CC177E;
	Thu, 15 Jul 2021 10:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 684CC177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337635;
	bh=rdVR331Gt5tyNKez5oXWAQj2/FSIAc2P6hkx79ZIIpI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Igw8Ji/mouIhgowjl7SuQTm2Lodf8C0y5d6Xj3nDVq66qzVCH73Gol0yG5vFgEEjJ
	 gX7W+FioR47rwxt/L3uX0r1aHAs5HC7wCJxH6qmY64GMW+HnAHzhIR8RsKKSFBNMjB
	 1adHcfS7yxq1nJIhYfG+mD/+klmy5KuEPIJKsTtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7453F80511;
	Thu, 15 Jul 2021 10:01:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3263F80799; Thu, 15 Jul 2021 10:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC23FF805A0
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC23FF805A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="F9QTc9Wh"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="YSeLGG0W"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 78C641FDEA
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6rSPihpY2BxOD0PHMZuKER3z0oYfYQkjMpKV6Jc8K7c=;
 b=F9QTc9WhB2zhM2La05aBbf4Gonz5F1XcunLHKyRkICZPEFiFP8qjb7qsglhAavDdUr2jht
 dJoobTJMMYk0flNZBX7B33643JK6LKYNGPgzbha5LTPmLnOQxFgMlL9OEjARWp5SPS9MUn
 7hfA27Em7QUzorhJ01h5GFJW6ZubtpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6rSPihpY2BxOD0PHMZuKER3z0oYfYQkjMpKV6Jc8K7c=;
 b=YSeLGG0WDtCJVbr4L005DaQ4f5OOZGXXgncwyupXe6dOhuyhTw829BE7p2JTxJpfRIj2j0
 7mW1azF+7ZpA9aAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 64DA4A3B8F;
 Thu, 15 Jul 2021 08:00:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 67/79] ALSA: opti9xx: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:59:29 +0200
Message-Id: <20210715075941.23332-68-tiwai@suse.de>
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

This patch converts the resource management in ISA als100 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/opti9xx/miro.c           | 76 ++++++++--------------------
 sound/isa/opti9xx/opti92x-ad1848.c | 80 +++++++++---------------------
 2 files changed, 44 insertions(+), 112 deletions(-)

diff --git a/sound/isa/opti9xx/miro.c b/sound/isa/opti9xx/miro.c
index e1fb7567fdcc..59242baed576 100644
--- a/sound/isa/opti9xx/miro.c
+++ b/sound/isa/opti9xx/miro.c
@@ -1159,12 +1159,13 @@ static int snd_miro_configure(struct snd_miro *chip)
 	return 0;
 }
 
-static int snd_miro_opti_check(struct snd_miro *chip)
+static int snd_miro_opti_check(struct snd_card *card, struct snd_miro *chip)
 {
 	unsigned char value;
 
-	chip->res_mc_base = request_region(chip->mc_base, chip->mc_base_size,
-					   "OPTi9xx MC");
+	chip->res_mc_base =
+		devm_request_region(card->dev, chip->mc_base,
+				    chip->mc_base_size, "OPTi9xx MC");
 	if (chip->res_mc_base == NULL)
 		return -ENOMEM;
 
@@ -1173,7 +1174,7 @@ static int snd_miro_opti_check(struct snd_miro *chip)
 		if (value == snd_miro_read(chip, OPTi9XX_MC_REG(1)))
 			return 0;
 
-	release_and_free_resource(chip->res_mc_base);
+	devm_release_resource(card->dev, chip->res_mc_base);
 	chip->res_mc_base = NULL;
 
 	return -ENODEV;
@@ -1190,7 +1191,7 @@ static int snd_card_miro_detect(struct snd_card *card,
 		if (err < 0)
 			return err;
 
-		err = snd_miro_opti_check(chip);
+		err = snd_miro_opti_check(card, chip);
 		if (err == 0)
 			return 1;
 	}
@@ -1214,7 +1215,8 @@ static int snd_card_miro_aci_detect(struct snd_card *card,
 	regval=inb(miro->mc_base + 4);
 	aci->aci_port = (regval & 0x10) ? 0x344 : 0x354;
 
-	miro->res_aci_port = request_region(aci->aci_port, 3, "miro aci");
+	miro->res_aci_port =
+		devm_request_region(card->dev, aci->aci_port, 3, "miro aci");
 	if (miro->res_aci_port == NULL) {
 		snd_printk(KERN_ERR "aci i/o area 0x%lx-0x%lx already used.\n", 
 			   aci->aci_port, aci->aci_port+2);
@@ -1253,16 +1255,6 @@ static int snd_card_miro_aci_detect(struct snd_card *card,
 	return 0;
 }
 
-static void snd_card_miro_free(struct snd_card *card)
-{
-	struct snd_miro *miro = card->private_data;
-
-	release_and_free_resource(miro->res_aci_port);
-	if (miro->aci)
-		miro->aci->aci_port = 0;
-	release_and_free_resource(miro->res_mc_base);
-}
-
 static int snd_miro_probe(struct snd_card *card)
 {
 	int error;
@@ -1271,9 +1263,10 @@ static int snd_miro_probe(struct snd_card *card)
 	struct snd_rawmidi *rmidi;
 
 	if (!miro->res_mc_base) {
-		miro->res_mc_base = request_region(miro->mc_base,
-						miro->mc_base_size,
-						"miro (OPTi9xx MC)");
+		miro->res_mc_base = devm_request_region(card->dev,
+							miro->mc_base,
+							miro->mc_base_size,
+							"miro (OPTi9xx MC)");
 		if (miro->res_mc_base == NULL) {
 			snd_printk(KERN_ERR "request for OPTI9xx MC failed\n");
 			return -ENOMEM;
@@ -1408,17 +1401,15 @@ static int snd_miro_isa_probe(struct device *devptr, unsigned int n)
 	struct snd_miro *miro;
 	struct snd_card *card;
 
-	error = snd_card_new(devptr, index, id, THIS_MODULE,
-			     sizeof(struct snd_miro), &card);
+	error = snd_devm_card_new(devptr, index, id, THIS_MODULE,
+				  sizeof(struct snd_miro), &card);
 	if (error < 0)
 		return error;
 
-	card->private_free = snd_card_miro_free;
 	miro = card->private_data;
 
 	error = snd_card_miro_detect(card, miro);
 	if (error < 0) {
-		snd_card_free(card);
 		snd_printk(KERN_ERR "unable to detect OPTi9xx chip\n");
 		return -ENODEV;
 	}
@@ -1426,7 +1417,6 @@ static int snd_miro_isa_probe(struct device *devptr, unsigned int n)
 	if (port == SNDRV_AUTO_PORT) {
 		port = snd_legacy_find_free_ioport(possible_ports, 4);
 		if (port < 0) {
-			snd_card_free(card);
 			snd_printk(KERN_ERR "unable to find a free WSS port\n");
 			return -EBUSY;
 		}
@@ -1435,7 +1425,6 @@ static int snd_miro_isa_probe(struct device *devptr, unsigned int n)
 	if (mpu_port == SNDRV_AUTO_PORT) {
 		mpu_port = snd_legacy_find_free_ioport(possible_mpu_ports, 2);
 		if (mpu_port < 0) {
-			snd_card_free(card);
 			snd_printk(KERN_ERR
 				   "unable to find a free MPU401 port\n");
 			return -EBUSY;
@@ -1445,7 +1434,6 @@ static int snd_miro_isa_probe(struct device *devptr, unsigned int n)
 	if (irq == SNDRV_AUTO_IRQ) {
 		irq = snd_legacy_find_free_irq(possible_irqs);
 		if (irq < 0) {
-			snd_card_free(card);
 			snd_printk(KERN_ERR "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
@@ -1453,7 +1441,6 @@ static int snd_miro_isa_probe(struct device *devptr, unsigned int n)
 	if (mpu_irq == SNDRV_AUTO_IRQ) {
 		mpu_irq = snd_legacy_find_free_irq(possible_mpu_irqs);
 		if (mpu_irq < 0) {
-			snd_card_free(card);
 			snd_printk(KERN_ERR
 				   "unable to find a free MPU401 IRQ\n");
 			return -EBUSY;
@@ -1462,7 +1449,6 @@ static int snd_miro_isa_probe(struct device *devptr, unsigned int n)
 	if (dma1 == SNDRV_AUTO_DMA) {
 		dma1 = snd_legacy_find_free_dma(possible_dma1s);
 		if (dma1 < 0) {
-			snd_card_free(card);
 			snd_printk(KERN_ERR "unable to find a free DMA1\n");
 			return -EBUSY;
 		}
@@ -1470,34 +1456,24 @@ static int snd_miro_isa_probe(struct device *devptr, unsigned int n)
 	if (dma2 == SNDRV_AUTO_DMA) {
 		dma2 = snd_legacy_find_free_dma(possible_dma2s[dma1 % 4]);
 		if (dma2 < 0) {
-			snd_card_free(card);
 			snd_printk(KERN_ERR "unable to find a free DMA2\n");
 			return -EBUSY;
 		}
 	}
 
 	error = snd_miro_probe(card);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 
 	dev_set_drvdata(devptr, card);
 	return 0;
 }
 
-static void snd_miro_isa_remove(struct device *devptr,
-			       unsigned int dev)
-{
-	snd_card_free(dev_get_drvdata(devptr));
-}
-
 #define DEV_NAME "miro"
 
 static struct isa_driver snd_miro_driver = {
 	.match		= snd_miro_isa_match,
 	.probe		= snd_miro_isa_probe,
-	.remove		= snd_miro_isa_remove,
 	/* FIXME: suspend/resume */
 	.driver		= {
 		.name	= DEV_NAME
@@ -1578,39 +1554,31 @@ static int snd_miro_pnp_probe(struct pnp_card_link *pcard,
 		return -EBUSY;
 	if (!isapnp)
 		return -ENODEV;
-	err = snd_card_new(&pcard->card->dev, index, id, THIS_MODULE,
-			   sizeof(struct snd_miro), &card);
+	err = snd_devm_card_new(&pcard->card->dev, index, id, THIS_MODULE,
+				sizeof(struct snd_miro), &card);
 	if (err < 0)
 		return err;
 
-	card->private_free = snd_card_miro_free;
 	miro = card->private_data;
 
 	err = snd_card_miro_pnp(miro, pcard, pid);
-	if (err) {
-		snd_card_free(card);
+	if (err)
 		return err;
-	}
 
 	/* only miroSOUND PCM20 and PCM12 == OPTi924 */
 	err = snd_miro_init(miro, OPTi9XX_HW_82C924);
-	if (err) {
-		snd_card_free(card);
+	if (err)
 		return err;
-	}
 
-	err = snd_miro_opti_check(miro);
+	err = snd_miro_opti_check(card, miro);
 	if (err) {
 		snd_printk(KERN_ERR "OPTI chip not found\n");
-		snd_card_free(card);
 		return err;
 	}
 
 	err = snd_miro_probe(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	pnp_set_card_drvdata(pcard, card);
 	snd_miro_pnp_is_probed = 1;
 	return 0;
@@ -1618,8 +1586,6 @@ static int snd_miro_pnp_probe(struct pnp_card_link *pcard,
 
 static void snd_miro_pnp_remove(struct pnp_card_link *pcard)
 {
-	snd_card_free(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
 	snd_miro_pnp_is_probed = 0;
 }
 
diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
index 4bd1dc6707fc..8988de8cca96 100644
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -654,16 +654,18 @@ static irqreturn_t snd_opti93x_interrupt(int irq, void *dev_id)
 
 #endif /* OPTi93X */
 
-static int snd_opti9xx_read_check(struct snd_opti9xx *chip)
+static int snd_opti9xx_read_check(struct snd_card *card,
+				  struct snd_opti9xx *chip)
 {
 	unsigned char value;
 #ifdef OPTi93X
 	unsigned long flags;
 #endif
 
-	chip->res_mc_base = request_region(chip->mc_base, chip->mc_base_size,
-					   "OPTi9xx MC");
-	if (chip->res_mc_base == NULL)
+	chip->res_mc_base =
+		devm_request_region(card->dev, chip->mc_base,
+				    chip->mc_base_size, "OPTi9xx MC");
+	if (!chip->res_mc_base)
 		return -EBUSY;
 #ifndef OPTi93X
 	value = snd_opti9xx_read(chip, OPTi9XX_MC_REG(1));
@@ -671,9 +673,10 @@ static int snd_opti9xx_read_check(struct snd_opti9xx *chip)
 		if (value == snd_opti9xx_read(chip, OPTi9XX_MC_REG(1)))
 			return 0;
 #else	/* OPTi93X */
-	chip->res_mc_indir = request_region(chip->mc_indir_index, 2,
-					    "OPTi93x MC");
-	if (chip->res_mc_indir == NULL)
+	chip->res_mc_indir =
+		devm_request_region(card->dev, chip->mc_indir_index, 2,
+				    "OPTi93x MC");
+	if (!chip->res_mc_indir)
 		return -EBUSY;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -686,10 +689,10 @@ static int snd_opti9xx_read_check(struct snd_opti9xx *chip)
 	if (snd_opti9xx_read(chip, OPTi9XX_MC_REG(7)) == 0xff - value)
 		return 0;
 
-	release_and_free_resource(chip->res_mc_indir);
+	devm_release_resource(card->dev, chip->res_mc_indir);
 	chip->res_mc_indir = NULL;
 #endif	/* OPTi93X */
-	release_and_free_resource(chip->res_mc_base);
+	devm_release_resource(card->dev, chip->res_mc_base);
 	chip->res_mc_base = NULL;
 
 	return -ENODEV;
@@ -709,7 +712,7 @@ static int snd_card_opti9xx_detect(struct snd_card *card,
 		if (err < 0)
 			return err;
 
-		err = snd_opti9xx_read_check(chip);
+		err = snd_opti9xx_read_check(card, chip);
 		if (err == 0)
 			return 1;
 #ifdef OPTi93X
@@ -789,22 +792,6 @@ static int snd_card_opti9xx_pnp(struct snd_opti9xx *chip,
 }
 #endif	/* CONFIG_PNP */
 
-static void snd_card_opti9xx_free(struct snd_card *card)
-{
-	struct snd_opti9xx *chip = card->private_data;
-
-	if (chip) {
-#ifdef OPTi93X
-		if (chip->irq > 0) {
-			disable_irq(chip->irq);
-			free_irq(chip->irq, chip);
-		}
-		release_and_free_resource(chip->res_mc_indir);
-#endif
-		release_and_free_resource(chip->res_mc_base);
-	}
-}
-
 static int snd_opti9xx_probe(struct snd_card *card)
 {
 	static const long possible_ports[] = {0x530, 0xe80, 0xf40, 0x604, -1};
@@ -860,8 +847,8 @@ static int snd_opti9xx_probe(struct snd_card *card)
 		return error;
 #endif
 #ifdef OPTi93X
-	error = request_irq(irq, snd_opti93x_interrupt,
-			    0, DEV_NAME" - WSS", chip);
+	error = devm_request_irq(card->dev, irq, snd_opti93x_interrupt,
+				 0, DEV_NAME" - WSS", chip);
 	if (error < 0) {
 		snd_printk(KERN_ERR "opti9xx: can't grab IRQ %d\n", irq);
 		return error;
@@ -931,11 +918,10 @@ static int snd_opti9xx_card_new(struct device *pdev, struct snd_card **cardp)
 	struct snd_card *card;
 	int err;
 
-	err = snd_card_new(pdev, index, id, THIS_MODULE,
-			   sizeof(struct snd_opti9xx), &card);
+	err = snd_devm_card_new(pdev, index, id, THIS_MODULE,
+				sizeof(struct snd_opti9xx), &card);
 	if (err < 0)
 		return err;
-	card->private_free = snd_card_opti9xx_free;
 	*cardp = card;
 	return 0;
 }
@@ -1012,25 +998,15 @@ static int snd_opti9xx_isa_probe(struct device *devptr,
 		return error;
 
 	error = snd_card_opti9xx_detect(card, card->private_data);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 	error = snd_opti9xx_probe(card);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 	dev_set_drvdata(devptr, card);
 	return 0;
 }
 
-static void snd_opti9xx_isa_remove(struct device *devptr,
-				   unsigned int dev)
-{
-	snd_card_free(dev_get_drvdata(devptr));
-}
-
 #ifdef CONFIG_PM
 static int snd_opti9xx_suspend(struct snd_card *card)
 {
@@ -1075,7 +1051,6 @@ static int snd_opti9xx_isa_resume(struct device *dev, unsigned int n)
 static struct isa_driver snd_opti9xx_driver = {
 	.match		= snd_opti9xx_isa_match,
 	.probe		= snd_opti9xx_isa_probe,
-	.remove		= snd_opti9xx_isa_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_opti9xx_isa_suspend,
 	.resume		= snd_opti9xx_isa_resume,
@@ -1114,26 +1089,19 @@ static int snd_opti9xx_pnp_probe(struct pnp_card_link *pcard,
 		hw = OPTi9XX_HW_82C931;
 		break;
 	default:
-		snd_card_free(card);
 		return -ENODEV;
 	}
 
 	error = snd_opti9xx_init(chip, hw);
-	if (error) {
-		snd_card_free(card);
+	if (error)
 		return error;
-	}
-	error = snd_opti9xx_read_check(chip);
-	if (error) {
+	error = snd_opti9xx_read_check(card, chip);
+	if (error)
 		snd_printk(KERN_ERR "OPTI chip not found\n");
-		snd_card_free(card);
 		return error;
-	}
 	error = snd_opti9xx_probe(card);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 	pnp_set_card_drvdata(pcard, card);
 	snd_opti9xx_pnp_is_probed = 1;
 	return 0;
@@ -1141,8 +1109,6 @@ static int snd_opti9xx_pnp_probe(struct pnp_card_link *pcard,
 
 static void snd_opti9xx_pnp_remove(struct pnp_card_link *pcard)
 {
-	snd_card_free(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
 	snd_opti9xx_pnp_is_probed = 0;
 }
 
-- 
2.26.2

