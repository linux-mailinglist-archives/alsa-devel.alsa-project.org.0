Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D793C725B
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:38:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7C75168E;
	Tue, 13 Jul 2021 16:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7C75168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187086;
	bh=ij7a0EWxgpUwklHOuXNxR3GuD+/Nugm04Uful23auT4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bY+AwE/awLeCswD0BA4B2VFywwLUGX4pN+niH0ISLKUfQEXzt+rAX+M6EHRGElb+w
	 YmFiuVMHaZHH9bOwG4ZdwgmKvsgU48BXInGGF913kw6zTI5h5JfWHeN//2oyUKJsCI
	 kiPHZHg9eymsXXvAPkIlgq/ghBy5hyB9Fh8BY4x8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B38E5F80538;
	Tue, 13 Jul 2021 16:30:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC204F80539; Tue, 13 Jul 2021 16:29:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 088DEF804E3
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 088DEF804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="o6Rf5tJ3"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="xi2AgTdM"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 98BBF22837
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvr5Yaq8pXyBba5sokGGZLBccFIEBRKfkQHQotK6Pj8=;
 b=o6Rf5tJ3DKOWc8LISp9JziuChwdWsdwlb2SttA4Hk61+L2vsovHUsyUTHMNYAxmSIXlCvH
 QbIkFMf1VqpzipCam0wHo7qXKEsxshLukxX/DlZuSWkbcMzRM6f3ZDJifA/3E/OAKZbVHR
 O5JnhV+qI8xBs9exSvyVTpBIVf3YGwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186563;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvr5Yaq8pXyBba5sokGGZLBccFIEBRKfkQHQotK6Pj8=;
 b=xi2AgTdMWzMriyKIC6qPftJoLuxKnHFj5+b5AcPUens/u4ccFV8d0Jy9rBawltCUw/qHXy
 bKf5FsAMZzduHyBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 86685A3B8D;
 Tue, 13 Jul 2021 14:29:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/51] ALSA: es1968: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:28:23 +0200
Message-Id: <20210713142857.19654-18-tiwai@suse.de>
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

This patch converts the resource management in PCI es1968 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1968.c | 112 ++++++++++-----------------------------------
 1 file changed, 24 insertions(+), 88 deletions(-)

diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index c038c1035c39..6a8a02a9ecf4 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2442,7 +2442,8 @@ static int snd_es1968_create_gameport(struct es1968 *chip, int dev)
 	if (!joystick[dev])
 		return -ENODEV;
 
-	r = request_region(JOYSTICK_ADDR, 8, "ES1968 gameport");
+	r = devm_request_region(&chip->pci->dev, JOYSTICK_ADDR, 8,
+				"ES1968 gameport");
 	if (!r)
 		return -EBUSY;
 
@@ -2450,7 +2451,6 @@ static int snd_es1968_create_gameport(struct es1968 *chip, int dev)
 	if (!gp) {
 		dev_err(chip->card->dev,
 			"cannot allocate memory for gameport\n");
-		release_and_free_resource(r);
 		return -ENOMEM;
 	}
 
@@ -2461,7 +2461,6 @@ static int snd_es1968_create_gameport(struct es1968 *chip, int dev)
 	gameport_set_phys(gp, "pci%s/gameport0", pci_name(chip->pci));
 	gameport_set_dev_parent(gp, &chip->pci->dev);
 	gp->io = JOYSTICK_ADDR;
-	gameport_set_port_data(gp, r);
 
 	gameport_register_port(gp);
 
@@ -2471,12 +2470,8 @@ static int snd_es1968_create_gameport(struct es1968 *chip, int dev)
 static void snd_es1968_free_gameport(struct es1968 *chip)
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
@@ -2490,7 +2485,7 @@ static int snd_es1968_input_register(struct es1968 *chip)
 	struct input_dev *input_dev;
 	int err;
 
-	input_dev = input_allocate_device();
+	input_dev = devm_input_allocate_device(&chip->pci->dev);
 	if (!input_dev)
 		return -ENOMEM;
 
@@ -2510,10 +2505,8 @@ static int snd_es1968_input_register(struct es1968 *chip)
 	__set_bit(KEY_VOLUMEUP, input_dev->keybit);
 
 	err = input_register_device(input_dev);
-	if (err) {
-		input_free_device(input_dev);
+	if (err)
 		return err;
-	}
 
 	chip->input_dev = input_dev;
 	return 0;
@@ -2597,13 +2590,11 @@ static const struct snd_tea575x_ops snd_es1968_tea_ops = {
 };
 #endif
 
