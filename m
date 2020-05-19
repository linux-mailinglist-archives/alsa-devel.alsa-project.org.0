Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 120AB1DA471
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 00:23:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6C7B179E;
	Wed, 20 May 2020 00:22:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6C7B179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589927005;
	bh=Ahw8srE0nbbe3jb4xG7Lotaxsk6bz/JlQZOCw8dzLf0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fs1eVPflfYoxcbXMWOropeezeyZ9TkCtJUirw+3PbQbpcBXTAl6d2CFKPewOoKety
	 m/tvEE8xLtMUUohHHcULXOrMLcm6BbEbsSSPqdILeuuOQ414abJd3pwuk+lbOC7jhM
	 l2CicIFB2Z9vmCHa+yDWJSCUkaexa7sBzpl627HE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1F2CF800C9;
	Wed, 20 May 2020 00:21:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E236FF801A3; Wed, 20 May 2020 00:21:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_78,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37C75F800C9
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 00:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37C75F800C9
Received: by mail-il1-f195.google.com with SMTP id a14so1106948ilk.2
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 15:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BEN+tw7z4mCkQ24uiqe88N26f3zgm2QQ47/AnQ840b8=;
 b=K6ALHJMYbzJo3GKM8gkgKjyl4Ov/jA3GbVhsv7q1zTUBfKKaheJnSpC1KOy75BsJrk
 AqsnZUEgRykNmsISVVLrNr7GDP//8RdShFe5liM6281XAhAk0hDsYGAMTF1oXuQDfFGK
 C4zb47HtcfcxYSfUyOsAeslYNvEzzF0dgISA007BI24HrBfMlBqJVLPffaOlaOysAewl
 6hhQoIZ9H7Lr58tKODXgKXumeXWV2jwLj6WYW1wFr7qpO1XDkPL5DcgwX1b1LjAg3yON
 1KKKSyoJxw3izlDEufKCewCkjq423YfmoA+uYiq4hscfTUcLjkzWI4d1vtdQzGkgoeJl
 JKRw==
X-Gm-Message-State: AOAM532gEvZl62XiqBDccJIJ+B7pAPUDDIOrlqWaXbRWFIwHFg9/Nxqy
 kNQ9i8nI84TH/Ntd/Y42nQ==
X-Google-Smtp-Source: ABdhPJx/FMKP9R0H7RKVQpRSG+nSgWCZKRAGXE9/bSi+QvQyjbN8nfD5MxhgfzOgsFYY8McNgXX2Tg==
X-Received: by 2002:a92:5c06:: with SMTP id q6mr1309504ilb.236.1589926893566; 
 Tue, 19 May 2020 15:21:33 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id o15sm341350ilg.46.2020.05.19.15.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 15:21:32 -0700 (PDT)
Received: (nullmailer pid 791975 invoked by uid 1000);
 Tue, 19 May 2020 22:21:32 -0000
Date: Tue, 19 May 2020 16:21:32 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2 2/3] bindings: sound: Add documentation for TI j721e
 EVM (CPB and IVI)
Message-ID: <20200519222132.GA488519@bogus>
References: <20200512131633.32668-1-peter.ujfalusi@ti.com>
 <20200512131633.32668-3-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512131633.32668-3-peter.ujfalusi@ti.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

