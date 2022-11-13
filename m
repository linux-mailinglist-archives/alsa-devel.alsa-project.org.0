Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC946270DC
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Nov 2022 17:39:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA51C161F;
	Sun, 13 Nov 2022 17:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA51C161F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668357551;
	bh=sYWUWp0pvVr5VbMTUzVUFKzZJVwNStjyV6NpQd3STHg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5rs3Vz2W24xKUm9cJoJjTWhxFkv+IbMwBKa1vGZkDYPffknzU/Bvkm29IoMyO9t8
	 6mw/Cy2SVz+u84mOAnnUqiL1txckuFPcMzn/0ihrHhGTYgmPp8fFUkbGjwK3NQnoE5
	 rSThQKqSWc0YXHxhNNl4DYqHdhrf12w6iznqe3es=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 420A6F80589;
	Sun, 13 Nov 2022 17:36:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 997F1F80589; Sun, 13 Nov 2022 17:36:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E052F80580
 for <alsa-devel@alsa-project.org>; Sun, 13 Nov 2022 17:36:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E052F80580
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="D+OjBUBf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=bm9iJk+kVC/i+ZASfRIM102pV+AxG+Ji6MRA8D8G/hY=; b=D+OjBUBfCQQK7BJwONwAEfMW1V
 8jRN6GgBR+VrL0tS3XZiRQ9Izl/KLvRdOZNqOKO2oIvVjbiEGO1c1mbTInhWzw5wANb8webd1H6p5
 4/cHh9i8I5M7GvWwpaoJptq5AjmQRt8Uvmx0I5RXPXAGTwzpOau/gcI90NjYFBjagiMm2ZQ5k22MD
 7he1X8jQVE3y/TPsjx6SSpehg1Wx7QAkYIJ9T/fxBFt3LhOvqAFBSPxj82bVviM8XSUfaM+n1JJeB
 F3Tse+cErMM0s3ZTGzoBDhUF3xq2vcmDdNxALOObw3iQy8FqQtrGg2svEfAxxHzAdX4NFzYvz8ba/
 OKZme3wA==;
Received: from 213-225-8-167.nat.highway.a1.net ([213.225.8.167]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ouFxr-00CLdm-QM; Sun, 13 Nov 2022 16:36:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Wenjia Zhang <wenjia@linux.ibm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Russell King <linux@armlinux.org.uk>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 7/7] dma-mapping: reject __GFP_COMP in dma_alloc_attrs
Date: Sun, 13 Nov 2022 17:35:35 +0100
Message-Id: <20221113163535.884299-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221113163535.884299-1-hch@lst.de>
References: <20221113163535.884299-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-s390@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, iommu@lists.linux.dev,
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

DMA allocations can never be turned back into a page pointer, so
requesting compound pages doesn't make sense and it can't even be
supported at all by various backends.

Reject __GFP_COMP with a warning in dma_alloc_attrs, and stop clearing
the flag in the arm dma ops and dma-iommu.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/mm/dma-mapping.c | 17 -----------------
 drivers/iommu/dma-iommu.c |  3 ---
 kernel/dma/mapping.c      |  8 ++++++++
 3 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index d7909091cf977..c135f6e37a00c 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -564,14 +564,6 @@ static void *__dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
 	if (mask < 0xffffffffULL)
 		gfp |= GFP_DMA;
 
-	/*
-	 * Following is a work-around (a.k.a. hack) to prevent pages
-	 * with __GFP_COMP being passed to split_page() which cannot
-	 * handle them.  The real problem is that this flag probably
-	 * should be 0 on ARM as it is not supported on this
-	 * platform; see CONFIG_HUGETLBFS.
-	 */
-	gfp &= ~(__GFP_COMP);
 	args.gfp = gfp;
 
 	*handle = DMA_MAPPING_ERROR;
@@ -1093,15 +1085,6 @@ static void *arm_iommu_alloc_attrs(struct device *dev, size_t size,
 		return __iommu_alloc_simple(dev, size, gfp, handle,
 					    coherent_flag, attrs);
 
-	/*
-	 * Following is a work-around (a.k.a. hack) to prevent pages
-	 * with __GFP_COMP being passed to split_page() which cannot
-	 * handle them.  The real problem is that this flag probably
-	 * should be 0 on ARM as it is not supported on this
-	 * platform; see CONFIG_HUGETLBFS.
-	 */
-	gfp &= ~(__GFP_COMP);
-
 	pages = __iommu_alloc_buffer(dev, size, gfp, attrs, coherent_flag);
 	if (!pages)
 		return NULL;
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 9297b741f5e80..f798c44e09033 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -744,9 +744,6 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
 	/* IOMMU can map any pages, so himem can also be used here */
 	gfp |= __GFP_NOWARN | __GFP_HIGHMEM;
 
-	/* It makes no sense to muck about with huge pages */
-	gfp &= ~__GFP_COMP;
-
 	while (count) {
 		struct page *page = NULL;
 		unsigned int order_size;
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 33437d6206445..c026a5a5e0466 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -498,6 +498,14 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 
 	WARN_ON_ONCE(!dev->coherent_dma_mask);
 
+	/*
+	 * DMA allocations can never be turned back into a page pointer, so
+	 * requesting compound pages doesn't make sense (and can't even be
+	 * supported at all by various backends).
+	 */
+	if (WARN_ON_ONCE(flag & __GFP_COMP))
+		return NULL;
+
 	if (dma_alloc_from_dev_coherent(dev, size, dma_handle, &cpu_addr))
 		return cpu_addr;
 
-- 
2.30.2

