Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482D1350AE
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 01:53:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C591B1742;
	Thu,  9 Jan 2020 01:53:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C591B1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578531237;
	bh=r8+DZqdPoISebbe0+mRo4YE5HioxrVc9Gc5Kl8HEY3g=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oXPmGsLwRxo+gWv1B+FpA52c1DZsIZl68inyiU7d/SyME+UHLBLGSD+iVnGK5Vhnf
	 CK4zvoVXwb+OWb1LX/3Fax7/klMw1eaqLNIXrctaIkF9GWBtU4hBiy4XZuKSYKd5oy
	 fw5xN9t9yVb4PLSFvDBOvMz31m+TjTJ6UAauB0XI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 149D5F801DA;
	Thu,  9 Jan 2020 01:52:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44731F80159; Thu,  9 Jan 2020 01:52:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94AD0F8010B
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 01:52:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94AD0F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tQg/80Xp"
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D2CA2072A
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 00:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578531125;
 bh=mktGJfHsMFQrtmdu14gzrvwrNpcXI7q6oePZRG7Ix7c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tQg/80XpWHi9Fk0rfxdoCl3U9Vb6aSiFeh7RqGE4m0T1567ZzPB2F9uOcPpt/zB+x
 hG3S1KM6qvqDoczg4XnI39r+BMnWXs+l8oP3Ej7X+INJ70gDYPvMTszowcef6zH8VA
 CHxyz/l8UWIYjtmYpqtVHQMpSow8RD65kJY71a/s=
Received: by mail-qt1-f169.google.com with SMTP id e12so4503761qto.2
 for <alsa-devel@alsa-project.org>; Wed, 08 Jan 2020 16:52:05 -0800 (PST)
X-Gm-Message-State: APjAAAWvTkXLF+xGjbBwcTUZ8N4y4SykhYBeZRg8NTr/2xg1LUx8UFfm
 ebStN8nt7HnR5Dl26rYvqsInme7fr8Kt0zjXuA==
X-Google-Smtp-Source: APXvYqwn5U2b76hJ0o/1i1bhirVF5Za7vucCVfvxv3MbDFk963p0knnzJrxMFN5kQu5MnV4Nte0uC7s2xQzLWfUYZAg=
X-Received: by 2002:aed:2344:: with SMTP id i4mr6189297qtc.136.1578531124413; 
 Wed, 08 Jan 2020 16:52:04 -0800 (PST)
MIME-Version: 1.0
References: <87pnftsd93.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnftsd93.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 8 Jan 2020 18:51:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJTKZ224Uw5WmY6acvQkbbzZDHB2BY90o2kQ4krn-N6qA@mail.gmail.com>
Message-ID: <CAL_JsqJTKZ224Uw5WmY6acvQkbbzZDHB2BY90o2kQ4krn-N6qA@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH][resend] ASoC: simple-card: switch to yaml
	base Documentation
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

On Wed, Jan 8, 2020 at 6:08 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>

If you want things reviewed in a timely fashion, use
get_maintainers.pl and send to the right lists. Otherwise you can just
hope I happen to see it.

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch switches from .txt base to .yaml base Document.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/simple-card.txt      | 351 ---------------
>  .../devicetree/bindings/sound/simple-card.yaml     | 472 +++++++++++++++++++++
>  2 files changed, 472 insertions(+), 351 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/simple-card.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/simple-card.yaml

> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> new file mode 100644
> index 0000000..ac3975f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -0,0 +1,472 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/simple-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple Audio Card Driver Device Tree Bindings
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +definitions:
> +
> +  frame-master:
> +    description: Indicates dai-link frame master.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  bitclock-master:
> +    description: Indicates dai-link bit clock master
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  frame-inversion:
> +    description: dai-link uses frame clock inversion
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  bitclock-inversion:
> +    description: dai-link uses bit clock inversion
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  mclk-fs:
> +    description: |
> +      Multiplication factor between stream rate and codec mclk.
> +      When defined, mclk-fs property defined in dai-link sub nodes are ignored.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  hp-det-gpio:
> +    description: |
> +      Reference to GPIO that signals when headphones are attached.
> +    $ref: /schemas/types.yaml#/definitions/phandle

*-gpio already hass  a type.

> +
> +  aux-devs:
> +    description: |
> +      List of phandles pointing to auxiliary devices, such
> +      as amplifiers, to be added to the sound card.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  mic-det-gpio:
> +    description: |
> +      Reference to GPIO that signals when a microphone is attached.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  convert-rate:
> +    description: CPU to Codec rate convert.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  convert-channels:
> +    description: CPU to Codec rate channels.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  prefix:
> +    description: "device name prefix"
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +  pin-switches:
> +    description: the widget names for which pin switches must be created.
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +
> +  format:
> +    description: audio format.
> +    oneOf:

