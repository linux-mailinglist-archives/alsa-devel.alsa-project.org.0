Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A163A1AEA
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 18:29:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E874B16F9;
	Wed,  9 Jun 2021 18:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E874B16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623256146;
	bh=Olv/z5Oxfk0eGa5Pwo/KcRdttRXsqUuG7wlU1SY20Jg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SbsLifY8cNzY9Ha/ybow9kTIrJkrGVIWM3OPKkSOqBd7s//KcfDeJmk3V7n7AQ2Au
	 KVanAyd5PfiL/LrRny+Rr7j55DtwAK7a3YestGYgkY5SnuZcicPugfg/xQIQUPgVhf
	 yvMs3SY/yyxxep2c7VGhUIqFo6UTQKBDFJE5vYL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9F3FF804D9;
	Wed,  9 Jun 2021 18:26:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA80AF804CB; Wed,  9 Jun 2021 18:26:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECB9DF802A0
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 18:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECB9DF802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="rLFF2unG"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ESa4p9KG"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 420911FD62
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 16:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623255954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aLbPQt5/Zd36KlLJv5Gnrj0eT+L4+eKjLKd3Dz/aqh8=;
 b=rLFF2unGhJ72Bhg5cSGOPAbd7onm41PUbWCMNbADZ1TTjZwl+Ehf47dI5ZYZ0v8hOO2qgp
 Olsbj1I8Xs2SSWlH6RbKpzQPICbLXw6cKbUNk8cYBsFAc2XxovFf2QXWNm3M6GVUCMsV7p
 /SStUYVcMx4NH/SSaKrdE6VPofLRoHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623255954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aLbPQt5/Zd36KlLJv5Gnrj0eT+L4+eKjLKd3Dz/aqh8=;
 b=ESa4p9KGLyFy58xQipdBS8N7VStOiCKW9Pkt3EwXOSgOl6W0pbPJRiFJBQ1okKyzBKO+xH
 w9OHbwMbG0UWx3AA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 3D11DA3B8A;
 Wed,  9 Jun 2021 16:25:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ALSA: trident: Drop shadow TLB pointer table
Date: Wed,  9 Jun 2021 18:25:47 +0200
Message-Id: <20210609162551.7842-2-tiwai@suse.de>
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

The shadow TLB pointer table is allocated and set up, but never really
used any longer by the driver.  Let's drop it.

Since this is the only user of snd_pcm_sgbuf_get_ptr(), we can clean
up the API after this change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/trident/trident.h        |  1 -
 sound/pci/trident/trident_main.c   | 11 +------
 sound/pci/trident/trident_memory.c | 53 +++++++++---------------------
 3 files changed, 17 insertions(+), 48 deletions(-)

diff --git a/sound/pci/trident/trident.h b/sound/pci/trident/trident.h
index c7567edbe4c4..c579a44bb9ae 100644
--- a/sound/pci/trident/trident.h
+++ b/sound/pci/trident/trident.h
@@ -251,7 +251,6 @@ struct snd_trident_memblk_arg {
 struct snd_trident_tlb {
 	__le32 *entries;		/* 16k-aligned TLB table */
 	dma_addr_t entries_dmaaddr;	/* 16k-aligned PCI address to TLB table */
-	unsigned long * shadow_entries;	/* shadow entries with virtual addresses */
 	struct snd_dma_buffer buffer;
 	struct snd_util_memhdr * memhdr;	/* page allocation list */
 	struct snd_dma_buffer silent_page;
diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index 281ea7143b1c..cfbca3bd60ed 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -3331,12 +3331,6 @@ static int snd_trident_tlb_alloc(struct snd_trident *trident)
 	}
 	trident->tlb.entries = (__le32 *)ALIGN((unsigned long)trident->tlb.buffer.area, SNDRV_TRIDENT_MAX_PAGES * 4);
 	trident->tlb.entries_dmaaddr = ALIGN(trident->tlb.buffer.addr, SNDRV_TRIDENT_MAX_PAGES * 4);
-	/* allocate shadow TLB page table (virtual addresses) */
-	trident->tlb.shadow_entries =
-		vmalloc(array_size(SNDRV_TRIDENT_MAX_PAGES,
-				   sizeof(unsigned long)));
-	if (!trident->tlb.shadow_entries)
-		return -ENOMEM;
 
 	/* allocate and setup silent page and initialise TLB entries */
 	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &trident->pci->dev,
@@ -3345,10 +3339,8 @@ static int snd_trident_tlb_alloc(struct snd_trident *trident)
 		return -ENOMEM;
 	}
 	memset(trident->tlb.silent_page.area, 0, SNDRV_TRIDENT_PAGE_SIZE);
