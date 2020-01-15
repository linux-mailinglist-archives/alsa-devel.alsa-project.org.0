Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F23E913C8D4
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 17:09:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7472417A8;
	Wed, 15 Jan 2020 17:08:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7472417A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579104578;
	bh=0E333IZD00UXyPyAqkxkrfAw1rARyE0Smyxn0kN0PmA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FCBkSIFEtMwjQf943LWvIr4uEbHWHK+Bq1KZdoKkrtrkO4OCcxvvSMOT2z/ZpCubn
	 1ovlEOzMsq5CT5HdHmKCAaivKNWV0rfAvelzsouPnbjQxaI/Io4jyV7Dgr6fSxp0hA
	 YdbAPw1Z2KuRocr1lQ0QXCwPiYA8NUgxDd7OHDzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CEB5F801EB;
	Wed, 15 Jan 2020 17:07:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF85CF801EB; Wed, 15 Jan 2020 17:07:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 535DBF800CC
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 17:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 535DBF800CC
Received: by mail-ot1-f67.google.com with SMTP id z9so14427849oth.5
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 08:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GgrG+HKS7SJS1YSumldfNDhrIEBU95RMvZklBq/bHds=;
 b=aqx+QjSCmgdBe+NlElUHtQpHeM08qfNDVi71IctcmMNAcSWNW3uAVBl+vNDnuWFzCp
 ZykDpgisWv2+ubmtzchLecAqu6AOMHpppfG6LidLQESUXhRXFlZElealgRagDnYHN4Tu
 4gQ/Vzs1xw4sbM+mmJpBkWOif+pifZEXWdDPMvXoDJtzCxWEjLWJ/l/nJoltfICUhjEa
 IXNZPhfqhAVIEBktDwpVzuAqWwkY4aD5dwrr92S89/pEiYbaVCPUbvzI5DHct6OigeO4
 fJ8qWy4LdcPkwWGCCyknqAoVYW5Uc1CKXjzQBp7ro/63qk659B/2IBfJ7MMnKiAd4VGx
 pZ4A==
X-Gm-Message-State: APjAAAWQarmCCKG5eYQ7wXq3CvRRKLBUkUHwBq+3qcbCuiZT1+Wdtvh6
 3ArLr+ahL72VP3+AsDMnJ0O3bVI=
X-Google-Smtp-Source: APXvYqwZo9F+Cz+vJWZnKFupNXWNM4M/6MaJpSldcE6Rf9751rHLt4lfrgsiUz0907O+8lFXvaMv+A==
X-Received: by 2002:a9d:5545:: with SMTP id h5mr3306203oti.296.1579104463751; 
 Wed, 15 Jan 2020 08:07:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l17sm6800696ota.27.2020.01.15.08.07.42
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 08:07:42 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 220379
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 15 Jan 2020 10:07:41 -0600
Date: Wed, 15 Jan 2020 10:07:41 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200115160741.GA20174@bogus>
References: <20200113161954.29779-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113161954.29779-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, alexandre.torgue@st.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: dt-bindings: stm32: convert spdfirx
	to json-schema
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

On Mon, Jan 13, 2020 at 05:19:54PM +0100, Olivier Moysan wrote:
> Convert the STM32 SPDIFRX bindings to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  .../bindings/sound/st,stm32-spdifrx.txt       | 56 -------------
>  .../bindings/sound/st,stm32-spdifrx.yaml      | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 56 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
> deleted file mode 100644
> index 33826f2459fa..000000000000
> --- a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -STMicroelectronics STM32 S/PDIF receiver (SPDIFRX).
> -
> -The SPDIFRX peripheral, is designed to receive an S/PDIF flow compliant with
> -IEC-60958 and IEC-61937.
> -
> -Required properties:
> -  - compatible: should be "st,stm32h7-spdifrx"
> -  - reg: cpu DAI IP base address and size
> -  - clocks: must contain an entry for kclk (used as S/PDIF signal reference)
> -  - clock-names: must contain "kclk"
> -  - interrupts: cpu DAI interrupt line
> -  - dmas: DMA specifiers for audio data DMA and iec control flow DMA
> -    See STM32 DMA bindings, Documentation/devicetree/bindings/dma/stm32-dma.txt
> -  - dma-names: two dmas have to be defined, "rx" and "rx-ctrl"
> -
> -Optional properties:
> -  - resets: Reference to a reset controller asserting the SPDIFRX
> -
> -The device node should contain one 'port' child node with one child 'endpoint'
> -node, according to the bindings defined in Documentation/devicetree/bindings/
> -graph.txt.
> -
> -Example:
> -spdifrx: spdifrx@40004000 {
> -	compatible = "st,stm32h7-spdifrx";
> -	reg = <0x40004000 0x400>;
> -	clocks = <&rcc SPDIFRX_CK>;
> -	clock-names = "kclk";
> -	interrupts = <97>;
> -	dmas = <&dmamux1 2 93 0x400 0x0>,
> -	       <&dmamux1 3 94 0x400 0x0>;
> -	dma-names = "rx", "rx-ctrl";
> -	pinctrl-0 = <&spdifrx_pins>;
> -	pinctrl-names = "default";
> -
> -	spdifrx_port: port {
> -		cpu_endpoint: endpoint {
> -			remote-endpoint = <&codec_endpoint>;
> -		};
> -	};
> -};
> -
> -spdif_in: spdif-in {
> -	compatible = "linux,spdif-dir";
> -
> -	codec_port: port {
> -		codec_endpoint: endpoint {
> -			remote-endpoint = <&cpu_endpoint>;
> -		};
> -	};
> -};
> -
> -soundcard {
> -	compatible = "audio-graph-card";
> -	dais = <&spdifrx_port>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> new file mode 100644
> index 000000000000..ab8e9d74ac3c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/st,stm32-spdifrx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 S/PDIF receiver (SPDIFRX)
> +
> +maintainers:
> +  - Olivier Moysan <olivier.moysan@st.com>
> +
> +description: |
> +  The SPDIFRX peripheral, is designed to receive an S/PDIF flow compliant with
> +  IEC-60958 and IEC-61937.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32h7-spdifrx
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: kclk
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  dmas:
> +    items:
> +      - description: audio data capture DMA
> +      - description: IEC status bits capture DMA
> +    minItems: 1
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: rx-ctrl
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

Needs a:

additionalProperties: false

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    spdifrx: spdifrx@40004000 {
> +        compatible = "st,stm32h7-spdifrx";
> +        #sound-dai-cells = <0>;
> +        reg = <0x40004000 0x400>;
> +        clocks = <&rcc SPDIF_K>;
> +        clock-names = "kclk";
> +        interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +        dmas = <&dmamux1 2 93 0x400 0x0>,
> +               <&dmamux1 3 94 0x400 0x0>;
> +        dma-names = "rx", "rx-ctrl";
> +        pinctrl-0 = <&spdifrx_pins>;
> +        pinctrl-names = "default";
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