Don't need oneOf as there is only 1.

> +      - items:
> +          enum:
> +            - i2s
> +            - right_j
> +            - left_j
> +            - dsp_a
> +            - dsp_b
> +            - ac97
> +            - pdm
> +            - msb
> +            - lsb
> +
> +  dai:
> +    type: object
> +    properties:
> +      sound-dai:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +      # common properties
> +      mclk-fs:
> +        $ref: "#/definitions/mclk-fs"
> +      prefix:
> +        $ref: "#/definitions/prefix"
> +      frame-inversion:
> +        $ref: "#/definitions/frame-inversion"
> +      bitclock-inversion:
> +        $ref: "#/definitions/bitclock-inversion"
> +      frame-master:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +      bitclock-master:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      dai-tdm-slot-num:
> +        description: see tdm-slot.txt.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      dai-tdm-slot-width:
> +        description: see tdm-slot.txt.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      clocks:
> +        description: |
> +          If a clock is specified and a multiplication factor is given with
> +          mclk-fs, the clock will be set to the calculated mclk frequency
> +          when the stream starts.
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +      system-clock-frequency:
> +        description: |
> +          If a clock is specified and a multiplication factor is given with
> +          mclk-fs, the clock will be set to the calculated mclk frequency
> +          when the stream starts.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      system-clock-direction-out:
> +        description: |
> +          specifies clock direction as 'out' on initialization.
> +          It is useful for some aCPUs with fixed clocks.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +    required:
> +      - sound-dai
> +
> +properties:
> +  compatible:
> +    contains:
> +      enum:
> +        - simple-audio-card
> +        - simple-scu-audio-card
> +
> +  "#address-cells": true
> +  "#size-cells": true
> +
> +  simple-audio-card,name:
> +    description: User specified audio sound card name.
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +  simple-audio-card,widgets:
> +    description: User specified audio sound card name.
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +
> +  simple-audio-card,routing:
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the
> +      connection's sink, the second being the connection's source.
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +
> +patternProperties:
> +  "^simple-audio-card,cpu.*":

What other names are allowed/used? '.*' leaves it wide open.

I guess it's just unit-addresses, but we really shouldn't have
unit-addresses as there aren't any 'reg' properties.

> +    description: CPU node
> +    $ref: "#/definitions/dai"

This is $ref is a description and another $ref. Just do away with 'definitions'.

> +  "^simple-audio-card,codec.*":
> +    description: CPU node
> +    $ref: "#/definitions/dai"
> +
> +  # common properties
> +  "^simple-audio-card,frame-master$":

Not a pattern. Put these under 'properties'.

