Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 591463C9A73
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:22:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE16916ED;
	Thu, 15 Jul 2021 10:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE16916ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337336;
	bh=CqLU72kmYR+w71JU+Ui2kX395SvgaMILLnJIQbnwbeA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ahU1hACRp0fUfS4JKqngnUfpfzj2/O1kJcol4b4bm6n9V+682P8mbIseH9ojzwN5Y
	 YVAz0NGg3qhPWHF90CXT4D77LRdRUzrXqevh1p0Txc6PbbQ3BhQ6cqUZ32LC6ySXxj
	 l4Y+BwAm6ZbdzoZUeUhPGsQkg/+MfK4rk3xCuZF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDC3AF8074C;
	Thu, 15 Jul 2021 10:01:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A47BF80714; Thu, 15 Jul 2021 10:01:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4BECF80229
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4BECF80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="xmHBa2bj"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="DVwXPSfv"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8F3C02284F
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4z/+fbKGGqodB9tLJokLnzebyu7FxpXZ5TqZcwFQ2lo=;
 b=xmHBa2bjmqMXTQszggHqNb5q/pw01NX06Rt3CwuyGpv7chHK/5H338/zPxacRg9Q//xoJ4
 m3V9opqLTAPpKhjug/pPLmvfL2cFhoI0Gaxhl3oW04iRsue74IidJ7+BRH5uzhCqhLO8hs
 k7QNZ8sRpzU1lGjN2VkL3jbVViYHqpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336015;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4z/+fbKGGqodB9tLJokLnzebyu7FxpXZ5TqZcwFQ2lo=;
 b=DVwXPSfvtk9FLVt3NWx33JRlliHOf9PxS5vppv79nvc3u2SoA0Q1z5FBYJVUuInly9AXwj
 ji3nMHWVYlA5vFBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 7AE37A3B8F;
 Thu, 15 Jul 2021 08:00:15 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 54/79] ALSA: sb: Allocate resources with device-managed APIs
Date: Thu, 15 Jul 2021 09:59:16 +0200
Message-Id: <20210715075941.23332-55-tiwai@suse.de>
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

This patch converts the resource management in ISA sb drivers with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/emu8000.h  |  3 --
 sound/isa/sb/emu8000.c   | 48 ++++--------------------------
 sound/isa/sb/jazz16.c    | 39 ++++++++----------------
 sound/isa/sb/sb16.c      | 42 +++++---------------------
 sound/isa/sb/sb8.c       | 48 ++++++++----------------------
 sound/isa/sb/sb_common.c | 64 +++++++++-------------------------------
 6 files changed, 52 insertions(+), 192 deletions(-)

diff --git a/include/sound/emu8000.h b/include/sound/emu8000.h
index ad0365d6de5e..072791bbcf5c 100644
--- a/include/sound/emu8000.h
+++ b/include/sound/emu8000.h
@@ -56,9 +56,6 @@ struct snd_emu8000 {
 	unsigned long port1;	/* Port usually base+0 */
 	unsigned long port2;	/* Port usually at base+0x400 */
 	unsigned long port3;	/* Port usually at base+0x800 */
-	struct resource *res_port1;
-	struct resource *res_port2;
-	struct resource *res_port3;
 	unsigned short last_reg;/* Last register command */
 	spinlock_t reg_lock;
 
diff --git a/sound/isa/sb/emu8000.c b/sound/isa/sb/emu8000.c
index 5e4187940265..e02029677743 100644
--- a/sound/isa/sb/emu8000.c
+++ b/sound/isa/sb/emu8000.c
@@ -1048,27 +1048,6 @@ snd_emu8000_create_mixer(struct snd_card *card, struct snd_emu8000 *emu)
 	return err;
 }
 
-
-/*
- * free resources
- */
-static int snd_emu8000_free(struct snd_emu8000 *hw)
-{
-	release_and_free_resource(hw->res_port1);
-	release_and_free_resource(hw->res_port2);
-	release_and_free_resource(hw->res_port3);
-	kfree(hw);
-	return 0;
-}
-
-/*
- */
-static int snd_emu8000_dev_free(struct snd_device *device)
-{
-	struct snd_emu8000 *hw = device->device_data;
-	return snd_emu8000_free(hw);
-}
-
 /*
  * initialize and register emu8000 synth device.
  */
