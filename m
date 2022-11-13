Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EEB6270C6
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Nov 2022 17:38:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2385E1673;
	Sun, 13 Nov 2022 17:37:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2385E1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668357502;
	bh=BxpMroSsTTpwKJmjHqenGcIbhIWVWuv9yZKVGbBqug8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kjsGwwWrOqUVNSdorHnNp214/VSNvwnTUaY17Wm5PmHKb/Rho7dLMlKnTr8Xx8dnX
	 jyonqzWHKlP2hh36RubUvOOaDzTqkpIZ/DKdZgBXExpHMr6hxw5Yf/J9b62udS6js8
	 GOr1x7HZfqud7jSQneRhxhcnn4nh5U4KF3exIhmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D7DF80566;
	Sun, 13 Nov 2022 17:36:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EB0DF8055B; Sun, 13 Nov 2022 17:36:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93428F80559
 for <alsa-devel@alsa-project.org>; Sun, 13 Nov 2022 17:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93428F80559
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="hv07boN2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=IefdeDDlkkYOKsyBrDSxlcCl/F9GiRc0htDJzBVpGnI=; b=hv07boN2vtppLb4m/Cty6RgoUz
 HPOIdZKc9qzdk5F+f5a/MKoyhbSIuiedp9pV3ydtpYNYnPhbkV0xDbUmC3dYrbIEb6HmAtnEDUMLR
 RtwHuWtm3MiG6uMEQVFreUbETxa+F4jeedT3tys4edoVIFlr1hLjYkt8wr5ewUegYZhQRpYqHvG7W
 Y1A0M3KX9dPAvFWxCwmomHqg+w/H5Q7EYNqzhu5UDSmTbNOqcgy3gZgy23a1h48+apvZ+lulMpcjC
 1UlA8Gd+BCkuF5rrH65+F9/gCGHZxLolu8xe1v8zOdAbQqPfXHUE9GIIaagl6DTBzrfRHv+FRUC2J
 8qgiZaBQ==;
Received: from 213-225-8-167.nat.highway.a1.net ([213.225.8.167]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ouFxe-00CLVn-GW; Sun, 13 Nov 2022 16:35:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Wenjia Zhang <wenjia@linux.ibm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Russell King <linux@armlinux.org.uk>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 4/7] cnic: don't pass bogus GFP_ flags to dma_alloc_coherent
Date: Sun, 13 Nov 2022 17:35:32 +0100
Message-Id: <20221113163535.884299-5-hch@lst.de>
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

dma_alloc_coherent is an opaque allocator that only uses the GFP_ flags
for allocation context control.  Don't pass __GFP_COMP which makes no
sense for an allocation that can't in any way be converted to a page
pointer.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/net/ethernet/broadcom/cnic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/cnic.c b/drivers/net/ethernet/broadcom/cnic.c
index 2198e35d9e181..ad74b488a80ab 100644
--- a/drivers/net/ethernet/broadcom/cnic.c
+++ b/drivers/net/ethernet/broadcom/cnic.c
@@ -1027,16 +1027,14 @@ static int __cnic_alloc_uio_rings(struct cnic_uio_dev *udev, int pages)
 
 	udev->l2_ring_size = pages * CNIC_PAGE_SIZE;
 	udev->l2_ring = dma_alloc_coherent(&udev->pdev->dev, udev->l2_ring_size,
-					   &udev->l2_ring_map,
-					   GFP_KERNEL | __GFP_COMP);
+					   &udev->l2_ring_map, GFP_KERNEL);
 	if (!udev->l2_ring)
 		return -ENOMEM;
 
 	udev->l2_buf_size = (cp->l2_rx_ring_size + 1) * cp->l2_single_buf_size;
 	udev->l2_buf_size = CNIC_PAGE_ALIGN(udev->l2_buf_size);
 	udev->l2_buf = dma_alloc_coherent(&udev->pdev->dev, udev->l2_buf_size,
-					  &udev->l2_buf_map,
-					  GFP_KERNEL | __GFP_COMP);
+					  &udev->l2_buf_map, GFP_KERNEL);
 	if (!udev->l2_buf) {
 		__cnic_free_uio_rings(udev);
 		return -ENOMEM;
-- 
2.30.2

