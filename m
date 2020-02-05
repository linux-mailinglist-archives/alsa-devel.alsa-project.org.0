Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 050C61535F4
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 18:10:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70D781693;
	Wed,  5 Feb 2020 18:09:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70D781693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580922624;
	bh=/Mng73yq9zxLWGRlvgNe6ta5EDVY2kv/mGGMeZ4VcAA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NK0jZkqrcgpUG7YnD46k4rgpZjVOfXUiniZMq56H0GIpSuoag+Nl9zqdT4/HJ8CYG
	 tINOKfKSV7DsqAmvJ+MQBr3kV+ApZHW21qYIOJCi84+mXVtJbJ0Hcw1bOvJCty+xBY
	 Bx7fqN6BrC/A6krHNYy2y0J7dqPvDVGgy8TNrPkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E28FF800E2;
	Wed,  5 Feb 2020 18:08:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E268F80148; Wed,  5 Feb 2020 18:08:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC72DF800E2
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 18:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC72DF800E2
Received: by mail-wr1-f66.google.com with SMTP id z9so3639008wrs.10
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 09:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wVyS98mSn4UeFr2rUO9PasOfBrlg4kFydqotmUAfD/w=;
 b=rtr6KDm9FigFE16jg5AE0O6vOsBFmqBXqpMxkRNctH+gR3iM7uV1Jo/6g8RMcSB4Ja
 woHvtTkd3PWbXRYEk/CUzLoeLA1NfhOhOzP34v0G4JzH4FbuxHruFF5vOGD4UU1zCgOK
 YRV+n/ikoeTGQWay0wyH6ew408bImCtcDxC/yJYXht3v2QUWx+SogY09fzeVQBGOfusU
 KZYknQ/KmS+BYBlv/VEAsclSMqWU48wjdAgkz4KHjxVPgMYnclmbfi9PuuyXDdYeubuZ
 mUMTo8zumjbDdrSHwGG01D+HskcgWll0E3ewqQbKSbvjvucF57RhfypK+zr255F4XSpq
 4C2A==
X-Gm-Message-State: APjAAAXj+VBEgzgjgpg5SINXVS9WHdE041hq13rpOAC+AhHyFTZ7wCCF
 qqczhUCrywK9mdB2Qtx/SQ==
X-Google-Smtp-Source: APXvYqwaQiQMAa8h+Izmp9nvuziS6m0uiZRyCGM1+IZ+qyjy4io1DJ/1o+lCJNm/dF9gYXsu8JczlA==
X-Received: by 2002:adf:ecd0:: with SMTP id s16mr28949693wro.325.1580922514565; 
 Wed, 05 Feb 2020 09:08:34 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.166])
 by smtp.gmail.com with ESMTPSA id q1sm561081wrw.5.2020.02.05.09.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 09:08:33 -0800 (PST)
Received: (nullmailer pid 27473 invoked by uid 1000);
 Wed, 05 Feb 2020 17:08:32 -0000
Date: Wed, 5 Feb 2020 17:08:32 +0000
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200205170832.GA19383@bogus>
References: <20200127125420.29827-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127125420.29827-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, alexandre.torgue@st.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: dt-bindings: stm32: convert i2s to
	json-schema
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Jan 27, 2020 at 01:54:20PM +0100, Olivier Moysan wrote:
> Convert the STM32 I2S bindings to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
> The items for dma-names and clock-names properties are all
> mandatory, but may be provided in any order.
> The syntax used for these properties allows to avoid order constraint.

Other than having .dts files with differing order, I don't see any 
reason we need to allow any order here. So decide which order is most 
prevalent and use that, and then fix the other dts files.

