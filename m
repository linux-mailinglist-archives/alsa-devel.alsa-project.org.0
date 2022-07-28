Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD79584452
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 18:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C6E91638;
	Thu, 28 Jul 2022 18:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C6E91638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659026631;
	bh=hceloewvJlslQKAJmDuRYsyUACJ86RchRMRu8HKoQAU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hjZ1ctR63p5yRW+8OXj8L2QUurZzIfCDnWyqOjdiM9snhVXHVXEup2IZLr1yEqADy
	 sQOqim8G9YoKfU4l329N984wvf/SsNW16UsPykm/Z4u7cKXQ5CefUvgGYZjB3PEJwA
	 KjyDoSIsH1lS7l9JSF8UuIbXtQg6OjQd7MqwaDCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD264F80508;
	Thu, 28 Jul 2022 18:42:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10F47F804EC; Thu, 28 Jul 2022 18:42:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28895F8015B
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 18:42:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28895F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="F6LF2Mks"
Received: by mail-lj1-x236.google.com with SMTP id a13so2523142ljr.11
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 09:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=k7NJ2kSruJ5HI8zjLsk0ibKM6Ps61KF4YP92+a8hCqI=;
 b=F6LF2Mks0Dk9ZwVvpuFFQw6K3I2WUK5AbrVoarw5EcteTN6D31Vbr4IfnbNTGrwZPq
 RAlsEdNorJEY8uE7a7G/Y8reQre4zIMEDA0bUTkzjhOIU0n/2/mL+6Is+C9hiJARnFFO
 sfb70qlnUXmt4NVkQvECieA7h1IsDVyKaBChWDvQQlPZyUxPLntbi7csjFT2knwh9kPb
 U+7Dy65/Enbq6RWmyMHHuQxg+yQzx7VsOuMc0MMNU5MfY3A3XbXZvuYHmba3zqUFzZOh
 YpketVWVlRhRZJhKzO7rt0RCQ//m/HuNFq9kcgtIPm0xspcHDBV4UnTRsN0fiHbNVWv/
 PPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k7NJ2kSruJ5HI8zjLsk0ibKM6Ps61KF4YP92+a8hCqI=;
 b=Ff+myI9PuvBT1qcp5LDXgxvIDsohJ+HoH5JGDN1CXqTSI1NBAB6h6MJmGk+zQf67mY
 Dp22u6qzkgQdZR9A+KKTm38Kh3EdRcEXt6ov3U5/S1xUbzHSrEiaijEkpWnYWK7+2FLA
 jNcWdOhT1wYkonD+UugGVeTQnJsJe9GqbnBUhyk+rdR8X4Sc+dNlKE0gB7q0S9wyox3R
 ZYh1R20R8QTXYEcV7583aVXQyjf+lsiHrvEq3lTX6jtsGpFO9G008rlZAkQvBRH6VpA3
 Jbqy8ILcTQ0CKN3ljkGZyMTGvIPrY2zo2xcakmUIK4rUDlAR19QW7miMACwDwbpoWcy7
 D/+g==
X-Gm-Message-State: AJIora/MBvuHLe9wv4b3V8X5mc87oA3g2a4lZ/2xxxcMUtKvvMzlSjGT
 4cDaKIGOWj7uSKv+BHwRv+p4fiw4sVt6ymAv
X-Google-Smtp-Source: AGRyM1tW95CMwEILBD179q9c2/MENZ+3VVDsPoHtgnARs9UfBxaP5NpEA+gyhsj/hW5qSjxQOAQKqg==
X-Received: by 2002:a2e:934f:0:b0:24f:ea1:6232 with SMTP id
 m15-20020a2e934f000000b0024f0ea16232mr9560060ljh.135.1659026558840; 
 Thu, 28 Jul 2022 09:42:38 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no.
 [78.26.46.173]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2ea449000000b0025d715bc088sm242522ljn.0.2022.07.28.09.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 09:42:38 -0700 (PDT)
Message-ID: <d674ed95-1e90-8d81-1d1c-cc640808c81e@linaro.org>
Date: Thu, 28 Jul 2022 18:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl,sai: Convert format to
 json-schema
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1659020669-3946-1-git-send-email-shengjiu.wang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1659020669-3946-1-git-send-email-shengjiu.wang@nxp.com>
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

On 28/07/2022 17:04, Shengjiu Wang wrote:
> Convert the NXP SAI binding to DT schema format using json-schema.
> 
> The Synchronous Audio Interface (SAI) provides an interface that
> supports full-duplex serial interfaces with frame synchronization
> formats such as I2S, AC97, TDM, and codec/DSP interfaces.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2
> - fix exclusive property issue
> - fix order issue of compatible, clock-names, dma-names
> 

Thank you for your patch. There is something to discuss/improve.

>  .../devicetree/bindings/sound/fsl,sai.yaml    | 215 ++++++++++++++++++
>  .../devicetree/bindings/sound/fsl-sai.txt     |  95 --------
>  2 files changed, 215 insertions(+), 95 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sai.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/fsl-sai.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> new file mode 100644
> index 000000000000..3e3d99febd69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> @@ -0,0 +1,215 @@
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
> +    oneOf:
> +      - const: fsl,vf610-sai
> +      - const: fsl,imx6sx-sai
> +      - const: fsl,imx6ul-sai
> +      - const: fsl,imx7ulp-sai
> +      - const: fsl,imx8mq-sai
> +      - const: fsl,imx8qm-sai
> +      - const: fsl,imx8ulp-sai

All these are an enum.

