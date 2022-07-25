Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F657580502
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 22:06:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3298C20C;
	Mon, 25 Jul 2022 22:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3298C20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658779610;
	bh=sJqcfkbh8cGxCg+7Bkykm9n9QVmcxTNmDppcihwKt/o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dniknoksL4Q9gar4WONReMapiEPmafUr8+s/HAgu4inmQ8jHiTRgK1GNzWYlFFhAP
	 ToSKvHX/YYaWz2TjXI5HM8z/z3CrQMg6sB4SGj6Mf7kFdCByGLKddGB3jRSgsGckaw
	 gfC0AUYzgRf6ZKXEZTlDO4YqfjYNyF9PhboFelQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82D05F80212;
	Mon, 25 Jul 2022 22:05:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC779F80163; Mon, 25 Jul 2022 22:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB440F80088
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 22:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB440F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xbvE7pFX"
Received: by mail-lf1-x129.google.com with SMTP id t17so7444420lfk.0
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 13:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Oceg/Pf4ocpuzyoJ2bDgrLZz3+Hr4ukfCLs2bjellJ0=;
 b=xbvE7pFXaNjrko+nOS903yex+fY9Lqzl/dugltKs7yyRNlL+RipCTRGxarErqqJZqz
 4323Yf7eoI2STUWZBo0sLNSMAL+Lvk4Gc+q1BiGtv/otu+DtzAGz/oJnf4hdTLOfEMor
 zW+A2MqNv4K4M0+88vRPGZbhKKfab4zW/98PjLXa/mkO2zdJkJIUlHhzax1vmiOIpgXY
 IwzxgPZagbt9D7kYbIemJKzG51xcpUujcMEeqQ/c8lUnxXrwuWvw83qOXIUonPeMAWuQ
 mo9gvw4nCivKxT/AtVeTkFMPlLqpFZhRT3/yrATPYtKee7jccdFpJgzkOJ6nIH6J22v4
 do3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Oceg/Pf4ocpuzyoJ2bDgrLZz3+Hr4ukfCLs2bjellJ0=;
 b=c4w99mlj7Au1s/WbLpBmk9OF+lyOnz1y27zcSlzstaG5XhioEg2h4+0JozwjBt2/bm
 1nmbR3JtAftYLRMiD9XHvhLvJh09TH0ouC6MkrtLXQRxAlp03fdBZ0Uk0cUcrai4rbgz
 ngSEcMn5adIIzwqB+SXqGs6+pfLUjiDVVf2fe83hBtP5vo89SBouYupe9kgI3pyg/Za6
 px1DjvAoezVOlBXtqhW7It32W48b+aC1wE8wqV7XAe853uIPL1AL2RTnYWLGX9JZnhbd
 fpeYcsDWaMyKTxttX/WYE26cr/Yn4L2Rgs1MNxupNlmWtCyH3yQLY4c0aI43m21U4NZB
 OEZA==
X-Gm-Message-State: AJIora9lPThI1eysi4ewF3hsfKoH2Io3Gzq4Okk+yV2kw4miqW+YEec2
 NDtwhLiWuqsHh2vxCIknL6tgJQ==
X-Google-Smtp-Source: AGRyM1sXYCp4Q9ED/TciKrz8jGk4K3lXUkvrseaBvwYdeuV8O0x0U1uIFfHVolrbyOo9xURBlysiIA==
X-Received: by 2002:a05:6512:a84:b0:48a:556d:5539 with SMTP id
 m4-20020a0565120a8400b0048a556d5539mr5400698lfu.6.1658779536913; 
 Mon, 25 Jul 2022 13:05:36 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no.
 [78.26.46.173]) by smtp.gmail.com with ESMTPSA id
 g1-20020a056512118100b0048a9d0242c9sm182844lfr.210.2022.07.25.13.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 13:05:36 -0700 (PDT)
Message-ID: <e81d657f-edea-4c5d-e546-e3bdb379c659@linaro.org>
Date: Mon, 25 Jul 2022 22:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] ASoC: dt-bindings: fsl, sai: Convert format to json-schema
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1658741467-32620-1-git-send-email-shengjiu.wang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1658741467-32620-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: shengjiu.wang@gmail.com
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

On 25/07/2022 11:31, Shengjiu Wang wrote:
> Convert the NXP SAI binding to DT schema format using json-schema.
> 
> The Synchronous Audio Interface (SAI) provides an interface that
> supports full-duplex serial interfaces with frame synchronization
> formats such as I2S, AC97, TDM, and codec/DSP interfaces.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,sai.yaml    | 175 ++++++++++++++++++
>  .../devicetree/bindings/sound/fsl-sai.txt     |  95 ----------
>  2 files changed, 175 insertions(+), 95 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sai.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/fsl-sai.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> new file mode 100644
> index 000000000000..adcd77531eba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Synchronous Audio Interface (SAI).
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description: |
> +  The SAI is based on I2S module that used communicating with audio codecs,
> +  which provides a synchronous audio interface that supports fullduplex
> +  serial interfaces with frame synchronization such as I2S, AC97, TDM, and
> +  codec/DSP interfaces.
> +
> +properties:
> +  compatible:
> +    minItems: 1
> +    maxItems: 2

