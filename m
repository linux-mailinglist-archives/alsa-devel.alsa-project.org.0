Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 472AA5347FC
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 03:18:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDD55167E;
	Thu, 26 May 2022 03:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDD55167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653527889;
	bh=nvIw2yvXAXp9LLolLyLCoYZhIE01Syu84FDSMVeY+fY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xm+h7U9VOdEcnYFOouaTWt8IPHQApWfmNd9BM01KNogyHCCoMt88IcHpHrJ2KqvKm
	 dNKZSeezh4qgKc6wzl7axF1BCKfDdNQtbwOQ0HyEW0zegPKD4trD0KKO9ajsB6oeU/
	 nLZx4WsjT/W5aZijRHejGAOMLhJ/Hj1bJ0uWvvZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 495EEF801EC;
	Thu, 26 May 2022 03:17:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9EE7F8016D; Thu, 26 May 2022 03:17:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 542AAF800D0
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 03:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 542AAF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="FU/B4l/8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qYg8IKyL/r8f2Vg1ESuYjuOnE5g2jafpU06hhSyNUpw=; b=FU/B4l/86GX2mfAVzdnOZlet7o
 4YIMhkZpbCoSmgTvSZ+0srZ6BwOG40pWCCMj19qhaZ7LyhuSaw2+YdDV5a6+88avQFq2cWdQHfPWr
 byuXc0vT/MGU7fDuPvzVefIP3U6jrYIpaAmCNdJioEzp88SsKae4gtRxxjsbwJwKjR30fWyrk6jS+
 6N+w+qBIVJaEKMA2SIN/QJXQZdAFNIwoALKz9JWYzo9WKGMkqQ+rWdT359dIGkZ8Sy1ZcS2tNgQxZ
 uFqnsZqHJyvAVlUVWnv0GfWFHqg8A7Yfpa485ULCi1tDMGcQd2T2bgnhjP4//0FFa8Q9P8q43x6cS
 bXqNJBtA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nu278-000pxs-VA; Thu, 26 May 2022 01:16:35 +0000
Date: Thu, 26 May 2022 02:16:34 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
Message-ID: <Yo7U8kglHlcvQ0Ri@casper.infradead.org>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
 <20220525145056.953631743a4c494aabf000dc@linux-foundation.org>
 <F0E25DFF-8256-48FF-8B88-C0E3730A3E5E@jrtc27.com>
 <20220525152006.e87d3fa50aca58fdc1b43b6a@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525152006.e87d3fa50aca58fdc1b43b6a@linux-foundation.org>
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 kvm@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 Jessica Clarke <jrtc27@jrtc27.com>, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-parport@lists.infradead.org
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

On Wed, May 25, 2022 at 03:20:06PM -0700, Andrew Morton wrote:
> On Wed, 25 May 2022 23:07:35 +0100 Jessica Clarke <jrtc27@jrtc27.com> wrote:
> 
> > This is i386, so an unsigned long is 32-bit, but i_blocks is a blkcnt_t
> > i.e. a u64, which makes the shift without a cast of the LHS fishy.
> 
> Ah, of course, thanks.  I remember 32 bits ;)
> 
> --- a/mm/shmem.c~mm-shmemc-suppress-shift-warning
> +++ a/mm/shmem.c
> @@ -1945,7 +1945,7 @@ alloc_nohuge:
>  
>  	spin_lock_irq(&info->lock);
>  	info->alloced += folio_nr_pages(folio);
> -	inode->i_blocks += BLOCKS_PER_PAGE << folio_order(folio);
> +	inode->i_blocks += (blkcnt_t)BLOCKS_PER_PAGE << folio_order(folio);

Bizarre this started showing up now.  The recent patch was:

-       info->alloced += compound_nr(page);
-       inode->i_blocks += BLOCKS_PER_PAGE << compound_order(page);
+       info->alloced += folio_nr_pages(folio);
+       inode->i_blocks += BLOCKS_PER_PAGE << folio_order(folio);

so it could tell that compound_order() was small, but folio_order()
might be large?

Silencing the warning is a good thing, but folio_order() can (at the
moment) be at most 9 on i386, so it isn't actually going to be
larger than 4096.
