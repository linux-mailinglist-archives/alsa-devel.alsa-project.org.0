Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1851E445958
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Nov 2021 19:10:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B9591685;
	Thu,  4 Nov 2021 19:09:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B9591685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636049424;
	bh=fZk4eiWY5FDNa8b7tsxT0yPIv8ZIQC0dNCzxaYxgA7g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sZKu6qakf7dfZDVHyOmRe4TQY59BOYy56C7pyQuzz9qGjLqrnIkC9U/IVzgRT2qlx
	 UQvXHyqJhdug45LmTfLTM0Jg375IrCGYSM59Phqntfjte8ZgnWpA7Vl8lATDS4cGle
	 tXAysR29mc7mtHDUqdAlkn9DVT1K5QkAg3JQV6Oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0495F8025F;
	Thu,  4 Nov 2021 19:09:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE6AFF8025D; Thu,  4 Nov 2021 19:08:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B977EF80148
 for <alsa-devel@alsa-project.org>; Thu,  4 Nov 2021 19:08:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B977EF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="cBCbdYoJ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="UyXLm+aW"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A3F7A218ED;
 Thu,  4 Nov 2021 18:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636049328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R6CwwcGMACEbcQKpWl/HDy1IADPhqjxaQ3EWR0mnmy4=;
 b=cBCbdYoJ9vLOBQ0ZnkOq4tj7Yw1/4sBJag67pdjKX+IWmLqowadUUfhbyhHBvPE2jF9GkW
 /8e6RaN0wMp6D+XEVyyjX95cLX38jFJ0F/SGHADP2v7nv95DiVjD+bbVg/uPKuvgaLdcAR
 Rsr5u81JuCwsYVZp1vRis2gHtoljjMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636049328;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R6CwwcGMACEbcQKpWl/HDy1IADPhqjxaQ3EWR0mnmy4=;
 b=UyXLm+aW2qXr44uUPxsRY+EA4/KYAYPxGaTpYVpFlRFkAOPmDpwwSmCuY2LcmJyX0Es3Sv
 Cqt8bo/SrJAwOICQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 997352C144;
 Thu,  4 Nov 2021 18:08:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ALSA: memalloc: Convert x86 SG-buffer handling with
 non-contiguous type"
Date: Thu,  4 Nov 2021 19:08:46 +0100
Message-Id: <20211104180846.16340-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Xu <alex_y_xu@yahoo.ca>
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

This reverts commit 2d9ea39917a4e4293bc2caea902c7059a330b611.

We've got a regression report showing that the audio got broken the
device over AMD IOMMU.  The conversion assumed the wrong pointer /
page mapping for the indirect mapping case, and we need to correct
this urgently, so let's revert it for now.

