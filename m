Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 264F23C9A71
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC070175A;
	Thu, 15 Jul 2021 10:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC070175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337316;
	bh=leC9hgDjkXiJVunPaREytezWH6Bv1WE2rEOjnOhH7Tw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jFVl92y6tWHnChi4mhLv5ubXfxVZibrfnjkcsLDpePUF4agYP3YKKVYaYfKpYe9sS
	 5z9fXtzaRbAefbRYtYYF/mTCo63Ek8rop+k6sIFe4UD9MF5LZ7PpifNgZ6xJa8T0+r
	 TEmZ+PsU8PBqacW74ZZUZu5naZvfVTPIBZ14Emk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBDE1F8073C;
	Thu, 15 Jul 2021 10:01:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06C10F80714; Thu, 15 Jul 2021 10:01:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D8FAF8053E
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D8FAF8053E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="QlWRRoA9"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="S7Hp3tg6"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 315361FDE5
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6rZ6pOlZew0R2Yyj8RoZrrzWfRNG6rdH5eF8fLndoIo=;
 b=QlWRRoA9rd5+SQQwVV+BkMngrhgTlKVNOUbXOZ5pQd0HpW6T+snPyPViFOwPRR2fP+O6Au
 L4JICReCBcxUQf5G7jic4kru252gp3O611n/HtAzivkpNauNfM5KnX+EDUKyXcRQZLMotP
 HicYGlSNPdaukwZovMIAqwjnQxbzLKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336014;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6rZ6pOlZew0R2Yyj8RoZrrzWfRNG6rdH5eF8fLndoIo=;
 b=S7Hp3tg6DUXWt7EyOSp8VjDMSwtW4zpaUp5TEQN4LYlR/n4JEdt4MgCNJOhAu2/f+vhHuZ
 TKm1lLR3mUqQ1fBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 2819FA3B8F;
 Thu, 15 Jul 2021 08:00:14 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 51/79] ALSA: ymfpci: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:13 +0200
Message-Id: <20210715075941.23332-52-tiwai@suse.de>
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

This patch converts the resource management in PCI ymfpci driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, the page allocations are done
with the devres helper, and the card object release is managed now via
card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ymfpci/ymfpci.c      |  66 ++++++---------
 sound/pci/ymfpci/ymfpci.h      |   8 +-
 sound/pci/ymfpci/ymfpci_main.c | 149 +++++++++++----------------------
 3 files changed, 74 insertions(+), 149 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci.c b/sound/pci/ymfpci/ymfpci.c
