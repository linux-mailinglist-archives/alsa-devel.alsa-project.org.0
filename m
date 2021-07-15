Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A85C3C9A3B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:11:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD2C81708;
	Thu, 15 Jul 2021 10:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD2C81708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336668;
	bh=5et1G4U5VQiq8uSxirjA6SQ6lM16xKv9XtV4oKGy3xA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mF9i+qYY4xiXusrsyfOoUiO1Ml4S35DBqlfYx7eF9BARTio+Ub9Ktt9QhUVvWNXUV
	 oNrDelXF6FoMgCxwAsaY4dX+068sraRw9VYpK/PeLjORlXlcYvjXUgaPGiOkA9rFrI
	 FwG0HnbEpIggThcIV/qUNSG9EqXbBWOhETdIYqzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 308F4F80610;
	Thu, 15 Jul 2021 10:00:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 424AAF805FB; Thu, 15 Jul 2021 10:00:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77CC8F804EC
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77CC8F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="pDtdP6+W"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="xbiTHkll"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 49C501FD3E
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Orxy31kK7r+yOKVdimS37pbLcKbFIyH3/lUshfAR9w8=;
 b=pDtdP6+W4f9aKecOU1U3Os2t5mEoG9SqgH9pL5+K+yP8cTlXV8mtM7j2nN6Amd7ke/jPXU
 PmUquKyBibJW6MQy4Bmr9Lcs8U0evdgpVq0twtTuXaspEB/3I7reDIYwivZQz5DbJl7Phz
 4XqqRV51Jz61N9puSnu/dvyBalQ1Y4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Orxy31kK7r+yOKVdimS37pbLcKbFIyH3/lUshfAR9w8=;
 b=xbiTHklltf5W1fkfWKX+jRV939a/L7aMoPakGyZyV/mZGOpDvylihRAj+nTyXzgtuIhadq
 528Yw/g3zlxicyCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 35698A3B8D;
 Thu, 15 Jul 2021 08:00:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 25/79] ALSA: via82xx: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:58:47 +0200
Message-Id: <20210715075941.23332-26-tiwai@suse.de>
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

