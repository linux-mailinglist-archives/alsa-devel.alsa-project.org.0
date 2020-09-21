Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C6B271AFC
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 08:38:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A6C81683;
	Mon, 21 Sep 2020 08:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A6C81683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600670302;
	bh=Yy3GQXBHl52wq/QFPOXp8NYbK0Acy8y3ly46W8hh1+8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HQsGbMnJ+bCW94M9qOQICBs8fXbr9ymU93nUMjjzdoBhUK2ro5TvVmIw4z3zOpJlX
	 v1ZiAKzUV+g3hhfjoAHClWlUa+8mLedqNBYS92dkv1Y0j2HuOHll56otF5TBxifpZJ
	 3d01fit5MZNZQDByNYe4nA8QgqXGHDtDhIbhB4HE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22655F80161;
	Mon, 21 Sep 2020 08:36:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0DEEF80162; Mon, 21 Sep 2020 08:36:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39E64F8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 08:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39E64F8010A
Received: by verein.lst.de (Postfix, from userid 2407)
 id B25CE68AFE; Mon, 21 Sep 2020 08:36:28 +0200 (CEST)
Date: Mon, 21 Sep 2020 08:36:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: Re: a saner API for allocating DMA addressable pages v3
Message-ID: <20200921063628.GB18349@lst.de>
References: <20200915155122.1768241-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915155122.1768241-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
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

Any comments?

Thomas: this should be identical to the git tree I gave you for mips
testing, and you add your tested-by (and reviewd-by tags where
applicable)?

Helge: for parisc this should effectively be the same as the first
version, but I've dropped the tested-by tags due to the reshuffle,
and chance you could retest it?

On Tue, Sep 15, 2020 at 05:51:04PM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this series replaced the DMA_ATTR_NON_CONSISTENT flag to dma_alloc_attrs
> with a separate new dma_alloc_pages API, which is available on all
> platforms.  In addition to cleaning up the convoluted code path, this
> ensures that other drivers that have asked for better support for
> non-coherent DMA to pages with incurring bounce buffering over can finally
> be properly supported.
> 
> As a follow up I plan to move the implementation of the
> DMA_ATTR_NO_KERNEL_MAPPING flag over to this framework as well, given
> that is also is a fundamentally non coherent allocation.  The replacement
> for that flag would then return a struct page, as it is allowed to
> actually return pages without a kernel mapping as the name suggested
> (although most of the time they will actually have a kernel mapping..)
> 
> In addition to the conversions of the existing non-coherent DMA users,
> I've also added a patch to convert the firewire ohci driver to use
> the new dma_alloc_pages API.
> 
> The first patch is queued up for 5.9 in the media tree, but included here
> for completeness.
> 
> 
> A git tree is available here:
> 
>     git://git.infradead.org/users/hch/misc.git dma_alloc_pages
> 
> Gitweb:
> 
>     http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma_alloc_pages
> 
> 
> Changes since v2:
>  - fix up the patch reshuffle which wasn't quite correct
>  - fix up a few commit messages
> 
> Changes since v1:
>  - rebased on the latests dma-mapping tree, which merged many of the
>    cleanups
>  - fix an argument passing typo in 53c700, caught by sparse
>  - rename a few macro arguments in 53c700
>  - pass the right device to the DMA API in the lib82596 drivers
>  - fix memory ownershiptransfers in sgiseeq
>  - better document what a page in the direct kernel mapping means
>  - split into dma_alloc_pages that returns a struct page and is in the
>    direct mapping vs dma_alloc_noncoherent that can be vmapped
>  - conver the firewire ohci driver to dma_alloc_pages
> 
> Diffstat:
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
---end quoted text---
