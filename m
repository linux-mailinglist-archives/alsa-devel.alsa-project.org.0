Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 821CC3C7284
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:44:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0419C1743;
	Tue, 13 Jul 2021 16:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0419C1743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187451;
	bh=oeR6i+uFUwsCmUJ0zHdNC/j7IGFXm8A5+Zi1PePtcz4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P87PInOX9lcEdKgFocec37SXKj8A57BcLO5ClpFJ4+BLAeIhc25aQZb6IUYWlxZiY
	 3hMP8ajLvrv8vF+EJ4YvhkA4ZSKWtVB4zi/RG+XgyC1gAYlXkpUBCVB0C4Voi/tNLE
	 IXzyzluAVerUz36TG/sGLO2qPLcPRJgLeIf0fEpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8716F80607;
	Tue, 13 Jul 2021 16:30:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C4F1F8052E; Tue, 13 Jul 2021 16:30:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D744F80518
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D744F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Mees7mfO"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="9NyGKck/"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C7DC1201E5
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVSYCtA/9mDhb6inb5s+c97+UjZmWRkAMNL7BQan+JI=;
 b=Mees7mfO/l+HotCdJBkV1UtZyiFtdQH6OholDABavFTcDrG6kIovOHnyBgGMAuF3FG6WcV
 BJJoY7hK1I6oASiDkfjsZf4prlABvQ87fUIGhRoBdi+GkAy7cplYw9AhWTUspdqJqWkP8b
 pIpAWxXF5XHfTKPCAoTRHBnBkQKuH38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVSYCtA/9mDhb6inb5s+c97+UjZmWRkAMNL7BQan+JI=;
 b=9NyGKck/GEHgZ/UIDk5x9a8Lm8ArcjaUBM/VQ6dgygeBytcGRgiDRiiXXfRWqc953dIHdw
 Osyu/pdtTYBbUpDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B5314A3B88;
 Tue, 13 Jul 2021 14:29:37 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 36/51] ALSA: korg1212: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:28:42 +0200
Message-Id: <20210713142857.19654-37-tiwai@suse.de>
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

This patch converts the resource management in PCI korg1212 driver
with devres as a clean up.  Each manual resource management is
converted with the corresponding devres helper, the page allocations
are done with the devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 211 +++++++++-------------------------
 1 file changed, 55 insertions(+), 156 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 030e01b062e4..7872abbd4587 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -320,10 +320,10 @@ struct snd_korg1212 {
         unsigned long inIRQ;
         void __iomem *iobase;
 
-	struct snd_dma_buffer dma_dsp;
-        struct snd_dma_buffer dma_play;
-        struct snd_dma_buffer dma_rec;
-	struct snd_dma_buffer dma_shared;
+	struct snd_dma_buffer *dma_dsp;
+	struct snd_dma_buffer *dma_play;
+	struct snd_dma_buffer *dma_rec;
+	struct snd_dma_buffer *dma_shared;
 
 	u32 DataBufsSize;
 
@@ -1200,8 +1200,8 @@ static int snd_korg1212_downloadDSPCode(struct snd_korg1212 *korg1212)
         snd_korg1212_setCardState(korg1212, K1212_STATE_DSP_IN_PROCESS);
 
         rc = snd_korg1212_Send1212Command(korg1212, K1212_DB_StartDSPDownload,
-                                     UpperWordSwap(korg1212->dma_dsp.addr),
-                                     0, 0, 0);
+					  UpperWordSwap(korg1212->dma_dsp->addr),
+					  0, 0, 0);
 	if (rc)
 		K1212_DEBUG_PRINTK("K1212_DEBUG: Start DSP Download RC = %d [%s]\n",
 				   rc, stateName[korg1212->cardState]);
@@ -1382,7 +1382,7 @@ static int snd_korg1212_playback_open(struct snd_pcm_substream *substream)
 	snd_korg1212_OpenCard(korg1212);
 
         runtime->hw = snd_korg1212_playback_info;
-	snd_pcm_set_runtime_buffer(substream, &korg1212->dma_play);
+	snd_pcm_set_runtime_buffer(substream, korg1212->dma_play);
 
         spin_lock_irqsave(&korg1212->lock, flags);
 
@@ -1413,7 +1413,7 @@ static int snd_korg1212_capture_open(struct snd_pcm_substream *substream)
 	snd_korg1212_OpenCard(korg1212);
 
         runtime->hw = snd_korg1212_capture_info;
