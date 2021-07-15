Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 717203C9A1D
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:06:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8CE116A8;
	Thu, 15 Jul 2021 10:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8CE116A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336364;
	bh=Ck6Cplh12e2/4Ry/cKFmHmlFG2GiCCBWWU5Sy2TA2zo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dzsE0MCDoKVD6WPbd2IuwKEVvtNIyyecLvxWQuv164DDji3AZFsesfGQ09jOWuXnU
	 /1CiU1KWnfDFIs4/bos5oawuRW7fuPcFLS7hzuMHqefcRsqAd33mitHuY2tYjbA2AK
	 Sxs8HGFX9z+LjRz9J57yz2R90OBpWgbzXxG8WtNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FD5DF805BB;
	Thu, 15 Jul 2021 10:00:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DFECF80566; Thu, 15 Jul 2021 10:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F189F804DF
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F189F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="nrLAQcVn"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Mk65+ouy"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id DF3FD2284C
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626335997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H25n8pVOAJLV1vEegg0jwwU//7sMaIgSc2yDYPgDsXk=;
 b=nrLAQcVniORkOvUT+K0seKZTNo8EN0db8Lnua8yeGCy7p2eYvK01IT1QSC4FyD4cOj9mk9
 b9NX/a8panAFSKVPFHhLcU96HBDZIPBQfagJS7sqQ4g1hIxwrNQ7Av1yKSUCnfHJpZh3+O
 NZYwBV/oGemiO6EiRy2nUZOLvv45VZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626335997;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H25n8pVOAJLV1vEegg0jwwU//7sMaIgSc2yDYPgDsXk=;
 b=Mk65+ouyvksaSlpg4t+dg8pGVFENFr53ZOJzN1HJKGcTZ6/x52SGW6B95ctIrgW+v4Coi0
 9rJf+csLH4lzB9Ag==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D7C48A3B99;
 Thu, 15 Jul 2021 07:59:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 13/79] ALSA: cmipci: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:58:35 +0200
Message-Id: <20210715075941.23332-14-tiwai@suse.de>
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

This patch converts the resource management in PCI cmipci driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cmipci.c | 104 ++++++++++++---------------------------------
 1 file changed, 28 insertions(+), 76 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index f44f118aacad..ea20236f35db 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -2852,13 +2852,15 @@ static int snd_cmipci_create_gameport(struct cmipci *cm, int dev)
 	if (joystick_port[dev] == 1) { /* auto-detect */
 		for (i = 0; ports[i]; i++) {
 			io_port = ports[i];
-			r = request_region(io_port, 1, "CMIPCI gameport");
+			r = devm_request_region(&cm->pci->dev, io_port, 1,
+						"CMIPCI gameport");
 			if (r)
 				break;
 		}
 	} else {
 		io_port = joystick_port[dev];
-		r = request_region(io_port, 1, "CMIPCI gameport");
+		r = devm_request_region(&cm->pci->dev, io_port, 1,
+					"CMIPCI gameport");
 	}
 
 	if (!r) {
@@ -2869,14 +2871,12 @@ static int snd_cmipci_create_gameport(struct cmipci *cm, int dev)
 	cm->gameport = gp = gameport_allocate_port();
 	if (!gp) {
 		dev_err(cm->card->dev, "cannot allocate memory for gameport\n");
-		release_and_free_resource(r);
 		return -ENOMEM;
 	}
 	gameport_set_name(gp, "C-Media Gameport");
 	gameport_set_phys(gp, "pci%s/gameport0", pci_name(cm->pci));
 	gameport_set_dev_parent(gp, &cm->pci->dev);
 	gp->io = io_port;
-	gameport_set_port_data(gp, r);
 
 	snd_cmipci_set_bit(cm, CM_REG_FUNCTRL1, CM_JYSTK_EN);
 
@@ -2888,13 +2888,10 @@ static int snd_cmipci_create_gameport(struct cmipci *cm, int dev)
 static void snd_cmipci_free_gameport(struct cmipci *cm)
 {
 	if (cm->gameport) {
-		struct resource *r = gameport_get_port_data(cm->gameport);
-
 		gameport_unregister_port(cm->gameport);
 		cm->gameport = NULL;
 
 		snd_cmipci_clear_bit(cm, CM_REG_FUNCTRL1, CM_JYSTK_EN);
-		release_and_free_resource(r);
 	}
 }
 #else
@@ -2902,34 +2899,22 @@ static inline int snd_cmipci_create_gameport(struct cmipci *cm, int dev) { retur
 static inline void snd_cmipci_free_gameport(struct cmipci *cm) { }
 #endif
 
-static int snd_cmipci_free(struct cmipci *cm)
+static void snd_cmipci_free(struct snd_card *card)
 {
-	if (cm->irq >= 0) {
-		snd_cmipci_clear_bit(cm, CM_REG_MISC_CTRL, CM_FM_EN);
-		snd_cmipci_clear_bit(cm, CM_REG_LEGACY_CTRL, CM_ENSPDOUT);
-		snd_cmipci_write(cm, CM_REG_INT_HLDCLR, 0);  /* disable ints */
-		snd_cmipci_ch_reset(cm, CM_CH_PLAY);
-		snd_cmipci_ch_reset(cm, CM_CH_CAPT);
-		snd_cmipci_write(cm, CM_REG_FUNCTRL0, 0); /* disable channels */
-		snd_cmipci_write(cm, CM_REG_FUNCTRL1, 0);
+	struct cmipci *cm = card->private_data;
 
-		/* reset mixer */
-		snd_cmipci_mixer_write(cm, 0, 0);
+	snd_cmipci_clear_bit(cm, CM_REG_MISC_CTRL, CM_FM_EN);
+	snd_cmipci_clear_bit(cm, CM_REG_LEGACY_CTRL, CM_ENSPDOUT);
+	snd_cmipci_write(cm, CM_REG_INT_HLDCLR, 0);  /* disable ints */
+	snd_cmipci_ch_reset(cm, CM_CH_PLAY);
+	snd_cmipci_ch_reset(cm, CM_CH_CAPT);
+	snd_cmipci_write(cm, CM_REG_FUNCTRL0, 0); /* disable channels */
+	snd_cmipci_write(cm, CM_REG_FUNCTRL1, 0);
 
-		free_irq(cm->irq, cm);
-	}
+	/* reset mixer */
+	snd_cmipci_mixer_write(cm, 0, 0);
 
 	snd_cmipci_free_gameport(cm);
-	pci_release_regions(cm->pci);
-	pci_disable_device(cm->pci);
-	kfree(cm);
-	return 0;
-}
-
-static int snd_cmipci_dev_free(struct snd_device *device)
-{
-	struct cmipci *cm = device->device_data;
-	return snd_cmipci_free(cm);
 }
 
 static int snd_cmipci_create_fm(struct cmipci *cm, long fm_port)
@@ -2988,13 +2973,10 @@ static int snd_cmipci_create_fm(struct cmipci *cm, long fm_port)
 }
 
 static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
-			     int dev, struct cmipci **rcmipci)
+			     int dev)
 {
-	struct cmipci *cm;
+	struct cmipci *cm = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_cmipci_dev_free,
-	};
 	unsigned int val;
 	long iomidi = 0;
 	int integrated_midi = 0;