@@ -1079,9 +1058,6 @@ snd_emu8000_new(struct snd_card *card, int index, long port, int seq_ports,
 	struct snd_seq_device *awe;
 	struct snd_emu8000 *hw;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_emu8000_dev_free,
-	};
 
 	if (awe_ret)
 		*awe_ret = NULL;
@@ -1089,7 +1065,7 @@ snd_emu8000_new(struct snd_card *card, int index, long port, int seq_ports,
 	if (seq_ports <= 0)
 		return 0;
 
-	hw = kzalloc(sizeof(*hw), GFP_KERNEL);
+	hw = devm_kzalloc(card->dev, sizeof(*hw), GFP_KERNEL);
 	if (hw == NULL)
 		return -ENOMEM;
 	spin_lock_init(&hw->reg_lock);
@@ -1097,12 +1073,10 @@ snd_emu8000_new(struct snd_card *card, int index, long port, int seq_ports,
 	hw->port1 = port;
 	hw->port2 = port + 0x400;
 	hw->port3 = port + 0x800;
-	hw->res_port1 = request_region(hw->port1, 4, "Emu8000-1");
-	hw->res_port2 = request_region(hw->port2, 4, "Emu8000-2");
-	hw->res_port3 = request_region(hw->port3, 4, "Emu8000-3");
-	if (!hw->res_port1 || !hw->res_port2 || !hw->res_port3) {
+	if (!devm_request_region(card->dev, hw->port1, 4, "Emu8000-1") ||
+	    !devm_request_region(card->dev, hw->port2, 4, "Emu8000-2") ||
+	    !devm_request_region(card->dev, hw->port3, 4, "Emu8000-3")) {
 		snd_printk(KERN_ERR "sbawe: can't grab ports 0x%lx, 0x%lx, 0x%lx\n", hw->port1, hw->port2, hw->port3);
-		snd_emu8000_free(hw);
 		return -EBUSY;
 	}
 	hw->mem_size = 0;
@@ -1115,23 +1089,13 @@ snd_emu8000_new(struct snd_card *card, int index, long port, int seq_ports,
 	hw->fm_chorus_depth = 0;
 	hw->fm_reverb_depth = 0;
 
-	if (snd_emu8000_detect(hw) < 0) {
-		snd_emu8000_free(hw);
+	if (snd_emu8000_detect(hw) < 0)
 		return -ENODEV;
-	}
 
 	snd_emu8000_init_hw(hw);
 	err = snd_emu8000_create_mixer(card, hw);
-	if (err < 0) {
-		snd_emu8000_free(hw);
+	if (err < 0)
 		return err;
-	}
-	
-	err = snd_device_new(card, SNDRV_DEV_CODEC, hw, &ops);
-	if (err < 0) {
-		snd_emu8000_free(hw);
-		return err;
-	}
 #if IS_ENABLED(CONFIG_SND_SEQUENCER)
 	if (snd_seq_device_new(card, index, SNDRV_SEQ_DEV_ID_EMU8000,
 			       sizeof(struct snd_emu8000*), &awe) >= 0) {
diff --git a/sound/isa/sb/jazz16.c b/sound/isa/sb/jazz16.c
index 7ba5dd1ec810..64936c917170 100644
--- a/sound/isa/sb/jazz16.c
+++ b/sound/isa/sb/jazz16.c
@@ -226,8 +226,8 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 	static const int possible_dmas16[] = {5, 7, -1};
 	int err, xirq, xdma8, xdma16, xmpu_port, xmpu_irq;
 
-	err = snd_card_new(devptr, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct snd_card_jazz16), &card);
+	err = snd_devm_card_new(devptr, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_card_jazz16), &card);
 	if (err < 0)
 		return err;
 
@@ -238,8 +238,7 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 		xirq = snd_legacy_find_free_irq(possible_irqs);
 		if (xirq < 0) {
 			snd_printk(KERN_ERR "unable to find a free IRQ\n");
-			err = -EBUSY;
-			goto err_free;
+			return -EBUSY;
 		}
 	}
 	xdma8 = dma8[dev];
@@ -247,8 +246,7 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 		xdma8 = snd_legacy_find_free_dma(possible_dmas8);
 		if (xdma8 < 0) {
 			snd_printk(KERN_ERR "unable to find a free DMA8\n");
-			err = -EBUSY;
-			goto err_free;
+			return -EBUSY;
 		}
 	}
 	xdma16 = dma16[dev];
@@ -256,8 +254,7 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 		xdma16 = snd_legacy_find_free_dma(possible_dmas16);
 		if (xdma16 < 0) {
 			snd_printk(KERN_ERR "unable to find a free DMA16\n");
-			err = -EBUSY;
-			goto err_free;
+			return -EBUSY;
 		}
 	}
 