-	snd_pcm_set_runtime_buffer(substream, &korg1212->dma_rec);
+	snd_pcm_set_runtime_buffer(substream, korg1212->dma_rec);
 
         spin_lock_irqsave(&korg1212->lock, flags);
 
@@ -2080,71 +2080,16 @@ static void snd_korg1212_proc_init(struct snd_korg1212 *korg1212)
 			     snd_korg1212_proc_read);
 }
 
-static int
-snd_korg1212_free(struct snd_korg1212 *korg1212)
+static void
+snd_korg1212_free(struct snd_card *card)
 {
-        snd_korg1212_TurnOffIdleMonitor(korg1212);
-
-        if (korg1212->irq >= 0) {
-                snd_korg1212_DisableCardInterrupts(korg1212);
-                free_irq(korg1212->irq, korg1212);
-                korg1212->irq = -1;
-        }
-        
-        if (korg1212->iobase != NULL) {
-                iounmap(korg1212->iobase);
-                korg1212->iobase = NULL;
-        }
-        
-	pci_release_regions(korg1212->pci);
-
-        // ----------------------------------------------------
-        // free up memory resources used for the DSP download.
-        // ----------------------------------------------------
-        if (korg1212->dma_dsp.area) {
-        	snd_dma_free_pages(&korg1212->dma_dsp);
-        	korg1212->dma_dsp.area = NULL;
-        }
-
-#ifndef K1212_LARGEALLOC
-
-        // ------------------------------------------------------
-        // free up memory resources used for the Play/Rec Buffers
-        // ------------------------------------------------------
-	if (korg1212->dma_play.area) {
-		snd_dma_free_pages(&korg1212->dma_play);
-		korg1212->dma_play.area = NULL;
-        }
+	struct snd_korg1212 *korg1212 = card->private_data;
 
-	if (korg1212->dma_rec.area) {
-		snd_dma_free_pages(&korg1212->dma_rec);
-		korg1212->dma_rec.area = NULL;
-        }
-
-#endif
-
-        // ----------------------------------------------------
-        // free up memory resources used for the Shared Buffers
-        // ----------------------------------------------------
-	if (korg1212->dma_shared.area) {
-		snd_dma_free_pages(&korg1212->dma_shared);
-		korg1212->dma_shared.area = NULL;
-        }
-        
-	pci_disable_device(korg1212->pci);
-        kfree(korg1212);
-        return 0;
-}
-
-static int snd_korg1212_dev_free(struct snd_device *device)
-{
-        struct snd_korg1212 *korg1212 = device->device_data;
-        K1212_DEBUG_PRINTK("K1212_DEBUG: Freeing device\n");
-	return snd_korg1212_free(korg1212);
+	snd_korg1212_TurnOffIdleMonitor(korg1212);
+	snd_korg1212_DisableCardInterrupts(korg1212);
 }
 
-static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
-			       struct snd_korg1212 **rchip)
+static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
 
 {
         int err, rc;
@@ -2152,24 +2097,13 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
 	unsigned iomem_size;
 	__maybe_unused unsigned ioport_size;
 	__maybe_unused unsigned iomem2_size;
-        struct snd_korg1212 * korg1212;
+	struct snd_korg1212 *korg1212 = card->private_data;
 	const struct firmware *dsp_code;
 
-	static const struct snd_device_ops ops = {
-                .dev_free = snd_korg1212_dev_free,
-        };
-
-        * rchip = NULL;
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
                 return err;
 
-        korg1212 = kzalloc(sizeof(*korg1212), GFP_KERNEL);
-        if (korg1212 == NULL) {
-		pci_disable_device(pci);
-                return -ENOMEM;
-	}
-
 	korg1212->card = card;
 	korg1212->pci = pci;
 
@@ -2198,12 +2132,9 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
         for (i=0; i<kAudioChannels; i++)
                 korg1212->volumePhase[i] = 0;
 
-	err = pci_request_regions(pci, "korg1212");
-	if (err < 0) {
-		kfree(korg1212);
-		pci_disable_device(pci);
+	err = pcim_iomap_regions_request_all(pci, 1 << 0, "korg1212");
+	if (err < 0)
 		return err;
-	}
 
         korg1212->iomem = pci_resource_start(korg1212->pci, 0);
         korg1212->ioport = pci_resource_start(korg1212->pci, 1);
@@ -2223,26 +2154,20 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
 		   korg1212->iomem2, iomem2_size,
 		   stateName[korg1212->cardState]);
 