Fixes: 2d9ea39917a4 ("ALSA: memalloc: Convert x86 SG-buffer handling with non-contiguous type")
Reported-and-tested-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h |  14 +--
 sound/core/Makefile      |   1 +
 sound/core/memalloc.c    |  51 +---------
 sound/core/sgbuf.c       | 201 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 213 insertions(+), 54 deletions(-)
 create mode 100644 sound/core/sgbuf.c

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index 653dfffb3ac8..1051b84e8579 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -36,6 +36,13 @@ struct snd_dma_device {
 #define SNDRV_DMA_TYPE_CONTINUOUS	1	/* continuous no-DMA memory */
 #define SNDRV_DMA_TYPE_DEV		2	/* generic device continuous */
 #define SNDRV_DMA_TYPE_DEV_WC		5	/* continuous write-combined */
+#ifdef CONFIG_SND_DMA_SGBUF
+#define SNDRV_DMA_TYPE_DEV_SG		3	/* generic device SG-buffer */
+#define SNDRV_DMA_TYPE_DEV_WC_SG	6	/* SG write-combined */
+#else
+#define SNDRV_DMA_TYPE_DEV_SG	SNDRV_DMA_TYPE_DEV /* no SG-buf support */
+#define SNDRV_DMA_TYPE_DEV_WC_SG	SNDRV_DMA_TYPE_DEV_WC
+#endif
 #ifdef CONFIG_GENERIC_ALLOCATOR
 #define SNDRV_DMA_TYPE_DEV_IRAM		4	/* generic device iram-buffer */
 #else
@@ -44,13 +51,6 @@ struct snd_dma_device {
 #define SNDRV_DMA_TYPE_VMALLOC		7	/* vmalloc'ed buffer */
 #define SNDRV_DMA_TYPE_NONCONTIG	8	/* non-coherent SG buffer */
 #define SNDRV_DMA_TYPE_NONCOHERENT	9	/* non-coherent buffer */
-#ifdef CONFIG_SND_DMA_SGBUF
-#define SNDRV_DMA_TYPE_DEV_SG		SNDRV_DMA_TYPE_NONCONTIG
-#define SNDRV_DMA_TYPE_DEV_WC_SG	6	/* SG write-combined */
-#else
-#define SNDRV_DMA_TYPE_DEV_SG	SNDRV_DMA_TYPE_DEV /* no SG-buf support */
-#define SNDRV_DMA_TYPE_DEV_WC_SG	SNDRV_DMA_TYPE_DEV_WC
-#endif
 
 /*
  * info for buffer allocation
diff --git a/sound/core/Makefile b/sound/core/Makefile
index 350d704ced98..79e1407cd0de 100644
--- a/sound/core/Makefile
+++ b/sound/core/Makefile
@@ -19,6 +19,7 @@ snd-$(CONFIG_SND_JACK)	  += ctljack.o jack.o
 snd-pcm-y := pcm.o pcm_native.o pcm_lib.o pcm_misc.o \
 		pcm_memory.o memalloc.o
 snd-pcm-$(CONFIG_SND_PCM_TIMER) += pcm_timer.o
+snd-pcm-$(CONFIG_SND_DMA_SGBUF) += sgbuf.o
 snd-pcm-$(CONFIG_SND_PCM_ELD) += pcm_drm_eld.o
 snd-pcm-$(CONFIG_SND_PCM_IEC958) += pcm_iec958.o
 
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 99cd0f67daa1..ea778f868cf3 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -560,50 +560,6 @@ static const struct snd_malloc_ops snd_dma_noncontig_ops = {
 	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
 };
 
-/* x86-specific SG-buffer with WC pages */
-#ifdef CONFIG_SND_DMA_SGBUF
-#define vmalloc_to_virt(v) (unsigned long)page_to_virt(vmalloc_to_page(v))
-
-static void *snd_dma_sg_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
-{
-	void *p = snd_dma_noncontig_alloc(dmab, size);
-	size_t ofs;
-
-	if (!p)
-		return NULL;
-	for (ofs = 0; ofs < size; ofs += PAGE_SIZE)
-		set_memory_uc(vmalloc_to_virt(p + ofs), 1);
-	return p;
-}
-
-static void snd_dma_sg_wc_free(struct snd_dma_buffer *dmab)
-{
-	size_t ofs;
-
-	for (ofs = 0; ofs < dmab->bytes; ofs += PAGE_SIZE)
-		set_memory_wb(vmalloc_to_virt(dmab->area + ofs), 1);
-	snd_dma_noncontig_free(dmab);
-}
-
-static int snd_dma_sg_wc_mmap(struct snd_dma_buffer *dmab,
-			      struct vm_area_struct *area)
-{
-	area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
-	/* FIXME: dma_mmap_noncontiguous() works? */
-	return -ENOENT; /* continue with the default mmap handler */
-}
-
-const struct snd_malloc_ops snd_dma_sg_wc_ops = {
-	.alloc = snd_dma_sg_wc_alloc,
-	.free = snd_dma_sg_wc_free,
-	.mmap = snd_dma_sg_wc_mmap,
-	.sync = snd_dma_noncontig_sync,
-	.get_addr = snd_dma_vmalloc_get_addr,
-	.get_page = snd_dma_vmalloc_get_page,
-	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
-};
-#endif /* CONFIG_SND_DMA_SGBUF */
-
 /*
  * Non-coherent pages allocator
  */
@@ -663,13 +619,14 @@ static const struct snd_malloc_ops *dma_ops[] = {
 	[SNDRV_DMA_TYPE_DEV_WC] = &snd_dma_wc_ops,
 	[SNDRV_DMA_TYPE_NONCONTIG] = &snd_dma_noncontig_ops,
 	[SNDRV_DMA_TYPE_NONCOHERENT] = &snd_dma_noncoherent_ops,
-#ifdef CONFIG_SND_DMA_SGBUF
-	[SNDRV_DMA_TYPE_DEV_WC_SG] = &snd_dma_sg_wc_ops,
-#endif
 #ifdef CONFIG_GENERIC_ALLOCATOR
 	[SNDRV_DMA_TYPE_DEV_IRAM] = &snd_dma_iram_ops,
 #endif /* CONFIG_GENERIC_ALLOCATOR */
 #endif /* CONFIG_HAS_DMA */
+#ifdef CONFIG_SND_DMA_SGBUF
+	[SNDRV_DMA_TYPE_DEV_SG] = &snd_dma_sg_ops,
+	[SNDRV_DMA_TYPE_DEV_WC_SG] = &snd_dma_sg_ops,
+#endif
 };
 
 static const struct snd_malloc_ops *snd_dma_get_ops(struct snd_dma_buffer *dmab)
diff --git a/sound/core/sgbuf.c b/sound/core/sgbuf.c
new file mode 100644
index 000000000000..8352a5cdb19f
--- /dev/null
+++ b/sound/core/sgbuf.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Scatter-Gather buffer
+ *
+ *  Copyright (c) by Takashi Iwai <tiwai@suse.de>
+ */
+
+#include <linux/slab.h>
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
+#include <linux/export.h>
+#include <sound/memalloc.h>
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
+
+/* table entries are align to 32 */
+#define SGBUF_TBL_ALIGN		32
+#define sgbuf_align_table(tbl)	ALIGN((tbl), SGBUF_TBL_ALIGN)
+
+static void snd_dma_sg_free(struct snd_dma_buffer *dmab)
+{
+	struct snd_sg_buf *sgbuf = dmab->private_data;
+	struct snd_dma_buffer tmpb;
+	int i;
+
+	if (!sgbuf)
+		return;
+
+	vunmap(dmab->area);
+	dmab->area = NULL;
+
+	tmpb.dev.type = SNDRV_DMA_TYPE_DEV;
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
+		tmpb.dev.type = SNDRV_DMA_TYPE_DEV_WC;
+	tmpb.dev.dev = sgbuf->dev;
+	for (i = 0; i < sgbuf->pages; i++) {
+		if (!(sgbuf->table[i].addr & ~PAGE_MASK))
+			continue; /* continuous pages */
+		tmpb.area = sgbuf->table[i].buf;
+		tmpb.addr = sgbuf->table[i].addr & PAGE_MASK;
+		tmpb.bytes = (sgbuf->table[i].addr & ~PAGE_MASK) << PAGE_SHIFT;
+		snd_dma_free_pages(&tmpb);
+	}
+
+	kfree(sgbuf->table);
+	kfree(sgbuf->page_table);
+	kfree(sgbuf);
+	dmab->private_data = NULL;
+}
+
+#define MAX_ALLOC_PAGES		32
+
+static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
+{
+	struct snd_sg_buf *sgbuf;
+	unsigned int i, pages, chunk, maxpages;
+	struct snd_dma_buffer tmpb;
+	struct snd_sg_page *table;
+	struct page **pgtable;
+	int type = SNDRV_DMA_TYPE_DEV;
+	pgprot_t prot = PAGE_KERNEL;
+	void *area;
+
+	dmab->private_data = sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
+	if (!sgbuf)
+		return NULL;
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG) {
+		type = SNDRV_DMA_TYPE_DEV_WC;
+#ifdef pgprot_noncached
+		prot = pgprot_noncached(PAGE_KERNEL);
+#endif
+	}
+	sgbuf->dev = dmab->dev.dev;
+	pages = snd_sgbuf_aligned_pages(size);
+	sgbuf->tblsize = sgbuf_align_table(pages);
+	table = kcalloc(sgbuf->tblsize, sizeof(*table), GFP_KERNEL);
+	if (!table)
+		goto _failed;
+	sgbuf->table = table;
+	pgtable = kcalloc(sgbuf->tblsize, sizeof(*pgtable), GFP_KERNEL);
+	if (!pgtable)
+		goto _failed;
+	sgbuf->page_table = pgtable;
+
+	/* allocate pages */
+	maxpages = MAX_ALLOC_PAGES;
+	while (pages > 0) {
+		chunk = pages;
+		/* don't be too eager to take a huge chunk */
+		if (chunk > maxpages)
+			chunk = maxpages;
+		chunk <<= PAGE_SHIFT;
+		if (snd_dma_alloc_pages_fallback(type, dmab->dev.dev,
+						 chunk, &tmpb) < 0) {
+			if (!sgbuf->pages)
+				goto _failed;
+			size = sgbuf->pages * PAGE_SIZE;
+			break;
+		}
+		chunk = tmpb.bytes >> PAGE_SHIFT;
+		for (i = 0; i < chunk; i++) {
+			table->buf = tmpb.area;
+			table->addr = tmpb.addr;
+			if (!i)
+				table->addr |= chunk; /* mark head */
+			table++;
+			*pgtable++ = virt_to_page(tmpb.area);
+			tmpb.area += PAGE_SIZE;
+			tmpb.addr += PAGE_SIZE;
+		}
+		sgbuf->pages += chunk;
+		pages -= chunk;
+		if (chunk < maxpages)
+			maxpages = chunk;
+	}
+
+	sgbuf->size = size;
+	area = vmap(sgbuf->page_table, sgbuf->pages, VM_MAP, prot);
+	if (!area)
+		goto _failed;
+	return area;
+
+ _failed:
+	snd_dma_sg_free(dmab); /* free the table */
+	return NULL;
+}
+
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
+{
+	struct snd_sg_buf *sg = dmab->private_data;
+	unsigned int start, end, pg;
+
+	start = ofs >> PAGE_SHIFT;
+	end = (ofs + size - 1) >> PAGE_SHIFT;
+	/* check page continuity */
+	pg = sg->table[start].addr >> PAGE_SHIFT;
+	for (;;) {
+		start++;
+		if (start > end)
+			break;
+		pg++;
+		if ((sg->table[start].addr >> PAGE_SHIFT) != pg)
+			return (start << PAGE_SHIFT) - ofs;
+	}
+	/* ok, all on continuous pages */
+	return size;
+}
+
+static int snd_dma_sg_mmap(struct snd_dma_buffer *dmab,
+			   struct vm_area_struct *area)
+{
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
+		area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
+	return -ENOENT; /* continue with the default mmap handler */
+}
+
+const struct snd_malloc_ops snd_dma_sg_ops = {
+	.alloc = snd_dma_sg_alloc,
+	.free = snd_dma_sg_free,
+	.get_addr = snd_dma_sg_get_addr,
+	.get_page = snd_dma_sg_get_page,
+	.get_chunk_size = snd_dma_sg_get_chunk_size,
+	.mmap = snd_dma_sg_mmap,
+};
-- 
2.26.2

