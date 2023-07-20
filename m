Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA2475C242
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:58:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B4A3EAD;
	Fri, 21 Jul 2023 10:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B4A3EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689929884;
	bh=wR+vwI/THd2q7Wymk89cujq1fjkS3EQwabN0t2/zVSg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YQmj1FXvGxpFMrRgHWDIO0uKxk1MUVPn4IJNtZ0Vk9B7Ybn2iHOQeVRFRWYrsqRYK
	 mUpNgXGG4bBct8MthXw4ikAyyG50UtyiMR+VrDyKO8w8O7vLLG7dDNkVM5UJxFUhTl
	 prlMiDloQAMcWkn3TxEQCwtuK+eaxzOIPJEqgAVM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3817F80606; Fri, 21 Jul 2023 10:54:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E493F800D2;
	Fri, 21 Jul 2023 10:54:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 599FDF8047D; Thu, 20 Jul 2023 15:30:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3180F80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 15:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3180F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=E36Ey4hp
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b8baa836a5so5705595ad.1
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jul 2023 06:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689859821; x=1690464621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qIe8rMdwGK8O6waPW6ElMhYZtqXBgjIAped1KS+Lxj0=;
        b=E36Ey4hpLP1aGERgJzQAv5oQWbjP2dfI/yJ9QSqsCcAZUQqYH2EJuPmluxVpniz94+
         SqRDS4pEtomXHfRXODYYhAlZIxAatRHID9D88YI+tj+w3vKM5JieqRypSlSHOTbf2v95
         PUlca0W45r887uApCqi/zn/yh3GyTCCrBBW1XguZKYFarRPPHvkGdKJALW7+s9TgEir3
         pVPeDdLYxOZSMJ8v3iGIKvATJZHgcVErXIREn7/pOR3ivfvJWVHJWWTf1p+PnK9L0sBz
         4nG3H7SIhmhoYiEqtjnis5Ppnyac+F2VaQ2UY7v0ygr32czvJ80e2mlstFNoj9axpszx
         inAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859821; x=1690464621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIe8rMdwGK8O6waPW6ElMhYZtqXBgjIAped1KS+Lxj0=;
        b=al/N2yOKhXOiMh6C1AfqB7kPiVoYWYawnZgQkfxSz7EuzcUrOntIfFQvFXxfARv3oZ
         YY0Jm2wlw+cHI/B4ifwfW4hIbQKe7h/kLcNrYIGA23qob+TunhYXSTA7attQx9klbxz6
         2mpQyYqEmMLfTPe9rJbU1vCgYCrmmNRnkD4S4dS3Uml5Om7by8EC2a/io+exGPZuXZBu
         j/z0iJsoY0z3ck6kuwR2FcSozD8oSaZYTDCCL62mixKxVjRB09kXB+dkL9+097cuXXLm
         8Pu8LOyOrfeFeL3dEBIWPqnssV9gu57+DYl5qU1EBm1jYAT3al8XO0PCYaBKsrGhESvZ
         kI8w==
X-Gm-Message-State: ABy/qLYaRezYHCGr5T9I1eJMrLLOUIL+lDFyxB6ffuenunXLPt6Iw494
	BOrnp+9SxqHvoXLkMu6zLtE=
X-Google-Smtp-Source: 
 APBJJlFh1AyFX2+11T9yyn39CZ9ejJo7irpyerH5jDd4rJJqhGrNwsFMVrOCBzL5cXWCBiVM2usEnA==
X-Received: by 2002:a17:903:191:b0:1b8:9b5e:65c8 with SMTP id
 z17-20020a170903019100b001b89b5e65c8mr25796578plg.4.1689859821611;
        Thu, 20 Jul 2023 06:30:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 d12-20020a170902728c00b001b86deba2f9sm1302975pll.284.2023.07.20.06.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 06:30:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1d8cf4f5-3004-3af1-2735-03fde48d69c7@roeck-us.net>
Date: Thu, 20 Jul 2023 06:30:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 32/42] wdt: ts72xx: add DT support for ts72xx
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
 <20230605-ep93xx-v3-32-3d63a5f1103e@maquefel.me>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230605-ep93xx-v3-32-3d63a5f1103e@maquefel.me>
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
Message-ID-Hash: ES46IJ7CYLNYZ6VXMAI6NZHPHLVN73YE
X-Message-ID-Hash: ES46IJ7CYLNYZ6VXMAI6NZHPHLVN73YE
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:54:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ES46IJ7CYLNYZ6VXMAI6NZHPHLVN73YE/>
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
>   drivers/watchdog/ts72xx_wdt.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/watchdog/ts72xx_wdt.c b/drivers/watchdog/ts72xx_wdt.c
> index 3d57670befe1..ac709dc31a65 100644
> --- a/drivers/watchdog/ts72xx_wdt.c
> +++ b/drivers/watchdog/ts72xx_wdt.c
> @@ -12,6 +12,7 @@
>    */
>   
>   #include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/watchdog.h>
>   #include <linux/io.h>
> @@ -160,10 +161,17 @@ static int ts72xx_wdt_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct of_device_id ts72xx_wdt_of_ids[] = {
> +	{ .compatible = "technologic,ts7200-wdt" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ts72xx_wdt_of_ids);
> +
>   static struct platform_driver ts72xx_wdt_driver = {
>   	.probe		= ts72xx_wdt_probe,
>   	.driver		= {
>   		.name	= "ts72xx-wdt",
> +		.of_match_table = ts72xx_wdt_of_ids,
>   	},
>   };
>   
> 