-	korg1212->iobase = ioremap(korg1212->iomem, iomem_size);
-	if (!korg1212->iobase) {
-		snd_printk(KERN_ERR "korg1212: unable to remap memory region 0x%lx-0x%lx\n", korg1212->iomem,
-                           korg1212->iomem + iomem_size - 1);
-                snd_korg1212_free(korg1212);
-                return -EBUSY;
-        }
+	korg1212->iobase = pcim_iomap_table(pci)[0];
 
-        err = request_irq(pci->irq, snd_korg1212_interrupt,
+	err = devm_request_irq(&pci->dev, pci->irq, snd_korg1212_interrupt,
                           IRQF_SHARED,
                           KBUILD_MODNAME, korg1212);
 
         if (err) {
 		snd_printk(KERN_ERR "korg1212: unable to grab IRQ %d\n", pci->irq);
-                snd_korg1212_free(korg1212);
                 return -EBUSY;
         }
 
         korg1212->irq = pci->irq;
 	card->sync_irq = korg1212->irq;
+	card->private_free = snd_korg1212_free;
 
 	pci_set_master(korg1212->pci);
 
@@ -2281,41 +2206,36 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
                    korg1212->idRegPtr,
 		   stateName[korg1212->cardState]);
 
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
-				sizeof(struct KorgSharedBuffer), &korg1212->dma_shared) < 0) {
-		snd_printk(KERN_ERR "korg1212: can not allocate shared buffer memory (%zd bytes)\n", sizeof(struct KorgSharedBuffer));
-                snd_korg1212_free(korg1212);
-                return -ENOMEM;
-        }
-        korg1212->sharedBufferPtr = (struct KorgSharedBuffer *)korg1212->dma_shared.area;
-        korg1212->sharedBufferPhy = korg1212->dma_shared.addr;
+	korg1212->dma_shared = snd_devm_alloc_pages(&pci->dev,
+						    SNDRV_DMA_TYPE_DEV,
+						    sizeof(struct KorgSharedBuffer));
+	if (!korg1212->dma_shared)
+		return -ENOMEM;
+	korg1212->sharedBufferPtr = (struct KorgSharedBuffer *)korg1212->dma_shared->area;
+	korg1212->sharedBufferPhy = korg1212->dma_shared->addr;
 
         K1212_DEBUG_PRINTK("K1212_DEBUG: Shared Buffer Area = 0x%p (0x%08lx), %d bytes\n", korg1212->sharedBufferPtr, korg1212->sharedBufferPhy, sizeof(struct KorgSharedBuffer));
 
 #ifndef K1212_LARGEALLOC
-
         korg1212->DataBufsSize = sizeof(struct KorgAudioBuffer) * kNumBuffers;
+	korg1212->dma_play = snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV,
+						  korg1212->DataBufsSize);
+	if (!korg1212->dma_play)
+		return -ENOMEM;
 
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
-				korg1212->DataBufsSize, &korg1212->dma_play) < 0) {
-		snd_printk(KERN_ERR "korg1212: can not allocate play data buffer memory (%d bytes)\n", korg1212->DataBufsSize);
-                snd_korg1212_free(korg1212);
-                return -ENOMEM;
-        }
-	korg1212->playDataBufsPtr = (struct KorgAudioBuffer *)korg1212->dma_play.area;
-	korg1212->PlayDataPhy = korg1212->dma_play.addr;
+	korg1212->playDataBufsPtr = (struct KorgAudioBuffer *)korg1212->dma_play->area;
+	korg1212->PlayDataPhy = korg1212->dma_play->addr;
 
         K1212_DEBUG_PRINTK("K1212_DEBUG: Play Data Area = 0x%p (0x%08x), %d bytes\n",
 		korg1212->playDataBufsPtr, korg1212->PlayDataPhy, korg1212->DataBufsSize);
 
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
-				korg1212->DataBufsSize, &korg1212->dma_rec) < 0) {
-		snd_printk(KERN_ERR "korg1212: can not allocate record data buffer memory (%d bytes)\n", korg1212->DataBufsSize);
-                snd_korg1212_free(korg1212);
-                return -ENOMEM;
-        }
-        korg1212->recordDataBufsPtr = (struct KorgAudioBuffer *)korg1212->dma_rec.area;
-        korg1212->RecDataPhy = korg1212->dma_rec.addr;
+	korg1212->dma_rec = snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV,
+						 korg1212->DataBufsSize);
+	if (!korg1212->dma_rec)
+		return -ENOMEM;
+
+	korg1212->recordDataBufsPtr = (struct KorgAudioBuffer *)korg1212->dma_rec->area;
+	korg1212->RecDataPhy = korg1212->dma_rec->addr;
 
         K1212_DEBUG_PRINTK("K1212_DEBUG: Record Data Area = 0x%p (0x%08x), %d bytes\n",
 		korg1212->recordDataBufsPtr, korg1212->RecDataPhy, korg1212->DataBufsSize);
