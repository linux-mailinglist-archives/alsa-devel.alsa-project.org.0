Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E8E651C42
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 09:22:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B07F02418;
	Tue, 20 Dec 2022 09:21:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B07F02418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671524536;
	bh=SANHKh3TzoKuEuZH5dOy28cmtrxG56qHODuKENvW5v4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rYVu75uCX1aHZ5HKO7f6xu4ZsmEjRoOl86b05OP0AYvdN9mP1/fCITz9ldg1JEHNK
	 hvYncbbfuJFfLEIiMCS1Sb50Mp4NFYdL2ctNElUE8agMkXD4iVOUjt3gtYntn94GVB
	 LaRZhwu2prnHTsuu99Boj+PJmUSHI9jg5ho6EVnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A905F8052F;
	Tue, 20 Dec 2022 09:20:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49830F8032B; Tue, 20 Dec 2022 09:20:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99E27F8018A
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 09:20:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99E27F8018A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=hvoB7RCr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=cA0uvbQLIkf8Hh0wtILMN1D9yegrDmrjgvNGFHvuKz0=; b=hvoB7RCrA4P6IviJWysH9ahDds
 Lvb0cOoelZXw0CLXWCB4GmV7Hir+3IeQHy0cy8aRtaD9JyME+M8nu4ZZIJzJkkXHIxwbkLi8om2Qj
 g96u0rWaW5lz6Lrokfxyu2H3e/0GcdZ6dJKK74j0Co8wqgUphmiykGhQhGw9jVAAdJRDicqGKorKP
 RleDQOyTAoeWj4ZD9uE9DgiW9VMCf94c0O+SPmUthe0eMAIBSm8v18ThWAglClWY0ji1JW48ljBI9
 fUpAbzxG9ZSeAT0iunNd28UzBLYUbaAMudaT29y9WsF2AanC+apl7k1K0YTeew2jtXphgLNwsAThg
 WWHpbgAg==;
Received: from [2001:4bb8:199:7829:c604:55b0:ed6a:61ce] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p7XrG-00BuLq-03; Tue, 20 Dec 2022 08:20:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Subject: [PATCH 2/2] dma-mapping: reject GFP_COMP for noncohernt allocaions
Date: Tue, 20 Dec 2022 09:20:09 +0100
Message-Id: <20221220082009.569785-3-hch@lst.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221220082009.569785-1-hch@lst.de>
References: <20221220082009.569785-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

While not quite as bogus as for the dma-coherent allocations that were
fixed earlier, GFP_COMP for these allocations has no benefits for
the dma-direct case, and can't be supported at all by dma dma-iommu
backend which splits up allocations into smaller orders.  Due to an
oversight in ffcb75458460 that flag stopped being cleared for all
dma allocations, but only got rejected for coherent ones, so fix up
these callers to not allow __GFP_COMP as well after the sound code
has been fixed to not ask for it.

Fixes: ffcb75458460 ("dma-mapping: reject __GFP_COMP in dma_alloc_attrs")
Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Reported-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/mapping.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index c026a5a5e0466e..68106e3791f6c3 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -560,6 +560,8 @@ static struct page *__dma_alloc_pages(struct device *dev, size_t size,
 		return NULL;
 	if (WARN_ON_ONCE(gfp & (__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM)))
 		return NULL;
+	if (WARN_ON_ONCE(gfp & __GFP_COMP))
+		return NULL;
 
 	size = PAGE_ALIGN(size);
 	if (dma_alloc_direct(dev, ops))
@@ -645,6 +647,8 @@ struct sg_table *dma_alloc_noncontiguous(struct device *dev, size_t size,
 
 	if (WARN_ON_ONCE(attrs & ~DMA_ATTR_ALLOC_SINGLE_PAGES))
 		return NULL;
+	if (WARN_ON_ONCE(gfp & __GFP_COMP))
+		return NULL;
 
 	if (ops && ops->alloc_noncontiguous)
 		sgt = ops->alloc_noncontiguous(dev, size, dir, gfp, attrs);
-- 
2.35.1

