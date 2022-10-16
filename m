Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42006600084
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 17:15:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A566C5B95;
	Sun, 16 Oct 2022 17:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A566C5B95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665933309;
	bh=/8hfhsrDNi8VFaslkLZV6j6I9D5jXgH1aAvXP7JihWw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pxnXzWOkzhNDVwdB+q1YwZnLdBF1eIiFybMQDMc2h0lZpoGkGKIRhB8mJHtiqTcS2
	 fqZvytZcA2x5zRU8TcooBo2k435o5w/4JHeeRW/e2l+tCsoseRptLyXKm2R3oCPdf5
	 d0+mSfOBG/fMm1r4G3p+kclMwEZwuI3fb5C5fZQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 195F5F8027C;
	Sun, 16 Oct 2022 17:14:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C4CDF800E5; Sun, 16 Oct 2022 17:14:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AFE6F800E5
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 17:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AFE6F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vKviUKik"
Received: by mail-qv1-xf34.google.com with SMTP id df9so6151687qvb.9
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 08:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DspOqI6hz1WLm7j7CT74yx9oCWpDom4lXqndSWVe65o=;
 b=vKviUKik+NtbN8d+7cD8EEEU0D6LG8XTdYhXVq6aOJezwwYZOYx2EjVdFPII3ADqkI
 aQvkba1pJvH+d5GFuTCb8bazjIRA31ofQ86tX93GSJgqW7dIhzVJHXFs3M4HwqQ1mud1
 Q61yQK0ytFn0rVfuh5E/lNzf9wj+8TpL9zC/nbycqQKMOVBXPmOhNAum6I/M09J/efuJ
 YB7wGp/bU4Oz0oEyYYDyE9tcYZEgBuExiJblVxUhaH/LrgscEOlyL9d9lTMSmzLu5aNU
 FPnwU5Zkkd/ffVO1arPH6eS8PmIC9fFZ1ctudD3QUFIkNxRKP5Zsv/4B4tM9iY7cUqXj
 oVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DspOqI6hz1WLm7j7CT74yx9oCWpDom4lXqndSWVe65o=;
 b=8NOFux8LC5tnlft+PhEa/hkdVLayqFvQS/eynKAikvs1iL1n81ku5eYU8GxsUuJO2D
 U8eKmuUnsA1NpykeONmjBUpI5Xn9EZL9dfv7+4hNbwz3/+ew5R5SxhUmBfq8VYFpVhgt
 PYIsTQH/XlWlkmGKJjqO43l8CzsWwJ+UAfPmGthKuHa6x/tCHgIxXSDTa6xcdMzpCBxg
 NRVK4pK8MJdqqUgQWdgCZEMGrTmynHIUzftW9u5yx6qjGEmovkeS2Sly8YcLZd0VytlY
 TNK9GtJntuAtDA2Lu+jXSWloUWnqBYv6+wofIoIgO+AhcKlmIcEbf7qrUE3ZCQ2cqjyP
 ZdVA==
X-Gm-Message-State: ACrzQf3RRxTJ9f45y5nCiSA0LLGYT0Y78qCOAaH8toc0uDhHP8eSWH/E
 DrihXV1rgihFIWhfwgIrAyZO2g==
X-Google-Smtp-Source: AMsMyM4UTeOjEM4QLiZGPdKafjQN8x9XSIZC4D7aRxQF/zyPAl1f7s/nq7gXSsvhB1qw3J0xSWKOlQ==
X-Received: by 2002:a05:6214:250c:b0:4b1:a1e7:1d89 with SMTP id
 gf12-20020a056214250c00b004b1a1e71d89mr5378511qvb.1.1665933243673; 
 Sun, 16 Oct 2022 08:14:03 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9b13:d679:7b5b:6921?
 ([2601:42:0:3450:9b13:d679:7b5b:6921])
 by smtp.gmail.com with ESMTPSA id
 cn4-20020a05622a248400b00304fe5247bfsm6037943qtb.36.2022.10.16.08.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Oct 2022 08:14:02 -0700 (PDT)
Message-ID: <c11f92be-1d86-17e4-e3bb-05e7b17d5fc8@linaro.org>
Date: Sun, 16 Oct 2022 11:14:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 5/6] arm64: dts: fsd: Add I2S DAI node for Tesla FSD
Content-Language: en-US
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 s.nawrocki@samsung.com, perex@perex.cz, tiwai@suse.com,
 pankaj.dubey@samsung.com, alim.akhtar@samsung.com, rcsekar@samsung.com,
 aswani.reddy@samsung.com
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104911epcas5p394100ff6ed53be32c4d64c7e23e48833@epcas5p3.samsung.com>
 <20221014102151.108539-6-p.rajanbabu@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014102151.108539-6-p.rajanbabu@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 14/10/2022 06:21, Padmanabhan Rajanbabu wrote:
> Add device tree node for I2S0 and I2S1 CPU DAI instances for Tesla
> FSD board
> 
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-evb.dts      |  8 +++++
>  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 14 ++++++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi         | 38 ++++++++++++++++++++++
>  3 files changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index 1db6ddf03f01..c0a4509499ab 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -41,3 +41,11 @@
>  &ufs {
>  	status = "okay";
>  };
> +
> +&tdm_0 {

Alphabetical order against other label-overrides.

> +	status = "okay";
> +};
> +
> +&tdm_1 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> index e3852c946352..ff6f5d4b16dd 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> @@ -339,6 +339,20 @@
>  		samsung,pin-pud = <FSD_PIN_PULL_UP>;
>  		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
>  	};
> +
> +	i2s0_bus: i2s0-bus {

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

> +		samsung,pins = "gpd1-0", "gpd1-1", "gpd1-2", "gpd1-3", "gpd1-4";
> +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> +		samsung,pin-pud = <FSD_PIN_PULL_DOWN>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
> +	};
> +
> +	i2s1_bus: i2s1-bus {
> +		samsung,pins = "gpd2-0", "gpd2-1", "gpd2-2", "gpd2-3", "gpd2-4";
> +		samsung,pin-function = <FSD_PIN_FUNC_2>;
> +		samsung,pin-pud = <FSD_PIN_PULL_DOWN>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
> +	};
>  };
>  
>  &pinctrl_pmu {
> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
> index f35bc5a288c2..5decad45a1b6 100644
> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> @@ -32,6 +32,8 @@
>  		spi0 = &spi_0;
>  		spi1 = &spi_1;
>  		spi2 = &spi_2;
> +		tdm0 = &tdm_0;
> +		tdm1 = &tdm_1;

Why?

>  	};
>  
>  	cpus {
> @@ -809,6 +811,42 @@
>  			status = "disabled";
>  		};
>  
> +		tdm_0: tdm@140e0000 {

Node names should be generic, so this looks like i2s.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			compatible = "samsung,exynos7-i2s";
> +			reg = <0x0 0x140E0000 0x0 0x100>;
> +			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&pdma1 14>, <&pdma1 13>, <&pdma1 12>;
> +			dma-names = "tx", "rx", "tx-sec";
> +			#clock-cells = <1>;
> +			#sound-dai-cells = <1>;
> +			clocks = <&clock_peric PERIC_HCLK_TDM0>,
> +				 <&clock_peric PERIC_HCLK_TDM0>,
> +				 <&clock_peric PERIC_PCLK_TDM0>;
> +			clock-names = "i2s_opclk0", "i2s_opclk1", "iis";

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

Best regards,
Krzysztof

