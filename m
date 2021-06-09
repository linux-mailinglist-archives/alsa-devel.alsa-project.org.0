Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF6D3A1AEC
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 18:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 838E816E9;
	Wed,  9 Jun 2021 18:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 838E816E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623256165;
	bh=w0v1aum5ByVATxNhO3C9Hya8ms1BrxgQNsj9PyrbW24=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uKgqU9rpr3GP7YC9XJeNtqBZ672hZUfl9XhwOwBVVvpl7ybJi1yyqyJajsDs/RM7O
	 m/8C6FnaozCSI2JViI87ndIjTC/G9KOSM0eds7RGpkfEaKA+vaMsB7GeJvr/1EGZol
	 bU3ehAZJVbDt0cN0+G1PxVkqodw2COXbaRxkOt0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AF51F804E3;
	Wed,  9 Jun 2021 18:26:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C88C4F804CB; Wed,  9 Jun 2021 18:26:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA432F80276
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 18:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA432F80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="FfhKMhKF"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="s/10jrzq"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5617A219B8
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 16:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623255954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lPFuVY9sBIlOgOJ7EhjvXOHmw2BMoZbvmyJLY/O6Xqc=;
 b=FfhKMhKFVhAtO8fbaiiHnKfilAZ2sEuUCERDu7gyosUQVCLR1M4iNdcN2ZFynmB/j8Nvyl
 GuwlSQVIipJD//IdlwNaQNo7IPE2RaBvPda7fvlaNXWePSPy2+mPNW67hl8iS1bRsHyCAf
 AumzymVvQp6YsZRJowm14s0sdXkkjZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623255954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lPFuVY9sBIlOgOJ7EhjvXOHmw2BMoZbvmyJLY/O6Xqc=;
 b=s/10jrzqgQBZBZW8L3/GHSkAEmM4WyH8oBULezue9B0lKJDuFXbzgHM6B+F9dAIhR5214p
 vv9hlVTy4IthqBAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 43006A3B89;
 Wed,  9 Jun 2021 16:25:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ALSA: core: Abstract memory alloc helpers
Date: Wed,  9 Jun 2021 18:25:49 +0200
Message-Id: <20210609162551.7842-4-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210609162551.7842-1-tiwai@suse.de>
References: <20210609162551.7842-1-tiwai@suse.de>
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

This patch introduces the ops table to each memory allocation type
(SNDRV_DMA_TYPE_XXX) and abstract the handling for the better code
management.  Then we get separate the page allocation, release and
other tasks for each type, especially for the SG buffer.

Each buffer type has now callbacks in the struct snd_malloc_ops, and
the common helper functions call those ops accordingly.  The former
inline code that is specific to SG-buffer is moved into the local
sgbuf.c, and we can simplify the PCM code without details of memory
handling.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h    |  61 +-----
 include/sound/pcm.h         |   8 -
 sound/core/memalloc.c       | 391 ++++++++++++++++++++++--------------
 sound/core/memalloc_local.h |  18 ++
 sound/core/pcm_local.h      |   5 -
 sound/core/pcm_memory.c     |  21 --
 sound/core/pcm_native.c     |  20 +-
 sound/core/sgbuf.c          |  90 ++++++---
 8 files changed, 328 insertions(+), 286 deletions(-)
 create mode 100644 sound/core/memalloc_local.h

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index 3ab084438fdc..6dc85a7f44ad 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -9,9 +9,8 @@
 #ifndef __SOUND_MEMALLOC_H
 #define __SOUND_MEMALLOC_H
 
-#include <asm/page.h>
-
 struct device;
