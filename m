Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E6424D020
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:58:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57661169D;
	Fri, 21 Aug 2020 09:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57661169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597996685;
	bh=HsdC05tHbQtbgMyyH3TU3PqPF+I7OxbNIZUVUGQfojQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ECbDoUHxfxraWAFmvpam7ZIALgi5ILh4gyE9hMNIOgMGznEYuuOUO/n6kxyWu7WTW
	 PYwPnEmbGWF9C6aA64spKxOJFuWaKYIL7LW6ObAn7hQqUxFz26tqLmJLcxy5zi3wIH
	 x4Atz3wq7B8Jx1z00KHBeY/HtiRR8t+7L9J2W0T8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12AD5F8049B;
	Fri, 21 Aug 2020 09:36:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A0B0F80228; Thu, 20 Aug 2020 06:52:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30DEAF80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 06:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30DEAF80114
Received: by verein.lst.de (Postfix, from userid 2407)
 id 690FB68BEB; Thu, 20 Aug 2020 06:52:01 +0200 (CEST)
Date: Thu, 20 Aug 2020 06:52:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
Message-ID: <20200820045201.GB4570@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com>
 <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
 <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com>
 <CAAFQd5DrEq7UVi_aH=-DO4xYC3SbjJ3m1aQSbt=8THL-W+orMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5DrEq7UVi_aH=-DO4xYC3SbjJ3m1aQSbt=8THL-W+orMQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Fri, 21 Aug 2020 09:36:15 +0200
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Robin Murphy <robin.murphy@arm.com>
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

On Wed, Aug 19, 2020 at 04:22:29PM +0200, Tomasz Figa wrote:
> > > FWIW, I asked back in time what the plan is for non-coherent
> > > allocations and it seemed like DMA_ATTR_NON_CONSISTENT and
> > > dma_sync_*() was supposed to be the right thing to go with. [2] The
> > > same thread also explains why dma_alloc_pages() isn't suitable for the
> > > users of dma_alloc_attrs() and DMA_ATTR_NON_CONSISTENT.
> >
> > AFAICS even back then Christoph was implying getting rid of
> > NON_CONSISTENT and *replacing* it with something streaming-API-based -
> 
> That's not how I read his reply from the thread I pointed to, but that
> might of course be my misunderstanding.

Yes.  Without changes like in this series just calling dma_sync_single_*
will break in various cases, e.g. because dma_alloc_attrs returns
memory remapped in the vmalloc space, and the dma_sync_single_*
implementation implementation can't cope with vmalloc addresses.
