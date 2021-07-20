Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 033DB3CFD2F
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 17:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A6C21663;
	Tue, 20 Jul 2021 17:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A6C21663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626794055;
	bh=7Of/XASfV6JyTMQYMzRYn1mvngOifV1AXb6ezqkyor8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ivKerJXt+pNzT7EOLrNVa1XvDm/uNPb8fs8lr3Abams8itYgWPsc6cz2dK5s+xary
	 8KVX/80GrOu4hv2BSpSqfZatDz1sQpElazYkeBWBoMGW6KXKmNVSqOeUXgnO0tCLrD
	 uEU20NWjQ8T+Fd1+gmMehsciL0OBxiAfZTHul6Wo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C60D0F80227;
	Tue, 20 Jul 2021 17:12:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 088CEF80218; Tue, 20 Jul 2021 17:12:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1C9EF800DA
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 17:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1C9EF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j4uySCYy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 553A4610C7
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 15:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626793953;
 bh=7Of/XASfV6JyTMQYMzRYn1mvngOifV1AXb6ezqkyor8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j4uySCYy21EidCHJIQ/anyBkgVVjngERxQ949+Y9dVPKGn922Ym/A0+zZMRotNIjw
 Bjh9uqMVeX3/Myj77ohANg8jX8pE9Z1dvob3UhttV2zl8FFwU1ENhvK9tpKkiRlGUe
 ppyzjPUXgSHqJq3L+NiTwFhxB3o+8JsQCOnBZyfBSm2hpWpNh6HjWFay8mfZClCeoM
 7X7/yGX6/AOyVrM16+LaKVDNh/9bKpsbIKClXhDzEs5+qsF50HoP+hyHczo/bGjFR4
 OpWjYsxUPKew/ARJm2qFyvZUB49PUhtAyf+6HJvADTEiVKY1ZEVot1zlMJUdJ1GoAG
 0p9A4l9nlgBvQ==
Received: by mail-ej1-f51.google.com with SMTP id nd37so34856902ejc.3
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 08:12:33 -0700 (PDT)
X-Gm-Message-State: AOAM533nhK0ffzLh76ZX+USnUGGZIK+e8dbpKDAuw1pBYXTWrBC1o+/3
 0XdPUWNe8KkuOROQCCEfNCiWkEtGU/NbSa/YUA==
X-Google-Smtp-Source: ABdhPJz3lY82HONm0CljkbjIZWS9P+XaB+Ev6J3KmlNTrH2k5doctsf/q9Po2052mW5Vp5nhPaAOK3cg5lN/FXBFPrs=
X-Received: by 2002:a17:906:5fc1:: with SMTP id
 k1mr32355361ejv.360.1626793951888; 
 Tue, 20 Jul 2021 08:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <87a6mhwyqn.wl-kuninori.morimoto.gx@renesas.com>
 <87wnplvk2a.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wnplvk2a.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Jul 2021 09:12:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJKZ-sjbnihAkdXDk4tW8xVmyhwkHLHWouZg6da0cc99g@mail.gmail.com>
Message-ID: <CAL_JsqJKZ-sjbnihAkdXDk4tW8xVmyhwkHLHWouZg6da0cc99g@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] ASoC: audio-graph-card2: add Yaml Document
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
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

On Mon, Jul 19, 2021 at 7:48 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds Audio Graph Card2 Yaml bindings.
> It is similar to Audio Graph Card, but different.
>
>         - audio-graph-card  used "dais"  to indicate DAI-links,
>           audio-graph-card2 uses "links" to it.
>
>         - audio-graph-card  used "phandle" to indicate bitclock/frame-master,
>           audio-graph-card2 uses flag to it.
>
>         - audio-graph-card  used "format" to indicate DAI format,
>           audio-graph-card2 assumes CPU/Codec drivers have .get_fmt support.

Why do we need these changes? I'm not wild about a new generic binding
replacing an existing one which only has 2 or 3 users IIRC. Plus
there's already the Renesas variant. (On the flip side, only a few
users, easier to deprecate the old binding.)

I also would like to see the graph card replace the simple card
binding. Surely it can handle the 'simple' case too.

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../sound/audio-graph-card2-items.yaml        | 80 +++++++++++++++++++
>  .../bindings/sound/audio-graph-card2.yaml     | 51 ++++++++++++
>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card2-items.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2-items.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2-items.yaml
> new file mode 100644
> index 000000000000..ec94cad6b939
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card2-items.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/audio-graph-card2-items.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Audio Graph Card2 Items Bindings
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - audio-graph-card2-dsp
> +      - audio-graph-card2-multi
> +      - audio-graph-card2-codec2codec

This appears to be a significant change. Why do we need to encode this
info into the compatible? Can't walking the graph tell us this info?

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^ports(@[0-1])?$":
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port(@[0-9a-f]+)?:
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +    additionalProperties: true
> +
> +required:
> +  - compatible
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    mix {
> +        compatible = "audio-graph-card2-dsp";
> +
> +        /* sample ports
> +        ports@0 {
> +            port@0 { mix_fe0_ep: endpoint { remote-endpoint = <&cpu0_ep>; }; };
> +            port@1 { mix_fe1_ep: endpoint { remote-endpoint = <&cpu1_ep>; }; };
> +        };
> +        ports@1 {
> +            port@0 { mix_be0_ep: endpoint { remote-endpoint = <&codec0_ep>; }; };
> +        };
> +        */
> +    };
> +
> +    multi {
> +        compatible = "audio-graph-card2-multi";
> +
> +        /* sample ports
> +        ports@0 {
> +            port@0 { multi_00_ep: endpoint { remote-endpoint = <&cpu2_ep>; }; };
> +            port@1 { multi_01_ep: endpoint { remote-endpoint = <&cpu3_ep>; }; };
> +        };
> +        ports@1 {
> +            port@0 { multi_10_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
> +            port@1 { multi_11_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
> +        };
> +        */
> +    };
> +
> +    codec2codec {
> +        compatible = "audio-graph-card2-codec2codec";
> +
> +        /* sample ports
> +        rate = <48000>;
> +        ports {
> +            port@0 { c2c_0_ep: endpoint { remote-endpoint = <&codec3_ep>; }; };
> +            port@1 { c2c_1_ep: endpoint { remote-endpoint = <&codec4_ep>; }; };
> +        };
> +        */
> +    };
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> new file mode 100644
> index 000000000000..4975f88de025
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/audio-graph-card2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Audio Graph Card2 Device Tree Bindings
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - audio-graph-card2
> +  links:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +  label:
> +    maxItems: 1
> +  routing:
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the
> +      connection's sink, the second being the connection's source.
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +
> +required:
> +  - compatible
> +  - links
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "audio-graph-card2";
> +
> +        links = <&cpu_port>;
> +    };
> +
> +    cpu {
> +        compatible = "cpu-driver";
> +
> +        cpu_port: port { cpu_ep: endpoint { remote-endpoint = <&codec_ep>; }; };
> +    };
> +
> +    codec {
> +        compatible = "codec-driver";
> +
> +        port { codec_ep: endpoint { remote-endpoint = <&cpu_ep>; }; };
> +    };
> --
> 2.25.1
>
