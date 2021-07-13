Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A33BE3C7258
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:37:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28763171F;
	Tue, 13 Jul 2021 16:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28763171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187020;
	bh=pBtt/uTISb8NPCkEom15usZ6QN8XM+za30pYh42Crn8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/ZRk/aP59bOvaCGkwzlLzLIOSxAsy5W3KuW0dAwYfhIdl8p/jKtp8K3RnMLvGtMa
	 1DjiADyCANzpR8jze0wwQ+fFmayTRY3RxNa0n26yE+KQLpfRhFkKVfEmytmYwark1G
	 uYuuWTqolU29axPYFfXK5D1DQUHGpK+4KgU7vS+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 875B1F8058C;
	Tue, 13 Jul 2021 16:30:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31827F80534; Tue, 13 Jul 2021 16:29:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1BE6F80515
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1BE6F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="FqXpN8gb"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="0/9zPKU7"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A4B6D22855
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+FcHIP2zdusgbPrYoClAr9cEuLFcqZ/s7i7OKllpgQ=;
 b=FqXpN8gbgZa71FnKrp2fnWbWiLiiQJxJcdj8BlKdYdiPZMVPW78nHCW5mugtpB/t1Lj8np
 32bN/KvUk3BElgNjIZ4iszZuJYxT1rMBNT7oDLBMNut2egIfBMEu2E/j9SxnSPda5QK9QN
 dJyVcTAbd1u3luemHpUkiZjnC9L738U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186564;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+FcHIP2zdusgbPrYoClAr9cEuLFcqZ/s7i7OKllpgQ=;
 b=0/9zPKU7mHsdA7BDujlj0eRm2NF7nK2inW40ZMM2JtqsLbr5UPlRyiZCnVun8YrP/S1wWH
 jj1gSriGXlKew1Bw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 93CF9A3B85;
 Tue, 13 Jul 2021 14:29:24 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 18/51] ALSA: fm801: Allocate resources with device-managed APIs
Date: Tue, 13 Jul 2021 16:28:24 +0200
Message-Id: <20210713142857.19654-19-tiwai@suse.de>
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

This patch converts the resource management in PCI fm801 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.
Also the superfluous ac97 private_free callbacks were dropped, too.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/fm801.c | 103 ++++++++--------------------------------------
 1 file changed, 17 insertions(+), 86 deletions(-)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index ed9dae87145b..9c22ff19e56d 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -1028,22 +1028,6 @@ FM801_SINGLE(SNDRV_CTL_NAME_IEC958("Raw Data ",CAPTURE,SWITCH), FM801_I2S_MODE,
 FM801_SINGLE(SNDRV_CTL_NAME_IEC958("",PLAYBACK,SWITCH), FM801_GEN_CTRL, 2, 1, 0),
 };
 
-static void snd_fm801_mixer_free_ac97_bus(struct snd_ac97_bus *bus)
-{
-	struct fm801 *chip = bus->private_data;
-	chip->ac97_bus = NULL;
-}
-
-static void snd_fm801_mixer_free_ac97(struct snd_ac97 *ac97)
-{
-	struct fm801 *chip = ac97->private_data;
-	if (ac97->num == 0) {
-		chip->ac97 = NULL;
-	} else {
-		chip->ac97_sec = NULL;
-	}
-}
-
 static int snd_fm801_mixer(struct fm801 *chip)
 {
 	struct snd_ac97_template ac97;
@@ -1057,11 +1041,9 @@ static int snd_fm801_mixer(struct fm801 *chip)
 	err = snd_ac97_bus(chip->card, 0, &ops, chip, &chip->ac97_bus);
 	if (err < 0)
 		return err;
-	chip->ac97_bus->private_free = snd_fm801_mixer_free_ac97_bus;
 
 	memset(&ac97, 0, sizeof(ac97));
 	ac97.private_data = chip;
-	ac97.private_free = snd_fm801_mixer_free_ac97;
 	err = snd_ac97_mixer(chip->ac97_bus, &ac97, &chip->ac97);
 	if (err < 0)
 		return err;
@@ -1177,55 +1159,35 @@ static void snd_fm801_chip_init(struct fm801 *chip)
 		     FM801_IRQ_PLAYBACK | FM801_IRQ_CAPTURE | FM801_IRQ_MPU);
 }
 
