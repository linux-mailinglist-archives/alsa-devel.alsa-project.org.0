Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6CD3C9A6C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:20:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DAA61745;
	Thu, 15 Jul 2021 10:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DAA61745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337250;
	bh=AzVuUe4lqtpXsNEYNo85IEqda3qaYjrpZ0Oby7g4U0o=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OCiMTlnipHle15HPQKdQ9icXvE/6OSMfj7hLaPnfOglbVLItzOdhVcCxAUmgcI/vc
	 9F0t1qyLco+v8tGNbFG+umtdjhgE69n7xWcMD6I2q1bwZX+y9TH6+PoMto+QhzYEOz
	 cLKsP3rff+thESInre+5zsBmPed1UBS8AT+vLC8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B296F80726;
	Thu, 15 Jul 2021 10:01:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CC24F80543; Thu, 15 Jul 2021 10:01:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD0A1F80543
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD0A1F80543
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="1QMP/0S3"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="HWJoUnJI"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id AD95C22833
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwGvhln0wWLqQJUKVb8H3PMwDD51SVnuqZLAgCZuAkw=;
 b=1QMP/0S3E938P15xsKn5Ktn5AjzfiIdPEzKG6OOjkOvHZDgevdJ2KZrwjSRHN1xwH0lTzN
 9vD17Y3Gar3xzryWcoTF8dSUPuz8+rNOlDg2vzOp+u4lAUR/PbtVTGZBgGvnNX6wqiYnDZ
 tmEU5vcTZWasnH65tXp4tEQgATylRyo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336014;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwGvhln0wWLqQJUKVb8H3PMwDD51SVnuqZLAgCZuAkw=;
 b=HWJoUnJIOfsJDWP3gxHkr0pBkCnu3LK8UGW6ul53O86L/mKLEC4MxdVlpAzEM8ot1Hjlj4
 ACUyxB2ZrgA8vqCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 99CF7A3B8F;
 Thu, 15 Jul 2021 08:00:14 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 52/79] ALSA: ad1816a: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:59:14 +0200
Message-Id: <20210715075941.23332-53-tiwai@suse.de>
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

This patch converts the resource management in ISA ad1816a driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/ad1816a/ad1816a.c     | 41 +++++++--------------------
 sound/isa/ad1816a/ad1816a_lib.c | 49 ++++-----------------------------
 2 files changed, 16 insertions(+), 74 deletions(-)

