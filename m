Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6755764EB41
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 13:16:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC6B81712;
	Fri, 16 Dec 2022 13:15:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC6B81712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671192983;
	bh=ALLkY+RbJeKMkHkTDu7vlc/QGBHCiEqSI86YCB2i/68=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DmpN2SS1LtXUJqMuQ+7E9dtK5clqqmweGpQssV3OLjCkILmUgVwWKprwwJChMlVrn
	 iEmEQ9i8fcQVG36FSXW7nf7EHy6Zj3nGE5T0NIDkGRopUOZZA2LIB+rtosM0vJREZX
	 +WjkAlhLYMo/2Toin8ECmDx8PntGoGzJM95po9KU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBEFAF804CB;
	Fri, 16 Dec 2022 13:15:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32AC4F804E2; Fri, 16 Dec 2022 13:15:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB873F804D7
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 13:15:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB873F804D7
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8637667373; Fri, 16 Dec 2022 13:15:20 +0100 (CET)
Date: Fri, 16 Dec 2022 13:15:19 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [6.2][regression] after commit
 ffcb754584603adf7039d7972564fbf6febdc542 all sound devices
 disappeared (due BUG at mm/page_alloc.c:3592!)
Message-ID: <20221216121519.GA5710@lst.de>
References: <CABXGCsPnpu0TGHnvXM1we7q1t3tJAOYW2rA=AMvf7ZahcYvpRQ@mail.gmail.com>
 <20221216064645.GA24446@lst.de>
 <a76cb262-a24f-e113-5680-2025aa143ee6@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a76cb262-a24f-e113-5680-2025aa143ee6@arm.com>
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
 iommu@lists.linux.dev, Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Christoph Hellwig <hch@lst.de>, m.szyprowski@samsung.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Dec 16, 2022 at 11:40:57AM +0000, Robin Murphy wrote:
> On 2022-12-16 06:46, Christoph Hellwig wrote:
>> Ok, it seems like the sound noncontig alloc code that I already
>> commented on as potentially bogus GFP_GOMP mapping trips this.  I think
>> for now the right thing would be to revert the hunk in dma-iommu.c
>> (see patch below).  The other thing to try would be to remove both
>> uses GFP_COMP in sound/core/memalloc.c, which should have the same
>> effect.
>
> Or we explicitly strip the flag in dma_alloc_noncontiguous() (and maybe 
> dma_alloc_pages() as well) for consistency with dma_alloc_attrs(). That 
> seems like it might be the most robust option.

In the long run warning there and returning an error seems like the
right thing to do, yes. I'm just a little worried doing this right now
after the merge window.