On Tue, May 12, 2020 at 04:16:32PM +0300, Peter Ujfalusi wrote:
> The audio support on the Common Processor Board board is using
> pcm3168a codec connected to McASP10 serializers in parallel setup.
> 
> The Infotainment board plugs into the Common Processor Board, the support
> of the extension board is extending the CPB audio support by adding
> the two codecs on the expansion board.
> 
> The audio support on the Infotainment Expansion Board consists of McASP0
> connected to two pcm3168a codecs with dedicated set of serializers to each.
> The SCKI for pcm3168a is sourced from j721e AUDIO_REFCLK0 pin.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  .../bindings/sound/ti,j721e-cpb-audio.yaml    |  93 ++++++++++++
>  .../sound/ti,j721e-cpb-ivi-audio.yaml         | 142 ++++++++++++++++++
>  2 files changed, 235 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
> new file mode 100644
> index 000000000000..0355ffc2b01b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,j721e-cpb-audio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments J721e Common Processor Board Audio Support
> +
> +maintainers:
> +  - Peter Ujfalusi <peter.ujfalusi@ti.com>
> +
> +description: |
> +  The audio support on the board is using pcm3168a codec connected to McASP10
> +  serializers in parallel setup.
> +  The pcm3168a SCKI clock is sourced from j721e AUDIO_REFCLK2 pin.
> +  In order to support 48KHz and 44.1KHz family of sampling rates the parent
> +  clock for AUDIO_REFCLK2 needs to be changed between PLL4 (for 48KHz) and
> +  PLL15 (for 44.1KHz). The same PLLs are used for McASP10's AUXCLK clock via
> +  different HSDIVIDER.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: ti,j721e-cpb-audio
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  ti,cpb-mcasp:
> +    description: phandle to McASP10
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  ti,cpb-codec:
> +    description: phandle to the pcm3168a codec used on the CPB
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  clocks:
> +    items:
> +      - description: PLL4 clock
> +      - description: PLL15 clock
> +      - description: McASP10 auxclk clock
> +      - description: PLL4_HSDIV0 parent for McASP10 auxclk (for 48KHz)
> +      - description: PLL15_HSDIV0 parent for McASP10 auxclk (for 44.1KHz)
> +      - description: AUDIO_REFCLK2 clock
> +      - description: PLL4_HSDIV2 parent for AUDIO_REFCLK2 clock (for 48KHz)
> +      - description: PLL15_HSDIV2 parent for AUDIO_REFCLK2 clock (for 44.1KHz)

What h/w are these connected to? You have no control interface here, so 
how do you have clocks?

Defining parent clocks seems wrong, too. This seems to just be a 
collection of clocks a driver happens to need. Really, you should be 
able query possible parents and select one with the right frequency 
multiple.

