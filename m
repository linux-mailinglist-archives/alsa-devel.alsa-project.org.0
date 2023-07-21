Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7391775DD9A
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jul 2023 19:08:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E850AE9;
	Sat, 22 Jul 2023 19:07:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E850AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690045699;
	bh=FVT2HoyRcJheKX5827Ko98G9mvrkP89HUTQNi1rfEK0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u86p9aCBHnXzdPLG5Y3Pg82SfT6y4mBnJqVhC0vN9fAn26sT3Pki77TwjqfLSKAvu
	 /84MgNnd9dpyw/uIMb5Tz9TVHk+qzFbnAGP2qO19srk3IuNqrG90mUky6nWuLLJUWO
	 C8mNxy8SbLmK1YCP93d2nGlzfhBNZ57A7GbEBJKA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23F0AF805BD; Sat, 22 Jul 2023 19:05:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A60F805B3;
	Sat, 22 Jul 2023 19:05:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 614F7F8047D; Fri, 21 Jul 2023 16:08:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD698F8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 16:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD698F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mKpa85Mj
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so3277629e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Jul 2023 07:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689948523; x=1690553323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdCDvX2ENQQi+dpK3c6L7rSwh7ZxpQvyjeSTayf+l4A=;
        b=mKpa85MjZm0wM2/mDCVf9XYQEXqHnC0zrrCUULJJt2k97Ivcladhym49AqIJy7+Cl6
         M68rFARHi81TAQJXWEUS1FYzNXin0hZbhFEFSIzyz0akk/YVbt8GKI7i1JU6Wbhd2lqU
         QOxvFaJcPysmvURITXByzqQERED004zQDaoA/oKyBTElV1S52Qd2ZHxnkLx+wr7VyRv3
         Aw8GSkEJP3SExUtN/YZgkoBVcRyf5/bJ61snewbba4LU6Pe0oAAHNa6hFgRSvTV30hyz
         TujMWvjygIWFj2lESeXLXp5/tCCPHd4jXPTfUK933o8JRD3N8BQjMsDSwwNVnhYuu5Vs
         LxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689948523; x=1690553323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdCDvX2ENQQi+dpK3c6L7rSwh7ZxpQvyjeSTayf+l4A=;
        b=Bj9lTIW+dcJvOgoawvgtkz7/B0TEUfHqOFiec1COG1XVnfLggyu37FaATOezt+Otcz
         qnJXz0rZvsUsmN/vqdig8L+xy3kkyNWDSyA6A3O06Xv53Xd5fPU2QxyVX9C/Q3XsfEfY
         f/06OBTtDg68REd/eHP8GcnWkVy/naaIACnSFvLUAPytZiPHBoTfb94Dn7qdMKnCDYB6
         VozhVg1Q43jyiWp2OS3ZrtzoZNoYhdN8d48nUBv9zNw83QLXCB30snNeMmJFVU6OsuF/
         X2uwU1vWN9+0REBaNvlf4LV6/DGyzzRxDdPyJNsO7tJCwrq+cc1Yb3dO3wiy1wgjZBSx
         teaw==
X-Gm-Message-State: ABy/qLbOzyHR5vTQU5kJ+naMjDPh7LPECniPFFeEYR8DJfA2QPzuQ2Dk
	xL0YPJFA6CihBFh5TElWQ0D1hA==
X-Google-Smtp-Source: 
 APBJJlGitP6YdoZI8bIFpNGAsIBqr0u+J3Lfy5UXxN6m18CjoA/M+91KX09TKjqALw4XfrZGY2rXuA==
X-Received: by 2002:a05:6512:3054:b0:4fb:b11:c99e with SMTP id
 b20-20020a056512305400b004fb0b11c99emr1401012lfb.56.1689948522863;
        Fri, 21 Jul 2023 07:08:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 r1-20020adfce81000000b0031128382ed0sm4321269wrn.83.2023.07.21.07.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 07:08:41 -0700 (PDT)
Message-ID: <22521abf-db55-aec6-fb96-fdb585ef6132@linaro.org>
Date: Fri, 21 Jul 2023 16:08:36 +0200
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
 <20230605-ep93xx-v3-12-3d63a5f1103e@maquefel.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605-ep93xx-v3-12-3d63a5f1103e@maquefel.me>
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
Message-ID-Hash: 76QFQA3GOO4A5VMU5XCUSEWMAZC3EBYV
X-Message-ID-Hash: 76QFQA3GOO4A5VMU5XCUSEWMAZC3EBYV
X-Mailman-Approved-At: Sat, 22 Jul 2023 17:03:51 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76QFQA3GOO4A5VMU5XCUSEWMAZC3EBYV/>
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

Every patch:

Please do not use "This commit/patch", but imperative mood. See longer
explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95


Best regards,
Krzysztof

