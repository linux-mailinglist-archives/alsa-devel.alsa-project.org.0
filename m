Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1966CABD2D
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 18:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CF1A1658;
	Fri,  6 Sep 2019 17:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CF1A1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567785649;
	bh=WUWI3E42++h1ELqv61PE+9VLevjRu/ZLSlp6uUmBjxs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u/ZDSv73baN9t1DwBv5Lbp4FQrNKtJZ55f3iTpdWuHBcoiR6xjLr/ZL9VmqLJ41hY
	 DzJXxJY3gw8pTmcDaIWNmfoJK48gOttpF0LM8QtCmH/BUvMQ+Kfqy2zlOxQMWuISc7
	 rW410rpNKs9//rRI4igqxapU7LbYyLHFgRTPayws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CD11F803A6;
	Fri,  6 Sep 2019 17:59:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6D95F80394; Fri,  6 Sep 2019 17:59:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 195CCF80171
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 17:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 195CCF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xqU+aQyB"
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B6A421670
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 15:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567785535;
 bh=5Xa64DDgQTlA0twWFBEh/6rw5yPEcKMciY3q5SZHGpg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=xqU+aQyBLnNXZ8poKwGLkz3m8ePw3SkXcnTf/tehuTwQ6wJ1sm/nTyeY4S4JkkUjV
 oPtJWHJC07ohFUvm6NmUGVcZMRQjXjfMnYtZwXZz03TGsAfrS1neKuAC3G3Ld3HhyT
 PAjwpaWkGKpFQl11Z0unFdwGdx/EyNFQ5ra+xKjc=
Received: by mail-qt1-f172.google.com with SMTP id k10so7607468qth.2
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 08:58:55 -0700 (PDT)
X-Gm-Message-State: APjAAAVHMimBfncllbuuadbkUtSWEd0cfal1XFv1T+krveD0ZNrR6+vF
 adTj0qInvNRXwzgyTAp32FMqLFTFRCDK5PVePw==
X-Google-Smtp-Source: APXvYqx1zzwAucWFSeUA5Xn8OCCP477JQH3tzPjHEKs13+RFD/VFPewf7geqIl0U2abjEY7ZDlC9s5Mmsmsx3lb3DLQ=
X-Received: by 2002:ac8:100d:: with SMTP id z13mr3867259qti.224.1567785534684; 
 Fri, 06 Sep 2019 08:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190906151221.3148-1-mripard@kernel.org>
In-Reply-To: <20190906151221.3148-1-mripard@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 6 Sep 2019 16:58:42 +0100
X-Gmail-Original-Message-ID: <CAL_Jsq+a=YaN79A-NXVvnPzLijjkoVkjQJcceq4xwhH6ujpgqA@mail.gmail.com>
Message-ID: <CAL_Jsq+a=YaN79A-NXVvnPzLijjkoVkjQJcceq4xwhH6ujpgqA@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v3 1/2] ASoC: dt-bindings: Convert
 Allwinner A10 codec to a schema
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