> +
> +  clock-names:
> +    items:
> +      - const: pll4
> +      - const: pll15
> +      - const: cpb-mcasp
> +      - const: cpb-mcasp-48000
> +      - const: cpb-mcasp-44100
> +      - const: audio-refclk2
> +      - const: audio-refclk2-48000
> +      - const: audio-refclk2-44100
> +
> +required:
> +  - compatible
> +  - model
> +  - ti,cpb-mcasp
> +  - ti,cpb-codec
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |+
> +    sound {
> +        compatible = "ti,j721e-cpb-audio";
> +        model = "j721e-cpb";
> +
> +        status = "okay";

Don't show status in examples.

> +
> +        ti,cpb-mcasp = <&mcasp10>;
> +        ti,cpb-codec = <&pcm3168a_1>;
> +
> +        clocks = <&pll4>, <&pll15>,
> +                 <&k3_clks 184 1>,
> +                 <&k3_clks 184 2>, <&k3_clks 184 4>,
> +                 <&k3_clks 157 371>,
> +                 <&k3_clks 157 400>, <&k3_clks 157 401>;
> +        clock-names = "pll4", "pll15",
> +                      "cpb-mcasp",
> +                      "cpb-mcasp-48000", "cpb-mcasp-44100",
> +                      "audio-refclk2",
> +                      "audio-refclk2-48000", "audio-refclk2-44100";
> +    };
> diff --git a/Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml
> new file mode 100644
> index 000000000000..3951c1320fae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,j721e-cpb-ivi-audio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments J721e Common Processor Board Audio Support
> +
> +maintainers:
> +  - Peter Ujfalusi <peter.ujfalusi@ti.com>
> +
> +description: |
> +  The Infotainment board plugs into the Common Processor Board, the support of the
> +  extension board is extending the CPB audio support, decribed in:
> +  sound/ti,j721e-cpb-audio.txt
> +
> +  The audio support on the Infotainment Expansion Board consists of McASP0
> +  connected to two pcm3168a codecs with dedicated set of serializers to each.
> +  The SCKI for pcm3168a is sourced from j721e AUDIO_REFCLK0 pin.
> +
> +  In order to support 48KHz and 44.1KHz family of sampling rates the parent clock
> +  for AUDIO_REFCLK0 needs to be changed between PLL4 (for 48KHz) and PLL15 (for
> +  44.1KHz). The same PLLs are used for McASP0's AUXCLK clock via different
> +  HSDIVIDER.
> +
> +  Note: the same PLL4 and PLL15 is used by the audio support on the CPB!
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: ti,j721e-cpb-ivi-audio
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  ti,cpb-mcasp:
> +    description: phandle to McASP10
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  ti,cpb-codec:
> +    description: phandle to the pcm3168a codec used on the CPB
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  ti,ivi-mcasp:
> +    description: phandle to McASP9
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  ti,ivi-codec-a:
> +    description: phandle to the pcm3168a-A codec on the expansion board
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  ti,ivi-codec-b:
> +    description: phandle to the pcm3168a-B codec on the expansion board
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  clocks:
> +    items:
> +      - description: PLL4 clock
> +      - description: PLL15 clock
> +      - description: McASP10 auxclk clock
> +      - description: PLL4_HSDIV0 parent for McASP10 auxclk (for 48KHz)
> +      - description: PLL15_HSDIV0 parent for McASP10 auxclk (for 44.1KHz)
> +      - description: AUDIO_REFCLK2 clock
> +      - description: PLL4_HSDIV2 parent for AUDIO_REFCLK2 clock (for 48KHz)
> +      - description: PLL15_HSDIV2 parent for AUDIO_REFCLK2 clock (for 44.1KHz)
> +      - description: McASP0 auxclk clock
> +      - description: PLL4_HSDIV0 parent for McASP0 auxclk (for 48KHz)
> +      - description: PLL15_HSDIV0 parent for McASP0 auxclk (for 44.1KHz)
> +      - description: AUDIO_REFCLK0 clock
> +      - description: PLL4_HSDIV2 parent for AUDIO_REFCLK0 clock (for 48KHz)
> +      - description: PLL15_HSDIV2 parent for AUDIO_REFCLK0 clock (for 44.1KHz)
> +
> +  clock-names:
> +    items:
> +      - const: pll4
> +      - const: pll15
> +      - const: cpb-mcasp
> +      - const: cpb-mcasp-48000
> +      - const: cpb-mcasp-44100
> +      - const: audio-refclk2
> +      - const: audio-refclk2-48000
> +      - const: audio-refclk2-44100
> +      - const: ivi-mcasp
> +      - const: ivi-mcasp-48000
> +      - const: ivi-mcasp-44100
> +      - const: audio-refclk0
> +      - const: audio-refclk0-48000
> +      - const: audio-refclk0-44100
> +
> +required:
> +  - compatible
> +  - model
> +  - ti,cpb-mcasp
> +  - ti,cpb-codec
> +  - ti,ivi-mcasp
> +  - ti,ivi-codec-a
> +  - ti,ivi-codec-b
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |+
> +    sound {
> +        compatible = "ti,j721e-cpb-ivi-audio";
> +        model = "j721e-cpb-ivi";
> +
> +        status = "okay";
> +
> +        ti,cpb-mcasp = <&mcasp10>;
> +        ti,cpb-codec = <&pcm3168a_1>;
> +
> +        ti,ivi-mcasp = <&mcasp0>;
> +        ti,ivi-codec-a = <&pcm3168a_a>;
> +        ti,ivi-codec-b = <&pcm3168a_b>;
> +
> +        clocks = <&pll4>, <&pll15>,
> +                 <&k3_clks 184 1>,
> +                 <&k3_clks 184 2>, <&k3_clks 184 4>,
> +                 <&k3_clks 157 371>,
> +                 <&k3_clks 157 400>, <&k3_clks 157 401>,
> +                 <&k3_clks 174 1>,
> +                 <&k3_clks 174 2>, <&k3_clks 174 4>,
> +                 <&k3_clks 157 301>,
> +                 <&k3_clks 157 330>, <&k3_clks 157 331>;
> +        clock-names = "pll4", "pll15",
> +                      "cpb-mcasp",
> +                      "cpb-mcasp-48000", "cpb-mcasp-44100",
> +                      "audio-refclk2",
> +                      "audio-refclk2-48000", "audio-refclk2-44100",
> +                      "ivi-mcasp",
> +                      "ivi-mcasp-48000", "ivi-mcasp-44100",
> +                      "audio-refclk0",
> +                      "audio-refclk0-48000", "audio-refclk0-44100";
> +    };
> -- 
> Peter
> 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