@@ -2336,26 +2256,22 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
         korg1212->AdatTimeCodePhy = korg1212->sharedBufferPhy +
 		offsetof(struct KorgSharedBuffer, AdatTimeCode);
 
+	korg1212->dma_dsp = snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV,
+						 dsp_code->size);
+	if (!korg1212->dma_dsp)
+		return -ENOMEM;
+
 	err = request_firmware(&dsp_code, "korg/k1212.dsp", &pci->dev);
 	if (err < 0) {
 		snd_printk(KERN_ERR "firmware not available\n");
-		snd_korg1212_free(korg1212);
 		return err;
 	}
 
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
-				dsp_code->size, &korg1212->dma_dsp) < 0) {
-		snd_printk(KERN_ERR "korg1212: cannot allocate dsp code memory (%zd bytes)\n", dsp_code->size);
-                snd_korg1212_free(korg1212);
-		release_firmware(dsp_code);
-                return -ENOMEM;
-        }
-
         K1212_DEBUG_PRINTK("K1212_DEBUG: DSP Code area = 0x%p (0x%08x) %d bytes [%s]\n",
-		   korg1212->dma_dsp.area, korg1212->dma_dsp.addr, dsp_code->size,
+		   korg1212->dma_dsp->area, korg1212->dma_dsp->addr, dsp_code->size,
 		   stateName[korg1212->cardState]);
 
-	memcpy(korg1212->dma_dsp.area, dsp_code->data, dsp_code->size);
+	memcpy(korg1212->dma_dsp->area, dsp_code->data, dsp_code->size);
 
 	release_firmware(dsp_code);
 
@@ -2364,12 +2280,6 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
 	if (rc)
 		K1212_DEBUG_PRINTK("K1212_DEBUG: Reboot Card - RC = %d [%s]\n", rc, stateName[korg1212->cardState]);
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, korg1212, &ops);
-	if (err < 0) {
-                snd_korg1212_free(korg1212);
-                return err;
-        }
-        
 	snd_korg1212_EnableCardInterrupts(korg1212);
 
 	mdelay(CARD_BOOT_DELAY_IN_MS);
@@ -2411,10 +2321,8 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
         }
 
         snd_korg1212_proc_init(korg1212);
-        
-        * rchip = korg1212;
-	return 0;
 
+	return 0;
 }
 
 /*
@@ -2437,16 +2345,15 @@ snd_korg1212_probe(struct pci_dev *pci,
 		dev++;
 		return -ENOENT;
 	}
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*korg1212), &card);
 	if (err < 0)
 		return err;
+	korg1212 = card->private_data;
 
-	err = snd_korg1212_create(card, pci, &korg1212);
-	if (err < 0) {
-		snd_card_free(card);
+	err = snd_korg1212_create(card, pci);
+	if (err < 0)
 		return err;
-	}
 
 	strcpy(card->driver, "korg1212");
 	strcpy(card->shortname, "korg1212");
@@ -2456,25 +2363,17 @@ snd_korg1212_probe(struct pci_dev *pci,
         K1212_DEBUG_PRINTK("K1212_DEBUG: %s\n", card->longname);
 
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
 
-static void snd_korg1212_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 static struct pci_driver korg1212_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_korg1212_ids,
 	.probe = snd_korg1212_probe,
-	.remove = snd_korg1212_remove,
 };
 
 module_pci_driver(korg1212_driver);
-- 
2.26.2

