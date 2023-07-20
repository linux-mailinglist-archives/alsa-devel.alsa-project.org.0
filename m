Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F9575C240
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:57:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E8A6E9C;
	Fri, 21 Jul 2023 10:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E8A6E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689929868;
	bh=1BZGSFTjemw/YALWMosXErnhYxcfpQbxAZQBeV8MwOY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wbb2IW0MN1kTszyX4qpXuHVec3m8OV50OZ4kxV2iZ4TQlNGDxDPeHIpqEGB03rudD
	 xNrrcC0WjmjjE9ULBz8URwuM/pvSyMwebR8OUZ1xYZOy+uVtIZwIlIWmYFstXt+uqn
	 X6/ezIklyRpPnYSBCXyRct4J+OovEK5FLrI2jVTY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 164B0F80520; Fri, 21 Jul 2023 10:54:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6118BF80606;
	Fri, 21 Jul 2023 10:54:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4752F8047D; Thu, 20 Jul 2023 15:29:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BCC8F800D2
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 15:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BCC8F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=rIQoiENQ
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-345f3e28082so4132365ab.1
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jul 2023 06:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689859762; x=1690464562;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=x7oP+tgkV5g5gPIWjsy0lzcqUnb7CSAq9qZKlzt2F6c=;
        b=rIQoiENQDVB93EfK7Iwx+E2mxs3LQ0YPdhj/iK7ys8ALeunIn8wezadJpkQTW+Sjif
         UlzB5oAiRo65QeGsQurJ0qXGhqKvssdTu16jb/Fhkf9SqC8Bc+Rk/BsoxsRJLBYJLXie
         qSkDkv93lfgJS9eeZoTTuLFqvnVba5pEa9rxlsf2P4+u/2Q9YgNlA8/OlETqH0QdCUIx
         f+omEBPKkwxj2rkDHti14N9qCY7Jh/R98b9DjfJKJo0LqwlJxUz0B1WIH6XLq/3Tsr/q
         4DXjtnqzPe7gvYhNRU0XZVUqawMJUtcZ5iUFQMGml0Di+4pHyvV3iE4sXw0M7Z/OaTcz
         y40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859762; x=1690464562;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7oP+tgkV5g5gPIWjsy0lzcqUnb7CSAq9qZKlzt2F6c=;
        b=PA64c7GWiQtGybhYR0Vuox9jClQBc3MkC5qVah0iOFdrfmL2P7WeChFO1LKNWgMG3z
         X2e+a1THHIBbdoR+JIled+PAmaEk67UZ97ec6yAMwd39BhtW9NSQZkjfrt01FApYLcXd
         tG2WhD5ArLUSeO222xj3beEWkCG5/Yg9u5FenJCMtnrBCE5fzYlgy6J4QBreQOY13kIq
         u6PlxTLP1Avbyaps0PfjXHVuDUG+OPIQD50EfAv9yNYjm5I1vtftjiXu5eOspFoqJ5z/
         oZ70CZptQqn3s7PK4AMdc8l7m9We4XOjS5XXkqnctfXGnoVQuqWlXO0WJX9o8cOSXkyb
         7WRQ==
X-Gm-Message-State: ABy/qLYav6V6Muu/asY8q8YB9Q6iyNxiQZfUQxi7FbTaf1cyElCfBWsu
	x0/zxNZwBAnB2HYLsXYNwL0=
X-Google-Smtp-Source: 
 APBJJlE+ImiGpXR+XhiWfpQ8DqRAptYIM/vmmrqcxub/OhO7f7vQvGYjfcGO6fmJR6FGooFnlcTVMw==
X-Received: by 2002:a05:6e02:1d83:b0:348:936e:d01c with SMTP id
 h3-20020a056e021d8300b00348936ed01cmr9173098ila.1.1689859762259;
        Thu, 20 Jul 2023 06:29:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 66-20020a17090a09c800b0025be7b69d73sm1065543pjo.12.2023.07.20.06.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 06:29:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f7d7ed7b-5a12-b393-54cf-eafd51bf72e7@roeck-us.net>
Date: Thu, 20 Jul 2023 06:29:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 13/42] watchdog: ep93xx: add DT support for Cirrus
 EP93xx
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
 <20230605-ep93xx-v3-13-3d63a5f1103e@maquefel.me>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230605-ep93xx-v3-13-3d63a5f1103e@maquefel.me>
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
Message-ID-Hash: TWGZXO2NG2DLZK4FDBQQGLX2BLOHTDD5
X-Message-ID-Hash: TWGZXO2NG2DLZK4FDBQQGLX2BLOHTDD5
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:54:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWGZXO2NG2DLZK4FDBQQGLX2BLOHTDD5/>
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
> Add OF ID match table.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/ep93xx_wdt.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/watchdog/ep93xx_wdt.c b/drivers/watchdog/ep93xx_wdt.c
> index 59dfd7f6bf0b..af89b7bb8f66 100644
> --- a/drivers/watchdog/ep93xx_wdt.c
> +++ b/drivers/watchdog/ep93xx_wdt.c
> @@ -19,6 +19,7 @@
>    */
>   
>   #include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/watchdog.h>
>   #include <linux/io.h>
> @@ -127,9 +128,16 @@ static int ep93xx_wdt_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct of_device_id ep93xx_wdt_of_ids[] = {
> +	{ .compatible = "cirrus,ep9301-wdt" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ep93xx_wdt_of_ids);
> +
>   static struct platform_driver ep93xx_wdt_driver = {
>   	.driver		= {
>   		.name	= "ep93xx-wdt",
> +		.of_match_table = ep93xx_wdt_of_ids,
>   	},
>   	.probe		= ep93xx_wdt_probe,
>   };
> 

