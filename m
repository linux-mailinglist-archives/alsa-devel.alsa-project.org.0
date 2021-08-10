Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3853B3E59D6
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 14:24:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B7D1684;
	Tue, 10 Aug 2021 14:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B7D1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628598271;
	bh=aCp5xsYXLXJ4zICDLac9gnTCK0OBfGjaYwBfbJyO2sk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mkh55LQOECdONcHAed9E6jB0xfg4tLY+q73/DyzXEeiTu+EXB50hIxCahkFV5df0A
	 lIuagEOLmWpSRa4Qwiu7Tiw/WvOgzEDr/p86FbiXZ3SaWHPhxT3Nq6canQIDaxm1Zs
	 zFgcFxIdRu+a6i28m7p8+zptHXKxW0U5YGLY6W6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60980F804D1;
	Tue, 10 Aug 2021 14:22:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B537F804D2; Tue, 10 Aug 2021 14:22:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D74FF8025D
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 14:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D74FF8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="zZlcgpi7"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="xlqrUJqV"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D548E200A8
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 12:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628598123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qwQNHQS3LB2v1g+DTf72ROkDINbs/5haW8LwLpLowHc=;
 b=zZlcgpi7hOW0OFpNcdmv1syzxFZW/B3SOBqYRhbRMH2T/ZsVk05GGm7CLhbHOFDxZ8wWNR
 3oblOCeitdlApUdpidZ7gqN4VNHXE47eaTSN8Ma+nh9GHhCNT2mHRLvII5vFDR+GgFSKPW
 /SXGsB8OS+EIh+QrAopG7AP64yT7w2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628598123;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qwQNHQS3LB2v1g+DTf72ROkDINbs/5haW8LwLpLowHc=;
 b=xlqrUJqVmE8z7IbhnddvZ/naOIC1gdLw4Qg5lT3IlqcBFVXPnn3tLRqR/rs6tXsfVifO9H
 /swzMXvXNAyzzSDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C1BABA3B85;
 Tue, 10 Aug 2021 12:22:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH RFC 4/5] ALSA: memalloc: Support for non-contiguous page
 allocation
Date: Tue, 10 Aug 2021 14:21:59 +0200
Message-Id: <20210810122200.971-5-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210810122200.971-1-tiwai@suse.de>
References: <20210810122200.971-1-tiwai@suse.de>
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

This patch adds the support for allocation of non-contiguous DMA pages
in the common memalloc helper.  It's another SG-buffer type, but
unlike the existing one, this is directional and requires the explicit
sync / invalidation of dirty pages on non-coherent architectures.

For this enhancement, the following points are changed:
- snd_dma_device stores the DMA direction.
- A new variant, snd_dma_alloc_dir_pages() and *_all() are introduced;
  snd_dma_alloc_pages() and *_all() just wrap with DMA_BIDIRECTIONAL.
- A new helper snd_dma_buffer_sync() is introduced;
  this gets called in the appropriate places.
- A new allocation type, SNDRV_DMA_TYPE_NONCONTIG, is introduced.

The driver needs to call the allocation with the new type, and it
likely needs to add SNDRV_PCM_INFO_EXPLICIT_SYNC flag to the PCM
hardware.info for disabling the mmap of control and status data.
Otherwise it'd miss explicit sync in the mmap mode.

The explicit sync is performed in  the points before and after
read/write transfer as well as and applptr/hwptr syncptr ioctl.  In
the case of mmap mode, user-space is supposed to call the syncptr
ioctl with the hwptr flag to update and fetch the status at first.
This corresponds to CPU-sync.  Then user-space advances the applptr
via syncptr ioctl again with applptr flag, and this corresponds to the
device sync with flushing.

Other than the DMA direction and the explicit sync, the usage of this
buffer type is almost equivalent with the existing
SNDRV_DMA_TYPE_DEV_SG; you can get the page and the address via
snd_sgbuf_get_page() and snd_sgbuf_get_addr(), also calculate the
continuous pages via snd_sgbuf_get_chunk_size().

For those SG-handling, the non-contig type shares the same ops with
the vmalloc handler.  As we do always vmap the SG pages at first, the
actual address can be deduced from the vmapped address easily without
iterating the SG-list.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h    | 45 +++++++++++++++--
 sound/core/memalloc.c       | 99 ++++++++++++++++++++++++++++++++++---
 sound/core/memalloc_local.h |  1 +
 sound/core/pcm_lib.c        |  9 ++++
 sound/core/pcm_memory.c     | 13 +++--
 sound/core/pcm_native.c     | 13 +++++
 6 files changed, 165 insertions(+), 15 deletions(-)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index f5f0d32f6d61..ed54f9dfb2b3 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -9,10 +9,12 @@
 #ifndef __SOUND_MEMALLOC_H
 #define __SOUND_MEMALLOC_H
 
