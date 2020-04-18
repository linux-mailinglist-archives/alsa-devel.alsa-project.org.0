Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 723C31AF189
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 17:19:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F20A91612;
	Sat, 18 Apr 2020 17:18:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F20A91612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587223150;
	bh=qugxNfPkvqYi5+IUgteDQlgxWnSNpZvobR+yGLVDicc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xf1KvLcqu9m/JATMDXvsdKXV5WRimZZel9bQKv8RjStjdt2rW2jXmpdW91wjFa3WV
	 NdkxF8FMLLk93k1tLFOVuhwVaVdrEdFK1pDIBvo//An/4nwxhlIfKDPuvj9tzkfyti
	 Hcg97l4gVVJi6F3Apx+yQAo7ccKReBVSdWGs/NgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E85BFF80122;
	Sat, 18 Apr 2020 17:17:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 845E1F8014E; Sat, 18 Apr 2020 17:17:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A7F4F80122
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 17:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A7F4F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BkhkS6zE"
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 489D22072B;
 Sat, 18 Apr 2020 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587223036;
 bh=qugxNfPkvqYi5+IUgteDQlgxWnSNpZvobR+yGLVDicc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BkhkS6zEdLKRGqWQpRLzde6OxUxvIwlsvwGWQPRdCua2pBb8tHU3aRvh2C5SCmGxF
 hJJb3A/+a666MlSl69WLezjGQ6lb9GPV3C8sSkDhE+D/DkCU8wBeqbBydQz5q1+cfp
 Px4H65dHyixYKeb6TjYi7fnmo/ai+VhYvqh6vU6A=
Date: Sat, 18 Apr 2020 16:17:10 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH trivial 4/6] iio: Fix misspellings of "Analog Devices"
Message-ID: <20200418161710.55ccf37c@archlinux>
In-Reply-To: <20200416103058.15269-5-geert+renesas@glider.be>
References: <20200416103058.15269-1-geert+renesas@glider.be>
 <20200416103058.15269-5-geert+renesas@glider.be>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, Jiri Kosina <trivial@kernel.org>,
 Stefan Popa <stefan.popa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 linux-iio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 dmaengine@vger.kernel.org, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
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

On Thu, 16 Apr 2020 12:30:56 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> According to https://www.analog.com/, the company name is spelled
> "Analog Devices".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to the togreg branch of iio.git and pushed out as testing as there
are other things in that tree that need a build test.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/ad7791.c                       | 2 +-
>  drivers/iio/trigger/iio-trig-hrtimer.c         | 2 +-
>  drivers/staging/iio/Documentation/overview.txt | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad7791.c b/drivers/iio/adc/ad7791.c
> index abb2393926317087..70bfc41052db2740 100644
> --- a/drivers/iio/adc/ad7791.c
> +++ b/drivers/iio/adc/ad7791.c
> @@ -444,5 +444,5 @@ static struct spi_driver ad7791_driver = {
>  module_spi_driver(ad7791_driver);
>  
>  MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
> -MODULE_DESCRIPTION("Analog Device AD7787/AD7788/AD7789/AD7790/AD7791 ADC driver");
> +MODULE_DESCRIPTION("Analog Devices AD7787/AD7788/AD7789/AD7790/AD7791 ADC driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/iio/trigger/iio-trig-hrtimer.c b/drivers/iio/trigger/iio-trig-hrtimer.c
> index a5e670726717f0d8..f59bf8d585866ea2 100644
> --- a/drivers/iio/trigger/iio-trig-hrtimer.c
> +++ b/drivers/iio/trigger/iio-trig-hrtimer.c
> @@ -4,7 +4,7 @@
>   *
>   * Copyright (C) Intuitive Aerial AB
>   * Written by Marten Svanfeldt, marten@intuitiveaerial.com
> - * Copyright (C) 2012, Analog Device Inc.
> + * Copyright (C) 2012, Analog Devices Inc.
>   *	Author: Lars-Peter Clausen <lars@metafoo.de>
>   * Copyright (C) 2015, Intel Corporation
>   */
> diff --git a/drivers/staging/iio/Documentation/overview.txt b/drivers/staging/iio/Documentation/overview.txt
> index 43f92b06bc3e5574..ebdc64f451d7c798 100644
> --- a/drivers/staging/iio/Documentation/overview.txt
> +++ b/drivers/staging/iio/Documentation/overview.txt
> @@ -34,7 +34,7 @@ turned on or off (if possible) via sysfs interfaces.
>  fifo / ring buffers on the sensor chip.  These greatly reduce the load
>  on the host CPU by buffering relatively large numbers of data samples
>  based on an internal sampling clock. Examples include VTI SCA3000
> -series and Analog Device ADXL345 accelerometers.  Each buffer supports
> +series and Analog Devices ADXL345 accelerometers.  Each buffer supports
>  polling to establish when data is available.
>  
>  * Trigger and software buffer support. In many data analysis

