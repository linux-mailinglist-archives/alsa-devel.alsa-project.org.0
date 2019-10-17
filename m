Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC86DB6AC
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 20:58:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5367916B4;
	Thu, 17 Oct 2019 20:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5367916B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571338704;
	bh=0gsJYPVSdToYgKl9AKCOjAKW/H+maqUTlHKlUgCQ7Wo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NT/IVisnsv7adY/HjSXwd5IaHjKjIskdNQ2XZ4GKSg2GyUsYbnEjxw+owz0m6NCxk
	 eGhbJmCxbUewETHZhLqjjainRKpxV3dtXr8j97nqfmaoZS0XgFxmIPAhqnHodDBR4R
	 QVr0IGN8RlOcOeb8uvvL/3mlDhcdm4wcUzbiFjik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 934E2F804AB;
	Thu, 17 Oct 2019 20:56:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 977F2F804AA; Thu, 17 Oct 2019 20:56:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06AEDF802A0
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 20:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06AEDF802A0
Received: by mail-oi1-f193.google.com with SMTP id i16so3094232oie.4
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 11:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OIlKYxbD3v48QhMXdWaoqqWvm2v29IB+F6T3fMPmGFY=;
 b=mVnrWbLWmA6xKCC0NCYLNoaffIpXxjI0Kowd/8QMZZp8quFqyr/+3Pz1pmlHNbAeLz
 m/sEThd43YjgYtcY802MadDGloiPM5uEJJCGYO/aEQ/hjuvLbOAU7Zei0pCAo+V8OZmS
 m985Y91MzeNDVJTtE/rOdTUD/myeCRkolYxhyuEBpVuOZpF3HxNm33smuufFLB35lb86
 mInPGxhVhzrwJyNZdWjJhAc5XJoo3VbzjZd1YzsWpFotfK3m6C62hNo4FPx4WEhncUBv
 JF+WwflEgS+8WJErZt1T8ZO/mAZn81d6Li/sjvmwyomsi/5Ir55YJijAPm0t8IdmK+QO
 8FaQ==
X-Gm-Message-State: APjAAAXbhz2QghvR0OYJnLdRGS33XEafB57LdAEPR7WPnmPSQUxbqjRR
 jWzo1vjaQ67XipmYfSqIPw==
X-Google-Smtp-Source: APXvYqwbL0Ei9KK0E8mppc/FlyCSa2rde90FmcjmHdODK5gTRt8Pn98hBtxCMqhBOwYMBmAnsbM/PA==
X-Received: by 2002:a05:6808:614:: with SMTP id
 y20mr4647422oih.60.1571338589906; 
 Thu, 17 Oct 2019 11:56:29 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a88sm846203otb.0.2019.10.17.11.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:56:29 -0700 (PDT)
Date: Thu, 17 Oct 2019 13:56:28 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20191017185628.GA25020@bogus>
References: <CGME20191017100514eucas1p2e189e26e887c9cdd2209357c91846641@eucas1p2.samsung.com>
 <20191017100506.4036-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017100506.4036-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, Maciej Falkowski <m.falkowski@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v3] dt-bindings: sound: Convert Samsung
 Exynos5433 TM2(E) audio complex with WM5110 codec to dt-schema
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

