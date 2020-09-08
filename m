Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F0826237C
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 01:16:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7DE916EB;
	Wed,  9 Sep 2020 01:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7DE916EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599606980;
	bh=WegQIiuFGV0bkt1Z2BgY/1h2z9BeHksuCD2dJ6Proag=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lXdQbQdw+6yL90B7hEk0W0iVOWYb7dU5/xXNUGQ9bbsvjE3p0vTgS5F4YCZ+URc22
	 QEwb1il6BYFXaIs8eaT2qo2ZPkTZ1t/pTjt7u2tJT0PFEVb+Li4jqhxmKcb3MAjU82
	 gsf2SU+jLgs+D6ha1FZwV+k/Eb6d9pbhlim0SAd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0968F801F2;
	Wed,  9 Sep 2020 01:14:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D6F6F80264; Wed,  9 Sep 2020 01:14:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06A2AF800FD
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 01:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06A2AF800FD
Received: by mail-il1-f193.google.com with SMTP id a8so590243ilk.1
 for <alsa-devel@alsa-project.org>; Tue, 08 Sep 2020 16:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=foox/NOQkaYtU07hu0WCIvJkLTr/xqXtIkw4knAc7eY=;
 b=MYs/n+Wrvx2AQoY3sX4HnpHNYZ9dw9L5twv9NyPkaEnrxI20dvVi+JG5JAWmocEtbF
 2iHU21hvtaThlYnG7sbpkiOE2kKOIoNcceti62SiZDgUWciDbcwyQ9gpffEczKS8v7BC
 sA4iYABqh2FTXIZVSKDyZEPS9+JtG+0rfMtszx98D40r6Hj/5QRf0YIQyzc3Q3oUeM/Y
 iqDtIJIFmkssyeGx6Nof4ubDylEOXzvskaYJGPS91NCEToHHOh1Wm3a9XHBstKdAyMTQ
 8YhWkPlqXHaijoSP4tpY7sPZyMlqQhNxDCMQia8cxepL6ZX0Qnidx9hTXwm5CRIsbFlQ
 gJjg==
X-Gm-Message-State: AOAM5310guqBUsXuXfbuFhRvGayslY+TcyW9iWBsBTg7PQ9OwORpM+se
 ZvwLu2WoOiWjukFzcg+Q1w==
X-Google-Smtp-Source: ABdhPJxT5DZEABzPKm8ZWGspSviXAcZK+cVgLQ9j1RCofCdOdz1MRQApg4FUEoADvQyHlz184VwtVQ==
X-Received: by 2002:a92:da45:: with SMTP id p5mr81012ilq.231.1599606869772;
 Tue, 08 Sep 2020 16:14:29 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id l18sm331839ilq.51.2020.09.08.16.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 16:14:28 -0700 (PDT)
Received: (nullmailer pid 1122636 invoked by uid 1000);
 Tue, 08 Sep 2020 23:14:22 -0000
Date: Tue, 8 Sep 2020 17:14:22 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: audio-graph-card: switch to
 yaml base Documentation
Message-ID: <20200908231422.GA1108858@bogus>
References: <878se1vsy6.wl-kuninori.morimoto.gx@renesas.com>
 <877dtlvsxk.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877dtlvsxk.wl-kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

