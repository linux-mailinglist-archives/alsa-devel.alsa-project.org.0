Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4606C75DD97
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jul 2023 19:07:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65B04200;
	Sat, 22 Jul 2023 19:06:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65B04200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690045659;
	bh=eAgVQxAQDwqYiLDsfh+Sz6k0iEXvkKfUzzOqcou6ms0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n/iD4XjGBLgN32Htn+KMbo507q9Bc1bhN053Hdm0kAZSRZ6RViE5OXZ1EwjsdXz5M
	 R+tmnOF2TYAsaTS/cN0Z6bterqqsbnPZWdVO/jMZ++F06XgZJOtH9m+no8o1IW386Z
	 wjt8lDpqxOB2GrrI4Xi/eKqZ4rgiwbUiDOEkuKY4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D397AF8057E; Sat, 22 Jul 2023 19:05:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C767F80579;
	Sat, 22 Jul 2023 19:05:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8662AF8047D; Fri, 21 Jul 2023 16:01:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5118F8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 16:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5118F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZiVB2hHS
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3142a9ffa89so1701769f8f.0
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Jul 2023 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689948104; x=1690552904;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kGZ5LqU0Zryf5RXxHBpf5dofqREFTyZTeFWlFYPBfA8=;
        b=ZiVB2hHSTZRmiaMmbMREaMhbawMx/KUt3cg1qeF1gBfCQQAGIBGPHjWK50hX362tpU
         fMapfTUkHNiMW2EcbBz3SgWGkAp6pnHxDhqm4HHqfVuIIfYvxWb4ogcWbai4vpYhJADI
         nWulY7lsgECJ57xXy/eajLo129aMmkczTVRAjkIe0wiSagmvvtOEMM8dttszF+P0remm
         RGTV8zYGxv0/wyu9CCIL2fyYMd0tbEu3edlaV1yZeI84Bkx+jEwwKA/R03nUuupkA/DL
         bFjJcVPJ1Os8KPfwF5c406w0MGIwcfg3il9N5GJ9UXq+jvImjTaQ3Zov5AQGHQM9OcQ+
         H5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689948104; x=1690552904;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kGZ5LqU0Zryf5RXxHBpf5dofqREFTyZTeFWlFYPBfA8=;
        b=iCOQKFA7gPvOOrbcG2GhO9E1Va0qzZ1v/lsfEM9SHlD1OjIusEnQrvW+xme1VFSS1M
         fzzExdX737FpmJvy8sraNAbi8EMRD4EmyVSAlTX8Ah5lZ4FTMY76N0xODXSwDkgf0cvO
         8MxBXQicvfn2VW+inNuKFJJfVSaBESLE2VERiUKlz3L0wPFcGBfhdaiQ9yXXictahby0
         FxCQotjqBMUMc4S5xA4I+BroPD7jEEdW3Vw1S2rFgTYQlUQWDmMZNJ94WU8JSxPZ2ll7
         hHolBSgXCPjsCFNzGfw0f8deOjprm7YxlbMGJ7OQVraXsB+6vDhanS6B3BtK/AWUmddo
         +Lzw==
X-Gm-Message-State: ABy/qLatSxC6HDMoyU1vvODmcyqNyAYphM00TtFIuM/XIuX8BWJ0i+PH
	Mdv1xAGmdJh1i0Gbpb24i1BTyQ==
X-Google-Smtp-Source: 
 APBJJlFl0X021T0an8cBRN2rsT+BJ+nZ0MYlRyFEpg2gd2RFuh46KGFuFZP+LfRCosw99RkgkE80Jg==
X-Received: by 2002:adf:ea50:0:b0:314:2732:e81e with SMTP id
 j16-20020adfea50000000b003142732e81emr1636390wrn.8.1689948103685;
        Fri, 21 Jul 2023 07:01:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 r5-20020adff105000000b003145521f4e5sm4278545wro.116.2023.07.21.07.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 07:01:42 -0700 (PDT)
Message-ID: <66fba798-c6ef-1105-656a-5d593a056448@linaro.org>
Date: Fri, 21 Jul 2023 16:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 04/42] dt-bindings: pinctrl: Add Cirrus EP93xx
Content-Language: en-US
To: nikita.shubin@maquefel.me, Hartley Sweeten
 <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>,
 Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-4-3d63a5f1103e@maquefel.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605-ep93xx-v3-4-3d63a5f1103e@maquefel.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: XNOGCPZIMA673IQHVDDK7WIEM7XDUIDV
X-Message-ID-Hash: XNOGCPZIMA673IQHVDDK7WIEM7XDUIDV
X-Mailman-Approved-At: Sat, 22 Jul 2023 17:03:51 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNOGCPZIMA673IQHVDDK7WIEM7XDUIDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/07/2023 13:29, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> Add YAML bindings for ep93xx SoC pinctrl.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/pinctrl/cirrus,ep9301-pinctrl.yaml    | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,ep9301-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,ep9301-pinctrl.yaml
> new file mode 100644
> index 000000000000..d5682531b0da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/cirrus,ep9301-pinctrl.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/cirrus,ep9301-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus ep93xx pins mux controller
> +
> +maintainers:
> +  - Nikita Shubin <nikita.shubin@maquefel.me>
> +  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: cirrus,ep9301-pinctrl
> +      - items:
> +          - enum:
> +              - cirrus,ep9302-pinctrl
> +              - cirrus,ep9307-pinctrl
> +              - cirrus,ep9312-pinctrl
> +              - cirrus,ep9315-pinctrl
> +          - const: cirrus,ep9301-pinctrl
> +
> +patternProperties:
> +  '^pins-':
> +    type: object
> +    description: pin node
> +    $ref: pinmux-node.yaml#

You need:
unevaluatedProperties: false



Best regards,
Krzysztof

