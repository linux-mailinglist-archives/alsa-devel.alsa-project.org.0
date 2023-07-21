Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 328BA75DD99
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jul 2023 19:08:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80A3A7F4;
	Sat, 22 Jul 2023 19:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80A3A7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690045691;
	bh=y3uPCtFFct1/WnbNPDhGdpj4wISgJhAKfVWrav4yi+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i/KuSeUZbEZHpVvWrBQ6cBQrE9AOhZjBlWRvjfLrW4WkX4ja1hFp5wl6TsJpNDfuZ
	 1ivygyXhl5IKyLrHnXbixRxm/oYZKHsqESQtRBz0RS50JMcmRv2RjcPQ0FpLzj+3be
	 5BW73gDo2NnALfl0d/vnzAnh0SrA0uzRu3WF0TSY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A08DF805B0; Sat, 22 Jul 2023 19:05:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18E77F805AA;
	Sat, 22 Jul 2023 19:05:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99C38F8047D; Fri, 21 Jul 2023 16:07:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C10EBF8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 16:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C10EBF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UywUc+C0
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8fcso12644785e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Jul 2023 07:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689948473; x=1690553273;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2qkUshKHVzVp+c/Y0demp7gaQXxbXWhnsTKXjZPyo0=;
        b=UywUc+C0GWGsJmsnwwyJfmenKpLuppCyVgn7fiVYk6w8oSQSyUPADu9CVzT0lItaIY
         JormQX7Bee7HUdM1Us0r3vshqvTW9dDS77pz9B/D2/ZA9svRp6qlgOzmPqZwXZh6JV1/
         jFAXc0VCSjO1FhzSB/42DbWYEZLCPHvRoJtnZSW/6xd3CWsvpKl50jxs8bWH4bIonPhx
         mfuI8ES1EO+wJ7wjJ7D30ET7A/S3K9wdVKebziw7EOvtZk48W3EgUDtaXZXX93H2sArO
         cOiSlGVXpphHHUVrTWcN6efAAohsXSYhMb2r+xKhHw3ppirNHnquGubX9HEPBDh6NwUV
         LT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689948473; x=1690553273;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y2qkUshKHVzVp+c/Y0demp7gaQXxbXWhnsTKXjZPyo0=;
        b=boER8c9s54Gn/d70Die2r4I5oILGn2evLD1065oTszvU2CnK9ou57rHRbE0z7ptq36
         pHS8zzvi5qHM97E9L78UFqnsaf/RaXQ21e/N7gkr3DTcd/hZ605q4qZulSlg7mf7OynS
         fVSxvgwOs5k5WSsoMfRf59MNBu94ui9otIDAfra4d9Ev7o08v8QQNCpunwROEen2gViy
         rOSrwGjuetEcqf1rPZSBSe7nVC5VZsTe4coQwO6fqW/jySiup2dJjefPwBxICgfvs4GO
         f3+3+smO+gJ2rh5zG541lTCMccj+dPeSe5+sL0XtPN4/i8/AMNw+BV22+bHTQhFhDTuE
         GJXg==
X-Gm-Message-State: ABy/qLbv0E5vz643PwjFdcbL+JopwaEeNV8aA1XH370foV0ud1aZr+Wl
	4neyxLC+/6Db+KoTWOp/Q9KoFQ==
X-Google-Smtp-Source: 
 APBJJlHD6QFq7rMNB+KGBdqcP5NQHt4EfBmeBFQNK2CYYyWBzSCftYAyfr7ps7sa61qFYb64TkY4Cg==
X-Received: by 2002:a05:600c:1d1b:b0:3f9:68f:9c1a with SMTP id
 l27-20020a05600c1d1b00b003f9068f9c1amr7732579wms.15.1689948473091;
        Fri, 21 Jul 2023 07:07:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 g9-20020a7bc4c9000000b003fbca05faa9sm3387097wmk.24.2023.07.21.07.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 07:07:52 -0700 (PDT)
Message-ID: <3267b625-4597-7658-9faf-800862ca07a5@linaro.org>
Date: Fri, 21 Jul 2023 16:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 10/42] dt-bindings: rtc: Add Cirrus EP93xx
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
 <20230605-ep93xx-v3-10-3d63a5f1103e@maquefel.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605-ep93xx-v3-10-3d63a5f1103e@maquefel.me>
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
Message-ID-Hash: 6XE4KVT2C3XXSK2OA6T7CDN54AU6T6KA
X-Message-ID-Hash: 6XE4KVT2C3XXSK2OA6T7CDN54AU6T6KA
X-Mailman-Approved-At: Sat, 22 Jul 2023 17:03:51 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6XE4KVT2C3XXSK2OA6T7CDN54AU6T6KA/>
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
> This adds device tree bindings for the Cirrus Logic EP93xx
> RTC block used in these SoCs.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  .../devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml b/Documentation/devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml
> new file mode 100644
> index 000000000000..63572c197e92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/cirrus,ep9301-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus EP93xx Real Time Clock controller
> +
> +maintainers:
> +  - Hartley Sweeten <hsweeten@visionengravers.com>
> +  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
> +

allOf: with $ref to rtc.yaml

> +properties:
> +  compatible:
> +    oneOf:
> +      - const: cirrus,ep9301-rtc
> +      - items:
> +          - enum:
> +              - cirrus,ep9302-rtc
> +              - cirrus,ep9307-rtc
> +              - cirrus,ep9312-rtc
> +              - cirrus,ep9315-rtc
> +          - const: cirrus,ep9301-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

and then unevaluatedProperties instead.

> +
> +examples:
> +  - |
> +    rtc@80920000 {
> +      compatible = "cirrus,ep9301-rtc";
> +      reg = <0x80920000 0x100>;
> +    };
> +


Each of your file has a trailing blank line.

Best regards,
Krzysztof