+struct page;
 
 /*
  * buffer device info
@@ -64,59 +63,6 @@ static inline unsigned int snd_sgbuf_aligned_pages(size_t size)
 	return (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
 }
 
-#ifdef CONFIG_SND_DMA_SGBUF
-/*
- * Scatter-Gather generic device pages
- */
-void *snd_malloc_sgbuf_pages(struct device *device,
-			     size_t size, struct snd_dma_buffer *dmab,
-			     size_t *res_size);
-int snd_free_sgbuf_pages(struct snd_dma_buffer *dmab);
-
-struct snd_sg_page {
-	void *buf;
-	dma_addr_t addr;
-};
-
-struct snd_sg_buf {
-	int size;	/* allocated byte size */
-	int pages;	/* allocated pages */
-	int tblsize;	/* allocated table size */
-	struct snd_sg_page *table;	/* address table */
-	struct page **page_table;	/* page table (for vmap/vunmap) */
-	struct device *dev;
-};
-
-/*
- * return the physical address at the corresponding offset
- */
-static inline dma_addr_t snd_sgbuf_get_addr(struct snd_dma_buffer *dmab,
-					   size_t offset)
-{
-	struct snd_sg_buf *sgbuf = dmab->private_data;
-	dma_addr_t addr;
-
-	if (!sgbuf)
-		return dmab->addr + offset;
-	addr = sgbuf->table[offset >> PAGE_SHIFT].addr;
-	addr &= ~((dma_addr_t)PAGE_SIZE - 1);
-	return addr + offset % PAGE_SIZE;
-}
-
-unsigned int snd_sgbuf_get_chunk_size(struct snd_dma_buffer *dmab,
-				      unsigned int ofs, unsigned int size);
-#else
-/* non-SG versions */
-static inline dma_addr_t snd_sgbuf_get_addr(struct snd_dma_buffer *dmab,
-					    size_t offset)
-{
-	return dmab->addr + offset;
-}
-
-#define snd_sgbuf_get_chunk_size(dmab, ofs, size)	(size)
-
-#endif /* CONFIG_SND_DMA_SGBUF */
-
 /* allocate/release a buffer */
 int snd_dma_alloc_pages(int type, struct device *dev, size_t size,
 			struct snd_dma_buffer *dmab);
@@ -124,5 +70,10 @@ int snd_dma_alloc_pages_fallback(int type, struct device *dev, size_t size,
                                  struct snd_dma_buffer *dmab);
 void snd_dma_free_pages(struct snd_dma_buffer *dmab);
 
+dma_addr_t snd_sgbuf_get_addr(struct snd_dma_buffer *dmab, size_t offset);
+struct page *snd_sgbuf_get_page(struct snd_dma_buffer *dmab, size_t offset);
+unsigned int snd_sgbuf_get_chunk_size(struct snd_dma_buffer *dmab,
+				      unsigned int ofs, unsigned int size);
+
 #endif /* __SOUND_MEMALLOC_H */
 
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 11e0a68335bd..d8f5f85ebd3f 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1253,14 +1253,6 @@ static inline int snd_pcm_lib_alloc_vmalloc_32_buffer
 
 #define snd_pcm_get_dma_buf(substream) ((substream)->runtime->dma_buffer_p)
 
-#ifdef CONFIG_SND_DMA_SGBUF
-/*
- * SG-buffer handling
- */
-#define snd_pcm_substream_sgbuf(substream) \
-	snd_pcm_get_dma_buf(substream)->private_data
-#endif /* SND_DMA_SGBUF */
-
 /**
  * snd_pcm_sgbuf_get_addr - Get the DMA address at the corresponding offset
  * @substream: PCM substream
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 966bef5acc75..ad68bcdf82cf 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -15,99 +15,27 @@
 #include <asm/set_memory.h>
 #endif
 #include <sound/memalloc.h>
+#include "memalloc_local.h"
 
-/*
- *
- *  Bus-specific memory allocators
- *
- */
+static const struct snd_malloc_ops *snd_dma_get_ops(struct snd_dma_buffer *dmab);
 
-#ifdef CONFIG_HAS_DMA
-/* allocate the coherent DMA pages */
-static void snd_malloc_dev_pages(struct snd_dma_buffer *dmab, size_t size)
-{
-	gfp_t gfp_flags;
-
-	gfp_flags = GFP_KERNEL
-		| __GFP_COMP	/* compound page lets parts be mapped */
-		| __GFP_NORETRY /* don't trigger OOM-killer */
-		| __GFP_NOWARN; /* no stack trace print - this call is non-critical */
-	dmab->area = dma_alloc_coherent(dmab->dev.dev, size, &dmab->addr,
-					gfp_flags);
-#ifdef CONFIG_X86
-	if (dmab->area && dmab->dev.type == SNDRV_DMA_TYPE_DEV_UC)
-		set_memory_wc((unsigned long)dmab->area,
-			      PAGE_ALIGN(size) >> PAGE_SHIFT);
-#endif
-}
-
-/* free the coherent DMA pages */
-static void snd_free_dev_pages(struct snd_dma_buffer *dmab)
+/* a cast to gfp flag from the dev pointer; for CONTINUOUS and VMALLOC types */
+static inline gfp_t snd_mem_get_gfp_flags(const struct snd_dma_buffer *dmab,
+					  gfp_t default_gfp)
 {
-#ifdef CONFIG_X86
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_UC)
-		set_memory_wb((unsigned long)dmab->area,
-			      PAGE_ALIGN(dmab->bytes) >> PAGE_SHIFT);
-#endif
-	dma_free_coherent(dmab->dev.dev, dmab->bytes, dmab->area, dmab->addr);
+	if (!dmab->dev.dev)
+		return default_gfp;
+	else
+		return (__force gfp_t)(unsigned long)dmab->dev.dev;
 }
 
