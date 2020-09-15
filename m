Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 030F226A9EF
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 18:36:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F63D169F;
	Tue, 15 Sep 2020 18:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F63D169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600187800;
	bh=yZxQIPZxN1PJXsPOHZ8+4ZcYUTuXsjpfr+n7bk7VVck=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hM53+oZRShW/gtSvjNpnsh8Ucsp9j+KEns3c1xjMTEfKq64X/wi4pOvZov3nA+Ojs
	 9u7Qy2tQg5mJaT8b3qtF5Faav68v29ir6ZEifQCcmnLCdtstmgFTe7UzEnxXKsXYN1
	 uX45n3/Gd19P2Gj5VkIrQoGFgxeV90NSJoixZh10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00081F8027C;
	Tue, 15 Sep 2020 18:31:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 694E7F8033F; Tue, 15 Sep 2020 18:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35FA3F80332
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 18:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35FA3F80332
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="BF8Ybwry"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Y4Zt5Q6wslvCqwY7SHiicX4jOFlI8lEV5uqNCn2aPDc=; b=BF8YbwryBXqc7mtPROjOHHMQzI
 aCOvb2dbe8fLen0MFlQ6bZdJO1rQP3g4d4dO9bC7wb3bPnpXsd//7pQm0XAe1CmnocDvI3mNw9x84
 DqMUZtD3QsVy3CT7VDTqkPTc3a5yO5/TZLXDAt220oVQgGJ5BfYy8yaS2AQg9qMpEcy+I3LkNY7il
 JzIkJb66RHJirHSLpWuLrzgjJYckHJ3vo00GUu01LuPsQths42SyDL/0HOTCDVBBkLabE6ifyxjAQ
 ojf3+iDcfdbfdvsdoVmpGVpJvbYCHk+tqW16FLi5PeV0QL06+xx8fYIueiaHF7UduNRuvBDsvbu9C
 G1h7Ntow==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDqu-00064n-5h; Tue, 15 Sep 2020 16:30:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 17/18] dma-iommu: implement ->alloc_noncoherent
Date: Tue, 15 Sep 2020 17:51:21 +0200
Message-Id: <20200915155122.1768241-18-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915155122.1768241-1-hch@lst.de>
References: <20200915155122.1768241-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

Implement the alloc_noncoherent method to provide memory that is neither
coherent not contiguous.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c | 41 +++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 00a5b49248e334..c12c1dc43d312e 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -572,6 +572,7 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
  * @size: Size of buffer in bytes
  * @dma_handle: Out argument for allocated DMA handle
  * @gfp: Allocation flags
+ * @prot: pgprot_t to use for the remapped mapping
  * @attrs: DMA attributes for this allocation
  *
  * If @size is less than PAGE_SIZE, then a full CPU page will be allocated,
@@ -580,14 +581,14 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
  * Return: Mapped virtual address, or NULL on failure.
  */
 static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
+		dma_addr_t *dma_handle, gfp_t gfp, pgprot_t prot,
+		unsigned long attrs)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	bool coherent = dev_is_dma_coherent(dev);
 	int ioprot = dma_info_to_prot(DMA_BIDIRECTIONAL, coherent, attrs);
-	pgprot_t prot = dma_pgprot(dev, PAGE_KERNEL, attrs);
 	unsigned int count, min_size, alloc_sizes = domain->pgsize_bitmap;
 	struct page **pages;
 	struct sg_table sgt;
@@ -1030,8 +1031,10 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 	gfp |= __GFP_ZERO;
 
 	if (IS_ENABLED(CONFIG_DMA_REMAP) && gfpflags_allow_blocking(gfp) &&
-	    !(attrs & DMA_ATTR_FORCE_CONTIGUOUS))
-		return iommu_dma_alloc_remap(dev, size, handle, gfp, attrs);
+	    !(attrs & DMA_ATTR_FORCE_CONTIGUOUS)) {
+		return iommu_dma_alloc_remap(dev, size, handle, gfp,
+				dma_pgprot(dev, PAGE_KERNEL, attrs), attrs);
+	}
 
 	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
 	    !gfpflags_allow_blocking(gfp) && !coherent)
@@ -1052,6 +1055,34 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 	return cpu_addr;
 }
 
+#ifdef CONFIG_DMA_REMAP
+static void *iommu_dma_alloc_noncoherent(struct device *dev, size_t size,
+		dma_addr_t *handle, enum dma_data_direction dir, gfp_t gfp)
+{
+	if (!gfpflags_allow_blocking(gfp)) {
+		struct page *page;
+
+		page = dma_common_alloc_pages(dev, size, handle, dir, gfp);
+		if (!page)
+			return NULL;
+		return page_address(page);
+	}
+
+	return iommu_dma_alloc_remap(dev, size, handle, gfp | __GFP_ZERO,
+				     PAGE_KERNEL, 0);
+}
+
+static void iommu_dma_free_noncoherent(struct device *dev, size_t size,
+		void *cpu_addr, dma_addr_t handle, enum dma_data_direction dir)
+{
+	__iommu_dma_unmap(dev, handle, size);
+	__iommu_dma_free(dev, size, cpu_addr);
+}
+#else
+#define iommu_dma_alloc_noncoherent		NULL
+#define iommu_dma_free_noncoherent		NULL
+#endif /* CONFIG_DMA_REMAP */
+
 static int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs)
@@ -1122,6 +1153,8 @@ static const struct dma_map_ops iommu_dma_ops = {
 	.free			= iommu_dma_free,
 	.alloc_pages		= dma_common_alloc_pages,
 	.free_pages		= dma_common_free_pages,
+	.alloc_noncoherent	= iommu_dma_alloc_noncoherent,
+	.free_noncoherent	= iommu_dma_free_noncoherent,
 	.mmap			= iommu_dma_mmap,
 	.get_sgtable		= iommu_dma_get_sgtable,
 	.map_page		= iommu_dma_map_page,
-- 
2.28.0

