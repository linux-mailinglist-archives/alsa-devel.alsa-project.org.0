Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C444A13FCE4
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 00:19:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5063E17D7;
	Fri, 17 Jan 2020 00:19:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5063E17D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579216795;
	bh=GdxTUczUHwpAxZp7R28b1XADPqrpXP1SIoh1W7ZSnPI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PuqbDYnS9OSkQiLH5FMBqOCi1+xeI9dYnbZ+gFIY/KwsiucbsD1oJrkDayq+0PulO
	 yXZLhFNf2wZuIinlkFllQFWUxm+5e3EGj3xasZhWC9OjQ2NQwDb49NnuWWLgJ4V+MF
	 jfWGnqvKMyccuQkz8jh3mz2F9mSKoT90iPK+DWZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00792F8014E;
	Fri, 17 Jan 2020 00:18:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F875F8014E; Fri, 17 Jan 2020 00:18:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A62FF800E9
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 00:18:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A62FF800E9
Received: by mail-oi1-f195.google.com with SMTP id l9so20499835oii.5
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 15:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AxYTHo1xbvVXlE9BL422q+BMWDP33NtgDNx+D8mvMAI=;
 b=ZeHPRtdlcBSAY8TGDYmymH9hd4DFOhlHx8HPpt+dthkKGhdBybwk98msjCS8pyWxPS
 vGpu5BAzhdSQii4Z+nf6Nrz+bKek6/U4a+6yUugyvdMPcrN0fUtlQWHT33io8PDkrC0K
 l1aIAcaVroByUMerRNprzGGDJt05QPxAiKriUNEm+1AaifWXf3uekUQ7QqRNifEYQBfm
 CirLWv3c62qX6Zv7qZ3Qg6jGa27RI3UA9UncyGrQEYBsefl4yLkXDsnNRz7pp5RgMU2p
 qdzdoy+c5SsTYG9GQGccXLwRMVYoaHS+4khd8vTK90i6SIDiFfSuxZOcqXx691iGWFC7
 OuRA==
X-Gm-Message-State: APjAAAU9tD+lYXNVLgjocRxYxabYXVYSCceV7ee1I7s8vEVAsOJrr7M4
 DmNM5Ge/H1X+xXli9jhbbA==
X-Google-Smtp-Source: APXvYqzZJygX0GSguvTQM81bKzfOop6LBjuapSvKPn1gt2ZgNjWt9VE/fJhIO05KbnfYneSZhP3g+A==
X-Received: by 2002:aca:c386:: with SMTP id t128mr1347117oif.32.1579216683166; 
 Thu, 16 Jan 2020 15:18:03 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e21sm7211797oib.16.2020.01.16.15.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 15:18:02 -0800 (PST)
Received: (nullmailer pid 30679 invoked by uid 1000);
 Thu, 16 Jan 2020 23:18:01 -0000
Date: Thu, 16 Jan 2020 17:18:01 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200116231801.GA18958@bogus>
References: <20200116105244.13485-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116105244.13485-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, alexandre.torgue@st.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v2] ASoC: dt-bindings: stm32: convert
 spdfirx to json-schema
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

On Thu, Jan 16, 2020 at 11:52:44AM +0100, Olivier Moysan wrote:
> Convert the STM32 SPDIFRX bindings to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
> Changes in v2:
> - Add "additionalProperties: false"
> - Also change minItems to 2 for dmas property, as both DMAs are required.
> ---
>  .../bindings/sound/st,stm32-spdifrx.txt       | 56 -------------
>  .../bindings/sound/st,stm32-spdifrx.yaml      | 84 +++++++++++++++++++
>  2 files changed, 84 insertions(+), 56 deletions(-)
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
> index 000000000000..e19313e7a552
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> @@ -0,0 +1,84 @@
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
> +    description: |
> +      Two DMA channel specifiers are requested:
> +      - audio data capture DMA
> +      - IEC status bits capture DMA
> +      See STM32 DMA bindings /bindings/dma/stm32-dma.txt.
> +    minItems: 2
> +    maxItems: 2

dmas:
  items:
    - description: audio data capture DMA
    - description: IEC status bits capture DMA

And minItems/maxItems aren't necessary.

I'd probably just drop 'See STM32 DMA bindings 
/bindings/dma/stm32-dma.txt' too, so we don't have to update this when 
that file is converted to schema.

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
> +
> +additionalProperties: false
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