-#ifdef CONFIG_GENERIC_ALLOCATOR
-/**
- * snd_malloc_dev_iram - allocate memory from on-chip internal ram
- * @dmab: buffer allocation record to store the allocated data
- * @size: number of bytes to allocate from the iram
- *
- * This function requires iram phandle provided via of_node
- */
-static void snd_malloc_dev_iram(struct snd_dma_buffer *dmab, size_t size)
+static int __snd_dma_alloc_pages(struct snd_dma_buffer *dmab, size_t size)
 {
-	struct device *dev = dmab->dev.dev;
-	struct gen_pool *pool = NULL;
-
-	dmab->area = NULL;
-	dmab->addr = 0;
-
-	if (dev->of_node)
-		pool = of_gen_pool_get(dev->of_node, "iram", 0);
-
-	if (!pool)
-		return;
-
-	/* Assign the pool into private_data field */
-	dmab->private_data = pool;
+	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
 
-	dmab->area = gen_pool_dma_alloc_align(pool, size, &dmab->addr,
-					PAGE_SIZE);
-}
-
-/**
- * snd_free_dev_iram - free allocated specific memory from on-chip internal ram
- * @dmab: buffer allocation record to store the allocated data
- */
-static void snd_free_dev_iram(struct snd_dma_buffer *dmab)
-{
-	struct gen_pool *pool = dmab->private_data;
-
-	if (pool && dmab->area)
-		gen_pool_free(pool, (unsigned long)dmab->area, dmab->bytes);
-}
-#endif /* CONFIG_GENERIC_ALLOCATOR */
-#endif /* CONFIG_HAS_DMA */
-
-/*
- *
- *  ALSA generic memory management
- *
- */
-
-static inline gfp_t snd_mem_get_gfp_flags(const struct device *dev,
-					  gfp_t default_gfp)
-{
-	if (!dev)
-		return default_gfp;
-	else
-		return (__force gfp_t)(unsigned long)dev;
+	if (WARN_ON_ONCE(!ops || !ops->alloc))
+		return -EINVAL;
+	return ops->alloc(dmab, size);
 }
 
 /**
@@ -126,7 +54,7 @@ static inline gfp_t snd_mem_get_gfp_flags(const struct device *dev,
 int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 			struct snd_dma_buffer *dmab)
 {
-	gfp_t gfp;
+	int err;
 
 	if (WARN_ON(!size))
 		return -ENXIO;
@@ -140,43 +68,10 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 	dmab->area = NULL;
 	dmab->addr = 0;
 	dmab->private_data = NULL;
-	switch (type) {
-	case SNDRV_DMA_TYPE_CONTINUOUS:
-		gfp = snd_mem_get_gfp_flags(device, GFP_KERNEL);
-		dmab->area = alloc_pages_exact(size, gfp);
-		break;
-	case SNDRV_DMA_TYPE_VMALLOC:
-		gfp = snd_mem_get_gfp_flags(device, GFP_KERNEL | __GFP_HIGHMEM);
-		dmab->area = __vmalloc(size, gfp);
-		break;
-#ifdef CONFIG_HAS_DMA
-#ifdef CONFIG_GENERIC_ALLOCATOR
-	case SNDRV_DMA_TYPE_DEV_IRAM:
-		snd_malloc_dev_iram(dmab, size);
-		if (dmab->area)
-			break;
-		/* Internal memory might have limited size and no enough space,
-		 * so if we fail to malloc, try to fetch memory traditionally.
-		 */
-		dmab->dev.type = SNDRV_DMA_TYPE_DEV;
-		fallthrough;
-#endif /* CONFIG_GENERIC_ALLOCATOR */
-	case SNDRV_DMA_TYPE_DEV:
-	case SNDRV_DMA_TYPE_DEV_UC:
-		snd_malloc_dev_pages(dmab, size);
-		break;
-#endif
-#ifdef CONFIG_SND_DMA_SGBUF
-	case SNDRV_DMA_TYPE_DEV_SG:
-	case SNDRV_DMA_TYPE_DEV_UC_SG:
-		snd_malloc_sgbuf_pages(device, size, dmab, NULL);
-		break;
-#endif
-	default:
-		pr_err("snd-malloc: invalid device type %d\n", type);
-		return -ENXIO;
-	}
-	if (! dmab->area)
+	err = __snd_dma_alloc_pages(dmab, size);
+	if (err < 0)
+		return err;
+	if (!dmab->area)
 		return -ENOMEM;
 	dmab->bytes = size;
 	return 0;
