Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E834CE755
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Mar 2022 23:05:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD51517E2;
	Sat,  5 Mar 2022 23:04:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD51517E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646517905;
	bh=Fwxu7npZKtvaxbfkbmGG52L+h5NTlfTwoXZ7CmZvISM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l8Tdj+D65wDQxG3dCXAjskesDdwZTeEDhWQQGPnIa4+2geJ3kCgSCFjokjzfMq0P8
	 09RbGpawpv1DhjeHhRvR2F3l9GWH4efnz4cGpkoU8mmVOrn2aj+c88KFHT3Mpd40AD
	 V9hYfuMdwunfmFnMWJj5NqP+ybZa1fx02Fm5367w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1732CF800DF;
	Sat,  5 Mar 2022 23:03:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84F3FF80237; Sat,  5 Mar 2022 23:03:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92A44F800DF
 for <alsa-devel@alsa-project.org>; Sat,  5 Mar 2022 23:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92A44F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="Lc0Yhkp+"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AD9503F613
 for <alsa-devel@alsa-project.org>; Sat,  5 Mar 2022 22:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646517829;
 bh=kcOebttsrbGDsv+l6IIiJwH3C8wz7II7oFbthNyR+Kg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Lc0Yhkp+LwOoodKeDhvX4EyeK7NbR3rFJ0SafJKFJ1Pv6z18+qrzkpcvVTxsWi0k4
 uwIpeaHpUo/sEzI/cjnsxdf9HB+Doy4qXY7PxlKEyNvF4inGB1lkthiBNlwYISNwEG
 A91l86tFbRnZdEM404rQQs1P771XS0VE0WpxM3QuXualqyI5F0KXHrOF2Ni71psHPx
 op4yQUzu9oshMdFHj2zHU28ary3jf8OSm6b307YHGyVWjmLdcisgZEm4DmjKQ6U726
 CzNZF2XVMdk0TDlkj9QKMzYRXjyroB2ko+zsgqK8BECTSlYjtjb6BCm8jHyz31yLI8
 x2Gcpafkr/lNg==
Received: by mail-ed1-f69.google.com with SMTP id
 bq19-20020a056402215300b0040f276105a4so6056121edb.2
 for <alsa-devel@alsa-project.org>; Sat, 05 Mar 2022 14:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kcOebttsrbGDsv+l6IIiJwH3C8wz7II7oFbthNyR+Kg=;
 b=Hho3bfFxcdJ2CMpFDvC3YRPIy8AGT/VNGqHw0lzp2WxJSbs1+TdsHWV8NSOtRvlJHU
 zyru8Ct9USqM00dVKdDiJfV+Tu9Q9/ckj1z7FyyIZ39T425f/yK1rNqGK0XGXh0OoDwi
 8ucpQ3Ki7iTFmh1xwK9SalgQUE97f25tEIJUCkK1hGjF/haf1XtroRv/KEUBIHmmIIFJ
 5NktjaAff12f9M/KtIT+b4eprH1PW7BjD+cU4D6QFDSOuZOx13dBkcjypPnUJcaSAX9B
 Z5xYNfA0poKTP90hoyJtvVzrHJdUBlRfZGy6i5m030Dz7nPdZ+gslOYccYgJAXTTwaHb
 tv3A==
X-Gm-Message-State: AOAM532MlvUzYC1DpN3eGOeb3d+g1k8hCfvi9uPGh6f664IjayEd2EFP
 idAYYTHfi+YJXUMRfodiQldGNw0H7xUCFNSoA9VhIQfyspL3aiGgI9GOb0ScBD2XV3qBlOMI4Hs
 T3wblJvn4ArjYpfBlpUjUCVJIxHmjHhQLcMpsRshB
X-Received: by 2002:a17:907:60d0:b0:6da:b397:42b0 with SMTP id
 hv16-20020a17090760d000b006dab39742b0mr4006791ejc.664.1646517829193; 
 Sat, 05 Mar 2022 14:03:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzu568kMEdY9mBB4SY3WtLiN2hC+mxjkPHjcxldg6hya+nNfdxz0DF7WRdYiLsTXUxBLcTs7Q==
X-Received: by 2002:a17:907:60d0:b0:6da:b397:42b0 with SMTP id
 hv16-20020a17090760d000b006dab39742b0mr4006780ejc.664.1646517828964; 
 Sat, 05 Mar 2022 14:03:48 -0800 (PST)
Received: from [192.168.0.140] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 p14-20020aa7cc8e000000b0040f13865fa9sm3974492edt.3.2022.03.05.14.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 14:03:48 -0800 (PST)
Message-ID: <9e6bfc9b-63d0-d4b3-90af-4bf06cdb27f2@canonical.com>
Date: Sat, 5 Mar 2022 23:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/6] ASoC: add DT bindings for Microchip PDMC
Content-Language: en-US
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220304181756.1894561-1-codrin.ciubotariu@microchip.com>
 <20220304181756.1894561-3-codrin.ciubotariu@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220304181756.1894561-3-codrin.ciubotariu@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: lars@metafoo.de, nicolas.ferre@microchip.com, robh+dt@kernel.org,
 tiwai@suse.com, broonie@kernel.org
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

