Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8A3C9A62
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:19:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B377C16F9;
	Thu, 15 Jul 2021 10:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B377C16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337158;
	bh=m6ILTGs7GK2tsm14WjfjsUSsqSUzELYYb8MomHLz2UY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fE6XUL82eNpHmAalrupV7tXwFVl4h/DjHinlwdiGb3WAsAQ3j9IoAg1rc6MWREQjR
	 Oszp2atfEWkWi6LzUv9HSFWyEeVrvnnWeYI4x5tbybSdwvWjafCmPFjdh8ow80KzXG
	 6k0LfBnANLselz/lZL9nBlkNNymMLgPI05mZygDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D653AF80534;
	Thu, 15 Jul 2021 10:01:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06D59F806ED; Thu, 15 Jul 2021 10:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37812F80536
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37812F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="E263Wa9K"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="7ho2o5V0"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id ECCB82284F
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eZyHW0wparX5iqE8KWGZU+8cEcEGbfEFwNVc/IO0SY=;
 b=E263Wa9KFiq+xubo096qQJFASRn1vcDwAw8fvCXRHslqH0ntQy29mGFtUNhOqnTjNTCwR9
 u4GH6gNVhEyZKwNRn2blaxb9u7Xrv9j/4Pk1h1DtBxZ8JYtb/cKkOIHUul6+EsCC0XtmRA
 PH/HO8WG7RIu/G4GDvta9vSCeCP8JeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336012;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eZyHW0wparX5iqE8KWGZU+8cEcEGbfEFwNVc/IO0SY=;
 b=7ho2o5V0Oxs9Mt+zYGiDao73mzdskxj+0QF8THyDbS0cTWeLcVxFtbxBpCM6vZdUDTFYUM
 tAyH3O3dbJXkYGBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D9D39A3B99;
 Thu, 15 Jul 2021 08:00:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 48/79] ALSA: trident: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:59:10 +0200
Message-Id: <20210715075941.23332-49-tiwai@suse.de>
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

This patch converts the resource management in PCI trident driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, the page allocations are done
with the devres helper, and the card object release is managed now via
card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/trident/trident.c        | 39 ++++---------
 sound/pci/trident/trident.h        |  7 +--
 sound/pci/trident/trident_main.c   | 90 +++++++++---------------------
 sound/pci/trident/trident_memory.c |  8 +--
 4 files changed, 44 insertions(+), 100 deletions(-)

diff --git a/sound/pci/trident/trident.c b/sound/pci/trident/trident.c
index 60e4dca28c2b..9922ab40798c 100644
--- a/sound/pci/trident/trident.c
+++ b/sound/pci/trident/trident.c
@@ -62,21 +62,18 @@ static int snd_trident_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*trident), &card);
 	if (err < 0)
 		return err;
+	trident = card->private_data;
 
 	err = snd_trident_create(card, pci,
 				 pcm_channels[dev],
 				 ((pci->vendor << 16) | pci->device) == TRIDENT_DEVICE_ID_SI7018 ? 1 : 2,
-				 wavetable_size[dev],
-				 &trident);
-	if (err < 0) {
-		snd_card_free(card);
+				 wavetable_size[dev]);
+	if (err < 0)
 		return err;