@@ -267,7 +264,7 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 	err = jazz16_detect_board(port[dev], xmpu_port);
 	if (err < 0) {
 		printk(KERN_ERR "Media Vision Jazz16 board not detected\n");
-		goto err_free;
+		return err;
 	}
 	err = snd_sbdsp_create(card, port[dev], irq[dev],
 			       jazz16_interrupt,
@@ -275,7 +272,7 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 			       SB_HW_JAZZ16,
 			       &chip);
 	if (err < 0)
-		goto err_free;
+		return err;
 
 	xmpu_irq = mpu_irq[dev];
 	if (xmpu_irq == SNDRV_AUTO_IRQ || mpu_port[dev] == SNDRV_AUTO_PORT)
@@ -283,7 +280,7 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 	err = jazz16_configure_board(chip, xmpu_irq);
 	if (err < 0) {
 		printk(KERN_ERR "Media Vision Jazz16 configuration failed\n");
-		goto err_free;
+		return err;
 	}
 
 	jazz16->chip = chip;
@@ -296,10 +293,10 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 
 	err = snd_sb8dsp_pcm(chip, 0);
 	if (err < 0)
-		goto err_free;
+		return err;
 	err = snd_sbmixer_new(chip);
 	if (err < 0)
-		goto err_free;
+		return err;
 
 	err = snd_opl3_create(card, chip->port, chip->port + 2,
 			      OPL3_HW_AUTO, 1, &opl3);
@@ -309,7 +306,7 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 	else {
 		err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
 		if (err < 0)
-			goto err_free;
+			return err;
 	}
 	if (mpu_port[dev] > 0 && mpu_port[dev] != SNDRV_AUTO_PORT) {
 		if (mpu_irq[dev] == SNDRV_AUTO_IRQ)
@@ -326,21 +323,10 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto err_free;
+		return err;
 
 	dev_set_drvdata(devptr, card);
 	return 0;
-
-err_free:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_jazz16_remove(struct device *devptr, unsigned int dev)
-{
-	struct snd_card *card = dev_get_drvdata(devptr);
-
-	snd_card_free(card);
 }
 
 #ifdef CONFIG_PM
@@ -372,7 +358,6 @@ static int snd_jazz16_resume(struct device *pdev, unsigned int n)
 static struct isa_driver snd_jazz16_driver = {
 	.match		= snd_jazz16_match,
 	.probe		= snd_jazz16_probe,
-	.remove		= snd_jazz16_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_jazz16_suspend,
 	.resume		= snd_jazz16_resume,
diff --git a/sound/isa/sb/sb16.c b/sound/isa/sb/sb16.c
index d0f797c02841..e89b095aa282 100644
--- a/sound/isa/sb/sb16.c
+++ b/sound/isa/sb/sb16.c
@@ -285,15 +285,6 @@ static int snd_card_sb16_pnp(int dev, struct snd_card_sb16 *acard,
 
 #endif /* CONFIG_PNP */
 
-static void snd_sb16_free(struct snd_card *card)
-{
-	struct snd_card_sb16 *acard = card->private_data;
-        
-	if (acard == NULL)
-		return;
-	release_and_free_resource(acard->fm_res);
-}
-
 #ifdef CONFIG_PNP
 #define is_isapnp_selected(dev)		isapnp[dev]
 #else
@@ -306,11 +297,10 @@ static int snd_sb16_card_new(struct device *devptr, int dev,
 	struct snd_card *card;
 	int err;
 
-	err = snd_card_new(devptr, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct snd_card_sb16), &card);
+	err = snd_devm_card_new(devptr, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_card_sb16), &card);
 	if (err < 0)
 		return err;
-	card->private_free = snd_sb16_free;
 	*cardp = card;
 	return 0;
 }
@@ -482,17 +472,16 @@ static int snd_sb16_isa_probe1(int dev, struct device *pdev)
 	/* non-PnP FM port address is hardwired with base port address */
 	fm_port[dev] = port[dev];
 	/* block the 0x388 port to avoid PnP conflicts */
-	acard->fm_res = request_region(0x388, 4, "SoundBlaster FM");
+	acard->fm_res = devm_request_region(card->dev, 0x388, 4,
+					    "SoundBlaster FM");
 #ifdef SNDRV_SBAWE_EMU8000
 	/* non-PnP AWE port address is hardwired with base port address */
 	awe_port[dev] = port[dev] + 0x400;
 #endif
 
 	err = snd_sb16_probe(card, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	dev_set_drvdata(pdev, card);
 	return 0;
 }
@@ -547,11 +536,6 @@ static int snd_sb16_isa_probe(struct device *pdev, unsigned int dev)
 	}
 }
 
