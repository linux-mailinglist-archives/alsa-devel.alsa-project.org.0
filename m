Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 034D3786AA5
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 10:49:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF512839;
	Thu, 24 Aug 2023 10:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF512839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692866955;
	bh=r0olNdi1aH2hXazi4Rks7nyrQ8Dk+Kb0HzbgppfOuq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RJ/VqPwWnfnmxw6kLgZv51487pMEYMY31SrnS2VomgIfJnjwyirW87g4A9wDB8+PJ
	 RqWAsF1lVEQUKVGpt3SwmViKPuSOdJlJ8ampFjH42TATaYWV2rxqjKaXvT4sXOH6EJ
	 icLC7XEmGkq/zUAUsOeLNF4V33KvwolMcNR7yOz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DADDF8023B; Thu, 24 Aug 2023 10:48:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D65BF800F5;
	Thu, 24 Aug 2023 10:48:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00176F80158; Wed, 23 Aug 2023 12:16:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60136F800D1
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 12:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60136F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LO6EWlz7
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-52a069edca6so4351955a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 23 Aug 2023 03:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692785793; x=1693390593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PkhmhhTWHkeRQp2PPUUxTCXWp1T0OTe7aVdp4fg5upo=;
        b=LO6EWlz79jJJ9v/UQCg4OZKmPJO9+j6QHM1tngs1xZjP73VY2yTNyozqbCEjmHkgOJ
         /I25kU9siRPAlFrz9dpUhrfTb7C4hK1nJcapsvmczx4ZFMRu+Id4skeNROqiKQ5j7fC1
         ZyyN0rEkpFnovXZ/Y9YFpI+20NzFPUlKW8oib55lhQS8AfgOyDR1cSStWeGIk4mOE/f8
         e8jk+ITZo8/vSFO72g6rBQt9NS7/HQQrfF/hlcYS6bEX+Ay7j17UK9K0sHHCYLh/aFQD
         moxfheS5gy+jsjw+9CZRAFxsIYJOD76OVSKpIkrcpc8QGv+VCkZ89LVZ+6AtV/ge1cjC
         e99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692785793; x=1693390593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PkhmhhTWHkeRQp2PPUUxTCXWp1T0OTe7aVdp4fg5upo=;
        b=HK+ZEQemh0yLfsbYko0JaIVJlMaeDfQ4phCyTHxp0sieH71X62zSdOTGgMfX3rjwPE
         v3Oe+frTWAfUefAnP0sSqDryyv7Qe3SsDcg2eVx1SpPIxABTbSUOrwFunESdsP/9bo7l
         BWRLpLU1bkgsv/gUpNlbSOKqUNLXEvNwIWMWhVOTCjElG5NZ8FkbLSuSUZfAT6Vm7Kbv
         m/Bc/UseT0Qw+dtlvWDW/AyNPp+HsXYvNqXkj/nRsTCkDjLjXtSKxgDE3XGMh/a3qD6y
         UzD46OCPSfNJjivY5isIC1y9Rn02mOMC4F9zviGiY24gSd5r838Ie7PYgdzJmIv6R+64
         AUUA==
X-Gm-Message-State: AOJu0YwHnfURXrSWlDEMTGgUOQo1DtrKSYsara2Xz1iwRr694C7FqUE9
	7aIjmuhIpeP9lU9U6pPqivwfWw==
X-Google-Smtp-Source: 
 AGHT+IG4cl/3Fz/QSS2cl3WXZt2VKfaSb/kNTKY6FTxfUyaMgKaOK/vEjbIWyu1Ae6CwwBgVchcQyg==
X-Received: by 2002:a05:6402:1614:b0:522:1e2f:fa36 with SMTP id
 f20-20020a056402161400b005221e2ffa36mr8763754edv.28.1692785793520;
        Wed, 23 Aug 2023 03:16:33 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a50fc0f000000b0051e1660a34esm9063699edr.51.2023.08.23.03.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 03:16:32 -0700 (PDT)
Message-ID: <61b9e036-7864-65c6-d43b-463fff896ddc@linaro.org>
Date: Wed, 23 Aug 2023 12:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 29/42] dt-bindings: rtc: Add ST M48T86
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
 <20230605-ep93xx-v3-29-3d63a5f1103e@maquefel.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605-ep93xx-v3-29-3d63a5f1103e@maquefel.me>
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
Message-ID-Hash: NPSQHKKNMKB6W4FJ3KFCNZ36HMOQXLME
X-Message-ID-Hash: NPSQHKKNMKB6W4FJ3KFCNZ36HMOQXLME
X-Mailman-Approved-At: Thu, 24 Aug 2023 08:48:17 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPSQHKKNMKB6W4FJ3KFCNZ36HMOQXLME/>
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
> Add YAML bindings for ST M48T86 / Dallas DS12887 RTC.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

