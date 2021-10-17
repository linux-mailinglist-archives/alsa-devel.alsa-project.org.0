Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE66430719
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Oct 2021 09:50:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CB8C1833;
	Sun, 17 Oct 2021 09:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CB8C1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634457033;
	bh=vV4Y+QlMR9kbqIOcVo7UpX/s5wgD5gWnM73gAEkEWXo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c0Q+Jj9s9lPSxgUU9aP/tQHKcNvtAvKtOq45nsFpVgGYXbde2Ym5vpZMqJZPUrTs1
	 PU/2kgvCtm+Y3QmkrcjFUrrjARHZOBtr1Vby0YrG/WsuLiqTSptvyGT21i1P8OojbM
	 3LNbP5Eq7rTMqFiI9IGPtMn1hF/oTAxqa1JWPCKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C4DBF80256;
	Sun, 17 Oct 2021 09:49:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8283BF8026C; Sun, 17 Oct 2021 09:49:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CDBCF801DB
 for <alsa-devel@alsa-project.org>; Sun, 17 Oct 2021 09:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CDBCF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="LUaUKoga"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="SPZK2v5G"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id C143E219A2
 for <alsa-devel@alsa-project.org>; Sun, 17 Oct 2021 07:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634456940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PcWCAiGV9yXqtZWEmN1Cj6wawHuz2eeYptUMNNe7UXw=;
 b=LUaUKogaYld9yJVhB11wYT1pcvHfBovb632doHZJHUTZhyZi9j9H8Q7VO7u0Z1mdGWHr51
 7fDKehW4gqv+ov60FjAeobvqrX1x27k1lRxpnvsRVHyidPYArECRUiwhK0H3S/RSCEw+hN
 lTFheFcmCDRvQIVxAIVsT3YT1SvO0i4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634456940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PcWCAiGV9yXqtZWEmN1Cj6wawHuz2eeYptUMNNe7UXw=;
 b=SPZK2v5Gn2Pv4yu5XE8hajDaoLc/b68GfTciy+PX0TFNQyX5tIxR6LEmN/oKpGo0Zh44FY
 I5DBrcPgI4+xviCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B0055A3B83;
 Sun, 17 Oct 2021 07:49:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/3] ALSA: memalloc: Convert x86 SG-buffer handling with
 non-contiguous type
Date: Sun, 17 Oct 2021 09:48:59 +0200
Message-Id: <20211017074859.24112-4-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211017074859.24112-1-tiwai@suse.de>
References: <20211017074859.24112-1-tiwai@suse.de>
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

We've had an x86-specific SG-buffer handling code, but now it can be
merged gracefully with the standard non-contiguous DMA pages.

After the migration, SNDRV_DMA_TYPE_DMA_SG becomes identical with
SNDRV_DMA_TYPE_NONCONTIG on x86, while others still fall back to
SNDRV_DMA_TYPE_DEV.

