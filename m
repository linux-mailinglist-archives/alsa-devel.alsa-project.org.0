Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4293C9AA1
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:29:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21603177B;
	Thu, 15 Jul 2021 10:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21603177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337791;
	bh=8wBY3kR9ayksoY26T6cY/tEuYhEBgN45pciMsEj4K1g=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aBp5nUTXtxIAT4VT1KqhLGKA050IZ6CZrUO7MtOp5PrzUmH8E4DwPqtO+V+rog3Ag
	 rzPXpgmkQphVkzslBPnLzttGeJLaLzmC2aqL+v4qzFycgOZGjr+4UwtRcv65IieZVs
	 X+1ocRj2kEI5a9rVC0Nm5+NAP0omI9Nh1nsLo134=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2386CF8085C;
	Thu, 15 Jul 2021 10:02:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC291F8080C; Thu, 15 Jul 2021 10:01:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADB7BF805AF
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADB7BF805AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="0iRQdb25"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="yGEP/tpE"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 85EA822833
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHFhxAgjrhLYApqQjhNVcHFXdRgRQ7KpN2whoRT+Qe0=;
 b=0iRQdb257FNnW0m3hnvFGoZCsj5wROqNU93aaz7gbafN4e0LF9Vnznq3ug7K4IQNOXnxID
 2pLQoGaI9f+IpGt2LyLA1V2xxXCVkhE6NsN84dEgP81sLsiuHuqlOtuBppONUZgAm1l/rE
 V2C0SnNA/djun+VGKhyfhA0vHEot2/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHFhxAgjrhLYApqQjhNVcHFXdRgRQ7KpN2whoRT+Qe0=;
 b=yGEP/tpEb2XZzpCBZZUhvFboqc1PdGWhx6levioAMuydZ5D/KyqrJ3ZYJl930pJE3oeE7e
 mazEMv/SNb8eJcBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 73B90A3B8F;
 Thu, 15 Jul 2021 08:00:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 63/79] ALSA: es18xx: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:25 +0200
Message-Id: <20210715075941.23332-64-tiwai@suse.de>
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

This patch converts the resource management in ISA es18xx driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.  The remove callback became
superfluous and dropped.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/es18xx.c | 112 ++++++++-------------------------------------
 1 file changed, 20 insertions(+), 92 deletions(-)

diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
index 68b9c59e1127..3fcd168480b6 100644
--- a/sound/isa/es18xx.c
+++ b/sound/isa/es18xx.c
@@ -87,9 +87,6 @@
 struct snd_es18xx {
 	unsigned long port;		/* port of ESS chip */
 	unsigned long ctrl_port;	/* Control port of ESS chip */
-	struct resource *res_port;
-	struct resource *res_mpu_port;
-	struct resource *res_ctrl_port;
 	int irq;			/* IRQ number of ESS chip */
 	int dma1;			/* DMA1 */
 	int dma2;			/* DMA2 */
@@ -1531,7 +1528,7 @@ static int snd_es18xx_initialize(struct snd_es18xx *chip,
         return 0;
 }
 
-static int snd_es18xx_identify(struct snd_es18xx *chip)
+static int snd_es18xx_identify(struct snd_card *card, struct snd_es18xx *chip)
 {
 	int hi,lo;
 
@@ -1573,8 +1570,8 @@ static int snd_es18xx_identify(struct snd_es18xx *chip)
 		udelay(10);
 		chip->ctrl_port += inb(chip->port + 0x05);
 
-		chip->res_ctrl_port = request_region(chip->ctrl_port, 8, "ES18xx - CTRL");
-		if (!chip->res_ctrl_port) {
+		if (!devm_request_region(card->dev, chip->ctrl_port, 8,
+					 "ES18xx - CTRL")) {
 			snd_printk(KERN_ERR PFX "unable go grab port 0x%lx\n", chip->ctrl_port);
 			return -EBUSY;
 		}
@@ -1601,11 +1598,12 @@ static int snd_es18xx_identify(struct snd_es18xx *chip)
 	return 0;
 }
 
-static int snd_es18xx_probe(struct snd_es18xx *chip,
+static int snd_es18xx_probe(struct snd_card *card,
+			    struct snd_es18xx *chip,
 			    unsigned long mpu_port,
 			    unsigned long fm_port)
 {
-	if (snd_es18xx_identify(chip) < 0) {
+	if (snd_es18xx_identify(card, chip) < 0) {
 		snd_printk(KERN_ERR PFX "[0x%lx] ESS chip not found\n", chip->port);
                 return -ENODEV;
 	}
@@ -1722,31 +1720,6 @@ static int snd_es18xx_resume(struct snd_card *card)
 }
 #endif /* CONFIG_PM */
 
-static int snd_es18xx_free(struct snd_card *card)
-{
-	struct snd_es18xx *chip = card->private_data;
-
-	release_and_free_resource(chip->res_port);
-	release_and_free_resource(chip->res_ctrl_port);
-	release_and_free_resource(chip->res_mpu_port);
-	if (chip->irq >= 0)
-		free_irq(chip->irq, (void *) card);
-	if (chip->dma1 >= 0) {
-		disable_dma(chip->dma1);
-		free_dma(chip->dma1);
-	}
-	if (chip->dma2 >= 0 && chip->dma1 != chip->dma2) {
-		disable_dma(chip->dma2);
-		free_dma(chip->dma2);
-	}
-	return 0;
-}
-
-static int snd_es18xx_dev_free(struct snd_device *device)
-{
-	return snd_es18xx_free(device->card);
-}
-
 static int snd_es18xx_new_device(struct snd_card *card,
 				 unsigned long port,
 				 unsigned long mpu_port,
@@ -1754,10 +1727,6 @@ static int snd_es18xx_new_device(struct snd_card *card,
 				 int irq, int dma1, int dma2)
 {
 	struct snd_es18xx *chip = card->private_data;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_es18xx_dev_free,
-        };
-	int err;
 
 	spin_lock_init(&chip->reg_lock);
  	spin_lock_init(&chip->mixer_lock);
@@ -1768,45 +1737,34 @@ static int snd_es18xx_new_device(struct snd_card *card,
         chip->audio2_vol = 0x00;
 	chip->active = 0;
 
-	chip->res_port = request_region(port, 16, "ES18xx");
-	if (chip->res_port == NULL) {
-		snd_es18xx_free(card);
+	if (!devm_request_region(card->dev, port, 16, "ES18xx")) {
 		snd_printk(KERN_ERR PFX "unable to grap ports 0x%lx-0x%lx\n", port, port + 16 - 1);
 		return -EBUSY;
 	}
 
-	if (request_irq(irq, snd_es18xx_interrupt, 0, "ES18xx",
-			(void *) card)) {
-		snd_es18xx_free(card);
+	if (devm_request_irq(card->dev, irq, snd_es18xx_interrupt, 0, "ES18xx",
+			     (void *) card)) {
 		snd_printk(KERN_ERR PFX "unable to grap IRQ %d\n", irq);
 		return -EBUSY;
 	}
 	chip->irq = irq;
 	card->sync_irq = chip->irq;
 
-	if (request_dma(dma1, "ES18xx DMA 1")) {
-		snd_es18xx_free(card);
+	if (snd_devm_request_dma(card->dev, dma1, "ES18xx DMA 1")) {
 		snd_printk(KERN_ERR PFX "unable to grap DMA1 %d\n", dma1);
 		return -EBUSY;
 	}
 	chip->dma1 = dma1;
 
-	if (dma2 != dma1 && request_dma(dma2, "ES18xx DMA 2")) {
-		snd_es18xx_free(card);
+	if (dma2 != dma1 &&
+	    snd_devm_request_dma(card->dev, dma2, "ES18xx DMA 2")) {
 		snd_printk(KERN_ERR PFX "unable to grap DMA2 %d\n", dma2);
 		return -EBUSY;
 	}
 	chip->dma2 = dma2;
 
-	if (snd_es18xx_probe(chip, mpu_port, fm_port) < 0) {
-		snd_es18xx_free(card);
+	if (snd_es18xx_probe(card, chip, mpu_port, fm_port) < 0)
 		return -ENODEV;
-	}
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_es18xx_free(card);
-		return err;
-	}
         return 0;
 }
 
@@ -2088,8 +2046,8 @@ static int snd_audiodrive_pnpc(int dev, struct snd_es18xx *chip,
 static int snd_es18xx_card_new(struct device *pdev, int dev,
 			       struct snd_card **cardp)
 {
-	return snd_card_new(pdev, index[dev], id[dev], THIS_MODULE,
-			    sizeof(struct snd_es18xx), cardp);
+	return snd_devm_card_new(pdev, index[dev], id[dev], THIS_MODULE,
+				 sizeof(struct snd_es18xx), cardp);
 }
 
 static int snd_audiodrive_probe(struct snd_card *card, int dev)
@@ -2164,10 +2122,8 @@ static int snd_es18xx_isa_probe1(int dev, struct device *devptr)
 	if (err < 0)
 		return err;
 	err = snd_audiodrive_probe(card, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	dev_set_drvdata(devptr, card);
 	return 0;
 }
@@ -2215,12 +2171,6 @@ static int snd_es18xx_isa_probe(struct device *pdev, unsigned int dev)
 	}
 }
 
-static void snd_es18xx_isa_remove(struct device *devptr,
-				  unsigned int dev)
-{
-	snd_card_free(dev_get_drvdata(devptr));
-}
-
 #ifdef CONFIG_PM
 static int snd_es18xx_isa_suspend(struct device *dev, unsigned int n,
 				  pm_message_t state)
@@ -2239,7 +2189,6 @@ static int snd_es18xx_isa_resume(struct device *dev, unsigned int n)
 static struct isa_driver snd_es18xx_isa_driver = {
 	.match		= snd_es18xx_isa_match,
 	.probe		= snd_es18xx_isa_probe,
-	.remove		= snd_es18xx_isa_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_es18xx_isa_suspend,
 	.resume		= snd_es18xx_isa_resume,
@@ -2271,25 +2220,16 @@ static int snd_audiodrive_pnp_detect(struct pnp_dev *pdev,
 	if (err < 0)
 		return err;
 	err = snd_audiodrive_pnp(dev, card->private_data, pdev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_audiodrive_probe(card, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	pnp_set_drvdata(pdev, card);
 	dev++;
 	return 0;
 }
 
-static void snd_audiodrive_pnp_remove(struct pnp_dev *pdev)
-{
-	snd_card_free(pnp_get_drvdata(pdev));
-}
-
 #ifdef CONFIG_PM
 static int snd_audiodrive_pnp_suspend(struct pnp_dev *pdev, pm_message_t state)
 {
@@ -2305,7 +2245,6 @@ static struct pnp_driver es18xx_pnp_driver = {
 	.name = "es18xx-pnpbios",
 	.id_table = snd_audiodrive_pnpbiosids,
 	.probe = snd_audiodrive_pnp_detect,
-	.remove = snd_audiodrive_pnp_remove,
 #ifdef CONFIG_PM
 	.suspend = snd_audiodrive_pnp_suspend,
 	.resume = snd_audiodrive_pnp_resume,
@@ -2331,27 +2270,17 @@ static int snd_audiodrive_pnpc_detect(struct pnp_card_link *pcard,
 		return res;
 
 	res = snd_audiodrive_pnpc(dev, card->private_data, pcard, pid);
-	if (res < 0) {
-		snd_card_free(card);
+	if (res < 0)
 		return res;
-	}
 	res = snd_audiodrive_probe(card, dev);
-	if (res < 0) {
-		snd_card_free(card);
+	if (res < 0)
 		return res;
-	}
 
 	pnp_set_card_drvdata(pcard, card);
 	dev++;
 	return 0;
 }
 
-static void snd_audiodrive_pnpc_remove(struct pnp_card_link *pcard)
-{
-	snd_card_free(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
-}
-
 #ifdef CONFIG_PM
 static int snd_audiodrive_pnpc_suspend(struct pnp_card_link *pcard, pm_message_t state)
 {
@@ -2370,7 +2299,6 @@ static struct pnp_card_driver es18xx_pnpc_driver = {
 	.name = "es18xx",
 	.id_table = snd_audiodrive_pnpids,
 	.probe = snd_audiodrive_pnpc_detect,
-	.remove = snd_audiodrive_pnpc_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_audiodrive_pnpc_suspend,
 	.resume		= snd_audiodrive_pnpc_resume,
-- 
2.26.2

