Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F7249644
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 09:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F32D17FB;
	Wed, 19 Aug 2020 09:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F32D17FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597820689;
	bh=/nlQCFVGlWUNRxeQUDE8oOJdSyeiQ8oFBHa6nq4I05c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gB0298S2ri2k1DALvs0MDEaj+Arjn3qsBmJfFSSErkuZ4Lb9heuAupbGjxtuGmxPJ
	 Z2r3I/3h8/VvzF4Gn5fOb4KLBSgq3vaBCTgKKrzNZgAeWqWIAKA6xxmVUzDm+hJbiC
	 aDD2EAuXM0dU/hra5bjJQ69sYT3uAraQgePpCF5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D1F1F80344;
	Wed, 19 Aug 2020 08:57:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C412F8033D; Wed, 19 Aug 2020 08:57:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C94BF80333
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 08:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C94BF80333
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="B+Kbvqdu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=t/kUI/553mQLkPn2YstRQ1uK7QcbAe6EXdXOlcFiX/o=; b=B+Kbvqduoiia1ONSXw50+AAvII
 SDCx6Q5i1wD1ezj1lsE/JQF3YbqSMgFxv6KOUYJxjYqh+96u7plrV+/YdrNpz8WDFhQW1S4H5Srxd
 /svckscBzNBWdiFRGXc2AbTzAzlrdpesdCvrY46aj8wx3UqzriA+qG5PDFJHIufcy2Szc07uAzFjB
 A9bjJtEhAaOU0mBzU+YkTgw4yRv/Y0j0IVpmaClidPQq8MFJqjPcXNDdKkAEO/BSDZFQ9pgQ7EfIo
 NG5HP1xs9rulYgK4ERUivl4xbpNxfSmTYqP8Uxwxc0Fm5HhzEwUo1cHA/Is6oiJmP0q5bUvgMU50R
 pqfWn1Xg==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I16-0008NH-FO; Wed, 19 Aug 2020 06:56:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Pawel Osciak <pawel@osciak.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 08/28] MIPS: make dma_sync_*_for_cpu a little less overzealous
Date: Wed, 19 Aug 2020 08:55:35 +0200
Message-Id: <20200819065555.1802761-9-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819065555.1802761-1-hch@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Tom Lendacky <thomas.lendacky@amd.com>, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

When transferring DMA ownership back to the CPU there should never
be any writeback from the cache, as the buffer was owned by the
device until now.  Instead it should just be invalidated for the
mapping directions where the device could have written data.
Note that the changes rely on the fact that kmap_atomic is stubbed
out for the !HIGHMEM case to simplify the code a bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/mm/dma-noncoherent.c | 44 +++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index 563c2c0d0c8193..97a14adbafc99c 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -55,22 +55,34 @@ void *arch_dma_set_uncached(void *addr, size_t size)
 	return (void *)(__pa(addr) + UNCAC_BASE);
 }
 
-static inline void dma_sync_virt(void *addr, size_t size,
+static inline void dma_sync_virt_for_device(void *addr, size_t size,
 		enum dma_data_direction dir)
 {
 	switch (dir) {
 	case DMA_TO_DEVICE:
 		dma_cache_wback((unsigned long)addr, size);
 		break;
-
 	case DMA_FROM_DEVICE:
 		dma_cache_inv((unsigned long)addr, size);
 		break;
-
 	case DMA_BIDIRECTIONAL:
 		dma_cache_wback_inv((unsigned long)addr, size);
 		break;
+	default:
+		BUG();
+	}
+}
 
+static inline void dma_sync_virt_for_cpu(void *addr, size_t size,
+		enum dma_data_direction dir)
+{
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		break;
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		dma_cache_inv((unsigned long)addr, size);
+		break;
 	default:
 		BUG();
 	}
@@ -82,7 +94,7 @@ static inline void dma_sync_virt(void *addr, size_t size,
  * configured then the bulk of this loop gets optimized out.
  */
 static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+		enum dma_data_direction dir, bool for_device)
 {
 	struct page *page = pfn_to_page(paddr >> PAGE_SHIFT);
 	unsigned long offset = paddr & ~PAGE_MASK;
@@ -90,18 +102,20 @@ static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
 
 	do {
 		size_t len = left;
+		void *addr;
 
 		if (PageHighMem(page)) {
-			void *addr;
-
 			if (offset + len > PAGE_SIZE)
 				len = PAGE_SIZE - offset;
+		}
+
+		addr = kmap_atomic(page);
+		if (for_device)
+			dma_sync_virt_for_device(addr + offset, len, dir);
+		else
+			dma_sync_virt_for_cpu(addr + offset, len, dir);
+		kunmap_atomic(addr);
 
-			addr = kmap_atomic(page);
-			dma_sync_virt(addr + offset, len, dir);
-			kunmap_atomic(addr);
-		} else
-			dma_sync_virt(page_address(page) + offset, size, dir);
 		offset = 0;
 		page++;
 		left -= len;
@@ -111,7 +125,7 @@ static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	dma_sync_phys(paddr, size, dir);
+	dma_sync_phys(paddr, size, dir, true);
 }
 
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
@@ -119,16 +133,14 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
 	if (cpu_needs_post_dma_flush())
-		dma_sync_phys(paddr, size, dir);
+		dma_sync_phys(paddr, size, dir, false);
 }
 #endif
 
 void arch_dma_cache_sync(struct device *dev, void *vaddr, size_t size,
 		enum dma_data_direction direction)
 {
-	BUG_ON(direction == DMA_NONE);
-
-	dma_sync_virt(vaddr, size, direction);
+	dma_sync_virt_for_device(vaddr, size, direction);
 }
 
 #ifdef CONFIG_DMA_PERDEV_COHERENT
-- 
2.28.0

