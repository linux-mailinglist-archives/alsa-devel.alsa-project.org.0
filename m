Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED82268FDE
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 17:28:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A96F216C8;
	Mon, 14 Sep 2020 17:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A96F216C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600097319;
	bh=+fuKzsdD6GGAWfgaunNdIsI1FDobsMLAJmSSvG7gzGU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EbuCrfa8cfuDI5GfhRCoI8rDAlLc+tZxRzW2LtaaBib5FqPIpSPnXG67Y9FWEbjze
	 /8XPyNpgW8jOibDBiPALLADUQjYOlXTYARkcHa9/CvuJVrUkiGnU2KeS/2B95ODnd/
	 ybKZIX8vpcm95dDacoQSu+HZ7hFK+wlCz0rKuci8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6515EF8015C;
	Mon, 14 Sep 2020 17:26:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45098F8015A; Mon, 14 Sep 2020 17:26:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7047F80105
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 17:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7047F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="M80c+D3B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7O2Rc307Jq8KkaDn7zbVItvtt/ecHc/too3yP9zxMNw=; b=M80c+D3BqJySppi+H3eNYCcnH/
 gkfi1LX5tkOxqiYr7vGlDhimfScWmyFoD4H7IZc29yxj59fxiZw4CTf73qE/Frs6kv2D1VP9Z0cDk
 mxHwC6y23VXZp0GWVeuCJj/TuYsYfRbshYeLxTfn4NkxNbZt/mCYZDG48aAzhZnPSD26Tjx+8/mwu
 2BX9yzKsoQKr11uV/Bwnigc9od3UdV8s2rG69+T+l2QU+9l3XPVzWYgBbLqR3TeV+3H8nv+hHYZRQ
 AbZDHlAxP767K2OWIVLYATsG32mlziFsc93sPs4pmGxH1oa7RFwa/hq19KGZWcLA7yuKXtQ9v35Ul
 oAwe3FdQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kHqN0-0004bK-27; Mon, 14 Sep 2020 15:26:18 +0000
Date: Mon, 14 Sep 2020 16:26:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: a saner API for allocating DMA addressable pages v2
Message-ID: <20200914152617.GR6583@casper.infradead.org>
References: <20200914144433.1622958-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914144433.1622958-1-hch@lst.de>
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Mon, Sep 14, 2020 at 04:44:16PM +0200, Christoph Hellwig wrote:
> I'm still a little unsure about the API naming, as alloc_pages sort of
> implies a struct page return value, but we return a kernel virtual
> address.

Erm ... dma_alloc_pages() returns a struct page, so is this sentence
stale?

From patch 14:

+struct page *dma_alloc_pages(struct device *dev, size_t size,
+               dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);

> The other alternative would be to name the API
> dma_alloc_noncoherent, but the whole non-coherent naming seems to put
> people off.

You say that like it's a bad thing.  I think the problem is more that
people don't understand what non-coherent means and think they're
supporting it when they're not.

dma_alloc_manual_flushing()?

> As a follow up I plan to move the implementation of the
> DMA_ATTR_NO_KERNEL_MAPPING flag over to this framework as well, given
> that is also is a fundamentally non coherent allocation.  The replacement
> for that flag would then return a struct page, as it is allowed to
> actually return pages without a kernel mapping as the name suggested
> (although most of the time they will actually have a kernel mapping..)

If the page doesn't have a kernel mapping, shouldn't it return a PFN
or a phys_addr?

