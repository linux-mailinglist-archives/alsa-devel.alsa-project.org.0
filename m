Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8773C728D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:46:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B5BB1761;
	Tue, 13 Jul 2021 16:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B5BB1761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187577;
	bh=iNq3QaOXfXe8grDWrHSjRyWtauNqVs0q+n2LgMVLFg8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LJWYxToOmgaxdmwluR/E/CVRivEvNFIKBXnGFaMcal7pG1H6OIvFE4q2VTKAcWGkA
	 Sb9qd0PaQH/musSyDcYMvdJFPh5ZH3D5g5Qs46SRs3RH8Jm381EXLvyQL1DBlz46h5
	 vvOhOUaYTgD1vcrjRS7QdcSNPaWNGrj1xKko+T0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4771FF8061D;
	Tue, 13 Jul 2021 16:30:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9336F8052E; Tue, 13 Jul 2021 16:30:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93071F80542
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93071F80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Kx560Zhg"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="G73ZVZKv"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 701CE22890
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FynoyZ6DnBFWpRSnQMvg3Zq5acyq38aZwxwrcjUPWU=;
 b=Kx560ZhgT6TT38kzUyoWQRlHtgwJqe9TAN3zycuKzGXkCdtzvBoukmBkN9yuXlF4l6AApa
 n1OQbDK4XQWuM/4e5zPvw9W1bsn0PfMrjApXcMN9u93hd5tZwCXLi1Ry4FM0uJZNcMlPnH
 CqARWGL7lkml5LsAK7FPuk4SsNOKq7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186581;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FynoyZ6DnBFWpRSnQMvg3Zq5acyq38aZwxwrcjUPWU=;
 b=G73ZVZKviqNgVqpHyy6t5todeU2+OKb5+Rg7GvMZnV8lPvB8YS9iHOkSvkcol78cEV7YNf
 HQIP7s4pc2twRQDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 5F231A3B8E;
 Tue, 13 Jul 2021 14:29:41 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 42/51] ALSA: rme9652: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:28:48 +0200
Message-Id: <20210713142857.19654-43-tiwai@suse.de>
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

This patch converts the resource management in PCI rme9652 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, the page allocations are done
with the devres helper, and the card object release is managed now via
card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/rme9652.c | 85 +++++++++++--------------------------
 1 file changed, 24 insertions(+), 61 deletions(-)

diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index f1aad38760d6..45448a97070c 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -208,8 +208,8 @@ struct snd_rme9652 {
 	unsigned char ds_channels;
 	unsigned char ss_channels;	/* different for hammerfall/hammerfall-light */
 
-	struct snd_dma_buffer playback_dma_buf;
-	struct snd_dma_buffer capture_dma_buf;
+	struct snd_dma_buffer *playback_dma_buf;
+	struct snd_dma_buffer *capture_dma_buf;
 
 	unsigned char *capture_buffer;	/* suitably aligned address */
 	unsigned char *playback_buffer;	/* suitably aligned address */
@@ -275,18 +275,12 @@ static const char channel_map_9636_ds[26] = {
 	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
 };
 
-static int snd_hammerfall_get_buffer(struct pci_dev *pci, struct snd_dma_buffer *dmab, size_t size)
+static struct snd_dma_buffer *
+snd_hammerfall_get_buffer(struct pci_dev *pci, size_t size)
 {
-	return snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev, size, dmab);
+	return snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV, size);
 }
 
-static void snd_hammerfall_free_buffer(struct snd_dma_buffer *dmab, struct pci_dev *pci)
-{
-	if (dmab->area)
-		snd_dma_free_pages(dmab);
-}
-
-
 static const struct pci_device_id snd_rme9652_ids[] = {
 	{
 		.vendor	   = 0x10ee,
@@ -1715,37 +1709,23 @@ static void snd_rme9652_proc_init(struct snd_rme9652 *rme9652)
 			     snd_rme9652_proc_read);
 }
 
-static void snd_rme9652_free_buffers(struct snd_rme9652 *rme9652)
+static void snd_rme9652_card_free(struct snd_card *card)
 {
-	snd_hammerfall_free_buffer(&rme9652->capture_dma_buf, rme9652->pci);
-	snd_hammerfall_free_buffer(&rme9652->playback_dma_buf, rme9652->pci);
-}
+	struct snd_rme9652 *rme9652 = (struct snd_rme9652 *) card->private_data;
 