> +    $ref: "#/definitions/frame-master"
> +  "^simple-audio-card,bitclock-master$":
> +    $ref: "#/definitions/bitclock-master"
> +  "^simple-audio-card,frame-inversion$":
> +    $ref: "#/definitions/frame-inversion"
> +  "^simple-audio-card,bitclock-inversion$":
> +    $ref: "#/definitions/bitclock-inversion"
> +  "^simple-audio-card,format$":
> +    $ref: "#/definitions/format"
> +  "^simple-audio-card,mclk-fs$":
> +    $ref: "#/definitions/mclk-fs"
> +  "^simple-audio-card,hp-det-gpio$":
> +    $ref: "#/definitions/hp-det-gpio"
> +  "^simple-audio-card,mic-det-gpio$":
> +    $ref: "#/definitions/mic-det-gpio"
> +  "^simple-audio-card,aux-devs$":
> +    $ref: "#/definitions/aux-devs"
> +  "^simple-audio-card,convert-rate$":
> +    $ref: "#/definitions/convert-rate"
> +  "^simple-audio-card,convert-channels$":
> +    $ref: "#/definitions/convert-channels"
> +  "^simple-audio-card,prefix$":
> +    $ref: "#/definitions/prefix"
> +  "^simple-audio-card,pin-switches$":
> +    $ref: "#/definitions/pin-switches"
> +
> +  "^simple-audio-card,dai-link":
> +    description: |
> +      Container for dai-link level properties and the CPU and CODEC sub-nodes.
> +      This container may be omitted when the card has only one DAI link.
> +    type: object
> +    properties:
> +      reg:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      # common properties
> +      frame-master:
> +        $ref: "#/definitions/frame-master"
> +      bitclock-master:
> +        $ref: "#/definitions/bitclock-master"
> +      frame-inversion:
> +        $ref: "#/definitions/frame-inversion"
> +      bitclock-inversion:
> +        $ref: "#/definitions/bitclock-inversion"
> +      format:
> +        $ref: "#/definitions/format"
> +      mclk-fs:
> +        $ref: "#/definitions/mclk-fs"
> +      hp-det-gpio:
> +        $ref: "#/definitions/hp-det-gpio"
> +      mic-det-gpio:
> +        $ref: "#/definitions/mic-det-gpio"
> +      aux-devs:
> +        $ref: "#/definitions/aux-devs"
> +      convert-rate:
> +        $ref: "#/definitions/convert-rate"
> +      convert-channels:
> +        $ref: "#/definitions/convert-channels"
> +      prefix:
> +        $ref: "#/definitions/prefix"
> +      pin-switches:
> +        $ref: "#/definitions/pin-switches"
> +
> +    patternProperties:
> +      "^cpu.*":
> +        $ref: "#/definitions/dai"
> +      "^codec.*":
> +        $ref: "#/definitions/dai"
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +#--------------------
> +# single DAI link
> +#--------------------
> +  - |
> +    sound {
> +        compatible = "simple-audio-card";
> +        simple-audio-card,name = "VF610-Tower-Sound-Card";
> +        simple-audio-card,format = "left_j";
> +        simple-audio-card,bitclock-master = <&dailink0_master>;
> +        simple-audio-card,frame-master = <&dailink0_master>;
> +        simple-audio-card,widgets =
> +                "Microphone", "Microphone Jack",
> +                "Headphone", "Headphone Jack",
> +                "Speaker", "External Speaker";
> +        simple-audio-card,routing =
> +                "MIC_IN", "Microphone Jack",
> +                "Headphone Jack", "HP_OUT",
> +                "External Speaker", "LINE_OUT";
> +
> +        simple-audio-card,cpu {
> +            sound-dai = <&sh_fsi2 0>;
> +        };
> +
> +        dailink0_master: simple-audio-card,codec {
> +            sound-dai = <&ak4648>;
> +            clocks = <&osc>;
> +        };
> +    };
> +
> +#--------------------
> +# Multi DAI links
> +#--------------------
> +  - |
> +    sound {
> +        compatible = "simple-audio-card";
> +        simple-audio-card,name = "Cubox Audio";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        simple-audio-card,dai-link@0 {         /* I2S - HDMI */
> +            reg = <0>;
> +            format = "i2s";
> +            cpu {
> +                sound-dai = <&audio0>;
> +            };
> +            codec {
> +                sound-dai = <&tda998x0>;
> +            };
> +        };
> +
> +        simple-audio-card,dai-link@1 {         /* S/PDIF - HDMI */
> +            reg = <1>;
> +            cpu {
> +                sound-dai = <&audio1>;
> +            };
> +            codec {
> +                sound-dai = <&tda998x1>;
> +            };
> +        };
> +
> +        simple-audio-card,dai-link@2 {         /* S/PDIF - S/PDIF */
> +            reg = <2>;
> +            cpu {
> +                sound-dai = <&audio2>;
> +            };
> +            codec {
> +                sound-dai = <&spdif_codec>;
> +            };
> +        };
> +    };
> +
> +#--------------------
> +# route audio from IMX6 SSI2 through TLV320DAC3100 codec
> +# through TPA6130A2 amplifier to headphones:
> +#--------------------
> +  - |
> +    sound {
> +        compatible = "simple-audio-card";
> +
> +        simple-audio-card,widgets =
> +            "Headphone", "Headphone Jack";
> +        simple-audio-card,routing =
> +            "Headphone Jack", "HPLEFT",
> +            "Headphone Jack", "HPRIGHT",
> +            "LEFTIN", "HPL",
> +            "RIGHTIN", "HPR";
> +        simple-audio-card,aux-devs = <&amp>;
> +        simple-audio-card,cpu {
> +            sound-dai = <&ssi2>;
> +        };
> +        simple-audio-card,codec {
> +            sound-dai = <&codec>;
> +            clocks = <&clocks>;
> +        };
> +    };
> +
> +#--------------------
> +# Sampling Rate Conversion
> +#--------------------
> +  - |
> +    sound {
> +        compatible = "simple-audio-card";
> +
> +        simple-audio-card,name = "rsnd-ak4643";
> +        simple-audio-card,format = "left_j";
> +        simple-audio-card,bitclock-master = <&sndcodec>;
> +        simple-audio-card,frame-master = <&sndcodec>;
> +
> +        simple-audio-card,convert-rate = <48000>;
> +
> +        simple-audio-card,prefix = "ak4642";
> +        simple-audio-card,routing = "ak4642 Playback", "DAI0 Playback",
> +                                    "DAI0 Capture", "ak4642 Capture";
> +
> +        sndcpu: simple-audio-card,cpu {
> +            sound-dai = <&rcar_sound>;
> +        };
> +
> +        sndcodec: simple-audio-card,codec {
> +            sound-dai = <&ak4643>;
> +            system-clock-frequency = <11289600>;
> +        };
> +    };
> +
> +#--------------------
> +# 2 CPU 1 Codec (Mixing)
> +#--------------------
> +  - |
> +    sound {
> +        compatible = "simple-audio-card";
> +
> +        simple-audio-card,name = "rsnd-ak4643";
> +        simple-audio-card,format = "left_j";
> +        simple-audio-card,bitclock-master = <&dpcmcpu>;
> +        simple-audio-card,frame-master = <&dpcmcpu>;
> +
> +        simple-audio-card,convert-rate = <48000>;
> +        simple-audio-card,convert-channels = <2>;
> +
> +        simple-audio-card,routing = "ak4642 Playback", "DAI0 Playback",
> +                                    "ak4642 Playback", "DAI1 Playback";
> +
> +        dpcmcpu: simple-audio-card,cpu@0 {
> +            sound-dai = <&rcar_sound 0>;
> +        };
> +
> +        simple-audio-card,cpu@1 {
> +            sound-dai = <&rcar_sound 1>;
> +        };
> +
> +        simple-audio-card,codec {
> +            prefix = "ak4642";
> +            sound-dai = <&ak4643>;
> +            clocks = <&audio_clock>;
> +        };
> +    };
> +
> +#--------------------
> +# Multi DAI links with DPCM:
> +#
> +# CPU0 ------ ak4613
> +# CPU1 ------ PCM3168A-p  /* DPCM 1ch/2ch */
> +# CPU2 --/                /* DPCM 3ch/4ch */
> +# CPU3 --/                /* DPCM 5ch/6ch */
> +# CPU4 --/                /* DPCM 7ch/8ch */
> +# CPU5 ------ PCM3168A-c
> +#--------------------
> +  - |
> +    sound {
> +        compatible = "simple-audio-card";
> +
> +        simple-audio-card,routing =
> +            "pcm3168a Playback", "DAI1 Playback",
> +            "pcm3168a Playback", "DAI2 Playback",
> +            "pcm3168a Playback", "DAI3 Playback",
> +            "pcm3168a Playback", "DAI4 Playback";
> +
> +        simple-audio-card,dai-link@0 {
> +            format = "left_j";
> +            bitclock-master = <&sndcpu0>;
> +            frame-master = <&sndcpu0>;
> +
> +            sndcpu0: cpu {
> +                sound-dai = <&rcar_sound 0>;
> +            };
> +            codec {
> +                sound-dai = <&ak4613>;
> +            };
> +        };
> +
> +        simple-audio-card,dai-link@1 {
> +            format = "i2s";
> +            bitclock-master = <&sndcpu1>;
> +            frame-master = <&sndcpu1>;
> +
> +            convert-channels = <8>; /* TDM Split */
> +
> +            sndcpu1: cpu@0 {
> +                sound-dai = <&rcar_sound 1>;
> +            };
> +            cpu@1 {
> +                sound-dai = <&rcar_sound 2>;
> +            };
> +            cpu@2 {
> +                sound-dai = <&rcar_sound 3>;
> +            };
> +            cpu@3 {
> +                sound-dai = <&rcar_sound 4>;
> +            };
> +            codec {
> +                mclk-fs = <512>;
> +                prefix = "pcm3168a";
> +                dai-tdm-slot-num = <8>;
> +                sound-dai = <&pcm3168a 0>;
> +            };
> +        };
> +
> +        simple-audio-card,dai-link@2 {
> +            format = "i2s";
> +            bitclock-master = <&sndcpu2>;
> +            frame-master = <&sndcpu2>;
> +
> +            sndcpu2: cpu {
> +                sound-dai = <&rcar_sound 5>;
> +            };
> +            codec {
> +                mclk-fs = <512>;
> +                prefix = "pcm3168a";
> +                sound-dai = <&pcm3168a 1>;
> +            };
> +        };
> +    };
> --
> 2.7.4
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