-	}
-	card->private_data = trident;
 
 	switch (trident->device) {
 	case TRIDENT_DEVICE_ID_DX:
@@ -102,26 +99,20 @@ static int snd_trident_probe(struct pci_dev *pci,
 		card->shortname, trident->port, trident->irq);
 
 	err = snd_trident_pcm(trident, pcm_dev++);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	switch (trident->device) {
 	case TRIDENT_DEVICE_ID_DX:
 	case TRIDENT_DEVICE_ID_NX:
 		err = snd_trident_foldback_pcm(trident, pcm_dev++);
-		if (err < 0) {
-			snd_card_free(card);
+		if (err < 0)
 			return err;
-		}
 		break;
 	}
 	if (trident->device == TRIDENT_DEVICE_ID_NX || trident->device == TRIDENT_DEVICE_ID_SI7018) {
 		err = snd_trident_spdif_pcm(trident, pcm_dev++);
-		if (err < 0) {
-			snd_card_free(card);
+		if (err < 0)
 			return err;
-		}
 	}
 	if (trident->device != TRIDENT_DEVICE_ID_SI7018) {
 		err = snd_mpu401_uart_new(card, 0, MPU401_HW_TRID4DWAVE,
@@ -129,34 +120,24 @@ static int snd_trident_probe(struct pci_dev *pci,
 					  MPU401_INFO_INTEGRATED |
 					  MPU401_INFO_IRQ_HOOK,
 					  -1, &trident->rmidi);
-		if (err < 0) {
-			snd_card_free(card);
+		if (err < 0)
 			return err;
-		}
 	}
 
 	snd_trident_create_gameport(trident);
 
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
 
-static void snd_trident_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 static struct pci_driver trident_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_trident_ids,
 	.probe = snd_trident_probe,
-	.remove = snd_trident_remove,
 #ifdef CONFIG_PM_SLEEP
 	.driver = {
 		.pm = &snd_trident_pm,
diff --git a/sound/pci/trident/trident.h b/sound/pci/trident/trident.h
index c579a44bb9ae..9768a7fc2349 100644
--- a/sound/pci/trident/trident.h
+++ b/sound/pci/trident/trident.h
@@ -251,9 +251,9 @@ struct snd_trident_memblk_arg {
 struct snd_trident_tlb {
 	__le32 *entries;		/* 16k-aligned TLB table */
 	dma_addr_t entries_dmaaddr;	/* 16k-aligned PCI address to TLB table */
-	struct snd_dma_buffer buffer;
+	struct snd_dma_buffer *buffer;
 	struct snd_util_memhdr * memhdr;	/* page allocation list */
-	struct snd_dma_buffer silent_page;
+	struct snd_dma_buffer *silent_page;
 };
 
 struct snd_trident_voice {
@@ -400,8 +400,7 @@ int snd_trident_create(struct snd_card *card,
 		       struct pci_dev *pci,
 		       int pcm_streams,
 		       int pcm_spdif_device,
-		       int max_wavetable_size,
-		       struct snd_trident ** rtrident);
+		       int max_wavetable_size);
 int snd_trident_create_gameport(struct snd_trident *trident);
 
 int snd_trident_pcm(struct snd_trident *trident, int device);
diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index cfbca3bd60ed..e98eea1e6d81 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -42,7 +42,7 @@ static int snd_trident_sis_reset(struct snd_trident *trident);
 
 static void snd_trident_clear_voices(struct snd_trident * trident,
 				     unsigned short v_min, unsigned short v_max);
-static int snd_trident_free(struct snd_trident *trident);
+static void snd_trident_free(struct snd_card *card);
 
 /*
  *  common I/O routines
@@ -3299,12 +3299,6 @@ static void snd_trident_proc_init(struct snd_trident *trident)
 	snd_card_ro_proc_new(trident->card, s, trident, snd_trident_proc_read);
 }
 
-static int snd_trident_dev_free(struct snd_device *device)
-{
-	struct snd_trident *trident = device->device_data;
-	return snd_trident_free(trident);
-}
-
 /*---------------------------------------------------------------------------
    snd_trident_tlb_alloc
   
@@ -3324,23 +3318,27 @@ static int snd_trident_tlb_alloc(struct snd_trident *trident)
 	/* TLB array must be aligned to 16kB !!! so we allocate
 	   32kB region and correct offset when necessary */
 
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &trident->pci->dev,
-				2 * SNDRV_TRIDENT_MAX_PAGES * 4, &trident->tlb.buffer) < 0) {
+	trident->tlb.buffer =
+		snd_devm_alloc_pages(&trident->pci->dev, SNDRV_DMA_TYPE_DEV,
+				     2 * SNDRV_TRIDENT_MAX_PAGES * 4);
+	if (!trident->tlb.buffer) {
 		dev_err(trident->card->dev, "unable to allocate TLB buffer\n");
 		return -ENOMEM;
 	}
-	trident->tlb.entries = (__le32 *)ALIGN((unsigned long)trident->tlb.buffer.area, SNDRV_TRIDENT_MAX_PAGES * 4);
-	trident->tlb.entries_dmaaddr = ALIGN(trident->tlb.buffer.addr, SNDRV_TRIDENT_MAX_PAGES * 4);
+	trident->tlb.entries = (__le32 *)ALIGN((unsigned long)trident->tlb.buffer->area, SNDRV_TRIDENT_MAX_PAGES * 4);
+	trident->tlb.entries_dmaaddr = ALIGN(trident->tlb.buffer->addr, SNDRV_TRIDENT_MAX_PAGES * 4);
 
 	/* allocate and setup silent page and initialise TLB entries */
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &trident->pci->dev,
-				SNDRV_TRIDENT_PAGE_SIZE, &trident->tlb.silent_page) < 0) {
+	trident->tlb.silent_page =
+		snd_devm_alloc_pages(&trident->pci->dev, SNDRV_DMA_TYPE_DEV,
+				     SNDRV_TRIDENT_PAGE_SIZE);
+	if (!trident->tlb.silent_page) {
 		dev_err(trident->card->dev, "unable to allocate silent page\n");
 		return -ENOMEM;
 	}
-	memset(trident->tlb.silent_page.area, 0, SNDRV_TRIDENT_PAGE_SIZE);
+	memset(trident->tlb.silent_page->area, 0, SNDRV_TRIDENT_PAGE_SIZE);
 	for (i = 0; i < SNDRV_TRIDENT_MAX_PAGES; i++)
-		trident->tlb.entries[i] = cpu_to_le32(trident->tlb.silent_page.addr & ~(SNDRV_TRIDENT_PAGE_SIZE-1));
+		trident->tlb.entries[i] = cpu_to_le32(trident->tlb.silent_page->addr & ~(SNDRV_TRIDENT_PAGE_SIZE-1));
 
 	/* use emu memory block manager code to manage tlb page allocation */
 	trident->tlb.memhdr = snd_util_memhdr_new(SNDRV_TRIDENT_PAGE_SIZE * SNDRV_TRIDENT_MAX_PAGES);
@@ -3497,36 +3495,24 @@ int snd_trident_create(struct snd_card *card,
 		       struct pci_dev *pci,
 		       int pcm_streams,
 		       int pcm_spdif_device,
-		       int max_wavetable_size,
-		       struct snd_trident ** rtrident)
+		       int max_wavetable_size)
 {
-	struct snd_trident *trident;
+	struct snd_trident *trident = card->private_data;
 	int i, err;
 	struct snd_trident_voice *voice;
 	struct snd_trident_pcm_mixer *tmix;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_trident_dev_free,
-	};
-
-	*rtrident = NULL;
 
 	/* enable PCI device */
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 	/* check, if we can restrict PCI DMA transfers to 30 bits */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(30))) {
 		dev_err(card->dev,
 			"architecture does not support 30bit PCI busmaster DMA\n");
-		pci_disable_device(pci);
 		return -ENXIO;
 	}
 	