> +      - items:
> +          - enum:
> +              - fsl,imx8mm-sai
> +              - fsl,imx8mn-sai
> +              - fsl,imx8mp-sai
> +          - const: fsl,imx8mq-sai
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: receive and transmit interrupt
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    maxItems: 2
> +
> +  clocks:
> +    items:
> +      - description: The ipg clock for register access
> +      - description: master clock source 0 (obsoleted)
> +      - description: master clock source 1
> +      - description: master clock source 2
> +      - description: master clock source 3
> +      - description: PLL clock source for 8kHz series
> +      - description: PLL clock source for 11kHz series
> +    minItems: 4
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: bus
> +          - const: mclk0
> +          - const: mclk1
> +          - const: mclk2
> +          - const: mclk3
> +          - const: pll8k
> +          - const: pll11k
> +        minItems: 4
> +      - items:
> +          - const: bus
> +          - const: mclk1
> +          - const: mclk2
> +          - const: mclk3
> +          - const: pll8k
> +          - const: pll11k
> +        minItems: 4
> +
> +  lsb-first:
> +    $ref: /schemas/types.yaml#/definitions/flag

Be consistent, so:
type:boolean

> +    description: |
> +      Configures whether the LSB or the MSB is transmitted
> +      first for the fifo data. If this property is absent,
> +      the MSB is transmitted first as default, or the LSB
> +      is transmitted first.
> +
> +  big-endian:
> +    description: |
> +      required if all the SAI registers are big-endian rather than little-endian.
> +    type: boolean
> +
> +  fsl,sai-synchronous-rx:
> +    $ref: /schemas/types.yaml#/definitions/flag

type:boolean

> +    description: |
> +      SAI will work in the synchronous mode (sync Tx with Rx) which means
> +      both the transmitter and the receiver will send and receive data by
> +      following receiver's bit clocks and frame sync clocks.
> +
> +  fsl,sai-asynchronous:
> +    $ref: /schemas/types.yaml#/definitions/flag

type:boolean

> +    description: |
> +      SAI will work in the asynchronous mode, which means both transmitter
> +      and receiver will send and receive data by following their own bit clocks
> +      and frame sync clocks separately.
> +      If both fsl,sai-asynchronous and fsl,sai-synchronous-rx are absent, the
> +      default synchronous mode (sync Rx with Tx) will be used, which means both
> +      transmitter and receiver will send and receive data by following clocks
> +      of transmitter.
> +
> +  fsl,dataline:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    description: |
> +      Configure the dataline. It has 3 value for each configuration

and how many items in total?

> +    items:
> +      items:
> +        - description: format Default(0), I2S(1) or PDM(2)
> +          enum: [0, 1, 2]
> +        - description: dataline mask for 'rx'
> +        - description: dataline mask for 'tx'
> +
> +  fsl,sai-mclk-direction-output:
> +    $ref: /schemas/types.yaml#/definitions/flag

boolean

> +    description: |
> +      SAI will output the SAI MCLK clock.
> +
> +  fsl,shared-interrupt:
> +    $ref: /schemas/types.yaml#/definitions/flag

boolean
but the problem is it was not present in previous bindings and a change
in pure conversion was not mentioned/explained in commit msg.

> +    description: |
> +      Interrupt is shared with other modules.
> +
> +  "#sound-dai-cells":
> +    const: 0

Also a new property. If these are already used, please briefly explain
in commit msg the changes to binding from pure conversion.

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,vf610-sai
> +    then:
> +      properties:
> +        dmas:
> +          items:
> +            - description: DMA controller phandle and request line for TX
> +            - description: DMA controller phandle and request line for RX
> +        dma-names:
> +          items:
> +            - const: tx
> +            - const: rx
> +    else:
> +      properties:
> +        dmas:
> +          items:
> +            - description: DMA controller phandle and request line for RX
> +            - description: DMA controller phandle and request line for TX
> +        dma-names:
> +          items:
> +            - const: rx
> +            - const: tx
> +  - if:
> +      required:
> +        - fsl,sai-asynchronous
> +    then:
> +      properties:
> +        fsl,sai-synchronous-rx: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - dmas
> +  - dma-names
> +  - clocks
> +  - clock-names

sound-dai-cells not required and not present in vf610-sai? That's a bit
unusual. Maybe it was missing?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/vf610-clock.h>
> +    sai2: sai@40031000 {
> +        compatible = "fsl,vf610-sai";
> +        reg = <0x40031000 0x1000>;
> +        interrupts = <86 IRQ_TYPE_LEVEL_HIGH>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_sai2_1>;
> +        clocks = <&clks VF610_CLK_PLATFORM_BUS>,
> +                 <&clks VF610_CLK_SAI2>,
> +                 <&clks 0>, <&clks 0>;
> +        clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +        dma-names = "tx", "rx";
> +        dmas = <&edma0 0 21>,
> +               <&edma0 0 20>;
> +        big-endian;
> +        lsb-first;
> +    };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx8mm-clock.h>
> +    sai1: sai@30010000 {
> +        #sound-dai-cells = <0>;
> +        compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";
> +        reg = <0x30010000 0x10000>;

First compatible, then reg, then the rest of properties.

> +        interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk IMX8MM_CLK_SAI1_IPG>,
> +                 <&clk IMX8MM_CLK_DUMMY>,
> +                 <&clk IMX8MM_CLK_SAI1_ROOT>,
> +                 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
> +        clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +        dmas = <&sdma2 0 2 0>, <&sdma2 1 2 0>;
> +        dma-names = "rx", "tx";
> +        fsl,dataline = <1 0xff 0xff 2 0xff 0x11>;
> +    };


Best regards,
Krzysztof
