Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 969A6268F61
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 17:15:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36EB116B5;
	Mon, 14 Sep 2020 17:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36EB116B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600096523;
	bh=rknCt1CCCqbEgoWQLWwVgI0ROs55A/9pMInxZB7H6Ic=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V3w+chHJQsSqHsXjZN531/9yXl7ZdbFm44x8On8VuXVI1Gg30VQIpMG7WDDsLUkpX
	 u649rKR6Jykyw693lSFJWOj3eTBwtSa7fWVI/EN9T3Nc65ZKZAu8iZ/xm7HjWkui+O
	 yptUzNlYH8Gmj9dHZxDGdQ+CT3l2vGjJDXoyVvdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41211F80105;
	Mon, 14 Sep 2020 17:13:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCA28F8015A; Mon, 14 Sep 2020 17:13:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5614F80105
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 17:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5614F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="dP3pKRmp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=RqQGv7rUrofRqLyMSzfEtcHVgVUslC8cDoNR577KrIg=; b=dP3pKRmpC+I0E+dOSbraRXJ35X
 3haQwB40uPuLpGR5zn67wQbMCYeYUDIDCnlsB5tNCLi9vaoDWIjbKg2ty0ncKAbUYHiAWQ1Gwe4T2
 /L1d3ii2rUMCke8WZymWHb2tl/HocPOnGFPqgOwVy0kntsQ5+2r+a5DBRhRIc7Qwt5AhJHft+rUwc
 cUuL4BH3aNOU3nrCkiiuv/cztMGgjnYHVBqE36sUV2hPE4iUig7eK9l316jWvenjHMhEIQ2Nevj2v
 NzaWOE2Dnmj9Uqr/OYUKSLadMvLX2JkZjrKxFODSeBkgfvxBjLKXD/2ClVZgj/x7V7GdULKR4vyHX
 B3N9jL+g==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHqAB-0003UL-04; Mon, 14 Sep 2020 15:13:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 12/17] 53c700: convert to dma_alloc_noncoherent
Date: Mon, 14 Sep 2020 16:44:28 +0200
Message-Id: <20200914144433.1622958-13-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914144433.1622958-1-hch@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
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

Use the new non-coherent DMA API including proper ownership transfers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/53c700.c | 11 +++++++++--
 drivers/scsi/53c700.h | 16 ++++++++--------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/53c700.c b/drivers/scsi/53c700.c
index 9a343f8ecb6c3e..5117d90ccd9edf 100644
--- a/drivers/scsi/53c700.c
+++ b/drivers/scsi/53c700.c
@@ -269,18 +269,25 @@ NCR_700_get_SXFER(struct scsi_device *SDp)
 					      spi_period(SDp->sdev_target));
 }
 
+static inline dma_addr_t virt_to_dma(struct NCR_700_Host_Parameters *h, void *p)
+{
+	return h->pScript + ((uintptr_t)p - (uintptr_t)h->script);
+}
+
 static inline void dma_sync_to_dev(struct NCR_700_Host_Parameters *h,
 		void *addr, size_t size)
 {
 	if (h->noncoherent)
-		dma_cache_sync(h->dev, addr, size, DMA_TO_DEVICE);
+		dma_sync_single_for_device(h->dev, virt_to_dma(h, addr),
+					   size, DMA_BIDIRECTIONAL);
 }
 
 static inline void dma_sync_from_dev(struct NCR_700_Host_Parameters *h,
 		void *addr, size_t size)
 {
 	if (h->noncoherent)
-		dma_cache_sync(h->dev, addr, size, DMA_FROM_DEVICE);
+		dma_sync_single_for_device(h->dev, virt_to_dma(h, addr), size,
+					   DMA_BIDIRECTIONAL);
 }
 
 struct Scsi_Host *
diff --git a/drivers/scsi/53c700.h b/drivers/scsi/53c700.h
index 0f545b05fe611d..c9f8c497babb3d 100644
--- a/drivers/scsi/53c700.h
+++ b/drivers/scsi/53c700.h
@@ -423,33 +423,33 @@ struct NCR_700_Host_Parameters {
 #define NCR_710_MIN_XFERP	0
 #define NCR_700_MIN_PERIOD	25 /* for SDTR message, 100ns */
 
-#define script_patch_32(dev, script, symbol, value) \
+#define script_patch_32(h, script, symbol, value) \
 { \
 	int i; \
 	dma_addr_t da = value; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
 		__u32 val = bS_to_cpu((script)[A_##symbol##_used[i]]) + da; \
 		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
-		dma_sync_to_dev((dev), &(script)[A_##symbol##_used[i]], 4); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching %s at %d to %pad\n", \
 		       #symbol, A_##symbol##_used[i], &da)); \
 	} \
 }
 
-#define script_patch_32_abs(dev, script, symbol, value) \
+#define script_patch_32_abs(h, script, symbol, value) \
 { \
 	int i; \
 	dma_addr_t da = value; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
 		(script)[A_##symbol##_used[i]] = bS_to_host(da); \
-		dma_sync_to_dev((dev), &(script)[A_##symbol##_used[i]], 4); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching %s at %d to %pad\n", \
 		       #symbol, A_##symbol##_used[i], &da)); \
 	} \
 }
 
 /* Used for patching the SCSI ID in the SELECT instruction */
-#define script_patch_ID(dev, script, symbol, value) \
+#define script_patch_ID(h, script, symbol, value) \
 { \
 	int i; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
@@ -457,13 +457,13 @@ struct NCR_700_Host_Parameters {
 		val &= 0xff00ffff; \
 		val |= ((value) & 0xff) << 16; \
 		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
-		dma_sync_to_dev((dev), &(script)[A_##symbol##_used[i]], 4); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching ID field %s at %d to 0x%x\n", \
 		       #symbol, A_##symbol##_used[i], val)); \
 	} \
 }
 
-#define script_patch_16(dev, script, symbol, value) \
+#define script_patch_16(h, script, symbol, value) \
 { \
 	int i; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
@@ -471,7 +471,7 @@ struct NCR_700_Host_Parameters {
 		val &= 0xffff0000; \
 		val |= ((value) & 0xffff); \
 		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
-		dma_sync_to_dev((dev), &(script)[A_##symbol##_used[i]], 4); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching short field %s at %d to 0x%x\n", \
 		       #symbol, A_##symbol##_used[i], val)); \
 	} \
-- 
2.28.0