-static int snd_fm801_free(struct fm801 *chip)
+static void snd_fm801_free(struct snd_card *card)
 {
+	struct fm801 *chip = card->private_data;
 	unsigned short cmdw;
 
-	if (chip->irq < 0)
-		goto __end_hw;
-
 	/* interrupt setup - mask everything */
 	cmdw = fm801_readw(chip, IRQ_MASK);
 	cmdw |= 0x00c3;
 	fm801_writew(chip, IRQ_MASK, cmdw);
 
-	devm_free_irq(chip->dev, chip->irq, chip);
-
-      __end_hw:
 #ifdef CONFIG_SND_FM801_TEA575X_BOOL
 	if (!(chip->tea575x_tuner & TUNER_DISABLED)) {
 		snd_tea575x_exit(&chip->tea);
 		v4l2_device_unregister(&chip->v4l2_dev);
 	}
 #endif
-	return 0;
-}
-
-static int snd_fm801_dev_free(struct snd_device *device)
-{
-	struct fm801 *chip = device->device_data;
-	return snd_fm801_free(chip);
 }
 
 static int snd_fm801_create(struct snd_card *card,
 			    struct pci_dev *pci,
 			    int tea575x_tuner,
-			    int radio_nr,
-			    struct fm801 **rchip)
+			    int radio_nr)
 {
-	struct fm801 *chip;
+	struct fm801 *chip = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_fm801_dev_free,
-	};
 
-	*rchip = NULL;
 	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
-	chip = devm_kzalloc(&pci->dev, sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL)
-		return -ENOMEM;
 	spin_lock_init(&chip->reg_lock);
 	chip->card = card;
 	chip->dev = &pci->dev;
@@ -1253,7 +1215,6 @@ static int snd_fm801_create(struct snd_card *card,
 		if (devm_request_irq(&pci->dev, pci->irq, snd_fm801_interrupt,
 				IRQF_SHARED, KBUILD_MODNAME, chip)) {
 			dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-			snd_fm801_free(chip);
 			return -EBUSY;
 		}
 		chip->irq = pci->irq;
@@ -1261,20 +1222,13 @@ static int snd_fm801_create(struct snd_card *card,
 		pci_set_master(pci);
 	}
 
+	card->private_free = snd_fm801_free;
 	snd_fm801_chip_init(chip);
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_fm801_free(chip);
-		return err;
-	}
-
 #ifdef CONFIG_SND_FM801_TEA575X_BOOL
 	err = v4l2_device_register(&pci->dev, &chip->v4l2_dev);
-	if (err < 0) {
-		snd_fm801_free(chip);
+	if (err < 0)
 		return err;
-	}
 	chip->tea.v4l2_dev = &chip->v4l2_dev;
 	chip->tea.radio_nr = radio_nr;
 	chip->tea.private_data = chip;
@@ -1284,7 +1238,6 @@ static int snd_fm801_create(struct snd_card *card,
 	    (chip->tea575x_tuner & TUNER_TYPE_MASK) < 4) {
 		if (snd_tea575x_init(&chip->tea, THIS_MODULE)) {
 			dev_err(card->dev, "TEA575x radio not found\n");
-			snd_fm801_free(chip);
 			return -ENODEV;
 		}
 	} else if ((chip->tea575x_tuner & TUNER_TYPE_MASK) == 0) {
@@ -1312,8 +1265,6 @@ static int snd_fm801_create(struct snd_card *card,
 			sizeof(chip->tea.card));
 	}
 #endif
-
-	*rchip = chip;
 	return 0;
 }
 
@@ -1333,16 +1284,14 @@ static int snd_card_fm801_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
-	err = snd_fm801_create(card, pci, tea575x_tuner[dev], radio_nr[dev], &chip);
-	if (err < 0) {
-		snd_card_free(card);
+	chip = card->private_data;
+	err = snd_fm801_create(card, pci, tea575x_tuner[dev], radio_nr[dev]);
+	if (err < 0)
 		return err;
-	}
-	card->private_data = chip;
 
 	strcpy(card->driver, "FM801");
 	strcpy(card->shortname, "ForteMedia FM801-");
@@ -1354,53 +1303,36 @@ static int snd_card_fm801_probe(struct pci_dev *pci,
 		goto __fm801_tuner_only;
 
 	err = snd_fm801_pcm(chip, 0);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_fm801_mixer(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_mpu401_uart_new(card, 0, MPU401_HW_FM801,
 				  chip->port + FM801_MPU401_DATA,
 				  MPU401_INFO_INTEGRATED |
 				  MPU401_INFO_IRQ_HOOK,
 				  -1, &chip->rmidi);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_opl3_create(card, chip->port + FM801_OPL3_BANK0,
 			      chip->port + FM801_OPL3_BANK1,
 			      OPL3_HW_OPL3_FM801, 1, &opl3);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
       __fm801_tuner_only:
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
 
-static void snd_card_fm801_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 #ifdef CONFIG_PM_SLEEP
 static const unsigned char saved_regs[] = {
 	FM801_PCM_VOL, FM801_I2S_VOL, FM801_FM_VOL, FM801_REC_SRC,
@@ -1468,7 +1400,6 @@ static struct pci_driver fm801_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_fm801_ids,
 	.probe = snd_card_fm801_probe,
-	.remove = snd_card_fm801_remove,
 	.driver = {
 		.pm = SND_FM801_PM_OPS,
 	},
-- 
2.26.2

