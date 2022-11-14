Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CEB62772A
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 09:13:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25F7A4E;
	Mon, 14 Nov 2022 09:12:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25F7A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668413581;
	bh=mpJwu8UPciVMvP4x1nO/f/d0FY4YaLljifKODSIp6Fo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrTe+u/wNsW7skIQc3E5GdCHurdty/EhSC6zfuINXYa1XK43oiZHxxqaE7LMv1wS+
	 65tPdkOfq/o9DStOzD4DChMo8uqare/4/4NJi9Sk3O6ioIrR4EgDZQkPVa7D8B7bjR
	 6ZHNx74F/Ak0zLwrFmJynd1NegbpfBbtJao7pgKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92D83F80448;
	Mon, 14 Nov 2022 09:12:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4EABF800B6; Mon, 14 Nov 2022 09:12:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE6C4F800B6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 09:11:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE6C4F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k33TWUYS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5E175B80D2B;
 Mon, 14 Nov 2022 08:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3893EC433D6;
 Mon, 14 Nov 2022 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668413515;
 bh=mpJwu8UPciVMvP4x1nO/f/d0FY4YaLljifKODSIp6Fo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k33TWUYSnJeJJSqCSK3BK1qBtMxZcviktUaz1E62W4dNSUSNiuH0BnICAe2VnJwkr
 FNOrwgfUUfn04YPTZWuG2Brc2/2Kv9vEvb3/8v3JhkATlyBzq5V1Cc+d+mkM/n9Ht8
 sOXZo0nRCudqaHPxM6nNkk7jH8o8G8rRRQsQHgdP/ddk9Oh5tzG0si68G350HklqNg
 +F7Wb7tc9+mxb9JvX3yUo2LE/EVvs/p8wwXi59+xXFK7uSkHLvop1nTf694uRV5u1k
 at3vjj2xvE66J8AllakgkYKHls7+q1XFybccu4tkkwy3fA1YW4dwgpv14lYCJLk9YI
 oyu8ssz65EQug==
Date: Mon, 14 Nov 2022 10:11:50 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 7/7] dma-mapping: reject __GFP_COMP in dma_alloc_attrs
Message-ID: <Y3H4RobK/pmDd3xG@unreal>
References: <20221113163535.884299-1-hch@lst.de>
 <20221113163535.884299-8-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221113163535.884299-8-hch@lst.de>
Cc: linux-s390@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-media@vger.kernel.org, Alexandra Winter <wintera@linux.ibm.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Wenjia Zhang <wenjia@linux.ibm.com>,
 iommu@lists.linux.dev, Russell King <linux@armlinux.org.uk>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On Sun, Nov 13, 2022 at 05:35:35PM +0100, Christoph Hellwig wrote:
> DMA allocations can never be turned back into a page pointer, so
> requesting compound pages doesn't make sense and it can't even be
> supported at all by various backends.
> 
> Reject __GFP_COMP with a warning in dma_alloc_attrs, and stop clearing
> the flag in the arm dma ops and dma-iommu.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm/mm/dma-mapping.c | 17 -----------------
>  drivers/iommu/dma-iommu.c |  3 ---
>  kernel/dma/mapping.c      |  8 ++++++++
>  3 files changed, 8 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index d7909091cf977..c135f6e37a00c 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -564,14 +564,6 @@ static void *__dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
>  	if (mask < 0xffffffffULL)
>  		gfp |= GFP_DMA;
>  
> -	/*
> -	 * Following is a work-around (a.k.a. hack) to prevent pages
> -	 * with __GFP_COMP being passed to split_page() which cannot
> -	 * handle them.  The real problem is that this flag probably
> -	 * should be 0 on ARM as it is not supported on this
> -	 * platform; see CONFIG_HUGETLBFS.
> -	 */
> -	gfp &= ~(__GFP_COMP);
>  	args.gfp = gfp;
>  
>  	*handle = DMA_MAPPING_ERROR;
> @@ -1093,15 +1085,6 @@ static void *arm_iommu_alloc_attrs(struct device *dev, size_t size,
>  		return __iommu_alloc_simple(dev, size, gfp, handle,
>  					    coherent_flag, attrs);
>  
> -	/*
> -	 * Following is a work-around (a.k.a. hack) to prevent pages
> -	 * with __GFP_COMP being passed to split_page() which cannot
> -	 * handle them.  The real problem is that this flag probably
> -	 * should be 0 on ARM as it is not supported on this
> -	 * platform; see CONFIG_HUGETLBFS.
> -	 */
> -	gfp &= ~(__GFP_COMP);
> -
>  	pages = __iommu_alloc_buffer(dev, size, gfp, attrs, coherent_flag);
>  	if (!pages)
>  		return NULL;
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 9297b741f5e80..f798c44e09033 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -744,9 +744,6 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
>  	/* IOMMU can map any pages, so himem can also be used here */
>  	gfp |= __GFP_NOWARN | __GFP_HIGHMEM;
>  
> -	/* It makes no sense to muck about with huge pages */
> -	gfp &= ~__GFP_COMP;
> -
>  	while (count) {
>  		struct page *page = NULL;
>  		unsigned int order_size;
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 33437d6206445..c026a5a5e0466 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -498,6 +498,14 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
>  
>  	WARN_ON_ONCE(!dev->coherent_dma_mask);
>  
> +	/*
> +	 * DMA allocations can never be turned back into a page pointer, so
> +	 * requesting compound pages doesn't make sense (and can't even be
> +	 * supported at all by various backends).
> +	 */
> +	if (WARN_ON_ONCE(flag & __GFP_COMP))
> +		return NULL;

In RDMA patches, you wrote that GFP_USER is not legal flag either. So it
is better to WARN here for everything that is not allowed.

> +
>  	if (dma_alloc_from_dev_coherent(dev, size, dma_handle, &cpu_addr))
>  		return cpu_addr;
>  
> -- 
> 2.30.2
> 
