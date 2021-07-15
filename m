Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5653C9A3F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40173170E;
	Thu, 15 Jul 2021 10:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40173170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336691;
	bh=NcrN6L4WZTUj1jg6eN92u1KO9xlQjaJzRLodgbjRVqY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jG/ip1LMUmBbAXrbjGuQeJVboHwdcPxXtJRRyD4ZlcuI+kABbTY2/5LVPOdopUDh+
	 ++T+HyWbWh4VumwAEPpgFWh8n7n8bR+hiH1ofa3zODExKM5fzDry1rpF9MxEtMq1xx
	 /k/icnQdvcZtu7yDQzfY65takkz7Dy3/5879NCiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E50CF80612;
	Thu, 15 Jul 2021 10:00:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9BABF804F3; Thu, 15 Jul 2021 10:00:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBAA6F804F3
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBAA6F804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="HkwGEo0D"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="lNe71KBU"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A39AD2284F
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nus57fjny4yCUjw8vUksNK+8q7u3TAt5nxvdIRA/wE=;
 b=HkwGEo0DNkjfWoI5yqxRFdcG8u2FapvfCwkLVIo7a0DtNyPHavDFRYGYOUCe7hA921y7AD
 Q1qeTPWBMJjYZC2wvuxTyGUWls/0KHY/8V1DW+TUAVIH9k/+LumvmpNt5WkYwKLZdWWJiD
 uGCfMfgbIhNN2HmFO5RonG3tAVajTak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nus57fjny4yCUjw8vUksNK+8q7u3TAt5nxvdIRA/wE=;
 b=lNe71KBUMDUG0UNloT5rvbF1BLk/BluonD8iFPmrxt2R1GmfF+fi2HyTXMM8St4pqTMi8S
 2K4fOy7S6WJcy8CQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 914C4A3B8D;
 Thu, 15 Jul 2021 08:00:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 26/79] ALSA: ali5451: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:58:48 +0200
Message-Id: <20210715075941.23332-27-tiwai@suse.de>
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

This patch converts the resource management in PCI ali5451 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ali5451/ali5451.c | 88 +++++++++----------------------------
 1 file changed, 20 insertions(+), 68 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 0d66b92466d5..ccbf9e2c72d6 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1914,22 +1914,14 @@ static SIMPLE_DEV_PM_OPS(ali_pm, ali_suspend, ali_resume);
 #define ALI_PM_OPS	NULL
 #endif /* CONFIG_PM_SLEEP */
 
-static int snd_ali_free(struct snd_ali * codec)
+static void snd_ali_free(struct snd_card *card)
 {
+	struct snd_ali *codec = card->private_data;
+
 	if (codec->hw_initialized)
 		snd_ali_disable_address_interrupt(codec);
-	if (codec->irq >= 0)
-		free_irq(codec->irq, codec);
-	if (codec->port)
-		pci_release_regions(codec->pci);
-	pci_disable_device(codec->pci);
-#ifdef CONFIG_PM_SLEEP
-	kfree(codec->image);
-#endif
 	pci_dev_put(codec->pci_m1533);
 	pci_dev_put(codec->pci_m7101);
-	kfree(codec);
-	return 0;
 }
 
 static int snd_ali_chip_init(struct snd_ali *codec)
@@ -2017,8 +2009,9 @@ static int snd_ali_resources(struct snd_ali *codec)
 		return err;
 	codec->port = pci_resource_start(codec->pci, 0);
 
-	if (request_irq(codec->pci->irq, snd_ali_card_interrupt,
-			IRQF_SHARED, KBUILD_MODNAME, codec)) {
+	if (devm_request_irq(&codec->pci->dev, codec->pci->irq,
+			     snd_ali_card_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, codec)) {
 		dev_err(codec->card->dev, "Unable to request irq.\n");
 		return -EBUSY;
 	}
@@ -2027,48 +2020,29 @@ static int snd_ali_resources(struct snd_ali *codec)
 	dev_dbg(codec->card->dev, "resources allocated.\n");
 	return 0;
 }
-static int snd_ali_dev_free(struct snd_device *device)
-{
-	struct snd_ali *codec = device->device_data;
-	snd_ali_free(codec);
-	return 0;
-}
 
 static int snd_ali_create(struct snd_card *card,
 			  struct pci_dev *pci,
 			  int pcm_streams,
-			  int spdif_support,
-			  struct snd_ali **r_ali)
+			  int spdif_support)
 {
 	struct snd_ali *codec;
 	int i, err;
 	unsigned short cmdw;
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_ali_dev_free,
-        };
-
-	*r_ali = NULL;
 
 	dev_dbg(card->dev, "creating ...\n");
 
 	/* enable PCI device */
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 	/* check, if we can restrict PCI DMA transfers to 31 bits */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(31))) {
 		dev_err(card->dev,
 			"architecture does not support 31bit PCI busmaster DMA\n");
-		pci_disable_device(pci);
 		return -ENXIO;
 	}
 
