Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BF02495D0
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 08:59:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 023AA1806;
	Wed, 19 Aug 2020 08:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 023AA1806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597820356;
	bh=IZf6HmL24ySgYAcXBp1/okAQulzjZEg+8zzW7l4PLyY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OPWKxukLDWe33kKV1l3/2WH9X9cpn2jJ1uXto5Ym3Mb3yOYnH4WcOfFQ9VFpHo+OE
	 6nPMlxCzftrTaYNu3kFMmIN9jMEN3PfftwB4rh/1rwrf+Uunhv7fMZmgfL6g/MitoX
	 f5oIng0QWdsjukLsZRLvL33asalhYmy6dHxMg9fA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CAA7F802C3;
	Wed, 19 Aug 2020 08:56:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B982BF802A9; Wed, 19 Aug 2020 08:56:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC72CF80216
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 08:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC72CF80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="UdYV4uHp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5I0Wekw7PGkNV3dZaIEsA8c8Eplwzl97xo8vYosQxdI=; b=UdYV4uHpyw9x3F5rwAWsVUPFE0
 Hqm02Lgcb3b7szXHtRYFh2Q2mQ0XgXJIRXZnNarHY8BTFPY/yfILYo9XBcRi7QMB28ipLhHbeYlLZ
 mACjmpKK8MPjiLf3dQYi0vBMkZJd/+MdUBQ3P1z7bbLGarn+eG74rMpDjApvZcefIfvlujyIZSqxu
 wHrDyEJGotoW7dL28Oiu4mTNTADO4SZxq3ID/xa3uKrXpchLC5U0otmEnB0C95mcVGd+TWrgeSorS
 YoshIRrHigr4PRqKUustXCWc2qvmN6xs6AZEOX38KVFTfpoTISa6SdfuLtcuYFCOYm/EHyRiUeiPJ
 oIt3VQVw==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I0x-0008LJ-Vp; Wed, 19 Aug 2020 06:56:04 +0000
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
Subject: [PATCH 04/28] net/au1000-eth: stop using DMA_ATTR_NON_CONSISTENT
Date: Wed, 19 Aug 2020 08:55:31 +0200
Message-Id: <20200819065555.1802761-5-hch@lst.de>
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

The au1000-eth driver contains none of the manual cache synchronization
required for using DMA_ATTR_NON_CONSISTENT.  From what I can tell it
can be used on both dma coherent and non-coherent DMA platforms, but
I suspect it has been buggy on the non-coherent platforms all along.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/net/ethernet/amd/au1000_eth.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 75dbd221dc594b..19e195420e2434 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1131,10 +1131,9 @@ static int au1000_probe(struct platform_device *pdev)
 	/* Allocate the data buffers
 	 * Snooping works fine with eth on all au1xxx
 	 */
-	aup->vaddr = (u32)dma_alloc_attrs(&pdev->dev, MAX_BUF_SIZE *
+	aup->vaddr = (u32)dma_alloc_coherent(&pdev->dev, MAX_BUF_SIZE *
 					  (NUM_TX_BUFFS + NUM_RX_BUFFS),
-					  &aup->dma_addr, 0,
-					  DMA_ATTR_NON_CONSISTENT);
+					  &aup->dma_addr, 0);
 	if (!aup->vaddr) {
 		dev_err(&pdev->dev, "failed to allocate data buffers\n");
 		err = -ENOMEM;
@@ -1310,9 +1309,8 @@ static int au1000_probe(struct platform_device *pdev)
 err_remap2:
 	iounmap(aup->mac);
 err_remap1:
-	dma_free_attrs(&pdev->dev, MAX_BUF_SIZE * (NUM_TX_BUFFS + NUM_RX_BUFFS),
-			(void *)aup->vaddr, aup->dma_addr,
-			DMA_ATTR_NON_CONSISTENT);
+	dma_free_coherent(&pdev->dev, MAX_BUF_SIZE * (NUM_TX_BUFFS + NUM_RX_BUFFS),
+			(void *)aup->vaddr, aup->dma_addr);
 err_vaddr:
 	free_netdev(dev);
 err_alloc:
@@ -1344,9 +1342,8 @@ static int au1000_remove(struct platform_device *pdev)
 		if (aup->tx_db_inuse[i])
 			au1000_ReleaseDB(aup, aup->tx_db_inuse[i]);
 
-	dma_free_attrs(&pdev->dev, MAX_BUF_SIZE * (NUM_TX_BUFFS + NUM_RX_BUFFS),
-			(void *)aup->vaddr, aup->dma_addr,
-			DMA_ATTR_NON_CONSISTENT);
+	dma_free_coherent(&pdev->dev, MAX_BUF_SIZE * (NUM_TX_BUFFS + NUM_RX_BUFFS),
+			(void *)aup->vaddr, aup->dma_addr);
 
 	iounmap(aup->macdma);
 	iounmap(aup->mac);
-- 
2.28.0

