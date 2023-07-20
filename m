Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AC675C23F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:57:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 365FCE9D;
	Fri, 21 Jul 2023 10:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 365FCE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689929860;
	bh=2ARiHNlrad2vGvB4emYBbwofYweAqxYX4CPUnH3eleM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ncogJRvwG7qmCwYxD9gdakDoa939QlEQElJFoXoe60/EajUvXfM8pit3ezv7+hbFw
	 SEkSc3EemxJ1eBRwmuGBBJb+rGLZdZ1LeV7m15Rz2TpBe4L17o5y00lphv31PLSXGX
	 ZUWy/TpOvvdK04ajg6tE5WGZTm2b7B3WUlPX4i/c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A579F80603; Fri, 21 Jul 2023 10:54:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47815F805FD;
	Fri, 21 Jul 2023 10:54:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C07B3F8047D; Thu, 20 Jul 2023 15:28:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68240F80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 15:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68240F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Qj36M7Hv
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b852785a65so6074035ad.0
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jul 2023 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689859716; x=1690464516;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3o5zfhOrGvbkMhIZNHbLcgV0VOFO8KOUPcq8qPlAWh4=;
        b=Qj36M7HvCZSXJt8fd1F+r8pMyLPJv6Tz6IzBXL04YLQUvveKF2RVd4XgbDnkQdFDsg
         PGBBU8EFO+DLZQtriJ1ndJxlDiA5oc+ROVqAmO8xzPU3m4w0DZSM3oRC6+e/g2vbs2d7
         QuAp4yxltGI8DPlB+J3YW4qR6a6vGsLcMZPqqVvEZKjfm0CsVfW8Kc12Z/+IYnLvQca7
         hNT7pVi5zCuqF/MS64EAbe5/kU2V2kgG9+LifDtG53cb2azOXHMairISCEnWw5Ed0Yhf
         sKvJ8YtOJA68hu5XOXc5/aHFbHYGpmJNNdY5QwkU0SIXrUtcfHVfcI7hlfIGP8Z2Xv28
         zmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859716; x=1690464516;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3o5zfhOrGvbkMhIZNHbLcgV0VOFO8KOUPcq8qPlAWh4=;
        b=Pkwo8vrbhLqr4iSXQm83h6ZUrIVfzITboWnMSUsTJNUBpopIDmZxdmGfUG4rsKwDSv
         ITpcm9eCFkABCDNDLcybb8xWTJRwg600I9lW4ZEKdzXcUwCJ02N9Xx1E5dmYL+ts0gn6
         4ZcnGQWy/JuBrkCzbWx2TGL145hdLmmIjW43hHfgnCCszKLiCpg7lGa3pEbyCv0NPaSm
         ArryBI5b/3MEqaIIfFWBxYqE+omMd93fgC8v9ri3KkXlnaGJ3ZSGqOR+oXSi9ZYJEokJ
         xQj9Tno0yorUIelMXlaV4PODd0DIvlYbGQigMVFL8NDgMW2VQIsyIJrOWztO6Xp57lC1
         Mm4Q==
X-Gm-Message-State: ABy/qLafIN581OOzCiARjZwD/fxJL5BGCS1+r6grYvuPijr463hP9Rm2
	9bjX6RDl3Yep1v8EoCIIWJo=
X-Google-Smtp-Source: 
 APBJJlHUPUivfHOgoXJP79qDNd5D4J3nF3SUABKNXv3IzHnbDE0pcAqJjXDoFhMrl2kqZtr0UmSiBg==
X-Received: by 2002:a17:902:c94c:b0:1b7:ca9c:4f5c with SMTP id
 i12-20020a170902c94c00b001b7ca9c4f5cmr6694496pla.28.1689859715396;
        Thu, 20 Jul 2023 06:28:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 jc15-20020a17090325cf00b001b5247cac3dsm1346340plb.110.2023.07.20.06.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 06:28:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <def5b29c-3318-2db1-a7fa-612ed1e81be6@roeck-us.net>
Date: Thu, 20 Jul 2023 06:28:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 12/42] dt-bindings: watchdog: Add Cirrus EP93x
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
 Wim Van Sebroeck <wim@linux-watchdog.org>, Sebastian Reichel
 <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
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
 <20230605-ep93xx-v3-12-3d63a5f1103e@maquefel.me>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230605-ep93xx-v3-12-3d63a5f1103e@maquefel.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: groeck7@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: TLDSP7VRQJDUCSWVQU5PAYE3XNTORRBB
X-Message-ID-Hash: TLDSP7VRQJDUCSWVQU5PAYE3XNTORRBB
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:54:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLDSP7VRQJDUCSWVQU5PAYE3XNTORRBB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/20/23 04:29, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> This adds device tree bindings for the Cirrus Logic EP93xx
> watchdog block used in these SoCs.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>   .../bindings/watchdog/cirrus,ep9301-wdt.yaml       | 46 ++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/cirrus,ep9301-wdt.yaml b/Documentation/devicetree/bindings/watchdog/cirrus,ep9301-wdt.yaml
> new file mode 100644
> index 000000000000..d54595174a12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/cirrus,ep9301-wdt.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/cirrus,ep9301-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic EP93xx Watchdog Timer
> +
> +maintainers:
> +  - Nikita Shubin <nikita.shubin@maquefel.me>
> +  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
> +
> +description:
> +  Cirrus Logic EP93xx SoC family has it's own watchdog implementation
> +

Odd description. Isn't that true for pretty much every devicetree
bindings file, and pretty much every hardware driver ?

> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: cirrus,ep9301-wdt
> +      - items:
> +          - enum:
> +              - cirrus,ep9302-wdt
> +              - cirrus,ep9307-wdt
> +              - cirrus,ep9312-wdt
> +              - cirrus,ep9315-wdt
> +          - const: cirrus,ep9301-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    watchdog@80940000 {
> +        compatible = "cirrus,ep9301-wdt";
> +        reg = <0x80940000 0x08>;
> +    };
> +
> 

