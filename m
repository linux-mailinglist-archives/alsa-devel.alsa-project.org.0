Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F18AEB076
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 09:49:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32CB0601BB;
	Fri, 27 Jun 2025 09:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32CB0601BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751010544;
	bh=QUs1HIRYkzhcV/WLpWku/0Yvkva5rL9uluzOdumZ+jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lwMxC+8ihvo0jOdlSAvBP3ylreisJGvniWeA3VxJ/5qCTNvfLvHN/PcxgpUENyLI1
	 kLCydEaPPRlOo+33J7hEwRnYTMvyKwwubl1vzocgkrefuAFFnAvLTc5pL5YOfX3tZL
	 N+UlgnO3VR+kxRooPTz4/PBEwsBjfd0FuGfIs8Eo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 825BAF805C9; Fri, 27 Jun 2025 09:48:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AEE9F805B5;
	Fri, 27 Jun 2025 09:48:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60B57F80217; Fri, 27 Jun 2025 09:48:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C2C9F800E4
	for <alsa-devel@alsa-project.org>; Fri, 27 Jun 2025 09:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C2C9F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b33Jmojq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 092B24415F;
	Fri, 27 Jun 2025 07:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05AE7C4CEE3;
	Fri, 27 Jun 2025 07:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751010503;
	bh=QUs1HIRYkzhcV/WLpWku/0Yvkva5rL9uluzOdumZ+jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b33JmojqYqi7CCpCWfh2uylazIuPcPIMkmIb572fHiQqzWuedGp6Ivbr589A/bJ1J
	 B6GmaWKqSdg7Z9dq+lq6WolamQVSQ+BYOfcmnEdT/TUxtseE1yrQVuSx9bPLoyaeMm
	 3Tr5HOA55KLN2hvwKh+2c6EOIZoDK4sEBYmUaCF/dYYrKbltU2VzNhOrdK6UK1OLrX
	 p8MnUxeUAUOLzGpFMJre99ipYaZ/Tu+6M6fTt0hClm68EEv0Yle9CRE80Kk2v0yqVk
	 rn+b5jHevwCOyGu1Vr6DQ8d9FTwfY4Li2/6EyjPlZ3ubiQKQ9zCgVYNlNWi0/DaJll
	 /NN06lQ4AiFag==
Date: Fri, 27 Jun 2025 09:48:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: broonie@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com, tiwai@suse.de,
 alsa-devel@alsa-project.org, baojun.xu@ti.com,
	shenghao-ding@ti.com, liam.r.girdwood@intel.com, lgirdwood@gmail.com,
 robh@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, navada@ti.com,
 v-hampiholi@ti.com
Subject: Re: [PATCH v3 2/4] dt-bindings: sound: bindings for tac5x1x family
 of codecs
Message-ID: <20250627-tiger-of-undeniable-popularity-ae7b4c@krzk-bin>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
 <20250626181334.1200-3-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626181334.1200-3-niranjan.hy@ti.com>
