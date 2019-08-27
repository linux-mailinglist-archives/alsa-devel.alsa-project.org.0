Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 711049EB0C
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 16:31:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 094F41669;
	Tue, 27 Aug 2019 16:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 094F41669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566916272;
	bh=pjignS8QTEKls+FTjOMo8WoEJX5Kp9GM/DvmYfespPM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7zMPO03KVOLZ/UADGeI+hhNQ3lF9LuRS+ItF5CcDR1pexNL1Mt8lCjsGKSdlG4Fp
	 LpHKJnb4O5ByQKQ7R+GqruDH8DE1LKnnWBeYW6Zs9hPdNBtXO6zu278aeZn6yVEQW9
	 5iXhw4vPI9Dwx/TSmGO/Gx1PhanbnbYT8gC8UCy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FE8EF802A1;
	Tue, 27 Aug 2019 16:29:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 341AEF80274; Tue, 27 Aug 2019 16:29:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EFA5F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EFA5F801ED
Received: by mail-ed1-f65.google.com with SMTP id w5so31634316edl.8
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 07:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7BaT7WqHF/e/bUnH+2TrTHyVYT8MU5OxXpD2wLaF+Io=;
 b=RE9bKEARHri+i1BcoT4lCV2/iqdIBqscsQEIbuYoaYJr4J+rstuNzo8xbEaKzGwJuz
 frViWGBW6ZEsqXnf0XUviNeKWDCuYe49k/KxROhAgXLZEa929L1x+7S14bCBlnOe7L+X
 IAx51uvB79WSzgyLw682Xx8/hDAv3rtbHPayXLVg7LOd4MDylM5CMwslQXAyjIPg10EB
 QutDG8HFzpNpILfO1lvpq9BHZkxxautWauc1PvwDVHoRaCc+4F5ygmU46vb+YXVVsSCO
 MOLiXEnAMLsWoVPN0jt2qGQGwggeBgyx1cI7zeFZu1YgaMszR056btp9i9BGdv8uJzr+
 ZAsA==
X-Gm-Message-State: APjAAAWmh14RjJCtcT7VgemD6zfVSw5vUAzcuH077PPLa8EL26xQT+Ca
 l7uejTMgMgaR73IA0zIAvsSogwlHX4k=
X-Google-Smtp-Source: APXvYqx01NKBbWHX0zHj2ENW9B+TRZFvvnZQar6MYfHFGhiy4D42Uhbmku9ArPU2f3iBVpwMQ/I4nQ==
X-Received: by 2002:a17:906:b211:: with SMTP id
 p17mr21462981ejz.11.1566916184874; 
 Tue, 27 Aug 2019 07:29:44 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44])
 by smtp.gmail.com with ESMTPSA id y9sm1982874eds.49.2019.08.27.07.29.44
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2019 07:29:44 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id v15so3357479wml.0
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 07:29:44 -0700 (PDT)
X-Received: by 2002:a05:600c:292:: with SMTP id
 18mr29403987wmk.51.1566916184111; 
 Tue, 27 Aug 2019 07:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190827142547.14577-1-mripard@kernel.org>
 <20190827142547.14577-3-mripard@kernel.org>
In-Reply-To: <20190827142547.14577-3-mripard@kernel.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 27 Aug 2019 22:29:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v67tEgtD9PEus0TaPQg9969L_7dn2c4GFZSioR1AtxBpmQ@mail.gmail.com>
Message-ID: <CAGb2v67tEgtD9PEus0TaPQg9969L_7dn2c4GFZSioR1AtxBpmQ@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 3/5] dt-bindings: sound: Convert Allwinner
	A33 codec to a schema
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

On Tue, Aug 27, 2019 at 10:25 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The Allwinner A33 SoC have an embedded audio codec that is supported in Linux,
> with a matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../sound/allwinner,sun8i-a33-codec.yaml      | 57 +++++++++++++++++
>  .../bindings/sound/sun8i-a33-codec.txt        | 63 -------------------
>  2 files changed, 57 insertions(+), 63 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
>
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
> new file mode 100644
> index 000000000000..5e7cc05bbff1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/allwinner,sun8i-a33-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A33 Codec Device Tree Bindings
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
> +    const: allwinner,sun8i-a33-codec
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
> +      - const: bus
> +      - const: mod
> +
> +required:
> +  - "#sound-dai-cells"
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    audio-codec@1c22e00 {
> +      #sound-dai-cells = <0>;
> +      compatible = "allwinner,sun8i-a33-codec";
> +      reg = <0x01c22e00 0x400>;
> +      interrupts = <0 29 4>;
> +      clocks = <&ccu 47>, <&ccu 92>;
> +      clock-names = "bus", "mod";
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt b/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
> deleted file mode 100644
> index 7ecf6bd60d27..000000000000
> --- a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -Allwinner SUN8I audio codec
> -------------------------------------
> -
> -On Sun8i-A33 SoCs, the audio is separated in different parts:
> -         - A DAI driver. It uses the "sun4i-i2s" driver which is
> -         documented here:
> -         Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
> -         - An analog part of the codec which is handled as PRCM registers.
> -         See Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
> -         - An digital part of the codec which is documented in this current
> -         binding documentation.
> -         - And finally, an audio card which links all the above components.
> -         The simple-audio card will be used.
> -         See Documentation/devicetree/bindings/sound/simple-card.txt
> -
> -This bindings documentation exposes Sun8i codec (digital part).
> -
> -Required properties:
> -- compatible: must be "allwinner,sun8i-a33-codec"
> -- reg: must contain the registers location and length
> -- interrupts: must contain the codec interrupt
> -- clocks: a list of phandle + clock-specifer pairs, one for each entry
> -  in clock-names.
> -- clock-names: should contain followings:
> -   - "bus": the parent APB clock for this controller
> -   - "mod": the parent module clock
> -
> -Here is an example to add a sound card and the codec binding on sun8i SoCs that
> -are similar to A33 using simple-card:
> -
> -       sound {
> -               compatible = "simple-audio-card";
> -               simple-audio-card,name = "sun8i-a33-audio";
> -               simple-audio-card,format = "i2s";
> -               simple-audio-card,frame-master = <&link_codec>;
> -               simple-audio-card,bitclock-master = <&link_codec>;
> -               simple-audio-card,mclk-fs = <512>;
> -               simple-audio-card,aux-devs = <&codec_analog>;
> -               simple-audio-card,routing =
> -                               "Left DAC", "Digital Left DAC",
> -                               "Right DAC", "Digital Right DAC";

At some point we should start listing the endpoints available for routing?

ChenYu

> -
> -               simple-audio-card,cpu {
> -                       sound-dai = <&dai>;
> -               };
> -
> -               link_codec: simple-audio-card,codec {
> -                       sound-dai = <&codec>;
> -               };
> -
> -       soc@1c00000 {
> -               [...]
> -
> -               audio-codec@1c22e00 {
> -                       #sound-dai-cells = <0>;
> -                       compatible = "allwinner,sun8i-a33-codec";
> -                       reg = <0x01c22e00 0x400>;
> -                       interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&ccu CLK_BUS_CODEC>, <&ccu CLK_AC_DIG>;
> -                       clock-names = "bus", "mod";
> -               };
> -       };
> -
> --
> 2.21.0
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
