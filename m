Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2E85350A4
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 16:30:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3412A16CB;
	Thu, 26 May 2022 16:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3412A16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653575401;
	bh=8oG6z05kpG+yb18O39fh8Dig1AjcSCAB0tx/+alI/q4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lXxebIArp7QjQTJQ/rNa2R3fiSpX3lqGQcrKiJZePfhlgakoiWybXFOI/UoV7Kkyi
	 D++f+VFBLCukJO63hmX3PXyJv5Sw6kgDCbHvt2DBIas/+XdcRBxIZqOSpigM7rUQLu
	 GsJEHA+DKnolHHN5mb0715TEXzivl/008ulPi3C0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE314F800D0;
	Thu, 26 May 2022 16:29:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0304FF800D0; Thu, 26 May 2022 16:29:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91798F800D0
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 16:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91798F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="jt2D3c7x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=k7apNoi1g1YhGHKMlKvo5ejDwWGQrfqPL3Ty5xTWm5Q=; b=jt2D3c7xgVZUKhGsBafhmm2sFE
 7iHXpIRdAmkRqKCTrByt8vvIu4Y3EGktUCpnmPTFxq5LEtvIgLU7neTQ7C/IsI99LeEY7HaXKuYy7
 5ZrEicxpMCl0i/enkPZwHxhNQ3wSCLz0PWMpopuxkJst9ua3Mey2ATEpeisJ/smtNzknhVcxsQdkT
 dSKtJhfNJpH19fcWEk13NeBfTP6RD6LPE68nShdvuaPUklK12w19DAh/i1OVAzpUZ0A5rCLZKasUp
 WeWqziAdu0JgzoPn8WlmbMtIWF1JBvKksSw7KZdNfdrklRu0O6zxydJrgJF+gvKG7sfmTWPCyIS6G
 yc+jDrmg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nuETR-001JAt-Fo; Thu, 26 May 2022 14:28:25 +0000
Date: Thu, 26 May 2022 15:28:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
Message-ID: <Yo+OiR6abzVksVTM@casper.infradead.org>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
 <20220525145056.953631743a4c494aabf000dc@linux-foundation.org>
 <F0E25DFF-8256-48FF-8B88-C0E3730A3E5E@jrtc27.com>
 <20220525152006.e87d3fa50aca58fdc1b43b6a@linux-foundation.org>
 <Yo7U8kglHlcvQ0Ri@casper.infradead.org>
 <20220526084832.GC2146@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526084832.GC2146@kadam>
Cc: alsa-devel@alsa-project.org, linux-fbdev@vger.kernel.org,
 kernel test robot <lkp@intel.com>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, bpf@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-omap@vger.kernel.org,
 Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org,
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

On Thu, May 26, 2022 at 11:48:32AM +0300, Dan Carpenter wrote:
> On Thu, May 26, 2022 at 02:16:34AM +0100, Matthew Wilcox wrote:
> > Bizarre this started showing up now.  The recent patch was:
> > 
> > -       info->alloced += compound_nr(page);
> > -       inode->i_blocks += BLOCKS_PER_PAGE << compound_order(page);
> > +       info->alloced += folio_nr_pages(folio);
> > +       inode->i_blocks += BLOCKS_PER_PAGE << folio_order(folio);
> > 
> > so it could tell that compound_order() was small, but folio_order()
> > might be large?
> 
> The old code also generates a warning on my test system.  Smatch thinks
> both compound_order() and folio_order() are 0-255.  I guess because of
> the "unsigned char compound_order;" in the struct page.

It'd be nice if we could annotate that as "contains a value between
1 and BITS_PER_LONG - PAGE_SHIFT".  Then be able to optionally enable
a checker that ensures that's true on loads/stores.  Maybe we need a
language that isn't C :-P  Ada can do this ... I don't think Rust can.