-	trident = kzalloc(sizeof(*trident), GFP_KERNEL);
-	if (trident == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
 	trident->device = (pci->vendor << 16) | pci->device;
 	trident->card = card;
 	trident->pci = pci;
@@ -3542,22 +3528,19 @@ int snd_trident_create(struct snd_card *card,
 		max_wavetable_size = 0;
 	trident->synth.max_size = max_wavetable_size * 1024;
 	trident->irq = -1;
+	card->private_free = snd_trident_free;
 
 	trident->midi_port = TRID_REG(trident, T4D_MPU401_BASE);
 	pci_set_master(pci);
 
 	err = pci_request_regions(pci, "Trident Audio");
-	if (err < 0) {
-		kfree(trident);
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 	trident->port = pci_resource_start(pci, 0);
 
-	if (request_irq(pci->irq, snd_trident_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, trident)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_trident_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, trident)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_trident_free(trident);
 		return -EBUSY;
 	}
 	trident->irq = pci->irq;
@@ -3565,13 +3548,10 @@ int snd_trident_create(struct snd_card *card,
 
 	/* allocate 16k-aligned TLB for NX cards */
 	trident->tlb.entries = NULL;
-	trident->tlb.buffer.area = NULL;
 	if (trident->device == TRIDENT_DEVICE_ID_NX) {
 		err = snd_trident_tlb_alloc(trident);
-		if (err < 0) {
-			snd_trident_free(trident);
+		if (err < 0)
 			return err;
-		}
 	}
 
 	trident->spdif_bits = trident->spdif_pcm_bits = SNDRV_PCM_DEFAULT_CON_SPDIF;
@@ -3591,16 +3571,8 @@ int snd_trident_create(struct snd_card *card,
 		snd_BUG();
 		break;
 	}
-	if (err < 0) {
-		snd_trident_free(trident);
-		return err;
-	}
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, trident, &ops);
-	if (err < 0) {
-		snd_trident_free(trident);
+	if (err < 0)
 		return err;
-	}
 
 	err = snd_trident_mixer(trident, pcm_spdif_device);
 	if (err < 0)
@@ -3624,7 +3596,6 @@ int snd_trident_create(struct snd_card *card,
 	snd_trident_enable_eso(trident);
 
 	snd_trident_proc_init(trident);
-	*rtrident = trident;
 	return 0;
 }
 
@@ -3634,14 +3605,16 @@ int snd_trident_create(struct snd_card *card,
    Description: This routine will free the device specific class for
                 the 4DWave card. 
                 
-   Parameters:  trident  - device specific private data for 4DWave card
+   Parameters:  card - card to release
 
    Returns:     None.
   
   ---------------------------------------------------------------------------*/
 
-static int snd_trident_free(struct snd_trident *trident)
+static void snd_trident_free(struct snd_card *card)
 {
+	struct snd_trident *trident = card->private_data;
+
 	snd_trident_free_gameport(trident);
 	snd_trident_disable_eso(trident);
 	// Disable S/PDIF out
@@ -3650,19 +3623,10 @@ static int snd_trident_free(struct snd_trident *trident)
 	else if (trident->device == TRIDENT_DEVICE_ID_SI7018) {
 		outl(0, TRID_REG(trident, SI_SERIAL_INTF_CTRL));
 	}
-	if (trident->irq >= 0)
-		free_irq(trident->irq, trident);
-	if (trident->tlb.buffer.area) {
+	if (trident->tlb.buffer) {
 		outl(0, TRID_REG(trident, NX_TLBC));
 		snd_util_memhdr_free(trident->tlb.memhdr);
-		if (trident->tlb.silent_page.area)
-			snd_dma_free_pages(&trident->tlb.silent_page);
-		snd_dma_free_pages(&trident->tlb.buffer);
 	}
-	pci_release_regions(trident->pci);
-	pci_disable_device(trident->pci);
-	kfree(trident);
-	return 0;
 }
 
 /*---------------------------------------------------------------------------
diff --git a/sound/pci/trident/trident_memory.c b/sound/pci/trident/trident_memory.c
index 4ad3855101c9..05de2b9f4ed7 100644
--- a/sound/pci/trident/trident_memory.c
+++ b/sound/pci/trident/trident_memory.c
@@ -31,7 +31,7 @@
 /* fill TLB entrie(s) corresponding to page with ptr */
 #define set_tlb_bus(trident,page,addr) __set_tlb_bus(trident,page,addr)
 /* fill TLB entrie(s) corresponding to page with silence pointer */
-#define set_silent_tlb(trident,page)	__set_tlb_bus(trident, page, trident->tlb.silent_page.addr)
+#define set_silent_tlb(trident,page)	__set_tlb_bus(trident, page, trident->tlb.silent_page->addr)
 /* get aligned page from offset address */
 #define get_aligned_page(offset)	((offset) >> 12)
 /* get offset address from aligned page */
@@ -58,8 +58,8 @@ static inline void set_tlb_bus(struct snd_trident *trident, int page,
 static inline void set_silent_tlb(struct snd_trident *trident, int page)
 {
 	page <<= 1;
-	__set_tlb_bus(trident, page, trident->tlb.silent_page.addr);
-	__set_tlb_bus(trident, page+1, trident->tlb.silent_page.addr);
+	__set_tlb_bus(trident, page, trident->tlb.silent_page->addr);
+	__set_tlb_bus(trident, page+1, trident->tlb.silent_page->addr);
 }
 
 #else
@@ -92,7 +92,7 @@ static inline void set_silent_tlb(struct snd_trident *trident, int page)
 	int i;
 	page *= UNIT_PAGES;
 	for (i = 0; i < UNIT_PAGES; i++, page++)
-		__set_tlb_bus(trident, page, trident->tlb.silent_page.addr);
+		__set_tlb_bus(trident, page, trident->tlb.silent_page->addr);
 }
 
 #endif /* PAGE_SIZE */
-- 
2.26.2