On Thu, Aug 27, 2020 at 09:24:54AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/audio-graph-card.txt       | 337 ------------------
>  .../bindings/sound/audio-graph-card.yaml      | 135 +++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +-
>  3 files changed, 136 insertions(+), 338 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.txt b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
> deleted file mode 100644
> index d5f6919a2d69..000000000000
> --- a/Documentation/devicetree/bindings/sound/audio-graph-card.txt
> +++ /dev/null
> @@ -1,337 +0,0 @@
> -Audio Graph Card:
> -
> -Audio Graph Card specifies audio DAI connections of SoC <-> codec.
> -It is based on common bindings for device graphs.
> -see ${LINUX}/Documentation/devicetree/bindings/graph.txt
> -
> -Basically, Audio Graph Card property is same as Simple Card.
> -see ${LINUX}/Documentation/devicetree/bindings/sound/simple-card.yaml
> -
> -Below are same as Simple-Card.
> -
> -- label
> -- widgets
> -- routing
> -- dai-format
> -- frame-master
> -- bitclock-master
> -- bitclock-inversion
> -- frame-inversion
> -- mclk-fs
> -- hp-det-gpio
> -- mic-det-gpio
> -- dai-tdm-slot-num
> -- dai-tdm-slot-width
> -- clocks / system-clock-frequency
> -
> -Required properties:
> -
> -- compatible				: "audio-graph-card";
> -- dais					: list of CPU DAI port{s}
> -
> -Optional properties:
> -- pa-gpios: GPIO used to control external amplifier.
> -
> ------------------------
> -Example: Single DAI case
> ------------------------
> -
> -	sound_card {
> -		compatible = "audio-graph-card";
> -
> -		dais = <&cpu_port>;
> -	};
> -
> -	dai-controller {
> -		...
> -		cpu_port: port {
> -			cpu_endpoint: endpoint {
> -				remote-endpoint = <&codec_endpoint>;
> -
> -				dai-format = "left_j";
> -				...
> -			};
> -		};
> -	};
> -
> -	audio-codec {
> -		...
> -		port {
> -			codec_endpoint: endpoint {
> -				remote-endpoint = <&cpu_endpoint>;
> -			};
> -		};
> -	};
> -
> ------------------------
> -Example: Multi DAI case
> ------------------------
> -
> -	sound-card {
> -		compatible = "audio-graph-card";
> -
> -		label = "sound-card";
> -
> -		dais = <&cpu_port0
> -			&cpu_port1
> -			&cpu_port2>;
> -	};
> -
> -	audio-codec@0 {
> -		...
> -		port {
> -			codec0_endpoint: endpoint {
> -				remote-endpoint = <&cpu_endpoint0>;
> -			};
> -		};
> -	};
> -
> -	audio-codec@1 {
> -		...
> -		port {
> -			codec1_endpoint: endpoint {
> -				remote-endpoint = <&cpu_endpoint1>;
> -			};
> -		};
> -	};
> -
> -	audio-codec@2 {
> -		...
> -		port {
> -			codec2_endpoint: endpoint {
> -				remote-endpoint = <&cpu_endpoint2>;
> -			};
> -		};
> -	};
> -
> -	dai-controller {
> -		...
> -		ports {
> -			cpu_port0: port@0 {
> -				cpu_endpoint0: endpoint {
> -					remote-endpoint = <&codec0_endpoint>;
> -
> -					dai-format = "left_j";
> -					...
> -				};
> -			};
> -			cpu_port1: port@1 {
> -				cpu_endpoint1: endpoint {
> -					remote-endpoint = <&codec1_endpoint>;
> -
> -					dai-format = "i2s";
> -					...
> -				};
> -			};
> -			cpu_port2: port@2 {
> -				cpu_endpoint2: endpoint {
> -					remote-endpoint = <&codec2_endpoint>;
> -
> -					dai-format = "i2s";
> -					...
> -				};
> -			};
> -		};
> -	};
> -
> -
> ------------------------
> -Example: Sampling Rate Conversion
> ------------------------
> -
> -	sound_card {
> -		compatible = "audio-graph-card";
> -
> -		label = "sound-card";
> -		prefix = "codec";
> -		routing = "codec Playback", "DAI0 Playback",
> -			  "DAI0 Capture",   "codec Capture";
> -		convert-rate = <48000>;
> -
> -		dais = <&cpu_port>;
> -	};
> -
> -	audio-codec {
> -		...
> -		port {
> -			codec_endpoint: endpoint {
> -				remote-endpoint = <&cpu_endpoint>;
> -			};
> -		};
> -	};
> -
> -	dai-controller {
> -		...
> -		cpu_port: port {
> -			cpu_endpoint: endpoint {
> -				remote-endpoint = <&codec_endpoint>;
> -
> -				dai-format = "left_j";
> -				...
> -			};
> -		};
> -	};
> -
> ------------------------
> -Example: 2 CPU 1 Codec (Mixing)
> ------------------------
> -
> -	sound_card {
> -		compatible = "audio-graph-card";
> -
> -		label = "sound-card";
> -		routing = "codec Playback", "DAI0 Playback",
> -			  "codec Playback", "DAI1 Playback",
> -			  "DAI0 Capture",   "codec Capture";
> -
> -		dais = <&cpu_port>;
> -	};
> -
> -	audio-codec {
> -		...
> -
> -		audio-graph-card,prefix = "codec";
> -		audio-graph-card,convert-rate = <48000>;
> -		port {
> -			reg = <0>;
> -			codec_endpoint0: endpoint@0 {
> -				remote-endpoint = <&cpu_endpoint0>;
> -			};
> -			codec_endpoint1: endpoint@1 {
> -				remote-endpoint = <&cpu_endpoint1>;
> -			};
> -		};
> -	};
> -
> -	dai-controller {
> -		...
> -		cpu_port: port {
> -			cpu_endpoint0: endpoint@0 {
> -				remote-endpoint = <&codec_endpoint0>;
> -
> -				dai-format = "left_j";
> -				...
> -			};
> -			cpu_endpoint1: endpoint@1 {
> -				remote-endpoint = <&codec_endpoint1>;
> -
> -				dai-format = "left_j";
> -				...
> -			};
> -		};
> -	};
> -
> ------------------------
> -Example: Multi DAI with DPCM
> ------------------------
> -
> -	CPU0 ------ ak4613
> -	CPU1 ------ HDMI
> -	CPU2 ------ PCM3168A-p	/* DPCM 1ch/2ch */
> -	CPU3 --/		/* DPCM 3ch/4ch */
> -	CPU4 --/		/* DPCM 5ch/6ch */
> -	CPU5 --/		/* DPCM 7ch/8ch */
> -	CPU6 ------ PCM3168A-c
> -
> -	sound_card: sound {
> -		compatible = "audio-graph-card";
> -
> -		label = "sound-card";
> -
> -		routing =	"pcm3168a Playback", "DAI2 Playback",
> -				"pcm3168a Playback", "DAI3 Playback",
> -				"pcm3168a Playback", "DAI4 Playback",
> -				"pcm3168a Playback", "DAI5 Playback";
> -
> -		dais = <&snd_port0	/* ak4613 */
> -			&snd_port1	/* HDMI0  */
> -			&snd_port2	/* pcm3168a playback */
> -			&snd_port3	/* pcm3168a capture  */
> -			>;
> -	};
> -
> -	ak4613: codec@10 {
> -		...
> -		port {
> -			ak4613_endpoint: endpoint {
> -				remote-endpoint = <&rsnd_endpoint0>;
> -			};
> -		};
> -	};
> -
> -	pcm3168a: audio-codec@44 {
> -		...
> -		audio-graph-card,prefix = "pcm3168a";
> -		audio-graph-card,convert-channels = <8>; /* TDM Split */
> -		ports {
> -			port@0 {
> -				reg = <0>;
> -				pcm3168a_endpoint_p1: endpoint@1 {
> -					remote-endpoint = <&rsnd_endpoint2>;
> -					...
> -				};
> -				pcm3168a_endpoint_p2: endpoint@2 {
> -					remote-endpoint = <&rsnd_endpoint3>;
> -					...
> -				};
> -				pcm3168a_endpoint_p3: endpoint@3 {
> -					remote-endpoint = <&rsnd_endpoint4>;
> -					...
> -				};
> -				pcm3168a_endpoint_p4: endpoint@4 {
> -					remote-endpoint = <&rsnd_endpoint5>;
> -					...
> -				};
> -			};
> -			port@1 {
> -				reg = <1>;
> -				pcm3168a_endpoint_c: endpoint {
> -					remote-endpoint = <&rsnd_endpoint6>;
> -					...
> -				};
> -			};
> -		};
> -	};
> -
> -	&sound {
> -		ports {
> -			snd_port0: port@0 {
> -				rsnd_endpoint0: endpoint {
> -					remote-endpoint = <&ak4613_endpoint>;
> -					...
> -				};
> -			};
> -			snd_port1: port@1 {
> -				rsnd_endpoint1: endpoint {
> -					remote-endpoint = <&dw_hdmi0_snd_in>;
> -					...
> -				};
> -			};
> -			snd_port2: port@2 {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -				rsnd_endpoint2: endpoint@2 {
> -					remote-endpoint = <&pcm3168a_endpoint_p1>;
> -					...
> -				};
> -				rsnd_endpoint3: endpoint@3 {
> -					remote-endpoint = <&pcm3168a_endpoint_p2>;
> -					...
> -				};
> -				rsnd_endpoint4: endpoint@4 {
> -					remote-endpoint = <&pcm3168a_endpoint_p3>;
> -					...
> -				};
> -				rsnd_endpoint5: endpoint@5 {
> -					remote-endpoint = <&pcm3168a_endpoint_p4>;
> -					...
> -				};
> -			};
> -			snd_port3: port@6 {
> -				rsnd_endpoint6: endpoint {
> -					remote-endpoint = <&pcm3168a_endpoint_c>;
> -					...
> -				};
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
> new file mode 100644
> index 000000000000..60d7b1504128
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
> @@ -0,0 +1,135 @@
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
> +definitions:

Please don't use 'definitions' unless really needed. There's only 1 
reference to 'endpoint' and 'port' so you don't here.

> +  endpoint:
> +    type: object
> +    properties:
> +      remote-endpoint:
> +        maxItems: 1
> +      mclk-fs:
> +        $ref: "simple-card.yaml#/definitions/mclk-fs"
> +      frame-inversion:
> +        $ref: "simple-card.yaml#/definitions/frame-inversion"
> +      bitclock-inversion:
> +        $ref: "simple-card.yaml#/definitions/bitclock-inversion"
> +      frame-master:
> +        $ref: "simple-card.yaml#/definitions/frame-master"
> +      bitclock-master:
> +        $ref: "simple-card.yaml#/definitions/bitclock-master"
> +      dai-format:
> +        $ref: "simple-card.yaml#/definitions/format"
> +      convert-rate:
> +        $ref: "simple-card.yaml#/definitions/convert-rate"
> +      convert-channels:
> +        $ref: "simple-card.yaml#/definitions/convert-channels"
> +    required:
> +      - remote-endpoint
> +
> +  port:
> +    description: single OF-Graph subnode
> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +      prefix:
> +        $ref: "simple-card.yaml#/definitions/prefix"
> +      convert-rate:
> +        $ref: "simple-card.yaml#/definitions/convert-rate"
> +      convert-channels:
> +        $ref: "simple-card.yaml#/definitions/convert-channels"
> +    patternProperties:
> +      "^endpoint(@[0-9a-f]+)?":
> +        $ref: "#/definitions/endpoint"
> +
> +  ports:
> +    description: multi OF-Graph subnode
> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1

'ports' never has a 'reg' property.

> +      prefix:
> +        $ref: "simple-card.yaml#/definitions/prefix"
> +      convert-rate:
> +        $ref: "simple-card.yaml#/definitions/convert-rate"
> +      convert-channels:
> +        $ref: "simple-card.yaml#/definitions/convert-channels"

These shouldn't be valid under 'ports' either?

> +    patternProperties:
> +      "^port(@[0-9a-f]+)?":
> +        $ref: "#/definitions/port"
> +
> +properties:
> +  compatible:
> +    contains:

Any other additional string is valid?

> +      enum:
> +        - audio-graph-card
> +        - audio-graph-scu-card
> +
> +  dais:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +  label:
> +    maxItems: 1
> +  prefix:
> +    $ref: "simple-card.yaml#/definitions/prefix"
> +  routing:
> +    $ref: "simple-card.yaml#/definitions/routing"
> +  widgets:
> +    $ref: "simple-card.yaml#/definitions/widgets"
> +  convert-rate:
> +    $ref: "simple-card.yaml#/definitions/convert-rate"
> +  convert-channels:
> +    $ref: "simple-card.yaml#/definitions/convert-channels"
> +  pa-gpios:
> +    maxItems: 1
> +  hp-det-gpio:
> +    maxItems: 1
> +  mic-det-gpio:
> +    maxItems: 1
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
> +                /* ... */

Would be good if the example used all/most of the possible properties to 
have at least some testing of the schema.

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
> index 63996ab03521..5ada35ddac7e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -20,7 +20,7 @@ patternProperties:
>    "^(keypad|m25p|max8952|max8997|max8998|mpmc),.*": true
>    "^(pinctrl-single|#pinctrl-single|PowerPC),.*": true
>    "^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*": true
> -  "^(simple-audio-card|st-plgpio|st-spics|ts),.*": true
> +  "^(simple-audio-card|audio-graph-card|st-plgpio|st-spics|ts),.*": true

This isn't needed as we got rid of the silly 'audio-graph-card,' prefix.

>  
>    # Keep list in alphabetical order.
>    "^70mai,.*":
> -- 
> 2.25.1
> 
