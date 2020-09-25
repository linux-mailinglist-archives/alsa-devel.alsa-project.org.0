Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB96279116
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 20:48:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82B4D18D9;
	Fri, 25 Sep 2020 20:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82B4D18D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601059706;
	bh=J+6hWqnXYU5GQQyHszZ+3LwmwABvKEkNtOqq+raJTYc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gLHBNkac1D2yjBh/qwk3fAfq16MX8BM7iOWbpOb0Yc78YxunVQtdn83dlMn+QKbVN
	 +oj+oFqMtzu8MU1Dnc43flQIHN4FR/EItG4rXufQ+wirghA+IG+NXg77EfAjEX8CYr
	 ZiXewGLnqpnvicQwMu/1TrLxecJi9N8eU/C7ilPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F511F801EC;
	Fri, 25 Sep 2020 20:46:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44339F801EB; Fri, 25 Sep 2020 20:46:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AEA2F800DA
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 20:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AEA2F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="hNVaqgoi"
Received: by mail-wr1-x442.google.com with SMTP id m6so4790546wrn.0
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 11:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AlDiV2I2Pb3l4Sw1FS8MXXmwraDk5F1rgxliXh5N5CM=;
 b=hNVaqgoiF4i4BUKziRlpXfyKzDqaE2Y0RasEA7QnYZaUqmrhYmxmR65VR3QsZGT0/N
 elfdI2ZtE21gOt8NsKBS76ANRONmfTntZIUBb37OAepaErQ4mHfX26H/avNX5Om2F5Th
 iF/y4L9RdXJwUeLTzBdv6H/xNDzBbfk+2GMdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AlDiV2I2Pb3l4Sw1FS8MXXmwraDk5F1rgxliXh5N5CM=;
 b=g75kq10MmcWIk1N742efEAFNy1qyCMgUC7r/a4JL5wfGz2BIOUOSE4WkZtYVlOtlVW
 +NQnOqNkFNoB/xZaU4OTLtnkPHHSLiZf8n2CYkR/zBT26q/7yzGkkonFKdICFV0Kd2Ut
 mdTfF1iWcj5x5spSLkgU6GhR/67W7G+/55zYeNnQ6ycJemRfy06lv1F8qkBKJWFgl8qs
 h82WKus2NCsf97zf65GfNqKx6e7sr7uPmuULEf4f6dOBSfUaKoA27Ns99nNUFUDx728i
 7v8LFfv371seDUNVizFPr05JLv9z5Gs2BKT4jDlUzhYxAu3zmRoMWRFr0+ORjSaqi8jK
 +ycQ==
X-Gm-Message-State: AOAM533o1711RAMMAKZwaBd0sFjPLaM9YB2U+c5wU/PJGRmb1vmA1QW7
 nE58+scxBB1/QiGGx8b3y9VrUw==
X-Google-Smtp-Source: ABdhPJywG75RJx/fVTLzqgivIcRb/Gp708YyNw5VwVyHEf689ET8en+rXMvfgfeOwhu5XQytInH4aQ==
X-Received: by 2002:a5d:56cd:: with SMTP id m13mr5730549wrw.261.1601059584552; 
 Fri, 25 Sep 2020 11:46:24 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com.
 [34.76.131.216])
 by smtp.gmail.com with ESMTPSA id z8sm3728264wrl.11.2020.09.25.11.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 11:46:23 -0700 (PDT)
Date: Fri, 25 Sep 2020 18:46:22 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 17/18] dma-iommu: implement ->alloc_noncoherent
Message-ID: <20200925184622.GB3607091@chromium.org>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-18-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915155122.1768241-18-hch@lst.de>
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
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

Hi Christoph,

On Tue, Sep 15, 2020 at 05:51:21PM +0200, Christoph Hellwig wrote:
> Implement the alloc_noncoherent method to provide memory that is neither
> coherent not contiguous.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/iommu/dma-iommu.c | 41 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 4 deletions(-)
> 

Sorry for being late to the party and thanks a lot for the patch. Please see my
comments inline.

[snip]
> @@ -1052,6 +1055,34 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
>  	return cpu_addr;
>  }
>  
> +#ifdef CONFIG_DMA_REMAP
> +static void *iommu_dma_alloc_noncoherent(struct device *dev, size_t size,
> +		dma_addr_t *handle, enum dma_data_direction dir, gfp_t gfp)
> +{
> +	if (!gfpflags_allow_blocking(gfp)) {
> +		struct page *page;
> +
> +		page = dma_common_alloc_pages(dev, size, handle, dir, gfp);
> +		if (!page)
> +			return NULL;
> +		return page_address(page);
> +	}
> +
> +	return iommu_dma_alloc_remap(dev, size, handle, gfp | __GFP_ZERO,
> +				     PAGE_KERNEL, 0);

iommu_dma_alloc_remap() makes use of the DMA_ATTR_ALLOC_SINGLE_PAGES attribute
to optimize the allocations for devices which don't care about how contiguous
the backing memory is. Do you think we could add an attrs argument to this
function and pass it there?

As ARM is being moved to the common iommu-dma layer as well, we'll probably
make use of the argument to support the DMA_ATTR_NO_KERNEL_MAPPING attribute to
conserve the vmalloc area.

Best regards,
Tomasz