diff --git a/sound/isa/ad1816a/ad1816a.c b/sound/isa/ad1816a/ad1816a.c
index fa5bed0d5a6f..9ac873773129 100644
--- a/sound/isa/ad1816a/ad1816a.c
+++ b/sound/isa/ad1816a/ad1816a.c
@@ -124,28 +124,24 @@ static int snd_card_ad1816a_probe(int dev, struct pnp_card_link *pcard,
 	struct snd_ad1816a *chip;
 	struct snd_opl3 *opl3;
 
-	error = snd_card_new(&pcard->card->dev,
-			     index[dev], id[dev], THIS_MODULE,
-			     sizeof(struct snd_ad1816a), &card);
+	error = snd_devm_card_new(&pcard->card->dev,
+				  index[dev], id[dev], THIS_MODULE,
+				  sizeof(struct snd_ad1816a), &card);
 	if (error < 0)
 		return error;
 	chip = card->private_data;
 
 	error = snd_card_ad1816a_pnp(dev, pcard, pid);
-	if (error) {
-		snd_card_free(card);
+	if (error)
 		return error;
-	}
 
 	error = snd_ad1816a_create(card, port[dev],
 				   irq[dev],
 				   dma1[dev],
 				   dma2[dev],
 				   chip);
-	if (error) {
-		snd_card_free(card);
+	if (error)
 		return error;
-	}
 	if (clockfreq[dev] >= 5000 && clockfreq[dev] <= 100000)
 		chip->clock_freq = clockfreq[dev];
 
@@ -155,22 +151,16 @@ static int snd_card_ad1816a_probe(int dev, struct pnp_card_link *pcard,
 		card->shortname, chip->port, irq[dev], dma1[dev], dma2[dev]);
 
 	error = snd_ad1816a_pcm(chip, 0);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 
 	error = snd_ad1816a_mixer(chip);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 
 	error = snd_ad1816a_timer(chip, 0);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 
 	if (mpu_port[dev] > 0) {
 		if (snd_mpu401_uart_new(card, 0, MPU401_HW_MPU401,
@@ -186,18 +176,14 @@ static int snd_card_ad1816a_probe(int dev, struct pnp_card_link *pcard,
 			printk(KERN_ERR PFX "no OPL device at 0x%lx-0x%lx.\n", fm_port[dev], fm_port[dev] + 2);
 		} else {
 			error = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
-			if (error < 0) {
-				snd_card_free(card);
+			if (error < 0)
 				return error;
-			}
 		}
 	}
 
 	error = snd_card_register(card);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 	pnp_set_card_drvdata(pcard, card);
 	return 0;
 }
@@ -223,12 +209,6 @@ static int snd_ad1816a_pnp_detect(struct pnp_card_link *card,
         return -ENODEV;
 }
 
-static void snd_ad1816a_pnp_remove(struct pnp_card_link *pcard)
-{
-	snd_card_free(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
-}
-
 #ifdef CONFIG_PM
 static int snd_ad1816a_pnp_suspend(struct pnp_card_link *pcard,
 				   pm_message_t state)
@@ -255,7 +235,6 @@ static struct pnp_card_driver ad1816a_pnpc_driver = {
 	.name		= "ad1816a",
 	.id_table	= snd_ad1816a_pnpids,
 	.probe		= snd_ad1816a_pnp_detect,
-	.remove		= snd_ad1816a_pnp_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_ad1816a_pnp_suspend,
 	.resume		= snd_ad1816a_pnp_resume,
diff --git a/sound/isa/ad1816a/ad1816a_lib.c b/sound/isa/ad1816a/ad1816a_lib.c
index 6d4999b30461..132a095dca2c 100644
--- a/sound/isa/ad1816a/ad1816a_lib.c
+++ b/sound/isa/ad1816a/ad1816a_lib.c
@@ -541,28 +541,6 @@ static int snd_ad1816a_probe(struct snd_ad1816a *chip)
 	return 0;
 }
 
-static int snd_ad1816a_free(struct snd_ad1816a *chip)
-{
-	release_and_free_resource(chip->res_port);
-	if (chip->irq >= 0)
-		free_irq(chip->irq, (void *) chip);
-	if (chip->dma1 >= 0) {
-		snd_dma_disable(chip->dma1);
-		free_dma(chip->dma1);
-	}
-	if (chip->dma2 >= 0) {
-		snd_dma_disable(chip->dma2);
-		free_dma(chip->dma2);
-	}
-	return 0;
-}
-
-static int snd_ad1816a_dev_free(struct snd_device *device)
-{
-	struct snd_ad1816a *chip = device->device_data;
-	return snd_ad1816a_free(chip);
-}
-
 static const char *snd_ad1816a_chip_id(struct snd_ad1816a *chip)
 {
 	switch (chip->hardware) {
@@ -580,37 +558,31 @@ int snd_ad1816a_create(struct snd_card *card,
 		       unsigned long port, int irq, int dma1, int dma2,
 		       struct snd_ad1816a *chip)
 {
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_ad1816a_dev_free,
-	};
 	int error;
 
 	chip->irq = -1;
 	chip->dma1 = -1;
 	chip->dma2 = -1;
 
-	chip->res_port = request_region(port, 16, "AD1816A");
+	chip->res_port = devm_request_region(card->dev, port, 16, "AD1816A");
 	if (!chip->res_port) {
 		snd_printk(KERN_ERR "ad1816a: can't grab port 0x%lx\n", port);
-		snd_ad1816a_free(chip);
 		return -EBUSY;
 	}
-	if (request_irq(irq, snd_ad1816a_interrupt, 0, "AD1816A", (void *) chip)) {
+	if (devm_request_irq(card->dev, irq, snd_ad1816a_interrupt, 0,
+			     "AD1816A", (void *) chip)) {
 		snd_printk(KERN_ERR "ad1816a: can't grab IRQ %d\n", irq);
-		snd_ad1816a_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = irq;
 	card->sync_irq = chip->irq;
-	if (request_dma(dma1, "AD1816A - 1")) {
+	if (snd_devm_request_dma(card->dev, dma1, "AD1816A - 1")) {
 		snd_printk(KERN_ERR "ad1816a: can't grab DMA1 %d\n", dma1);
-		snd_ad1816a_free(chip);
 		return -EBUSY;
 	}
 	chip->dma1 = dma1;
-	if (request_dma(dma2, "AD1816A - 2")) {
+	if (snd_devm_request_dma(card->dev, dma2, "AD1816A - 2")) {
 		snd_printk(KERN_ERR "ad1816a: can't grab DMA2 %d\n", dma2);
-		snd_ad1816a_free(chip);
 		return -EBUSY;
 	}
 	chip->dma2 = dma2;
@@ -620,20 +592,11 @@ int snd_ad1816a_create(struct snd_card *card,
 	spin_lock_init(&chip->lock);
 
 	error = snd_ad1816a_probe(chip);
-	if (error) {
-		snd_ad1816a_free(chip);
+	if (error)
 		return error;
-	}
 
 	snd_ad1816a_init(chip);
 
-	/* Register device */
-	error = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (error < 0) {
-		snd_ad1816a_free(chip);
-		return error;
-	}
-
 	return 0;
 }
 
-- 
2.26.2

