Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6F8164885
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 16:27:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 359B61695;
	Wed, 19 Feb 2020 16:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 359B61695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582126042;
	bh=y6NAYJ47Ka5YwGm5gy/anEE8klQk5OCZvT1zRhiLZ7w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IXbPAoLgHfIdCHK4vqWqtkybtCxDJAQFnmgCt6/7BTf2GXEuhLGSCZ3qgHSikgEHi
	 eaQAfOz71ydnyI/1Vdq4S8IFKb5Ln+RrKCsOOTSI0kJdPUc7fiUe3mX3T/BdiX+MjE
	 qNr5FHTv2KcCMhVVW5+DL6d5neUWKUY9mNWZX58o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50E71F80142;
	Wed, 19 Feb 2020 16:25:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6557F80142; Wed, 19 Feb 2020 16:25:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF9A8F80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 16:25:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF9A8F80142
Received: by mail-ot1-f66.google.com with SMTP id h9so459354otj.11
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 07:25:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9A6Pw6ubtA8XD2+nVSoO+kGVpenKZJvMby8DWoqvDxQ=;
 b=H07lFJVBm1tZOAsm/SA3vgFW+flYzNzLvIbVkkYZtnVu/vQ4yFISmD/WUIGE4ApDQE
 8awcc0a03WN7wxJDv+hLz5u1yrY4wTBGjhH7sVdrBcyh6xXpaOzlGMTlMXt9VPtzE3fW
 sQ0Y+FpoyyCHnuzuHA0+BSoXqbTiv7NBDCIF2i68u77EgQBx+QRpoBtVOHS8hOvDA3oJ
 fRJT0ulOYl/JVpvnV+VwZLxWdfujV6chXGSGm/nvmDM4GEUQAUW3M6mkGayZPDBHOj/y
 DD2CMus6yBQHP6+jSOuXc106dOZDdQ5KJBuOBu6gFBJ+Wpr5II7Ac28buJjxm8Pm77jM
 KQKA==
X-Gm-Message-State: APjAAAXJLCCCn35EHN3MsX52TQebZdIBNbnmJTIKHqi03nkRb1GulhXY
 UT2XERlFUefz/TfHvbPoig==
X-Google-Smtp-Source: APXvYqz4EKkFWfBwsA+AUk6dcz7mZdu764nBiKi9eG73eELzPOgg8tPTfPvjMlS+TihdEuYh8ej3wA==
X-Received: by 2002:a05:6830:607:: with SMTP id
 w7mr21047225oti.155.1582125933500; 
 Wed, 19 Feb 2020 07:25:33 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z21sm11646oto.52.2020.02.19.07.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 07:25:32 -0800 (PST)
Received: (nullmailer pid 18178 invoked by uid 1000);
 Wed, 19 Feb 2020 15:25:32 -0000
Date: Wed, 19 Feb 2020 09:25:32 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: stm32: convert sai to json-schema
Message-ID: <20200219152532.GA10041@bogus>
References: <20200212131259.18805-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212131259.18805-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, alexandre.torgue@st.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

