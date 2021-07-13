Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A438D3C727E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:43:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FBD416EF;
	Tue, 13 Jul 2021 16:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FBD416EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187394;
	bh=F5y1crdpP6cv74GNcBicqAssaP3F1QQ+7EsaEaML/K4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KEh4s4rSvv+KpXFSfdjPiMneZozeza10nPQdvChq3nSVpVRQY6H1sCVH8SKckpOqY
	 dlH/TdcL7OhlDJ/z4XuM839INzgP7O0UkdQw+a479R5d8VKSjyhYEy6HS0ICQRiX3D
	 KAAgwrxaXysu0B2ROsEWKo1OJeU0BBT1kJ0qweP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADCCEF805F4;
	Tue, 13 Jul 2021 16:30:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20274F80525; Tue, 13 Jul 2021 16:29:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24F05F80508
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24F05F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="RAd1Oq4m"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="1AQ3tGyK"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id EE323201DA
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tzlv32loXGZtJmQcuqUnxjn9bVEdumHl6RLnpXoIf9I=;
 b=RAd1Oq4mcYUcyrgQIVI9A6UAdbVLNHrADcaA5mTQLr+cWD5NquanuXcPD1RTluDBu9qO04
 O7oCQuzaf+4CI/JuEDHQtZhl56hQjvkAeq73jbeKReYyUagXSgfgSPtkyRZEFN09mL8wBx
 b1/8hcoA6rh8g/6BUwzq9MnpoOiRmfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186574;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tzlv32loXGZtJmQcuqUnxjn9bVEdumHl6RLnpXoIf9I=;
 b=1AQ3tGyKtpjc+yD6Jw2r6jLfPSOs6KCijTZwhMefOHnhEDvK+YRygyZAmF5kYNz58Ge4fn
 Mh1Ulah/NFgxzECw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id DBF14A3B8E;
 Tue, 13 Jul 2021 14:29:34 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 32/51] ALSA: emu10k1: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:28:38 +0200
Message-Id: <20210713142857.19654-33-tiwai@suse.de>
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

This patch converts the resource management in PCI emu10k1 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, the page allocations are done
with the devres helper, and the card object release is managed now via
card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/emu10k1.h          |   6 +-
 sound/pci/emu10k1/emu10k1.c      |  53 +++++++---------
 sound/pci/emu10k1/emu10k1_main.c | 102 ++++++++-----------------------
 sound/pci/emu10k1/p16v.c         |  22 ++-----
 4 files changed, 52 insertions(+), 131 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 468e38c54dd3..39787fecc8d9 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1701,7 +1701,7 @@ struct snd_emu10k1 {
 	struct snd_dma_buffer silent_page;	/* silent page */
 	struct snd_dma_buffer ptb_pages;	/* page table pages */
 	struct snd_dma_device p16v_dma_dev;
-	struct snd_dma_buffer p16v_buffer;
+	struct snd_dma_buffer *p16v_buffer;
 
 	struct snd_util_memhdr *memhdr;		/* page allocation list */
 
@@ -1796,14 +1796,12 @@ int snd_emu10k1_create(struct snd_card *card,
 		       unsigned short extout_mask,
 		       long max_cache_bytes,
 		       int enable_ir,
-		       uint subsystem,
-		       struct snd_emu10k1 ** remu);
+		       uint subsystem);
 
 int snd_emu10k1_pcm(struct snd_emu10k1 *emu, int device);
 int snd_emu10k1_pcm_mic(struct snd_emu10k1 *emu, int device);
 int snd_emu10k1_pcm_efx(struct snd_emu10k1 *emu, int device);
 int snd_p16v_pcm(struct snd_emu10k1 *emu, int device);
-int snd_p16v_free(struct snd_emu10k1 * emu);
 int snd_p16v_mixer(struct snd_emu10k1 * emu);
 int snd_emu10k1_pcm_multi(struct snd_emu10k1 *emu, int device);
 int snd_emu10k1_fx8010_pcm(struct snd_emu10k1 *emu, int device);
diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index 887bfb3c1e17..672af4b9597b 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -99,67 +99,67 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*emu), &card);
 	if (err < 0)
 		return err;
+	emu = card->private_data;
+
 	if (max_buffer_size[dev] < 32)
 		max_buffer_size[dev] = 32;
 	else if (max_buffer_size[dev] > 1024)
 		max_buffer_size[dev] = 1024;
 	err = snd_emu10k1_create(card, pci, extin[dev], extout[dev],
 				 (long)max_buffer_size[dev] * 1024 * 1024,
-				 enable_ir[dev], subsystem[dev],
-				 &emu);
+				 enable_ir[dev], subsystem[dev]);
 	if (err < 0)
-		goto error;
-	card->private_data = emu;
+		return err;
 	emu->delay_pcm_irq = delay_pcm_irq[dev] & 0x1f;
 	err = snd_emu10k1_pcm(emu, 0);
 	if (err < 0)
