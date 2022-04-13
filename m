Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5498E4FEEB9
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 07:49:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC4A81740;
	Wed, 13 Apr 2022 07:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC4A81740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649828978;
	bh=heCGJ4by2ZSnP47hbptmDOxyQrbWVXyZ+91t5cyVWV8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GNiURKtK9JlHSaw+iHOTuHxhlzqmuQ4PU9oHcQfzyT3elz3x7Pna78ZcCvpfeBx9s
	 Nqjnoi/s0yendLfsemnNqr0jvNbrZcneJCx0JPdm1wPYAbjvN+P3mCaI8cRrFIykLH
	 MkRp36t7XVzzb1nBY+w5hSEqSokmQp+vhR+d0EVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D300F8028B;
	Wed, 13 Apr 2022 07:48:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B955DF80248; Wed, 13 Apr 2022 07:48:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AC61F80124
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 07:48:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC61F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Sjw290ED"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="8cLlNZKm"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 196CB1F37C
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 05:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649828890; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Cu8RKtB2MWzbeJrPJ2i6NCc7+7v5/cenFZsX6kHlbpQ=;
 b=Sjw290EDay1mwAxC42Gp+kBeOQ7JsRLPcf2e3EFuov9VOyubUSKGXX/qLZjd5UuVzBqfwt
 z8cQLm1CPo2LxgAnej4sw4Ihl6cqiyfzQXnj2LtZ3GYcJNqKZybbDdQRfjmm0JaQjjJ5yx
 sUZ75+rMIGEYdStMvhBNm6QqgX12/Eg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649828890;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Cu8RKtB2MWzbeJrPJ2i6NCc7+7v5/cenFZsX6kHlbpQ=;
 b=8cLlNZKmNIdtp9o8EbHMsr5LvH8jgB2quxEHqJkmrZQCQ+tGW6Dpry1A6cG6svQ90IdYz6
 zPgLWMmjsIxLftAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 0617FA3B87;
 Wed, 13 Apr 2022 05:48:10 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: memalloc: Add fallback SG-buffer allocations for x86
Date: Wed, 13 Apr 2022 07:48:08 +0200
Message-Id: <20220413054808.7547-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
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

The recent change for memory allocator replaced the SG-buffer handling
helper for x86 with the standard non-contiguous page handler.  This
works for most cases, but there is a corner case I obviously
overlooked, namely, the fallback of non-contiguous handler without
IOMMU.  When the system runs without IOMMU, the core handler tries to
use the continuous pages with a single SGL entry.  It works nicely for
most cases, but when the system memory gets fragmented, the large
allocation may fail frequently.

Ideally the non-contig handler could deal with the proper SG pages,
it's cumbersome to extend for now.  As a workaround, here we add new
types for (minimalistic) SG allocations, instead, so that the
allocator falls back to those types automatically when the allocation
with the standard API failed.

BTW, one better (but pretty minor) improvement from the previous
SG-buffer code is that this provides the proper mmap support without
the PCM's page fault handling.

Fixes: 2c95b92ecd92 ("ALSA: memalloc: Unify x86 SG-buffer handling (take#3)")
BugLink: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2272
BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1198248
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h |   5 ++
 sound/core/memalloc.c    | 111 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index 653dfffb3ac8..8d79cebf95f3 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -51,6 +51,11 @@ struct snd_dma_device {
 #define SNDRV_DMA_TYPE_DEV_SG	SNDRV_DMA_TYPE_DEV /* no SG-buf support */
 #define SNDRV_DMA_TYPE_DEV_WC_SG	SNDRV_DMA_TYPE_DEV_WC
 #endif
+/* fallback types, don't use those directly */
+#ifdef CONFIG_SND_DMA_SGBUF
+#define SNDRV_DMA_TYPE_DEV_SG_FALLBACK		10
+#define SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK	11
+#endif
 
 /*
  * info for buffer allocation
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 6fd763d4d15b..15dc7160ba34 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -499,6 +499,10 @@ static const struct snd_malloc_ops snd_dma_wc_ops = {
 };
 #endif /* CONFIG_X86 */
 
+#ifdef CONFIG_SND_DMA_SGBUF
+static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size);
+#endif
+
 /*
  * Non-contiguous pages allocator
  */
@@ -509,8 +513,18 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 
 	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
 				      DEFAULT_GFP, 0);
