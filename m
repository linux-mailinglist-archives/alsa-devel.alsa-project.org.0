Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8005F2496B6
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 09:10:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22EAB1804;
	Wed, 19 Aug 2020 09:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22EAB1804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597821032;
	bh=YO2W6X4OgAdrwEafAl/zJF/cDSTcA4Ih0R6uA55nsxo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mSQi6BDjNXBiMteTe6EHCtpzaV3vZiI/tfU7wXguJWqHDVTrOx/LpOXhpXVxiZLQT
	 6p9LQWqtHRgHhoXcBZjIAhgcr6zV7VC/dpABloP05NOV/xliqoPWTwSBUx/YAuYPHh
	 Gc65lYvFvCDZ+2PYjT01R2VCdvZQdg3wuouOzoDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E42F0F80257;
	Wed, 19 Aug 2020 08:58:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7403AF80394; Wed, 19 Aug 2020 08:58:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 764CAF8036C
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 08:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 764CAF8036C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="mO0h3/QJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=RFTX12/6vaWoRhhjSqpC5wgk9pFG99OSZ6G21Gj4zUk=; b=mO0h3/QJQ4IMJcw7idTzxUEyfy
 FuPqv+qEDbTDPKK7FEenUd7ionlcjYL5GNBSYPlMCFwiQJm5+2rN19erxYXKVTBf390ZI8EWPbL0a
 ab7QtB66NQzyOAGNH+ofzZrE9kkefR1unxsPvJ5aJmbuHVe11Py2x1Qkb3NICIBaF7SLnVjd2jf1j
 WogQQTRrOF5qGuiMHBe3WOb95aMfkixb9aeUOuDYPDLOtubIROb53k2qV4Kd5JURqGiFRezaphnme
 D+80I4GP/SkvHK3cjj0XcV7p+d8ZZ2xWBwT2HC7Kew3oBm8FRsyQUXwUGkUv2IaqYMxBQPG/p6CP2
 xIzfAfMg==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I1e-0008V1-Rd; Wed, 19 Aug 2020 06:56:47 +0000
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
Subject: [PATCH 22/28] sgiseeq: convert from dma_cache_sync to
 dma_sync_single_for_device
Date: Wed, 19 Aug 2020 08:55:49 +0200
Message-Id: <20200819065555.1802761-23-hch@lst.de>
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

Use the proper modern API to transfer cache ownership for incoherent DMA.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/net/ethernet/seeq/sgiseeq.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/seeq/sgiseeq.c b/drivers/net/ethernet/seeq/sgiseeq.c
index 39599bbb5d45b6..f91dae16d69a19 100644
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
-- 
2.28.0

