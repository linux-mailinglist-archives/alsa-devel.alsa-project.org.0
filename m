Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A8F2A6EDE
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 21:35:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E3A71685;
	Wed,  4 Nov 2020 21:34:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E3A71685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604522102;
	bh=mSwoVK6v7nPrxzqYa/WdKVqFS2sDWNFeKYF/GB02mVE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E5yKSpVxtkQMfAzJJ2xm69NvPOvJdCGZogs97oNib6M8VJ/q0VbpN/usuTYkZXIoV
	 dvMDa6HT9gnowSrwtSrdpWheJ/fVMryOlCK9v4Xn2dxSelYl9ZG+LxgfeQBqdfOxVs
	 l5GBEvuhu8ZK3Bt1Yux82y1taYJw2bFe90WyGyzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE33DF8023E;
	Wed,  4 Nov 2020 21:33:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68AA1F800EC; Wed,  4 Nov 2020 21:33:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C067AF800EC
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 21:33:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C067AF800EC
Received: by mail-oo1-f67.google.com with SMTP id j41so5403414oof.12
 for <alsa-devel@alsa-project.org>; Wed, 04 Nov 2020 12:33:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xx2kC9bmAU+Gqr1PijuX6iSqkOZbjEC6ChR/BZ+mPRo=;
 b=ogespB5Wmf4KTnSZwUPmU0d7o45yOWGMQJ11k/fOJO+ciMWLF8id7fm/cLyXA8x0dh
 0OmP04P5NV2KVXHSz7g3rhIYoHe29VJtNKMOqRpJAEZnHH3dhX4A9XYnxzlC+0VJhw67
 VB1Y11/scVa0E/duY6ZGaxro1CqRxkGKyrzM0z3FTNRr4pjIOWGC2sszP/4TgjOVkjcr
 73XPdkyrN9Y7ArTJ6jsHju7MbXsOXh86rNjCVdeozee7EDVGxYQpTyeCik1tgWh6TT/B
 rHyZVg1WClBWcXeOen/cPJ1gwp8qdgvAvHsh2vbjk2FnVdeMH9w42mLxKn5tSBcSqHf1
 ASFA==
X-Gm-Message-State: AOAM533UJ3wuxNR0r4sf5h6t0xR6jQzdJOVIUcgSRNghbGiGX8Qy0Odm
 jIeOqx7JHm3y7YH1XyfstQ==
X-Google-Smtp-Source: ABdhPJxdhDU4RU61/GDBlWhPWbMjO7Q5OJmR4vpXCPNMUjEjICp59XnGYEWISmY0Wz1Ht8fQhQRDEA==
X-Received: by 2002:a4a:be92:: with SMTP id o18mr20114625oop.22.1604521999162; 
 Wed, 04 Nov 2020 12:33:19 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w79sm710732oia.28.2020.11.04.12.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 12:33:18 -0800 (PST)
Received: (nullmailer pid 4081232 invoked by uid 1000);
 Wed, 04 Nov 2020 20:33:17 -0000
Date: Wed, 4 Nov 2020 14:33:17 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: ASoC: audio-graph-card: switch to
 yaml base Documentation
Message-ID: <20201104203317.GA4068421@bogus>
References: <87zh45d0zp.wl-kuninori.morimoto.gx@renesas.com>
 <87y2jpd0yt.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y2jpd0yt.wl-kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Sameer Pujar <spujar@nvidia.com>
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

On Thu, Oct 29, 2020 at 03:06:13PM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/audio-graph-card.txt       | 337 ------------------
>  .../bindings/sound/audio-graph-card.yaml      | 162 +++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +-
>  3 files changed, 163 insertions(+), 338 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.yaml

> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
> new file mode 100644
> index 000000000000..a251d7af6f96
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/audio-graph-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Audio Graph Card Driver Device Tree Bindings
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - audio-graph-card
> +      - audio-graph-scu-card
> +
> +  dais:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +  label:
> +    maxItems: 1
> +  prefix:
> +    description: "device name prefix"
> +    $ref: /schemas/types.yaml#/definitions/string
> +  "audio-graph-card,prefix":

