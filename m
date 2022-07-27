Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 261C7582983
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 17:23:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0CCA1638;
	Wed, 27 Jul 2022 17:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0CCA1638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658935395;
	bh=JpYad2BAPh0ZUMqMGpwGU3gh/gL4aXVfkvbtu30/ENg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lmKEJ6lILwOeGGPCdCsIHc8hWc7i9bM9v+jihqMd9TLOtTPHnpohHrXU4fTY6/Xih
	 55pNIYoWBlAbTWnFb4MOO8CPP+ZBnYrrRtEkZdy76l5HQfr+VWnHedhjsWcg7I1xeT
	 cB2bSpDLcyU5nizELpm373hNsMn9G4SStN3rY1TQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6935AF80171;
	Wed, 27 Jul 2022 17:22:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F11DAF8015B; Wed, 27 Jul 2022 17:22:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1DCDF8014E
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 17:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1DCDF8014E
Received: by mail-io1-f53.google.com with SMTP id n138so13806814iod.4
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 08:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wjYTAGA/VZ3ZniZqjTtfUNrJP4ztDLjgxacwIkFNs6Q=;
 b=DjcTfUcgYarzRgbwe5mdi3KUfsWYfusocpyZDBxLy6CuNwsTmEN+3CBMLJqS+UM5XU
 03beFVgHsSaHfL2xR8a+xrTpbhAcfDyOskwSHq4wlEdCq8C5JMPlsJnEARuwKIV38TMF
 NtaxKX5gXH2gNyGJatu4h5Ffq1UmE5b5IRfX4OiBHhcVO6v0Mq1nS3LXBT1Ap5ehNjTT
 2J3H4wshwdmZ5Ddsc+CW3JFCESjP+vsfA0VReuqHIfnMZCj8kznMkTSEZTfpTiO6WEnW
 5Dknqd5zJdLyJgAiJhXYNS9eK5KYiNsfw60+tAgA9xKEFPV4hPqrQ8UMnIhzgA89OO+d
 0ovw==
X-Gm-Message-State: AJIora92BWlGVGLu1/mtiGSOQaB4sgcW26d3VEuAeVppkWJ6ke5zaiI3
 kARF+NJjpO2AKch0PCN9hQ==
X-Google-Smtp-Source: AGRyM1vC33wWQu8+g4EEwhee47QaNR7r4PO7l/xs7XwRvzOZjbQsVp+65gFQC/S+wl+Gw09noEqc0Q==
X-Received: by 2002:a05:6638:2684:b0:341:5862:75dd with SMTP id
 o4-20020a056638268400b00341586275ddmr9401915jat.166.1658935325162; 
 Wed, 27 Jul 2022 08:22:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 b66-20020a0295c8000000b0033f258426c0sm7794275jai.108.2022.07.27.08.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:22:04 -0700 (PDT)
Received: (nullmailer pid 2693193 invoked by uid 1000);
 Wed, 27 Jul 2022 15:22:03 -0000
Date: Wed, 27 Jul 2022 09:22:03 -0600
From: Rob Herring <robh@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: Add Everest ES8326 audio CODEC
Message-ID: <20220727152203.GA2681685-robh@kernel.org>
References: <20220726131747.127992-1-zhuning0077@gmail.com>
 <20220726131747.127992-2-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726131747.127992-2-zhuning0077@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, broonie@kernel.org, Zhu Ning <zhuning@everest-semi.com>,
 David Yang <yangxiaohua@everest-semi.com>
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

On Tue, Jul 26, 2022 at 09:17:47PM +0800, Zhu Ning wrote:
> Add device tree binding documentation for Everest ES8326
> 
> Signed-off-by: David Yang <yangxiaohua@everest-semi.com>
> Signed-off-by: Zhu Ning <zhuning@everest-semi.com>
> ---
>  .../bindings/sound/everest,es8326.yaml        | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/sound/everest,es8326.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/everest,es8326.yaml b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
> new file mode 100755
> index 000000000000..f6aa3c03d456
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Everest ES8326 audio CODEC
> +
> +maintainers:
> +  - David Yang <yangxiaohua@everest-semi.com>
> +
> +properties:
> +  compatible:
> +    const: everest,es8326
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock for master clock (MCLK)
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  everest,jack-pol:
> +    description:
> +      just the value of reg 57. Bit(3) decides whether the jack polarity is inverted.
> +      Bit(2) decides whether the bottom on the headset is inverted.

s/bottom/button/?

> +      Bit(1)/(0) decides the mic properity to be OMTP/CTIA or auto.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array

Array or...

> +    minimum: 0
> +    maximum: 0x0f
> +    default: 0x0f

Scalar?

> +  
> +  everest,mic1-src:
> +    description:
> +      the value of reg 2A when headset plugged.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minimum: 0x00
> +    maximum: 0x77
> +    default: 0x22
> +
> +  everest,mic2-src:
> +    description:
> +      the value of reg 2A when headset unplugged.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minimum: 0x00
> +    maximum: 0x77
> +    default: 0x44
> +
> +  everest,jack-detect-inverted:
> +    description:
> +      Defined to invert the jack detection.

What's the difference with this and bit 3 of everest,jack-pol?

We already have numerous vendor properties for jack detect. Can we come 
up with something common?

The problem with 'inverted' is it assumes you know the non-inverted 
state. Better to just state high or low.

> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +
> +

Extra blank line.

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {

i2c {

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      es8326: codec@19 {
> +        compatible = "everest,es8326";
> +        reg = <0x19>;
> +        clocks = <&clks 10>;
> +        clock-names = "mclk";
> +        #sound-dai-cells = <0>;
> +        everest,mic1-src = [22];
> +        everest,mic2-src = [44];
> +        everest,jack-pol = [0e];
> +      };
> +    };
> -- 
> 2.36.1
> 
> 