@@ -217,7 +112,6 @@ int snd_dma_alloc_pages_fallback(int type, struct device *device, size_t size,
 }
 EXPORT_SYMBOL(snd_dma_alloc_pages_fallback);
 
-
 /**
  * snd_dma_free_pages - release the allocated buffer
  * @dmab: the buffer allocation record to release
@@ -226,32 +120,235 @@ EXPORT_SYMBOL(snd_dma_alloc_pages_fallback);
  */
 void snd_dma_free_pages(struct snd_dma_buffer *dmab)
 {
-	switch (dmab->dev.type) {
-	case SNDRV_DMA_TYPE_CONTINUOUS:
-		free_pages_exact(dmab->area, dmab->bytes);
-		break;
-	case SNDRV_DMA_TYPE_VMALLOC:
-		vfree(dmab->area);
-		break;
+	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
+
+	if (ops && ops->free)
+		ops->free(dmab);
+}
+EXPORT_SYMBOL(snd_dma_free_pages);
+
+/**
+ * snd_sgbuf_get_addr - return the physical address at the corresponding offset
+ * @dmab: buffer allocation information
+ * @offset: offset in the ring buffer
+ */
+dma_addr_t snd_sgbuf_get_addr(struct snd_dma_buffer *dmab, size_t offset)
+{
+	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
+
+	if (ops && ops->get_addr)
+		return ops->get_addr(dmab, offset);
+	else
+		return dmab->addr + offset;
+}
+EXPORT_SYMBOL(snd_sgbuf_get_addr);
+
+/**
+ * snd_sgbuf_get_page - return the physical page at the corresponding offset
+ * @dmab: buffer allocation information
+ * @offset: offset in the ring buffer
+ */
+struct page *snd_sgbuf_get_page(struct snd_dma_buffer *dmab, size_t offset)
+{
+	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
+
+	if (ops && ops->get_page)
+		return ops->get_page(dmab, offset);
+	else
+		return virt_to_page(dmab->area + offset);
+}
+EXPORT_SYMBOL(snd_sgbuf_get_page);
+
+/**
+ * snd_sgbuf_get_chunk_size - compute the max chunk size with continuous pages
+ *	on sg-buffer
+ * @dmab: buffer allocation information
+ * @ofs: offset in the ring buffer
+ * @size: the requested size
+ */
+unsigned int snd_sgbuf_get_chunk_size(struct snd_dma_buffer *dmab,
+				      unsigned int ofs, unsigned int size)
+{
+	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
+
+	if (ops && ops->get_chunk_size)
+		return ops->get_chunk_size(dmab, ofs, size);
+	else
+		return size;
+}
+EXPORT_SYMBOL(snd_sgbuf_get_chunk_size);
+
+/*
+ * Continuous pages allocator
+ */
+static int snd_dma_continuous_alloc(struct snd_dma_buffer *dmab, size_t size)
+{
+	gfp_t gfp = snd_mem_get_gfp_flags(dmab, GFP_KERNEL);
+
+	dmab->area = alloc_pages_exact(size, gfp);
+	return 0;
+}
+
+static void snd_dma_continuous_free(struct snd_dma_buffer *dmab)
+{
+	free_pages_exact(dmab->area, dmab->bytes);
+}
+
+static const struct snd_malloc_ops snd_dma_continuous_ops = {
+	.alloc = snd_dma_continuous_alloc,
+	.free = snd_dma_continuous_free,
+};
+
+/*
+ * VMALLOC allocator
+ */
+static int snd_dma_vmalloc_alloc(struct snd_dma_buffer *dmab, size_t size)
+{
+	gfp_t gfp = snd_mem_get_gfp_flags(dmab, GFP_KERNEL | __GFP_HIGHMEM);
+
+	dmab->area = __vmalloc(size, gfp);
+	return 0;
+}
+
+static void snd_dma_vmalloc_free(struct snd_dma_buffer *dmab)
+{
+	vfree(dmab->area);
+}
+
+static dma_addr_t snd_dma_vmalloc_get_addr(struct snd_dma_buffer *dmab,
+					   size_t offset)
+{
+	return page_to_phys(vmalloc_to_page(dmab->area + offset)) +
+		offset % PAGE_SIZE;
+}
+
+static struct page *snd_dma_vmalloc_get_page(struct snd_dma_buffer *dmab,
+					     size_t offset)
+{
+	return vmalloc_to_page(dmab->area + offset);
+}
+
+static unsigned int
+snd_dma_vmalloc_get_chunk_size(struct snd_dma_buffer *dmab,
+			       unsigned int ofs, unsigned int size)
+{
+	ofs %= PAGE_SIZE;
+	size += ofs;
+	if (size > PAGE_SIZE)
+		size = PAGE_SIZE;
+	return size - ofs;
+}
+
+static const struct snd_malloc_ops snd_dma_vmalloc_ops = {
+	.alloc = snd_dma_vmalloc_alloc,
+	.free = snd_dma_vmalloc_free,
+	.get_addr = snd_dma_vmalloc_get_addr,
+	.get_page = snd_dma_vmalloc_get_page,
+	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
+};
+
 #ifdef CONFIG_HAS_DMA
+/*
+ * IRAM allocator
+ */
 #ifdef CONFIG_GENERIC_ALLOCATOR
-	case SNDRV_DMA_TYPE_DEV_IRAM:
-		snd_free_dev_iram(dmab);
-		break;
+static int snd_dma_iram_alloc(struct snd_dma_buffer *dmab, size_t size)
+{
+	struct device *dev = dmab->dev.dev;
+	struct gen_pool *pool;
+
+	if (dev->of_node) {
+		pool = of_gen_pool_get(dev->of_node, "iram", 0);
+		/* Assign the pool into private_data field */
+		dmab->private_data = pool;
+
+		dmab->area = gen_pool_dma_alloc_align(pool, size, &dmab->addr,
+						      PAGE_SIZE);
+		if (dmab->area)
+			return 0;
+	}
+
+	/* Internal memory might have limited size and no enough space,
+	 * so if we fail to malloc, try to fetch memory traditionally.
+	 */
+	dmab->dev.type = SNDRV_DMA_TYPE_DEV;
+	return __snd_dma_alloc_pages(dmab, size);
+}
+
+static void snd_dma_iram_free(struct snd_dma_buffer *dmab)
+{
+	struct gen_pool *pool = dmab->private_data;
+
+	if (pool && dmab->area)
+		gen_pool_free(pool, (unsigned long)dmab->area, dmab->bytes);
+}
+
+static const struct snd_malloc_ops snd_dma_iram_ops = {
+	.alloc = snd_dma_iram_alloc,
+	.free = snd_dma_iram_free,
+};
 #endif /* CONFIG_GENERIC_ALLOCATOR */
-	case SNDRV_DMA_TYPE_DEV:
-	case SNDRV_DMA_TYPE_DEV_UC:
-		snd_free_dev_pages(dmab);
-		break;
+
+/*
+ * Coherent device pages allocator
+ */
+static int snd_dma_dev_alloc(struct snd_dma_buffer *dmab, size_t size)
+{
+	gfp_t gfp_flags;
+
+	gfp_flags = GFP_KERNEL
+		| __GFP_COMP	/* compound page lets parts be mapped */
+		| __GFP_NORETRY /* don't trigger OOM-killer */
+		| __GFP_NOWARN; /* no stack trace print - this call is non-critical */
+	dmab->area = dma_alloc_coherent(dmab->dev.dev, size, &dmab->addr,
+					gfp_flags);
+#ifdef CONFIG_X86
+	if (dmab->area && dmab->dev.type == SNDRV_DMA_TYPE_DEV_UC)
+		set_memory_wc((unsigned long)dmab->area,
+			      PAGE_ALIGN(size) >> PAGE_SHIFT);
 #endif
+	return 0;
+}
+
+static void snd_dma_dev_free(struct snd_dma_buffer *dmab)
+{
+#ifdef CONFIG_X86
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_UC)
+		set_memory_wb((unsigned long)dmab->area,
+			      PAGE_ALIGN(dmab->bytes) >> PAGE_SHIFT);
+#endif
+	dma_free_coherent(dmab->dev.dev, dmab->bytes, dmab->area, dmab->addr);
+}
+
+static const struct snd_malloc_ops snd_dma_dev_ops = {
+	.alloc = snd_dma_dev_alloc,
+	.free = snd_dma_dev_free,
+};
+#endif /* CONFIG_HAS_DMA */
+
+/*
+ * Entry points
+ */
+static const struct snd_malloc_ops *dma_ops[] = {
+	[SNDRV_DMA_TYPE_CONTINUOUS] = &snd_dma_continuous_ops,
+	[SNDRV_DMA_TYPE_VMALLOC] = &snd_dma_vmalloc_ops,
+#ifdef CONFIG_HAS_DMA
+	[SNDRV_DMA_TYPE_DEV] = &snd_dma_dev_ops,
+	[SNDRV_DMA_TYPE_DEV_UC] = &snd_dma_dev_ops,
+#ifdef CONFIG_GENERIC_ALLOCATOR
+	[SNDRV_DMA_TYPE_DEV_IRAM] = &snd_dma_iram_ops,
+#endif /* CONFIG_GENERIC_ALLOCATOR */
+#endif /* CONFIG_HAS_DMA */
 #ifdef CONFIG_SND_DMA_SGBUF
-	case SNDRV_DMA_TYPE_DEV_SG:
-	case SNDRV_DMA_TYPE_DEV_UC_SG:
-		snd_free_sgbuf_pages(dmab);
-		break;
+	[SNDRV_DMA_TYPE_DEV_SG] = &snd_dma_sg_ops,
+	[SNDRV_DMA_TYPE_DEV_UC_SG] = &snd_dma_sg_ops,
 #endif
-	default:
-		pr_err("snd-malloc: invalid device type %d\n", dmab->dev.type);
-	}
+};
+
+static const struct snd_malloc_ops *snd_dma_get_ops(struct snd_dma_buffer *dmab)
+{
+	if (WARN_ON_ONCE(dmab->dev.type <= SNDRV_DMA_TYPE_UNKNOWN ||
+			 dmab->dev.type >= ARRAY_SIZE(dma_ops)))
+		return NULL;
+	return dma_ops[dmab->dev.type];
 }
