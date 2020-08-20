Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DEA24AE58
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 07:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF746167D;
	Thu, 20 Aug 2020 07:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF746167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597900626;
	bh=oM2b0m8qtPYoI+q1QGUr+uiwv1PyvIGFKoJQxzyxVlU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rXwDJuUi0StIxImypgVebsw2Uh5zvPpVEyZpyNmb7jbMyeu3jTu5ETT7KL2aI/Iwc
	 vAdTTtH+VHtQSGkTY66PVFtU2dqGN+An0w6sNkrc7mxt7O4IUMRlpCoNyzpdg4gcDu
	 +80QBh5bUewWlA3E5TQL+k0UAnaa6hY+WlAU3+9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 036CBF80114;
	Thu, 20 Aug 2020 07:15:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA374F80228; Thu, 20 Aug 2020 07:15:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E2E8F80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 07:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E2E8F80114
Received: by verein.lst.de (Postfix, from userid 2407)
 id A894C68BEB; Thu, 20 Aug 2020 07:15:12 +0200 (CEST)
Date: Thu, 20 Aug 2020 07:15:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH 19/28] dma-mapping: replace DMA_ATTR_NON_CONSISTENT
 with dma_{alloc, free}_pages
Message-ID: <20200820051512.GA5141@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-20-hch@lst.de>
 <CAAFQd5Bbp-eAVKS1MKS8xtrT4ZoOmBPfZyw9mys=eOmDb6r8Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5Bbp-eAVKS1MKS8xtrT4ZoOmBPfZyw9mys=eOmDb6r8Lw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>
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

On Wed, Aug 19, 2020 at 05:03:52PM +0200, Tomasz Figa wrote:
> >
> > -Warning: These pieces of the DMA API should not be used in the
> > -majority of cases, since they cater for unlikely corner cases that
> > -don't belong in usual drivers.
> > +These APIs allow to allocate pages that can be used like normal pages
> > +in the kernel direct mapping, but are guaranteed to be DMA addressable.
> 
> Could we elaborate a bit more on what "like normal pages in kernel
> direct mapping" mean from the driver perspective?

It mostly means you can call virt_to_page and then do anything you'd
do with a page struct.  Unlike dma_alloc_attrs that just return an
opaque virtual address that the caller is not allowed to poke into.

> There is one aspect that the existing dma_alloc_attrs() handles, but
> this new function doesn't: IOMMU support. The function will always
> allocate a physically-contiguous block memory, which is a costly
> operation and not even guaranteed to succeed, even if enough free
> memory is available.
> 
> Modern SoCs employ IOMMUs to avoid the need to allocate
> physically-contiguous memory and those happen to be also the devices
> that could benefit from non-coherent allocations a lot. One of the
> tasks of the DMA API was making it possible to allocate suitable
> memory for a given device, without having the driver know about the
> SoC integration details, such as the presence of an IOMMU.

This is completely out of scope for this API exactly because it
guarantees a page in the direct mapping.  But see my previous mail
in reply to Robin on how you can implement the funtionality you
want right now without any help from the dma-mapping subsystem.
