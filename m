Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1C558CA0C
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 16:00:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C83D825;
	Mon,  8 Aug 2022 15:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C83D825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659967235;
	bh=TCzV6KSc2GefTGK4qa0I34cweJMqlCdFg9MKYqPUn2w=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TGC73M4LXV7B+H32GhUo8K7BVIiZkDPQrKUq/5yAK1lA8JNyEL6pfumM5h9CUoJhF
	 vCYLdb9z6KzjrGDYsMoHZ0fENUTyV0EFwRLLXSDfD0z9SstYbBLejfqm48BhKUI1lX
	 9IQJAX0y+TXnkuLYYrGhuoTetBSY0ltoygDKZdow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 764FEF80430;
	Mon,  8 Aug 2022 15:59:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40E09F8054A; Mon,  8 Aug 2022 15:59:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE8ACF80507
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 15:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE8ACF80507
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M1d4N2Sxyz67Y4H;
 Mon,  8 Aug 2022 21:55:00 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 8 Aug 2022 15:59:25 +0200
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 8 Aug
 2022 14:59:24 +0100
Date: Mon, 8 Aug 2022 14:59:24 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: iio: Drop Joachim Eastwood
Message-ID: <20220808145924.00005e14@huawei.com>
In-Reply-To: <20220808104712.54315-2-krzysztof.kozlowski@linaro.org>
References: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
 <20220808104712.54315-2-krzysztof.kozlowski@linaro.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Cc: linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Eric
 Dumazet <edumazet@google.com>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Lee
 Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-pm@vger.kernel.org,
 Ricardo Rivera-Matos <r-rivera-matos@ti.com>, Tim
 Harvey <tharvey@gateworks.com>, Rob Herring <robh+dt@kernel.org>,
 linux-hwmon@vger.kernel.org, Robert Jones <rjones@gateworks.com>,
 netdev@vger.kernel.org, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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

On Mon,  8 Aug 2022 13:47:08 +0300
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Emails to Joachim Eastwood bounce ("552 5.2.2 The email account that you
> tried to reach is over quota and inactive.").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml   | 1 -
>  Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml b/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
> index 7c8f8bdc2333..9c7c66feeffc 100644
> --- a/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
> @@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Freescale MMA7455 and MMA7456 three axis accelerometers
>  
>  maintainers:
> -  - Joachim Eastwood <manabian@gmail.com>
>    - Jonathan Cameron <jic23@kernel.org>
>  
>  description:
> diff --git a/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml b/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
> index 6404fb73f8ed..43abb300fa3d 100644
> --- a/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: NXP LPC1850 ADC bindings
>  
>  maintainers:
> -  - Joachim Eastwood <manabian@gmail.com>
> +  - Jonathan Cameron <jic23@kernel.org>
>  
>  description:
>    Supports the ADC found on the LPC1850 SoC.

lore
