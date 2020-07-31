Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D21E6234D06
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 23:32:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EBF41686;
	Fri, 31 Jul 2020 23:31:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EBF41686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596231151;
	bh=NHsr3aFIVXcbgVNcABj+122r90mMVIkb6+W2zQXbddw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hYjVYlWgyk0rudNKk7uISyPwk4qd2kN2ZWa5P1eTT/HZlNEnLw7ePSEn5nR/MSgHq
	 jPFYERRVROn0mVkmR+N+o5FGKsF+Tu8yXHBFQcfeBEuFrEDRmSgrZNgsLruShis85v
	 /wLFnizxF7hO/6u8a7s2XdyxLwWJM+DkN6205Hqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6170CF801A3;
	Fri, 31 Jul 2020 23:30:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87E9FF80171; Fri, 31 Jul 2020 23:30:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BBF0F80111
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 23:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BBF0F80111
Received: by mail-io1-f66.google.com with SMTP id k23so32995644iom.10
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 14:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+1TGdSM7ebRYhzsfJccNqgk5kV9sG3dUDdM4DYu83Fw=;
 b=cuv6zQxGSYau4GwhyX9MFkB+Moxn/wMaXORx3vnrUWmfmhK4kAvv9yBSC4mJ2/K+mz
 iSDtmJjxG43iyXKit0bbmyEnx/CsSqjNtYdRquZ/EEMxasIacXBvxBP3eJUXeiI5Etj/
 ylI26o7QgZ7VJthnIjOuh+ohu9bYsc5aCmzwLGvJjJHN8SHO/OLpR4lKFlgutL77N72i
 Hu6l9vL8ATFQrMZY7qESxQQN5tCxUcjg2Mf9jPo/plrERh3tbMgATl/Mt3VArOpXn2d1
 Nrro/jEvqoqaEblB7LuV/++0KFw5kuDBotF/kCFNScQtfC9oHmfGTV9IVAxZDzbIW2rH
 gpXw==
X-Gm-Message-State: AOAM533x97LBr6cxifVKQutR5SY66aS09z2Lza/d3znt5UYcCH5cQ6Kv
 vkocgzOvtaxhvkhdmudF8w==
X-Google-Smtp-Source: ABdhPJxXeVS0jZueBStQpy+cdWH/c/tpvRGzhw0OjxjNfquqY5ZbETuEj8pXTjXPXY5xHhqTIYPArg==
X-Received: by 2002:a02:84ac:: with SMTP id f41mr2890486jai.56.1596231030696; 
 Fri, 31 Jul 2020 14:30:30 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id i9sm5682020ile.48.2020.07.31.14.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 14:30:30 -0700 (PDT)
Received: (nullmailer pid 827984 invoked by uid 1000);
 Fri, 31 Jul 2020 21:30:28 -0000
Date: Fri, 31 Jul 2020 15:30:28 -0600
From: Rob Herring <robh@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add DT bindings for Microchip
 S/PDIF TX Controller
Message-ID: <20200731213028.GA824739@bogus>
References: <20200729101922.3033616-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729101922.3033616-1-codrin.ciubotariu@microchip.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 alexandre.belloni@bootlin.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, ludovic.desroches@microchip.com, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, nicolas.ferre@microchip.com
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

On Wed, Jul 29, 2020 at 01:19:21PM +0300, Codrin Ciubotariu wrote:
> This patch adds DT bindings for the new Microchip S/PDIF TX Controller
> embedded inside sama7g5 SoCs.
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
> 
> Changes in v2:
>  - replaced https with http
>  - reworked example, included bindings;
> 
>  .../bindings/sound/mchp,spdiftx.yaml          | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml b/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
> new file mode 100644
> index 000000000000..2b7c27391f0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mchp,spdiftx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip S/PDIF Tx Controller Device Tree Bindings
> +
> +maintainers:
> +  - Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> +
> +description:
> +        The Microchip Sony/Philips Digital Interface Transmitter is a
> +        serial port compliant with the IEC-60958 standard.
> +
> +properties:
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  compatible:
> +    oneOf:
> +      - const: microchip,sama7g5-spdiftx

No need for 'oneOf' when only 1 entry.

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
> +    description: TX DMA Channel

How many? (maxItems: 1)

> +
> +  dma-names:
> +    const: tx
> +
> +  pinctrl-0: true
> +
> +  pinctrl-names:
> +    const: default

You can drop pinctrl props. They are always allowed.

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
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/dma/at91.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    spdiftx@e1618000 {
> +        #sound-dai-cells = <0>;
> +        compatible = "microchip,sama7g5-spdiftx";
> +        reg = <0xe1618000 0x4000>;
> +        interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +        dmas = <&dma0 AT91_XDMAC_DT_PERID(50)>;
> +        dma-names = "tx";
> +        clocks = <&pmc PMC_TYPE_PERIPHERAL 85>, <&pmc PMC_TYPE_GCK 85>;
> +        clock-names = "pclk", "gclk";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_spdiftx_default>;
> +    };
> -- 
> 2.25.1
> 