index 7e32d57147ff..1e198e4d57b8 100644
--- a/sound/pci/ymfpci/ymfpci.c
+++ b/sound/pci/ymfpci/ymfpci.c
@@ -105,7 +105,8 @@ static int snd_ymfpci_create_gameport(struct snd_ymfpci *chip, int dev,
 	}
 
 	if (!r) {
-		r = request_region(io_port, 1, "YMFPCI gameport");
+		r = devm_request_region(&chip->pci->dev, io_port, 1,
+					"YMFPCI gameport");
 		if (!r) {
 			dev_err(chip->card->dev,
 				"joystick port %#x is in use.\n", io_port);
@@ -117,7 +118,6 @@ static int snd_ymfpci_create_gameport(struct snd_ymfpci *chip, int dev,
 	if (!gp) {
 		dev_err(chip->card->dev,
 			"cannot allocate memory for gameport\n");
-		release_and_free_resource(r);
 		return -ENOMEM;
 	}
 
@@ -126,7 +126,6 @@ static int snd_ymfpci_create_gameport(struct snd_ymfpci *chip, int dev,
 	gameport_set_phys(gp, "pci%s/gameport0", pci_name(chip->pci));
 	gameport_set_dev_parent(gp, &chip->pci->dev);
 	gp->io = io_port;
-	gameport_set_port_data(gp, r);
 
 	if (chip->pci->device >= 0x0010) /* YMF 744/754 */
 		pci_write_config_word(chip->pci, PCIR_DSXG_JOYBASE, io_port);
@@ -142,12 +141,8 @@ static int snd_ymfpci_create_gameport(struct snd_ymfpci *chip, int dev,
 void snd_ymfpci_free_gameport(struct snd_ymfpci *chip)
 {
 	if (chip->gameport) {
-		struct resource *r = gameport_get_port_data(chip->gameport);
-
 		gameport_unregister_port(chip->gameport);
 		chip->gameport = NULL;
-
-		release_and_free_resource(r);
 	}
 }
 #else
@@ -176,9 +171,10 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 	}
 
 	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+			   sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
 	switch (pci_id->device) {
 	case 0x0004: str = "YMF724";  model = "DS-1"; break;
@@ -199,7 +195,8 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 			fm_port[dev] = pci_resource_start(pci, 1);
 		}
 		if (fm_port[dev] > 0)
-			fm_res = request_region(fm_port[dev], 4, "YMFPCI OPL3");
+			fm_res = devm_request_region(&pci->dev, fm_port[dev],
+						     4, "YMFPCI OPL3");
 		if (fm_res) {
 			legacy_ctrl |= YMFPCI_LEGACY_FMEN;
 			pci_write_config_word(pci, PCIR_DSXG_FMBASE, fm_port[dev]);
@@ -209,7 +206,8 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 			mpu_port[dev] = pci_resource_start(pci, 1) + 0x20;
 		}
 		if (mpu_port[dev] > 0)
-			mpu_res = request_region(mpu_port[dev], 2, "YMFPCI MPU401");
+			mpu_res = devm_request_region(&pci->dev, mpu_port[dev],
+						      2, "YMFPCI MPU401");
 		if (mpu_res) {
 			legacy_ctrl |= YMFPCI_LEGACY_MEN;
 			pci_write_config_word(pci, PCIR_DSXG_MPU401BASE, mpu_port[dev]);
@@ -223,7 +221,8 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 		default: fm_port[dev] = 0; break;
 		}
 		if (fm_port[dev] > 0)
-			fm_res = request_region(fm_port[dev], 4, "YMFPCI OPL3");
+			fm_res = devm_request_region(&pci->dev, fm_port[dev],
+						     4, "YMFPCI OPL3");
 		if (fm_res) {
 			legacy_ctrl |= YMFPCI_LEGACY_FMEN;
 		} else {
@@ -238,7 +237,8 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 		default: mpu_port[dev] = 0; break;
 		}
 		if (mpu_port[dev] > 0)
-			mpu_res = request_region(mpu_port[dev], 2, "YMFPCI MPU401");
+			mpu_res = devm_request_region(&pci->dev, mpu_port[dev],
+						      2, "YMFPCI MPU401");
 		if (mpu_res) {
 			legacy_ctrl |= YMFPCI_LEGACY_MEN;
 		} else {
@@ -253,15 +253,9 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 	pci_read_config_word(pci, PCIR_DSXG_LEGACY, &old_legacy_ctrl);
 	pci_write_config_word(pci, PCIR_DSXG_LEGACY, legacy_ctrl);
 	pci_write_config_word(pci, PCIR_DSXG_ELEGACY, legacy_ctrl2);
-	err = snd_ymfpci_create(card, pci, old_legacy_ctrl, &chip);
-	if (err  < 0) {
-		release_and_free_resource(mpu_res);
-		release_and_free_resource(fm_res);
-		goto free_card;
-	}
-	chip->fm_res = fm_res;
-	chip->mpu_res = mpu_res;
-	card->private_data = chip;
+	err = snd_ymfpci_create(card, pci, old_legacy_ctrl);
+	if (err  < 0)
+		return err;
 
 	strcpy(card->driver, str);
 	sprintf(card->shortname, "Yamaha %s (%s)", model, str);
@@ -271,30 +265,30 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 		chip->irq);
 	err = snd_ymfpci_pcm(chip, 0);
 	if (err < 0)
-		goto free_card;
+		return err;
 
 	err = snd_ymfpci_pcm_spdif(chip, 1);
 	if (err < 0)
-		goto free_card;
+		return err;
 
 	err = snd_ymfpci_mixer(chip, rear_switch[dev]);
 	if (err < 0)
-		goto free_card;
+		return err;
 
 	if (chip->ac97->ext_id & AC97_EI_SDAC) {
 		err = snd_ymfpci_pcm_4ch(chip, 2);
 		if (err < 0)
-			goto free_card;
+			return err;
 
 		err = snd_ymfpci_pcm2(chip, 3);
 		if (err < 0)
-			goto free_card;
+			return err;
 	}
 	err = snd_ymfpci_timer(chip, 0);
 	if (err < 0)
-		goto free_card;
+		return err;
 
-	if (chip->mpu_res) {
+	if (mpu_res) {
 		err = snd_mpu401_uart_new(card, 0, MPU401_HW_YMFPCI,
 					  mpu_port[dev],
 					  MPU401_INFO_INTEGRATED |
@@ -308,7 +302,7 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 			pci_write_config_word(pci, PCIR_DSXG_LEGACY, legacy_ctrl);
 		}
 	}
-	if (chip->fm_res) {
+	if (fm_res) {
 		err = snd_opl3_create(card,
 				      fm_port[dev],
 				      fm_port[dev] + 2,
@@ -323,7 +317,7 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 			err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
 			if (err < 0) {
 				dev_err(card->dev, "cannot create opl3 hwdep\n");
-				goto free_card;
+				return err;
 			}
 		}
 	}
@@ -332,27 +326,17 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto free_card;
+		return err;
 
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
-
-free_card:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_card_ymfpci_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 static struct pci_driver ymfpci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_ymfpci_ids,
 	.probe = snd_card_ymfpci_probe,
-	.remove = snd_card_ymfpci_remove,
 #ifdef CONFIG_PM_SLEEP
 	.driver = {
 		.pm = &snd_ymfpci_pm,
diff --git a/sound/pci/ymfpci/ymfpci.h b/sound/pci/ymfpci/ymfpci.h
index c73d8a5f4d0b..66968776478a 100644
--- a/sound/pci/ymfpci/ymfpci.h
+++ b/sound/pci/ymfpci/ymfpci.h
@@ -275,16 +275,13 @@ struct snd_ymfpci {
 	unsigned char rev;	/* PCI revision */
 	unsigned long reg_area_phys;
 	void __iomem *reg_area_virt;
-	struct resource *res_reg_area;
-	struct resource *fm_res;
-	struct resource *mpu_res;
 
 	unsigned short old_legacy_ctrl;
 #ifdef SUPPORT_JOYSTICK
 	struct gameport *gameport;
 #endif
 
-	struct snd_dma_buffer work_ptr;
+	struct snd_dma_buffer *work_ptr;
 
 	unsigned int bank_size_playback;
 	unsigned int bank_size_capture;
@@ -358,8 +355,7 @@ struct snd_ymfpci {
 
 int snd_ymfpci_create(struct snd_card *card,
 		      struct pci_dev *pci,
-		      unsigned short old_legacy_ctrl,
-		      struct snd_ymfpci ** rcodec);
+		      unsigned short old_legacy_ctrl);
 void snd_ymfpci_free_gameport(struct snd_ymfpci *chip);
 
 extern const struct dev_pm_ops snd_ymfpci_pm;
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 8fd060769882..c80114c0ad7b 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -2116,11 +2116,12 @@ static int snd_ymfpci_memalloc(struct snd_ymfpci *chip)
 	       chip->work_size;
 	/* work_ptr must be aligned to 256 bytes, but it's already
 	   covered with the kernel page allocation mechanism */
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
-				size, &chip->work_ptr) < 0) 
+	chip->work_ptr = snd_devm_alloc_pages(&chip->pci->dev,
+					      SNDRV_DMA_TYPE_DEV, size);
+	if (!chip->work_ptr)
 		return -ENOMEM;
-	ptr = chip->work_ptr.area;
-	ptr_addr = chip->work_ptr.addr;
+	ptr = chip->work_ptr->area;
+	ptr_addr = chip->work_ptr->addr;
 	memset(ptr, 0, size);	/* for sure */
 
 	chip->bank_base_playback = ptr;
@@ -2165,7 +2166,7 @@ static int snd_ymfpci_memalloc(struct snd_ymfpci *chip)
 	chip->work_base_addr = ptr_addr;
 	
 	snd_BUG_ON(ptr + chip->work_size !=
-		   chip->work_ptr.area + chip->work_ptr.bytes);
+		   chip->work_ptr->area + chip->work_ptr->bytes);
 
 	snd_ymfpci_writel(chip, YDSXGR_PLAYCTRLBASE, chip->bank_base_playback_addr);
 	snd_ymfpci_writel(chip, YDSXGR_RECCTRLBASE, chip->bank_base_capture_addr);
@@ -2196,65 +2197,32 @@ static int snd_ymfpci_memalloc(struct snd_ymfpci *chip)
 	return 0;
 }
 
-static int snd_ymfpci_free(struct snd_ymfpci *chip)
+static void snd_ymfpci_free(struct snd_card *card)
 {
+	struct snd_ymfpci *chip = card->private_data;
 	u16 ctrl;
 
-	if (snd_BUG_ON(!chip))
-		return -EINVAL;
-
-	if (chip->res_reg_area) {	/* don't touch busy hardware */
-		snd_ymfpci_writel(chip, YDSXGR_NATIVEDACOUTVOL, 0);
-		snd_ymfpci_writel(chip, YDSXGR_BUF441OUTVOL, 0);
-		snd_ymfpci_writel(chip, YDSXGR_LEGACYOUTVOL, 0);
-		snd_ymfpci_writel(chip, YDSXGR_STATUS, ~0);
-		snd_ymfpci_disable_dsp(chip);
-		snd_ymfpci_writel(chip, YDSXGR_PLAYCTRLBASE, 0);
-		snd_ymfpci_writel(chip, YDSXGR_RECCTRLBASE, 0);
-		snd_ymfpci_writel(chip, YDSXGR_EFFCTRLBASE, 0);
-		snd_ymfpci_writel(chip, YDSXGR_WORKBASE, 0);
-		snd_ymfpci_writel(chip, YDSXGR_WORKSIZE, 0);
-		ctrl = snd_ymfpci_readw(chip, YDSXGR_GLOBALCTRL);
-		snd_ymfpci_writew(chip, YDSXGR_GLOBALCTRL, ctrl & ~0x0007);
-	}
+	snd_ymfpci_writel(chip, YDSXGR_NATIVEDACOUTVOL, 0);
+	snd_ymfpci_writel(chip, YDSXGR_BUF441OUTVOL, 0);
+	snd_ymfpci_writel(chip, YDSXGR_LEGACYOUTVOL, 0);
+	snd_ymfpci_writel(chip, YDSXGR_STATUS, ~0);
+	snd_ymfpci_disable_dsp(chip);
+	snd_ymfpci_writel(chip, YDSXGR_PLAYCTRLBASE, 0);
+	snd_ymfpci_writel(chip, YDSXGR_RECCTRLBASE, 0);
+	snd_ymfpci_writel(chip, YDSXGR_EFFCTRLBASE, 0);
+	snd_ymfpci_writel(chip, YDSXGR_WORKBASE, 0);
+	snd_ymfpci_writel(chip, YDSXGR_WORKSIZE, 0);
+	ctrl = snd_ymfpci_readw(chip, YDSXGR_GLOBALCTRL);
+	snd_ymfpci_writew(chip, YDSXGR_GLOBALCTRL, ctrl & ~0x0007);
 
 	snd_ymfpci_ac3_done(chip);
 
-	/* Set PCI device to D3 state */
-#if 0
-	/* FIXME: temporarily disabled, otherwise we cannot fire up
-	 * the chip again unless reboot.  ACPI bug?
-	 */
-	pci_set_power_state(chip->pci, PCI_D3hot);
-#endif
-
-#ifdef CONFIG_PM_SLEEP
-	kfree(chip->saved_regs);
-#endif
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
-	release_and_free_resource(chip->mpu_res);
-	release_and_free_resource(chip->fm_res);
 	snd_ymfpci_free_gameport(chip);
-	iounmap(chip->reg_area_virt);
-	if (chip->work_ptr.area)
-		snd_dma_free_pages(&chip->work_ptr);
 	
-	release_and_free_resource(chip->res_reg_area);
-
 	pci_write_config_word(chip->pci, 0x40, chip->old_legacy_ctrl);
 	
-	pci_disable_device(chip->pci);
 	release_firmware(chip->dsp_microcode);
 	release_firmware(chip->controller_microcode);
-	kfree(chip);
-	return 0;
-}
-
-static int snd_ymfpci_dev_free(struct snd_device *device)
-{
-	struct snd_ymfpci *chip = device->device_data;
-	return snd_ymfpci_free(chip);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -2346,27 +2314,16 @@ SIMPLE_DEV_PM_OPS(snd_ymfpci_pm, snd_ymfpci_suspend, snd_ymfpci_resume);
 
 int snd_ymfpci_create(struct snd_card *card,
 		      struct pci_dev *pci,
-		      unsigned short old_legacy_ctrl,
-		      struct snd_ymfpci **rchip)
+		      unsigned short old_legacy_ctrl)
 {
-	struct snd_ymfpci *chip;
+	struct snd_ymfpci *chip = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_ymfpci_dev_free,
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
 	chip->old_legacy_ctrl = old_legacy_ctrl;
 	spin_lock_init(&chip->reg_lock);
 	spin_lock_init(&chip->voice_lock);
@@ -2377,71 +2334,59 @@ int snd_ymfpci_create(struct snd_card *card,
 	chip->irq = -1;
 	chip->device_id = pci->device;
 	chip->rev = pci->revision;
-	chip->reg_area_phys = pci_resource_start(pci, 0);
-	chip->reg_area_virt = ioremap(chip->reg_area_phys, 0x8000);
-	pci_set_master(pci);
-	chip->src441_used = -1;
 
-	chip->res_reg_area = request_mem_region(chip->reg_area_phys, 0x8000, "YMFPCI");
-	if (!chip->res_reg_area) {
+	err = pci_request_regions(pci, "YMFPCI");
+	if (err < 0)
+		return err;
+
+	chip->reg_area_phys = pci_resource_start(pci, 0);
+	chip->reg_area_virt = devm_ioremap(&pci->dev, chip->reg_area_phys, 0x8000);
+	if (!chip->reg_area_virt) {
 		dev_err(chip->card->dev,
 			"unable to grab memory region 0x%lx-0x%lx\n",
 			chip->reg_area_phys, chip->reg_area_phys + 0x8000 - 1);
-		err = -EBUSY;
-		goto free_chip;
+		return -EBUSY;
 	}
-	if (request_irq(pci->irq, snd_ymfpci_interrupt, IRQF_SHARED,
+	pci_set_master(pci);
+	chip->src441_used = -1;
+
+	if (devm_request_irq(&pci->dev, pci->irq, snd_ymfpci_interrupt, IRQF_SHARED,
 			KBUILD_MODNAME, chip)) {
 		dev_err(chip->card->dev, "unable to grab IRQ %d\n", pci->irq);
-		err = -EBUSY;
-		goto free_chip;
+		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_ymfpci_free;
 
 	snd_ymfpci_aclink_reset(pci);
-	if (snd_ymfpci_codec_ready(chip, 0) < 0) {
-		err = -EIO;
-		goto free_chip;
-	}
+	if (snd_ymfpci_codec_ready(chip, 0) < 0)
+		return -EIO;
 
 	err = snd_ymfpci_request_firmware(chip);
 	if (err < 0) {
 		dev_err(chip->card->dev, "firmware request failed: %d\n", err);
-		goto free_chip;
+		return err;
 	}
 	snd_ymfpci_download_image(chip);
 
 	udelay(100); /* seems we need a delay after downloading image.. */
 
-	if (snd_ymfpci_memalloc(chip) < 0) {
-		err = -EIO;
-		goto free_chip;
-	}
+	if (snd_ymfpci_memalloc(chip) < 0)
+		return -EIO;
 
 	err = snd_ymfpci_ac3_init(chip);
 	if (err < 0)
-		goto free_chip;
+		return err;
 
 #ifdef CONFIG_PM_SLEEP
-	chip->saved_regs = kmalloc_array(YDSXGR_NUM_SAVED_REGS, sizeof(u32),
-					 GFP_KERNEL);
-	if (chip->saved_regs == NULL) {
-		err = -ENOMEM;
-		goto free_chip;
-	}
+	chip->saved_regs = devm_kmalloc_array(&pci->dev, YDSXGR_NUM_SAVED_REGS,
+					      sizeof(u32), GFP_KERNEL);
+	if (!chip->saved_regs)
+		return -ENOMEM;
 #endif
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0)
-		goto free_chip;
-
 	snd_ymfpci_proc_init(card, chip);
 
-	*rchip = chip;
 	return 0;
-
-free_chip:
-	snd_ymfpci_free(chip);
-	return err;
 }
-- 
2.26.2

