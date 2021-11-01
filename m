Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D41684421D1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 21:44:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C9D816C2;
	Mon,  1 Nov 2021 21:43:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C9D816C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635799464;
	bh=PvRb2rEhVIkOFbZerj6gb9pgKHWO3Yzf2qVGscuHKy8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YOuxFSEzLPKCyudkBXJmrx9GIZltAgAnOND1U4NGuW3NhHTywkXs4PVQKA2NUWKHX
	 F8oab7k6sztjrV+tmUhpHkmyeG3Bfl/loxDchQb8vSKu7z/03UEbqw1HAc1gTWnSRC
	 z0n+hF5XjQohhBqwEC/XT6mSu18Gajsz9cUj8J9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8C3EF8026A;
	Mon,  1 Nov 2021 21:43:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FF07F80269; Mon,  1 Nov 2021 21:43:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2EBEF800F8
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 21:42:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2EBEF800F8
Received: by mail-ot1-f49.google.com with SMTP id
 v19-20020a9d69d3000000b00555a7318f31so14911901oto.9
 for <alsa-devel@alsa-project.org>; Mon, 01 Nov 2021 13:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6XmLD1tf33R8zNulmrEx9TFPuJ2K8guHdhHllFjxLyA=;
 b=hQxkVz+s5DShIAWpIWMJwPbX5oKukK6Y2JaThx/0JK2Vf8PTlpGPot1nLXP58WWr8k
 5FAgTACpOCnzC6Kt5vG+LhiefMCZatzhaGs57s7ZUAmCnw+sUj4s6BXrrw6zDKIQVbwa
 /lBwWnPZIdlXwltQupOdDHxYuOyjJHp5+YqPPvRJ+j/ICgCtWKBxdtoxFIwWinVIEEj5
 HYVxIwA4/7ZZvISHspc+IRGuumCYFftiNbgzPsJS6vOnHt4kfai2QULhIcY+eZ0sDDwt
 xh2Yag+BVpmD9myjiDVQMiaNXFzu9bquH+5suj9JVy7q14hs+XqAkXHnYvZBOlxHoOuw
 X3AA==
X-Gm-Message-State: AOAM532EbX9hoIJXExPu3sfVzO+G9D/2ZQEX3ZMgXzvTB4gGXS7Zb9R7
 Ut6GygrY1bFQXf1wwKUj9Q==
X-Google-Smtp-Source: ABdhPJxscEje9FZjKPre0A3wtKEBLzMUwMMLeisaDEey4x+MSqQ4+ZrEmkgbh0Cx6okZG9gaLaDGfA==
X-Received: by 2002:a05:6830:4410:: with SMTP id
 q16mr7253707otv.322.1635799374825; 
 Mon, 01 Nov 2021 13:42:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 62sm1017437ooa.47.2021.11.01.13.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 13:42:54 -0700 (PDT)
Received: (nullmailer pid 1013431 invoked by uid 1000);
 Mon, 01 Nov 2021 20:42:52 -0000
Date: Mon, 1 Nov 2021 15:42:52 -0500
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] dt-bindings: sound: nvidia, tegra-audio: Convert multiple
 txt bindings to yaml
Message-ID: <YYBRTK9KGglu/s9m@robh.at.kernel.org>
References: <20211025171927.92332-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025171927.92332-1-david@ixit.cz>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 ~okias/devicetree@lists.sr.ht
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

On Mon, Oct 25, 2021 at 07:19:25PM +0200, David Heidelberg wrote:
> Convert Tegra audio complex with the
>  * ALC5632
>  * MAX98090
>  * RT5640
>  * RT5677
>  * SGTL5000
>  * TrimSlice
>  * WM8753
>  * WM8903
>  * WM9712
> codec to the YAML format.

Perhaps say why they can all be combined.

I don't think that really works because the properties which are valid 
varies. Specifically, the GPIO lines vary.

Instead, define a schema with all the common properties and then 
reference it.

> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../sound/nvidia,tegra-audio-alc5632.txt      |  48 -----
>  .../sound/nvidia,tegra-audio-max98090.txt     |  53 -----
>  .../sound/nvidia,tegra-audio-rt5640.txt       |  52 -----
>  .../sound/nvidia,tegra-audio-rt5677.txt       |  67 ------
>  .../sound/nvidia,tegra-audio-sgtl5000.txt     |  42 ----
>  .../sound/nvidia,tegra-audio-trimslice.txt    |  21 --
>  .../sound/nvidia,tegra-audio-wm8753.txt       |  40 ----
>  .../sound/nvidia,tegra-audio-wm8903.txt       |  62 ------
>  .../sound/nvidia,tegra-audio-wm9712.txt       |  60 ------
>  .../bindings/sound/nvidia,tegra-audio.yaml    | 190 ++++++++++++++++++
>  10 files changed, 190 insertions(+), 445 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio.yaml

[...]

> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio.yaml
> new file mode 100644
> index 000000000000..6b8876bfa40f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio.yaml
> @@ -0,0 +1,190 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/sound/nvidia,tegra-audio.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: NVIDIA Tegra audio complex
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-alc5632(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-alc5632
> +      - items:
> +          - enum:
> +              - nvidia,tegra-audio-max98090-nyan-big
> +              - nvidia,tegra-audio-max98090-nyan-blaze
> +          - const: nvidia,tegra-audio-max98090-nyan
> +          - const: nvidia,tegra-audio-max98090
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-max98090(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-max98090
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-rt56(39|40)(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-rt5640
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-rt5677(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-rt5677
> +      - items:
> +          - enum:
> +              - toradex,tegra-audio-sgtl5000-apalis_t30
> +              - toradex,tegra-audio-sgtl5000-colibri_t30
> +              - toradex,tegra-audio-sgtl5000-apalis_tk1
> +          - const: nvidia,tegra-audio-sgtl5000
> +      - const: nvidia,tegra-audio-trimslice
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-wm8753(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-wm8753
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-(plutux|wm8903(-[a-z0-9])+)'
> +          - const: nvidia,tegra-audio-wm8903
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-wm9712(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-wm9712
> +
> +  clocks:
> +    items:
> +      - description: PLL A clock
> +      - description: PLL A OUT0 clock
> +      - description: The Tegra cdev1/extern1 clock, which feeds the card's mclk
> +
> +  clock-names:
> +    items:
> +      - const: pll_a
> +      - const: pll_a_out0
> +      - const: mclk
> +

> +  assigned-clocks: true
> +
> +  assigned-clock-parents: true
> +
> +  assigned-clock-rates: true

These properties are always allowed when 'clocks' is present. So you 
don't have to list them.

> +
> +  nvidia,model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The user-visible name of this sound complex.
> +
> +  nvidia,audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the connection's sink,
> +      the second being the connection's source. Valid names for sources and
> +      sinks are the pins (documented in the binding document),
> +      and the jacks on the board:
> +        ALC5632:
> +          * Headset Stereophone
> +          * Int Spk
> +          * Headset Mic
> +          * Digital Mic
> +        MAXX98090:
> +          * Headphones
> +          * SPeakers
> +          * Mic Jack
> +          * Int Mic
> +        RT5640:
> +          * Headphones
> +          * Speakers
> +          * Mic Jack
> +        RT5677:
> +          * Headphone
> +          * Speaker
> +          * Headset Mic
> +          * Internal Mic 1
> +          * Internal Mic 2
> +        SGTL5000:
> +          * Headphone Jack
> +          * Line In Jack
> +          * Mic Jack
> +        WM8753:
> +          * Headphone Jack
> +          * Mic Jack
> +        WM8903:
> +          * Headphone Jack
> +          * Int Spk
> +          * Mic Jack
> +          * Int Mic
> +        WM9712:
> +          * Headphone
> +          * LineIn
> +          * Mic

All these strings should be part of the schema.

> +
> +  nvidia,ac97-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the AC97 controller
> +
> +  nvidia,i2s-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the Tegra I2S controller
> +
> +  nvidia,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of audio codec
> +
> +  nvidia,spkr-en-gpios:
> +    maxItems: 1
> +    description: The GPIO that enables the speakers
> +
> +  nvidia,hp-mute-gpios:
> +    maxItems: 1
> +    description: The GPIO that mutes the headphones
> +
> +  nvidia,hp-det-gpios:
> +    maxItems: 1
> +    description: The GPIO that detect headphones are plugged in
> +
> +  nvidia,mic-det-gpios:
> +    maxItems: 1
> +    description: The GPIO that detect microphone is plugged in
> +
> +  nvidia,int-mic-en-gpios:
> +    maxItems: 1
> +    description: The GPIO that enables the internal microphone
> +
> +  nvidia,ext-mic-en-gpios:
> +    maxItems: 1
> +    description: The GPIO that enables the external microphone
> +
> +  nvidia,headset:
> +    type: boolean
> +    description: The Mic Jack represents state of the headset microphone pin
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +
> +oneOf:
> +  - required:
> +      - nvidia,audio-codec
> +      - nvidia,i2s-controller
> +  - required:
> +      - nvidia,ac97-controller
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra30-car.h>
> +
> +    sound {
> +      compatible = "toradex,tegra-audio-sgtl5000-apalis_t30",
> +                   "nvidia,tegra-audio-sgtl5000";
> +      nvidia,model = "Toradex Apalis T30 SGTL5000";
> +      nvidia,audio-routing =
> +              "Headphone Jack", "HP_OUT",
> +              "LINE_IN", "Line In Jack",
> +              "MIC_IN", "Mic Jack";
> +      nvidia,i2s-controller = <&tegra_i2s2>;
> +      nvidia,audio-codec = <&codec>;
> +      clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
> +               <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
> +               <&tegra_car TEGRA30_CLK_EXTERN1>;
> +      clock-names = "pll_a", "pll_a_out0", "mclk";
> +    };
> -- 
> 2.33.0
> 
> 
