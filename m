Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D5E26A93E
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 18:00:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C554168E;
	Tue, 15 Sep 2020 17:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C554168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600185614;
	bh=9WXNHzNbMhqvcp0G8V0avlPjmDUNcNpxr13nt7ccp5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mbpP22Cmyh6z8hE9OKxv3dJPLNtMo8PzDk9ylfy/iouMpQKJ1KB2izFXCDLayrgE/
	 HA4KeFSYqE+4ZOhuzwHs3GkH1Jr6GIa2ByjQGJxc+7wjn7zA4L7pRpuPWaphiTsKVS
	 vmS1o9JkZvvh38/IlTikU969xlpGmHvJx30SpTGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 415BFF80276;
	Tue, 15 Sep 2020 17:58:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29683F80212; Tue, 15 Sep 2020 17:58:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95FDEF80146
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 17:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95FDEF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="t6Ws/MdH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=yG7qWXKBUIxg7RQ3+cci8dpYxavPbFHR4ZLuySoica4=; b=t6Ws/MdHdLJs2XLcTrYc7bL7HB
 OLZi/bOn/73POpUaXeC1ed/v/kFUkUxTJLfl12YpD3qYAUQgZ6kE65MhsxkCerZanCvd5xJnuGXVP
 d5yX2p/2ZLmheiBRRktpBIy42haP2KLL/hBmeEjfStYgrd/sIfatnvsRXhMp4FwqBhDQMDuNFuNKw
 ggXRbUlyeGOFi0hj24V+mj/JOjuhyPv5M7pE9Hr+ZE+yckaVWBw+/BC1uJFrpcacKnyKov8pttEEa
 4VtqRW2WqCleQn5wsPxUOKeUxILx3bToavJ30o/oJgwoHWUbYxQ3FkO2BPGoJpzxcsEw/syGg3B+W
 Btf+oB9g==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDLA-0003bv-2A; Tue, 15 Sep 2020 15:57:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 02/18] mm: turn alloc_pages into an inline function
Date: Tue, 15 Sep 2020 17:51:06 +0200
Message-Id: <20200915155122.1768241-3-hch@lst.de>
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

To prevent a compiler error when a method call alloc_pages is
added (which I plan to for the dma_map_ops).

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/gfp.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 67a0774e080b98..dd2577c5407112 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -550,8 +550,10 @@ extern struct page *alloc_pages_vma(gfp_t gfp_mask, int order,
 #define alloc_hugepage_vma(gfp_mask, vma, addr, order) \
 	alloc_pages_vma(gfp_mask, order, vma, addr, numa_node_id(), true)
 #else
-#define alloc_pages(gfp_mask, order) \
-		alloc_pages_node(numa_node_id(), gfp_mask, order)
+static inline struct page *alloc_pages(gfp_t gfp_mask, unsigned int order)
+{
+	return alloc_pages_node(numa_node_id(), gfp_mask, order);
+}
 #define alloc_pages_vma(gfp_mask, order, vma, addr, node, false)\
 	alloc_pages(gfp_mask, order)
 #define alloc_hugepage_vma(gfp_mask, vma, addr, order) \
-- 
2.28.0