On Fri, Sep 6, 2019 at 4:12 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The Allwinner SoCs have an embedded audio codec that is supported in Linux,
> with a matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - Change the audio-routing values to an enum, and enforce boundaries on
>     the size
>   - Add restrictions to the possible values of audio-routing
>
> Changes from v1:
>   - Fix subject prefix
> ---
>  .../sound/allwinner,sun4i-a10-codec.yaml      | 262 ++++++++++++++++++
>  .../devicetree/bindings/sound/sun4i-codec.txt |  94 -------
>  2 files changed, 262 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/sun4i-codec.txt
>
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> new file mode 100644
> index 000000000000..faa75b91c072
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> @@ -0,0 +1,262 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A10 Codec Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +properties:
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  compatible:
> +    enum:
> +      - allwinner,sun4i-a10-codec
> +      - allwinner,sun6i-a31-codec
> +      - allwinner,sun7i-a20-codec
> +      - allwinner,sun8i-a23-codec
> +      - allwinner,sun8i-h3-codec
> +      - allwinner,sun8i-v3s-codec
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bus Clock
> +      - description: Module Clock
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: codec
> +
> +  dmas:
> +    items:
> +      - description: RX DMA Channel
> +      - description: TX DMA Channel
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
> +  resets:
> +    maxItems: 1
> +
> +  allwinner,audio-routing:
> +    description: |-
> +      A list of the connections between audio components.  Each entry
> +      is a pair of strings, the first being the connection's sink, the
> +      second being the connection's source.
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/non-unique-string-array
> +      - minItems: 2
> +        maxItems: 18
> +        enum:
> +          # Audio Pins on the SoC
> +          - HP
> +          - HPCOM
> +          - LINEIN
> +          - LINEOUT
> +          - MIC1
> +          - MIC2
> +          - MIC3
> +
> +          # Microphone Biases from the SoC
> +          - HBIAS
> +          - MBIAS
> +
> +          # Board Connectors
> +          - Headphone
> +          - Headset Mic
> +          - Line In
> +          - Line Out
> +          - Mic
> +          - Speaker
> +
> +  allwinner,codec-analog-controls:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the codec analog controls in the PRCM
> +
> +  allwinner,pa-gpios:
> +    description: GPIO to enable the external amplifier
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
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun6i-a31-codec
> +            - allwinner,sun8i-a23-codec
> +            - allwinner,sun8i-h3-codec
> +            - allwinner,sun8i-v3s-codec
> +
> +    then:
> +      if:
> +        properties:
> +          compatible:
> +            const: allwinner,sun6i-a31-codec
> +
> +      then:
> +        required:
> +          - resets
> +          - allwinner,audio-routing
> +
> +      else:
> +        required:
> +          - resets
> +          - allwinner,audio-routing
> +          - allwinner,codec-analog-controls
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun6i-a31-codec
> +
> +    then:
> +      properties:
> +        allwinner,audio-routing:
> +          enum:
> +            - HP
> +            - HPCOM
> +            - LINEIN
> +            - LINEOUT
> +            - MIC1
> +            - MIC2
> +            - MIC3
> +            - HBIAS
> +            - MBIAS
> +            - Headphone
> +            - Headset Mic
> +            - Line In
> +            - Line Out
> +            - Mic
> +            - Speaker

This looks like the same list as the default...

> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun8i-a23-codec
> +
> +    then:
> +      properties:
> +        allwinner,audio-routing:
> +          enum:
> +            - HP
> +            - HPCOM
> +            - LINEIN
> +            - MIC1
> +            - MIC2
> +            - HBIAS
> +            - MBIAS
> +            - Headphone
> +            - Headset Mic
> +            - Line In
> +            - Line Out
> +            - Mic
> +            - Speaker
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun8i-h3-codec
> +
> +    then:
> +      properties:
> +        allwinner,audio-routing:
> +          enum:
> +            - HP
> +            - HPCOM
> +            - LINEIN
> +            - LINEOUT
> +            - MIC1
> +            - MIC2
> +            - HBIAS
> +            - MBIAS
> +            - Headphone
> +            - Headset Mic
> +            - Line In
> +            - Line Out
> +            - Mic
> +            - Speaker
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun8i-v3s-codec
> +
> +    then:
> +      properties:
> +        allwinner,audio-routing:
> +          enum:
> +            - HP
> +            - HPCOM
> +            - MIC1
> +            - HBIAS
> +            - Headphone
> +            - Headset Mic
> +            - Line In
> +            - Line Out
> +            - Mic
> +            - Speaker
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    codec@1c22c00 {
> +        #sound-dai-cells = <0>;
> +        compatible = "allwinner,sun7i-a20-codec";
> +        reg = <0x01c22c00 0x40>;
> +        interrupts = <0 30 4>;
> +        clocks = <&apb0_gates 0>, <&codec_clk>;
> +        clock-names = "apb", "codec";
> +        dmas = <&dma 0 19>, <&dma 0 19>;
> +        dma-names = "rx", "tx";
> +    };
> +
> +  - |
> +    codec@1c22c00 {
> +        #sound-dai-cells = <0>;
> +        compatible = "allwinner,sun6i-a31-codec";
> +        reg = <0x01c22c00 0x98>;
> +        interrupts = <0 29 4>;
> +        clocks = <&ccu 61>, <&ccu 135>;
> +        clock-names = "apb", "codec";
> +        resets = <&ccu 42>;
> +        dmas = <&dma 15>, <&dma 15>;
> +        dma-names = "rx", "tx";
> +        allwinner,audio-routing =
> +            "Headphone", "HP",
> +            "Speaker", "LINEOUT",
> +            "LINEIN", "Line In",
> +            "MIC1", "MBIAS",
> +            "MIC1", "Mic",
> +            "MIC2", "HBIAS",
> +            "MIC2", "Headset Mic";
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/sound/sun4i-codec.txt b/Documentation/devicetree/bindings/sound/sun4i-codec.txt
> deleted file mode 100644
> index 66579bbd3294..000000000000
> --- a/Documentation/devicetree/bindings/sound/sun4i-codec.txt
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -* Allwinner A10 Codec
> -
> -Required properties:
> -- compatible: must be one of the following compatibles:
> -               - "allwinner,sun4i-a10-codec"
> -               - "allwinner,sun6i-a31-codec"
> -               - "allwinner,sun7i-a20-codec"
> -               - "allwinner,sun8i-a23-codec"
> -               - "allwinner,sun8i-h3-codec"
> -               - "allwinner,sun8i-v3s-codec"
> -- reg: must contain the registers location and length
> -- interrupts: must contain the codec interrupt
> -- dmas: DMA channels for tx and rx dma. See the DMA client binding,
> -       Documentation/devicetree/bindings/dma/dma.txt
> -- dma-names: should include "tx" and "rx".
> -- clocks: a list of phandle + clock-specifer pairs, one for each entry
> -  in clock-names.
> -- clock-names: should contain the following:
> -   - "apb": the parent APB clock for this controller
> -   - "codec": the parent module clock
> -
> -Optional properties:
> -- allwinner,pa-gpios: gpio to enable external amplifier
> -
> -Required properties for the following compatibles:
> -               - "allwinner,sun6i-a31-codec"
> -               - "allwinner,sun8i-a23-codec"
> -               - "allwinner,sun8i-h3-codec"
> -               - "allwinner,sun8i-v3s-codec"
> -- resets: phandle to the reset control for this device
> -- allwinner,audio-routing: A list of the connections between audio components.
> -                          Each entry is a pair of strings, the first being the
> -                          connection's sink, the second being the connection's
> -                          source. Valid names include:
> -
> -                          Audio pins on the SoC:
> -                          "HP"
> -                          "HPCOM"
> -                          "LINEIN"     (not on sun8i-v3s)
> -                          "LINEOUT"    (not on sun8i-a23 or sun8i-v3s)
> -                          "MIC1"
> -                          "MIC2"       (not on sun8i-v3s)
> -                          "MIC3"       (sun6i-a31 only)
> -
> -                          Microphone biases from the SoC:
> -                          "HBIAS"
> -                          "MBIAS"      (not on sun8i-v3s)
> -
> -                          Board connectors:
> -                          "Headphone"
> -                          "Headset Mic"
> -                          "Line In"
> -                          "Line Out"
> -                          "Mic"
> -                          "Speaker"
> -
> -Required properties for the following compatibles:
> -               - "allwinner,sun8i-a23-codec"
> -               - "allwinner,sun8i-h3-codec"
> -               - "allwinner,sun8i-v3s-codec"
> -- allwinner,codec-analog-controls: A phandle to the codec analog controls
> -                                  block in the PRCM.
> -
> -Example:
> -codec: codec@1c22c00 {
> -       #sound-dai-cells = <0>;
> -       compatible = "allwinner,sun7i-a20-codec";
> -       reg = <0x01c22c00 0x40>;
> -       interrupts = <0 30 4>;
> -       clocks = <&apb0_gates 0>, <&codec_clk>;
> -       clock-names = "apb", "codec";
> -       dmas = <&dma 0 19>, <&dma 0 19>;
> -       dma-names = "rx", "tx";
> -};
> -
> -codec: codec@1c22c00 {
> -       #sound-dai-cells = <0>;
> -       compatible = "allwinner,sun6i-a31-codec";
> -       reg = <0x01c22c00 0x98>;
> -       interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> -       clocks = <&ccu CLK_APB1_CODEC>, <&ccu CLK_CODEC>;
> -       clock-names = "apb", "codec";
> -       resets = <&ccu RST_APB1_CODEC>;
> -       dmas = <&dma 15>, <&dma 15>;
> -       dma-names = "rx", "tx";
> -       allwinner,audio-routing =
> -               "Headphone", "HP",
> -               "Speaker", "LINEOUT",
> -               "LINEIN", "Line In",
> -               "MIC1", "MBIAS",
> -               "MIC1", "Mic",
> -               "MIC2", "HBIAS",
> -               "MIC2", "Headset Mic";
> -};
> --
> 2.21.0
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
