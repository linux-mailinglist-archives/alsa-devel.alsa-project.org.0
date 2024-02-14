Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E917854ADE
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 14:59:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBB44A4A;
	Wed, 14 Feb 2024 14:59:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBB44A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707919152;
	bh=D4otYk0l4L8666y0XkXrWB2HS/+cq+srK0Sn0rtCIgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pLn5M0/NJEXE66W4yqBptcg5o/bVAGuG6IRXo5qz35+sGdvQUClVdAj1hZdN7Q6MY
	 m4rl5puAISXGYTVz4b7k65vJXgrt0oXDGZtrTwot7gsF+Zvfov1y9pp3eIkpIut02y
	 qLSKD+piocYJ3c55GsiREF+eFCi5mLTDAxS5Z108=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 855D6F804CC; Wed, 14 Feb 2024 14:58:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB25DF8015B;
	Wed, 14 Feb 2024 14:58:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75CBAF80238; Wed, 14 Feb 2024 14:58:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44DBDF8015B
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 14:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44DBDF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PpH00fCG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E141F6191D;
	Wed, 14 Feb 2024 13:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4735BC433F1;
	Wed, 14 Feb 2024 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707919106;
	bh=D4otYk0l4L8666y0XkXrWB2HS/+cq+srK0Sn0rtCIgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpH00fCGZkawUyAQTGR2TJxby/VMmedAoH91WkBzTCBJPBA9L9ngKEcwTbQB1WeOn
	 Vm+B+wi8IE+rNXNnlBUb+MngbMOaFL/yhsgGY/K6mWYtahg/XAh2jAgUrOx3356qgS
	 yPXSEGPFbdums4li05nbf2yeQjT4rY+RxFT+DKgqTpEWBWeMZmumjkjcB2HG4ahyQ6
	 7Ih/Dz/EfauKYuTUaObB3U+1wMhWe0zyYG4+oU/cGCE9deNCUP3i9ds7ici6u/zOHJ
	 XaGeyZGm71QkHVZiawpTCIC/qNECvfNzq9m2fpUjKqXGeuiEqBq++0UBf9wfrp8WZH
	 jv9s8oPPfPk7Q==
Date: Wed, 14 Feb 2024 07:58:24 -0600
From: Rob Herring <robh@kernel.org>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sound:atmel-at91sam9g20ek: convert bindings
 to json-schema
Message-ID: <20240214135824.GA692740-robh@kernel.org>
References: 
 <20240214-at91sam9g20ek-wm8731-yaml-v1-1-33333e17383b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20240214-at91sam9g20ek-wm8731-yaml-v1-1-33333e17383b@microchip.com>
Message-ID-Hash: VOJBTHDV67YM43PMG7DBWIHVTK3EY55M
X-Message-ID-Hash: VOJBTHDV67YM43PMG7DBWIHVTK3EY55M
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOJBTHDV67YM43PMG7DBWIHVTK3EY55M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 14, 2024 at 12:10:06PM +0530, Balakrishnan Sambath wrote:
> Convert atmel-at91sam9g20ek-wm8731-audio DT binding to yaml
> based json-schema.Change file name to match json-scheme naming.
> 
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
>  .../bindings/sound/atmel,at91sam9g20ek-wm8731.yaml | 60 ++++++++++++++++++++++
>  .../sound/atmel-at91sam9g20ek-wm8731-audio.txt     | 26 ----------
>  2 files changed, 60 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/atmel,at91sam9g20ek-wm8731.yaml b/Documentation/devicetree/bindings/sound/atmel,at91sam9g20ek-wm8731.yaml
> new file mode 100644
> index 000000000000..f6330707fe1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/atmel,at91sam9g20ek-wm8731.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/atmel,at91sam9g20ek-wm8731.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel at91sam9g20ek wm8731 audio complex
> +
> +maintainers:
> +  - Balakrishnan Sambath <balakrishnan.s@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: atmel,at91sam9g20ek-wm8731-audio
> +
> +  atmel,model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The user-visible name of this sound complex.

blank line between DT properties

> +  atmel,audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: A list of the connections between audio components.
> +    minItems: 2

No max?

> +    items:
> +      enum:
> +        # Board Connectors
> +        - "Ext Spk"
> +        - "Int MIC"
> +
> +        # CODEC Pins
> +        - LHPOUT
> +        - MICIN
> +  atmel,ssc-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the SSC controller
> +  atmel,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of WM8731 audio codec
> +
> +required:
> +  - compatible
> +  - atmel,model
> +  - atmel,audio-routing
> +  - atmel,ssc-controller
> +  - atmel,audio-codec
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "atmel,at91sam9g20ek-wm8731-audio";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_pck0_as_mck>;
> +        atmel,model = "wm8731 @ AT91SAMG20EK";
> +        atmel,audio-routing =
> +            "Ext Spk", "LHPOUT",
> +            "Int MIC", "MICIN";
> +        atmel,ssc-controller = <&ssc0>;
> +        atmel,audio-codec = <&wm8731>;
> +    };
