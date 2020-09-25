Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99353278E11
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 18:19:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DE4318C0;
	Fri, 25 Sep 2020 18:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DE4318C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601050792;
	bh=vFkviB9I0exHFJLnfBwNaF+NkC+wu+ZyZyPUPEAFTww=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=diMeAowXuqKUATHvrhEKGwbrKrCam7/nvtOjxpyVVjloYuDAtQrIG7YCzWLUICLma
	 b98z2LMDmaH26SL9JA5j3hR6oGgH/Ch1JewopJIct8ynAqK51382KCyB94bWQQM8zp
	 JvVpJVCh12fZdLBhcnpxGhnXMRmCZUDB4dq7laJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E33FF801EC;
	Fri, 25 Sep 2020 18:18:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F16AF801EB; Fri, 25 Sep 2020 18:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FF0DF800F6
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 18:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FF0DF800F6
Received: by verein.lst.de (Postfix, from userid 2407)
 id 39A7E68AFE; Fri, 25 Sep 2020 18:17:55 +0200 (CEST)
Date: Fri, 25 Sep 2020 18:17:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 08/18] dma-mapping: add a new dma_alloc_noncoherent API
Message-ID: <20200925161754.GA18721@lst.de>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-9-hch@lst.de>
 <c8ea4023-3e19-d63b-d936-46a04f502a61@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8ea4023-3e19-d63b-d936-46a04f502a61@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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

On Fri, Sep 25, 2020 at 12:15:37PM +0100, Robin Murphy wrote:
> On 2020-09-15 16:51, Christoph Hellwig wrote:
> [...]
>> +These APIs allow to allocate pages in the kernel direct mapping that are
>> +guaranteed to be DMA addressable.  This means that unlike dma_alloc_coherent,
>> +virt_to_page can be called on the resulting address, and the resulting
>
> Nit: if we explicitly describe this as if it's a guarantee that can be 
> relied upon...
>
>> +struct page can be used for everything a struct page is suitable for.
>
> [...]
>> +This routine allocates a region of <size> bytes of consistent memory.  It
>> +returns a pointer to the allocated region (in the processor's virtual address
>> +space) or NULL if the allocation failed.  The returned memory may or may not
>> +be in the kernels direct mapping.  Drivers must not call virt_to_page on
>> +the returned memory region.
>
> ...then forbid this document's target audience from relying on it, 
> something seems off. At the very least it's unhelpfully unclear :/
>
> Given patch #17, I suspect that the first paragraph is the one that's no 
> longer true.

Yes.  dma_alloc_pages is the replacement for allocations that need the
direct mapping.  I'll send a patch to document dma_alloc_pages and
fixes this up