-	codec = kzalloc(sizeof(*codec), GFP_KERNEL);
-	if (!codec) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
-
 	spin_lock_init(&codec->reg_lock);
 	spin_lock_init(&codec->voice_alloc);
 
@@ -2089,12 +2063,10 @@ static int snd_ali_create(struct snd_card *card,
 		cmdw |= PCI_COMMAND_IO;
 		pci_write_config_word(pci, PCI_COMMAND, cmdw);
 	}
-	pci_set_master(pci);
 	
-	if (snd_ali_resources(codec)) {
-		snd_ali_free(codec);
+	if (snd_ali_resources(codec))
 		return -EBUSY;
-	}
+	card->private_free = snd_ali_free;
 
 	codec->synth.chmap = 0;
 	codec->synth.chcnt = 0;
@@ -2121,24 +2093,15 @@ static int snd_ali_create(struct snd_card *card,
 	codec->pci_m1533 = pci_get_device(0x10b9, 0x1533, NULL);
 	if (!codec->pci_m1533) {
 		dev_err(card->dev, "cannot find ALi 1533 chip.\n");
-		snd_ali_free(codec);
 		return -ENODEV;
 	}
 	/* M7101: power management */
 	codec->pci_m7101 = pci_get_device(0x10b9, 0x7101, NULL);
 	if (!codec->pci_m7101 && codec->revision == ALI_5451_V02) {
 		dev_err(card->dev, "cannot find ALi 7101 chip.\n");
-		snd_ali_free(codec);
 		return -ENODEV;
 	}
 
-	dev_dbg(card->dev, "snd_device_new is called.\n");
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, codec, &ops);
-	if (err < 0) {
-		snd_ali_free(codec);
-		return err;
-	}
-
 	/* initialise synth voices*/
 	for (i = 0; i < ALI_CHANNELS; i++)
 		codec->synth.voices[i].number = i;
@@ -2150,16 +2113,14 @@ static int snd_ali_create(struct snd_card *card,
 	}
 
 #ifdef CONFIG_PM_SLEEP
-	codec->image = kmalloc(sizeof(*codec->image), GFP_KERNEL);
+	codec->image = devm_kmalloc(&pci->dev, sizeof(*codec->image),
+				    GFP_KERNEL);
 	if (!codec->image)
 		dev_warn(card->dev, "can't allocate apm buffer\n");
 #endif
 
 	snd_ali_enable_address_interrupt(codec);
 	codec->hw_initialized = 1;
-
-	*r_ali = codec;
-	dev_dbg(card->dev, "created.\n");
 	return 0;
 }
 
@@ -2172,24 +2133,25 @@ static int snd_ali_probe(struct pci_dev *pci,
 
 	dev_dbg(&pci->dev, "probe ...\n");
 
-	err = snd_card_new(&pci->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&pci->dev, index, id, THIS_MODULE,
+				sizeof(*codec), &card);
 	if (err < 0)
 		return err;
+	codec = card->private_data;
 
-	err = snd_ali_create(card, pci, pcm_channels, spdif, &codec);
+	err = snd_ali_create(card, pci, pcm_channels, spdif);
 	if (err < 0)
-		goto error;
-	card->private_data = codec;
+		return err;
 
 	dev_dbg(&pci->dev, "mixer building ...\n");
 	err = snd_ali_mixer(codec);
 	if (err < 0)
-		goto error;
+		return err;
 	
 	dev_dbg(&pci->dev, "pcm building ...\n");
 	err = snd_ali_build_pcms(codec);
 	if (err < 0)
-		goto error;
+		return err;
 
 	snd_ali_proc_init(codec);
 
@@ -2202,26 +2164,16 @@ static int snd_ali_probe(struct pci_dev *pci,
 	dev_dbg(&pci->dev, "register card.\n");
 	err = snd_card_register(card);
 	if (err < 0)
-		goto error;
+		return err;
 
 	pci_set_drvdata(pci, card);
 	return 0;
-
- error:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_ali_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 static struct pci_driver ali5451_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_ali_ids,
 	.probe = snd_ali_probe,
-	.remove = snd_ali_remove,
 	.driver = {
 		.pm = ALI_PM_OPS,
 	},
-- 
2.26.2

