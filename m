Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990A3C727D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:42:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E497516BF;
	Tue, 13 Jul 2021 16:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E497516BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187361;
	bh=sHIR08Mko5aqAFDK2v1fO++ZSkbY5az2cwuZE5ZeH08=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k1Pn+oySqI9clh5AF/NW+eNwWRt3pU/bqaltFIOTMiC0iFuLCNFXxV9ZSClB55Y/a
	 TDY7B+ge/NsBPSCNhsxDE3ftlbzUqRqig27srsyjhiBJR6XOT3UJxQWNSmIQLfbjAa
	 Zp76NTkTGMggfheEAfDelkUA5ll/X2C1X6BaMl20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37C8EF805EA;
	Tue, 13 Jul 2021 16:30:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A840F80589; Tue, 13 Jul 2021 16:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2BB9F804E4
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2BB9F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="OqqMOclN"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Q4M0rnq1"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id CE792201DA
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYNMLnMB9P6I3mbO8R7ch4mYTYPhttm8XxCijns5qW8=;
 b=OqqMOclN1K9I2EBQiiej76oq9ehQRPOaNKuTQ56Nb9dF0YuwlFnGt2eHRqYPvW6FEbmsyr
 A3WOHgwUH2CjBR5ZhO1T1Cm2QqDUd287YOXamf0DPmY9oFkUoKhZn5wIXbLTYKAl2B7ns1
 U/svTGm5+FjWcj/sT/S4ixOwLOVJKkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYNMLnMB9P6I3mbO8R7ch4mYTYPhttm8XxCijns5qW8=;
 b=Q4M0rnq1fj9bpVgZFShOHW0kf3S1U8XgWwCySGLOZ+YFa0fs/kkjQRfiIh/oj/whGQN/RK
 aA7Zk9g+/LBlnpCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id BCE88A3B8A;
 Tue, 13 Jul 2021 14:29:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 29/51] ALSA: cs46xx: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:28:35 +0200
Message-Id: <20210713142857.19654-30-tiwai@suse.de>
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

This patch converts the resource management in PCI cs46xx driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs46xx/cs46xx.c     |  51 ++++------------
 sound/pci/cs46xx/cs46xx.h     |   4 +-
 sound/pci/cs46xx/cs46xx_lib.c | 109 +++++++---------------------------
 3 files changed, 36 insertions(+), 128 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx.c b/sound/pci/cs46xx/cs46xx.c
index 358ca84cbdea..bd60308769ff 100644
--- a/sound/pci/cs46xx/cs46xx.c
+++ b/sound/pci/cs46xx/cs46xx.c
@@ -66,61 +66,44 @@ static int snd_card_cs46xx_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 	err = snd_cs46xx_create(card, pci,
-				external_amp[dev], thinkpad[dev],
-				&chip);
-	if (err < 0) {
-		snd_card_free(card);
+				external_amp[dev], thinkpad[dev]);
+	if (err < 0)
 		return err;
