Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF15E26A99F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 18:22:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A2A3169E;
	Tue, 15 Sep 2020 18:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A2A3169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600186937;
	bh=OUHyUJ9RQlsGExVJA1dJYjyWGQYdKYVLhSD4z0PFMjA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rv94igLcOWEwfxWFRdtnE46zERNagVk9v2e9uzwBRxS1IiclYJo2yOTVy/cNxqi3k
	 ghCyO4QdpkjIrz0YXhtcEo/QVCE18+9/ohpQpoF7XMpTa8deNRZeApi3W6gm6irqIj
	 n2b9QIuHZVlraXzYqcIsVYRPGUN+pFuOTGeOhqTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F741F80276;
	Tue, 15 Sep 2020 18:20:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4137BF80159; Tue, 15 Sep 2020 18:20:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57D10F8025E
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 18:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57D10F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="KV4MHtGI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=i+wSADPYCfjiINNNap/OtPKewAd3CUR2UpLQDRhWXVM=; b=KV4MHtGI1c35fx301ypBZ2ix5f
 j6+9ZBm5fX2GTWrmr4Ucexej6a/A5AgmrccjxIJaXRVSJ25VeGNarsOyAh2mV63O4QoWYIt397+p/
 PEj6Fh9y7Z9MocC0Hlfy6ktdLodgEKBx1jPzxDDRVZFQxq6HUKkZ+ruLNJ7tWvxCUBT0Uc4ZWj9aI
 eodnHxY42TKdaain8L+MAGrX7+JkUf2CCLX1ArOSkzY+hjEXko2GALiYhYarDUPJ5lEjgchOlPjSa
 oTRbf+Wq093khDrwEuwBqMXFNj+Kn+GSdd95aFRR1UNfKr4GP9znnnjfctGimxooOjIWir3e/76iY
 9DM3BvgA==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDgI-0005Cn-PU; Tue, 15 Sep 2020 16:19:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 12/18] sgiseeq: convert to dma_alloc_noncoherent
Date: Tue, 15 Sep 2020 17:51:16 +0200
Message-Id: <20200915155122.1768241-13-hch@lst.de>
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

Use the new non-coherent DMA API including proper ownership transfers.
This includes adding additional calls to dma_sync_desc_dev as the
old syncing was rather ad-hoc.

Thanks to Thomas Bogendoerfer for debugging the ownership transfer
issues.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/net/ethernet/seeq/sgiseeq.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/seeq/sgiseeq.c b/drivers/net/ethernet/seeq/sgiseeq.c
index 8507ff2420143a..37ff25a84030eb 100644
--- a/drivers/net/ethernet/seeq/sgiseeq.c
+++ b/drivers/net/ethernet/seeq/sgiseeq.c
@@ -112,14 +112,18 @@ struct sgiseeq_private {
 
 static inline void dma_sync_desc_cpu(struct net_device *dev, void *addr)
 {
-	dma_cache_sync(dev->dev.parent, addr, sizeof(struct sgiseeq_rx_desc),
-		       DMA_FROM_DEVICE);
+	struct sgiseeq_private *sp = netdev_priv(dev);
+
+	dma_sync_single_for_cpu(dev->dev.parent, VIRT_TO_DMA(sp, addr),
+			sizeof(struct sgiseeq_rx_desc), DMA_BIDIRECTIONAL);
 }
 
 static inline void dma_sync_desc_dev(struct net_device *dev, void *addr)
 {
-	dma_cache_sync(dev->dev.parent, addr, sizeof(struct sgiseeq_rx_desc),
-		       DMA_TO_DEVICE);
+	struct sgiseeq_private *sp = netdev_priv(dev);
+
+	dma_sync_single_for_device(dev->dev.parent, VIRT_TO_DMA(sp, addr),
+			sizeof(struct sgiseeq_rx_desc), DMA_BIDIRECTIONAL);
 }
 
 static inline void hpc3_eth_reset(struct hpc3_ethregs *hregs)
@@ -403,6 +407,8 @@ static inline void sgiseeq_rx(struct net_device *dev, struct sgiseeq_private *sp
 		rd = &sp->rx_desc[sp->rx_new];
 		dma_sync_desc_cpu(dev, rd);
 	}
+	dma_sync_desc_dev(dev, rd);
+
 	dma_sync_desc_cpu(dev, &sp->rx_desc[orig_end]);
 	sp->rx_desc[orig_end].rdma.cntinfo &= ~(HPCDMA_EOR);
 	dma_sync_desc_dev(dev, &sp->rx_desc[orig_end]);
@@ -443,6 +449,7 @@ static inline void kick_tx(struct net_device *dev,
 		dma_sync_desc_cpu(dev, td);
 	}
 	if (td->tdma.cntinfo & HPCDMA_XIU) {
+		dma_sync_desc_dev(dev, td);
 		hregs->tx_ndptr = VIRT_TO_DMA(sp, td);
 		hregs->tx_ctrl = HPC3_ETXCTRL_ACTIVE;
 	}
@@ -476,6 +483,7 @@ static inline void sgiseeq_tx(struct net_device *dev, struct sgiseeq_private *sp
 		if (!(td->tdma.cntinfo & (HPCDMA_XIU)))
 			break;
 		if (!(td->tdma.cntinfo & (HPCDMA_ETXD))) {
+			dma_sync_desc_dev(dev, td);
 			if (!(status & HPC3_ETXCTRL_ACTIVE)) {
 				hregs->tx_ndptr = VIRT_TO_DMA(sp, td);
 				hregs->tx_ctrl = HPC3_ETXCTRL_ACTIVE;
@@ -740,8 +748,8 @@ static int sgiseeq_probe(struct platform_device *pdev)
 	sp = netdev_priv(dev);
 
 	/* Make private data page aligned */
-	sr = dma_alloc_attrs(&pdev->dev, sizeof(*sp->srings), &sp->srings_dma,
-			     GFP_KERNEL, DMA_ATTR_NON_CONSISTENT);
+	sr = dma_alloc_noncoherent(&pdev->dev, sizeof(*sp->srings),
+			&sp->srings_dma, DMA_BIDIRECTIONAL, GFP_KERNEL);
 	if (!sr) {
 		printk(KERN_ERR "Sgiseeq: Page alloc failed, aborting.\n");
 		err = -ENOMEM;
@@ -802,8 +810,8 @@ static int sgiseeq_probe(struct platform_device *pdev)
 	return 0;
 
 err_out_free_attrs:
-	dma_free_attrs(&pdev->dev, sizeof(*sp->srings), sp->srings,
-		       sp->srings_dma, DMA_ATTR_NON_CONSISTENT);
+	dma_free_noncoherent(&pdev->dev, sizeof(*sp->srings), sp->srings,
+		       sp->srings_dma, DMA_BIDIRECTIONAL);
 err_out_free_dev:
 	free_netdev(dev);
 
@@ -817,8 +825,8 @@ static int sgiseeq_remove(struct platform_device *pdev)
 	struct sgiseeq_private *sp = netdev_priv(dev);
 
 	unregister_netdev(dev);
-	dma_free_attrs(&pdev->dev, sizeof(*sp->srings), sp->srings,
-		       sp->srings_dma, DMA_ATTR_NON_CONSISTENT);
+	dma_free_noncoherent(&pdev->dev, sizeof(*sp->srings), sp->srings,
+		       sp->srings_dma, DMA_BIDIRECTIONAL);
 	free_netdev(dev);
 
 	return 0;
-- 
2.28.0

