Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5CD3C9A8D
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B829176C;
	Thu, 15 Jul 2021 10:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B829176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337592;
	bh=Lx30rYwIObscHN8jf5Fjf43epa2gCSnbL4l6v5Y2Jd8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kj/mAuGqPD86264HM8fjLRajQrTYetnrjyAP7XVMAAdyJJonxdPvEB+dIXdk41a/D
	 HuAg9VAx26GATKmobF9rzfCFgosMSUPeGWws73B8w8/4Mkj4TkqlSIvKzZvAnhNhHp
	 5gly3YvdZLFYtTBquKjVnHr5PxaCXuK2QTMZQnKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C75EF804E5;
	Thu, 15 Jul 2021 10:01:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4043BF8076F; Thu, 15 Jul 2021 10:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E6A8F8057C
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E6A8F8057C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="n8dXMz2K"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="r2rvv/g4"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 581891FD3E
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z04MrU5rFTVug6o6faGGGCcZdn5UkaMXkEgXi4wxA2Q=;
 b=n8dXMz2KfkLzx2T1+voktRj3evJG7TdhE11hljphU1Bt7Sv3XiqjA+Ed1edRkKLWuACWt2
 S/c5LZ6jLVr9CSkQSnPV9JgLS9fa9PBYk0mmMJ3o0Xbju5xWdT7sGCN8Japelocl0KgZ9x
 0ycSC4aSLCETppGI6D+DO4ZInm+Eahs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336020;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z04MrU5rFTVug6o6faGGGCcZdn5UkaMXkEgXi4wxA2Q=;
 b=r2rvv/g4jZOCGLegGlEienzLr16AZIR1qhOPrRU7D6/RHjnKhl5y2OC5YSEZ/iyR0UtYZy
 y6+QQhpMoljFGnCA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 438DDA3B8F;
 Thu, 15 Jul 2021 08:00:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 65/79] ALSA: gus: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:27 +0200
Message-Id: <20210715075941.23332-66-tiwai@suse.de>
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

This patch converts the resource management in ISA gus drivers with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.  The remove callback became
superfluous and dropped.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/gus_main.c   | 44 ++++++++------------------
 sound/isa/gus/gusclassic.c | 28 ++++++----------
 sound/isa/gus/gusextreme.c | 39 +++++++++--------------
 sound/isa/gus/gusmax.c     | 65 ++++++++++++--------------------------
 sound/isa/gus/interwave.c  | 53 +++++++------------------------
 5 files changed, 68 insertions(+), 161 deletions(-)