-EXPORT_SYMBOL(snd_dma_free_pages);
diff --git a/sound/core/memalloc_local.h b/sound/core/memalloc_local.h
new file mode 100644
index 000000000000..fe55416253bf
--- /dev/null
+++ b/sound/core/memalloc_local.h
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#ifndef __MEMALLOC_LOCAL_H
+#define __MEMALLOC_LOCAL_H
+
+struct snd_malloc_ops {
+	int (*alloc)(struct snd_dma_buffer *dmab, size_t size);
+	void (*free)(struct snd_dma_buffer *dmab);
+	dma_addr_t (*get_addr)(struct snd_dma_buffer *dmab, size_t offset);
+	struct page *(*get_page)(struct snd_dma_buffer *dmab, size_t offset);
+	unsigned int (*get_chunk_size)(struct snd_dma_buffer *dmab,
+				       unsigned int ofs, unsigned int size);
+};
+
+#ifdef CONFIG_SND_DMA_SGBUF
+extern const struct snd_malloc_ops snd_dma_sg_ops;
+#endif
+
+#endif /* __MEMALLOC_LOCAL_H */
diff --git a/sound/core/pcm_local.h b/sound/core/pcm_local.h
index e3b3558aeab6..fe9689b8a6a6 100644
--- a/sound/core/pcm_local.h
+++ b/sound/core/pcm_local.h
@@ -65,11 +65,6 @@ void __snd_pcm_xrun(struct snd_pcm_substream *substream);
 void snd_pcm_group_init(struct snd_pcm_group *group);
 void snd_pcm_sync_stop(struct snd_pcm_substream *substream, bool sync_irq);
 
