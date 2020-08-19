Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D532496DB
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 09:13:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FC20186B;
	Wed, 19 Aug 2020 09:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FC20186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597821238;
	bh=xVRMR/6ysSFYEjikVwajBrN5O+qJrp5mKVwQj58hlpM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FSyxhrD8FeQID1nAiTVRx14/+j1PwXHhj0A3TJF8AFY94PVBeMVs1iazVwneu8k2l
	 18K7gNOenAfpBl7M3WSOOtRyHqLfiMbM49H392WSDbQFA6Z5A5vseL1SMM3Q6BCb+u
	 Od3zB23rB+XVmyPGNHsw0vE7CxIFTO/YfDmbmWcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1B70F803F4;
	Wed, 19 Aug 2020 08:58:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BD27F803D6; Wed, 19 Aug 2020 08:58:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97618F80367
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 08:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97618F80367
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="hvsEVEvL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=lNMBC694MGzhD+uJcSmWDHi7UPoDvxCv6DsPxBphUDM=; b=hvsEVEvLhFqVJsYwQI9fVfL5lp
 KW/X5c84TRVEWiCq+JWY6sNEc2oPPEGv+njCJOloQQfIY5LUVW8trunjunigerqOpw/bNuW3d15Nk
 KgKieclLAYJPG4mvEkrbXHTLSkS3oIM/sohwRcqd7QHlpj3mv/N3/MXfm3eBRP5C0/LNJ5ouorMBE
 EFFTa7MVts6kBXsmWo/w+5Hd0w5Fe84gvTgCYwvRXDgUbWV9izyuuyq+19e30v6LdcypJRbfFaF/y
 BVzr8sMb9JqE5r5zxB/kHyoI/WzgowY0Vk+Xyd6UQArjHPMonvBv0ewspWNMbu/2jhayLSYkMZBFZ
 7BeuNtag==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I1v-00007x-Sa; Wed, 19 Aug 2020 06:57:05 +0000
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
Subject: [PATCH 28/28] nvme-pci: use dma_alloc_pages backed dmapools
Date: Wed, 19 Aug 2020 08:55:55 +0200
Message-Id: <20200819065555.1802761-29-hch@lst.de>
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

