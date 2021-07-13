Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE433C7286
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:44:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95BC4174F;
	Tue, 13 Jul 2021 16:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95BC4174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187491;
	bh=yinoVpqHxEtfVFvUbQnGSWyjU6qLhovuCSgOHV/63ro=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQ2LBs8QxCDuv3ul/8rSG3bRmIYSlCPJ/5G16yBgmP5JYcHW2r5rt1kMlgtLxgEVg
	 rgPqZ8nuBJH1QyUJQcCYntzugL6ixOdezOB2Gkz4ERAZNABOWfZvc6zN0BiX80aOfG
	 vPObQHjDXrfnuSNMDSmMaNlK7iTgvSwatyh3Ehm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF85FF80610;
	Tue, 13 Jul 2021 16:30:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48E3CF80515; Tue, 13 Jul 2021 16:30:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F129F80515
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F129F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="sE2eH0l7"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="X98P4BNK"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 10547201E4
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yqc3z8b/mRbzn+Osqv1WrJQcGHc6KAh7H2dy+A+vKvY=;
 b=sE2eH0l7yxQ/zXy8cWnSU4N8FQYi1VbKEVLeBninEnPp5VtqLqpidBTi5thtun/wwHIspD
 p977RDjuj+rW1SpymrE475+EvJP86onHtjdbUVe1N2YVuPXPIzIag/m5Lfy1mz67YUvXQP
 T/eI0eBGvZJgf969omSAXrIKxsaPgyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yqc3z8b/mRbzn+Osqv1WrJQcGHc6KAh7H2dy+A+vKvY=;
 b=X98P4BNK8I2Zxgj9uzqEFLqXxMWbjTa7GLxaFijcSALu9FvQUYtSHKCb443UyjctUxglwt
 q6sHFs8qfD1DLCBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 099A9A3B83;
 Tue, 13 Jul 2021 14:29:37 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 35/51] ALSA: ice1724: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:28:41 +0200
Message-Id: <20210713142857.19654-36-tiwai@suse.de>
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

This patch converts the resource management in PCI ice1724 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.
Along with it, the chip_exit callback chain is moved into the card's
private_free instead of the PCI remove callback, too.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/ice1724.c | 127 ++++++++----------------------------
 1 file changed, 27 insertions(+), 100 deletions(-)

diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 8052d7cb8925..1cd84f9338f3 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2447,54 +2447,29 @@ static int snd_vt1724_build_controls(struct snd_ice1712 *ice)
 			   snd_ctl_new1(&snd_vt1724_mixer_pro_peak, ice));
 }
 
-static int snd_vt1724_free(struct snd_ice1712 *ice)
+static void snd_vt1724_free(struct snd_card *card)
 {
-	if (!ice->port)
-		goto __hw_end;
+	struct snd_ice1712 *ice = card->private_data;
+
 	/* mask all interrupts */
 	outb(0xff, ICEMT1724(ice, DMA_INT_MASK));
 	outb(0xff, ICEREG1724(ice, IRQMASK));
-	/* --- */
-__hw_end:
-	if (ice->irq >= 0)
-		free_irq(ice->irq, ice);
-	pci_release_regions(ice->pci);
-	snd_ice1712_akm4xxx_free(ice);
-	pci_disable_device(ice->pci);
-	kfree(ice->spec);
-	kfree(ice);
-	return 0;
-}
 
-static int snd_vt1724_dev_free(struct snd_device *device)
-{
-	struct snd_ice1712 *ice = device->device_data;
-	return snd_vt1724_free(ice);
+	snd_ice1712_akm4xxx_free(ice);
 }
 
 static int snd_vt1724_create(struct snd_card *card,
 			     struct pci_dev *pci,
-			     const char *modelname,
-			     struct snd_ice1712 **r_ice1712)
+			     const char *modelname)
 {
 	struct snd_ice1712 *ice;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_vt1724_dev_free,
-	};
-
-	*r_ice1712 = NULL;
 
 	/* enable PCI device */
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
-	ice = kzalloc(sizeof(*ice), GFP_KERNEL);
-	if (ice == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
 	ice->vt1724 = 1;
 	spin_lock_init(&ice->reg_lock);
 	mutex_init(&ice->gpio_mutex);
@@ -2512,44 +2487,28 @@ static int snd_vt1724_create(struct snd_card *card,
 	pci_set_master(pci);
 	snd_vt1724_proc_init(ice);
 
-	card->private_data = ice;
-
 	err = pci_request_regions(pci, "ICE1724");
-	if (err < 0) {
-		kfree(ice);
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 	ice->port = pci_resource_start(pci, 0);
 	ice->profi_port = pci_resource_start(pci, 1);
 
-	if (request_irq(pci->irq, snd_vt1724_interrupt,
-			IRQF_SHARED, KBUILD_MODNAME, ice)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_vt1724_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, ice)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_vt1724_free(ice);
 		return -EIO;
 	}
 
 	ice->irq = pci->irq;
 	card->sync_irq = ice->irq;
+	card->private_free = snd_vt1724_free;
 
 	snd_vt1724_chip_reset(ice);
-	if (snd_vt1724_read_eeprom(ice, modelname) < 0) {
-		snd_vt1724_free(ice);
+	if (snd_vt1724_read_eeprom(ice, modelname) < 0)
 		return -EIO;
-	}
-	if (snd_vt1724_chip_init(ice) < 0) {
-		snd_vt1724_free(ice);
+	if (snd_vt1724_chip_init(ice) < 0)
 		return -EIO;
-	}
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, ice, &ops);
-	if (err < 0) {
-		snd_vt1724_free(ice);
-		return err;
-	}
-
-	*r_ice1712 = ice;
 	return 0;
 }
 