-static int snd_es1968_free(struct es1968 *chip)
+static void snd_es1968_free(struct snd_card *card)
 {
+	struct es1968 *chip = card->private_data;
+
 	cancel_work_sync(&chip->hwvol_work);
-#ifdef CONFIG_SND_ES1968_INPUT
-	if (chip->input_dev)
-		input_unregister_device(chip->input_dev);
-#endif
 
 	if (chip->io_port) {
 		outw(1, chip->io_port + 0x04); /* clear WP interrupts */
@@ -2615,19 +2606,7 @@ static int snd_es1968_free(struct es1968 *chip)
 	v4l2_device_unregister(&chip->v4l2_dev);
 #endif
 
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
 	snd_es1968_free_gameport(chip);
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
-}
-
-static int snd_es1968_dev_free(struct snd_device *device)
-{
-	struct es1968 *chip = device->device_data;
-	return snd_es1968_free(chip);
 }
 
 struct ess_device_list {
@@ -2657,35 +2636,22 @@ static int snd_es1968_create(struct snd_card *card,
 			     int capt_streams,
 			     int chip_type,
 			     int do_pm,
-			     int radio_nr,
-			     struct es1968 **chip_ret)
+			     int radio_nr)
 {
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_es1968_dev_free,
-	};
-	struct es1968 *chip;
+	struct es1968 *chip = card->private_data;
 	int i, err;
 
-	*chip_ret = NULL;
-
 	/* enable PCI device */
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 	/* check, if we can restrict PCI DMA transfers to 28 bits */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28))) {
 		dev_err(card->dev,
 			"architecture does not support 28bit PCI busmaster DMA\n");
-		pci_disable_device(pci);
 		return -ENXIO;
 	}
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (! chip) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
-
 	/* Set Vars */
 	chip->type = chip_type;
 	spin_lock_init(&chip->reg_lock);
@@ -2702,20 +2668,17 @@ static int snd_es1968_create(struct snd_card *card,
 	chip->capture_streams = capt_streams;
 
 	err = pci_request_regions(pci, "ESS Maestro");
-	if (err < 0) {
-		kfree(chip);
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 	chip->io_port = pci_resource_start(pci, 0);
-	if (request_irq(pci->irq, snd_es1968_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, chip)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_es1968_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_es1968_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_es1968_free;
 	        
 	/* Clear Maestro_map */
 	for (i = 0; i < 32; i++)
@@ -2749,21 +2712,13 @@ static int snd_es1968_create(struct snd_card *card,
 
 	snd_es1968_chip_init(chip);
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_es1968_free(chip);
-		return err;
-	}
-
 #ifdef CONFIG_SND_ES1968_RADIO
 	/* don't play with GPIOs on laptops */
 	if (chip->pci->subsystem_vendor != 0x125d)
-		goto no_radio;
+		return 0;
 	err = v4l2_device_register(&pci->dev, &chip->v4l2_dev);
-	if (err < 0) {
-		snd_es1968_free(chip);
+	if (err < 0)
 		return err;
-	}
 	chip->tea.v4l2_dev = &chip->v4l2_dev;
 	chip->tea.private_data = chip;
 	chip->tea.radio_nr = radio_nr;
@@ -2779,11 +2734,7 @@ static int snd_es1968_create(struct snd_card *card,
 			break;
 		}
 	}
-no_radio:
 #endif
-
-	*chip_ret = chip;
-
 	return 0;
 }
 
@@ -2806,10 +2757,11 @@ static int snd_es1968_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
                 
 	if (total_bufsize[dev] < 128)
 		total_bufsize[dev] = 128;
@@ -2821,13 +2773,9 @@ static int snd_es1968_probe(struct pci_dev *pci,
 				pcm_substreams_c[dev],
 				pci_id->driver_data,
 				use_pm[dev],
-				radio_nr[dev],
-				&chip);
-	if (err < 0) {
-		snd_card_free(card);
+				radio_nr[dev]);
+	if (err < 0)
 		return err;
-	}
-	card->private_data = chip;
 
 	switch (chip->type) {
 	case TYPE_MAESTRO2E:
@@ -2845,16 +2793,12 @@ static int snd_es1968_probe(struct pci_dev *pci,
 	}
 
 	err = snd_es1968_pcm(chip, 0);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	err = snd_es1968_mixer(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	if (enable_mpu[dev] == 2) {
 		/* check the deny list */
@@ -2897,25 +2841,17 @@ static int snd_es1968_probe(struct pci_dev *pci,
 		card->shortname, chip->io_port, chip->irq);
 
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
 
-static void snd_es1968_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 static struct pci_driver es1968_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_es1968_ids,
 	.probe = snd_es1968_probe,
-	.remove = snd_es1968_remove,
 	.driver = {
 		.pm = ES1968_PM_OPS,
 	},
-- 
2.26.2

