Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C0B269EAD
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 08:38:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A39D41683;
	Tue, 15 Sep 2020 08:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A39D41683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600151893;
	bh=J5/pXeI6U7hyoZtAFY/YjKsWVVrZ0oM4sEqSQ8AcGHM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FaCIW75Dseh2yc9Nq8WNYiZUT3BgmEGLNZitRqrEG3wP79deCBLtCdD4mcMGKYZeM
	 CVteuXMFAOpZkJFB8vI3b6muH/BoqkvomJwF1Aego2kDS7ZRwbnpZqSB1D/Ci3GPfz
	 JRfZ+PJCCjxpWYbajYXfLyry0g7sxWONePGjDaMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B95DEF80276;
	Tue, 15 Sep 2020 08:36:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61FC8F80212; Tue, 15 Sep 2020 08:36:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C88BF80146
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 08:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C88BF80146
Received: by verein.lst.de (Postfix, from userid 2407)
 id CFEFC6736F; Tue, 15 Sep 2020 08:36:18 +0200 (CEST)
Date: Tue, 15 Sep 2020 08:36:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: a saner API for allocating DMA addressable pages v2
Message-ID: <20200915063618.GD19113@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
 <20200914152617.GR6583@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914152617.GR6583@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-scsi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Stefan Richter <stefanr@s5r6.in-berlin.de>
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

On Mon, Sep 14, 2020 at 04:26:17PM +0100, Matthew Wilcox wrote:
> On Mon, Sep 14, 2020 at 04:44:16PM +0200, Christoph Hellwig wrote:
> > I'm still a little unsure about the API naming, as alloc_pages sort of
> > implies a struct page return value, but we return a kernel virtual
> > address.
> 
> Erm ... dma_alloc_pages() returns a struct page, so is this sentence
> stale?

Yes.

> You say that like it's a bad thing.  I think the problem is more that
> people don't understand what non-coherent means and think they're
> supporting it when they're not.
> 
> dma_alloc_manual_flushing()?

That sounds pretty awkward..

> 
> > As a follow up I plan to move the implementation of the
> > DMA_ATTR_NO_KERNEL_MAPPING flag over to this framework as well, given
> > that is also is a fundamentally non coherent allocation.  The replacement
> > for that flag would then return a struct page, as it is allowed to
> > actually return pages without a kernel mapping as the name suggested
> > (although most of the time they will actually have a kernel mapping..)
> 
> If the page doesn't have a kernel mapping, shouldn't it return a PFN
> or a phys_addr?

Most APIs we'll feed it into need a struct page.  The difference is just
that it can be a highmem page.  And if we want to get fancy we could
change the kernel mapping to PROT_NONE eventually.
