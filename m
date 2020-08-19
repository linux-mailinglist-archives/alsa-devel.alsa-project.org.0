Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9EA249621
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 09:03:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BB861818;
	Wed, 19 Aug 2020 09:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BB861818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597820616;
	bh=F1YjH3+hAuBIuxFKYfyP+PZcw9QXdKPAG0GUag7NxCE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JdNSZhudQoycKAebyJpffbNJdElnnbP6wqKyfyJsEq+kM2HYgvAgP1/oHx+YFTSyD
	 HB8NJ1iFrlnv+PLQNjKQO8PcU8tAPT2W6AArJOvK3BREC+UpvyOC/KmHXfJKeNs+cz
	 5mZnSRJu4nSFMRNcVqOkCPOy/8Mqew8IS+Ow+cg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6646F80333;
	Wed, 19 Aug 2020 08:57:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5751F80333; Wed, 19 Aug 2020 08:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A29CAF80317
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 08:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A29CAF80317
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="joFN0ww+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ZtUM/olxUf8C2TvkEPmqhqiLEztY8gyw8OoXm4S66J0=; b=joFN0ww+0aa92xQbCzyMJkP7LD
 8JSoseHLlahhfiaA1lVSRSPW99kkw+xo4xdI9KQUb6l8fcvQ1JFGDjrE7lNY43skYEvkO6sJBvNuI
 ovuZ3ghLBiC7cimGa0zz0lEel7wTzq1v5puhSiTWO2cPmzjRRujsGdGv+7If4seWQ/HNzI6MHxhU1
 4byruJvxXeuiKXvhleriuiiuwda79/w7C/U8FbqJUTO3fTp2Ce0hz4Bob299SMDEONrIlqC/49BCx
 +BqS2Tp5+L35IkWLeY8UQ1J6OQLxl09Os7Wuzp80LKtW6Hs8573Udi+/spUOj3c0bLw4Uerhc3GyD
 uPnoXnjw==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I1C-0008OB-DC; Wed, 19 Aug 2020 06:56:19 +0000
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
Subject: [PATCH 11/28] dma-mapping: add (back) arch_dma_mark_clean for ia64
Date: Wed, 19 Aug 2020 08:55:38 +0200
Message-Id: <20200819065555.1802761-12-hch@lst.de>
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

Add back a hook to optimize dcache flushing after reading executable
code using DMA.  This gets ia64 out of the business of pretending to
be dma incoherent just for this optimization.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/ia64/Kconfig               |  3 +--
 arch/ia64/kernel/dma-mapping.c  | 14 +-------------
 arch/ia64/mm/init.c             |  3 +--
 include/linux/dma-direct.h      |  3 +++
 include/linux/dma-noncoherent.h |  8 ++++++++
 kernel/dma/Kconfig              |  6 ++++++
 kernel/dma/direct.c             |  3 +++
 7 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 5b4ec80bf5863a..513ba0c5d33610 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -8,6 +8,7 @@ menu "Processor type and features"
 
 config IA64
 	bool
+	select ARCH_HAS_DMA_MARK_CLEAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ACPI
@@ -32,8 +33,6 @@ config IA64
 	select TTY
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_VIRT_CPU_ACCOUNTING
-	select DMA_NONCOHERENT_MMAP
-	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select VIRT_TO_BUS
 	select GENERIC_IRQ_PROBE
 	select GENERIC_PENDING_IRQ if SMP
diff --git a/arch/ia64/kernel/dma-mapping.c b/arch/ia64/kernel/dma-mapping.c
index 09ef9ce9988d1f..f640ed6fe1d576 100644
--- a/arch/ia64/kernel/dma-mapping.c
+++ b/arch/ia64/kernel/dma-mapping.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/dma-direct.h>
+#include <linux/dma-mapping.h>
 #include <linux/export.h>
 
 /* Set this to 1 if there is a HW IOMMU in the system */
@@ -7,15 +7,3 @@ int iommu_detected __read_mostly;
 
 const struct dma_map_ops *dma_ops;
 EXPORT_SYMBOL(dma_ops);
-
-void *arch_dma_alloc(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
-{
-	return dma_direct_alloc_pages(dev, size, dma_handle, gfp, attrs);
-}
-
-void arch_dma_free(struct device *dev, size_t size, void *cpu_addr,
-		dma_addr_t dma_addr, unsigned long attrs)
-{
-	dma_direct_free_pages(dev, size, cpu_addr, dma_addr, attrs);
-}
diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
index 0b3fb4c7af2920..02e5aa08294ee0 100644
--- a/arch/ia64/mm/init.c
+++ b/arch/ia64/mm/init.c
@@ -73,8 +73,7 @@ __ia64_sync_icache_dcache (pte_t pte)
  * DMA can be marked as "clean" so that lazy_mmu_prot_update() doesn't have to
  * flush them when they get mapped into an executable vm-area.
  */
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+void arch_dma_mark_clean(phys_addr_t paddr, size_t size)
 {
 	unsigned long pfn = PHYS_PFN(paddr);
 
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 5a3ce2a2479437..738485b3578062 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -153,6 +153,9 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 
 	if (unlikely(is_swiotlb_buffer(paddr)))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
+
+	if (dir == DMA_FROM_DEVICE)
+		arch_dma_mark_clean(paddr, size);
 }
 
 static inline dma_addr_t dma_direct_map_page(struct device *dev,
diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoherent.h
index ca09a4e07d2d3d..b9bc6c557ea46f 100644
--- a/include/linux/dma-noncoherent.h
+++ b/include/linux/dma-noncoherent.h
@@ -108,6 +108,14 @@ static inline void arch_dma_prep_coherent(struct page *page, size_t size)
 }
 #endif /* CONFIG_ARCH_HAS_DMA_PREP_COHERENT */
 
+#ifdef CONFIG_ARCH_HAS_DMA_MARK_CLEAN
+void arch_dma_mark_clean(phys_addr_t paddr, size_t size);
+#else
+static inline void arch_dma_mark_clean(phys_addr_t paddr, size_t size)
+{
+}
+#endif /* ARCH_HAS_DMA_MARK_CLEAN */
+
 void *arch_dma_set_uncached(void *addr, size_t size);
 void arch_dma_clear_uncached(void *addr, size_t size);
 
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 847a9d1fa6343d..6cf7f7947ae797 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -43,6 +43,12 @@ config ARCH_HAS_DMA_SET_MASK
 config ARCH_HAS_DMA_WRITE_COMBINE
 	bool
 
+#
+# Select if the architectures provides the arch_dma_mark_clean hook
+#
+config ARCH_HAS_DMA_MARK_CLEAN
+	bool
+
 config DMA_DECLARE_COHERENT
 	bool
 
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index bb0041e9965975..1123e767f4315f 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -340,6 +340,9 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 		if (unlikely(is_swiotlb_buffer(paddr)))
 			swiotlb_tbl_sync_single(dev, paddr, sg->length, dir,
 					SYNC_FOR_CPU);
+
+		if (dir == DMA_FROM_DEVICE)
+			arch_dma_mark_clean(paddr, sg->length);
 	}
 
 	if (!dev_is_dma_coherent(dev))
-- 
2.28.0

