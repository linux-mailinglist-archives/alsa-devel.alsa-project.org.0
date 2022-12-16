Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A208164E762
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 07:47:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17628175E;
	Fri, 16 Dec 2022 07:47:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17628175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671173279;
	bh=IgG9+45/iTCOb24FVIEn0dt+X2X0qnOOwzl2uKPITdc=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tAqLau7/rdXjmGVJZeWQS5y1BZwJHjNaJ3Tzj2p++8NB/JurkRyJyQRadmQnS7c5K
	 dHSmEEiuQ4ZdbB/scl0vRPsU0BDKBLmrpCp957imXSBh/n+iGTFhE/rLyK5t98yEzN
	 5Z2qgdpiLgjg15U/+1xwOGCG1Zy8HzaUzgqhMA6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91D45F804CB;
	Fri, 16 Dec 2022 07:47:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6C45F804E2; Fri, 16 Dec 2022 07:46:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DE31F804D0
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 07:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DE31F804D0
Received: by verein.lst.de (Postfix, from userid 2407)
 id A8D8E68AA6; Fri, 16 Dec 2022 07:46:45 +0100 (CET)
Date: Fri, 16 Dec 2022 07:46:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [6.2][regression] after commit
 ffcb754584603adf7039d7972564fbf6febdc542 all sound devices
 disappeared (due BUG at mm/page_alloc.c:3592!)
Message-ID: <20221216064645.GA24446@lst.de>
References: <CABXGCsPnpu0TGHnvXM1we7q1t3tJAOYW2rA=AMvf7ZahcYvpRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXGCsPnpu0TGHnvXM1we7q1t3tJAOYW2rA=AMvf7ZahcYvpRQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, hch@lst.de,
 m.szyprowski@samsung.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Ok, it seems like the sound noncontig alloc code that I already
commented on as potentially bogus GFP_GOMP mapping trips this.  I think
for now the right thing would be to revert the hunk in dma-iommu.c
(see patch below).  The other thing to try would be to remove both
uses GFP_COMP in sound/core/memalloc.c, which should have the same
effect.

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 9297b741f5e80e..f798c44e090337 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -744,9 +744,6 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
 	/* IOMMU can map any pages, so himem can also be used here */
 	gfp |= __GFP_NOWARN | __GFP_HIGHMEM;
 
-	/* It makes no sense to muck about with huge pages */
-	gfp &= ~__GFP_COMP;
-
 	while (count) {
 		struct page *page = NULL;
 		unsigned int order_size;
