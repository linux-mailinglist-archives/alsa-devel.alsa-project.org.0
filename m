Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B4087DF7D
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 20:04:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0886E22A5;
	Sun, 17 Mar 2024 20:04:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0886E22A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710702250;
	bh=jxULVwpCUVr9kQOyAisgtABRYa85JCUAZu0zVjCuxi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sarnDqzKMKf5nzhRjR7DHmjv1lRy75mYBEl0AT8t4V/sBTGI9DfHpbSN6QZg17qc8
	 9uvyYPfJfcmQWluWKkpAzdhoGl7X0IYuXlrAsffiEgptlG5jvxbjdJKHZg5gqbJZml
	 yCLNQKbGv9Q38aZbown7j+Cfbe6o9bMc+4yTuxUs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11284F80589; Sun, 17 Mar 2024 20:03:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 547DFF80563;
	Sun, 17 Mar 2024 20:03:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 073FDF804E7; Sun, 17 Mar 2024 20:03:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F415F80093
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 20:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F415F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xi1NLRde
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 784A560B21;
	Sun, 17 Mar 2024 19:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF428C433C7;
	Sun, 17 Mar 2024 19:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710702199;
	bh=jxULVwpCUVr9kQOyAisgtABRYa85JCUAZu0zVjCuxi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xi1NLRdeQz3riPNdP1ZHBPXe07dfHk/rdBMlDxr2BAuWQwtUOT7wvm3iubrbXXRN0
	 3vowVuTwWxL1s7iACpQuBk/vkRcZCT/JJ5Z8c0tC3QPuziteHXLw3/Z8COb++V4GZ6
	 2eyOGxxt+APWQCchtJO/NvGK5HaFgYvHfO0lBLoy0k/h0fGna/hRg7DfRtlUG4KMxh
	 1rZDa2CW6huDD/xp9X1X85VVCwEm1JLvFApN8U15+hRS7536bgd+HACCcW/V9KWZgw
	 u+cyv0lcIr6NEMbrcKFNSdZn6Qi22PoIuJVZ9TF7SQyVWhwOpcVhuQs3cnSvP1x8Fd
	 JSiL782nMVAlg==
Date: Sun, 17 Mar 2024 13:03:16 -0600
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	kernel@salutedevices.com
Subject: Re: [PATCH 11/25] ASoC: dt-bindings: meson: t9015: add support for
 A1 SoC family
Message-ID: <20240317190316.GA2071139-robh@kernel.org>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-12-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-12-jan.dakinevich@salutedevices.com>
Message-ID-Hash: 4OHFVZRDYYEODR5RGG6O3F2FXWBCCRO7
X-Message-ID-Hash: 4OHFVZRDYYEODR5RGG6O3F2FXWBCCRO7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OHFVZRDYYEODR5RGG6O3F2FXWBCCRO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 15, 2024 at 02:21:47AM +0300, Jan Dakinevich wrote:
> Add "amlogic,t9015-a1" compatible string.

That's obvious from the diff. Perhaps what does 'a1' mean? What the 
difference from the existing compatible?

> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  Documentation/devicetree/bindings/sound/amlogic,t9015.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> index 5f5cccdbeb34..ee8bd57dbcf9 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> @@ -21,7 +21,9 @@ properties:
>  
>    compatible:
>      items:
> -      - const: amlogic,t9015
> +      - enum:
> +          - amlogic,t9015
> +          - amlogic,t9015-a1
>  
>    clocks:
>      items:
> -- 
> 2.34.1
> 