On Wed, Feb 12, 2020 at 02:12:59PM +0100, Olivier Moysan wrote:
> Convert the STM32 SAI bindings to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
> Changes in v2:
> - use pattern for compatible of child nodes
> - rework dmas and clocks properties
> - add "additionalProperties"
> ---
>  .../bindings/sound/st,stm32-sai.txt           | 107 ----------
>  .../bindings/sound/st,stm32-sai.yaml          | 191 ++++++++++++++++++
>  2 files changed, 191 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.txt b/Documentation/devicetree/bindings/sound/st,stm32-sai.txt
> deleted file mode 100644
> index 944743dd9212..000000000000
> --- a/Documentation/devicetree/bindings/sound/st,stm32-sai.txt
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -STMicroelectronics STM32 Serial Audio Interface (SAI).
> -
> -The SAI interface (Serial Audio Interface) offers a wide set of audio protocols
> -as I2S standards, LSB or MSB-justified, PCM/DSP, TDM, and AC'97.
> -The SAI contains two independent audio sub-blocks. Each sub-block has
> -its own clock generator and I/O lines controller.
> -
> -Required properties:
> -  - compatible: Should be "st,stm32f4-sai" or "st,stm32h7-sai"
> -  - reg: Base address and size of SAI common register set.
> -  - clocks: Must contain phandle and clock specifier pairs for each entry
> -	in clock-names.
> -  - clock-names: Must contain "pclk" "x8k" and "x11k"
> -	"pclk": Clock which feeds the peripheral bus interface.
> -	        Mandatory for "st,stm32h7-sai" compatible.
> -	        Not used for "st,stm32f4-sai" compatible.
> -	"x8k": SAI parent clock for sampling rates multiple of 8kHz.
> -	"x11k": SAI parent clock for sampling rates multiple of 11.025kHz.
> -  - interrupts: cpu DAI interrupt line shared by SAI sub-blocks
> -
> -Optional properties:
> -  - resets: Reference to a reset controller asserting the SAI
> -
> -SAI subnodes:
> -Two subnodes corresponding to SAI sub-block instances A et B can be defined.
> -Subnode can be omitted for unsused sub-block.
> -
> -SAI subnodes required properties:
> -  - compatible: Should be "st,stm32-sai-sub-a" or "st,stm32-sai-sub-b"
> -	for SAI sub-block A or B respectively.
> -  - reg: Base address and size of SAI sub-block register set.
> -  - clocks: Must contain one phandle and clock specifier pair
> -	for sai_ck which feeds the internal clock generator.
> -	If the SAI shares a master clock, with another SAI set as MCLK
> -	clock provider, SAI provider phandle must be specified here.
> -  - clock-names: Must contain "sai_ck".
> -	Must also contain "MCLK", if SAI shares a master clock,
> -	with a SAI set as MCLK clock provider.
> -  - dmas: see Documentation/devicetree/bindings/dma/stm32-dma.txt
> -  - dma-names: identifier string for each DMA request line
> -	"tx": if sai sub-block is configured as playback DAI
> -	"rx": if sai sub-block is configured as capture DAI
> -  - pinctrl-names: should contain only value "default"
> -  - pinctrl-0: see Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> -
> -SAI subnodes Optional properties:
> -  - st,sync: specify synchronization mode.
> -	By default SAI sub-block is in asynchronous mode.
> -	This property sets SAI sub-block as slave of another SAI sub-block.
> -	Must contain the phandle and index of the sai sub-block providing
> -	the synchronization.
> -  - st,iec60958: support S/PDIF IEC6958 protocol for playback
> -	IEC60958 protocol is not available for capture.
> -	By default, custom protocol is assumed, meaning that protocol is
> -	configured according to protocol defined in related DAI link node,
> -	such as i2s, left justified, right justified, dsp and pdm protocols.
> -	Note: ac97 protocol is not supported by SAI driver
> -   - #clock-cells: should be 0. This property must be present if the SAI device
> -	is a master clock provider, according to clocks bindings, described in
> -	Documentation/devicetree/bindings/clock/clock-bindings.txt.
> -
> -The device node should contain one 'port' child node with one child 'endpoint'
> -node, according to the bindings defined in Documentation/devicetree/bindings/
> -graph.txt.
> -
> -Example:
> -sound_card {
> -	compatible = "audio-graph-card";
> -	dais = <&sai1b_port>;
> -};
> -
> -sai1: sai1@40015800 {
> -	compatible = "st,stm32h7-sai";
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	ranges = <0 0x40015800 0x400>;
> -	reg = <0x40015800 0x4>;
> -	clocks = <&rcc SAI1_CK>, <&rcc PLL1_Q>, <&rcc PLL2_P>;
> -	clock-names = "pclk", "x8k", "x11k";
> -	interrupts = <87>;
> -
> -	sai1a: audio-controller@40015804 {
> -		compatible = "st,stm32-sai-sub-a";
> -		reg = <0x4 0x1C>;
> -		clocks = <&rcc SAI1_CK>;
> -		clock-names = "sai_ck";
> -		dmas = <&dmamux1 1 87 0x400 0x0>;
> -		dma-names = "tx";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_sai1a>;
> -
> -		sai1b_port: port {
> -			cpu_endpoint: endpoint {
> -				remote-endpoint = <&codec_endpoint>;
> -				format = "i2s";
> -			};
> -		};
> -	};
> -};
> -
> -audio-codec {
> -	codec_port: port {
> -		codec_endpoint: endpoint {
> -			remote-endpoint = <&cpu_endpoint>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> new file mode 100644
> index 000000000000..51dd2b3bdeb1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> @@ -0,0 +1,191 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/st,stm32-sai.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Serial Audio Interface (SAI)
> +
> +maintainers:
> +  - Olivier Moysan <olivier.moysan@st.com>
> +
> +description:
> +  The SAI interface (Serial Audio Interface) offers a wide set of audio
> +  protocols as I2S standards, LSB or MSB-justified, PCM/DSP, TDM, and AC'97.
> +  The SAI contains two independent audio sub-blocks. Each sub-block has
> +  its own clock generator and I/O lines controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32f4-sai
> +      - st,stm32h7-sai
> +
> +  reg:
> +    items:
> +      - description: Base address and size of SAI common register set.
> +      - description: Base address and size of SAI identification register set.
> +    minItems: 1
> +    maxItems: 2
> +
> +  ranges:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: pclk feeds the peripheral bus interface.
> +      - description: x8k, SAI parent clock for sampling rates multiple of 8kHz.
> +      - description: x11k, SAI parent clock for sampling rates multiple of 11.025kHz.
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: x8k
> +      - const: x11k
> +
> +required:
> +  - compatible
> +  - reg
> +  - ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - clock-names
> +
> +patternProperties:
> +  "^audio-controller@[0-9a-f]+$":
> +    type: object
> +    description:
> +      Two subnodes corresponding to SAI sub-block instances A et B
> +      can be defined. Subnode can be omitted for unsused sub-block.
> +
> +    properties:
> +      compatible:
> +        description: Compatible for SAI sub-block A or B.
> +        pattern: "st,stm32-sai-sub-[ab]"
> +
> +      "#sound-dai-cells":
> +        const: 0
> +
> +      reg:
> +        maxItems: 1
> +
> +      clocks:
> +        items:
> +          - description: sai_ck clock feeding the internal clock generator.
> +          - description: MCLK clock from a SAI set as master clock provider.
> +        minItems: 1
> +        maxItems: 2
> +
> +      clock-names:
> +        items:
> +          - const: sai_ck
> +          - const: MCLK
> +        minItems: 1
> +        maxItems: 2
> +
> +      dmas:
> +        maxItems: 1
> +
> +      dma-names:
> +        description: |
> +          rx: SAI sub-block is configured as a capture DAI.
> +          tx: SAI sub-block is configured as a playback DAI.
> +        enum: [ rx, tx ]
> +
> +      st,sync:
> +        description:
> +          Configure the SAI sub-block as slave of another SAI sub-block.
> +          By default SAI sub-block is in asynchronous mode.
> +          Must contain the phandle and index of the SAI sub-block providing
> +          the synchronization.
> +        allOf:
> +          - $ref: /schemas/types.yaml#definitions/phandle-array
> +          - maxItems: 1
> +
> +      st,iec60958:
> +        description:
> +          If set, support S/PDIF IEC6958 protocol for playback.
> +          IEC60958 protocol is not available for capture.
> +          By default, custom protocol is assumed, meaning that protocol is
> +          configured according to protocol defined in related DAI link node,
> +          such as i2s, left justified, right justified, dsp and pdm protocols.
> +        allOf:
> +          - $ref: /schemas/types.yaml#definitions/flag
> +
> +      "#clock-cells":
> +        description: Configure the SAI device as master clock provider.
> +        const: 0
> +
> +    required:
> +      - compatible
> +      - "#sound-dai-cells"
> +      - reg
> +      - clocks
> +      - clock-names
> +      - dmas
> +      - dma-names
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32f4-sai
> +
> +  - then:

The '-' makes this 2 different schema.

> +      properties:
> +        clocks:
> +          items:
> +            - description: x8k, SAI parent clock for sampling rates multiple of 8kHz.
> +            - description: x11k, SAI parent clock for sampling rates multiple of 11.025kHz.        
> +
> +        clock-names:
> +          items:
> +            - const: x8k
> +            - const: x11k

It is impossible for the first definition and this one to both be true. 
You'll have to put the first definition in an 'else' clause here. 

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    sai1: sai@4400a000 {
> +      compatible = "st,stm32h7-sai";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges = <0 0x4400a000 0x400>;
> +      reg = <0x4400a000 0x4>, <0x4400a3f0 0x10>;
> +      interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&rcc SAI1>, <&rcc PLL1_Q>, <&rcc PLL2_P>;
> +      clock-names = "pclk", "x8k", "x11k";
> +      resets = <&rcc SAI1_R>;
> +
> +      sai1a: audio-controller@4400a004 {
> +        compatible = "st,stm32-sai-sub-a";
> +        #sound-dai-cells = <0>;
> +        reg = <0x4 0x1c>;
> +        clocks = <&rcc SAI1_K>;
> +        clock-names = "sai_ck";
> +        dmas = <&dmamux1 87 0x400 0x01>;
> +        dma-names = "tx";
> +      };
> +    };
> +
> +...
> -- 
> 2.17.1
> 
