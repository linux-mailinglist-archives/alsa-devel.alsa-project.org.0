Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFB5223C44
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 15:20:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 065581660;
	Fri, 17 Jul 2020 15:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 065581660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594992056;
	bh=rHav5ldbe1Akcr61GlrPSZhIQZfZT8jKtRE1NX7Nsjg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XfWGYSfcJozZVUpWSd27W17OmOzCsVU6iZoD5wOLKjRqN3AlW76kY7pHWmTpH5aAy
	 GdhqYzYi04Bi3/mg0GckmGddTy9EPXBSIcCfUypHpD73zfm2JZoagXeBHMM9DESf+b
	 DsXgLG3iUbtYxBl1San9VJ34i2JA/X+5CALm8OCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BE7BF801D8;
	Fri, 17 Jul 2020 15:19:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 714C3F80217; Fri, 17 Jul 2020 15:19:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A1DEF800E4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 15:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A1DEF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com
 header.i=@ragnatech-se.20150623.gappssmtp.com header.b="WJr5l5M9"
Received: by mail-lj1-x244.google.com with SMTP id q7so12638228ljm.1
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 06:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=npEG3Q8JCnzZnur7Cq6JNk21xogenaqhRA7YjsM9ezY=;
 b=WJr5l5M97ciW2c/gjJQoeEJGmETPzM7Qr5IRBgUn1YBScg98hUkSzHSeJTg3OUPsqN
 2Scj6G4YGWug3QNMtbZFC3QoKcWR/SfrE+ZlfdaUJN+16ebomabpyO890QKs0TfSwssg
 GlwRJGVRacdblC9JpOlqVPmVq4YaiPWGimGKkIvrIMvoClA502INAywjscaO+jMQtYNV
 FrdLzlPp8YBw4RfuDqDeOxlxXRKz4NzqUy+mC4V9pnVDfAFmeYBYR87xX8F1retQgweA
 OtrVCgFfRj6hzdkmswIkViUTlADJQfm9E7KSYC+qLFxp8Njn3jYAupxNP8CkZ765YQba
 sztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=npEG3Q8JCnzZnur7Cq6JNk21xogenaqhRA7YjsM9ezY=;
 b=SbhipRzfpe9GoAx2vDQUboRo1Wa1fQfbtNisVq/9aee+r48zShBfeJQw8obsTN5D8X
 toFw4BR4eXyyoWRCr8Wf8Gd4yUr1b1jih3B622OgxaMEwQKrXbw91h/UfdclKGLxRlQd
 g6CxkQ0Pf8p/02ABDCODW5jBNSfBUxYhBzCSDlHC7f7gdWZaO9AAL+/Db5BB0S+KmB+j
 4r8DjfZX+3V7u/AM6zfNWkbOq07ieHGIf0wBgR54xvGuVQfr7ir8Krwqiq+sfIaDQJ6v
 HxQQly+Yp0mEiUjaBlaJR+t1eaAr5GVMppWupD7XQlw7fQ3h5k8tovcsXropAc5yTeVK
 36Tg==
X-Gm-Message-State: AOAM5308e2QJB73GMWDxuSp1ghQjZiU1ApOh+niN8//dFip2KswR/uGD
 5nbjdCVfIHPijotJU0M5gGP4gA==
X-Google-Smtp-Source: ABdhPJxEMQOqJH/bssfF2AGyslt8NjbQrH6kwGSmbOflAyOcRsfWYlCaG5NnnWf5rAblr67M877IMw==
X-Received: by 2002:a05:651c:c5:: with SMTP id 5mr4934690ljr.9.1594991945447; 
 Fri, 17 Jul 2020 06:19:05 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id y69sm1861534lfa.86.2020.07.17.06.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 06:19:04 -0700 (PDT)
Date: Fri, 17 Jul 2020 15:19:04 +0200
From: Niklas <niklas.soderlund@ragnatech.se>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 19/20] media: rcar-vin: Enable support for R8A774E1
Message-ID: <20200717131904.GC175137@oden.dyn.berto.se>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-20-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1594919915-5225-20-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On 2020-07-16 18:18:34 +0100, Lad Prabhakar wrote:
> Add the SoC specific information for RZ/G2H (R8A774E1) SoC. Also add
> the routing information between CSI2 and VIN (which is similar to
> R-Car H3 except it lacks CSI41).
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

I do not have access to the datasheet so I can't verify the routing 
table so I trust it is correct.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 40 +++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 7440c8965d27..4fb76d1df308 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -944,6 +944,42 @@ static const struct rvin_info rcar_info_gen2 = {
>  	.max_height = 2048,
>  };
>  
> +static const struct rvin_group_route rcar_info_r8a774e1_routes[] = {
> +	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
> +	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
> +	{ .csi = RVIN_CSI40, .channel = 1, .vin = 0, .mask = BIT(2) },
> +	{ .csi = RVIN_CSI20, .channel = 0, .vin = 1, .mask = BIT(0) },
> +	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(1) | BIT(3) },
> +	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
> +	{ .csi = RVIN_CSI20, .channel = 1, .vin = 1, .mask = BIT(4) },
> +	{ .csi = RVIN_CSI20, .channel = 1, .vin = 2, .mask = BIT(0) },
> +	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
> +	{ .csi = RVIN_CSI20, .channel = 0, .vin = 2, .mask = BIT(2) },
> +	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
> +	{ .csi = RVIN_CSI20, .channel = 2, .vin = 2, .mask = BIT(4) },
> +	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
> +	{ .csi = RVIN_CSI20, .channel = 1, .vin = 3, .mask = BIT(1) | BIT(2) },
> +	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
> +	{ .csi = RVIN_CSI20, .channel = 3, .vin = 3, .mask = BIT(4) },
> +	{ .csi = RVIN_CSI20, .channel = 0, .vin = 4, .mask = BIT(1) | BIT(4) },
> +	{ .csi = RVIN_CSI20, .channel = 0, .vin = 5, .mask = BIT(0) },
> +	{ .csi = RVIN_CSI20, .channel = 1, .vin = 5, .mask = BIT(4) },
> +	{ .csi = RVIN_CSI20, .channel = 1, .vin = 6, .mask = BIT(0) },
> +	{ .csi = RVIN_CSI20, .channel = 0, .vin = 6, .mask = BIT(2) },
> +	{ .csi = RVIN_CSI20, .channel = 2, .vin = 6, .mask = BIT(4) },
> +	{ .csi = RVIN_CSI20, .channel = 1, .vin = 7, .mask = BIT(1) | BIT(2) },
> +	{ .csi = RVIN_CSI20, .channel = 3, .vin = 7, .mask = BIT(4) },
> +	{ /* Sentinel */ }
> +};
> +
> +static const struct rvin_info rcar_info_r8a774e1 = {
> +	.model = RCAR_GEN3,
> +	.use_mc = true,
> +	.max_width = 4096,
> +	.max_height = 4096,
> +	.routes = rcar_info_r8a774e1_routes,
> +};
> +
>  static const struct rvin_group_route rcar_info_r8a7795_routes[] = {
>  	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
>  	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
> @@ -1220,6 +1256,10 @@ static const struct of_device_id rvin_of_id_table[] = {
>  		.compatible = "renesas,vin-r8a774c0",
>  		.data = &rcar_info_r8a77990,
>  	},
> +	{
> +		.compatible = "renesas,vin-r8a774e1",
> +		.data = &rcar_info_r8a774e1,
> +	},
>  	{
>  		.compatible = "renesas,vin-r8a7778",
>  		.data = &rcar_info_m1,
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