-	for (i = 0; i < SNDRV_TRIDENT_MAX_PAGES; i++) {
+	for (i = 0; i < SNDRV_TRIDENT_MAX_PAGES; i++)
 		trident->tlb.entries[i] = cpu_to_le32(trident->tlb.silent_page.addr & ~(SNDRV_TRIDENT_PAGE_SIZE-1));
-		trident->tlb.shadow_entries[i] = (unsigned long)trident->tlb.silent_page.area;
-	}
 
 	/* use emu memory block manager code to manage tlb page allocation */
 	trident->tlb.memhdr = snd_util_memhdr_new(SNDRV_TRIDENT_PAGE_SIZE * SNDRV_TRIDENT_MAX_PAGES);
@@ -3665,7 +3657,6 @@ static int snd_trident_free(struct snd_trident *trident)
 		snd_util_memhdr_free(trident->tlb.memhdr);
 		if (trident->tlb.silent_page.area)
 			snd_dma_free_pages(&trident->tlb.silent_page);
-		vfree(trident->tlb.shadow_entries);
 		snd_dma_free_pages(&trident->tlb.buffer);
 	}
 	pci_release_regions(trident->pci);
diff --git a/sound/pci/trident/trident_memory.c b/sound/pci/trident/trident_memory.c
index bb24dbf0530d..f831ec02702f 100644
--- a/sound/pci/trident/trident_memory.c
+++ b/sound/pci/trident/trident_memory.c
@@ -19,11 +19,8 @@
 /* page arguments of these two macros are Trident page (4096 bytes), not like
  * aligned pages in others
  */
-#define __set_tlb_bus(trident,page,ptr,addr) \
-	do { (trident)->tlb.entries[page] = cpu_to_le32((addr) & ~(SNDRV_TRIDENT_PAGE_SIZE-1)); \
-	     (trident)->tlb.shadow_entries[page] = (ptr); } while (0)
-#define __tlb_to_ptr(trident,page) \
-	(void*)((trident)->tlb.shadow_entries[page])
+#define __set_tlb_bus(trident,page,addr) \
+	(trident)->tlb.entries[page] = cpu_to_le32((addr) & ~(SNDRV_TRIDENT_PAGE_SIZE-1))
 #define __tlb_to_addr(trident,page) \
 	(dma_addr_t)le32_to_cpu((trident->tlb.entries[page]) & ~(SNDRV_TRIDENT_PAGE_SIZE - 1))
 
@@ -32,15 +29,13 @@
 #define ALIGN_PAGE_SIZE		PAGE_SIZE	/* minimum page size for allocation */
 #define MAX_ALIGN_PAGES		SNDRV_TRIDENT_MAX_PAGES	/* maxmium aligned pages */
 /* fill TLB entrie(s) corresponding to page with ptr */
-#define set_tlb_bus(trident,page,ptr,addr) __set_tlb_bus(trident,page,ptr,addr)
+#define set_tlb_bus(trident,page,addr) __set_tlb_bus(trident,page,addr)
 /* fill TLB entrie(s) corresponding to page with silence pointer */
-#define set_silent_tlb(trident,page)	__set_tlb_bus(trident, page, (unsigned long)trident->tlb.silent_page.area, trident->tlb.silent_page.addr)
+#define set_silent_tlb(trident,page)	__set_tlb_bus(trident, page, trident->tlb.silent_page.addr)
 /* get aligned page from offset address */
 #define get_aligned_page(offset)	((offset) >> 12)
 /* get offset address from aligned page */
 #define aligned_page_offset(page)	((page) << 12)
-/* get buffer address from aligned page */
-#define page_to_ptr(trident,page)	__tlb_to_ptr(trident, page)
 /* get PCI physical address from aligned page */
 #define page_to_addr(trident,page)	__tlb_to_addr(trident, page)
 
@@ -50,22 +45,21 @@
 #define MAX_ALIGN_PAGES		(SNDRV_TRIDENT_MAX_PAGES / 2)
 #define get_aligned_page(offset)	((offset) >> 13)
 #define aligned_page_offset(page)	((page) << 13)
-#define page_to_ptr(trident,page)	__tlb_to_ptr(trident, (page) << 1)
 #define page_to_addr(trident,page)	__tlb_to_addr(trident, (page) << 1)
 
 /* fill TLB entries -- we need to fill two entries */
 static inline void set_tlb_bus(struct snd_trident *trident, int page,
-			       unsigned long ptr, dma_addr_t addr)
+			       dma_addr_t addr)
 {
 	page <<= 1;
-	__set_tlb_bus(trident, page, ptr, addr);
-	__set_tlb_bus(trident, page+1, ptr + SNDRV_TRIDENT_PAGE_SIZE, addr + SNDRV_TRIDENT_PAGE_SIZE);
+	__set_tlb_bus(trident, page, addr);
+	__set_tlb_bus(trident, page+1, addr + SNDRV_TRIDENT_PAGE_SIZE);
 }
 static inline void set_silent_tlb(struct snd_trident *trident, int page)
 {
 	page <<= 1;
-	__set_tlb_bus(trident, page, (unsigned long)trident->tlb.silent_page.area, trident->tlb.silent_page.addr);
-	__set_tlb_bus(trident, page+1, (unsigned long)trident->tlb.silent_page.area, trident->tlb.silent_page.addr);
+	__set_tlb_bus(trident, page, trident->tlb.silent_page.addr);
+	__set_tlb_bus(trident, page+1, trident->tlb.silent_page.addr);
 }
 
 #else