@@ -2576,19 +2535,18 @@ static int snd_vt1724_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*ice), &card);
 	if (err < 0)
 		return err;
+	ice = card->private_data;
 
 	strcpy(card->driver, "ICE1724");
 	strcpy(card->shortname, "ICEnsemble ICE1724");
 
-	err = snd_vt1724_create(card, pci, model[dev], &ice);
-	if (err < 0) {
-		snd_card_free(card);
+	err = snd_vt1724_create(card, pci, model[dev]);
+	if (err < 0)
 		return err;
-	}
 
 	/* field init before calling chip_init */
 	ice->ext_clock_count = 0;
@@ -2600,10 +2558,8 @@ static int snd_vt1724_probe(struct pci_dev *pci,
 			strcpy(card->driver, c->driver);
 		if (c->chip_init) {
 			err = c->chip_init(ice);
-			if (err < 0) {
-				snd_card_free(card);
+			if (err < 0)
 				return err;
-			}
 		}
 	}
 
@@ -2637,49 +2593,35 @@ static int snd_vt1724_probe(struct pci_dev *pci,
 		set_std_hw_rates(ice);
 
 	err = snd_vt1724_pcm_profi(ice, pcm_dev++);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	err = snd_vt1724_pcm_spdif(ice, pcm_dev++);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	err = snd_vt1724_pcm_indep(ice, pcm_dev++);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	err = snd_vt1724_ac97_mixer(ice);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	err = snd_vt1724_build_controls(ice);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	if (ice->pcm && ice->has_spdif) { /* has SPDIF I/O */
 		err = snd_vt1724_spdif_build_controls(ice);
-		if (err < 0) {
-			snd_card_free(card);
+		if (err < 0)
 			return err;
-		}
 	}
 
 	if (c && c->build_controls) {
 		err = c->build_controls(ice);
-		if (err < 0) {
-			snd_card_free(card);
+		if (err < 0)
 			return err;
-		}
 	}
 
 	if (!c || !c->no_mpu401) {
@@ -2687,10 +2629,8 @@ static int snd_vt1724_probe(struct pci_dev *pci,
 			struct snd_rawmidi *rmidi;
 
 			err = snd_rawmidi_new(card, "MIDI", 0, 1, 1, &rmidi);
-			if (err < 0) {
-				snd_card_free(card);
+			if (err < 0)
 				return err;
-			}
 			ice->rmidi[0] = rmidi;
 			rmidi->private_data = ice;
 			strcpy(rmidi->name, "ICE1724 MIDI");
@@ -2715,25 +2655,13 @@ static int snd_vt1724_probe(struct pci_dev *pci,
 		card->shortname, ice->port, ice->irq);
 
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
 
-static void snd_vt1724_remove(struct pci_dev *pci)
-{
-	struct snd_card *card = pci_get_drvdata(pci);
-	struct snd_ice1712 *ice = card->private_data;
-
-	if (ice->card_info && ice->card_info->chip_exit)
-		ice->card_info->chip_exit(ice);
-	snd_card_free(card);
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int snd_vt1724_suspend(struct device *dev)
 {
@@ -2811,7 +2739,6 @@ static struct pci_driver vt1724_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_vt1724_ids,
 	.probe = snd_vt1724_probe,
-	.remove = snd_vt1724_remove,
 	.driver = {
 		.pm = SND_VT1724_PM_OPS,
 	},
-- 
2.26.2