On 04/03/2022 19:17, Codrin Ciubotariu wrote:
> This patch adds DT bindings for the new Microchip PDMC embedded in
> sama7g5 SoCs.

Do not use "this patch" but simple imperative mode. See submitting patches.

> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
>  .../devicetree/bindings/sound/mchp,pdmc.yaml  | 99 +++++++++++++++++++
>  include/dt-bindings/sound/mchp,pdmc.h         | 13 +++
>  2 files changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mchp,pdmc.yaml
>  create mode 100644 include/dt-bindings/sound/mchp,pdmc.h
> 
> diff --git a/Documentation/devicetree/bindings/sound/mchp,pdmc.yaml b/Documentation/devicetree/bindings/sound/mchp,pdmc.yaml
> new file mode 100644
> index 000000000000..bdf5c52c29d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mchp,pdmc.yaml

mchp is not a proper Microchip vendor prefix. You wanted "microchip"
probably.

> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mchp,pdmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PDMC Device Tree Bindings

s/PDMC/Pulse Density Microphone Controller/
s/Device Tree Bindings//
(title is about hardware)

> +
> +maintainers:
> +  - Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> +
> +description:
> +  The Microchip Pulse Density Microphone Controller (PDMC) interfaces up to 4 digital microphones
> +  having Pulse Density Modulated (PDM) outputs.
> +
> +properties:
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  compatible:
> +    const: microchip,sama7g5-pdmc

Compatible goes first (and also keep such order in "required").

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Peripheral Bus Clock
> +      - description: Generic Clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: gclk
> +
> +  dmas:
> +    description: RX DMA Channel
> +    maxItems: 1
> +
> +  dma-names:
> +    const: rx
> +
> +  microchip,mic-pos:
> +    description: |
> +      Position of PDM microphones on the DS line and the sampling edge (rising or falling) of the
> +      CLK line. A microphone is represented as a pair of DS line and the sampling edge. The first
> +      microhpone is mapped to channel 0, the second to channel 1, etc.

Lang typo (microphone).

> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description: value for DS line
> +        - description: value for sampling edge
> +      anyOf:
> +        - enum:
> +            - [0, 0]
> +            - [0, 1]
> +            - [1, 0]
> +            - [1, 1]
> +    minItems: 1
> +    maxItems: 4
> +    uniqueItems: true
> +
> +required:
> +  - "#sound-dai-cells"
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-names
> +  - microchip,mic-pos
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/dma/at91.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/sound/mchp,pdmc.h>
> +
> +    pdmc: pdmc@e1608000 {

Generic node name, so microphone? microphone-controller? sound? audio-codec?

> +        #sound-dai-cells = <0>;
> +        compatible = "microchip,sama7g5-pdmc";

Compatible goes first, then reg.

> +        reg = <0xe1608000 0x4000>;
> +        interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +        dmas = <&dma0 AT91_XDMAC_DT_PERID(37)>;
> +        dma-names = "rx";
> +        clocks = <&pmc PMC_TYPE_PERIPHERAL 68>, <&pmc PMC_TYPE_GCK 68>;
> +        clock-names = "pclk", "gclk";
> +        microchip,mic-pos = <MCHP_PDMC_DS0 MCHP_PDMC_CLK_POSITIVE>,
> +                            <MCHP_PDMC_DS0 MCHP_PDMC_CLK_NEGATIVE>,
> +                            <MCHP_PDMC_DS1 MCHP_PDMC_CLK_POSITIVE>,
> +                            <MCHP_PDMC_DS1 MCHP_PDMC_CLK_NEGATIVE>;
> +    };
> diff --git a/include/dt-bindings/sound/mchp,pdmc.h b/include/dt-bindings/sound/mchp,pdmc.h
> new file mode 100644
> index 000000000000..543c424a5a6f
> --- /dev/null
> +++ b/include/dt-bindings/sound/mchp,pdmc.h

Proper vendor prefix.

> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __DT_BINDINGS_MCHP_PDMC_H__
> +#define __DT_BINDINGS_MCHP_PDMC_H__
> +
> +/* PDM microphone's pin placement */
> +#define MCHP_PDMC_DS0 0
> +#define MCHP_PDMC_DS1 1
> +
> +/* PDM microphone clock edge sampling */
> +#define MCHP_PDMC_CLK_POSITIVE 0
> +#define MCHP_PDMC_CLK_NEGATIVE 1
> +
> +#endif /* __DT_BINDINGS_MCHP_PDMC_H__ */


Best regards,
Krzysztof
