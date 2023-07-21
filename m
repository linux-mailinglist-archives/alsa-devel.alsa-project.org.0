Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F2675DD9B
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jul 2023 19:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19932A4D;
	Sat, 22 Jul 2023 19:07:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19932A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690045717;
	bh=ZQiDX3Wi8Q++o7qsMThd/MdyM9xA08d3sSNWQjsCP+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vZKP4MIAgZSnYrLKNVpkbSbtOmUDBi1sAOFmWmfdKSieOeMR1ajlTq+44w012Fc8Q
	 VdPddxJGHo2Jc02Wr3DT74G31fwO5JydgjTceNPVzYTRvpElDKh6gD6ytn7GC43LF1
	 7dhjOFTFaLge7QTx6C8xBoeYuJGh75S/GtFfQvG4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86814F805C6; Sat, 22 Jul 2023 19:05:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A176F805C0;
	Sat, 22 Jul 2023 19:05:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8CE4F8047D; Fri, 21 Jul 2023 16:10:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37FCFF8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 16:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37FCFF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=t5k3pZho
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso1679987f8f.3
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Jul 2023 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689948611; x=1690553411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D5JLK7sX6TvMY9QYtE4PR7dOD/ZFiOCarXTzuRrPI5c=;
        b=t5k3pZhoG+AYBoSzaTLpzlAUsBlHUl7lB78CDzsmHwjdVVGmyTqDM89ObvufvjSo7f
         hpww35uNlXvCiXjR8Z3Kcy+N16aszSPxdmSW5dXU//lN8o77O3wzYas7eBkvmDyuTUT7
         sy82OO7WlVgpwfI60hPRR6eC7iKohOsXJIAPgLYw0aB9/CoM3vvTnVBOsIhDGWbjAxE4
         jhkNh/RncJk8+BPjG2UwVOec3N1akRHOj8/cli14A3cccbFg1vqKASTYTytAzKfrss4t
         3mJgMR1n+1HqY3oqR8HhDhElYOwuyc2qwRsyyrmAmT2CnaWXqaPG173zYgCNrCSCs7I4
         H4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689948611; x=1690553411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D5JLK7sX6TvMY9QYtE4PR7dOD/ZFiOCarXTzuRrPI5c=;
        b=lTQQ5oCzgVweFOBTWG0g0yGREJiSGPIAfylyMF2rIp1Q4ogvA1MijhXtA2/MdhEDH8
         yMMTHp0McbHIwkJSCVYFiZyIspNOj1fQj1k9T0MXDiBqD0C0Q4mxKxOlKa1/cJQDJsfh
         ice9lf4PvW/62UyNSKqYKnZG/Xp8h93Ts1MApYEvD00YfbcisC3S4dP3XKq30G6aF8/z
         eGGzlEFeckS2Zg6Mn/kWmS6GFrl0U5/bBLaQ5BZFwVRNId/oEdtawdt6QQATD6WRMn3P
         uSN7RfHAmVWkqeJQLH19QyWEIJjzCCbtDFJ/0vXHidm0qCyI2d2jtoGjohN8+7IQRZ2k
         yCnQ==
X-Gm-Message-State: ABy/qLaJde1OEAgyqyT75qVmID1XsSjFpHETsM89ECVHKDCFNatR50A2
	4qIlt3DT7rwqTDKEE6uX1OdI/A==
X-Google-Smtp-Source: 
 APBJJlFb081tRb9TVYsQzjk8z6FX0fbV9IvQdPA+a6dM+X5vTsqrlNWUMOAY9EDzlSX92P91b/1I9w==
X-Received: by 2002:a5d:5145:0:b0:314:14ea:e2de with SMTP id
 u5-20020a5d5145000000b0031414eae2demr1529517wrt.0.1689948611406;
        Fri, 21 Jul 2023 07:10:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 x10-20020adff0ca000000b00314367cf43asm4284464wro.106.2023.07.21.07.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 07:10:10 -0700 (PDT)
Message-ID: <d8df7f07-ea8d-d382-d3ef-c1f1fb6ccbc8@linaro.org>
Date: Fri, 21 Jul 2023 16:10:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
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
Message-ID-Hash: 5JWX4IYHOLWB76TLVMR4ZG274COUIGH4
X-Message-ID-Hash: 5JWX4IYHOLWB76TLVMR4ZG274COUIGH4
X-Mailman-Approved-At: Sat, 22 Jul 2023 17:03:51 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JWX4IYHOLWB76TLVMR4ZG274COUIGH4/>
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

This shouldn't really be part of this patchset. It's not part of your SoC.

Best regards,
Krzysztof

