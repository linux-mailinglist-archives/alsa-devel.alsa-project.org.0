Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA0F58C9FC
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 15:58:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB449850;
	Mon,  8 Aug 2022 15:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB449850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659967119;
	bh=N1qUzPeHmq1g9KSDPrV9QPUtEpidQK9hv1HIicasXFY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uj2SdVbcRGIO2b3LV6y/IxqpvmdyZqYkLJuhPzk3xO9fuj9mkSgyPHNuLHYDIK+IV
	 3lyymJ2ehmHgPkIPNEzo631G5fBnLJl/KeCX5GFJnZis1HcemQC/cGAQV7cZwwtuFJ
	 gsfMlkTghlPbjyxNfs+7gel3gC5q9s347eQz9QaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 480C5F804E5;
	Mon,  8 Aug 2022 15:57:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4CC2F804B1; Mon,  8 Aug 2022 15:57:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=NO_DNS_FOR_FROM,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2948FF800E8
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 15:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2948FF800E8
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M1d7S15Zxz6H76x;
 Mon,  8 Aug 2022 21:57:40 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 8 Aug 2022 15:57:40 +0200
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 8 Aug
 2022 14:57:39 +0100
Date: Mon, 8 Aug 2022 14:57:38 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/5] dt-bindings: Drop Beniamin Bia and Stefan Popa
Message-ID: <20220808145738.000040f1@huawei.com>
In-Reply-To: <20220808104712.54315-4-krzysztof.kozlowski@linaro.org>
References: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
 <20220808104712.54315-4-krzysztof.kozlowski@linaro.org>
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

On Mon,  8 Aug 2022 13:47:10 +0300
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Emails to Beniamin Bia and Stefan Popa bounce ("550 5.1.10
> RESOLVER.ADR.RecipientNotFound; Recipient not found by SMTP address
> lookup").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Fine by me.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml       | 1 -
>  Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml    | 2 +-
>  Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml      | 3 +--
>  .../devicetree/bindings/iio/amplifiers/adi,hmc425a.yaml        | 1 -
>  4 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml b/Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml
> index 154bee851139..d794deb08bb7 100644
> --- a/Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml
> @@ -8,7 +8,6 @@ title: Analog Devices ADM1177 Hot Swap Controller and Digital Power Monitor
>  
>  maintainers:
>    - Michael Hennerich <michael.hennerich@analog.com>
> -  - Beniamin Bia <beniamin.bia@analog.com>
>  
>  description: |
>    Analog Devices ADM1177 Hot Swap Controller and Digital Power Monitor
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
> index 31ffa275f5fa..b97559f23b3a 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Analog Devices AD7091R5 4-Channel 12-Bit ADC
>  
>  maintainers:
> -  - Beniamin Bia <beniamin.bia@analog.com>
> +  - Michael Hennerich <michael.hennerich@analog.com>
>  
>  description: |
>    Analog Devices AD7091R5 4-Channel 12-Bit ADC
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> index 73775174cf57..516fc24d3346 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> @@ -7,8 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Analog Devices AD7606 Simultaneous Sampling ADC
>  
>  maintainers:
> -  - Beniamin Bia <beniamin.bia@analog.com>
> -  - Stefan Popa <stefan.popa@analog.com>
> +  - Michael Hennerich <michael.hennerich@analog.com>
>  
>  description: |
>    Analog Devices AD7606 Simultaneous Sampling ADC
> diff --git a/Documentation/devicetree/bindings/iio/amplifiers/adi,hmc425a.yaml b/Documentation/devicetree/bindings/iio/amplifiers/adi,hmc425a.yaml
> index a557761d8016..9fda56fa49c3 100644
> --- a/Documentation/devicetree/bindings/iio/amplifiers/adi,hmc425a.yaml
> +++ b/Documentation/devicetree/bindings/iio/amplifiers/adi,hmc425a.yaml
> @@ -8,7 +8,6 @@ title: HMC425A 6-bit Digital Step Attenuator
>  
>  maintainers:
>    - Michael Hennerich <michael.hennerich@analog.com>
> -  - Beniamin Bia <beniamin.bia@analog.com>
>  
>  description: |
>    Digital Step Attenuator IIO device with gpio interface.