@@ -3005,18 +2987,10 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 		{ },
 	};
 
-	*rcmipci = NULL;
-
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
-	cm = kzalloc(sizeof(*cm), GFP_KERNEL);
-	if (cm == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
-
 	spin_lock_init(&cm->reg_lock);
 	mutex_init(&cm->open_mutex);
 	cm->device = pci->device;
@@ -3028,21 +3002,18 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 	cm->channel[0].is_dac = cm->channel[1].is_dac = 1; /* dual DAC mode */
 
 	err = pci_request_regions(pci, card->driver);
-	if (err < 0) {
-		kfree(cm);
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 	cm->iobase = pci_resource_start(pci, 0);
 
-	if (request_irq(pci->irq, snd_cmipci_interrupt,
-			IRQF_SHARED, KBUILD_MODNAME, cm)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_cmipci_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, cm)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_cmipci_free(cm);
 		return -EBUSY;
 	}
 	cm->irq = pci->irq;
 	card->sync_irq = cm->irq;
+	card->private_free = snd_cmipci_free;
 
 	pci_set_master(cm->pci);
 
@@ -3142,12 +3113,6 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 	sprintf(card->longname, "%s%s at %#lx, irq %i",
 		card->shortname, modelstr, cm->iobase, cm->irq);
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, cm, &ops);
-	if (err < 0) {
-		snd_cmipci_free(cm);
-		return err;
-	}
-
 	if (cm->chip_version >= 39) {
 		val = snd_cmipci_read_b(cm, CM_REG_MPU_PCI + 1);
 		if (val != 0x00 && val != 0xff) {
@@ -3240,7 +3205,6 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 	if (snd_cmipci_create_gameport(cm, dev) < 0)
 		snd_cmipci_clear_bit(cm, CM_REG_FUNCTRL1, CM_JYSTK_EN);
 
-	*rcmipci = cm;
 	return 0;
 }
 
@@ -3264,10 +3228,11 @@ static int snd_cmipci_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*cm), &card);
 	if (err < 0)
 		return err;
+	cm = card->private_data;
 	
 	switch (pci->device) {
 	case PCI_DEVICE_ID_CMEDIA_CM8738:
@@ -3283,31 +3248,19 @@ static int snd_cmipci_probe(struct pci_dev *pci,
 		break;
 	}
 
-	err = snd_cmipci_create(card, pci, dev, &cm);
+	err = snd_cmipci_create(card, pci, dev);
 	if (err < 0)
-		goto free_card;
-
-	card->private_data = cm;
+		return err;
 
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
 }
 
-static void snd_cmipci_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
-
 #ifdef CONFIG_PM_SLEEP
 /*
  * power management
@@ -3382,7 +3335,6 @@ static struct pci_driver cmipci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_cmipci_ids,
 	.probe = snd_cmipci_probe,
-	.remove = snd_cmipci_remove,
 	.driver = {
 		.pm = SND_CMIPCI_PM_OPS,
 	},
-- 
2.26.2

