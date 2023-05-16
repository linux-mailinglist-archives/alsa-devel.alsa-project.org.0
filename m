Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D326708FC5
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 08:20:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1F86823;
	Fri, 19 May 2023 08:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1F86823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684477226;
	bh=U2Y/vPheZy6J/D33zSp8T3T6hKRNFq/f2beQyRQLJJE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DPuHZ7n9XINjHWkb8Sj8jRKs69Dx5arFKvLWGlqQEab7lpvZybc0HvhlUBtCap7HS
	 Z1Bjx4SUKWXJuhFuGM6nLyg0xn5r7tPm5jMMWJaYscrPddggTNmgp5+gaMIu0Al9ss
	 PYgjOLH1sDT4xTauZsDYjLY4nshUKsWK2zJgeo/Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E94E3F8057E; Fri, 19 May 2023 08:18:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01207F8056F;
	Fri, 19 May 2023 08:18:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0D05F80272; Tue, 16 May 2023 05:47:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 020EEF80087
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 05:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 020EEF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=ApPSFRvn
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1aad5245632so96998015ad.3
        for <alsa-devel@alsa-project.org>;
 Mon, 15 May 2023 20:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684208840; x=1686800840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJkA0m3mLV3FScvH0VRdP/qwbPPh2FB8d0fW+TuWxR4=;
        b=ApPSFRvnOtBS+Z/iKlnWcxMj6EFTaNcebWTAxUNqbr2V59bdCsI1CCGa7BSHqaDeQo
         Y716hG4KkN0jkNJRqHDrjT+AwLp9OZhn4DGdlJ3osLyZeE9jrOxLkOIUjMJkvpo84CAq
         nUTDHKlEa12CbYtD834uGpkePWIxfOzVkSxhCNiXiFb0yo2dh6eXGqhzdTiT1iPqmM5o
         51Or2UyL9Qx+e5KfZ5LhYuXVvZSCPLsQ/mCaORrP9aCbUB2c2S/PnEh5FColWdomJPuP
         SPspvw61zWv9jTS1y0MWuWQpPc6Zc2rkMxuDBflIpnO2zr1wz5G588YCFmWLp553g2yw
         ki8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684208840; x=1686800840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJkA0m3mLV3FScvH0VRdP/qwbPPh2FB8d0fW+TuWxR4=;
        b=Q8XxxcdiTtdIPlxakXiGGKclyU8E0ZcyeW+9e5ry/nApPHvEACKhwBAuRforF4pA0z
         ps0YkkfEbWVvJGTgWQlokiC24ITKUOCRFCYUd5abCMzHskWs4GGnhRml4c42BIXGbawu
         RsppJOqAbHxvZL04o37hAEFfX3ZiSfiiuQ5Ngj/nZW/6NQoIBzjH19zgJkqaIVq0FUKx
         RQ5m4xXAYMFDrU9i4/GjNPH5vhCKoiR7aux88oLWhieyCpEnups6F7vZyPfAmlx8TSCT
         RTg+0YCTSfYUxifN2uAIdZAy5OZBppokH5NZ0RBJQ0+3pBE6QQNktMyKGtTgP8hFgR0h
         wNaQ==
X-Gm-Message-State: AC+VfDzz/+NlLrqLnjBeW3JSnzyg+vYU9fgMOSeKp9RhKZoTmvY/zTEi
	7Q0X650xehC7Vd5Uk/nJX2Q=
X-Google-Smtp-Source: 
 ACHHUZ7e1MfX6kyZu2E4WmLGOzMJRaaqKuW9yru0MqXdpKhkdM51h0LCt+6AtwA0+6KM5psbnkf95w==
X-Received: by 2002:a17:903:41cb:b0:1ad:f7d9:1ae0 with SMTP id
 u11-20020a17090341cb00b001adf7d91ae0mr12593543ple.38.1684208839868;
        Mon, 15 May 2023 20:47:19 -0700 (PDT)
Received: from [10.230.29.214] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id
 k3-20020a170902ba8300b001a245b49731sm9786807pls.128.2023.05.15.20.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 20:47:19 -0700 (PDT)
Message-ID: <1ff2333a-8f78-c066-0158-9c8a1a17684f@gmail.com>
Date: Mon, 15 May 2023 20:47:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
Content-Language: en-US
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Brian Norris <briannorris@chromium.org>, Chuanhong Guo
 <gch981213@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Jean Delvare <jdelvare@suse.de>, Joel Stanley <joel@jms.id.au>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Le Moal <damien.lemoal@opensource.wdc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Liang Yang <liang.yang@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Lv Ruyi <lv.ruyi@zte.com.cn>, Mark Brown <broonie@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Olof Johansson <olof@lixom.net>,
 Paolo Abeni <pabeni@redhat.com>, Qin Jian <qinjian@cqplus1.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Sebastian Reichel <sre@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Stephen Boyd <sboyd@kernel.org>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, netdev@vger.kernel.org, soc@kernel.org
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230424123522.18302-1-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: f.fainelli@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: QFVAPS2XPIOLLRURWOAV5AI6R2SWV6AR
X-Message-ID-Hash: QFVAPS2XPIOLLRURWOAV5AI6R2SWV6AR
X-Mailman-Approved-At: Fri, 19 May 2023 06:16:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QFVAPS2XPIOLLRURWOAV5AI6R2SWV6AR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/24/2023 5:34 AM, Nikita Shubin wrote:
> This series aims to convert ep93xx from platform to full device tree support.
> 
> Tested on ts7250 64 RAM/128 MiB Nand flash, edb9302.
> 
> Thank you Linus and Arnd for your support, review and comments, sorry if i missed something -
> these series are quite big for me.
> 
> Big thanks to Alexander Sverdlin for his testing, support, review, fixes and patches.

If anyone is interested I still have a TS-7300 board [1] that is fully 
functional and could be sent out to a new home.

https://www.embeddedts.com/products/TS-7300
-- 
Florian
