Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C48A223C1F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 15:15:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A622110E;
	Fri, 17 Jul 2020 15:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A622110E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594991747;
	bh=aF0HcX0TKUJWOWn2hRL0fXQnc1iiX8XSvSW6r6W7PU4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tM2HfIfwhUUuTYYrJwtPd1JbpJcITZdiEYYSd+29JyIbfzQlG3U2PGV1cfLI3j0hU
	 lxnjj0z3Q1AVdVftyvao0IZoTPbV4HwH7ObTtIUT9MyDkYZ150PmG7Np217NVcEiyN
	 ZrBidnaDjWqmYDYYcTEwTFckJxJkLGg/HKv/4BvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD37EF802BE;
	Fri, 17 Jul 2020 15:14:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52A85F802BE; Fri, 17 Jul 2020 15:14:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3396CF802BC
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 15:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3396CF802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com
 header.i=@ragnatech-se.20150623.gappssmtp.com header.b="vuWSYW2i"
Received: by mail-lj1-x243.google.com with SMTP id x9so12558196ljc.5
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 06:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DO4ZbPSH0hXkKVVssfyLC5Q3aPidsdt5JRzYM7Uja0g=;
 b=vuWSYW2icHEBGemf7McZrx7iWHM+guaeu1UPLUXXx73W6ZVH+iPhYbLn9Lq6fq4Zxw
 qMFpQ4NjZtdZlD/IYmhEodqpPUXrpmJspDd9GqaYLWtx358LP7zpcSqDQUibrEZH8mYY
 oayZ9ZK5Li/pN1dxmo7Db0uyPlKzeukaTmhJiBaGMXgUawLGoNWiBM1QfS2OIxmRXwDd
 mlQJeun7BJ6uLEOmk42vWLm+YtSv7IeJn0GZnfDNFcFNPedk+oiNPipVMidOvX4uN5gS
 z3TVTe6/7nHuq45oTV83wT+inIx0hVKdB5fBssyDMyqsr7EyGFXh8uumGJYY6HDd4M5v
 zpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DO4ZbPSH0hXkKVVssfyLC5Q3aPidsdt5JRzYM7Uja0g=;
 b=JI5DhcllEleNVZ5jRCb0rrXhnC5xxOIgD7XtXTkBwPbPJB8EZpo0E92pt8bWWhseyO
 KmPWodq0HCTBONtwqa9yZLW2DDM7pYUnJjIiPmZDBwgRsJ9IrNvfnX2YrwRQD2Qgd/QG
 MmXo7YSIjUVb+HywAYo8tofgTKuLXiXsnd25cOySb32mmLTOQkX5lEFBoKDrWLR2stXj
 nW9GMSf+n/ZhtA9i+DSY0wfMieCKFELu7N8OcdNQMnpEs7I0ir6LShh4C5zuPa0hyIUO
 sz3hEP4qJpysOpTsSmh3dBHUsDWbbAgZunC74OnfSkN4PvPLb2z85MqhOLxrW+z5YB+z
 y3Xw==
X-Gm-Message-State: AOAM532fMqIv/E0LnQ4QpoxeM4QOkPOM/JF83LVrUKjd/k6l7rd9AlUW
 t2U7rPthUNji61H9JHqkar+xbg==
X-Google-Smtp-Source: ABdhPJzbBwZ8JwXa+it+ymJXMzGpPd34h3pjIGXCdigNzRtx0+bluFlcT4iPLpMRHuhw2GWIxlaPHQ==
X-Received: by 2002:a05:651c:1106:: with SMTP id
 d6mr4362497ljo.214.1594991637061; 
 Fri, 17 Jul 2020 06:13:57 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id h23sm1754210lfk.37.2020.07.17.06.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 06:13:56 -0700 (PDT)
Date: Fri, 17 Jul 2020 15:13:56 +0200
From: Niklas <niklas.soderlund@ragnatech.se>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 18/20] media: rcar-csi2: Enable support for R8A774E1
Message-ID: <20200717131356.GB175137@oden.dyn.berto.se>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-19-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1594919915-5225-19-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-i2c@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org
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

Hi Lad,

Thanks for your work.

On 2020-07-16 18:18:33 +0100, Lad Prabhakar wrote:
> Add the MIPI CSI-2 driver support for RZ/G2H (R8A774E1) SoC.
> The CSI-2 module of RZ/G2H is similar to R-Car H3.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index c6cc4f473a07..2325e3b103e4 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -1090,6 +1090,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
>  		.compatible = "renesas,r8a774c0-csi2",
>  		.data = &rcar_csi2_info_r8a77990,
>  	},
> +	{
> +		.compatible = "renesas,r8a774e1-csi2",
> +		.data = &rcar_csi2_info_r8a7795,
> +	},
>  	{
>  		.compatible = "renesas,r8a7795-csi2",
>  		.data = &rcar_csi2_info_r8a7795,
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
