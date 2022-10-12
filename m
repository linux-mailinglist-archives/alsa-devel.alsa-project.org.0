Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 263885FC2D7
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Oct 2022 11:16:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7333D48E9;
	Wed, 12 Oct 2022 11:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7333D48E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665566175;
	bh=m5uKL20gMuIegwXC6bQxZXdFSk+2EaCDsEPe605raAQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l+BmwLiA7snRoNoTHrDJ0i8oR/Tm03wVBOHkiCmfkJqbJmCsWc2qqDaIfox4Zvd4X
	 BO+8C+usRxr98cnGQGIUNNsYxV/gMqJSaDu63NrLTMyHpKjyfNhMPXoeL5RacxqyBu
	 p4pdjCcfWGgwf59UbStm0a0FwWcTqZw86O8LyKQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA7AEF800F4;
	Wed, 12 Oct 2022 11:15:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06731F80246; Wed, 12 Oct 2022 11:15:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 480B4F800F4
 for <alsa-devel@alsa-project.org>; Wed, 12 Oct 2022 11:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 480B4F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="aw/8jJZg"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29C8tfB7026001;
 Wed, 12 Oct 2022 11:15:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WuRU+MntGnCMaXFzcXMNoaYrVG/2orVNcEHKCqBKaQg=;
 b=aw/8jJZgI81jBzPEP9vF3LPDs5aPjpEocaar0BEyHQIeBVJf3IwXqr8qU9eA4qNGhZD9
 E/nWHpM0HKAQu6GHR9oua6gbkxKEp8P8I2lo/AA8USiX4Xe+czS5yGGuVt7q+1ZN9Xwn
 ePM0vVGgCRcJnkLY7tg+T3VvVfJ414fl/qxlyr4ks3itHGgzRBBRHp9ywxuXepQEGey/
 T+Xyefm7Ygfu2fYejo3QmnJtKUFGrSTrb+yS8LMlEXZiWh/6XipB/p1YXMR2nZQJA0V8
 McEPwXYZZpTlLsru2vbghdKsFOAMtA36QFVBzB6m+JVbv9Mc4jx3/vva+CYVqy7dyBd1 uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k4hwf66qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 11:15:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6AE25100034;
 Wed, 12 Oct 2022 11:15:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A10C32194EC;
 Wed, 12 Oct 2022 11:15:04 +0200 (CEST)
Received: from [10.201.22.54] (10.75.127.122) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 12 Oct
 2022 11:15:01 +0200
Message-ID: <cce333f4-17db-f891-a9a2-97036c7d7332@foss.st.com>
Date: Wed, 12 Oct 2022 11:15:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] ASoC: dt-bindings: Convert dmic-codec to DT schema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Arnaud Pouliquen
 <arnaud.pouliquen@st.com>, <arnaud.pouliquen@foss.st.com>, Heiko Stuebner
 <heiko@sntech.de>
References: <20221011184119.3754096-1-robh@kernel.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20221011184119.3754096-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_04,2022-10-11_02,2022-06-22_01
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Hi Rob,

On 10/11/22 20:41, Rob Herring wrote:
> Convert the dmic-codec binding to DT schema format.
> 
> The '#sound-dai-cells' and 'sound-name-prefix' properties were not
> documented, but are in use, so add them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/sound/dmic-codec.yaml | 55 +++++++++++++++++++
>  .../devicetree/bindings/sound/dmic.txt        | 22 --------
>  2 files changed, 55 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/dmic-codec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/dmic.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/dmic-codec.yaml b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
> new file mode 100644
> index 000000000000..767152fa99cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/dmic-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic PDM Digital microphone (DMIC) codec
> +
> +maintainers:
> +  - Arnaud Pouliquen <arnaud.pouliquen@st.com>

I don't have much activity on the audio topic anymore, so I don't know if I'm
the best person.
But if one maintainer is needed, that's fine.
Please just change my email address to arnaud.pouliquen@foss.st.com
With that and the fix reported by the bot
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks,
Arnaud

> +
> +allOf:
> +  - $ref: name-prefix.yaml#
> +
> +properties:
> +  compatible:
> +    const: dmic-codec
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  dmicen-gpios:
> +    description: GPIO specifier for DMIC to control start and stop
> +    maxItems: 1
> +
> +  num-channels:
> +    description: Number of microphones on this DAI
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 8
> +    default: 8
> +
> +  modeswitch-delay-ms:
> +    description: Delay (in ms) to complete DMIC mode switch
> +
> +  wakeup-delay-ms:
> +    description: Delay (in ms) after enabling the DMIC
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio.h>
> +
> +    dmic {
> +        compatible = "dmic-codec";
> +        dmicen-gpios = <&gpio4 3 GPIO_ACTIVE_HIGH>;
> +        num-channels = <1>;
> +        wakeup-delay-ms <50>;
> +        modeswitch-delay-ms <35>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/sound/dmic.txt b/Documentation/devicetree/bindings/sound/dmic.txt
> deleted file mode 100644
> index 32e871037269..000000000000
> --- a/Documentation/devicetree/bindings/sound/dmic.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Device-Tree bindings for Digital microphone (DMIC) codec
> -
> -This device support generic PDM digital microphone.
> -
> -Required properties:
> -	- compatible: should be "dmic-codec".
> -
> -Optional properties:
> -	- dmicen-gpios: GPIO specifier for dmic to control start and stop
> -	- num-channels: Number of microphones on this DAI
> -	- wakeup-delay-ms: Delay (in ms) after enabling the DMIC
> -	- modeswitch-delay-ms: Delay (in ms) to complete DMIC mode switch
> -
> -Example node:
> -
> -	dmic_codec: dmic@0 {
> -		compatible = "dmic-codec";
> -		dmicen-gpios = <&gpio4 3 GPIO_ACTIVE_HIGH>;
> -		num-channels = <1>;
> -		wakeup-delay-ms <50>;
> -		modeswitch-delay-ms <35>;
> -	};