How'd that sneak in? Can we drop or at least mark deprecated? There's 
not any users in upstream dts files.

> +    description: "device name prefix"
> +    $ref: /schemas/types.yaml#/definitions/string
> +  routing:
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the
> +      connection's sink, the second being the connection's source.
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +  widgets:
> +    description: User specified audio sound widgets.
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +  convert-rate:
> +    description: CPU to Codec rate convert.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +  "audio-graph-card,convert-rate":

Same here.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +    description: CPU to Codec rate convert.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +  convert-channels:
> +    description: CPU to Codec rate channels.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +  "audio-graph-card,convert-channels":
> +    description: CPU to Codec rate channels.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +  pa-gpios:
> +    maxItems: 1
> +  hp-det-gpio:
> +    maxItems: 1
> +  mic-det-gpio:
> +    maxItems: 1
> +
> +  port:
> +    description: single OF-Graph subnode
> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +      prefix:
> +        description: "device name prefix"
> +        $ref: /schemas/types.yaml#/definitions/string
> +      convert-rate:
> +        description: CPU to Codec rate convert.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      convert-channels:
> +        description: CPU to Codec rate channels.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +    patternProperties:
> +      "^endpoint(@[0-9a-f]+)?":
> +        type: object
> +        properties:
> +          remote-endpoint:
> +            maxItems: 1
> +          mclk-fs:
> +            description: |
> +              Multiplication factor between stream rate and codec mclk.
> +              When defined, mclk-fs property defined in dai-link sub nodes are ignored.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +          frame-inversion:
> +            description: dai-link uses frame clock inversion
> +            $ref: /schemas/types.yaml#/definitions/flag
> +          bitclock-inversion:
> +            description: dai-link uses bit clock inversion
> +            $ref: /schemas/types.yaml#/definitions/flag
> +          frame-master:
> +            description: Indicates dai-link frame master.
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +            maxItems: 1
> +          bitclock-master:
> +            description: Indicates dai-link bit clock master
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +            maxItems: 1
> +          dai-format:
> +            description: audio format.
> +            items:
> +              enum:
> +                - i2s
> +                - right_j
> +                - left_j
> +                - dsp_a
> +                - dsp_b
> +                - ac97
> +                - pdm
> +                - msb
> +                - lsb
> +          convert-rate:
> +            description: CPU to Codec rate convert.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +          convert-channels:
> +            description: CPU to Codec rate channels.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +        required:
> +          - remote-endpoint
> +
> +  ports:
> +    description: multi OF-Graph subnode
> +    type: object
> +    patternProperties:
> +      "^port(@[0-9a-f]+)?":
> +        $ref: "#/properties/port"
> +
> +required:
> +  - compatible
> +  - dais
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "audio-graph-card";
> +
> +        dais = <&cpu_port_a>;
> +    };
> +
> +    cpu {
> +        /*
> +         * dai-controller own settings
> +         */
> +
> +        port {
> +            cpu_endpoint: endpoint {
> +                remote-endpoint = <&codec_endpoint>;
> +                dai-format = "left_j";
> +            };
> +        };
> +    };
> +
> +    codec {
> +        /*
> +         * codec own settings
> +         */
> +
> +        port {
> +            codec_endpoint: endpoint {
> +                remote-endpoint = <&cpu_endpoint>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 2735be1a8470..a4fe8f6cec6c 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -20,7 +20,7 @@ patternProperties:
>    "^(keypad|m25p|max8952|max8997|max8998|mpmc),.*": true
>    "^(pinctrl-single|#pinctrl-single|PowerPC),.*": true
>    "^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*": true
> -  "^(simple-audio-card|st-plgpio|st-spics|ts),.*": true
> +  "^(simple-audio-card|audio-graph-card|st-plgpio|st-spics|ts),.*": true
>  
>    # Keep list in alphabetical order.
>    "^70mai,.*":
> -- 
> 2.25.1
> 
