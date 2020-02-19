Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A65C1649FD
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 17:20:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28CE91699;
	Wed, 19 Feb 2020 17:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28CE91699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582129203;
	bh=eMg3OUEvYgvOWMNJ0/9emwTDUZRsmT6SoMU+VQzSgJQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZX9Rwro9/TQbvc+PHJpWauULx7BO/CgLWW8xSR6p75L0SpoW5KUOnPfGgmhF11KL+
	 h4U66oETj+zptL+VKE6pSyt9HV20mQ5NGo+/Sjtbg6HoEMl16q9iJCqbbD45gkKXm4
	 15csh8Cgvk9e5lTUsfip36FkO8IrWaQEqZr742r4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 990CCF80277;
	Wed, 19 Feb 2020 17:17:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C316F80291; Wed, 19 Feb 2020 17:17:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19957F80277
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 17:17:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19957F80277
Received: by mail-ot1-f65.google.com with SMTP id j20so678475otq.3
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 08:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ds9PNQU/0xKGagUGpbNRwzbcpa6Vu1q+oJ59YcOdPi0=;
 b=UdcL0YPJj2fI+RoZoNPtl8fUvEfg1wH5xHCDsH1oYK8GOQ18VzsTT+kGJUbvSOxjZM
 40I8AJBxzYy+h2ROMVPItwXHa0T1ghrt+hrNe75JEbTMIDDtN4yrjZeaceueh+YlAKaG
 ZVg0cUOm+Pw2DMplUGHCty58BGehBsm4iX+oeUScGww7IbhEBIiwgAkyPtYQyMnTnSCU
 FqysYpFve0/wUHNMNl/g37W8zbkMTHuNc8RPP/I8B7jElxxECmOBuBEF/SOxDQjwJIrc
 JQo1JiqtSVmRn5guD8dv6Tg25D+lzQMkFI/RzBmjc8lrPnyQW1k7AdWuP44MabmQk52g
 EedA==
X-Gm-Message-State: APjAAAXpyHFEmRFLUh9fE91wK35NWv0t2pwrhSDGjNlhg7tRYoWQu6ox
 Be7/yd+B5eU4FUfOP/wVwg==
X-Google-Smtp-Source: APXvYqy1sIK+bQ9+QK9kxSA5x1Hp5G1Fhhfz+WOFk1ML9CuM4rwn0Z+YdLeKOItdqrKcKtW+PAOkxQ==
X-Received: by 2002:a9d:bb8:: with SMTP id 53mr18271477oth.150.1582129054008; 
 Wed, 19 Feb 2020 08:17:34 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e206sm113387oia.24.2020.02.19.08.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 08:17:33 -0800 (PST)
Received: (nullmailer pid 25053 invoked by uid 1000);
 Wed, 19 Feb 2020 16:17:32 -0000
Date: Wed, 19 Feb 2020 10:17:32 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: renesas,rsnd: switch to yaml base
 Documentation
Message-ID: <20200219161732.GB25095@bogus>
References: <87d0ahzr9d.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d0ahzr9d.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
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

On Fri, Feb 14, 2020 at 02:12:39PM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document.
> It is still keeping detail explanations at .txt
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 	- fixup dtc error
> 
>  .../bindings/sound/renesas,rsnd.txt           | 518 -----------------
>  .../bindings/sound/renesas,rsnd.yaml          | 529 ++++++++++++++++++
>  2 files changed, 529 insertions(+), 518 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml


> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> new file mode 100644
> index 000000000000..0958255c8542
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -0,0 +1,529 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Sound Driver Device Tree Bindings
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^sound@.*"
> +
> +  compatible:
> +    oneOf:
> +      # for Gen1 SoC
> +      - items:
> +        - enum:

nit: Should be indented 2 more spaces.

> +          - renesas,rcar_sound-r8a7778 # R-Car M1A
> +          - renesas,rcar_sound-r8a7779 # R-Car H1
> +        - enum:
> +          - renesas,rcar_sound-gen1
> +      # for Gen2 SoC
> +      - items:
> +        - enum:
> +          - renesas,rcar_sound-r8a7743   # RZ/G1M
> +          - renesas,rcar_sound-r8a7744   # RZ/G1N
> +          - renesas,rcar_sound-r8a7745   # RZ/G1E
> +          - renesas,rcar_sound-r8a77470  # RZ/G1C
> +          - renesas,rcar_sound-r8a7790   # R-Car H2
> +          - renesas,rcar_sound-r8a7791   # R-Car M2-W
> +          - renesas,rcar_sound-r8a7793   # R-Car M2-N
> +          - renesas,rcar_sound-r8a7794   # R-Car E2
> +        - enum:
> +          - renesas,rcar_sound-gen2
> +      # for Gen3 SoC
> +      - items:
> +        - enum:
> +          - renesas,rcar_sound-r8a774a1  # RZ/G2M
> +          - renesas,rcar_sound-r8a774b1  # RZ/G2N
> +          - renesas,rcar_sound-r8a774c0  # RZ/G2E
> +          - renesas,rcar_sound-r8a7795   # R-Car H3
> +          - renesas,rcar_sound-r8a7796   # R-Car M3-W
> +          - renesas,rcar_sound-r8a77965  # R-Car M3-N
> +          - renesas,rcar_sound-r8a77990  # R-Car E3
> +          - renesas,rcar_sound-r8a77995  # R-Car D3
> +        - enum:
> +          - renesas,rcar_sound-gen3
> +      # for Generic
> +      - items:
> +        - enum:
> +          - renesas,rcar_sound-gen1
> +          - renesas,rcar_sound-gen2
> +          - renesas,rcar_sound-gen3
> +
> +  reg:
> +    minItems: 3 # Gen1
> +    maxItems: 5 # Gen2/Gen3
> +
> +  reg-names:
> +    description: |
> +      Should contain the register names.
> +      scu/adg/ssi              if generation1
> +      scu/adg/ssiu/ssi/audmapp if generation2/generation3
> +    minItems: 3 # Gen1
> +    maxItems: 5 # Gen2/Gen3
> +    allOf:
> +      - items:
> +          enum:
> +            - scu
> +            - adg
> +            - ssiu
> +            - ssi
> +            - audmapp

