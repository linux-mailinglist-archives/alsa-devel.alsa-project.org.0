Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 645E875C24C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:59:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B6AAE92;
	Fri, 21 Jul 2023 10:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B6AAE92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689929963;
	bh=9ctZmDV13Kh+Hot8/5Y8puENl1/IkM5Fg2XggDWrado=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B7B/MaukuWFvVCinPOge+pPjg9226BI2cziQUpnSGQ/0Lw9NtDfWOoi1MnzaeYWra
	 LRX3077N0r9x9TP6gLk1pI3+bYIHLAWKu/mQMye9sexQNd4PH3igL2fzCRuJx+zf+Y
	 KJeYts9rhfwpPu/Vca3C4d9YlpoNSYu6oz4x//2Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A4FDF80651; Fri, 21 Jul 2023 10:54:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EF36F80544;
	Fri, 21 Jul 2023 10:54:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBA2BF8047D; Fri, 21 Jul 2023 01:20:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45C53F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 01:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45C53F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cYbD9BIb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD03261CAE;
	Thu, 20 Jul 2023 23:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C583C433C8;
	Thu, 20 Jul 2023 23:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689895227;
	bh=9ctZmDV13Kh+Hot8/5Y8puENl1/IkM5Fg2XggDWrado=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=cYbD9BIbKe9OOqdwr3dzlL9wR5KaUX5QP2379F7HDHytuvs+1MP54q0Z68hGsKH4B
	 FYWl7tZYiSDpdOLegT+YQZM1yXUy5lwOu+8wosqMqhfiEPancQh0OsMx7gngCZFRkw
	 pJsU0gGmQ3yzb23zLs6tK4Bc3oZ1qfa0PA7RELaz/17Nk344wIVC1tSV56N7uYZFOa
	 nyr5zxSzIMgd63Ws7TvT1S5JL0M5v+l9wHZlr/Q9lh/6EOA+OyejOA9ESm2BbYF40v
	 AD9xlhIEjpsnEl3JoCBTGL1ZDlPD1p+JZWCY79kM1KNfmzIfj3Ot4lKfzjQq+kUXEx
	 1F+hprA229KgQ==
Message-ID: <11dbf88d12051497ba1e3b16c0d39066.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230605-ep93xx-v3-2-3d63a5f1103e@maquefel.me>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-2-3d63a5f1103e@maquefel.me>
Subject: Re: [PATCH v3 02/42] dt-bindings: clock: Add Cirrus EP93xx
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
 alsa-devel@alsa-project.org
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 David S. Miller <davem@davemloft.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Guenter Roeck <linux@roeck-us.net>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Kris Bahnsen <kris@embeddedTS.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lennert Buytenhek <kernel@wantstofly.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Mark Brown <broonie@kernel.org>, Michael Peters <mpeters@embeddedTS.com>,
 Michael Turquette <mturquette@baylibr
 e.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>,
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>,
 Olof Johansson <olof@lixom.net>, Paolo Abeni <pabeni@redhat.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Sebastian Reichel <sre@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, soc@kernel.org
Date: Thu, 20 Jul 2023 16:20:24 -0700
User-Agent: alot/0.10
X-MailFrom: sboyd@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: CYNFLNRL4X6262NRKBR3WXKWNEH5ENHO
X-Message-ID-Hash: CYNFLNRL4X6262NRKBR3WXKWNEH5ENHO
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:54:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYNFLNRL4X6262NRKBR3WXKWNEH5ENHO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Nikita Shubin via B4 Relay (2023-07-20 04:29:02)
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,ep9301-clk.ya=
ml b/Documentation/devicetree/bindings/clock/cirrus,ep9301-clk.yaml
> new file mode 100644
> index 000000000000..111e016601fb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/cirrus,ep9301-clk.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/cirrus,ep9301-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic ep93xx SoC's clock controller
> +
> +maintainers:
> +  - Nikita Shubin <nikita.shubin@maquefel.me>
> +  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: cirrus,ep9301-clk
> +      - items:
> +          - enum:
> +              - cirrus,ep9302-clk
> +              - cirrus,ep9307-clk
> +              - cirrus,ep9312-clk
> +              - cirrus,ep9315-clk
> +          - const: cirrus,ep9301-clk
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: reference clock
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller {
> +      compatible =3D "cirrus,ep9301-clk";

Is there a reg property? The driver grabs some syscon and then iomaps
it, so presumably there is a register range. Is it part of some other
hardware block? If so, can you make that device register sub-devices
with the auxiliary bus instead of using a syscon?