-static int snd_rme9652_free(struct snd_rme9652 *rme9652)
-{
 	if (rme9652->irq >= 0)
 		rme9652_stop(rme9652);
-	snd_rme9652_free_buffers(rme9652);
-
-	if (rme9652->irq >= 0)
-		free_irq(rme9652->irq, (void *)rme9652);
-	iounmap(rme9652->iobase);
-	if (rme9652->port)
-		pci_release_regions(rme9652->pci);
-
-	if (pci_is_enabled(rme9652->pci))
-		pci_disable_device(rme9652->pci);
-	return 0;
 }
 
 static int snd_rme9652_initialize_memory(struct snd_rme9652 *rme9652)
 {
 	unsigned long pb_bus, cb_bus;
 
-	if (snd_hammerfall_get_buffer(rme9652->pci, &rme9652->capture_dma_buf, RME9652_DMA_AREA_BYTES) < 0 ||
-	    snd_hammerfall_get_buffer(rme9652->pci, &rme9652->playback_dma_buf, RME9652_DMA_AREA_BYTES) < 0) {
-		if (rme9652->capture_dma_buf.area)
-			snd_dma_free_pages(&rme9652->capture_dma_buf);
+	rme9652->capture_dma_buf =
+		snd_hammerfall_get_buffer(rme9652->pci, RME9652_DMA_AREA_BYTES);
+	rme9652->playback_dma_buf =
+		snd_hammerfall_get_buffer(rme9652->pci, RME9652_DMA_AREA_BYTES);
+	if (!rme9652->capture_dma_buf || !rme9652->playback_dma_buf) {
 		dev_err(rme9652->card->dev,
 			"%s: no buffers available\n", rme9652->card_name);
 		return -ENOMEM;
@@ -1753,16 +1733,16 @@ static int snd_rme9652_initialize_memory(struct snd_rme9652 *rme9652)
 
 	/* Align to bus-space 64K boundary */
 
-	cb_bus = ALIGN(rme9652->capture_dma_buf.addr, 0x10000ul);
-	pb_bus = ALIGN(rme9652->playback_dma_buf.addr, 0x10000ul);
+	cb_bus = ALIGN(rme9652->capture_dma_buf->addr, 0x10000ul);
+	pb_bus = ALIGN(rme9652->playback_dma_buf->addr, 0x10000ul);
 
 	/* Tell the card where it is */
 
 	rme9652_write(rme9652, RME9652_rec_buffer, cb_bus);
 	rme9652_write(rme9652, RME9652_play_buffer, pb_bus);
 
-	rme9652->capture_buffer = rme9652->capture_dma_buf.area + (cb_bus - rme9652->capture_dma_buf.addr);
-	rme9652->playback_buffer = rme9652->playback_dma_buf.area + (pb_bus - rme9652->playback_dma_buf.addr);
+	rme9652->capture_buffer = rme9652->capture_dma_buf->area + (cb_bus - rme9652->capture_dma_buf->addr);
+	rme9652->playback_buffer = rme9652->playback_dma_buf->area + (pb_bus - rme9652->playback_dma_buf->addr);
 
 	return 0;
 }
@@ -2452,7 +2432,7 @@ static int snd_rme9652_create(struct snd_card *card,
 		return -ENODEV;
 	}
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
@@ -2462,15 +2442,15 @@ static int snd_rme9652_create(struct snd_card *card,
 	if (err < 0)
 		return err;
 	rme9652->port = pci_resource_start(pci, 0);
-	rme9652->iobase = ioremap(rme9652->port, RME9652_IO_EXTENT);
+	rme9652->iobase = devm_ioremap(&pci->dev, rme9652->port, RME9652_IO_EXTENT);
 	if (rme9652->iobase == NULL) {
 		dev_err(card->dev, "unable to remap region 0x%lx-0x%lx\n",
 			rme9652->port, rme9652->port + RME9652_IO_EXTENT - 1);
 		return -EBUSY;
 	}
 	
-	if (request_irq(pci->irq, snd_rme9652_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, rme9652)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_rme9652_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, rme9652)) {
 		dev_err(card->dev, "unable to request IRQ %d\n", pci->irq);
 		return -EBUSY;
 	}
@@ -2562,14 +2542,6 @@ static int snd_rme9652_create(struct snd_card *card,
 	return 0;
 }
 
-static void snd_rme9652_card_free(struct snd_card *card)
-{
-	struct snd_rme9652 *rme9652 = (struct snd_rme9652 *) card->private_data;
-
-	if (rme9652)
-		snd_rme9652_free(rme9652);
-}
-
 static int snd_rme9652_probe(struct pci_dev *pci,
 			     const struct pci_device_id *pci_id)
 {
@@ -2585,8 +2557,8 @@ static int snd_rme9652_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct snd_rme9652), &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_rme9652), &card);
 
 	if (err < 0)
 		return err;
@@ -2597,33 +2569,24 @@ static int snd_rme9652_probe(struct pci_dev *pci,
 	rme9652->pci = pci;
 	err = snd_rme9652_create(card, rme9652, precise_ptr[dev]);
 	if (err)
-		goto free_card;
+		return err;
 
 	strcpy(card->shortname, rme9652->card_name);
 
 	sprintf(card->longname, "%s at 0x%lx, irq %d",
 		card->shortname, rme9652->port, rme9652->irq);
 	err = snd_card_register(card);
-	if (err) {
-free_card:
-		snd_card_free(card);
+	if (err)
 		return err;
-	}
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
 }
 
-static void snd_rme9652_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 static struct pci_driver rme9652_driver = {
 	.name	  = KBUILD_MODNAME,
 	.id_table = snd_rme9652_ids,
 	.probe	  = snd_rme9652_probe,
-	.remove	  = snd_rme9652_remove,
 };
 
 module_pci_driver(rme9652_driver);
-- 
2.26.2