Message-ID-Hash: E6BOMXPB6YRWUT2RJ3Z5H7UPOUKOFD5Z
X-Message-ID-Hash: E6BOMXPB6YRWUT2RJ3Z5H7UPOUKOFD5Z
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E6BOMXPB6YRWUT2RJ3Z5H7UPOUKOFD5Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 26, 2025 at 11:43:31PM +0530, Niranjan H Y wrote:
> tac5x1x family are series of low-power and high performance
> mono/stereo audio codecs consists of ADC and DAC combinations.
> The family consist of Codecs(DAC & ADC), ADC only and DAC only
> configurations. The documentation explains the list of devices
> in the family, their power supply configurations and gpio
> configuration options available for various functionality.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> 
> ---
> v2:
> - Document newly added dts entries ti,adc1-impedance,
>   ti,adc2-impedance, ti,out2x-vcom-cfg
> v3:
> - add documentation for ti,pdm-input-pins
> - Update required section
> ---
>  .../devicetree/bindings/sound/ti,tac5x1x.yaml | 262 ++++++++++++++++++
>  1 file changed, 262 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml b/Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
> new file mode 100644
> index 000000000000..5fea6513f97f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
> @@ -0,0 +1,262 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (C) 2025 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,tac5x1x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TAC5X1X Codec
> +
> +description: |
> +  TAC5X1X are series of low-power and high performance mono or stereo
> +  audio codecs, as well as multiple inputs and outputs programmable in
> +  single-ended or fully differential configurations. Device supports both
> +  Microphone and Line In input on ADC Channel. DAC Output can be configured
> +  for either Line Out or Head Phone Load.
> +
> +  The serial control bus supports SPI or I2C protocols, while the serial audio
> +  data bus is programmable for I2S, left/right-justified, DSP, or TDM modes.
> +
> +  Specification about the codecs can be found at:
> +    https://www.ti.com/lit/gpn/taa5212
> +    https://www.ti.com/lit/gpn/taa5412-q1
> +    https://www.ti.com/lit/gpn/tac5111
> +    https://www.ti.com/lit/gpn/tac5112
> +    https://www.ti.com/lit/gpn/tac5211
> +    https://www.ti.com/lit/gpn/tac5212
> +    https://www.ti.com/lit/gpn/tac5311-q1
> +    https://www.ti.com/lit/gpn/tac5312-q1
> +    https://www.ti.com/lit/gpn/tac5411-q1
> +    https://www.ti.com/lit/gpn/tac5412-q1
> +    https://www.ti.com/lit/gpn/tad5112
> +    https://www.ti.com/lit/gpn/tad5212
> +
> +maintainers:
> +  - Niranjan H Y <niranjan.hy@ti.com>
> +  - Kevin Lu <kevin-lu@ti.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,taa5212
> +      - ti,taa5412
> +      - ti,tac5111
> +      - ti,tac5112
> +      - ti,tac5211
> +      - ti,tac5212
> +      - ti,tac5311
> +      - ti,tac5312
> +      - ti,tac5411
> +      - ti,tac5412
> +      - ti,tad5112
> +      - ti,tad5212
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,vref:
> +    description: VREF required voltage. If node is omitted then VREF is powered down.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Voltage is in microvolt. Use proper suffix/values.

> +    oneOf:
> +      - const: 0
> +        description: VREF output is powered to 2.75V.
> +      - const: 1
> +        description: VREF output is powered to 2.5V.
> +      - const: 2
> +        description: VREF output is powered to 1.375V.
> +
> +  ti,micbias-vg:
> +    description: MicBias required voltage. If node is omitted then MicBias is powered down.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - const: 0
> +        description: MICBIAS output is same as the VREF output
> +      - const: 1
> +        description: MICBIAS output is 0.5 times the VREF output
> +      - const: 3
> +        description: MICBIAS output is same as the AVDD
> +
> +  avdd-supply:
> +    description: Analog DAC voltage.
> +
> +  iovdd-supply:
> +    description: I/O voltage.
> +
> +  ti,gpios-func:
> +    description: |
> +      Array indicating the GPIO1, GPIO2, GPO1 Functionality in the same order.
> +      Each integer elemnent in the array represent the following
> +      - 0  TAC5X1X_GPIO_DISABLE        - GPIO is Disabled
> +      - 1  TAC5X1X_GPIO_GPI            - General Purpose Input
> +      - 2  ADC3XXX_GPIO_GPO            - General Purpose Output
> +      - 3  TAC5X1X_GPIO_IRQ            - Chip Interrupt
> +      - 4  TAC5X1X_GPIO_PDMCLK         - PDM CLK Output
> +      - 5  TAC5X1X_GPIO_P_DOUT         - Primary ASI DOUT
> +      - 6  TAC5X1X_GPIO_P_DOUT2        - Primary ASI DOUT2
> +      - 7  TAC5X1X_GPIO_S_DOUT         - Secondary ASI DOUT
> +      - 8  TAC5X1X_GPIO_S_DOUT2        - Secondary ASI DOUT2
> +      - 9  TAC5X1X_GPIO_S_BCLK         - Secondary BCLK Output
> +      - 10 TAC5X1X_GPIO_S_FSYNC       - Secondary FSYNC Output
> +      - 11 TAC5X1X_GPIO_CLKOUT        - General Purpose Output
> +      - 12 TAC5X1X_GPIO_DOUT_MUX
> +      - 13 TAC5X1X_GPIO_DAISY_OUT
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 3
> +    maxItems: 3

