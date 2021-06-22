Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5524E3B0653
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 15:57:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA1C71672;
	Tue, 22 Jun 2021 15:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA1C71672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624370237;
	bh=3RMMaM5Zw1m2GntHRz/UhMk48YJ/+zIZ19FlN1B/mu0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rj938kf7KkjKbztVQYyoJb1Ka6nxHvt2p5hQ0fFzR8n3+c8mlgC7kMOX+xw+64fjG
	 5eZl3DOaHqe6zle4pHlBb4aIQo3OUPIm6PVFY290FewVO3VtlrZcnii9PictQ1xQsV
	 UVnyxBbZwI0SW/5wWFHPZaXBZwUGOisXURI8ZqJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E78FF8026A;
	Tue, 22 Jun 2021 15:55:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4CE9F80268; Tue, 22 Jun 2021 15:55:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A3C8F80137
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 15:55:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A3C8F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="afsmtOZF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B5A061289
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 13:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624370132;
 bh=3RMMaM5Zw1m2GntHRz/UhMk48YJ/+zIZ19FlN1B/mu0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=afsmtOZFsnv6k9HhbfauJ14vknti1m64TsfidrfR3XLHf+qNjXftIbKmXdutaN8v8
 x7wgkjkM/VC0WufZLWuC8GVDkIfS0UurIsqVYmi9rq/bL+4pDfYKzL0HvWh8PQ1z+3
 RVYaymYR6hZq5LhW250DzyFBG4Uue0vMow3HYcCTL48sLY8mz4kwjXeLkpd0cUaDPV
 iLzpYMFixJZZrhBvWUBZNCdstO/7Ar7iBvAeAfkTuxp12BW8ZGBrPot3IGHaA/NetR
 7SMsXCVSOFkt+3NL+sLCDKs1Wq6oZUy2K1xnlKs5f/mgbfxsQpmixJ2jFBW/cgRSmB
 Pu/xTDs6Dec1g==
Received: by mail-ej1-f50.google.com with SMTP id my49so34595481ejc.7
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 06:55:32 -0700 (PDT)
X-Gm-Message-State: AOAM530tzJQIUeShz5kd2OYj87g29solcCOgSVHcXNFOqKxdoaxbNF07
 oY4Au0Y6nSembyoNIbweJMJnWxHYSTx89+WLeA==
X-Google-Smtp-Source: ABdhPJyfzO4ypU84F2YUtP8bvq/f3UwD5BUqXslASf+G9Le3Y+D+Klk5MTmvA7rbRCP3RphZVyyyR4S+OjhqLiODzEA=
X-Received: by 2002:a17:907:1dd9:: with SMTP id
 og25mr4133741ejc.108.1624370130940; 
 Tue, 22 Jun 2021 06:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <871r8u4s6q.wl-kuninori.morimoto.gx@renesas.com>
 <87mtri3djq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mtri3djq.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 22 Jun 2021 07:55:18 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLiCVNXM4-GDp1jQL9viGG_0Ouaz=Oqsh_PH5n2DPtwiQ@mail.gmail.com>
Message-ID: <CAL_JsqLiCVNXM4-GDp1jQL9viGG_0Ouaz=Oqsh_PH5n2DPtwiQ@mail.gmail.com>
Subject: Re: [PATCH RFC 10/15] ASoC: audio-graph-card2: add Yaml Document
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On Mon, Jun 21, 2021 at 7:15 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Needs to go to DT list for checks and review...

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
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../sound/audio-graph-card2-items.yaml        | 36 +++++++++
>  .../bindings/sound/audio-graph-card2.yaml     | 45 +++++++++++
>  .../bindings/sound/audio-graph-port2.yaml     | 74 +++++++++++++++++++
>  3 files changed, 155 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card2-items.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-port2.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2-items.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2-items.yaml
> new file mode 100644
> index 000000000000..40439f78df60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card2-items.yaml
> @@ -0,0 +1,36 @@
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
> +    };
> +
> +    multi {
> +        compatible = "audio-graph-card2-multi";
> +    };
> +
> +    codec2codec {
> +        compatible = "audio-graph-card2-codec2codec";
> +    };
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> new file mode 100644
> index 000000000000..b5908ef144c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> @@ -0,0 +1,45 @@
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
> +unevaluatedProperties: false
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
> +        cpu_port: port { cpu_ep: endpoint { remote-endpoint = <&codec_ep>; }; };
> +    };
> +
> +    codec {
> +        port { codec_ep: endpoint { remote-endpoint = <&cpu_ep>; }; };
> +    };
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port2.yaml
> new file mode 100644
> index 000000000000..0a7753a140bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port2.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/audio-graph-port.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Audio Graph Card2 'port' Node Bindings
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +select: false
> +
> +properties:
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
> +      mclk-fs:
> +        description: |
> +         Multiplication factor between stream rate and codec mclk.
> +         When defined, mclk-fs property defined in dai-link sub nodes are
> +         ignored.
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
> +              When defined, mclk-fs property defined in dai-link sub nodes are
> +              ignored.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +          frame-inversion:
> +            description: dai-link uses frame clock inversion
> +            $ref: /schemas/types.yaml#/definitions/flag
> +          bitclock-inversion:
> +            description: dai-link uses bit clock inversion
> +            $ref: /schemas/types.yaml#/definitions/flag
> +          frame-master:
> +            description: Indicates dai-link frame master.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +          bitclock-master:
> +            description: Indicates dai-link bit clock master
> +            $ref: /schemas/types.yaml#/definitions/flag
> +          convert-rate:
> +            description: CPU to Codec rate convert.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +          convert-channels:
> +            description: CPU to Codec rate channels.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  ports:
> +    description: multi OF-Graph subnode
> +    type: object
> +    patternProperties:
> +      "^port(@[0-9a-f]+)?":
> +        $ref: "#/properties/port"
> +
> +additionalProperties: true
> --
> 2.25.1
>
