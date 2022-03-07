Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E88AC4CFC86
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 12:19:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AB3416D0;
	Mon,  7 Mar 2022 12:19:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AB3416D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646651994;
	bh=p7IprMi7ApeGlG8frSQRA7qovFC1FDpVPOkax512dIs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UlKj/8L7Lk53Uf/PICvdaQ04Cuj0uwQd5geABTLDHn3S8OO3AZc5O+x11lOGnA32z
	 nAtlg06ubMNrDKjd0dH6/uxyWUye7kDgmJ+g5dM9plbZuQUp5gooe2aKESBMctw7Wv
	 pe1sESD37Cdo6w5bLXeod0BnpI1XmmDjAstliWso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8B17F80159;
	Mon,  7 Mar 2022 12:18:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E629FF8013F; Mon,  7 Mar 2022 12:18:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02779F800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 12:18:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02779F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="RcxDLkw6"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 589ED3F5F9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 11:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646651906;
 bh=X1MD5pHlAbnbnPImmhEg02VNFqeLp0wIprexgDJRTzI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=RcxDLkw65ELF4dMRytxRKYiu9GgiZ9/dUvK9SFvdw+JZc1B/x2Q7eb8JeX3SPdinD
 3NnFI54fQWFt1awuKGFc7kJ8xoFtrICbZhAHg2gYlBVh5OxGu6Io5llZ8sqMYAR1A0
 R5TgSvqsj2bluEwaAsmnw72FBvCtceQiIkerk3b3o7hZqkL0tK2KuDPMjEEValpj04
 jEhrqoyF22nYmFlVOdw4uQPyzXSZ5NhD5iXziFZHxrSOS0Bt9ejbtOQhdDqo36/mrL
 Cc9Xxod83h4PhEjg8aeeMTjcHKv4AxFAvn3WF8Y+Z3S7kqzukKU9bye+Uzuf5y3rvH
 /ki7EdXhkqwyg==
Received: by mail-ed1-f71.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso8392704edt.20
 for <alsa-devel@alsa-project.org>; Mon, 07 Mar 2022 03:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X1MD5pHlAbnbnPImmhEg02VNFqeLp0wIprexgDJRTzI=;
 b=Ann3kJ1LOAlf/LI7dsUIqyTPNi0KJsTkXQVivGj7F25Jn9l04+A+haLRqsVNWgXXee
 hweHZMPn/HMPj3eKpTQoeTJMrxuHE9yW9ch90zapnbPeiiXncxzmQZwHkIikCGrR4GUy
 hDJD4IDAYKze5Z7LbEJ0fQI7b1FD2E36xsaAYfqcWp2qG2AWsJ4SazqKpOIPzrz1rED6
 qo34WwwcXFN+7VN29wz9u71w07rhQ5k6LbG7v6M373d2flSGgj+CV4pgJPvwc3N3651T
 HVqlNnbUt0PPs3rSthOCsaUgtqmFoWijbOileH70a2UtcURQMNPxXJGGbQYvvL0HtuNu
 W/Yw==
X-Gm-Message-State: AOAM5319I0MFc1R/Zw+56EvjIc18+FPt1MVOR9JqALsG/fW1dDkzR0Pd
 jYMLkU/JBkvtJEWXXyooTwe7chhJSxE5CNFE5I9by+MoIzc0q8ooe0OtTptDDmQz36Eogoq+66v
 qkXMpMIKpvciY3fz056739hYYX0aMDT2P+nTOy61P
X-Received: by 2002:a17:907:c012:b0:6d8:ec50:ef9b with SMTP id
 ss18-20020a170907c01200b006d8ec50ef9bmr8387610ejc.284.1646651905837; 
 Mon, 07 Mar 2022 03:18:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJ7Do91/aSYubSq64oelf7lirRCAHMsWTLT2dRvtqUTjJXKJGV32XNYBoxMgw4C8oib/Lw/A==
X-Received: by 2002:a17:907:c012:b0:6d8:ec50:ef9b with SMTP id
 ss18-20020a170907c01200b006d8ec50ef9bmr8387591ejc.284.1646651905618; 
 Mon, 07 Mar 2022 03:18:25 -0800 (PST)
Received: from [192.168.0.142] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1709062a9400b006ce71a88bf5sm4617071eje.183.2022.03.07.03.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 03:18:24 -0800 (PST)
Message-ID: <73c49f2b-ef2e-5ed8-f3d5-aa696f9af9e6@canonical.com>
Date: Mon, 7 Mar 2022 12:18:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/6] ASoC: dt-bindings: Document Microchip's PDMC
Content-Language: en-US
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220307100428.2227511-1-codrin.ciubotariu@microchip.com>
 <20220307100428.2227511-3-codrin.ciubotariu@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307100428.2227511-3-codrin.ciubotariu@microchip.com>
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

On 07/03/2022 11:04, Codrin Ciubotariu wrote:
> Add DT bindings for the new Microchip PDMC embedded in sama7g5 SoCs.
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
> 
> Changes in v2:
>  - renamed patch from 'ASoC: add DT bindings for Microchip PDMC' to
>    'ASoC: dt-bindings: Document Microchip's PDMC';
>  - renamed yaml file from 'mchp,pdmc.yaml' to 'microchip,pdmc.yaml';
>  - used imperative mode in commit description;
>  - renamed mchp,pdmc.h to microchip,pdmc.h;
>  - fixed 'title' to represent HW;
>  - made 'compatible' first property;
>  - s/microhpone/microphone;
>  - none name in example set to 'sound';
> 
>  .../bindings/sound/microchip,pdmc.yaml        | 99 +++++++++++++++++++
>  include/dt-bindings/sound/microchip,pdmc.h    | 13 +++
>  2 files changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
>  create mode 100644 include/dt-bindings/sound/microchip,pdmc.h
> 
> diff --git a/Documentation/devicetree/bindings/sound/microchip,pdmc.yaml b/Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
> new file mode 100644
> index 000000000000..edfa3cbd318e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/microchip,pdmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip Pulse Density Microphone Controller
> +
> +maintainers:
> +  - Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> +
> +description:
> +  The Microchip Pulse Density Microphone Controller (PDMC) interfaces up to 4 digital microphones
> +  having Pulse Density Modulated (PDM) outputs.

This exceeds 80 characters.

> +
> +properties:
> +  compatible:
> +    const: microchip,sama7g5-pdmc
> +
> +  "#sound-dai-cells":
> +    const: 0
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
> +      microphone is mapped to channel 0, the second to channel 1, etc.

This is also too long, wrap at 80.

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
> +  - compatible
> +  - "#sound-dai-cells"
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
> +    #include <dt-bindings/sound/microchip,pdmc.h>
> +
> +    pdmc: sound@e1608000 {
> +        compatible = "microchip,sama7g5-pdmc";
> +        #sound-dai-cells = <0>;
> +        reg = <0xe1608000 0x4000>;

In DTS sources: compatible then reg. I mentioned it in previous version.

Best regards,
Krzysztof