Don't encode gpios and pins as some custom properties.

> +
> +  ti,gpios-drive:
> +    description: |
> +      Array indicating the GPIO1, GPIO2, GPO1 Driver values
> +      Each number in the array indicate the following driver values.
> +      - 0 # Hi-Z Output
> +      - 1 # Drive active low and active High
> +      - 2 # Drive active low and weak High
> +      - 3 # Drive acive low and Hi-Z
> +      - 4 # Drive weak low and active High
> +      - 5 # Drive Hi-Z and active High
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 3
> +    maxItems: 3

Use standard pinctrl bindings.

> +
> +  ti,pdm-input-pins:
> +    description: |
> +      Array indicating the PDM Data Input for "Ch1 & Ch2" and "Ch3 & Ch4"
> +      respectively. Each number in the array indicate the following
> +      - 0 # PDM input disabled
> +      - 1 # PDM input GPIO1
> +      - 2 # PDM input GPIO2
> +      - 3 # PDM input GPI1
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +

This is v3, but changelog is scarce, no cover letter, no other lore
references. All this is questionable. Plus the style mixing vendor with
standard properties.


> +  ti,gpi1-func:
> +    description: GPI1 Functionality
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # TAC5X1X_GPIO_DISABLE       - I/O buffers powered down and not used
> +      - 1 # TAC5X1X_GPIO_GPI          - General purpose input
> +    default: 0
> +
> +  '#sound-dai-cells':

Missing ref to dai common. Look at other bindings.

> +    const: 0
> +
> +  clocks:
> +    maxItems: 1
> +
> +  ti,gpa-gpio:

Why this appeared here? Looks like totally random sorting.

First goes compatible, then reg, then standard properties, then vendor
properties. I have few more comments but this binding looks terrible. I
suggest you doing extensive initernal review, before you send next
version.


> +    description: GPA using GPIO1 configuration
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # GPA using GPIO1 is disabled
> +      - 1 # GPA using GPIO1
> +    default: 0
> +
> +  ti,in-ch-en:
> +    description: Enable Input channel diagnostics for TAC54XX and TAC53XX device.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # Disable input channel diagnostics
> +      - 1 # Enable input channel diagnostics
> +
> +  ti,out-ch-en:
> +    description: Enable Output channel diagnostics for TAC54XX and TAC53XX device
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # Disable Output channel diagnostics
> +      - 1 # Enable Output channel Diagnostics
> +
> +  ti,incl-se-inm:
> +    description: INxM pin Diagnostics Scan Selection for Single Ended Configuration
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # INxM pin Diagnostics Scan Selection for Single Ended excluded for diagnosis
> +      - 1 # INxM pin Diagnostics Scan Selection for Single Ended included for diagnosis
> +
> +  ti,incl-ac-coup:
> +    description: AC coupled channels pins Scan Selection for Diagnostics
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # AC coupled channels pins Scan Selection for Diagnostics exluded for diagnosis
> +      - 1 # AC coupled channels pins Scan Selection for Diagnostics included for diagnosis
> +
> +  ti,micbias-threshold:
> +    description: Micbias Low and High threshold values for TAC54XX and TAC53XX series
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 2
> +    minItems: 2
> +    items:
> +      minimum: 72
> +      maximum: 162
> +
> +  ti,gpa-threshold:
> +    description: GPA Low and High threshold Values
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 2
> +    minItems: 2
> +    items:
> +      minimum: 75
> +      maximum: 186
> +
> +  ti,adc1-impedance:
> +    description: Channel 1 Input Impedance Value

Use proper units.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # 5 kOhm
> +      - 1 # 10 kOhm
> +      - 2 # 40 kOhm
> +    default: 0
> +
> +  ti,adc2-impedance:
> +    description: Channel 2 Input Impedance Value
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # 5 kOhm
> +      - 1 # 10 kOhm
> +      - 2 # 40 kOhm
> +    default: 0
> +
> +  ti,out2x-vcom-cfg:
> +    description: Channel OUT2x VCOM configuration
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # 0.6 * Vref
> +      - 1 # AVDD by 2
> +    default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - ti,vref
> +  - ti,micbias-vg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      tac5x1x: tac5x1x@52 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Best regards,
Krzysztof