+#include <linux/dma-direction.h>
 #include <asm/page.h>
 
 struct device;
 struct vm_area_struct;
+struct sg_table;
 struct snd_malloc_ops;
 
 /*
@@ -20,6 +22,7 @@ struct snd_malloc_ops;
  */
 struct snd_dma_device {
 	int type;			/* SNDRV_DMA_TYPE_XXX */
+	enum dma_data_direction dir;	/* DMA direction */
 	struct device *dev;		/* generic device */
 };
 
@@ -46,6 +49,7 @@ struct snd_dma_device {
 #define SNDRV_DMA_TYPE_DEV_IRAM	SNDRV_DMA_TYPE_DEV
 #endif
 #define SNDRV_DMA_TYPE_VMALLOC		7	/* vmalloc'ed buffer */
+#define SNDRV_DMA_TYPE_NONCONTIG	8	/* non-coherent SG buffer */
 
 /*
  * info for buffer allocation
@@ -68,22 +72,55 @@ static inline unsigned int snd_sgbuf_aligned_pages(size_t size)
 }
 
 /* allocate/release a buffer */
-int snd_dma_alloc_pages(int type, struct device *dev, size_t size,
-			struct snd_dma_buffer *dmab);
+int snd_dma_alloc_dir_pages(int type, struct device *dev,
+			    enum dma_data_direction dir, size_t size,
+			    struct snd_dma_buffer *dmab);
+
+static inline int snd_dma_alloc_pages(int type, struct device *dev,
+				      size_t size, struct snd_dma_buffer *dmab)
+{
+	return snd_dma_alloc_dir_pages(type, dev, DMA_BIDIRECTIONAL, size, dmab);
+}
+
 int snd_dma_alloc_pages_fallback(int type, struct device *dev, size_t size,
                                  struct snd_dma_buffer *dmab);
 void snd_dma_free_pages(struct snd_dma_buffer *dmab);
 int snd_dma_buffer_mmap(struct snd_dma_buffer *dmab,
 			struct vm_area_struct *area);
 
+enum snd_dma_sync_mode { SNDRV_DMA_SYNC_CPU, SNDRV_DMA_SYNC_DEVICE };
+#ifdef CONFIG_HAS_DMA
+void snd_dma_buffer_sync(struct snd_dma_buffer *dmab,
+			 enum snd_dma_sync_mode mode);
+#else
+static inline void snd_dma_buffer_sync(struct snd_dma_buffer *dmab,
+				       enum snd_dma_sync_mode mode) {}
+#endif
+
+void snd_dma_buffer_sync(struct snd_dma_buffer *dmab,
+			 enum snd_dma_sync_mode mode);
+
 dma_addr_t snd_sgbuf_get_addr(struct snd_dma_buffer *dmab, size_t offset);
 struct page *snd_sgbuf_get_page(struct snd_dma_buffer *dmab, size_t offset);
 unsigned int snd_sgbuf_get_chunk_size(struct snd_dma_buffer *dmab,
 				      unsigned int ofs, unsigned int size);
 
 /* device-managed memory allocator */
-struct snd_dma_buffer *snd_devm_alloc_pages(struct device *dev, int type,
-					    size_t size);
+struct snd_dma_buffer *snd_devm_alloc_dir_pages(struct device *dev, int type,
+						enum dma_data_direction dir,
+						size_t size);
+
+static inline struct snd_dma_buffer *
+snd_devm_alloc_pages(struct device *dev, int type, size_t size)
+{
+	return snd_devm_alloc_dir_pages(dev, type, DMA_BIDIRECTIONAL, size);
+}
+
+static inline struct sg_table *
+snd_dma_noncontig_sg_table(struct snd_dma_buffer *dmab)
+{
+	return dmab->private_data;
+}
 
 #endif /* __SOUND_MEMALLOC_H */
 
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 3f42376dfb0b..5ffd356e0327 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -10,6 +10,7 @@
 #include <linux/mm.h>
 #include <linux/dma-mapping.h>
 #include <linux/genalloc.h>
+#include <linux/highmem.h>
 #include <linux/vmalloc.h>
 #ifdef CONFIG_X86
 #include <asm/set_memory.h>
@@ -30,9 +31,11 @@ static inline gfp_t snd_mem_get_gfp_flags(const struct snd_dma_buffer *dmab,
 }
 
 /**
- * snd_dma_alloc_pages - allocate the buffer area according to the given type
+ * snd_dma_alloc_dir_pages - allocate the buffer area according to the given
+ *	type and direction
  * @type: the DMA buffer type
  * @device: the device pointer
+ * @dir: DMA direction
  * @size: the buffer size to allocate
  * @dmab: buffer allocation record to store the allocated data
  *
@@ -42,8 +45,9 @@ static inline gfp_t snd_mem_get_gfp_flags(const struct snd_dma_buffer *dmab,
  * Return: Zero if the buffer with the given size is allocated successfully,
  * otherwise a negative value on error.
  */
-int snd_dma_alloc_pages(int type, struct device *device, size_t size,
-			struct snd_dma_buffer *dmab)
+int snd_dma_alloc_dir_pages(int type, struct device *device,
+			    enum dma_data_direction dir, size_t size,
+			    struct snd_dma_buffer *dmab)
 {
 	const struct snd_malloc_ops *ops;
 	if (WARN_ON(!size))
@@ -54,6 +58,7 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 	size = PAGE_ALIGN(size);
 	dmab->dev.type = type;
 	dmab->dev.dev = device;
+	dmab->dev.dir = dir;
 	dmab->bytes = 0;
 	dmab->addr = 0;
 	dmab->private_data = NULL;
@@ -69,7 +74,7 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 	dmab->bytes = size;
 	return 0;
 }
-EXPORT_SYMBOL(snd_dma_alloc_pages);
+EXPORT_SYMBOL(snd_dma_alloc_dir_pages);
 
 /**
  * snd_dma_alloc_pages_fallback - allocate the buffer area according to the given type with fallback
@@ -125,9 +130,10 @@ static void __snd_release_pages(struct device *dev, void *res)
 }
 
 /**
- * snd_devm_alloc_pages - allocate the buffer and manage with devres
+ * snd_devm_alloc_dir_pages - allocate the buffer and manage with devres
  * @dev: the device pointer
  * @type: the DMA buffer type
+ * @dir: DMA direction
  * @size: the buffer size to allocate
  *
  * Allocate buffer pages depending on the given type and manage using devres.
@@ -140,7 +146,8 @@ static void __snd_release_pages(struct device *dev, void *res)
  * The function returns the snd_dma_buffer object at success, or NULL if failed.
  */
 struct snd_dma_buffer *
-snd_devm_alloc_pages(struct device *dev, int type, size_t size)
+snd_devm_alloc_dir_pages(struct device *dev, int type,
+			 enum dma_data_direction dir, size_t size)
 {
 	struct snd_dma_buffer *dmab;
 	int err;
@@ -153,7 +160,7 @@ snd_devm_alloc_pages(struct device *dev, int type, size_t size)
 	if (!dmab)
 		return NULL;
 
-	err = snd_dma_alloc_pages(type, dev, size, dmab);
+	err = snd_dma_alloc_dir_pages(type, dev, dir, size, dmab);
 	if (err < 0) {
 		devres_free(dmab);
 		return NULL;
@@ -162,7 +169,7 @@ snd_devm_alloc_pages(struct device *dev, int type, size_t size)
 	devres_add(dev, dmab);
 	return dmab;
 }
-EXPORT_SYMBOL_GPL(snd_devm_alloc_pages);
+EXPORT_SYMBOL_GPL(snd_devm_alloc_dir_pages);
 
 /**
  * snd_dma_buffer_mmap - perform mmap of the given DMA buffer
@@ -179,6 +186,21 @@ int snd_dma_buffer_mmap(struct snd_dma_buffer *dmab,
 }
 EXPORT_SYMBOL(snd_dma_buffer_mmap);
 
+#ifdef CONFIG_HAS_DMA
+/**
+ * snd_dma_buffer_sync - sync DMA buffer between CPU and device
+ * @dmab: buffer allocation information
+ * @mod: sync mode
+ */
+void snd_dma_buffer_sync(struct snd_dma_buffer *dmab,
+			 enum snd_dma_sync_mode mode)
+{
+	if (dmab && dmab->ops && dmab->ops->sync)
+		dmab->ops->sync(dmab, mode);
+}
+EXPORT_SYMBOL_GPL(snd_dma_buffer_sync);
+#endif /* CONFIG_HAS_DMA */
+
 /**
  * snd_sgbuf_get_addr - return the physical address at the corresponding offset
  * @dmab: buffer allocation information
@@ -457,6 +479,66 @@ static const struct snd_malloc_ops snd_dma_wc_ops = {
 	.mmap = snd_dma_wc_mmap,
 };
 #endif /* CONFIG_X86 */
+
+/*
+ * Non-contiguous pages allocator
+ */
+static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
+{
+	struct sg_table *sgt;
+	void *p;
+
+	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
+				      DEFAULT_GFP, 0);
+	if (!sgt)
+		return NULL;
+	p = dma_vmap_noncontiguous(dmab->dev.dev, size, sgt);
+	if (p)
+		dmab->private_data = sgt;
+	else
+		dma_free_noncontiguous(dmab->dev.dev, size, sgt, dmab->dev.dir);
+	return p;
+}
+
+static void snd_dma_noncontig_free(struct snd_dma_buffer *dmab)
+{
+	dma_vunmap_noncontiguous(dmab->dev.dev, dmab->area);
+	dma_free_noncontiguous(dmab->dev.dev, dmab->bytes, dmab->private_data,
+			       dmab->dev.dir);
+}
+
+static int snd_dma_noncontig_mmap(struct snd_dma_buffer *dmab,
+				  struct vm_area_struct *area)
+{
+	return dma_mmap_noncontiguous(dmab->dev.dev, area,
+				      dmab->bytes, dmab->private_data);
+}
+
+static void snd_dma_noncontig_sync(struct snd_dma_buffer *dmab,
+				   enum snd_dma_sync_mode mode)
+{
+	if (mode == SNDRV_DMA_SYNC_CPU) {
+		dma_sync_sgtable_for_cpu(dmab->dev.dev, dmab->private_data,
+					 dmab->dev.dir);
+		invalidate_kernel_vmap_range(dmab->area, dmab->bytes);
+	} else {
+		flush_kernel_vmap_range(dmab->area, dmab->bytes);
+		dma_sync_sgtable_for_device(dmab->dev.dev, dmab->private_data,
+					    dmab->dev.dir);
+	}
+}
+
+static const struct snd_malloc_ops snd_dma_noncontig_ops = {
+	.alloc = snd_dma_noncontig_alloc,
+	.free = snd_dma_noncontig_free,
+	.mmap = snd_dma_noncontig_mmap,
+	.sync = snd_dma_noncontig_sync,
+	/* re-use vmalloc helpers for get_* ops */
+	.get_addr = snd_dma_vmalloc_get_addr,
+	.get_page = snd_dma_vmalloc_get_page,
+	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
+};
+
 #endif /* CONFIG_HAS_DMA */
 
 /*
@@ -468,6 +550,7 @@ static const struct snd_malloc_ops *dma_ops[] = {
 #ifdef CONFIG_HAS_DMA
 	[SNDRV_DMA_TYPE_DEV] = &snd_dma_dev_ops,
 	[SNDRV_DMA_TYPE_DEV_WC] = &snd_dma_wc_ops,
+	[SNDRV_DMA_TYPE_NONCONTIG] = &snd_dma_noncontig_ops,
 #ifdef CONFIG_GENERIC_ALLOCATOR
 	[SNDRV_DMA_TYPE_DEV_IRAM] = &snd_dma_iram_ops,
 #endif /* CONFIG_GENERIC_ALLOCATOR */
diff --git a/sound/core/memalloc_local.h b/sound/core/memalloc_local.h
index 9f2e0a608b49..a6f3a87194da 100644
--- a/sound/core/memalloc_local.h
+++ b/sound/core/memalloc_local.h
@@ -10,6 +10,7 @@ struct snd_malloc_ops {
 	unsigned int (*get_chunk_size)(struct snd_dma_buffer *dmab,
 				       unsigned int ofs, unsigned int size);
 	int (*mmap)(struct snd_dma_buffer *dmab, struct vm_area_struct *area);
+	void (*sync)(struct snd_dma_buffer *dmab, enum snd_dma_sync_mode mode);
 };
 
 #ifdef CONFIG_SND_DMA_SGBUF
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 7d5883432085..e263dfaefbf4 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -106,6 +106,9 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_ufram
 		frames -= transfer;
 		ofs = 0;
 	}
