Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97237154D7F
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 21:48:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E488C16DA;
	Thu,  6 Feb 2020 21:47:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E488C16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581022099;
	bh=JGOWcq/bRA5huNG6SA4YeDbMtwQOZMBsf9SIk277MI0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dTjw8OoZflfrNo+HZJMQJcF3ATQasYNpe3ooPcwn1tAM0OCnBGycR+QH5VPMPk6ku
	 ICOC/Aus1Fro2FudqIfFxjJQ0zgC1HMciv75pVexQ9XWEY5yNgdwpAsLyepd1aVmOQ
	 feDKyufXjqAWN6LcPuhFwlXavy6+2Cz5A2qTEDMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA400F801DB;
	Thu,  6 Feb 2020 21:46:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 870FAF801DB; Thu,  6 Feb 2020 21:46:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D86ADF80059
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 21:46:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D86ADF80059
Received: by mail-pl1-f196.google.com with SMTP id t6so39530plj.5
 for <alsa-devel@alsa-project.org>; Thu, 06 Feb 2020 12:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+JpCejRz9cTdKzvN/s1Lqz/r+3bLOvKPVHP2ixVIjaA=;
 b=WUcS3tHfVKlUD8APq9LPTkuda5ZyyKSxmQ3897q+133CRx0OI7Eb2sYQlSKjsKI13Y
 DUn3y+IqiV2SUJ1joVFEoQRm7wfdajx4XP/WBi4b/aK2+o1gPxO61thkBh2CDGPis7nW
 qPA7EfNuDNeYtC31ZGPFaJD6AwZO+JR5wmbnmiNhCMccgKFLqNByjI1ghSeUP/QAHxht
 y8Pn3ogji0xCm4lTkn4SYiR1tGpLoRWIV30ST5qAuil4f2zr9QEHtjczzquO2kzwkLZG
 VrLuWnX2bRggUvTqUlWwVqRdoqzZSxNm7UGjIYy9lAYr3ipOTORnfWU4kZY8YESmPSvR
 m4cA==
X-Gm-Message-State: APjAAAWNMyV34n6elxMlZCBObXfnmQ6+u1X4Q1974tJNXqQembvVKgkw
 Pn6A/5D5ZDT/Vo1celZ1kQ==
X-Google-Smtp-Source: APXvYqwbC73hm+Agme/rCp48d6/0xYRA1eDWiKJsCgthOldvBiGk6RxTKAWpaJjx1M145Mgn2+p7Ag==
X-Received: by 2002:a17:902:504:: with SMTP id 4mr5425237plf.276.1581021989698; 
 Thu, 06 Feb 2020 12:46:29 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net.
 [63.158.47.182])
 by smtp.gmail.com with ESMTPSA id g7sm288861pfq.33.2020.02.06.12.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 12:46:29 -0800 (PST)
Received: (nullmailer pid 9682 invoked by uid 1000);
 Thu, 06 Feb 2020 18:21:25 -0000
Date: Thu, 6 Feb 2020 18:21:25 +0000
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200206182125.GA23274@bogus>
References: <20200130135040.22575-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130135040.22575-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, alexandre.torgue@st.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: dt-bindings: stm32: convert sai to
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

On Thu, Jan 30, 2020 at 02:50:40PM +0100, Olivier Moysan wrote:
> Convert the STM32 SAI bindings to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  .../bindings/sound/st,stm32-sai.txt           | 107 ----------
>  .../bindings/sound/st,stm32-sai.yaml          | 193 ++++++++++++++++++
>  2 files changed, 193 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.yaml


> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> new file mode 100644
> index 000000000000..33dca007fc86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> @@ -0,0 +1,193 @@
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
> +      enum: [ pclk, x8k, x11k ]
> +    minItems: 3
> +    maxItems: 3
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
> +        enum:
> +          - st,stm32-sai-sub-a
> +          - st,stm32-sai-sub-b

pattern: 'st,stm32-sai-sub-[ab]'

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
> +        items:
> +          - description: SAI sub-block is configured as a capture DAI.
> +          - description: SAI sub-block is configured as a playback DAI.
> +        minItems: 1
> +        maxItems: 1

This is defining that dmas has 2 entries, but then limits it to the 1st 
entry only.

> +
> +      dma-names:
> +        items:
> +          - enum: [ rx, tx ]
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

       additionalProperties: false.

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32f4-sai
> +
> +  - then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +
> +        clock-names:
> +          items:
> +            enum: [ x8k, x11k ]

Define the order.

> +          minItems: 2
> +          maxItems: 2
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
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