-#ifdef CONFIG_SND_DMA_SGBUF
-struct page *snd_pcm_sgbuf_ops_page(struct snd_pcm_substream *substream,
-				    unsigned long offset);
-#endif
-
 #define PCM_RUNTIME_CHECK(sub) snd_BUG_ON(!(sub) || !(sub)->runtime)
 
 /* loop over all PCM substreams */
diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 542a75babdee..d7621ed105bd 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -337,27 +337,6 @@ void snd_pcm_set_managed_buffer_all(struct snd_pcm *pcm, int type,
 }
 EXPORT_SYMBOL(snd_pcm_set_managed_buffer_all);
 
-#ifdef CONFIG_SND_DMA_SGBUF
-/*
- * snd_pcm_sgbuf_ops_page - get the page struct at the given offset
- * @substream: the pcm substream instance
- * @offset: the buffer offset
- *
- * Used as the page callback of PCM ops.
- *
- * Return: The page struct at the given buffer offset. %NULL on failure.
- */
-struct page *snd_pcm_sgbuf_ops_page(struct snd_pcm_substream *substream, unsigned long offset)
-{
-	struct snd_sg_buf *sgbuf = snd_pcm_substream_sgbuf(substream);
-
-	unsigned int idx = offset >> PAGE_SHIFT;
-	if (idx >= (unsigned int)sgbuf->pages)
-		return NULL;
-	return sgbuf->page_table[idx];
-}
-#endif /* CONFIG_SND_DMA_SGBUF */
-
 /**
  * snd_pcm_lib_malloc_pages - allocate the DMA buffer
  * @substream: the substream to allocate the DMA buffer to
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index eb468573f070..48d63dbb17ba 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3644,24 +3644,6 @@ static int snd_pcm_mmap_control(struct snd_pcm_substream *substream, struct file
 }
 #endif /* coherent mmap */
 