+	if (runtime->info & SNDRV_PCM_INFO_EXPLICIT_SYNC)
+		snd_dma_buffer_sync(snd_pcm_get_dma_buf(substream),
+				    SNDRV_DMA_SYNC_DEVICE);
 }
 
 #ifdef CONFIG_SND_DEBUG
@@ -2256,8 +2259,14 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 			goto _end_unlock;
 		}
 		snd_pcm_stream_unlock_irq(substream);
+		if (runtime->info & SNDRV_PCM_INFO_EXPLICIT_SYNC)
+			snd_dma_buffer_sync(snd_pcm_get_dma_buf(substream),
+					    SNDRV_DMA_SYNC_CPU);
 		err = writer(substream, appl_ofs, data, offset, frames,
 			     transfer);
+		if (runtime->info & SNDRV_PCM_INFO_EXPLICIT_SYNC)
+			snd_dma_buffer_sync(snd_pcm_get_dma_buf(substream),
+					    SNDRV_DMA_SYNC_DEVICE);
 		snd_pcm_stream_lock_irq(substream);
 		if (err < 0)
 			goto _end_unlock;
diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 7fbd1ccbb5b0..b70ce3b69ab4 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -32,15 +32,20 @@ module_param(max_alloc_per_card, ulong, 0644);
 MODULE_PARM_DESC(max_alloc_per_card, "Max total allocation bytes per card.");
 
 static int do_alloc_pages(struct snd_card *card, int type, struct device *dev,
-			  size_t size, struct snd_dma_buffer *dmab)
+			  int str, size_t size, struct snd_dma_buffer *dmab)
 {
+	enum dma_data_direction dir;
 	int err;
 
 	if (max_alloc_per_card &&
 	    card->total_pcm_alloc_bytes + size > max_alloc_per_card)
 		return -ENOMEM;
 
-	err = snd_dma_alloc_pages(type, dev, size, dmab);
+	if (str == SNDRV_PCM_STREAM_PLAYBACK)
+		dir = DMA_TO_DEVICE;
+	else
+		dir = DMA_FROM_DEVICE;
+	err = snd_dma_alloc_dir_pages(type, dev, dir, size, dmab);
 	if (!err) {
 		mutex_lock(&card->memory_mutex);
 		card->total_pcm_alloc_bytes += dmab->bytes;
@@ -77,7 +82,7 @@ static int preallocate_pcm_pages(struct snd_pcm_substream *substream,
 
 	do {
 		err = do_alloc_pages(card, dmab->dev.type, dmab->dev.dev,
-				     size, dmab);
+				     substream->stream, size, dmab);
 		if (err != -ENOMEM)
 			return err;
 		if (no_fallback)
@@ -177,6 +182,7 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
 			if (do_alloc_pages(card,
 					   substream->dma_buffer.dev.type,
 					   substream->dma_buffer.dev.dev,
+					   substream->stream,
 					   size, &new_dmab) < 0) {
 				buffer->error = -ENOMEM;
 				pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot preallocate for size %zu\n",
@@ -418,6 +424,7 @@ int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size)
 		if (do_alloc_pages(card,
 				   substream->dma_buffer.dev.type,
 				   substream->dma_buffer.dev.dev,
+				   substream->stream,
 				   size, dmab) < 0) {
 			kfree(dmab);
 			pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot preallocate for size %zu\n",
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index d233cb3b41d8..3a94882b1422 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2958,6 +2958,13 @@ static int snd_pcm_delay(struct snd_pcm_substream *substream,
 	return err;
 }
 		
+static void snd_pcm_dma_buffer_sync(struct snd_pcm_substream *substream,
+				    enum snd_dma_sync_mode mode)
+{
+	if (substream->runtime->info & SNDRV_PCM_INFO_EXPLICIT_SYNC)
+		snd_dma_buffer_sync(snd_pcm_get_dma_buf(substream), mode);
+}
+
 static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
 			    struct snd_pcm_sync_ptr __user *_sync_ptr)
 {
@@ -2978,6 +2985,7 @@ static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
 		err = snd_pcm_hwsync(substream);
 		if (err < 0)
 			return err;
+		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_CPU);
 	}
 	snd_pcm_stream_lock_irq(substream);
 	if (!(sync_ptr.flags & SNDRV_PCM_SYNC_PTR_APPL)) {
@@ -3000,6 +3008,8 @@ static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
 	sync_ptr.s.status.suspended_state = status->suspended_state;
 	sync_ptr.s.status.audio_tstamp = status->audio_tstamp;
 	snd_pcm_stream_unlock_irq(substream);
+	if (!(sync_ptr.flags & SNDRV_PCM_SYNC_PTR_APPL))
+		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
 	if (copy_to_user(_sync_ptr, &sync_ptr, sizeof(sync_ptr)))
 		return -EFAULT;
 	return 0;
@@ -3069,6 +3079,7 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 		err = snd_pcm_hwsync(substream);
 		if (err < 0)
 			return err;
+		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_CPU);
 	}
 	status = runtime->status;
 	control = runtime->control;
@@ -3096,6 +3107,8 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 	sstatus.suspended_state = status->suspended_state;
 	sstatus.audio_tstamp = status->audio_tstamp;
 	snd_pcm_stream_unlock_irq(substream);
+	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
+		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
 	if (put_user(sstatus.state, &src->s.status.state) ||
 	    put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
 	    put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec) ||
-- 
2.26.2