This patch converts the resource management in PCI via82xx drivers
with devres as a clean up.  Each manual resource management is
converted with the corresponding devres helper, and the card object
release is managed now via card->private_free instead of a lowlevel
snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/via82xx.c       | 116 ++++++++++----------------------------
 sound/pci/via82xx_modem.c |  88 +++++++----------------------
 2 files changed, 49 insertions(+), 155 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 943813a06abc..65514f7e42d7 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -1911,13 +1911,12 @@ static int snd_via82xx_mixer_new(struct via82xx *chip, const char *quirk_overrid
 static int snd_via686_create_gameport(struct via82xx *chip, unsigned char *legacy)
 {
 	struct gameport *gp;
-	struct resource *r;
 
 	if (!joystick)
 		return -ENODEV;
 
-	r = request_region(JOYSTICK_ADDR, 8, "VIA686 gameport");
-	if (!r) {
+	if (!devm_request_region(chip->card->dev, JOYSTICK_ADDR, 8,
+				 "VIA686 gameport")) {
 		dev_warn(chip->card->dev, "cannot reserve joystick port %#x\n",
 		       JOYSTICK_ADDR);
 		return -EBUSY;
@@ -1927,7 +1926,6 @@ static int snd_via686_create_gameport(struct via82xx *chip, unsigned char *legac
 	if (!gp) {
 		dev_err(chip->card->dev,
 			"cannot allocate memory for gameport\n");
-		release_and_free_resource(r);
 		return -ENOMEM;
 	}
 
@@ -1935,7 +1933,6 @@ static int snd_via686_create_gameport(struct via82xx *chip, unsigned char *legac
 	gameport_set_phys(gp, "pci%s/gameport0", pci_name(chip->pci));
 	gameport_set_dev_parent(gp, &chip->pci->dev);
 	gp->io = JOYSTICK_ADDR;
-	gameport_set_port_data(gp, r);
 
 	/* Enable legacy joystick port */
 	*legacy |= VIA_FUNC_ENABLE_GAME;
@@ -1949,11 +1946,8 @@ static int snd_via686_create_gameport(struct via82xx *chip, unsigned char *legac
 static void snd_via686_free_gameport(struct via82xx *chip)
 {
 	if (chip->gameport) {
-		struct resource *r = gameport_get_port_data(chip->gameport);
-
 		gameport_unregister_port(chip->gameport);
 		chip->gameport = NULL;
-		release_and_free_resource(r);
 	}
 }
 #else
@@ -2063,7 +2057,8 @@ static int snd_via686_init_misc(struct via82xx *chip)
 		}
 	}
 	if (mpu_port >= 0x200)
-		chip->mpu_res = request_region(mpu_port, 2, "VIA82xx MPU401");
+		chip->mpu_res = devm_request_region(&chip->pci->dev, mpu_port,
+						    2, "VIA82xx MPU401");
 	if (chip->mpu_res) {
 		if (rev_h)
 			legacy |= VIA_FUNC_MIDI_PNP;	/* enable PCI I/O 2 */
@@ -2302,61 +2297,35 @@ static SIMPLE_DEV_PM_OPS(snd_via82xx_pm, snd_via82xx_suspend, snd_via82xx_resume
 #define SND_VIA82XX_PM_OPS	NULL
 #endif /* CONFIG_PM_SLEEP */
 
-static int snd_via82xx_free(struct via82xx *chip)
+static void snd_via82xx_free(struct snd_card *card)
 {
+	struct via82xx *chip = card->private_data;
 	unsigned int i;
 
-	if (chip->irq < 0)
-		goto __end_hw;
 	/* disable interrupts */
 	for (i = 0; i < chip->num_devs; i++)
 		snd_via82xx_channel_reset(chip, &chip->devs[i]);
 
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
- __end_hw:
-	release_and_free_resource(chip->mpu_res);
-	pci_release_regions(chip->pci);
-
 	if (chip->chip_type == TYPE_VIA686) {
 		snd_via686_free_gameport(chip);
 		pci_write_config_byte(chip->pci, VIA_FUNC_ENABLE, chip->old_legacy);
 		pci_write_config_byte(chip->pci, VIA_PNP_CONTROL, chip->old_legacy_cfg);
 	}
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
-}
-
-static int snd_via82xx_dev_free(struct snd_device *device)
-{
-	struct via82xx *chip = device->device_data;
-	return snd_via82xx_free(chip);
 }
 
 static int snd_via82xx_create(struct snd_card *card,
 			      struct pci_dev *pci,
 			      int chip_type,
 			      int revision,
-			      unsigned int ac97_clock,
-			      struct via82xx **r_via)
+			      unsigned int ac97_clock)
 {
-	struct via82xx *chip;
+	struct via82xx *chip = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_via82xx_dev_free,
-        };
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (!chip) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
-
 	chip->chip_type = chip_type;
 	chip->revision = revision;
 
@@ -2373,44 +2342,31 @@ static int snd_via82xx_create(struct snd_card *card,
 			      chip->old_legacy & ~(VIA_FUNC_ENABLE_SB|VIA_FUNC_ENABLE_FM));
 
 	err = pci_request_regions(pci, card->driver);
-	if (err < 0) {
-		kfree(chip);
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 	chip->port = pci_resource_start(pci, 0);
-	if (request_irq(pci->irq,
-			chip_type == TYPE_VIA8233 ?
-			snd_via8233_interrupt :	snd_via686_interrupt,
-			IRQF_SHARED,
-			KBUILD_MODNAME, chip)) {
+	if (devm_request_irq(&pci->dev, pci->irq,
+			     chip_type == TYPE_VIA8233 ?
+			     snd_via8233_interrupt : snd_via686_interrupt,
+			     IRQF_SHARED,
+			     KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_via82xx_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_via82xx_free;
 	if (ac97_clock >= 8000 && ac97_clock <= 48000)
 		chip->ac97_clock = ac97_clock;
 
 	err = snd_via82xx_chip_init(chip);
-	if (err < 0) {
-		snd_via82xx_free(chip);
-		return err;
-	}
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_via82xx_free(chip);
+	if (err < 0)
 		return err;
-	}
 
 	/* The 8233 ac97 controller does not implement the master bit
 	 * in the pci command register. IMHO this is a violation of the PCI spec.
 	 * We call pci_set_master here because it does not hurt. */
 	pci_set_master(pci);
-
-	*r_via = chip;
 	return 0;
 }
 
@@ -2511,9 +2467,11 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 	unsigned int i;
 	int err;
 
-	err = snd_card_new(&pci->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&pci->dev, index, id, THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
 	card_type = pci_id->driver_data;
 	switch (card_type) {
@@ -2552,36 +2510,34 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 		break;
 	default:
 		dev_err(card->dev, "invalid card type %d\n", card_type);
-		err = -EINVAL;
-		goto __error;
+		return -EINVAL;
 	}
 		
 	err = snd_via82xx_create(card, pci, chip_type, pci->revision,
-				 ac97_clock, &chip);
+				 ac97_clock);
 	if (err < 0)
-		goto __error;
-	card->private_data = chip;
+		return err;
 	err = snd_via82xx_mixer_new(chip, ac97_quirk);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	if (chip_type == TYPE_VIA686) {
 		err = snd_via686_pcm_new(chip);
 		if (err < 0)
-			goto __error;
+			return err;
 		err = snd_via686_init_misc(chip);
 		if (err < 0)
-			goto __error;
+			return err;
 	} else {
 		if (chip_type == TYPE_VIA8233A) {
 			err = snd_via8233a_pcm_new(chip);
 			if (err < 0)
-				goto __error;
+				return err;
 			// chip->dxs_fixed = 1; /* FIXME: use 48k for DXS #3? */
 		} else {
 			err = snd_via8233_pcm_new(chip);
 			if (err < 0)
-				goto __error;
+				return err;
 			if (dxs_support == VIA_DXS_48K)
 				chip->dxs_fixed = 1;
 			else if (dxs_support == VIA_DXS_NO_VRA)
@@ -2593,7 +2549,7 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 		}
 		err = snd_via8233_init_misc(chip);
 		if (err < 0)
-			goto __error;
+			return err;
 	}
 
 	/* disable interrupts */
@@ -2607,28 +2563,16 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 	snd_via82xx_proc_init(chip);
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	pci_set_drvdata(pci, card);
 	return 0;
-
- __error:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_via82xx_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 static struct pci_driver via82xx_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_via82xx_ids,
 	.probe = snd_via82xx_probe,
-	.remove = snd_via82xx_remove,
 	.driver = {
 		.pm = SND_VIA82XX_PM_OPS,
 	},
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index 07278a3dc8c1..234f7fbed236 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -1048,95 +1048,57 @@ static SIMPLE_DEV_PM_OPS(snd_via82xx_pm, snd_via82xx_suspend, snd_via82xx_resume
 #define SND_VIA82XX_PM_OPS	NULL
 #endif /* CONFIG_PM_SLEEP */
 
-static int snd_via82xx_free(struct via82xx_modem *chip)
+static void snd_via82xx_free(struct snd_card *card)
 {
+	struct via82xx_modem *chip = card->private_data;
 	unsigned int i;
 
-	if (chip->irq < 0)
-		goto __end_hw;
 	/* disable interrupts */
 	for (i = 0; i < chip->num_devs; i++)
 		snd_via82xx_channel_reset(chip, &chip->devs[i]);
-
-      __end_hw:
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
-}
-
-static int snd_via82xx_dev_free(struct snd_device *device)
-{
-	struct via82xx_modem *chip = device->device_data;
-	return snd_via82xx_free(chip);
 }
 
 static int snd_via82xx_create(struct snd_card *card,
 			      struct pci_dev *pci,
 			      int chip_type,
 			      int revision,
-			      unsigned int ac97_clock,
-			      struct via82xx_modem **r_via)
+			      unsigned int ac97_clock)
 {
-	struct via82xx_modem *chip;
+	struct via82xx_modem *chip = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_via82xx_dev_free,
-        };
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (!chip) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
-
 	spin_lock_init(&chip->reg_lock);
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
 
 	err = pci_request_regions(pci, card->driver);
-	if (err < 0) {
-		kfree(chip);
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 	chip->port = pci_resource_start(pci, 0);
-	if (request_irq(pci->irq, snd_via82xx_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, chip)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_via82xx_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_via82xx_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_via82xx_free;
 	if (ac97_clock >= 8000 && ac97_clock <= 48000)
 		chip->ac97_clock = ac97_clock;
 
 	err = snd_via82xx_chip_init(chip);
-	if (err < 0) {
-		snd_via82xx_free(chip);
-		return err;
-	}
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_via82xx_free(chip);
+	if (err < 0)
 		return err;
-	}
 
 	/* The 8233 ac97 controller does not implement the master bit
 	 * in the pci command register. IMHO this is a violation of the PCI spec.
 	 * We call pci_set_master here because it does not hurt. */
 	pci_set_master(pci);
-
-	*r_via = chip;
 	return 0;
 }
 
@@ -1150,9 +1112,11 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 	unsigned int i;
 	int err;
 
-	err = snd_card_new(&pci->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&pci->dev, index, id, THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
 	card_type = pci_id->driver_data;
 	switch (card_type) {
@@ -1162,22 +1126,20 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 		break;
 	default:
 		dev_err(card->dev, "invalid card type %d\n", card_type);
-		err = -EINVAL;
-		goto __error;
+		return -EINVAL;
 	}
 		
 	err = snd_via82xx_create(card, pci, chip_type, pci->revision,
-				 ac97_clock, &chip);
+				 ac97_clock);
 	if (err < 0)
-		goto __error;
-	card->private_data = chip;
+		return err;
 	err = snd_via82xx_mixer_new(chip);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	err = snd_via686_pcm_new(chip);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	/* disable interrupts */
 	for (i = 0; i < chip->num_devs; i++)
@@ -1189,28 +1151,16 @@ static int snd_via82xx_probe(struct pci_dev *pci,
 	snd_via82xx_proc_init(chip);
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	pci_set_drvdata(pci, card);
 	return 0;
-
- __error:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_via82xx_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 static struct pci_driver via82xx_modem_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_via82xx_modem_ids,
 	.probe = snd_via82xx_probe,
-	.remove = snd_via82xx_remove,
 	.driver = {
 		.pm = SND_VIA82XX_PM_OPS,
 	},
-- 
2.26.2