This should be 2 'oneOf' entries listing out the exact names and index.

> +
> +  "#sound-dai-cells":
> +    description: |
> +      it must be 0 if your system is using single DAI
> +      it must be 1 if your system is using multi  DAIs
> +    enum: [0, 1]
> +
> +  "#clock-cells":
> +    description: |
> +      it must be 0 if your system has audio_clkout
> +      it must be 1 if your system has audio_clkout0/1/2/3
> +    enum: [0, 1]
> +
> +  clock-frequency:
> +    description: for audio_clkout0/1/2/3
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

This already has a common definition and this conflicts with that. 
'clock-frequency' is a single uint32 or uint64.

> +
> +  clkout-lr-asynchronous:
> +    description: audio_clkoutn is asynchronizes with lr-clock.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  power-domains: true
> +
> +  resets:
> +    description: References to SSI resets
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  reset-names:
> +    description: List of valid reset names.
> +    allOf:

Don't need allOf here.

You do need to define how many items.

> +      - items:
> +          enum:
> +            - ssi-all
> +            - ssi.9
> +            - ssi.8
> +            - ssi.7
> +            - ssi.6
> +            - ssi.5
> +            - ssi.4
> +            - ssi.3
> +            - ssi.2
> +            - ssi.1
> +            - ssi.0

Looks like a pattern.

pattern: '^ssi(-all|\.[0-9])$'


> +
> +  clocks:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type definition. Need to define how many.

> +    description: References to SSI/SRC/MIX/CTU/DVC/AUDIO_CLK clocks.
> +
> +  clock-names:
> +    description: List of necessary clock names.
> +    allOf:
> +      - items:
> +          enum:
> +            - ssi-all
> +            - ssi.9
> +            - ssi.8
> +            - ssi.7
> +            - ssi.6
> +            - ssi.5
> +            - ssi.4
> +            - ssi.3
> +            - ssi.2
> +            - ssi.1
> +            - ssi.0
> +            - src.9
> +            - src.8
> +            - src.7
> +            - src.6
> +            - src.5
> +            - src.4
> +            - src.3
> +            - src.2
> +            - src.1
> +            - src.0
> +            - mix.1
> +            - mix.0
> +            - ctu.1
> +            - ctu.0
> +            - dvc.1
> +            - dvc.0
> +            - clk_a
> +            - clk_b
> +            - clk_c
> +            - clk_i

Looks like a couple of patterns.

> +
> +  # For OF-graph
> +  port:
> +    description: OF-Graph subnode
> +    type: object
> +    properties:
> +      reg:
> +        $ref: /schemas/types.yaml#/definitions/uint32

No unit-address for 'port', so you don't need 'reg' here.

> +      endpoint:
> +        type: object
> +        properties:
> +          remote-endpoint:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array

Assume this already has a type.

> +          dai-format:
> +            $ref: "simple-card.yaml#/definitions/format"
> +          playback:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +          capture:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +        required:
> +            - remote-endpoint
> +
> +  # For multi OF-graph
> +  ports:
> +    description: multi OF-Graph subnode
> +    type: object
> +    patternProperties:
> +      "port(@.*)?":

^port(@[0-9a-f])?$"

Perhaps there's max number of ports that's less than 0xf?

> +        $ref: "#properties/port"

Would be more simple to just always have 'ports'.

> +
> +patternProperties:
> +  "^rcar_sound,dvc$":

Not a pattern, but a fixed string...

> +    description: DVC subnode.
> +    type: object
> +    patternProperties:
> +      "dvc-.":
> +        type: object
> +        properties:
> +          dmas:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type, just need 'maxItems: 1'.

> +          dma-names:
> +            const: "tx"
> +        required:
> +          - dmas
> +          - dma-names
> +    additionalProperties: false
> +
> +  "^rcar_sound,mix$":

Not a pattern...

> +    description: MIX subnode.
> +    type: object
> +    patternProperties:
> +      "mix-.":

foomix-bar is valid?

> +        type: object

Aren't there properties in this node?

> +    additionalProperties: false

Stopping here because the rest looks like more of the same comments.

Rob