diff --git a/sound/isa/gus/gus_main.c b/sound/isa/gus/gus_main.c
index 3b46490271fe..ae1e2542ee4a 100644
--- a/sound/isa/gus/gus_main.c
+++ b/sound/isa/gus/gus_main.c
@@ -87,24 +87,10 @@ static void snd_gus_init_control(struct snd_gus_card *gus)
 
 static int snd_gus_free(struct snd_gus_card *gus)
 {
-	if (gus->gf1.res_port2 == NULL)
-		goto __hw_end;
-	snd_gf1_stop(gus);
-	snd_gus_init_dma_irq(gus, 0);
-      __hw_end:
-	release_and_free_resource(gus->gf1.res_port1);
-	release_and_free_resource(gus->gf1.res_port2);
-	if (gus->gf1.irq >= 0)
-		free_irq(gus->gf1.irq, (void *) gus);
-	if (gus->gf1.dma1 >= 0) {
-		disable_dma(gus->gf1.dma1);
-		free_dma(gus->gf1.dma1);
+	if (gus->gf1.res_port2) {
+		snd_gf1_stop(gus);
+		snd_gus_init_dma_irq(gus, 0);
 	}
-	if (!gus->equal_dma && gus->gf1.dma2 >= 0) {
-		disable_dma(gus->gf1.dma2);
-		free_dma(gus->gf1.dma2);
-	}
-	kfree(gus);
 	return 0;
 }
 
@@ -130,7 +116,7 @@ int snd_gus_create(struct snd_card *card,
 	};
 
 	*rgus = NULL;
-	gus = kzalloc(sizeof(*gus), GFP_KERNEL);
+	gus = devm_kzalloc(card->dev, sizeof(*gus), GFP_KERNEL);
 	if (gus == NULL)
 		return -ENOMEM;
 	spin_lock_init(&gus->reg_lock);
@@ -156,35 +142,33 @@ int snd_gus_create(struct snd_card *card,
 	gus->gf1.reg_timerctrl = GUSP(gus, TIMERCNTRL);
 	gus->gf1.reg_timerdata = GUSP(gus, TIMERDATA);
 	/* allocate resources */
-	gus->gf1.res_port1 = request_region(port, 16, "GUS GF1 (Adlib/SB)");
+	gus->gf1.res_port1 = devm_request_region(card->dev, port, 16,
+						 "GUS GF1 (Adlib/SB)");
 	if (!gus->gf1.res_port1) {
 		snd_printk(KERN_ERR "gus: can't grab SB port 0x%lx\n", port);
-		snd_gus_free(gus);
 		return -EBUSY;
 	}
-	gus->gf1.res_port2 = request_region(port + 0x100, 12, "GUS GF1 (Synth)");
+	gus->gf1.res_port2 = devm_request_region(card->dev, port + 0x100, 12,
+						 "GUS GF1 (Synth)");
 	if (!gus->gf1.res_port2) {
 		snd_printk(KERN_ERR "gus: can't grab synth port 0x%lx\n", port + 0x100);
-		snd_gus_free(gus);
 		return -EBUSY;
 	}
-	if (irq >= 0 && request_irq(irq, snd_gus_interrupt, 0, "GUS GF1", (void *) gus)) {
+	if (irq >= 0 && devm_request_irq(card->dev, irq, snd_gus_interrupt, 0,
+					 "GUS GF1", (void *) gus)) {
 		snd_printk(KERN_ERR "gus: can't grab irq %d\n", irq);
-		snd_gus_free(gus);
 		return -EBUSY;
 	}
 	gus->gf1.irq = irq;
 	card->sync_irq = irq;
-	if (request_dma(dma1, "GUS - 1")) {
+	if (snd_devm_request_dma(card->dev, dma1, "GUS - 1")) {
 		snd_printk(KERN_ERR "gus: can't grab DMA1 %d\n", dma1);
-		snd_gus_free(gus);
 		return -EBUSY;
 	}
 	gus->gf1.dma1 = dma1;
 	if (dma2 >= 0 && dma1 != dma2) {
-		if (request_dma(dma2, "GUS - 2")) {
+		if (snd_devm_request_dma(card->dev, dma2, "GUS - 2")) {
 			snd_printk(KERN_ERR "gus: can't grab DMA2 %d\n", dma2);
-			snd_gus_free(gus);
 			return -EBUSY;
 		}
 		gus->gf1.dma2 = dma2;
@@ -209,10 +193,8 @@ int snd_gus_create(struct snd_card *card,
 	gus->gf1.volume_ramp = 25;
 	gus->gf1.smooth_pan = 1;
 	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, gus, &ops);
-	if (err < 0) {
-		snd_gus_free(gus);
+	if (err < 0)
 		return err;
-	}
 	*rgus = gus;
 	return 0;
 }
diff --git a/sound/isa/gus/gusclassic.c b/sound/isa/gus/gusclassic.c
index bca1caa4968c..09cc53ceea2a 100644
--- a/sound/isa/gus/gusclassic.c
+++ b/sound/isa/gus/gusclassic.c
@@ -135,7 +135,7 @@ static int snd_gusclassic_probe(struct device *dev, unsigned int n)
 	struct snd_gus_card *gus;
 	int error;
 
-	error = snd_card_new(dev, index[n], id[n], THIS_MODULE, 0, &card);
+	error = snd_devm_card_new(dev, index[n], id[n], THIS_MODULE, 0, &card);
 	if (error < 0)
 		return error;
 
@@ -144,37 +144,37 @@ static int snd_gusclassic_probe(struct device *dev, unsigned int n)
 
 	error = snd_gusclassic_create(card, dev, n, &gus);
 	if (error < 0)
-		goto out;
+		return error;
 
 	error = snd_gusclassic_detect(gus);
 	if (error < 0)
-		goto out;
+		return error;
 
 	gus->joystick_dac = joystick_dac[n];
 
 	error = snd_gus_initialize(gus);
 	if (error < 0)
-		goto out;
+		return error;
 
 	error = -ENODEV;
 	if (gus->max_flag || gus->ess_flag) {
 		dev_err(dev, "GUS Classic or ACE soundcard was "
 			"not detected at 0x%lx\n", gus->gf1.port);
-		goto out;
+		return error;
 	}
 
 	error = snd_gf1_new_mixer(gus);
 	if (error < 0)
-		goto out;
+		return error;
 
 	error = snd_gf1_pcm_new(gus, 0, 0);
 	if (error < 0)
-		goto out;
+		return error;
 
 	if (!gus->ace_flag) {
 		error = snd_gf1_rawmidi_new(gus, 0);
 		if (error < 0)
-			goto out;
+			return error;
 	}
 
 	sprintf(card->longname + strlen(card->longname),
@@ -187,27 +187,17 @@ static int snd_gusclassic_probe(struct device *dev, unsigned int n)
 
 	error = snd_card_register(card);
 	if (error < 0)
-		goto out;
+		return error;
 
 	dev_set_drvdata(dev, card);
 	return 0;
-
-out:	snd_card_free(card);
-	return error;
-}
-
-static void snd_gusclassic_remove(struct device *dev, unsigned int n)
-{
-	snd_card_free(dev_get_drvdata(dev));
 }
 
 static struct isa_driver snd_gusclassic_driver = {
 	.match		= snd_gusclassic_match,
 	.probe		= snd_gusclassic_probe,
-	.remove		= snd_gusclassic_remove,
 #if 0	/* FIXME */
 	.suspend	= snd_gusclassic_suspend,
-	.remove		= snd_gusclassic_remove,
 #endif
 	.driver		= {
 		.name	= DEV_NAME
diff --git a/sound/isa/gus/gusextreme.c b/sound/isa/gus/gusextreme.c
index a409a4a29afc..63d9f2d75df0 100644
--- a/sound/isa/gus/gusextreme.c
+++ b/sound/isa/gus/gusextreme.c
@@ -228,8 +228,8 @@ static int snd_gusextreme_probe(struct device *dev, unsigned int n)
 	struct snd_opl3 *opl3;
 	int error;
 
-	error = snd_card_new(dev, index[n], id[n], THIS_MODULE,
-			     sizeof(struct snd_es1688), &card);
+	error = snd_devm_card_new(dev, index[n], id[n], THIS_MODULE,
+				  sizeof(struct snd_es1688), &card);
 	if (error < 0)
 		return error;
 
@@ -243,56 +243,56 @@ static int snd_gusextreme_probe(struct device *dev, unsigned int n)
 
 	error = snd_gusextreme_es1688_create(card, es1688, dev, n);
 	if (error < 0)
-		goto out;
+		return error;
 
 	if (gf1_port[n] < 0)
 		gf1_port[n] = es1688->port + 0x20;
 
 	error = snd_gusextreme_gus_card_create(card, dev, n, &gus);
 	if (error < 0)
-		goto out;
+		return error;
 
 	error = snd_gusextreme_detect(gus, es1688);
 	if (error < 0)
-		goto out;
+		return error;
 
 	gus->joystick_dac = joystick_dac[n];
 
 	error = snd_gus_initialize(gus);
 	if (error < 0)
-		goto out;
+		return error;
 
 	error = -ENODEV;
 	if (!gus->ess_flag) {
 		dev_err(dev, "GUS Extreme soundcard was not "
 			"detected at 0x%lx\n", gus->gf1.port);
-		goto out;
+		return error;
 	}
 	gus->codec_flag = 1;
 
 	error = snd_es1688_pcm(card, es1688, 0);
 	if (error < 0)
-		goto out;
+		return error;
 
 	error = snd_es1688_mixer(card, es1688);
 	if (error < 0)
-		goto out;
+		return error;
 
 	snd_component_add(card, "ES1688");
 
 	if (pcm_channels[n] > 0) {
 		error = snd_gf1_pcm_new(gus, 1, 1);
 		if (error < 0)
-			goto out;
+			return error;
 	}
 
 	error = snd_gf1_new_mixer(gus);
 	if (error < 0)
-		goto out;
+		return error;
 
 	error = snd_gusextreme_mixer(card);
 	if (error < 0)
-		goto out;
+		return error;
 
 	if (snd_opl3_create(card, es1688->port, es1688->port + 2,
 			OPL3_HW_OPL3, 0, &opl3) < 0)
@@ -300,14 +300,14 @@ static int snd_gusextreme_probe(struct device *dev, unsigned int n)
 	else {
 		error = snd_opl3_hwdep_new(opl3, 0, 2, NULL);
 		if (error < 0)
-			goto out;
+			return error;
 	}
 
 	if (es1688->mpu_port >= 0x300) {
 		error = snd_mpu401_uart_new(card, 0, MPU401_HW_ES1688,
 				es1688->mpu_port, 0, mpu_irq[n], NULL);
 		if (error < 0)
-			goto out;
+			return error;
 	}
 
 	sprintf(card->longname, "Gravis UltraSound Extreme at 0x%lx, "
@@ -316,24 +316,15 @@ static int snd_gusextreme_probe(struct device *dev, unsigned int n)
 
 	error = snd_card_register(card);
 	if (error < 0)
-		goto out;
+		return error;
 
 	dev_set_drvdata(dev, card);
 	return 0;
-
-out:	snd_card_free(card);
-	return error;
-}
-
-static void snd_gusextreme_remove(struct device *dev, unsigned int n)
-{
-	snd_card_free(dev_get_drvdata(dev));
 }
 
 static struct isa_driver snd_gusextreme_driver = {
 	.match		= snd_gusextreme_match,
 	.probe		= snd_gusextreme_probe,
-	.remove		= snd_gusextreme_remove,
 #if 0	/* FIXME */
 	.suspend	= snd_gusextreme_suspend,
 	.resume		= snd_gusextreme_resume,
diff --git a/sound/isa/gus/gusmax.c b/sound/isa/gus/gusmax.c
index ad118d462142..6834c0560064 100644
--- a/sound/isa/gus/gusmax.c
+++ b/sound/isa/gus/gusmax.c
@@ -179,16 +179,6 @@ static int snd_gusmax_mixer(struct snd_wss *chip)
 	return 0;
 }
 
-static void snd_gusmax_free(struct snd_card *card)
-{
-	struct snd_gusmax *maxcard = card->private_data;
-	
-	if (maxcard == NULL)
-		return;
-	if (maxcard->irq >= 0)
-		free_irq(maxcard->irq, (void *)maxcard);
-}
-
 static int snd_gusmax_match(struct device *pdev, unsigned int dev)
 {
 	return enable[dev];
@@ -204,11 +194,10 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 	struct snd_wss *wss;
 	struct snd_gusmax *maxcard;
 
-	err = snd_card_new(pdev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct snd_gusmax), &card);
+	err = snd_devm_card_new(pdev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_gusmax), &card);
 	if (err < 0)
 		return err;
-	card->private_free = snd_gusmax_free;
 	maxcard = card->private_data;
 	maxcard->card = card;
 	maxcard->irq = -1;
@@ -218,8 +207,7 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 		xirq = snd_legacy_find_free_irq(possible_irqs);
 		if (xirq < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free IRQ\n");
-			err = -EBUSY;
-			goto _err;
+			return -EBUSY;
 		}
 	}
 	xdma1 = dma1[dev];
@@ -227,8 +215,7 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 		xdma1 = snd_legacy_find_free_dma(possible_dmas);
 		if (xdma1 < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free DMA1\n");
-			err = -EBUSY;
-			goto _err;
+			return -EBUSY;
 		}
 	}
 	xdma2 = dma2[dev];
@@ -236,8 +223,7 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 		xdma2 = snd_legacy_find_free_dma(possible_dmas);
 		if (xdma2 < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free DMA2\n");
-			err = -EBUSY;
-			goto _err;
+			return -EBUSY;
 		}
 	}
 
@@ -267,29 +253,28 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 		}
 	}
 	if (err < 0)
-		goto _err;
+		return err;
 
 	err = snd_gusmax_detect(gus);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	maxcard->gus_status_reg = gus->gf1.reg_irqstat;
 	maxcard->pcm_status_reg = gus->gf1.port + 0x10c + 2;
 	snd_gusmax_init(dev, card, gus);
 	err = snd_gus_initialize(gus);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	if (!gus->max_flag) {
 		snd_printk(KERN_ERR PFX "GUS MAX soundcard was not detected at 0x%lx\n", gus->gf1.port);
-		err = -ENODEV;
-		goto _err;
+		return -ENODEV;
 	}
 
-	if (request_irq(xirq, snd_gusmax_interrupt, 0, "GUS MAX", (void *)maxcard)) {
+	if (devm_request_irq(card->dev, xirq, snd_gusmax_interrupt, 0,
+			     "GUS MAX", (void *)maxcard)) {
 		snd_printk(KERN_ERR PFX "unable to grab IRQ %d\n", xirq);
-		err = -EBUSY;
-		goto _err;
+		return -EBUSY;
 	}
 	maxcard->irq = xirq;
 	card->sync_irq = maxcard->irq;
@@ -303,32 +288,32 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 			     WSS_HWSHARE_DMA2,
 			     &wss);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	err = snd_wss_pcm(wss, 0);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	err = snd_wss_mixer(wss);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	err = snd_wss_timer(wss, 2);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	if (pcm_channels[dev] > 0) {
 		err = snd_gf1_pcm_new(gus, 1, 1);
 		if (err < 0)
-			goto _err;
+			return err;
 	}
 	err = snd_gusmax_mixer(wss);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	err = snd_gf1_rawmidi_new(gus, 0);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	sprintf(card->longname + strlen(card->longname), " at 0x%lx, irq %i, dma %i", gus->gf1.port, xirq, xdma1);
 	if (xdma2 >= 0)
@@ -336,22 +321,13 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto _err;
+		return err;
 		
 	maxcard->gus = gus;
 	maxcard->wss = wss;
 
 	dev_set_drvdata(pdev, card);
 	return 0;
-
- _err:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_gusmax_remove(struct device *devptr, unsigned int dev)
-{
-	snd_card_free(dev_get_drvdata(devptr));
 }
 
 #define DEV_NAME "gusmax"
@@ -359,7 +335,6 @@ static void snd_gusmax_remove(struct device *devptr, unsigned int dev)
 static struct isa_driver snd_gusmax_driver = {
 	.match		= snd_gusmax_match,
 	.probe		= snd_gusmax_probe,
-	.remove		= snd_gusmax_remove,
 	/* FIXME: suspend/resume */
 	.driver		= {
 		.name	= DEV_NAME
diff --git a/sound/isa/gus/interwave.c b/sound/isa/gus/interwave.c
index 755de47d0bb6..20f490e9d563 100644
--- a/sound/isa/gus/interwave.c
+++ b/sound/isa/gus/interwave.c
@@ -204,13 +204,15 @@ static int snd_interwave_detect_stb(struct snd_interwave *iwcard,
 			port = 0x360;
 		}
 		while (port <= 0x380) {
-			iwcard->i2c_res = request_region(port, 1, "InterWave (I2C bus)");
+			iwcard->i2c_res = devm_request_region(card->dev, port, 1,
+							      "InterWave (I2C bus)");
 			if (iwcard->i2c_res)
 				break;
 			port += 0x10;
 		}
 	} else {
-		iwcard->i2c_res = request_region(port, 1, "InterWave (I2C bus)");
+		iwcard->i2c_res = devm_request_region(card->dev, port, 1,
+						      "InterWave (I2C bus)");
 	}
 	if (iwcard->i2c_res == NULL) {
 		snd_printk(KERN_ERR "interwave: can't grab i2c bus port\n");
@@ -598,19 +600,6 @@ static int snd_interwave_pnp(int dev, struct snd_interwave *iwcard,
 }
 #endif /* CONFIG_PNP */
 
-static void snd_interwave_free(struct snd_card *card)
-{
-	struct snd_interwave *iwcard = card->private_data;
-
-	if (iwcard == NULL)
-		return;
-#ifdef SNDRV_STB
-	release_and_free_resource(iwcard->i2c_res);
-#endif
-	if (iwcard->irq >= 0)
-		free_irq(iwcard->irq, (void *)iwcard);
-}
-
 static int snd_interwave_card_new(struct device *pdev, int dev,
 				  struct snd_card **cardp)
 {
@@ -618,14 +607,13 @@ static int snd_interwave_card_new(struct device *pdev, int dev,
 	struct snd_interwave *iwcard;
 	int err;
 
-	err = snd_card_new(pdev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct snd_interwave), &card);
+	err = snd_devm_card_new(pdev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_interwave), &card);
 	if (err < 0)
 		return err;
 	iwcard = card->private_data;
 	iwcard->card = card;
 	iwcard->irq = -1;
-	card->private_free = snd_interwave_free;
 	*cardp = card;
 	return 0;
 }
@@ -671,8 +659,8 @@ static int snd_interwave_probe(struct snd_card *card, int dev)
 	if (err < 0)
 		return err;
 
-	if (request_irq(xirq, snd_interwave_interrupt, 0,
-			"InterWave", iwcard)) {
+	if (devm_request_irq(card->dev, xirq, snd_interwave_interrupt, 0,
+			     "InterWave", iwcard)) {
 		snd_printk(KERN_ERR PFX "unable to grab IRQ %d\n", xirq);
 		return -EBUSY;
 	}
@@ -779,10 +767,8 @@ static int snd_interwave_isa_probe1(int dev, struct device *devptr)
 		return err;
 
 	err = snd_interwave_probe(card, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	dev_set_drvdata(devptr, card);
 	return 0;
 }
@@ -843,15 +829,9 @@ static int snd_interwave_isa_probe(struct device *pdev,
 	}
 }
 
-static void snd_interwave_isa_remove(struct device *devptr, unsigned int dev)
-{
-	snd_card_free(dev_get_drvdata(devptr));
-}
-
 static struct isa_driver snd_interwave_driver = {
 	.match		= snd_interwave_isa_match,
 	.probe		= snd_interwave_isa_probe,
-	.remove		= snd_interwave_isa_remove,
 	/* FIXME: suspend,resume */
 	.driver		= {
 		.name	= INTERWAVE_DRIVER
@@ -878,32 +858,21 @@ static int snd_interwave_pnp_detect(struct pnp_card_link *pcard,
 		return res;
 
 	res = snd_interwave_pnp(dev, card->private_data, pcard, pid);
-	if (res < 0) {
-		snd_card_free(card);
+	if (res < 0)
 		return res;
-	}
 	res = snd_interwave_probe(card, dev);
-	if (res < 0) {
-		snd_card_free(card);
+	if (res < 0)
 		return res;
-	}
 	pnp_set_card_drvdata(pcard, card);
 	dev++;
 	return 0;
 }
 
-static void snd_interwave_pnp_remove(struct pnp_card_link *pcard)
-{
-	snd_card_free(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
-}
-
 static struct pnp_card_driver interwave_pnpc_driver = {
 	.flags = PNP_DRIVER_RES_DISABLE,
 	.name = INTERWAVE_PNP_DRIVER,
 	.id_table = snd_interwave_pnpids,
 	.probe = snd_interwave_pnp_detect,
-	.remove = snd_interwave_pnp_remove,
 	/* FIXME: suspend,resume */
 };
 
-- 
2.26.2

