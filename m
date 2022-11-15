Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE9162A32E
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 21:41:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5A6F1688;
	Tue, 15 Nov 2022 21:40:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5A6F1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668544889;
	bh=eliZSN8r8AfQ9ov8ARQzUXA3GM1JXqSDg0KYYfCWwF8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ix+49VB8NwWq6/rS4kuOGBfW6E2UjmT3wW61NN0+WTdsG/LdSfU1yRfAp+XODKLYm
	 T1rXCixZ6fgHu0+4V/pKcIfVQq7GWTxLzKSg7C/aDGrcHxYtzLDbrgDc55Js/m+h3s
	 ynsYBl2AoyAJnmnoSTUB4GBI5JoLMnOiZSP63feo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E364F800B8;
	Tue, 15 Nov 2022 21:40:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10341F804DA; Tue, 15 Nov 2022 21:40:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04FC5F800B8
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 21:40:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04FC5F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca
 header.b="CwW9FhNK"
Received: by mail-qk1-x734.google.com with SMTP id z17so10335431qki.11
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 12:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7iYGXPjCmD+hOJN/hkZTaijhi0DrfdkinZFcCdyRXH8=;
 b=CwW9FhNKOaob37FQNRtH3IIpJJVYfCXdcm7NLENGdMxI2xxBXN6UNxxUcIkzynTxRo
 hEC4O6/Til1SAoNo0oxicCs4PwnePNgu023EFWUwVHTRfqtU3ZTJGA+g7PHjP83IcpBf
 pcVAB36gt92psfUNxZGQLABAYO0yihlXbtsKmfgztmNvidCUF7/T4lScA/xqUNz1nqby
 OGLw06kWxaR+2D8kJFCiA7PHjIx2Hc/49se95miUisA09qZELk4NJ/jhSIF7RX7EtvSY
 iNHt5UdqUawk/uLQy6AWdnLh7KUq7IU1Rs77JQpC80X+tcmsPPU0HvcPjyh+PfrpL4PL
 CEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7iYGXPjCmD+hOJN/hkZTaijhi0DrfdkinZFcCdyRXH8=;
 b=RiP5rVCQZJheP3Jc4gsv7b/BKsx6dh4WWglWF2YfL66T+q4pAkjfzjAN8W3hH+cNZf
 uB1FTk/P5zSn/l7R8f9RkhHCpu0/S1KnY/fOrREvSPQYEgD0wENSIlVMY1DR5UhbNRvt
 LezuaNObEK/6XyOQkXJu8leDzSrchUtn4zbvWw5dtA2vOQBE+9nO2J+lo8XhsI82NX9i
 sRyGos6LxpDmPg5ZTUJbKqq4SIzEoy5PGXBUXKitUN6UvdwZXvTkpok6hgwyAHBOoNf/
 DKrVAN8E1rIIAMb9h0OMF4fCxyGTKiD7hV60XZsH/AN2eb9Hs1VNbC95coo+7LfzNKOL
 +OBQ==
X-Gm-Message-State: ANoB5pm+axhdihUVvvJs/3fMpGdkQUsx19gwPygs9qo28dSFTRwA/fJe
 GTIcGoMgN0wq3QfrBhyTzJG6mg==
X-Google-Smtp-Source: AA0mqf6zvK1xRL3Tl3X3Az/h3DyNifOOA6ALfwSSuf97W778gOs/xLwq0pgU+qMVs85p3UoBcFP0jQ==
X-Received: by 2002:a37:2c03:0:b0:6fa:2cb5:8b4b with SMTP id
 s3-20020a372c03000000b006fa2cb58b4bmr16273452qkh.348.1668544822672; 
 Tue, 15 Nov 2022 12:40:22 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05620a248f00b006fb3884e10bsm8883738qkn.24.2022.11.15.12.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 12:40:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ov2jF-004k62-6h;
 Tue, 15 Nov 2022 16:40:21 -0400
Date: Tue, 15 Nov 2022 16:40:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/7] RDMA/qib: don't pass bogus GFP_ flags to
 dma_alloc_coherent
Message-ID: <Y3P5NWZNLo2+sdnn@ziepe.ca>
References: <20221113163535.884299-1-hch@lst.de>
 <20221113163535.884299-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221113163535.884299-4-hch@lst.de>
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

On Sun, Nov 13, 2022 at 05:35:31PM +0100, Christoph Hellwig wrote:
> dma_alloc_coherent is an opaque allocator that only uses the GFP_ flags
> for allocation context control.  Don't pass GFP_USER which doesn't make
> sense for a kernel DMA allocation or __GFP_COMP which makes no sense
> for an allocation that can't in any way be converted to a page pointer.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/infiniband/hw/qib/qib_iba6120.c |  2 +-
>  drivers/infiniband/hw/qib/qib_init.c    | 21 ++++-----------------
>  2 files changed, 5 insertions(+), 18 deletions(-)

Same same

Acked-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