-static void snd_sb16_isa_remove(struct device *pdev, unsigned int dev)
-{
-	snd_card_free(dev_get_drvdata(pdev));
-}
-
 #ifdef CONFIG_PM
 static int snd_sb16_isa_suspend(struct device *dev, unsigned int n,
 				pm_message_t state)
@@ -574,7 +558,6 @@ static int snd_sb16_isa_resume(struct device *dev, unsigned int n)
 static struct isa_driver snd_sb16_isa_driver = {
 	.match		= snd_sb16_isa_match,
 	.probe		= snd_sb16_isa_probe,
-	.remove		= snd_sb16_isa_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_sb16_isa_suspend,
 	.resume		= snd_sb16_isa_resume,
@@ -600,15 +583,11 @@ static int snd_sb16_pnp_detect(struct pnp_card_link *pcard,
 		if (res < 0)
 			return res;
 		res = snd_card_sb16_pnp(dev, card->private_data, pcard, pid);
-		if (res < 0) {
-			snd_card_free(card);
+		if (res < 0)
 			return res;
-		}
 		res = snd_sb16_probe(card, dev);
-		if (res < 0) {
-			snd_card_free(card);
+		if (res < 0)
 			return res;
-		}
 		pnp_set_card_drvdata(pcard, card);
 		dev++;
 		return 0;
@@ -617,12 +596,6 @@ static int snd_sb16_pnp_detect(struct pnp_card_link *pcard,
 	return -ENODEV;
 }
 
-static void snd_sb16_pnp_remove(struct pnp_card_link *pcard)
-{
-	snd_card_free(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
-}
-
 #ifdef CONFIG_PM
 static int snd_sb16_pnp_suspend(struct pnp_card_link *pcard, pm_message_t state)
 {
@@ -643,7 +616,6 @@ static struct pnp_card_driver sb16_pnpc_driver = {
 #endif
 	.id_table = snd_sb16_pnpids,
 	.probe = snd_sb16_pnp_detect,
-	.remove = snd_sb16_pnp_remove,
 #ifdef CONFIG_PM
 	.suspend = snd_sb16_pnp_suspend,
 	.resume = snd_sb16_pnp_resume,
diff --git a/sound/isa/sb/sb8.c b/sound/isa/sb/sb8.c
index b08e6e7690c9..e5ef1777161f 100644
--- a/sound/isa/sb/sb8.c
+++ b/sound/isa/sb/sb8.c
@@ -54,15 +54,6 @@ static irqreturn_t snd_sb8_interrupt(int irq, void *dev_id)
 	}
 }
 
-static void snd_sb8_free(struct snd_card *card)
-{
-	struct snd_sb8 *acard = card->private_data;
-
-	if (acard == NULL)
-		return;
-	release_and_free_resource(acard->fm_res);
-}
-
 static int snd_sb8_match(struct device *pdev, unsigned int dev)
 {
 	if (!enable[dev])
@@ -86,26 +77,26 @@ static int snd_sb8_probe(struct device *pdev, unsigned int dev)
 	struct snd_opl3 *opl3;
 	int err;
 
-	err = snd_card_new(pdev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct snd_sb8), &card);
+	err = snd_devm_card_new(pdev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_sb8), &card);
 	if (err < 0)
 		return err;
 	acard = card->private_data;
-	card->private_free = snd_sb8_free;
 
 	/*
 	 * Block the 0x388 port to avoid PnP conflicts.
 	 * No need to check this value after request_region,
 	 * as we never do anything with it.
 	 */
-	acard->fm_res = request_region(0x388, 4, "SoundBlaster FM");
+	acard->fm_res = devm_request_region(card->dev, 0x388, 4,
+					    "SoundBlaster FM");
 
 	if (port[dev] != SNDRV_AUTO_PORT) {
 		err = snd_sbdsp_create(card, port[dev], irq[dev],
 				       snd_sb8_interrupt, dma8[dev],
 				       -1, SB_HW_AUTO, &chip);
 		if (err < 0)
-			goto _err;
+			return err;
 	} else {
 		/* auto-probe legacy ports */
 		static const unsigned long possible_ports[] = {
@@ -125,10 +116,8 @@ static int snd_sb8_probe(struct device *pdev, unsigned int dev)
 				break;
 			}
 		}
-		if (i >= ARRAY_SIZE(possible_ports)) {
-			err = -EINVAL;
-			goto _err;
-		}
+		if (i >= ARRAY_SIZE(possible_ports))
+			return -EINVAL;
 	}
 	acard->chip = chip;
 			
@@ -139,17 +128,16 @@ static int snd_sb8_probe(struct device *pdev, unsigned int dev)
 		else
 			snd_printk(KERN_WARNING "SB 16 chip detected at 0x%lx, try snd-sb16 module\n",
 				   port[dev]);
-		err = -ENODEV;
-		goto _err;
+		return -ENODEV;
 	}
 
 	err = snd_sb8dsp_pcm(chip, 0);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	err = snd_sbmixer_new(chip);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	if (chip->hardware == SB_HW_10 || chip->hardware == SB_HW_20) {
 		err = snd_opl3_create(card, chip->port + 8, 0,
@@ -167,12 +155,12 @@ static int snd_sb8_probe(struct device *pdev, unsigned int dev)
 	if (err >= 0) {
 		err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
 		if (err < 0)
-			goto _err;
+			return err;
 	}
 
 	err = snd_sb8dsp_midi(chip, 0);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	strcpy(card->driver, chip->hardware == SB_HW_PRO ? "SB Pro" : "SB8");
 	strcpy(card->shortname, chip->name);
@@ -183,19 +171,10 @@ static int snd_sb8_probe(struct device *pdev, unsigned int dev)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	dev_set_drvdata(pdev, card);
 	return 0;
-
- _err:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_sb8_remove(struct device *pdev, unsigned int dev)
-{
-	snd_card_free(dev_get_drvdata(pdev));
 }
 
 #ifdef CONFIG_PM
@@ -229,7 +208,6 @@ static int snd_sb8_resume(struct device *dev, unsigned int n)
 static struct isa_driver snd_sb8_driver = {
 	.match		= snd_sb8_match,
 	.probe		= snd_sb8_probe,
-	.remove		= snd_sb8_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_sb8_suspend,
 	.resume		= snd_sb8_resume,
diff --git a/sound/isa/sb/sb_common.c b/sound/isa/sb/sb_common.c
index 57121218ed24..c0e319d14210 100644
--- a/sound/isa/sb/sb_common.c
+++ b/sound/isa/sb/sb_common.c
@@ -168,31 +168,6 @@ static int snd_sbdsp_probe(struct snd_sb * chip)
 	return 0;
 }
 
-static int snd_sbdsp_free(struct snd_sb *chip)
-{
-	release_and_free_resource(chip->res_port);
-	if (chip->irq >= 0)
-		free_irq(chip->irq, (void *) chip);
-#ifdef CONFIG_ISA
-	if (chip->dma8 >= 0) {
-		disable_dma(chip->dma8);
-		free_dma(chip->dma8);
-	}
-	if (chip->dma16 >= 0 && chip->dma16 != chip->dma8) {
-		disable_dma(chip->dma16);
-		free_dma(chip->dma16);
-	}
-#endif
-	kfree(chip);
-	return 0;
-}
-
-static int snd_sbdsp_dev_free(struct snd_device *device)
-{
-	struct snd_sb *chip = device->device_data;
-	return snd_sbdsp_free(chip);
-}
-
 int snd_sbdsp_create(struct snd_card *card,
 		     unsigned long port,
 		     int irq,
@@ -204,15 +179,12 @@ int snd_sbdsp_create(struct snd_card *card,
 {
 	struct snd_sb *chip;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_sbdsp_dev_free,
-	};
 
 	if (snd_BUG_ON(!r_chip))
 		return -EINVAL;
 	*r_chip = NULL;
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL)
+	chip = devm_kzalloc(card->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
 		return -ENOMEM;
 	spin_lock_init(&chip->reg_lock);
 	spin_lock_init(&chip->open_lock);
@@ -223,13 +195,12 @@ int snd_sbdsp_create(struct snd_card *card,
 	chip->dma16 = -1;
 	chip->port = port;
 	
-	if (request_irq(irq, irq_handler,
-			(hardware == SB_HW_ALS4000 ||
-			 hardware == SB_HW_CS5530) ?
-			IRQF_SHARED : 0,
-			"SoundBlaster", (void *) chip)) {
+	if (devm_request_irq(card->dev, irq, irq_handler,
+			     (hardware == SB_HW_ALS4000 ||
+			      hardware == SB_HW_CS5530) ?
+			     IRQF_SHARED : 0,
+			     "SoundBlaster", (void *) chip)) {
 		snd_printk(KERN_ERR "sb: can't grab irq %d\n", irq);
-		snd_sbdsp_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = irq;
@@ -238,17 +209,17 @@ int snd_sbdsp_create(struct snd_card *card,
 	if (hardware == SB_HW_ALS4000)
 		goto __skip_allocation;
 	
-	chip->res_port = request_region(port, 16, "SoundBlaster");
+	chip->res_port = devm_request_region(card->dev, port, 16,
+					     "SoundBlaster");
 	if (!chip->res_port) {
 		snd_printk(KERN_ERR "sb: can't grab port 0x%lx\n", port);
-		snd_sbdsp_free(chip);
 		return -EBUSY;
 	}
 
 #ifdef CONFIG_ISA
-	if (dma8 >= 0 && request_dma(dma8, "SoundBlaster - 8bit")) {
+	if (dma8 >= 0 && snd_devm_request_dma(card->dev, dma8,
+					      "SoundBlaster - 8bit")) {
 		snd_printk(KERN_ERR "sb: can't grab DMA8 %d\n", dma8);
-		snd_sbdsp_free(chip);
 		return -EBUSY;
 	}
 	chip->dma8 = dma8;
@@ -256,9 +227,9 @@ int snd_sbdsp_create(struct snd_card *card,
 		if (hardware != SB_HW_ALS100 && (dma16 < 5 || dma16 > 7)) {
 			/* no duplex */
 			dma16 = -1;
-		} else if (request_dma(dma16, "SoundBlaster - 16bit")) {
+		} else if (snd_devm_request_dma(card->dev, dma16,
+						"SoundBlaster - 16bit")) {
 			snd_printk(KERN_ERR "sb: can't grab DMA16 %d\n", dma16);
-			snd_sbdsp_free(chip);
 			return -EBUSY;
 		}
 	}
@@ -269,15 +240,8 @@ int snd_sbdsp_create(struct snd_card *card,
 	chip->card = card;
 	chip->hardware = hardware;
 	err = snd_sbdsp_probe(chip);
-	if (err < 0) {
-		snd_sbdsp_free(chip);
+	if (err < 0)
 		return err;
-	}
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_sbdsp_free(chip);
-		return err;
-	}
 	*r_chip = chip;
 	return 0;
 }
-- 
2.26.2

