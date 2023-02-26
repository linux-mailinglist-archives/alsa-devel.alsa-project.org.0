Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E78C56A33B0
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Feb 2023 20:38:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E141E832;
	Sun, 26 Feb 2023 20:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E141E832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677440309;
	bh=QqioRuCqde54rI/olV0z8bkd++77jJi9m+LaX/snbzE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LInNa0nRgOg0P9EV3Rf1/D/e3w6OTymdxXJiXY8UnfT5Af1exVrbhvb/oO8yzceQZ
	 oCMwzM1xEo+LisspIFIaV1V+fEQnY4ygMOGCqI4DdlzK7fcB2uxruzRXWGW55/1rxx
	 RAMqOU27YtdCk3tlFaB/hsWoo3ATFg52dpSKVGDY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88520F802BE;
	Sun, 26 Feb 2023 20:37:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA1E6F8049C; Sun, 26 Feb 2023 20:37:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E696F80236
	for <alsa-devel@alsa-project.org>; Sun, 26 Feb 2023 20:37:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E696F80236
Received: by mail-il1-f173.google.com with SMTP id h10so2888283ila.11
        for <alsa-devel@alsa-project.org>;
 Sun, 26 Feb 2023 11:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3V59Duu+LbDPEXLSvxwD8zXDN4WNV1rPfnVcbUHV3c=;
        b=4yyGfhDC7WueLq29jGpwhk0Ws+YMVW3QRmkIBnItpuqmwFguTlqsJqM8XQv684O2fd
         1hgkk9Q4nDw9SGtbDWZHtSWbI0B+iMcchmGhPxR8z68KqbhHFlp91O0ypblf5esHE4U5
         tOjbpv1kUMWFsfN1OVN5HZabvgil/NHOC1iYIhwVxLyrsYeTS9jhdkQ+K19WVCBTMEOE
         F5bdROzXdhF+6nEjbc4+jxxTk+n3yDaFrCMaaMLEjBTmED6TbYXRYMF69Ijc0zLezoex
         tcqkkKikWfN+Sqf8blT5OVZucMlWo/II8HG97IY79CFTiV8uBsbiRbip7QtFE9PBG+ST
         9BLQ==
X-Gm-Message-State: AO0yUKVSYK/NCsnjXjIoo+1We4Hdccrj+nL79lF6vjYjk5MO+B8SWekI
	WCmAKcSW52/cwqezKFQ1wQ==
X-Google-Smtp-Source: 
 AK7set+KoXSKhOB26nmgSluPEXmxlGByv3xNe7fWRYkpWFMQ2u8gY2CzrKkoNN1kyeL1Zb+et5t4lQ==
X-Received: by 2002:a05:6e02:1d87:b0:316:b0b2:c2f2 with SMTP id
 h7-20020a056e021d8700b00316b0b2c2f2mr22248461ila.3.1677440244320;
        Sun, 26 Feb 2023 11:37:24 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id
 f21-20020a056638023500b003eb8ea0da2csm1326227jaq.154.2023.02.26.11.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 11:37:24 -0800 (PST)
Received: (nullmailer pid 190082 invoked by uid 1000);
	Sun, 26 Feb 2023 19:37:20 -0000
Date: Sun, 26 Feb 2023 13:37:20 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 03/10] dt-bindings: sound: nvidia,tegra-audio: add
 RT5631 CODEC
Message-ID: <20230226193720.GA187553-robh@kernel.org>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-4-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-4-clamor95@gmail.com>
Message-ID-Hash: ONLHNTO7VR5R7TKWGKZ6L7QR5XDGQTHG
X-Message-ID-Hash: ONLHNTO7VR5R7TKWGKZ6L7QR5XDGQTHG
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONLHNTO7VR5R7TKWGKZ6L7QR5XDGQTHG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 21, 2023 at 08:32:04PM +0200, Svyatoslav Ryhel wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add dt-binding for RT5631 CODEC.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Your S-o-b is needed here as well.

> ---
>  .../sound/nvidia,tegra-audio-rt5631.yaml      | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> new file mode 100644
> index 000000000000..b347f34c47f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5631.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra audio complex with RT5631 CODEC
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +allOf:
> +  - $ref: nvidia,tegra-audio-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - pattern: '^[a-z0-9]+,tegra-audio-rt5631(-[a-z0-9]+)+$'
> +      - const: nvidia,tegra-audio-rt5631
> +
> +  nvidia,audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the connection's sink,
> +      the second being the connection's source. Valid names for sources and
> +      sinks are the pins (documented in the binding document),
> +      and the jacks on the board.
> +    minItems: 2
> +    items:
> +      enum:
> +        # Board Connectors
> +        - "Int Spk"
> +        - "Headphone Jack"
> +        - "Mic Jack"
> +        - "Int Mic"
> +
> +        # CODEC Pins
> +        - MIC1
> +        - MIC2
> +        - AXIL
> +        - AXIR
> +        - MONOIN_RXN
> +        - MONOIN_RXP
> +        - DMIC
> +        - MIC Bias1
> +        - MIC Bias2
> +        - MONO_IN
> +        - AUXO1
> +        - AUXO2
> +        - SPOL
> +        - SPOR
> +        - HPOL
> +        - HPOR
> +        - MONO
> +
> +required:
> +  - nvidia,i2s-controller
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra30-car.h>
> +    #include <dt-bindings/soc/tegra-pmc.h>
> +    sound {
> +        compatible = "asus,tegra-audio-rt5631-tf700t",
> +                     "nvidia,tegra-audio-rt5631";
> +        nvidia,model = "Asus Transformer Infinity TF700T RT5631";
> +
> +        nvidia,audio-routing =
> +                "Headphone Jack", "HPOL",
> +                "Headphone Jack", "HPOR",
> +                "Int Spk", "SPOL",
> +                "Int Spk", "SPOR",
> +                "MIC1", "MIC Bias1",
> +                "MIC Bias1", "Mic Jack",
> +                "DMIC", "Int Mic";
> +
> +        nvidia,i2s-controller = <&tegra_i2s1>;
> +        nvidia,audio-codec = <&rt5631>;
> +
> +        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
> +                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
> +                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
> +        clock-names = "pll_a", "pll_a_out0", "mclk";
> +    };
> -- 
> 2.37.2
> 