On Thu, Oct 17, 2019 at 12:05:06PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung Exynos5433 TM2(E) audio complex with WM5110 codec to
> newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> [mszyprow: reordered non-standard properties, added list of values
>  for widgets, minor other fixes]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../bindings/sound/samsung,tm2-audio.txt      | 42 --------
>  .../bindings/sound/samsung,tm2-audio.yaml     | 99 +++++++++++++++++++
>  2 files changed, 99 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
> deleted file mode 100644
> index f5ccc12ddc00..000000000000
> --- a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Samsung Exynos5433 TM2(E) audio complex with WM5110 codec
> -
> -Required properties:
> -
> - - compatible		 : "samsung,tm2-audio"
> - - model		 : the user-visible name of this sound complex
> - - audio-codec		 : the first entry should be phandle of the wm5110 audio
> -			   codec node, as described in ../mfd/arizona.txt;
> -			   the second entry should be phandle of the HDMI
> -			   transmitter node
> - - i2s-controller	 : the list of phandle and argument tuples pointing to
> -			   I2S controllers, the first entry should be I2S0 and
> -			   the second one I2S1
> - - audio-amplifier	 : the phandle of the MAX98504 amplifier
> - - samsung,audio-routing : a list of the connections between audio components;
> -			   each entry is a pair of strings, the first being the
> -			   connection's sink, the second being the connection's
> -			   source; valid names for sources and sinks are the
> -			   WM5110's and MAX98504's pins and the jacks on the
> -			   board: HP, SPK, Main Mic, Sub Mic, Third Mic,
> -			   Headset Mic
> - - mic-bias-gpios	 : GPIO pin that enables the Main Mic bias regulator
> -
> -
> -Example:
> -
> -sound {
> -	compatible = "samsung,tm2-audio";
> -	audio-codec = <&wm5110>, <&hdmi>;
> -	i2s-controller = <&i2s0 0>, <&i2s1 0>;
> -	audio-amplifier = <&max98504>;
> -	mic-bias-gpios = <&gpr3 2 0>;
> -	model = "wm5110";
> -	samsung,audio-routing =
> -		"HP", "HPOUT1L",
> -		"HP", "HPOUT1R",
> -		"SPK", "SPKOUT",
> -		"SPKOUT", "HPOUT2L",
> -		"SPKOUT", "HPOUT2R",
> -		"Main Mic", "MICBIAS2",
> -		"IN1R", "Main Mic";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
> new file mode 100644
> index 000000000000..c9178d928ad4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/samsung,tm2-audio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos SoC Exynos5433 TM2(E) audio complex with WM5110 codec
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +
> +properties:
> +  compatible:
> +    const: samsung,tm2-audio
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The user-visible name of this sound complex.
> +
> +  i2s-controller:
> +    allOf:
> +    - $ref: /schemas/types.yaml#/definitions/phandle-array
> +    - items:
> +       - description: phandle of the I2S0.
> +       - description: phandle of the I2S1.
> +
> +  audio-codec:
> +    allOf:
> +    - $ref: /schemas/types.yaml#/definitions/phandle-array
> +    - items:
> +       - description: |
> +            phandle of the wm5110 audio codec node,
> +            as described in ../mfd/arizona.txt;
> +       - description: phandle of the HDMI transmitter node.
> +
> +  audio-amplifier:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of the MAX98504 amplifier.
> +
> +  mic-bias-gpios:
> +    description: GPIO pin that enables the Main Mic bias regulator.
> +    maxItems: 1
> +
> +  samsung,audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      List of the connections between audio components.
> +      Each entry is a pair of strings, the first being the
> +      connection's sink, the second being the connection's
> +      source. Valid names for sources and sinks are:
> +      the WM5110's pins:
> +         "HPOUT1L",
> +         "HPOUT1R",
> +         "HPOUT2L",
> +         "HPOUT2R",
> +         "HPOUT3L",
> +         "HPOUT3R",
> +      MAX98504's pins:
> +         "SPKOUT"
> +      and the jacks on the board:
> +         "HP",
> +         "SPK",
> +         "RCV",
> +         "Main Mic",
> +         "Sub Mic",
> +         "Third Mic",
> +         "Headset Mic".

All these strings can be a schema.

> +
> +required:
> +  - compatible
> +  - model
> +  - i2s-controller
> +  - audio-codec
> +  - audio-amplifier
> +  - mic-bias-gpios
> +  - samsung,audio-routing
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "samsung,tm2-audio";
> +        model = "wm5110";
> +        i2s-controller = <&i2s0 0>, <&i2s1 0>;
> +        audio-codec = <&wm5110>, <&hdmi>;
> +        audio-amplifier = <&max98504>;
> +        mic-bias-gpios = <&gpr3>;
> +        samsung,audio-routing =
> +                "HP", "HPOUT1L",
> +                "HP", "HPOUT1R",
> +                "SPK", "SPKOUT",
> +                "SPKOUT", "HPOUT2L",
> +                "SPKOUT", "HPOUT2R",
> +                "Main Mic", "MICBIAS2",
> +                "IN1R", "Main Mic";
> +    };
> +
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
