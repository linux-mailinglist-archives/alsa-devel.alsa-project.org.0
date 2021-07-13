Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE473C7259
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:37:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C0401730;
	Tue, 13 Jul 2021 16:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C0401730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187050;
	bh=C2DUk2ahSyWUnhSSP5O9DlVQ7Nj1+6BKI+gxHE0FpYw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bbSasvtcPs8bP4ZMOxFJNoU/dsOckibcx6BgqrWqbl1yu+egOew6IueWGYy1dt5ZJ
	 aDtZqWDnmmdtnpAu22r+maX1f8KpSvjEYXJfozcIetVgqNt3ebEW+U0/5gTH0c39Mf
	 E3U0c0AgorsvnbNISEd5wPfbjrsPqZw5zSGjuBVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28FA8F8052D;
	Tue, 13 Jul 2021 16:30:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDB8AF804F3; Tue, 13 Jul 2021 16:29:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE253F80518
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE253F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="1gTu5ZXK"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ktHGIVL9"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8A877201DA
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fusZtg22Gbb/Jg9/if1Lw2R8bfZp7jjBjx0z+VU3ZIM=;
 b=1gTu5ZXKfaEChuMUWOOpep9LG+HWwLClBUeZqmdLyDUbA4c1cDP4YXzli+u+I1rc2VnevD
 Or6Bw4zQsJ0S7o6ap/MiMLDHT7Ix6JPGTgMQfrHhNLfMsZANdCEpM6KCT82SP5gSmF3sN9
 ZVrUcSiMrr3SpazJR9hOUHZn/mpHns8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186565;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fusZtg22Gbb/Jg9/if1Lw2R8bfZp7jjBjx0z+VU3ZIM=;
 b=ktHGIVL9lLwZcElVtOgKsHguj8m2c4QjoML8M8ggwvMFtskmKWbB+B6VFlR3YD/EYHTslS
 yvFwYZFUHSqrwUBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 83B62A3B8F;
 Tue, 13 Jul 2021 14:29:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 19/51] ALSA: maestro3: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:28:25 +0200
Message-Id: <20210713142857.19654-20-tiwai@suse.de>
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

This patch converts the resource management in PCI maestro3 driver
with devres as a clean up.  Each manual resource management is
converted with the corresponding devres helper, and the card object
release is managed now via card->private_free instead of a lowlevel
snd_device.  Superfluous ac97 private_free callbacks were dropped,
too.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/maestro3.c | 106 ++++++++++---------------------------------
 1 file changed, 23 insertions(+), 83 deletions(-)

diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index 77a484bc8c0d..056838ead21d 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -2339,16 +2339,13 @@ snd_m3_enable_ints(struct snd_m3 *chip)
 /*
  */
 
-static int snd_m3_free(struct snd_m3 *chip)
+static void snd_m3_free(struct snd_card *card)
 {
+	struct snd_m3 *chip = card->private_data;
 	struct m3_dma *s;
 	int i;
 
 	cancel_work_sync(&chip->hwvol_work);
-#ifdef CONFIG_SND_MAESTRO3_INPUT
-	if (chip->input_dev)
-		input_unregister_device(chip->input_dev);
-#endif
 
 	if (chip->substreams) {
 		spin_lock_irq(&chip->reg_lock);
@@ -2359,7 +2356,6 @@ static int snd_m3_free(struct snd_m3 *chip)
 				snd_m3_pcm_stop(chip, s, s->substream);
 		}
 		spin_unlock_irq(&chip->reg_lock);
-		kfree(chip->substreams);
 	}
 	if (chip->iobase) {
 		outw(0, chip->iobase + HOST_INT_CTRL); /* disable ints */
@@ -2368,19 +2364,8 @@ static int snd_m3_free(struct snd_m3 *chip)
 #ifdef CONFIG_PM_SLEEP
 	vfree(chip->suspend_mem);
 #endif
-
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
-
-	if (chip->iobase)
-		pci_release_regions(chip->pci);
-
 	release_firmware(chip->assp_kernel_image);
 	release_firmware(chip->assp_minisrc_image);
-
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
 }
 
 
@@ -2473,7 +2458,7 @@ static int snd_m3_input_register(struct snd_m3 *chip)
 	struct input_dev *input_dev;
 	int err;
 
-	input_dev = input_allocate_device();
+	input_dev = devm_input_allocate_device(&chip->pci->dev);
 	if (!input_dev)
 		return -ENOMEM;
 
@@ -2493,10 +2478,8 @@ static int snd_m3_input_register(struct snd_m3 *chip)
 	__set_bit(KEY_VOLUMEUP, input_dev->keybit);
 
 	err = input_register_device(input_dev);
-	if (err) {
-		input_free_device(input_dev);
+	if (err)
 		return err;
-	}
 
 	chip->input_dev = input_dev;
 	return 0;