You allow anything here, so it's not acceptable. This has to be strictly
defined.

> +    items:
> +      enum:
> +        - fsl,vf610-sai
> +        - fsl,imx6sx-sai
> +        - fsl,imx6ul-sai
> +        - fsl,imx7ulp-sai
> +        - fsl,imx8mq-sai
> +        - fsl,imx8qm-sai
> +        - fsl,imx8mm-sai
> +        - fsl,imx8mn-sai
> +        - fsl,imx8mp-sai
> +        - fsl,imx8ulp-sai
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: receive and transmit interrupt
> +
> +  dmas:
> +    minItems: 2

No need for minItems.

> +    maxItems: 2
> +    description:
> +      Must contain a list of pairs of references to DMA specifiers, one for
> +      transmission, and one for reception.

Skip description and instead describe items like you did for interrupts.

> +
> +  dma-names:
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      enum:
> +        - tx
> +        - rx

No, this has to be strictly defined, so items with tx and rx (or
reversed order).

> +
> +  clocks:
> +    minItems: 4
> +    items:
> +      - description: The ipg clock for register access
> +      - description: master clock source 0 (obsoleted, compatible for old dts)
> +      - description: master clock source 1
> +      - description: master clock source 2
> +      - description: master clock source 3
> +      - description: PLL clock source for 8kHz series
> +      - description: PLL clock source for 11kHz series
> +
> +  clock-names:
> +    minItems: 4
> +    maxItems: 7
> +    items:
> +      enum:
> +        - bus
> +        - mclk0
> +        - mclk1
> +        - mclk2
> +        - mclk3
> +        - pll8k
> +        - pll11k

Ditto. minItems:4 could stay, but the rest is not correct. This has to
be strictly ordered/defined list.

> +
> +  lsb-first:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Configures whether the LSB or the MSB is transmitted
> +      first for the fifo data. If this property is absent,
> +      the MSB is transmitted first as default, or the LSB
> +      is transmitted first.
> +
> +  big-endian:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Boolean property, required if all the SAI
> +      registers are big-endian rather than little-endian.
> +
> +  fsl,sai-synchronous-rx:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      This is a boolean property. 

Skip such description, it's useless... Further as well.

If present, indicating
> +      that SAI will work in the synchronous mode (sync Tx
> +      with Rx) which means both the transmitter and the
> +      receiver will send and receive data by following
> +      receiver's bit clocks and frame sync clocks.
> +      fsl,sai-asynchronous and fsl,sai-synchronous-rx are exclusive.
> +
> +  fsl,sai-asynchronous:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      This is a boolean property. If present, indicating
> +      that SAI will work in the asynchronous mode, which
> +      means both transmitter and receiver will send and
> +      receive data by following their own bit clocks and
> +      frame sync clocks separately.
> +      If both fsl,sai-asynchronous and fsl,sai-synchronous-rx are absent, the
> +      default synchronous mode (sync Rx with Tx) will be used, which means both
> +      transmitter and receiver will send and receive data by following clocks
> +      of transmitter.
> +      fsl,sai-asynchronous and fsl,sai-synchronous-rx are exclusive.
> +
> +  fsl,dataline:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    description: |
> +      configure the dataline. it has 3 value for each configuration
> +      first one means the type: I2S(1) or PDM(2)
> +      second one is dataline mask for 'rx'
> +      third one is dataline mask for 'tx'.
> +      for example: fsl,dataline = <1 0xff 0xff 2 0xff 0x11>;
> +      it means I2S type rx mask is 0xff, tx mask is 0xff, PDM type
> +      rx mask is 0xff, tx mask is 0x11 (dataline 1 and 5 enabled).
> +
> +  fsl,sai-mclk-direction-output:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      This is a boolean property. If present,
> +      indicates that SAI will output the SAI MCLK clock.
> +
> +  fsl,shared-interrupt:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      This is a boolean property. If present,
> +      indicates that interrupt is shared with other modules.
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - dmas
> +  - dma-names
> +  - clocks
> +  - clock-names

You need to express the exclusiveness of properties.
allOf:if:required:then:... would work, like here:
https://elixir.bootlin.com/linux/v5.17-rc2/source/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml#L155


Best regards,
Krzysztof
