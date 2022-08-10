Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A541758FB11
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Aug 2022 13:03:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 610C3857;
	Thu, 11 Aug 2022 13:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 610C3857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660215832;
	bh=6x6su5oHn4WjBSWBtUvgxfhKdMjczpssjP15rky0Ucc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ql1N0osgQLNggzm1XGJTI7cTh6SPmDC7yMr0OnE2rBIbcA63cPt6+z0Wso5dnAsuq
	 muklQOsE7mkh1N+AP2BtOw7bTpyCg5BO3H+jYQ5RRtUfWcyU33Tlod9RvZB4JVG1L4
	 i3MXCMBURvtz5NDc0Vno52xamVe6s24gfYLoy5Jg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC237F800AA;
	Thu, 11 Aug 2022 13:03:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB507F801F5; Wed, 10 Aug 2022 13:01:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2730BF80132
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 13:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2730BF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KMY2BViR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3DDDB81B62;
 Wed, 10 Aug 2022 11:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE0CC433D6;
 Wed, 10 Aug 2022 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660129279;
 bh=6x6su5oHn4WjBSWBtUvgxfhKdMjczpssjP15rky0Ucc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KMY2BViRwxO+LS6lTNRSgjQQ0lxdAhWdIrWx87oKITfqA8c3unrpEe7yDrvdit6aP
 LAJh1oADLa4m6DCanxivY6NzKxMsGIuHST3i3MzzmjjgMVlog/k0ZPOuyoDeIpgEXx
 UZ8VIDuSks9qlXahIc5IeJ5OVKApkhOtMLYZl/glbvW2lmz4Q7fkrhkSzpM5OdrLs1
 vOKs3vJGcttXSz343CpoH1x0KvOn8EnpiFTNHcpw5q4kgTWmAzyFstxLwmo0z9ctHY
 DkBAqyv5xIbwGRFXuxNQ2reCX6YRtl9sY824SJ4PaxHM3m8ht49/FEZms4NYXFEnvJ
 Xg4XqbbvEYd+w==
Date: Wed, 10 Aug 2022 12:01:10 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: Drop Robert Jones
Message-ID: <YvOP9qr2CR9n1FCe@google.com>
References: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
 <20220809162752.10186-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220809162752.10186-5-krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Thu, 11 Aug 2022 13:02:59 +0200
Cc: linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-pm@vger.kernel.org,
 Tim Harvey <tharvey@gateworks.com>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andrew Davis <afd@ti.com>, Mark Brown <broonie@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
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

On Tue, 09 Aug 2022, Krzysztof Kozlowski wrote:

> Emails to Robert Jones bounce ("550 5.2.1 The email account that you
> tried to reach is disabled").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> 
> For maintainers entry see:
> https://lore.kernel.org/all/20220808111113.71890-1-krzysztof.kozlowski@linaro.org/
> ---
>  Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml | 2 +-
>  Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml    | 1 -

Any reason to submit these as one patch?

>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
> index 479e7065d4eb..0203b83b8587 100644
> --- a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
> +++ b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Freescale FXOS8700 Inertial Measurement Unit
>  
>  maintainers:
> -  - Robert Jones <rjones@gateworks.com>
> +  - Jonathan Cameron <jic23@kernel.org>
>  
>  description: |
>    Accelerometer and magnetometer combo device with an i2c and SPI interface.
> diff --git a/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml b/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
> index 5a1e8d21f7a0..5e0fe3ebe1d2 100644
> --- a/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
> @@ -19,7 +19,6 @@ description: |
>  
>  maintainers:
>    - Tim Harvey <tharvey@gateworks.com>
> -  - Robert Jones <rjones@gateworks.com>
>  
>  properties:
>    $nodename:

-- 
Lee Jones [李琼斯]