@@ -80,18 +74,16 @@ static inline void set_silent_tlb(struct snd_trident *trident, int page)
  */
 #define get_aligned_page(offset)	((offset) / ALIGN_PAGE_SIZE)
 #define aligned_page_offset(page)	((page) * ALIGN_PAGE_SIZE)
-#define page_to_ptr(trident,page)	__tlb_to_ptr(trident, (page) * UNIT_PAGES)
 #define page_to_addr(trident,page)	__tlb_to_addr(trident, (page) * UNIT_PAGES)
 
 /* fill TLB entries -- UNIT_PAGES entries must be filled */
 static inline void set_tlb_bus(struct snd_trident *trident, int page,
-			       unsigned long ptr, dma_addr_t addr)
+			       dma_addr_t addr)
 {
 	int i;
 	page *= UNIT_PAGES;
-	for (i = 0; i < UNIT_PAGES; i++, page++) {
-		__set_tlb_bus(trident, page, ptr, addr);
-		ptr += SNDRV_TRIDENT_PAGE_SIZE;
+	for (i = 0; i < UNIT_PAGES; i++, pagetr++) {
+		__set_tlb_bus(trident, page, addr);
 		addr += SNDRV_TRIDENT_PAGE_SIZE;
 	}
 }
@@ -100,20 +92,11 @@ static inline void set_silent_tlb(struct snd_trident *trident, int page)
 	int i;
 	page *= UNIT_PAGES;
 	for (i = 0; i < UNIT_PAGES; i++, page++)
-		__set_tlb_bus(trident, page, (unsigned long)trident->tlb.silent_page.area, trident->tlb.silent_page.addr);
+		__set_tlb_bus(trident, page, trident->tlb.silent_page.addr);
 }
 
 #endif /* PAGE_SIZE */
 
-/* calculate buffer pointer from offset address */
-static inline void *offset_ptr(struct snd_trident *trident, int offset)
-{
-	char *ptr;
-	ptr = page_to_ptr(trident, get_aligned_page(offset));
-	ptr += offset % ALIGN_PAGE_SIZE;
-	return (void*)ptr;
-}
-
 /* first and last (aligned) pages of memory block */
 #define firstpg(blk)	(((struct snd_trident_memblk_arg *)snd_util_memblk_argptr(blk))->first_page)
 #define lastpg(blk)	(((struct snd_trident_memblk_arg *)snd_util_memblk_argptr(blk))->last_page)
@@ -201,14 +184,12 @@ snd_trident_alloc_sg_pages(struct snd_trident *trident,
 	for (page = firstpg(blk); page <= lastpg(blk); page++, idx++) {
 		unsigned long ofs = idx << PAGE_SHIFT;
 		dma_addr_t addr = snd_pcm_sgbuf_get_addr(substream, ofs);
-		unsigned long ptr = (unsigned long)
-			snd_pcm_sgbuf_get_ptr(substream, ofs);
 		if (! is_valid_page(addr)) {
 			__snd_util_mem_free(hdr, blk);
 			mutex_unlock(&hdr->block_mutex);
 			return NULL;
 		}
-		set_tlb_bus(trident, page, ptr, addr);
+		set_tlb_bus(trident, page, addr);
 	}
 	mutex_unlock(&hdr->block_mutex);
 	return blk;
@@ -226,7 +207,6 @@ snd_trident_alloc_cont_pages(struct snd_trident *trident,
 	int page;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	dma_addr_t addr;
-	unsigned long ptr;
 
 	if (snd_BUG_ON(runtime->dma_bytes <= 0 ||
 		       runtime->dma_bytes > SNDRV_TRIDENT_MAX_PAGES *
@@ -245,15 +225,14 @@ snd_trident_alloc_cont_pages(struct snd_trident *trident,
 			   
 	/* set TLB entries */
 	addr = runtime->dma_addr;
-	ptr = (unsigned long)runtime->dma_area;
 	for (page = firstpg(blk); page <= lastpg(blk); page++,
-	     ptr += SNDRV_TRIDENT_PAGE_SIZE, addr += SNDRV_TRIDENT_PAGE_SIZE) {
+	     addr += SNDRV_TRIDENT_PAGE_SIZE) {
 		if (! is_valid_page(addr)) {
 			__snd_util_mem_free(hdr, blk);
 			mutex_unlock(&hdr->block_mutex);
 			return NULL;
 		}
-		set_tlb_bus(trident, page, ptr, addr);
+		set_tlb_bus(trident, page, addr);
 	}
 	mutex_unlock(&hdr->block_mutex);
 	return blk;
-- 
2.26.2