-static inline struct page *
-snd_pcm_default_page_ops(struct snd_pcm_substream *substream, unsigned long ofs)
-{
-	void *vaddr = substream->runtime->dma_area + ofs;
-
-	switch (substream->dma_buffer.dev.type) {
-#ifdef CONFIG_SND_DMA_SGBUF
-	case SNDRV_DMA_TYPE_DEV_SG:
-	case SNDRV_DMA_TYPE_DEV_UC_SG:
-		return snd_pcm_sgbuf_ops_page(substream, ofs);
-#endif /* CONFIG_SND_DMA_SGBUF */
-	case SNDRV_DMA_TYPE_VMALLOC:
-		return vmalloc_to_page(vaddr);
-	default:
-		return virt_to_page(vaddr);
-	}
-}
-
 /*
  * fault callback for mmapping a RAM page
  */
@@ -3683,7 +3665,7 @@ static vm_fault_t snd_pcm_mmap_data_fault(struct vm_fault *vmf)
 	if (substream->ops->page)
 		page = substream->ops->page(substream, offset);
 	else
-		page = snd_pcm_default_page_ops(substream, offset);
+		page = snd_sgbuf_get_page(snd_pcm_get_dma_buf(substream), offset);
 	if (!page)
 		return VM_FAULT_SIGBUS;
 	get_page(page);
diff --git a/sound/core/sgbuf.c b/sound/core/sgbuf.c
index 29ddb76187e5..232cf3f1bcb3 100644
--- a/sound/core/sgbuf.c
+++ b/sound/core/sgbuf.c
@@ -10,20 +10,34 @@
 #include <linux/vmalloc.h>
 #include <linux/export.h>
 #include <sound/memalloc.h>
-
+#include "memalloc_local.h"
+
+struct snd_sg_page {
+	void *buf;
+	dma_addr_t addr;
+};
+
+struct snd_sg_buf {
+	int size;	/* allocated byte size */
+	int pages;	/* allocated pages */
+	int tblsize;	/* allocated table size */
+	struct snd_sg_page *table;	/* address table */
+	struct page **page_table;	/* page table (for vmap/vunmap) */
+	struct device *dev;
+};
 
 /* table entries are align to 32 */
 #define SGBUF_TBL_ALIGN		32
 #define sgbuf_align_table(tbl)	ALIGN((tbl), SGBUF_TBL_ALIGN)
 
-int snd_free_sgbuf_pages(struct snd_dma_buffer *dmab)
+static void snd_dma_sg_free(struct snd_dma_buffer *dmab)
 {
 	struct snd_sg_buf *sgbuf = dmab->private_data;
 	struct snd_dma_buffer tmpb;
 	int i;
 
-	if (! sgbuf)
-		return -EINVAL;
+	if (!sgbuf)
+		return;
 
 	vunmap(dmab->area);
 	dmab->area = NULL;
@@ -45,15 +59,11 @@ int snd_free_sgbuf_pages(struct snd_dma_buffer *dmab)
 	kfree(sgbuf->page_table);
 	kfree(sgbuf);
 	dmab->private_data = NULL;
-	
-	return 0;
 }
 
 #define MAX_ALLOC_PAGES		32
 
-void *snd_malloc_sgbuf_pages(struct device *device,
-			     size_t size, struct snd_dma_buffer *dmab,
-			     size_t *res_size)
+static int snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
 	struct snd_sg_buf *sgbuf;
 	unsigned int i, pages, chunk, maxpages;