The remaining problem is about the SG-buffer with WC pages: the DMA
core stuff on x86 doesn't treat it well, so we still need some special
handling to manipulate the page attribute manually.  The mmap handler
for SNDRV_DMA_TYPE_DEV_SG_WC still returns -ENOENT intentionally for
the fallback to the default handler.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h |  14 +--
 sound/core/Makefile      |   1 -
 sound/core/memalloc.c    |  51 +++++++++-
 sound/core/sgbuf.c       | 201 ---------------------------------------
 4 files changed, 54 insertions(+), 213 deletions(-)
 delete mode 100644 sound/core/sgbuf.c

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index 0bdaa6753282..df615052dad4 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -36,13 +36,6 @@ struct snd_dma_device {
 #define SNDRV_DMA_TYPE_CONTINUOUS	1	/* continuous no-DMA memory */
 #define SNDRV_DMA_TYPE_DEV		2	/* generic device continuous */
 #define SNDRV_DMA_TYPE_DEV_WC		5	/* continuous write-combined */
-#ifdef CONFIG_SND_DMA_SGBUF
-#define SNDRV_DMA_TYPE_DEV_SG		3	/* generic device SG-buffer */
-#define SNDRV_DMA_TYPE_DEV_WC_SG	6	/* SG write-combined */
-#else
-#define SNDRV_DMA_TYPE_DEV_SG	SNDRV_DMA_TYPE_DEV /* no SG-buf support */
-#define SNDRV_DMA_TYPE_DEV_WC_SG	SNDRV_DMA_TYPE_DEV_WC
-#endif
 #ifdef CONFIG_GENERIC_ALLOCATOR
 #define SNDRV_DMA_TYPE_DEV_IRAM		4	/* generic device iram-buffer */
 #else
@@ -51,6 +44,13 @@ struct snd_dma_device {
 #define SNDRV_DMA_TYPE_VMALLOC		7	/* vmalloc'ed buffer */
 #define SNDRV_DMA_TYPE_NONCONTIG	8	/* non-coherent SG buffer */
 #define SNDRV_DMA_TYPE_NONCOHERENT	9	/* non-coherent buffer */
+#ifdef CONFIG_SND_DMA_SGBUF
+#define SNDRV_DMA_TYPE_DEV_SG		SNDRV_DMA_TYPE_NONCONTIG
+#define SNDRV_DMA_TYPE_DEV_WC_SG	6	/* SG write-combined */
+#else
+#define SNDRV_DMA_TYPE_DEV_SG	SNDRV_DMA_TYPE_DEV /* no SG-buf support */
+#define SNDRV_DMA_TYPE_DEV_WC_SG	SNDRV_DMA_TYPE_DEV_WC
+#endif
 
 /*
  * info for buffer allocation
diff --git a/sound/core/Makefile b/sound/core/Makefile
index d774792850f3..2762f03d9b7b 100644
--- a/sound/core/Makefile
+++ b/sound/core/Makefile
@@ -17,7 +17,6 @@ snd-$(CONFIG_SND_JACK)	  += ctljack.o jack.o
 snd-pcm-y := pcm.o pcm_native.o pcm_lib.o pcm_misc.o \
 		pcm_memory.o memalloc.o
 snd-pcm-$(CONFIG_SND_PCM_TIMER) += pcm_timer.o
-snd-pcm-$(CONFIG_SND_DMA_SGBUF) += sgbuf.o
 snd-pcm-$(CONFIG_SND_PCM_ELD) += pcm_drm_eld.o
 snd-pcm-$(CONFIG_SND_PCM_IEC958) += pcm_iec958.o
 
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 99681e651223..acdebecf1a2e 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -560,6 +560,50 @@ static const struct snd_malloc_ops snd_dma_noncontig_ops = {
 	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
 };
 
+/* x86-specific SG-buffer with WC pages */
+#ifdef CONFIG_SND_DMA_SGBUF
+#define vmalloc_to_virt(v) (unsigned long)page_to_virt(vmalloc_to_page(v))
+
+static void *snd_dma_sg_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
+{
+	void *p = snd_dma_noncontig_alloc(dmab, size);
+	size_t ofs;
+
+	if (!p)
+		return NULL;
+	for (ofs = 0; ofs < size; ofs += PAGE_SIZE)
+		set_memory_uc(vmalloc_to_virt(p + ofs), 1);
+	return p;
+}
+
+static void snd_dma_sg_wc_free(struct snd_dma_buffer *dmab)
+{
+	size_t ofs;
+
+	for (ofs = 0; ofs < dmab->bytes; ofs += PAGE_SIZE)
+		set_memory_wb(vmalloc_to_virt(dmab->area + ofs), 1);
+	snd_dma_noncontig_free(dmab);
+}
+
+static int snd_dma_sg_wc_mmap(struct snd_dma_buffer *dmab,
+			      struct vm_area_struct *area)
+{
+	area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
+	/* FIXME: dma_mmap_noncontiguous() works? */
+	return -ENOENT; /* continue with the default mmap handler */
+}
+
+const struct snd_malloc_ops snd_dma_sg_wc_ops = {
+	.alloc = snd_dma_sg_wc_alloc,
+	.free = snd_dma_sg_wc_free,
+	.mmap = snd_dma_sg_wc_mmap,
+	.sync = snd_dma_noncontig_sync,
+	.get_addr = snd_dma_vmalloc_get_addr,
+	.get_page = snd_dma_vmalloc_get_page,
+	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
+};
+#endif /* CONFIG_SND_DMA_SGBUF */
+
 /*
  * Non-coherent pages allocator
  */
@@ -619,14 +663,13 @@ static const struct snd_malloc_ops *dma_ops[] = {
 	[SNDRV_DMA_TYPE_DEV_WC] = &snd_dma_wc_ops,
 	[SNDRV_DMA_TYPE_NONCONTIG] = &snd_dma_noncontig_ops,
 	[SNDRV_DMA_TYPE_NONCOHERENT] = &snd_dma_noncoherent_ops,
+#ifdef CONFIG_SND_DMA_SGBUF
+	[SNDRV_DMA_TYPE_DEV_WC_SG] = &snd_dma_sg_wc_ops,
+#endif
 #ifdef CONFIG_GENERIC_ALLOCATOR
 	[SNDRV_DMA_TYPE_DEV_IRAM] = &snd_dma_iram_ops,
 #endif /* CONFIG_GENERIC_ALLOCATOR */
 #endif /* CONFIG_HAS_DMA */
-#ifdef CONFIG_SND_DMA_SGBUF
-	[SNDRV_DMA_TYPE_DEV_SG] = &snd_dma_sg_ops,
-	[SNDRV_DMA_TYPE_DEV_WC_SG] = &snd_dma_sg_ops,
-#endif
 };
 
 static const struct snd_malloc_ops *snd_dma_get_ops(struct snd_dma_buffer *dmab)
diff --git a/sound/core/sgbuf.c b/sound/core/sgbuf.c
deleted file mode 100644
index 8352a5cdb19f..000000000000
--- a/sound/core/sgbuf.c
+++ /dev/null
@@ -1,201 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Scatter-Gather buffer
- *
- *  Copyright (c) by Takashi Iwai <tiwai@suse.de>
- */
-
-#include <linux/slab.h>
-#include <linux/mm.h>
-#include <linux/vmalloc.h>
-#include <linux/export.h>
-#include <sound/memalloc.h>
-#include "memalloc_local.h"
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
-/* table entries are align to 32 */
-#define SGBUF_TBL_ALIGN		32
-#define sgbuf_align_table(tbl)	ALIGN((tbl), SGBUF_TBL_ALIGN)
-
-static void snd_dma_sg_free(struct snd_dma_buffer *dmab)
-{
-	struct snd_sg_buf *sgbuf = dmab->private_data;
-	struct snd_dma_buffer tmpb;
-	int i;
-
-	if (!sgbuf)
-		return;
-
-	vunmap(dmab->area);
-	dmab->area = NULL;
-
-	tmpb.dev.type = SNDRV_DMA_TYPE_DEV;
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
-		tmpb.dev.type = SNDRV_DMA_TYPE_DEV_WC;
-	tmpb.dev.dev = sgbuf->dev;
-	for (i = 0; i < sgbuf->pages; i++) {
-		if (!(sgbuf->table[i].addr & ~PAGE_MASK))
-			continue; /* continuous pages */
-		tmpb.area = sgbuf->table[i].buf;
-		tmpb.addr = sgbuf->table[i].addr & PAGE_MASK;
-		tmpb.bytes = (sgbuf->table[i].addr & ~PAGE_MASK) << PAGE_SHIFT;
-		snd_dma_free_pages(&tmpb);
-	}
-
-	kfree(sgbuf->table);
-	kfree(sgbuf->page_table);
-	kfree(sgbuf);
-	dmab->private_data = NULL;
-}
-
-#define MAX_ALLOC_PAGES		32
-
-static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
-{
-	struct snd_sg_buf *sgbuf;
-	unsigned int i, pages, chunk, maxpages;
-	struct snd_dma_buffer tmpb;
-	struct snd_sg_page *table;
-	struct page **pgtable;
-	int type = SNDRV_DMA_TYPE_DEV;
-	pgprot_t prot = PAGE_KERNEL;
-	void *area;
-
-	dmab->private_data = sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
-	if (!sgbuf)
-		return NULL;
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG) {
-		type = SNDRV_DMA_TYPE_DEV_WC;
-#ifdef pgprot_noncached
-		prot = pgprot_noncached(PAGE_KERNEL);
-#endif
-	}
-	sgbuf->dev = dmab->dev.dev;
-	pages = snd_sgbuf_aligned_pages(size);
-	sgbuf->tblsize = sgbuf_align_table(pages);
-	table = kcalloc(sgbuf->tblsize, sizeof(*table), GFP_KERNEL);
-	if (!table)
-		goto _failed;
-	sgbuf->table = table;
-	pgtable = kcalloc(sgbuf->tblsize, sizeof(*pgtable), GFP_KERNEL);
-	if (!pgtable)
-		goto _failed;
-	sgbuf->page_table = pgtable;
-
-	/* allocate pages */
-	maxpages = MAX_ALLOC_PAGES;
-	while (pages > 0) {
-		chunk = pages;
-		/* don't be too eager to take a huge chunk */
-		if (chunk > maxpages)
-			chunk = maxpages;
-		chunk <<= PAGE_SHIFT;
-		if (snd_dma_alloc_pages_fallback(type, dmab->dev.dev,
-						 chunk, &tmpb) < 0) {
-			if (!sgbuf->pages)
-				goto _failed;
-			size = sgbuf->pages * PAGE_SIZE;
-			break;
-		}
-		chunk = tmpb.bytes >> PAGE_SHIFT;
-		for (i = 0; i < chunk; i++) {
-			table->buf = tmpb.area;
-			table->addr = tmpb.addr;
-			if (!i)
-				table->addr |= chunk; /* mark head */
-			table++;
-			*pgtable++ = virt_to_page(tmpb.area);
-			tmpb.area += PAGE_SIZE;
-			tmpb.addr += PAGE_SIZE;
-		}
-		sgbuf->pages += chunk;
-		pages -= chunk;
-		if (chunk < maxpages)
-			maxpages = chunk;
-	}
-
-	sgbuf->size = size;
-	area = vmap(sgbuf->page_table, sgbuf->pages, VM_MAP, prot);
-	if (!area)
-		goto _failed;
-	return area;
-
- _failed:
-	snd_dma_sg_free(dmab); /* free the table */
-	return NULL;
-}
-
-static dma_addr_t snd_dma_sg_get_addr(struct snd_dma_buffer *dmab,
-				      size_t offset)
-{
-	struct snd_sg_buf *sgbuf = dmab->private_data;
-	dma_addr_t addr;
-
-	addr = sgbuf->table[offset >> PAGE_SHIFT].addr;
-	addr &= ~((dma_addr_t)PAGE_SIZE - 1);
-	return addr + offset % PAGE_SIZE;
-}
-
-static struct page *snd_dma_sg_get_page(struct snd_dma_buffer *dmab,
-					size_t offset)
-{
-	struct snd_sg_buf *sgbuf = dmab->private_data;
-	unsigned int idx = offset >> PAGE_SHIFT;
-
-	if (idx >= (unsigned int)sgbuf->pages)
-		return NULL;
-	return sgbuf->page_table[idx];
-}
-
-static unsigned int snd_dma_sg_get_chunk_size(struct snd_dma_buffer *dmab,
-					      unsigned int ofs,
-					      unsigned int size)
-{
-	struct snd_sg_buf *sg = dmab->private_data;
-	unsigned int start, end, pg;
-
-	start = ofs >> PAGE_SHIFT;
-	end = (ofs + size - 1) >> PAGE_SHIFT;
-	/* check page continuity */
-	pg = sg->table[start].addr >> PAGE_SHIFT;
-	for (;;) {
-		start++;
-		if (start > end)
-			break;
-		pg++;
-		if ((sg->table[start].addr >> PAGE_SHIFT) != pg)
-			return (start << PAGE_SHIFT) - ofs;
-	}
-	/* ok, all on continuous pages */
-	return size;
-}
-
-static int snd_dma_sg_mmap(struct snd_dma_buffer *dmab,
-			   struct vm_area_struct *area)
-{
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
-		area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
-	return -ENOENT; /* continue with the default mmap handler */
-}
-
-const struct snd_malloc_ops snd_dma_sg_ops = {
-	.alloc = snd_dma_sg_alloc,
-	.free = snd_dma_sg_free,
-	.get_addr = snd_dma_sg_get_addr,
-	.get_page = snd_dma_sg_get_page,
-	.get_chunk_size = snd_dma_sg_get_chunk_size,
-	.mmap = snd_dma_sg_mmap,
-};
-- 
2.26.2