-		goto error;
+		return err;
 	err = snd_emu10k1_pcm_mic(emu, 1);
 	if (err < 0)
-		goto error;
+		return err;
 	err = snd_emu10k1_pcm_efx(emu, 2);
 	if (err < 0)
-		goto error;
+		return err;
 	/* This stores the periods table. */
 	if (emu->card_capabilities->ca0151_chip) { /* P16V */	
-		err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
-					  1024, &emu->p16v_buffer);
-		if (err < 0)
-			goto error;
+		emu->p16v_buffer =
+			snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV, 1024);
+		if (!emu->p16v_buffer)
+			return -ENOMEM;
 	}
 
 	err = snd_emu10k1_mixer(emu, 0, 3);
 	if (err < 0)
-		goto error;
+		return err;
 	
 	err = snd_emu10k1_timer(emu, 0);
 	if (err < 0)
-		goto error;
+		return err;
 
 	err = snd_emu10k1_pcm_multi(emu, 3);
 	if (err < 0)
-		goto error;
+		return err;
 	if (emu->card_capabilities->ca0151_chip) { /* P16V */
 		err = snd_p16v_pcm(emu, 4);
 		if (err < 0)
-			goto error;
+			return err;
 	}
 	if (emu->audigy) {
 		err = snd_emu10k1_audigy_midi(emu);
 		if (err < 0)
-			goto error;
+			return err;
 	} else {
 		err = snd_emu10k1_midi(emu);
 		if (err < 0)
-			goto error;
+			return err;
 	}
 	err = snd_emu10k1_fx8010_new(emu, 0);
 	if (err < 0)
-		goto error;
+		return err;
 #ifdef ENABLE_SYNTH
 	if (snd_seq_device_new(card, 1, SNDRV_SEQ_DEV_ID_EMU10K1_SYNTH,
 			       sizeof(struct snd_emu10k1_synth_arg), &wave) < 0 ||
@@ -187,7 +187,7 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto error;
+		return err;
 
 	if (emu->card_capabilities->emu_model)
 		schedule_delayed_work(&emu->emu1010.firmware_work, 0);
@@ -195,18 +195,8 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
-
- error:
-	snd_card_free(card);
-	return err;
 }
 