@@ -63,18 +73,16 @@ void *snd_malloc_sgbuf_pages(struct device *device,
 	int type = SNDRV_DMA_TYPE_DEV;
 	pgprot_t prot = PAGE_KERNEL;
 
-	dmab->area = NULL;
-	dmab->addr = 0;
 	dmab->private_data = sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
-	if (! sgbuf)
-		return NULL;
+	if (!sgbuf)
+		return -ENOMEM;
 	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_UC_SG) {
 		type = SNDRV_DMA_TYPE_DEV_UC;
 #ifdef pgprot_noncached
 		prot = pgprot_noncached(PAGE_KERNEL);
 #endif
 	}
-	sgbuf->dev = device;
+	sgbuf->dev = dmab->dev.dev;
 	pages = snd_sgbuf_aligned_pages(size);
 	sgbuf->tblsize = sgbuf_align_table(pages);
 	table = kcalloc(sgbuf->tblsize, sizeof(*table), GFP_KERNEL);
@@ -94,12 +102,10 @@ void *snd_malloc_sgbuf_pages(struct device *device,
 		if (chunk > maxpages)
 			chunk = maxpages;
 		chunk <<= PAGE_SHIFT;
-		if (snd_dma_alloc_pages_fallback(type, device,
+		if (snd_dma_alloc_pages_fallback(type, dmab->dev.dev,
 						 chunk, &tmpb) < 0) {
 			if (!sgbuf->pages)
 				goto _failed;
-			if (!res_size)
-				goto _failed;
 			size = sgbuf->pages * PAGE_SIZE;
 			break;
 		}
@@ -124,27 +130,42 @@ void *snd_malloc_sgbuf_pages(struct device *device,
 	dmab->area = vmap(sgbuf->page_table, sgbuf->pages, VM_MAP, prot);
 	if (! dmab->area)
 		goto _failed;
-	if (res_size)
-		*res_size = sgbuf->size;
-	return dmab->area;
+	return 0;
 
  _failed:
-	snd_free_sgbuf_pages(dmab); /* free the table */
-	return NULL;
+	snd_dma_sg_free(dmab); /* free the table */
+	return -ENOMEM;
 }
 
-/*
- * compute the max chunk size with continuous pages on sg-buffer
- */
-unsigned int snd_sgbuf_get_chunk_size(struct snd_dma_buffer *dmab,
-				      unsigned int ofs, unsigned int size)
+static dma_addr_t snd_dma_sg_get_addr(struct snd_dma_buffer *dmab,
+				      size_t offset)
+{
+	struct snd_sg_buf *sgbuf = dmab->private_data;
+	dma_addr_t addr;
+
+	addr = sgbuf->table[offset >> PAGE_SHIFT].addr;
+	addr &= ~((dma_addr_t)PAGE_SIZE - 1);
+	return addr + offset % PAGE_SIZE;
+}
+
+static struct page *snd_dma_sg_get_page(struct snd_dma_buffer *dmab,
+					size_t offset)
+{
+	struct snd_sg_buf *sgbuf = dmab->private_data;
+	unsigned int idx = offset >> PAGE_SHIFT;
+
+	if (idx >= (unsigned int)sgbuf->pages)
+		return NULL;
+	return sgbuf->page_table[idx];
+}
+
+static unsigned int snd_dma_sg_get_chunk_size(struct snd_dma_buffer *dmab,
+					      unsigned int ofs,
+					      unsigned int size)
 {
 	struct snd_sg_buf *sg = dmab->private_data;
 	unsigned int start, end, pg;
 
-	if (!sg)
-		return size;
-
 	start = ofs >> PAGE_SHIFT;
 	end = (ofs + size - 1) >> PAGE_SHIFT;
 	/* check page continuity */
@@ -160,4 +181,11 @@ unsigned int snd_sgbuf_get_chunk_size(struct snd_dma_buffer *dmab,
 	/* ok, all on continuous pages */
 	return size;
 }
-EXPORT_SYMBOL(snd_sgbuf_get_chunk_size);
+
+const struct snd_malloc_ops snd_dma_sg_ops = {
+	.alloc = snd_dma_sg_alloc,
+	.free = snd_dma_sg_free,
+	.get_addr = snd_dma_sg_get_addr,
+	.get_page = snd_dma_sg_get_page,
+	.get_chunk_size = snd_dma_sg_get_chunk_size,
+};
-- 
2.26.2

