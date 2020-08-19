Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D722495E7
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 08:59:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBE541810;
	Wed, 19 Aug 2020 08:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBE541810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597820398;
	bh=9WXNHzNbMhqvcp0G8V0avlPjmDUNcNpxr13nt7ccp5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hxkn1mlDzAFtRaUT/F/eR2xSmgbIJ71sZk+tNs8p+1noPdwbvLP9lyRjBVpxOS0mG
	 nQ1CrrKU8Xckai9QfK6Sgq14USdRKKSjDc+QBfSkZXfL9hw1NTHji9cBNh3TWJrAPV
	 QLMfbeYnr+LeUGidx/4l4aCwLiy3f2m3fQgYvA/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CD28F802DB;
	Wed, 19 Aug 2020 08:56:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 554E7F8028F; Wed, 19 Aug 2020 08:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABDB6F80218
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 08:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABDB6F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="QIUBzW0L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=yG7qWXKBUIxg7RQ3+cci8dpYxavPbFHR4ZLuySoica4=; b=QIUBzW0L+6A9SSAc6/gO+tDQ+b
 OxXtbUbEFqlmm0USEC/IXSplued4C+C6F0ZF30aKjG8eHH9Hw09fN5oDweD3DjZhb8ZVyBa3oNCMt
 gHqvdLdvetFUsHVA2naOyxN49WiwYumPj0OJ9vWKMBhULQu9DljH3ttkuIFc8Xzwt6Kk9NdAWGMVc
 M/hFcqjB5X000cNsrLFGiT0ucDiSShmdbC+Iz8B0HGkVX82jI1lTPPtC7Yho4FRHWN0jDXHB+oQYg
 jtcO/Q7MNp4OEwi61wxBreFz6GJBwroT31V+Pbx43dXQbOQjKpB13S5G4CjWrDHb//3KK5l+B0jlz
 QH4CysFQ==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I0s-0008Kv-H4; Wed, 19 Aug 2020 06:55:58 +0000
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
Subject: [PATCH 01/28] mm: turn alloc_pages into an inline function
Date: Wed, 19 Aug 2020 08:55:28 +0200
Message-Id: <20200819065555.1802761-2-hch@lst.de>
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

