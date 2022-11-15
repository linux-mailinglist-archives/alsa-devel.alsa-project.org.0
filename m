Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BD262A329
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 21:41:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5426F167F;
	Tue, 15 Nov 2022 21:40:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5426F167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668544862;
	bh=anDnM2eAMw8QOXSflTfYT2nEwdUDsf+u25KRB+z2xY8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bjWzRPPaCGlzY7Ask+LatmIQPfJ9+ZfvFXzGBy+P7oKCk3X5KdALznrMwumcc8KHb
	 yYFqFeoKMyeaWxlGhAWsJHxmRaqm5Z3BlPz+1RPkaBH78if62bpe3HV2tOIYquZK6v
	 YRMyapldl0yksm97N74oDtHtbCmOs6g7H8qQ0TdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A36D0F800B5;
	Tue, 15 Nov 2022 21:40:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD7B6F80171; Tue, 15 Nov 2022 21:40:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54DC6F800B5
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 21:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54DC6F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca
 header.b="G5j57M07"
Received: by mail-qt1-x829.google.com with SMTP id cg5so9497555qtb.12
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 12:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uFb9AkF5DsDUHSuCLnIVyedGIVQ0vSQgZz21yC2FixQ=;
 b=G5j57M07nAeUMUOvfKBIvtwuNdmKZr+ebSsapCXtIgkOPaL+d3y1f/cHlkniBZJiXf
 np4Mw+iFldQhTFQrmPllNufC8Hnlw6L5MY0dprWTkBjRCoXbGalIjjkgiaVl6q8G0whE
 n5RUvsblHzNjre5BtyuA482hj95moYLLPA83itnow+Ex5BIwlwrhopmb5li8HcABjJ88
 7od4gmnh1lAl0z+8ZyPgi4psyqzRD91MueRGZPReY18HjBQ1bOw4q/xxmnWRYPq1CGcH
 Mh3Rp5dHC/EgGC32pJDZg7Dei9vg6XzkR4+IK6MkR0CdYPIlf4g+/WNdIiCKXY88/yCl
 NQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uFb9AkF5DsDUHSuCLnIVyedGIVQ0vSQgZz21yC2FixQ=;
 b=uugWz3dQ8q+8s0N4oXw6IXZQIiKIa5uvHa7EWJNx7j1P2URP+qYakSRV3wjUtQDj/C
 6/oQHWFPCXL0SIoPdNjq4itw6mLp/uNytIbovLJRsAutY6/3p7Xs4vfMjAhlycy2R839
 hGkSteM9hoP5meklWvG7pF8qOiLHZmfzaA2K0KuxRU4H9RXgzIThYOvKpalNauRhi58B
 SWkXqxUo5K8B8zVBGCrJQBqYI8Z+sUbaHcQwX1tL6gJX+7KlElkOobi5Rm2F2A9SB9w7
 2dsOxCRId3TtplQ3vUEA1pQS/QJgAWaxAQHYDgCS1ZU7aKYulUWtTQzspxlHSkYiB7b6
 Drdg==
X-Gm-Message-State: ANoB5pkE5v6XyqBXyBa5l/GOPQGiVDBKUzeqpIUlNN1PPj2xY3XBiXhC
 rSNLaOAFT/ohpj94+tw+/0DD9w==
X-Google-Smtp-Source: AA0mqf7wdmvUOx1k+YSFk7zHP4ga+BQ8+SSFpdbt7xHstSjZfXURNKfbLdLQzQd+eKDBS9SkIqI9YA==
X-Received: by 2002:a05:622a:429b:b0:399:78b4:5771 with SMTP id
 cr27-20020a05622a429b00b0039978b45771mr18719839qtb.622.1668544797105; 
 Tue, 15 Nov 2022 12:39:57 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 v14-20020a05620a440e00b006fba0a389a4sm1371576qkp.88.2022.11.15.12.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 12:39:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ov2ip-004k5T-H0;
 Tue, 15 Nov 2022 16:39:55 -0400
Date: Tue, 15 Nov 2022 16:39:55 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/7] RDMA/hfi1: don't pass bogus GFP_ flags to
 dma_alloc_coherent
Message-ID: <Y3P5G4IczsFR5Lky@ziepe.ca>
References: <20221113163535.884299-1-hch@lst.de>
 <20221113163535.884299-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221113163535.884299-3-hch@lst.de>
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

On Sun, Nov 13, 2022 at 05:35:30PM +0100, Christoph Hellwig wrote:
> dma_alloc_coherent is an opaque allocator that only uses the GFP_ flags
> for allocation context control.  Don't pass GFP_USER which doesn't make
> sense for a kernel DMA allocation or __GFP_COMP which makes no sense
> for an allocation that can't in any way be converted to a page pointer.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/infiniband/hw/hfi1/init.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)

I have no idea what qib was trying to do here, but I'm fine if you
take this through another tree

Acked-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
