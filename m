Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7081FD33A5
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 23:53:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC6FC166F;
	Thu, 10 Oct 2019 23:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC6FC166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570744419;
	bh=OWd7eu9hO6DtmgYO7SPPOJHbEHj2DC70TCsrRcAXOic=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vu5gae2QB4rwvqx5jYeFHpRmVQ/SMZ2ZAtrd/y8AD7WGKCBkQdHm2yxBlLpdMWMc/
	 ftDe1lyWjVWHJeY/TSnEdo3EZlPPIS8ndYxn2txydD2BuyeC4EHuutwrPDBGOumFJm
	 p8Iq5h2vJJCAoiLfLpb4Yh01h1JaXRHcfpvNg35Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 413D8F8045E;
	Thu, 10 Oct 2019 23:51:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 031E8F8038F; Thu, 10 Oct 2019 23:51:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04229F800E3
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 23:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04229F800E3
Received: by mail-ot1-f65.google.com with SMTP id 60so6260544otu.0
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 14:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BsPwSU6X2gQyCit53YR9b2X6LOdSxAWOyZ/eXX+wmiM=;
 b=j/o+aSgCZjhTYDN8XkGZ72bNd+rAJJf0+c41bYvulceBBmSpz8p9Aq7rRchBk0Q2Ky
 MCuX0NNn/wgbjsdNdDdSG3DAj9Dil/ZO/U6Vq7KtJrxvZ2JutV8tawrMfpbhNZ7IsBGI
 XSyq1408ikMzgdNFNM6nDe/lk5Ksu4T9hjUDeK6qOXbQ28RPQ2Ln97rE7fwDLL2EuFCf
 +UaapYb7rdkwuRQDG5H/Vonb5nX4s8j+4RZe8nfnJPVXVzg2oP4fzOKnogEZApADsLH6
 6FOzMRIPnLHLaghY3tNFPaJqcX/lbuwTPW6uAmJHQQsGcdfjz7RSB3oBz6Von+8Waq5T
 c03g==
X-Gm-Message-State: APjAAAW3AhDKyPT7/2bi3vwqeo5VZemm3JV5e5DoWegLKLBzn9dCINFW
 RdXjWo2dkDe4TtHDFz8L1g==
X-Google-Smtp-Source: APXvYqyeeCI7SWt8DgFaTGCvI1pwHUIrAXSg4kf5ngWc9Hr2IhfYul0XKR9JMoYXpLjIpfiKIDNnZQ==
X-Received: by 2002:a05:6830:1e03:: with SMTP id
 s3mr403637otr.289.1570744306660; 
 Thu, 10 Oct 2019 14:51:46 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f205sm2022658oib.11.2019.10.10.14.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 14:51:46 -0700 (PDT)
Date: Thu, 10 Oct 2019 16:51:45 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20191010215145.GA24430@bogus>
References: <CGME20190926110226eucas1p24dbb1b39ffa3f607aa28c0c4d9ff6aba@eucas1p2.samsung.com>
 <20190926110219.6144-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926110219.6144-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, Maciej Falkowski <m.falkowski@samsung.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: samsung: i2s: Document clocks
	macros
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 26 Sep 2019 13:02:19 +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Document clocks macros with their description
> from 'Documentation/devicetree/bindings/sound/samsung-i2s.txt'
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - Added proper commit message and description
> - Moved comments to the right side
> 
> Best regards,
> Maciej Falkowski
> ---
>  include/dt-bindings/sound/samsung-i2s.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 

Applied, thanks.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