-	if (!sgt)
+	if (!sgt) {
+#ifdef CONFIG_SND_DMA_SGBUF
+		if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
+			dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
+		else
+			dmab->dev.type = SNDRV_DMA_TYPE_DEV_SG_FALLBACK;
+		return snd_dma_sg_fallback_alloc(dmab, size);
+#else
 		return NULL;
+#endif
+	}
+
 	dmab->dev.need_sync = dma_need_sync(dmab->dev.dev,
 					    sg_dma_address(sgt->sgl));
 	p = dma_vmap_noncontiguous(dmab->dev.dev, size, sgt);
@@ -633,6 +647,8 @@ static void *snd_dma_sg_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
 
 	if (!p)
 		return NULL;
+	if (dmab->dev.type != SNDRV_DMA_TYPE_DEV_WC_SG)
+		return p;
 	for_each_sgtable_page(sgt, &iter, 0)
 		set_memory_wc(sg_wc_address(&iter), 1);
 	return p;
@@ -665,6 +681,95 @@ static const struct snd_malloc_ops snd_dma_sg_wc_ops = {
 	.get_page = snd_dma_noncontig_get_page,
 	.get_chunk_size = snd_dma_noncontig_get_chunk_size,
 };
+
+/* Fallback SG-buffer allocations for x86 */
+struct snd_dma_sg_fallback {
+	size_t count;
+	struct page **pages;
+	dma_addr_t *addrs;
+};
+
+static void __snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab,
+				       struct snd_dma_sg_fallback *sgbuf)
+{
+	size_t i;
+
+	if (sgbuf->count && dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+		set_pages_array_wb(sgbuf->pages, sgbuf->count);
+	for (i = 0; i < sgbuf->count && sgbuf->pages[i]; i++)
+		dma_free_coherent(dmab->dev.dev, PAGE_SIZE,
+				  page_address(sgbuf->pages[i]),
+				  sgbuf->addrs[i]);
+	kvfree(sgbuf->pages);
+	kvfree(sgbuf->addrs);
+	kfree(sgbuf);
+}
+
+static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
+{
+	struct snd_dma_sg_fallback *sgbuf;
+	struct page **pages;
+	size_t i, count;
+	void *p;
+
+	sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
+	if (!sgbuf)
+		return NULL;
+	count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	pages = kvcalloc(count, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
+		goto error;
+	sgbuf->pages = pages;
+	sgbuf->addrs = kvcalloc(count, sizeof(*sgbuf->addrs), GFP_KERNEL);
+	if (!sgbuf->addrs)
+		goto error;
+
+	for (i = 0; i < count; sgbuf->count++, i++) {
+		p = dma_alloc_coherent(dmab->dev.dev, PAGE_SIZE,
+				       &sgbuf->addrs[i], DEFAULT_GFP);
+		if (!p)
+			goto error;
+		sgbuf->pages[i] = virt_to_page(p);
+	}
+
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+		set_pages_array_wc(pages, count);
+	p = vmap(pages, count, VM_MAP, PAGE_KERNEL);
+	if (!p)
+		goto error;
+	dmab->private_data = sgbuf;
+	return p;
+
+ error:
+	__snd_dma_sg_fallback_free(dmab, sgbuf);
+	return NULL;
+}
+
+static void snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab)
+{
+	vunmap(dmab->area);
+	__snd_dma_sg_fallback_free(dmab, dmab->private_data);
+}
+
+static int snd_dma_sg_fallback_mmap(struct snd_dma_buffer *dmab,
+				    struct vm_area_struct *area)
+{
+	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
+
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+		area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
+	return vm_map_pages(area, sgbuf->pages, sgbuf->count);
+}
+
+static const struct snd_malloc_ops snd_dma_sg_fallback_ops = {
+	.alloc = snd_dma_sg_fallback_alloc,
+	.free = snd_dma_sg_fallback_free,
+	.mmap = snd_dma_sg_fallback_mmap,
+	/* reuse vmalloc helpers */
+	.get_addr = snd_dma_vmalloc_get_addr,
+	.get_page = snd_dma_vmalloc_get_page,
+	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
+};
 #endif /* CONFIG_SND_DMA_SGBUF */
 
 /*
@@ -736,6 +841,10 @@ static const struct snd_malloc_ops *dma_ops[] = {
 #ifdef CONFIG_GENERIC_ALLOCATOR
 	[SNDRV_DMA_TYPE_DEV_IRAM] = &snd_dma_iram_ops,
 #endif /* CONFIG_GENERIC_ALLOCATOR */
+#ifdef CONFIG_SND_DMA_SGBUF
+	[SNDRV_DMA_TYPE_DEV_SG_FALLBACK] = &snd_dma_sg_fallback_ops,
+	[SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK] = &snd_dma_sg_fallback_ops,
+#endif
 #endif /* CONFIG_HAS_DMA */
 };
 
-- 
2.31.1

