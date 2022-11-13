Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3EE6270C8
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Nov 2022 17:38:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED15D1692;
	Sun, 13 Nov 2022 17:38:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED15D1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668357534;
	bh=OTezillKlcB8Vkuqw7RZFvHMUUqnzBvpbPLO+38ltrU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tf0zKR3ZnK+SuTJ9nP4URYCOBBlIY0Pg990D33nqOUZuxz8lOXzNQbGBLXuIsdGpU
	 r9vE9nufsiDaoWouO0Vhleq1SVve/bbtg706shcDwSurdn0iqaoZ4G8IhgaNDepkaf
	 jQ/g8ZhNw0A4ofaAhxrxJYPtS8A1su4ltOfwwObU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7335F8056F;
	Sun, 13 Nov 2022 17:36:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FA10F8057F; Sun, 13 Nov 2022 17:36:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A9C2F8056F
 for <alsa-devel@alsa-project.org>; Sun, 13 Nov 2022 17:36:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A9C2F8056F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="gBRLp/Wq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FrKTW2jC/YO2/WPGYjBN4j0fLdu07wAq+vKIs1aTDt0=; b=gBRLp/Wqhnjj7vSyEDOzq1Ylp/
 6Tf29mv6KdGs4oNOLvYvc+/P60fwD/5ZTPU1/lbVLUsLtkJHRo+qtCUeCUVDGDwzhgNISfn0/6nLO
 X3FJ9CEAE8Cr1sflf5EKKHZzHKr8gSwKQbSij8Ga6biPZMe9g2nOdftFxwZ4W9Os6Bg/9VkG2urxB
 jHSeUJFjQt3sIRtU+TQN9owu8fgaAS4h7UrV/RvQuyO4+qYsqpKmWMw9vuOP0VcFh6W1TLNlHZ9pa
 N3pPIyId+IGhiNqGFElCB72ffRIGv8YFFQCvUdzCuJhCXItuM/3LKuzCbFOxiD36TC3p36SrAUCVE
 itKktNFA==;
Received: from 213-225-8-167.nat.highway.a1.net ([213.225.8.167]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ouFxn-00CLab-8i; Sun, 13 Nov 2022 16:36:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Wenjia Zhang <wenjia@linux.ibm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Russell King <linux@armlinux.org.uk>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 6/7] ALSA: memalloc: don't pass bogus GFP_ flags to dma_alloc_*
Date: Sun, 13 Nov 2022 17:35:34 +0100
Message-Id: <20221113163535.884299-7-hch@lst.de>
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

dma_alloc_coherent/dma_alloc_wc is an opaque allocator that only uses
the GFP_ flags for allocation context control.  Don't pass __GFP_COMP
which makes no sense for an allocation that can't in any way be
converted to a page pointer.

Note that for dma_alloc_noncoherent and dma_alloc_noncontigous in
combination with the DMA mmap helpers __GFP_COMP looks sketchy as well,
so I would suggest to drop that as well after a careful audit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 sound/core/memalloc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 03cffe7713667..fe03cf796e8bb 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -20,7 +20,6 @@
 
 #define DEFAULT_GFP \
 	(GFP_KERNEL | \
-	 __GFP_COMP |    /* compound page lets parts be mapped */ \
 	 __GFP_RETRY_MAYFAIL | /* don't trigger OOM-killer */ \
 	 __GFP_NOWARN)   /* no stack trace print - this call is non-critical */
 
@@ -542,7 +541,7 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 	void *p;
 
 	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
-				      DEFAULT_GFP, 0);
+				      DEFAULT_GFP | __GFP_COMP, 0);
 	if (!sgt) {
 #ifdef CONFIG_SND_DMA_SGBUF
 		if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
@@ -810,7 +809,7 @@ static void *snd_dma_noncoherent_alloc(struct snd_dma_buffer *dmab, size_t size)
 	void *p;
 
 	p = dma_alloc_noncoherent(dmab->dev.dev, size, &dmab->addr,
-				  dmab->dev.dir, DEFAULT_GFP);
+				  dmab->dev.dir, DEFAULT_GFP | __GFP_COMP);
 	if (p)
 		dmab->dev.need_sync = dma_need_sync(dmab->dev.dev, dmab->addr);
 	return p;
-- 
2.30.2