-	}
 	card->private_data = chip;
 	chip->accept_valid = mmap_valid[dev];
 	err = snd_cs46xx_pcm(chip, 0);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 	err = snd_cs46xx_pcm_rear(chip, 1);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_cs46xx_pcm_iec958(chip, 2);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 #endif
 	err = snd_cs46xx_mixer(chip, 2);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 	if (chip->nr_ac97_codecs ==2) {
 		err = snd_cs46xx_pcm_center_lfe(chip, 3);
-		if (err < 0) {
-			snd_card_free(card);
+		if (err < 0)
 			return err;
-		}
 	}
 #endif
 	err = snd_cs46xx_midi(chip, 0);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_cs46xx_start_dsp(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
-
 
 	snd_cs46xx_gameport(chip);
 
@@ -133,26 +116,18 @@ static int snd_card_cs46xx_probe(struct pci_dev *pci,
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
 
-static void snd_card_cs46xx_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 static struct pci_driver cs46xx_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_cs46xx_ids,
 	.probe = snd_card_cs46xx_probe,
-	.remove = snd_card_cs46xx_remove,
 #ifdef CONFIG_PM_SLEEP
 	.driver = {
 		.pm = &snd_cs46xx_pm,
diff --git a/sound/pci/cs46xx/cs46xx.h b/sound/pci/cs46xx/cs46xx.h
index b275df883d06..c4f0a0b94270 100644
--- a/sound/pci/cs46xx/cs46xx.h
+++ b/sound/pci/cs46xx/cs46xx.h
@@ -1635,7 +1635,6 @@ struct snd_cs46xx_region {
 	unsigned long base;
 	void __iomem *remap_addr;
 	unsigned long size;
-	struct resource *resource;
 };
 
 struct snd_cs46xx {
@@ -1718,8 +1717,7 @@ struct snd_cs46xx {
 
 int snd_cs46xx_create(struct snd_card *card,
 		      struct pci_dev *pci,
-		      int external_amp, int thinkpad,
-		      struct snd_cs46xx **rcodec);
+		      int external_amp, int thinkpad);
 extern const struct dev_pm_ops snd_cs46xx_pm;
 
 int snd_cs46xx_pcm(struct snd_cs46xx *chip, int device);
diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 1e1eb17f8e07..d5b4ae58e7bd 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -1865,13 +1865,6 @@ int snd_cs46xx_pcm_iec958(struct snd_cs46xx *chip, int device)
 /*
  *  Mixer routines
  */
-static void snd_cs46xx_mixer_free_ac97_bus(struct snd_ac97_bus *bus)
-{
-	struct snd_cs46xx *chip = bus->private_data;
-
-	chip->ac97_bus = NULL;
-}
-
 static void snd_cs46xx_mixer_free_ac97(struct snd_ac97 *ac97)
 {
 	struct snd_cs46xx *chip = ac97->private_data;
@@ -2487,7 +2480,6 @@ int snd_cs46xx_mixer(struct snd_cs46xx *chip, int spdif_device)
 	err = snd_ac97_bus(card, 0, &ops, chip, &chip->ac97_bus);
 	if (err < 0)
 		return err;
-	chip->ac97_bus->private_free = snd_cs46xx_mixer_free_ac97_bus;
 
 	if (cs46xx_detect_codec(chip, CS46XX_PRIMARY_CODEC_INDEX) < 0)
 		return -ENXIO;
@@ -2913,13 +2905,11 @@ static void snd_cs46xx_hw_stop(struct snd_cs46xx *chip)
 }
 
 
-static int snd_cs46xx_free(struct snd_cs46xx *chip)
+static void snd_cs46xx_free(struct snd_card *card)
 {
+	struct snd_cs46xx *chip = card->private_data;
 	int idx;
 
-	if (snd_BUG_ON(!chip))
-		return -EINVAL;
-
 	if (chip->active_ctrl)
 		chip->active_ctrl(chip, 1);
 
@@ -2930,22 +2920,11 @@ static int snd_cs46xx_free(struct snd_cs46xx *chip)
 	
 	snd_cs46xx_proc_done(chip);
 
-	if (chip->region.idx[0].resource)
-		snd_cs46xx_hw_stop(chip);
-
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
+	snd_cs46xx_hw_stop(chip);
 
 	if (chip->active_ctrl)
 		chip->active_ctrl(chip, -chip->amplifier);
 
-	for (idx = 0; idx < 5; idx++) {
-		struct snd_cs46xx_region *region = &chip->region.idx[idx];
-
-		iounmap(region->remap_addr);
-		release_and_free_resource(region->resource);
-	}
-
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 	if (chip->dsp_spos_instance) {
 		cs46xx_dsp_spos_destroy(chip);
@@ -2956,20 +2935,6 @@ static int snd_cs46xx_free(struct snd_cs46xx *chip)
 #else
 	vfree(chip->ba1);
 #endif
-	
-#ifdef CONFIG_PM_SLEEP
-	kfree(chip->saved_regs);
-#endif
-
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
-}
-
-static int snd_cs46xx_dev_free(struct snd_device *device)
-{
-	struct snd_cs46xx *chip = device->device_data;
-	return snd_cs46xx_free(chip);
 }
 
 /*
@@ -3868,30 +3833,19 @@ SIMPLE_DEV_PM_OPS(snd_cs46xx_pm, snd_cs46xx_suspend, snd_cs46xx_resume);
 
 int snd_cs46xx_create(struct snd_card *card,
 		      struct pci_dev *pci,
-		      int external_amp, int thinkpad,
-		      struct snd_cs46xx **rchip)
+		      int external_amp, int thinkpad)
 {
-	struct snd_cs46xx *chip;
+	struct snd_cs46xx *chip = card->private_data;
 	int err, idx;
 	struct snd_cs46xx_region *region;
 	struct cs_card_type *cp;
 	u16 ss_card, ss_vendor;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_cs46xx_dev_free,
-	};
 	
-	*rchip = NULL;
-
 	/* enable PCI device */
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
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 	mutex_init(&chip->spos_mutex);
@@ -3899,6 +3853,10 @@ int snd_cs46xx_create(struct snd_card *card,
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
+
+	err = pci_request_regions(pci, "CS46xx");
+	if (err < 0)
+		return err;
 	chip->ba0_addr = pci_resource_start(pci, 0);
 	chip->ba1_addr = pci_resource_start(pci, 1);
 	if (chip->ba0_addr == 0 || chip->ba0_addr == (unsigned long)~0 ||
@@ -3906,7 +3864,6 @@ int snd_cs46xx_create(struct snd_card *card,
 		dev_err(chip->card->dev,
 			"wrong address(es) - ba0 = 0x%lx, ba1 = 0x%lx\n",
 			   chip->ba0_addr, chip->ba1_addr);
-	    	snd_cs46xx_free(chip);
 	    	return -ENOMEM;
 	}
 
@@ -3978,67 +3935,45 @@ int snd_cs46xx_create(struct snd_card *card,
 
 	for (idx = 0; idx < 5; idx++) {
 		region = &chip->region.idx[idx];
-		region->resource = request_mem_region(region->base, region->size,
-						      region->name);
-		if (!region->resource) {
-			dev_err(chip->card->dev,
-				"unable to request memory region 0x%lx-0x%lx\n",
-				   region->base, region->base + region->size - 1);
-			snd_cs46xx_free(chip);
-			return -EBUSY;
-		}
-		region->remap_addr = ioremap(region->base, region->size);
+		region->remap_addr = devm_ioremap(&pci->dev, region->base,
+						  region->size);
 		if (region->remap_addr == NULL) {
 			dev_err(chip->card->dev,
 				"%s ioremap problem\n", region->name);
-			snd_cs46xx_free(chip);
 			return -ENOMEM;
 		}
 	}
 
-	if (request_irq(pci->irq, snd_cs46xx_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, chip)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_cs46xx_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
 		dev_err(chip->card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_cs46xx_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_cs46xx_free;
 
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 	chip->dsp_spos_instance = cs46xx_dsp_spos_create(chip);
-	if (chip->dsp_spos_instance == NULL) {
-		snd_cs46xx_free(chip);
+	if (!chip->dsp_spos_instance)
 		return -ENOMEM;
-	}
 #endif
 
 	err = snd_cs46xx_chip_init(chip);
-	if (err < 0) {
-		snd_cs46xx_free(chip);
-		return err;
-	}
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_cs46xx_free(chip);
+	if (err < 0)
 		return err;
-	}
 	
 	snd_cs46xx_proc_init(card, chip);
 
 #ifdef CONFIG_PM_SLEEP
-	chip->saved_regs = kmalloc_array(ARRAY_SIZE(saved_regs),
-					 sizeof(*chip->saved_regs),
-					 GFP_KERNEL);
-	if (!chip->saved_regs) {
-		snd_cs46xx_free(chip);
+	chip->saved_regs = devm_kmalloc_array(&pci->dev,
+					      ARRAY_SIZE(saved_regs),
+					      sizeof(*chip->saved_regs),
+					      GFP_KERNEL);
+	if (!chip->saved_regs)
 		return -ENOMEM;
-	}
 #endif
 
 	chip->active_ctrl(chip, -1); /* disable CLKRUN */
-
-	*rchip = chip;
 	return 0;
 }
-- 
2.26.2

