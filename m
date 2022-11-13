Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6626270C3
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Nov 2022 17:37:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F389C1654;
	Sun, 13 Nov 2022 17:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F389C1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668357452;
	bh=SI7Rhv4Tt2r3RA+shwWkkQ5admKkVbQLim5YZL0j/kA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ihW81IDI6BEn9sGiGOLzIG81jDU73b0npYpaTgeKWseqE6KWoKgJzy11GgnQEHIyH
	 wsjX2xiIvTPzAhd4Oe6goNzAcOmtvB+i22mDYeudcunxrgmWX8ZRVEYCrGPbrRc+I6
	 cPuZBOhRcFLvHR8k2Bv15ofa9mfjsoftU0K9M3WY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2B30F80549;
	Sun, 13 Nov 2022 17:36:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66F28F80425; Sun, 13 Nov 2022 17:36:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C690BF800CC
 for <alsa-devel@alsa-project.org>; Sun, 13 Nov 2022 17:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C690BF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="t5j7lXGJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=QmrATxoWw4i+ZCEet0QcrcoeounoBlCDdVUnFfxBeEE=; b=t5j7lXGJ7y4k7mshKGThP6/oMi
 PZD5z8vzrJKInWEJS4o8ibNxZiBKoCq226HnMrLpXIidMD9P2aHEZeZmUGoy5rH4j5ndBBQ9aD9x0
 4vcmIw7caELmyeuHlHqh+IXIushQHrso5BEN7RojMe/GxKraazPWw4GAs2rI9iZFLXGtag+W/kRGT
 DtraYp58Tzl37x5w7RJKHitxhUygtt0kYRry70+CnVBhmY6rNXj8W3qXpO7jcZ3SIPm80b201dV5J
 EieadWtmFHV/T7JuVFxN7h280v67rKSYAjdrGOMPrT6A5pqNqlTALgBPVOkb/WUk3itkWgqMhzXJH
 vYQjJamw==;
Received: from 213-225-8-167.nat.highway.a1.net ([213.225.8.167]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ouFxR-00CLSB-JY; Sun, 13 Nov 2022 16:35:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Wenjia Zhang <wenjia@linux.ibm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Russell King <linux@armlinux.org.uk>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 1/7] media: videobuf-dma-contig: use dma_mmap_coherent
Date: Sun, 13 Nov 2022 17:35:29 +0100
Message-Id: <20221113163535.884299-2-hch@lst.de>
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

dma_alloc_coherent does not return a physical address, but a DMA address,
which might be remapped or have an offset.  Passing the DMA address to
vm_iomap_memory is thus broken.

Use the proper dma_mmap_coherent helper instead, and stop passing
__GFP_COMP to dma_alloc_coherent, as the memory management inside the
DMA allocator is hidden from the callers and does not require it.

With this the gfp_t argument to __videobuf_dc_alloc can be removed and
hard coded to GFP_KERNEL.

Fixes: a8f3c203e19b ("[media] videobuf-dma-contig: add cache support")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/media/v4l2-core/videobuf-dma-contig.c | 22 +++++++------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/media/v4l2-core/videobuf-dma-contig.c b/drivers/media/v4l2-core/videobuf-dma-contig.c
index 52312ce2ba056..f2c4393595574 100644
--- a/drivers/media/v4l2-core/videobuf-dma-contig.c
+++ b/drivers/media/v4l2-core/videobuf-dma-contig.c
@@ -36,12 +36,11 @@ struct videobuf_dma_contig_memory {
 
 static int __videobuf_dc_alloc(struct device *dev,
 			       struct videobuf_dma_contig_memory *mem,
-			       unsigned long size, gfp_t flags)
+			       unsigned long size)
 {
 	mem->size = size;
-	mem->vaddr = dma_alloc_coherent(dev, mem->size,
-					&mem->dma_handle, flags);
-
+	mem->vaddr = dma_alloc_coherent(dev, mem->size, &mem->dma_handle,
+					GFP_KERNEL);
 	if (!mem->vaddr) {
 		dev_err(dev, "memory alloc size %ld failed\n", mem->size);
 		return -ENOMEM;
@@ -258,8 +257,7 @@ static int __videobuf_iolock(struct videobuf_queue *q,
 			return videobuf_dma_contig_user_get(mem, vb);
 
 		/* allocate memory for the read() method */
-		if (__videobuf_dc_alloc(q->dev, mem, PAGE_ALIGN(vb->size),
-					GFP_KERNEL))
+		if (__videobuf_dc_alloc(q->dev, mem, PAGE_ALIGN(vb->size)))
 			return -ENOMEM;
 		break;
 	case V4L2_MEMORY_OVERLAY:
@@ -295,22 +293,18 @@ static int __videobuf_mmap_mapper(struct videobuf_queue *q,
 	BUG_ON(!mem);
 	MAGIC_CHECK(mem->magic, MAGIC_DC_MEM);
 
-	if (__videobuf_dc_alloc(q->dev, mem, PAGE_ALIGN(buf->bsize),
-				GFP_KERNEL | __GFP_COMP))
+	if (__videobuf_dc_alloc(q->dev, mem, PAGE_ALIGN(buf->bsize)))
 		goto error;
 
-	/* Try to remap memory */
-	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-
 	/* the "vm_pgoff" is just used in v4l2 to find the
 	 * corresponding buffer data structure which is allocated
 	 * earlier and it does not mean the offset from the physical
 	 * buffer start address as usual. So set it to 0 to pass
-	 * the sanity check in vm_iomap_memory().
+	 * the sanity check in dma_mmap_coherent().
 	 */
 	vma->vm_pgoff = 0;
-
-	retval = vm_iomap_memory(vma, mem->dma_handle, mem->size);
+	retval = dma_mmap_coherent(q->dev, vma, mem->vaddr, mem->dma_handle,
+				   mem->size);
 	if (retval) {
 		dev_err(q->dev, "mmap: remap failed with error %d. ",
 			retval);
-- 
2.30.2

