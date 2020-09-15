Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A0026A92B
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 17:56:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2A681680;
	Tue, 15 Sep 2020 17:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2A681680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600185372;
	bh=9sbNUI8QMoKHeQzaDIvGyE4ld0mzTxPOciQ6zHPc+2c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u1HYx0ykcXqQsdU2Eft7W666OFrYwXNk5aOqrpskVHzOYI5L12Agr2nj7YVHpa2Ht
	 pDNaI9mPiNvCLTt5rNlvhfoqHXN6HIh0hwf1gsi4QWKnBLbYLVw9OGDVsJd2GOPGWx
	 IsUSRwVWE1TB4PrjLkY7J6noVLryVCc0AVBCkzsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03C77F800F1;
	Tue, 15 Sep 2020 17:54:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37C94F80212; Tue, 15 Sep 2020 17:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5EB6F800F1
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 17:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5EB6F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="oc+kgjLw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=2UlbGdiZDTOnbAr3xs1aHbeR9XTzI0Lit7D+l7hf2I4=; b=oc+kgjLwN6z7KfpzJBCa7G7OBj
 xMg3Fwxams8c4EpKokR8UZQx2ybyjDj6drc+aW/2LIv1O+PR2BmjXm+WhI4RUptwlI8TGWRoAeWLn
 tDzzTX6C7Wcaz+wjCgZzqB/SScThzcLyj8JgUrilV2pjnlwL2WrjnmkdPgkjiBopQKBs17NlwGyrT
 ONpkConNykQRC+jrpDpmqw3ajb1dphcelbcTILjH85oTRbiw7nNGsu7203+03im4y0uv272kq3shG
 s0VEBKB5Z/ya3O5D9oa/TJdMgnhrtizoC8G9P+/zAzkC5+arP3EQvUavmCF3BtD/B11AifbDQWTH6
 Z2mcOZcw==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDGv-0003AQ-TI; Tue, 15 Sep 2020 15:53:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: a saner API for allocating DMA addressable pages v3
Date: Tue, 15 Sep 2020 17:51:04 +0200
Message-Id: <20200915155122.1768241-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
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

Hi all,

this series replaced the DMA_ATTR_NON_CONSISTENT flag to dma_alloc_attrs
with a separate new dma_alloc_pages API, which is available on all
platforms.  In addition to cleaning up the convoluted code path, this
ensures that other drivers that have asked for better support for
non-coherent DMA to pages with incurring bounce buffering over can finally
be properly supported.

As a follow up I plan to move the implementation of the
DMA_ATTR_NO_KERNEL_MAPPING flag over to this framework as well, given
that is also is a fundamentally non coherent allocation.  The replacement
for that flag would then return a struct page, as it is allowed to
actually return pages without a kernel mapping as the name suggested
(although most of the time they will actually have a kernel mapping..)

In addition to the conversions of the existing non-coherent DMA users,
I've also added a patch to convert the firewire ohci driver to use
the new dma_alloc_pages API.

The first patch is queued up for 5.9 in the media tree, but included here
for completeness.


A git tree is available here:

    git://git.infradead.org/users/hch/misc.git dma_alloc_pages

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma_alloc_pages


Changes since v2:
 - fix up the patch reshuffle which wasn't quite correct
 - fix up a few commit messages

Changes since v1:
 - rebased on the latests dma-mapping tree, which merged many of the
   cleanups
 - fix an argument passing typo in 53c700, caught by sparse
 - rename a few macro arguments in 53c700
 - pass the right device to the DMA API in the lib82596 drivers
 - fix memory ownershiptransfers in sgiseeq
 - better document what a page in the direct kernel mapping means
 - split into dma_alloc_pages that returns a struct page and is in the
   direct mapping vs dma_alloc_noncoherent that can be vmapped
 - conver the firewire ohci driver to dma_alloc_pages

Diffstat:
