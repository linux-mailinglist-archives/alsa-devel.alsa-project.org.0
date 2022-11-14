Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEA6627D80
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 13:17:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 026301666;
	Mon, 14 Nov 2022 13:16:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 026301666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668428239;
	bh=ORiXEqVTr1AF7ZzV8mpI+ZS96LmdOoCZn6IkQAVnwfM=;
	h=Date:Subject:To:From:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WffZM92cGrYyDfB1wpmOG1DdHDN5M7A8YuBzAq3XNqoggJtRmftDjZHeT1FTi3JvU
	 PDmZyr2HBxvyFV4Ucu5VrpyQMq9024noKD0Jm5t7+srQX1mtRGOJkYhowX9c8v+wTH
	 x4HzNITnjMWZhtk9hTMpYPPkzt8BZoZ6UOWOHlMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D161F80448;
	Mon, 14 Nov 2022 13:16:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E498FF800B6; Mon, 14 Nov 2022 13:16:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA5E3F800B6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 13:16:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA5E3F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Le/LS1iW"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221114121614euoutp018adab35cb3f4022d7148d867b593071a~ncpXLLScW0624006240euoutp01n
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 12:16:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221114121614euoutp018adab35cb3f4022d7148d867b593071a~ncpXLLScW0624006240euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668428174;
 bh=rqJtRyc6jhRwV6Yyz8pxVVQ6mvHEOongjyo9iV1Kpw4=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Le/LS1iWMyMiSFauKtfW+7rkzpn5uDVFaEd0xcYxp+y3uoNiShxbUgxiNyhGjOzpe
 fOi0gqEOFTh4nBXMuXomVwJSBWzD6+XzOIcBvlTWiWiZE9ct7Nlue5Y6l7v31gnapF
 DXowXXVCOPI65GuuMiWOigXlMb8PPsA2F26yU/90=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221114121614eucas1p27a35901372467ed599de7db160f866f3~ncpW-GrqT0036400364eucas1p2O;
 Mon, 14 Nov 2022 12:16:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 53.51.10112.D8132736; Mon, 14
 Nov 2022 12:16:13 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221114121613eucas1p2c8b45caec484f7b29222ae7da6e8d6a2~ncpWIFo652211422114eucas1p2t;
 Mon, 14 Nov 2022 12:16:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221114121613eusmtrp1ba74758cc2c70c1890907353bb7bbb62~ncpWHTGCn0913609136eusmtrp1F;
 Mon, 14 Nov 2022 12:16:13 +0000 (GMT)
X-AuditID: cbfec7f4-cf3ff70000002780-9b-6372318d78f1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id FA.B3.09026.D8132736; Mon, 14
 Nov 2022 12:16:13 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221114121612eusmtip2daf9855d5d46686171b62c8a6859ae7a~ncpVSQ_1-1133111331eusmtip2f;
 Mon, 14 Nov 2022 12:16:12 +0000 (GMT)
Message-ID: <6d37def0-b109-440f-f3f3-ef65f51c02e0@samsung.com>
Date: Mon, 14 Nov 2022 13:16:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 7/7] dma-mapping: reject __GFP_COMP in dma_alloc_attrs
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Dennis Dalessandro
 <dennis.dalessandro@cornelisnetworks.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Alexandra Winter <wintera@linux.ibm.com>, Wenjia Zhang
 <wenjia@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Russell King <linux@armlinux.org.uk>, Robin Murphy
 <robin.murphy@arm.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20221113163535.884299-8-hch@lst.de>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLKsWRmVeSWpSXmKPExsWy7djPc7q9hkXJBp92WVpcuXiIyeL1nvnM
 FitXH2Wy+PXFwmLT42usFj0btrJaPDvUy2IxYWEzs8WhqXsZLZZt+sNkcWyBmEXnrn5Wi4Mf
 nrBabPi+ltGi8cw2dos1x16wOAh4bPjcxOaxZt4aRo/L1y4ye2y7toXFY9OqTjaPCYsOMHps
 XlLv8WLzTEaP3Tcb2Dz2vV3G5rF+y1UWj8+b5AJ4orhsUlJzMstSi/TtErgy9i3cwV5wQari
 0MSZ7A2M/0W6GDk5JARMJLa1b2LtYuTiEBJYwSixZ/4XRgjnC6PE3e8/2CGcz4wS67u3McK0
 fJjQzwaRWM4oce5QB1TLR0aJ5ubFbCBVvAJ2Ek8a7oPZLAKqEhtWNbBCxAUlTs58wgJiiwqk
 SCzccoMJxBYW8JL4uuwcM4jNLCAucevJfCaQoSICH5kkJs24CnYhs8BZRokry1eBdbAJGEp0
 ve0C28AJZF/fNJMFolteYvvbOcwQt17jlHixMwjCdpH4tnc6C4QtLPHq+BZ2CFtG4vTkHhaQ
 BRIC7YwSC37fZ4JwJjBKNDy/BfW1tcSdc7+AtnEAbdCUWL9LHyLsKNH3aRcLSFhCgE/ixltB
 iBv4JCZtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFPYFSahRQus5D8PwvJN7MQ9i5gZFnFKJ5a
 WpybnlpslJdarlecmFtcmpeul5yfu4kRmCJP/zv+ZQfj8lcf9Q4xMnEwHmKU4GBWEuGdJ5Of
 LMSbklhZlVqUH19UmpNafIhRmoNFSZyXbYZWspBAemJJanZqakFqEUyWiYNTqoFpvnXLj3eL
 Pnz0LObY/0xi3rzunf8etgixnlF6ntz5J+PElonmh71dz/RtFnJYb1NxXaDlk+OK5DSrTSEO
 r+6+rSsXM+560nPtgN5FxgtZ1us3vssuL1LZeyzUYYa3vO3ESgX3/nnSWkYiAu27ZP9fc1/w
 sqtn4ofunTocahzfpuzSvSX8w6/EaVOE6cGX7Kx7DO+eO2m8b5PjX82WRynFhk/Wbf078RnL
 pcSO8zXp20wT+Sor5/+ul1k8f9XkbOdLDGfYAvyiO38v+vDmTVFDpaLoZDuho3smBX1Na99j
 dOqhVND+9nbpQz+mLtzEE/TewyPGu17mlvqMBOWy3h97Zy+x++3umy/kzzp5Sd48JZbijERD
 Leai4kQAlbsJQgAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsVy+t/xe7q9hkXJBr9/i1lcuXiIyeL1nvnM
 FitXH2Wy+PXFwmLT42usFj0btrJaPDvUy2IxYWEzs8WhqXsZLZZt+sNkcWyBmEXnrn5Wi4Mf
 nrBabPi+ltGi8cw2dos1x16wOAh4bPjcxOaxZt4aRo/L1y4ye2y7toXFY9OqTjaPCYsOMHps
 XlLv8WLzTEaP3Tcb2Dz2vV3G5rF+y1UWj8+b5AJ4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30
 jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQy9i3cwV5wQari0MSZ7A2M/0W6GDk5JARMJD5M
 6GfrYuTiEBJYyijxccFJJoiEjMTJaQ2sELawxJ9rXVBF7xklrh95ywaS4BWwk3jScB/MZhFQ
 ldiwCqKBV0BQ4uTMJyxdjBwcogIpEuuORIGEhQW8JL4uO8cMYjMLiEvcejIfbJeIwGcmiZcb
 VUDmMwucZZTofvmZBWLZakaJWX1zGEGq2AQMJbredoEt4wSyr2+ayQIxyUyia2sXI4QtL7H9
 7RzmCYxCs5DcMQvJwllIWmYhaVnAyLKKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMCFsO/Zz
 yw7Gla8+6h1iZOJgPMQowcGsJMI7TyY/WYg3JbGyKrUoP76oNCe1+BCjKTAwJjJLiSbnA1NS
 Xkm8oZmBqaGJmaWBqaWZsZI4r2dBR6KQQHpiSWp2ampBahFMHxMHp1QDk0XY5HOnPshM/uHg
 mlmw58YLvhfJKt7TVBe4z7l0LHaaxarvK35O35so7v7uWPX513sEb9/4pPTbxy6eS+3+U64c
 k5anwdoL3ZN4l+w5rtq4iF2rymiVeraiQ9dirXSuzkPzRaYd2e+7+n7wy6SIS85vvWTt3R6n
 fTx/48T5D7/fMMz137DNWqJZrprt15Godd1Tzh2UuO6bl695fYJtWeaaC5fOemt11d+Lvp0t
 oRZgabhNVOvDoRqf8MRfij2i7Qm7HR/l2Pv85P8UrJW4PTfz8acrs/ZsmzmdM/RxYdM08VWb
 D0+LN/N5PdVlfeFD1tdRm+y3Xl/CxfF33quZ8R2Xln5VurzK7aboOvP7k24psRRnJBpqMRcV
 JwIAmN39fJEDAAA=
X-CMS-MailID: 20221114121613eucas1p2c8b45caec484f7b29222ae7da6e8d6a2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221113163620eucas1p27901efb682a6611ee75401a74ff7724e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221113163620eucas1p27901efb682a6611ee75401a74ff7724e
References: <20221113163535.884299-1-hch@lst.de>
 <CGME20221113163620eucas1p27901efb682a6611ee75401a74ff7724e@eucas1p2.samsung.com>
 <20221113163535.884299-8-hch@lst.de>
Cc: linux-s390@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

On 13.11.2022 17:35, Christoph Hellwig wrote:
> DMA allocations can never be turned back into a page pointer, so
> requesting compound pages doesn't make sense and it can't even be
> supported at all by various backends.
>
> Reject __GFP_COMP with a warning in dma_alloc_attrs, and stop clearing
> the flag in the arm dma ops and dma-iommu.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   arch/arm/mm/dma-mapping.c | 17 -----------------
>   drivers/iommu/dma-iommu.c |  3 ---
>   kernel/dma/mapping.c      |  8 ++++++++
>   3 files changed, 8 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index d7909091cf977..c135f6e37a00c 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -564,14 +564,6 @@ static void *__dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
>   	if (mask < 0xffffffffULL)
>   		gfp |= GFP_DMA;
>   
> -	/*
> -	 * Following is a work-around (a.k.a. hack) to prevent pages
> -	 * with __GFP_COMP being passed to split_page() which cannot
> -	 * handle them.  The real problem is that this flag probably
> -	 * should be 0 on ARM as it is not supported on this
> -	 * platform; see CONFIG_HUGETLBFS.
> -	 */
> -	gfp &= ~(__GFP_COMP);
>   	args.gfp = gfp;
>   
>   	*handle = DMA_MAPPING_ERROR;
> @@ -1093,15 +1085,6 @@ static void *arm_iommu_alloc_attrs(struct device *dev, size_t size,
>   		return __iommu_alloc_simple(dev, size, gfp, handle,
>   					    coherent_flag, attrs);
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
>   	pages = __iommu_alloc_buffer(dev, size, gfp, attrs, coherent_flag);
>   	if (!pages)
>   		return NULL;
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 9297b741f5e80..f798c44e09033 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -744,9 +744,6 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
>   	/* IOMMU can map any pages, so himem can also be used here */
>   	gfp |= __GFP_NOWARN | __GFP_HIGHMEM;
>   
> -	/* It makes no sense to muck about with huge pages */
> -	gfp &= ~__GFP_COMP;
> -
>   	while (count) {
>   		struct page *page = NULL;
>   		unsigned int order_size;
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 33437d6206445..c026a5a5e0466 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -498,6 +498,14 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
>   
>   	WARN_ON_ONCE(!dev->coherent_dma_mask);
>   
> +	/*
> +	 * DMA allocations can never be turned back into a page pointer, so
> +	 * requesting compound pages doesn't make sense (and can't even be
> +	 * supported at all by various backends).
> +	 */
> +	if (WARN_ON_ONCE(flag & __GFP_COMP))
> +		return NULL;
> +
>   	if (dma_alloc_from_dev_coherent(dev, size, dma_handle, &cpu_addr))
>   		return cpu_addr;
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