-static void snd_card_emu10k1_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
-
 #ifdef CONFIG_PM_SLEEP
 static int snd_emu10k1_suspend(struct device *dev)
 {
@@ -263,7 +253,6 @@ static struct pci_driver emu10k1_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_emu10k1_ids,
 	.probe = snd_card_emu10k1_probe,
-	.remove = snd_card_emu10k1_remove,
 	.driver = {
 		.pm = SND_EMU10K1_PM_OPS,
 	},
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 24a2fd706d69..86cc1ca025e4 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1242,8 +1242,10 @@ static int alloc_pm_buffer(struct snd_emu10k1 *emu);
 static void free_pm_buffer(struct snd_emu10k1 *emu);
 #endif
 
-static int snd_emu10k1_free(struct snd_emu10k1 *emu)
+static void snd_emu10k1_free(struct snd_card *card)
 {
+	struct snd_emu10k1 *emu = card->private_data;
+
 	if (emu->port) {	/* avoid access to already used hardware */
 		snd_emu10k1_fx8010_tram_setup(emu, 0);
 		snd_emu10k1_done(emu);
@@ -1256,8 +1258,6 @@ static int snd_emu10k1_free(struct snd_emu10k1 *emu)
 	cancel_delayed_work_sync(&emu->emu1010.firmware_work);
 	release_firmware(emu->firmware);
 	release_firmware(emu->dock_fw);
-	if (emu->irq >= 0)
-		free_irq(emu->irq, emu);
 	snd_util_memhdr_free(emu->memhdr);
 	if (emu->silent_page.area)
 		snd_dma_free_pages(&emu->silent_page);
@@ -1268,19 +1268,6 @@ static int snd_emu10k1_free(struct snd_emu10k1 *emu)
 #ifdef CONFIG_PM_SLEEP
 	free_pm_buffer(emu);
 #endif
-	if (emu->port)
-		pci_release_regions(emu->pci);
-	if (emu->card_capabilities->ca0151_chip) /* P16V */
-		snd_p16v_free(emu);
-	pci_disable_device(emu->pci);
-	kfree(emu);
-	return 0;
-}
-
-static int snd_emu10k1_dev_free(struct snd_device *device)
-{
-	struct snd_emu10k1 *emu = device->device_data;
-	return snd_emu10k1_free(emu);
 }
 
 static const struct snd_emu_chip_details emu_chip_details[] = {
@@ -1782,32 +1769,22 @@ int snd_emu10k1_create(struct snd_card *card,
 		       unsigned short extout_mask,
 		       long max_cache_bytes,
 		       int enable_ir,
-		       uint subsystem,
-		       struct snd_emu10k1 **remu)
+		       uint subsystem)
 {
-	struct snd_emu10k1 *emu;
+	struct snd_emu10k1 *emu = card->private_data;
 	int idx, err;
 	int is_audigy;
 	size_t page_table_size;
 	__le32 *pgtbl;
 	unsigned int silent_page;
 	const struct snd_emu_chip_details *c;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_emu10k1_dev_free,
-	};
-
-	*remu = NULL;
 
 	/* enable PCI device */
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
-	emu = kzalloc(sizeof(*emu), GFP_KERNEL);
-	if (emu == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
+	card->private_free = snd_emu10k1_free;
 	emu->card = card;
 	spin_lock_init(&emu->reg_lock);
 	spin_lock_init(&emu->emu_lock);
@@ -1850,8 +1827,6 @@ int snd_emu10k1_create(struct snd_card *card,
 	}
 	if (c->vendor == 0) {
 		dev_err(card->dev, "emu10k1: Card not recognised\n");
-		kfree(emu);
-		pci_disable_device(pci);
 		return -ENOENT;
 	}
 	emu->card_capabilities = c;
@@ -1883,8 +1858,6 @@ int snd_emu10k1_create(struct snd_card *card,
 		dev_err(card->dev,
 			"architecture does not support PCI busmaster DMA with mask 0x%lx\n",
 			emu->dma_mask);
-		kfree(emu);
-		pci_disable_device(pci);
 		return -ENXIO;
 	}
 	if (is_audigy)
@@ -1893,11 +1866,8 @@ int snd_emu10k1_create(struct snd_card *card,
 		emu->gpr_base = FXGPREGBASE;
 
 	err = pci_request_regions(pci, "EMU10K1");
-	if (err < 0) {
-		kfree(emu);
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 	emu->port = pci_resource_start(pci, 0);
 
 	emu->max_cache_pages = max_cache_bytes >> PAGE_SHIFT;
@@ -1905,10 +1875,8 @@ int snd_emu10k1_create(struct snd_card *card,
 	page_table_size = sizeof(u32) * (emu->address_mode ? MAXPAGES1 :
 					 MAXPAGES0);
 	if (snd_emu10k1_alloc_pages_maybe_wider(emu, page_table_size,
-						&emu->ptb_pages) < 0) {
-		err = -ENOMEM;
-		goto error;
-	}
+						&emu->ptb_pages) < 0)
+		return -ENOMEM;
 	dev_dbg(card->dev, "page table address range is %.8lx:%.8lx\n",
 		(unsigned long)emu->ptb_pages.addr,
 		(unsigned long)(emu->ptb_pages.addr + emu->ptb_pages.bytes));
@@ -1917,26 +1885,20 @@ int snd_emu10k1_create(struct snd_card *card,
 						 emu->max_cache_pages));
 	emu->page_addr_table = vmalloc(array_size(sizeof(unsigned long),
 						  emu->max_cache_pages));
-	if (emu->page_ptr_table == NULL || emu->page_addr_table == NULL) {
-		err = -ENOMEM;
-		goto error;
-	}
+	if (!emu->page_ptr_table || !emu->page_addr_table)
+		return -ENOMEM;
 
 	if (snd_emu10k1_alloc_pages_maybe_wider(emu, EMUPAGESIZE,
-						&emu->silent_page) < 0) {
-		err = -ENOMEM;
-		goto error;
-	}
+						&emu->silent_page) < 0)
+		return -ENOMEM;
 	dev_dbg(card->dev, "silent page range is %.8lx:%.8lx\n",
 		(unsigned long)emu->silent_page.addr,
 		(unsigned long)(emu->silent_page.addr +
 				emu->silent_page.bytes));
 
 	emu->memhdr = snd_util_memhdr_new(emu->max_cache_pages * PAGE_SIZE);
-	if (emu->memhdr == NULL) {
-		err = -ENOMEM;
-		goto error;
-	}
+	if (!emu->memhdr)
+		return -ENOMEM;
 	emu->memhdr->block_extra_size = sizeof(struct snd_emu10k1_memblk) -
 		sizeof(struct snd_util_memblk);
 
@@ -1954,18 +1916,16 @@ int snd_emu10k1_create(struct snd_card *card,
 	if (emu->card_capabilities->ca_cardbus_chip) {
 		err = snd_emu10k1_cardbus_init(emu);
 		if (err < 0)
-			goto error;
+			return err;
 	}
 	if (emu->card_capabilities->ecard) {
 		err = snd_emu10k1_ecard_init(emu);
 		if (err < 0)
-			goto error;
+			return err;
 	} else if (emu->card_capabilities->emu_model) {
 		err = snd_emu10k1_emu1010_init(emu);
-		if (err < 0) {
-			snd_emu10k1_free(emu);
+		if (err < 0)
 			return err;
-		}
 	} else {
 		/* 5.1: Enable the additional AC97 Slots. If the emu10k1 version
 			does not support this, it shouldn't do any harm */
@@ -1979,11 +1939,9 @@ int snd_emu10k1_create(struct snd_card *card,
 	emu->fx8010.etram_pages.bytes = 0;
 
 	/* irq handler must be registered after I/O ports are activated */
-	if (request_irq(pci->irq, snd_emu10k1_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, emu)) {
-		err = -EBUSY;
-		goto error;
-	}
+	if (devm_request_irq(&pci->dev, pci->irq, snd_emu10k1_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, emu))
+		return -EBUSY;
 	emu->irq = pci->irq;
 	card->sync_irq = emu->irq;
 
@@ -2022,33 +1980,23 @@ int snd_emu10k1_create(struct snd_card *card,
 
 	err = snd_emu10k1_init(emu, enable_ir, 0);
 	if (err < 0)
-		goto error;
+		return err;
 #ifdef CONFIG_PM_SLEEP
 	err = alloc_pm_buffer(emu);
 	if (err < 0)
-		goto error;
+		return err;
 #endif
 
 	/*  Initialize the effect engine */
 	err = snd_emu10k1_init_efx(emu);
 	if (err < 0)
-		goto error;
+		return err;
 	snd_emu10k1_audio_enable(emu);
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, emu, &ops);
-	if (err < 0)
-		goto error;
-
 #ifdef CONFIG_SND_PROC_FS
 	snd_emu10k1_proc_init(emu);
 #endif
-
-	*remu = emu;
 	return 0;
-
- error:
-	snd_emu10k1_free(emu);
-	return err;
 }
 
 #ifdef CONFIG_PM_SLEEP
diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index ff2a3974c824..18a1b0740e6b 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -290,7 +290,7 @@ static int snd_p16v_pcm_prepare_playback(struct snd_pcm_substream *substream)
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int channel = substream->pcm->device - emu->p16v_device_offset;
-	u32 *table_base = (u32 *)(emu->p16v_buffer.area+(8*16*channel));
+	u32 *table_base = (u32 *)(emu->p16v_buffer->area+(8*16*channel));
 	u32 period_size_bytes = frames_to_bytes(runtime, runtime->period_size);
 	int i;
 	u32 tmp;
@@ -308,8 +308,8 @@ static int snd_p16v_pcm_prepare_playback(struct snd_pcm_substream *substream)
 		   runtime->dma_addr, runtime->dma_area, table_base);
 	dev_dbg(emu->card->dev,
 		"dma_addr=%x, dma_area=%p, dma_bytes(size)=%x\n",
-		   emu->p16v_buffer.addr, emu->p16v_buffer.area,
-		   emu->p16v_buffer.bytes);
+		   emu->p16v_buffer->addr, emu->p16v_buffer->area,
+		   emu->p16v_buffer->bytes);
 #endif /* debug */
 	tmp = snd_emu10k1_ptr_read(emu, A_SPDIF_SAMPLERATE, channel);
         switch (runtime->rate) {
@@ -333,7 +333,7 @@ static int snd_p16v_pcm_prepare_playback(struct snd_pcm_substream *substream)
 		table_base[(i*2)+1]=period_size_bytes<<16;
 	}
  
-	snd_emu10k1_ptr20_write(emu, PLAYBACK_LIST_ADDR, channel, emu->p16v_buffer.addr+(8*16*channel));
+	snd_emu10k1_ptr20_write(emu, PLAYBACK_LIST_ADDR, channel, emu->p16v_buffer->addr+(8*16*channel));
 	snd_emu10k1_ptr20_write(emu, PLAYBACK_LIST_SIZE, channel, (runtime->periods - 1) << 19);
 	snd_emu10k1_ptr20_write(emu, PLAYBACK_LIST_PTR, channel, 0);
 	snd_emu10k1_ptr20_write(emu, PLAYBACK_DMA_ADDR, channel, runtime->dma_addr);
@@ -567,20 +567,6 @@ static const struct snd_pcm_ops snd_p16v_capture_ops = {
 	.pointer =     snd_p16v_pcm_pointer_capture,
 };
 
-
-int snd_p16v_free(struct snd_emu10k1 *chip)
-{
-	// release the data
-	if (chip->p16v_buffer.area) {
-		snd_dma_free_pages(&chip->p16v_buffer);
-		/*
-		dev_dbg(chip->card->dev, "period lables free: %p\n",
-			   &chip->p16v_buffer);
-		*/
-	}
-	return 0;
-}
-
 int snd_p16v_pcm(struct snd_emu10k1 *emu, int device)
 {
 	struct snd_pcm *pcm;
-- 
2.26.2