Switch from coherent DMA pools to those backed by dma_alloc_pages.  This
helps device with non-coherent DMA to avoid host accesses to uncached
memory for every submission of a larger than single entry I/O.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/pci.c | 80 ++++++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index a33adab62acbaf..fb34dbcb973673 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -114,8 +114,8 @@ struct nvme_dev {
 	struct blk_mq_tag_set admin_tagset;
 	u32 __iomem *dbs;
 	struct device *dev;
-	struct dma_pool *prp_page_pool;
-	struct dma_pool *prp_small_pool;
+	struct dma_pool prp_page_pool;
+	struct dma_pool prp_small_pool;
 	unsigned online_queues;
 	unsigned max_qid;
 	unsigned io_queues[HCTX_MAX_TYPES];
@@ -536,7 +536,7 @@ static void nvme_unmap_data(struct nvme_dev *dev, struct request *req)
 
 
 	if (iod->npages == 0)
-		dma_pool_free(dev->prp_small_pool, nvme_pci_iod_list(req)[0],
+		dma_pool_free(&dev->prp_small_pool, nvme_pci_iod_list(req)[0],
 			dma_addr);
 
 	for (i = 0; i < iod->npages; i++) {
@@ -553,7 +553,7 @@ static void nvme_unmap_data(struct nvme_dev *dev, struct request *req)
 			next_dma_addr = le64_to_cpu(prp_list[last_prp]);
 		}
 
-		dma_pool_free(dev->prp_page_pool, addr, dma_addr);
+		dma_pool_free(&dev->prp_page_pool, addr, dma_addr);
 		dma_addr = next_dma_addr;
 	}
 
@@ -611,10 +611,10 @@ static blk_status_t nvme_pci_setup_prps(struct nvme_dev *dev,
 
 	nprps = DIV_ROUND_UP(length, NVME_CTRL_PAGE_SIZE);
 	if (nprps <= (256 / 8)) {
-		pool = dev->prp_small_pool;
+		pool = &dev->prp_small_pool;
 		iod->npages = 0;
 	} else {
-		pool = dev->prp_page_pool;
+		pool = &dev->prp_page_pool;
 		iod->npages = 1;
 	}
 
@@ -630,6 +630,11 @@ static blk_status_t nvme_pci_setup_prps(struct nvme_dev *dev,
 	for (;;) {
 		if (i == NVME_CTRL_PAGE_SIZE >> 3) {
 			__le64 *old_prp_list = prp_list;
+
+			dma_sync_single_for_device(dev->dev, prp_dma,
+						   i * sizeof(*prp_list),
+						   DMA_TO_DEVICE);
+
 			prp_list = dma_pool_alloc(pool, GFP_ATOMIC, &prp_dma);
 			if (!prp_list)
 				return BLK_STS_RESOURCE;
@@ -653,6 +658,8 @@ static blk_status_t nvme_pci_setup_prps(struct nvme_dev *dev,
 		dma_len = sg_dma_len(sg);
 	}
 
+	dma_sync_single_for_device(dev->dev, prp_dma, i * sizeof(*prp_list),
+				   DMA_TO_DEVICE);
 done:
 	cmnd->dptr.prp1 = cpu_to_le64(sg_dma_address(iod->sg));
 	cmnd->dptr.prp2 = cpu_to_le64(iod->first_dma);
@@ -706,10 +713,10 @@ static blk_status_t nvme_pci_setup_sgls(struct nvme_dev *dev,
 	}
 
 	if (entries <= (256 / sizeof(struct nvme_sgl_desc))) {
-		pool = dev->prp_small_pool;
+		pool = &dev->prp_small_pool;
 		iod->npages = 0;
 	} else {
-		pool = dev->prp_page_pool;
+		pool = &dev->prp_page_pool;
 		iod->npages = 1;
 	}
 
@@ -728,6 +735,10 @@ static blk_status_t nvme_pci_setup_sgls(struct nvme_dev *dev,
 		if (i == SGES_PER_PAGE) {
 			struct nvme_sgl_desc *old_sg_desc = sg_list;
 			struct nvme_sgl_desc *link = &old_sg_desc[i - 1];
+	
+			dma_sync_single_for_device(dev->dev, sgl_dma,
+						   i * sizeof(*sg_list),
+						   DMA_TO_DEVICE);
 
 			sg_list = dma_pool_alloc(pool, GFP_ATOMIC, &sgl_dma);
 			if (!sg_list)
@@ -743,6 +754,8 @@ static blk_status_t nvme_pci_setup_sgls(struct nvme_dev *dev,
 		sg = sg_next(sg);
 	} while (--entries > 0);
 
+	dma_sync_single_for_device(dev->dev, sgl_dma, i * sizeof(*sg_list),
+				   DMA_TO_DEVICE);
 	return BLK_STS_OK;
 }
 
@@ -2457,30 +2470,6 @@ static int nvme_disable_prepare_reset(struct nvme_dev *dev, bool shutdown)
 	return 0;
 }
 
-static int nvme_setup_prp_pools(struct nvme_dev *dev)
-{
-	dev->prp_page_pool = dma_pool_create("prp list page", dev->dev,
-						NVME_CTRL_PAGE_SIZE,
-						NVME_CTRL_PAGE_SIZE, 0);
-	if (!dev->prp_page_pool)
-		return -ENOMEM;
-
-	/* Optimisation for I/Os between 4k and 128k */
-	dev->prp_small_pool = dma_pool_create("prp list 256", dev->dev,
-						256, 256, 0);
-	if (!dev->prp_small_pool) {
-		dma_pool_destroy(dev->prp_page_pool);
-		return -ENOMEM;
-	}
-	return 0;
-}
-
-static void nvme_release_prp_pools(struct nvme_dev *dev)
-{
-	dma_pool_destroy(dev->prp_page_pool);
-	dma_pool_destroy(dev->prp_small_pool);
-}
-
 static void nvme_free_tagset(struct nvme_dev *dev)
 {
 	if (dev->tagset.tags)
@@ -2851,10 +2840,6 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	INIT_WORK(&dev->remove_work, nvme_remove_dead_ctrl_work);
 	mutex_init(&dev->shutdown_lock);
 
-	result = nvme_setup_prp_pools(dev);
-	if (result)
-		goto unmap;
-
 	quirks |= check_vendor_combination_bug(pdev);
 
 	if (!noacpi && nvme_acpi_storage_d3(pdev)) {
@@ -2867,6 +2852,18 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		quirks |= NVME_QUIRK_SIMPLE_SUSPEND;
 	}
 
+	result = dma_pool_init(dev->dev, &dev->prp_page_pool, "prp list page",
+			NVME_CTRL_PAGE_SIZE, NVME_CTRL_PAGE_SIZE, 0,
+			DMA_TO_DEVICE);
+	if (result)
+		goto unmap;
+
+	/* Optimisation for I/Os between 4k and 128k */
+	result = dma_pool_init(dev->dev, &dev->prp_small_pool, "prp list 256",
+			256, 256, 0, DMA_TO_DEVICE);
+	if (result)
+		goto release_prp_page_pool;
+
 	/*
 	 * Double check that our mempool alloc size will cover the biggest
 	 * command we support.
@@ -2880,7 +2877,7 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 						GFP_KERNEL, node);
 	if (!dev->iod_mempool) {
 		result = -ENOMEM;
-		goto release_pools;
+		goto release_prp_small_pool;
 	}
 
 	result = nvme_init_ctrl(&dev->ctrl, &pdev->dev, &nvme_pci_ctrl_ops,
@@ -2897,8 +2894,10 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
  release_mempool:
 	mempool_destroy(dev->iod_mempool);
- release_pools:
-	nvme_release_prp_pools(dev);
+ release_prp_small_pool:
+	dma_pool_exit(&dev->prp_small_pool);
+ release_prp_page_pool:
+	dma_pool_exit(&dev->prp_page_pool);
  unmap:
 	nvme_dev_unmap(dev);
  put_pci:
@@ -2963,7 +2962,8 @@ static void nvme_remove(struct pci_dev *pdev)
 	nvme_free_host_mem(dev);
 	nvme_dev_remove_admin(dev);
 	nvme_free_queues(dev, 0);
-	nvme_release_prp_pools(dev);
+	dma_pool_exit(&dev->prp_small_pool);
+	dma_pool_exit(&dev->prp_page_pool);
 	nvme_dev_unmap(dev);
 	nvme_uninit_ctrl(&dev->ctrl);
 }
-- 
2.28.0