@@ -2506,44 +2489,25 @@ static int snd_m3_input_register(struct snd_m3 *chip)
 /*
  */
 
-static int snd_m3_dev_free(struct snd_device *device)
-{
-	struct snd_m3 *chip = device->device_data;
-	return snd_m3_free(chip);
-}
-
 static int
 snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 	      int enable_amp,
-	      int amp_gpio,
-	      struct snd_m3 **chip_ret)
+	      int amp_gpio)
 {
-	struct snd_m3 *chip;
+	struct snd_m3 *chip = card->private_data;
 	int i, err;
 	const struct snd_pci_quirk *quirk;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_m3_dev_free,
-	};
 
-	*chip_ret = NULL;
-
-	if (pci_enable_device(pci))
+	if (pcim_enable_device(pci))
 		return -EIO;
 
 	/* check, if we can restrict PCI DMA transfers to 28 bits */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28))) {
 		dev_err(card->dev,
 			"architecture does not support 28bit PCI busmaster DMA\n");
-		pci_disable_device(pci);
 		return -ENXIO;
 	}
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
-
 	spin_lock_init(&chip->reg_lock);
 
 	switch (pci->device) {
@@ -2559,6 +2523,7 @@ snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 	chip->pci = pci;
 	chip->irq = -1;
 	INIT_WORK(&chip->hwvol_work, snd_m3_update_hw_volume);
+	card->private_free = snd_m3_free;
 
 	chip->external_amp = enable_amp;
 	if (amp_gpio >= 0 && amp_gpio <= 0x0f)
@@ -2588,27 +2553,24 @@ snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 		chip->is_omnibook = 1;
 
 	chip->num_substreams = NR_DSPS;
-	chip->substreams = kcalloc(chip->num_substreams, sizeof(struct m3_dma),
-				   GFP_KERNEL);
-	if (chip->substreams == NULL) {
-		kfree(chip);
-		pci_disable_device(pci);
+	chip->substreams = devm_kcalloc(&pci->dev, chip->num_substreams,
+					sizeof(struct m3_dma), GFP_KERNEL);
+	if (!chip->substreams)
 		return -ENOMEM;
-	}
 
 	err = request_firmware(&chip->assp_kernel_image,
 			       "ess/maestro3_assp_kernel.fw", &pci->dev);
 	if (err < 0)
-		goto free_chip;
+		return err;
 
 	err = request_firmware(&chip->assp_minisrc_image,
 			       "ess/maestro3_assp_minisrc.fw", &pci->dev);
 	if (err < 0)
-		goto free_chip;
+		return err;
 
 	err = pci_request_regions(pci, card->driver);
 	if (err < 0)
-		goto free_chip;
+		return err;
 
 	chip->iobase = pci_resource_start(pci, 0);
 	
@@ -2624,11 +2586,10 @@ snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 
 	snd_m3_hv_init(chip);
 
-	if (request_irq(pci->irq, snd_m3_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, chip)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_m3_interrupt, IRQF_SHARED,
+			     KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		err = -ENOMEM;
-		goto free_chip;
+		return -ENOMEM;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
@@ -2642,10 +2603,6 @@ snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 		dev_warn(card->dev, "can't allocate apm buffer\n");
 #endif
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0)
-		goto free_chip;
-
 	err = snd_m3_mixer(chip);
 	if (err < 0)
 		return err;
@@ -2674,13 +2631,7 @@ snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 	snd_m3_enable_ints(chip);
 	snd_m3_assp_continue(chip);
 
-	*chip_ret = chip;
-
 	return 0; 
-
-free_chip:
-	snd_m3_free(chip);
-	return err;
 }
 
 /*
@@ -2704,10 +2655,11 @@ snd_m3_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
 	switch (pci->device) {
 	case PCI_DEVICE_ID_ESS_ALLEGRO:
@@ -2723,11 +2675,9 @@ snd_m3_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		break;
 	}
 
-	err = snd_m3_create(card, pci, external_amp[dev], amp_gpio[dev], &chip);
+	err = snd_m3_create(card, pci, external_amp[dev], amp_gpio[dev]);
 	if (err < 0)
-		goto free_card;
-
-	card->private_data = chip;
+		return err;
 
 	sprintf(card->shortname, "ESS %s PCI", card->driver);
 	sprintf(card->longname, "%s at 0x%lx, irq %d",
@@ -2735,7 +2685,7 @@ snd_m3_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto free_card;
+		return err;
 
 #if 0 /* TODO: not supported yet */
 	/* TODO enable MIDI IRQ and I/O */
@@ -2750,22 +2700,12 @@ snd_m3_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
-
-free_card:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_m3_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 static struct pci_driver m3_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_m3_ids,
 	.probe = snd_m3_probe,
-	.remove = snd_m3_remove,
 	.driver = {
 		.pm = M3_PM_OPS,
 	},
-- 
2.26.2