> ---
>  .../bindings/sound/st,stm32-i2s.txt           | 62 -------------
>  .../bindings/sound/st,stm32-i2s.yaml          | 91 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.txt b/Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
> deleted file mode 100644
> index cbf24bcd1b8d..000000000000
> --- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -STMicroelectronics STM32 SPI/I2S Controller
> -
> -The SPI/I2S block supports I2S/PCM protocols when configured on I2S mode.
> -Only some SPI instances support I2S.
> -
> -Required properties:
> -  - compatible: Must be "st,stm32h7-i2s"
> -  - reg: Offset and length of the device's register set.
> -  - interrupts: Must contain the interrupt line id.
> -  - clocks: Must contain phandle and clock specifier pairs for each entry
> -	in clock-names.
> -  - clock-names: Must contain "i2sclk", "pclk", "x8k" and "x11k".
> -	"i2sclk": clock which feeds the internal clock generator
> -	"pclk": clock which feeds the peripheral bus interface
> -	"x8k": I2S parent clock for sampling rates multiple of 8kHz.
> -	"x11k": I2S parent clock for sampling rates multiple of 11.025kHz.
> -  - dmas: DMA specifiers for tx and rx dma.
> -    See Documentation/devicetree/bindings/dma/stm32-dma.txt.
> -  - dma-names: Identifier for each DMA request line. Must be "tx" and "rx".
> -  - pinctrl-names: should contain only value "default"
> -  - pinctrl-0: see Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> -
> -Optional properties:
> -  - resets: Reference to a reset controller asserting the reset controller
> -
> -The device node should contain one 'port' child node with one child 'endpoint'
> -node, according to the bindings defined in Documentation/devicetree/bindings/
> -graph.txt.
> -
> -Example:
> -sound_card {
> -	compatible = "audio-graph-card";
> -	dais = <&i2s2_port>;
> -};
> -
> -i2s2: audio-controller@40003800 {
> -	compatible = "st,stm32h7-i2s";
> -	reg = <0x40003800 0x400>;
> -	interrupts = <36>;
> -	clocks = <&rcc PCLK1>, <&rcc SPI2_CK>, <&rcc PLL1_Q>, <&rcc PLL2_P>;
> -	clock-names = "pclk", "i2sclk",  "x8k", "x11k";
> -	dmas = <&dmamux2 2 39 0x400 0x1>,
> -           <&dmamux2 3 40 0x400 0x1>;
> -	dma-names = "rx", "tx";
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_i2s2>;
> -
> -	i2s2_port: port@0 {
> -		cpu_endpoint: endpoint {
> -			remote-endpoint = <&codec_endpoint>;
> -			format = "i2s";
> -		};
> -	};
> -};
> -
> -audio-codec {
> -	codec_port: port@0 {
> -		codec_endpoint: endpoint {
> -			remote-endpoint = <&cpu_endpoint>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> new file mode 100644
> index 000000000000..cdfb375c7a14
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/st,stm32-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 SPI/I2S Controller
> +
> +maintainers:
> +  - Olivier Moysan <olivier.moysan@st.com>
> +
> +description:
> +  The SPI/I2S block supports I2S/PCM protocols when configured on I2S mode.
> +  Only some SPI instances support I2S.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32h7-i2s
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock feeding the peripheral bus interface.
> +      - description: clock feeding the internal clock generator.
> +      - description: I2S parent clock for sampling rates multiple of 8kHz.
> +      - description: I2S parent clock for sampling rates multiple of 11.025kHz.
> +
> +  clock-names:
> +    items:
> +      - enum: [ pclk, i2sclk, x8k, x11k ]
> +      - enum: [ pclk, i2sclk, x8k, x11k ]
> +      - enum: [ pclk, i2sclk, x8k, x11k ]
> +      - enum: [ pclk, i2sclk, x8k, x11k ]
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string-array

*-names already has a type, so this is not needed.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  dmas:
> +    items:
> +      - description: audio capture DMA.
> +      - description: audio playback DMA.
> +
> +  dma-names:
> +    items:
> +      - enum: [ rx, tx ]
> +      - enum: [ rx, tx ]
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string-array
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - "#sound-dai-cells"
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - dmas
> +  - dma-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    i2s2: audio-controller@4000b000 {
> +        compatible = "st,stm32h7-i2s";
> +        #sound-dai-cells = <0>;
> +        reg = <0x4000b000 0x400>;
> +        clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
> +        clock-names = "pclk", "i2sclk", "x8k", "x11k";
> +        interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +        dmas = <&dmamux1 39 0x400 0x01>,
> +               <&dmamux1 40 0x400 0x01>;
> +        dma-names = "rx", "tx";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&i2s2_pins_a>;
> +    };
> +
> +...
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
