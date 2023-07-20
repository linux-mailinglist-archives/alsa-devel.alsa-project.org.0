Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D83975C233
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:56:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A735DE7B;
	Fri, 21 Jul 2023 10:55:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A735DE7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689929785;
	bh=BGYd0XzLOZIaect1B8DLqJQBB8NGVA7ArI9KPRHwCuA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O2cM6Rdou65ZO8GYI8LGTx4VcK9rBE/eX6IVPVCz5A1s0wLGIQnwlwU4ZI2bWbAJl
	 RQxWRB12yeducppaRoCVIMlDvLimYi74EYmXVS4r3tN4rtyNs/1YGSGwYFhg5360Aq
	 XSZT5dZMTy4Yynrd4TBzaEu0ipPI2oPKHyKjNQfU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8D47F805D6; Fri, 21 Jul 2023 10:53:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E96DBF805CB;
	Fri, 21 Jul 2023 10:53:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4F85F8047D; Thu, 20 Jul 2023 10:54:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0CD4F800D2
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0CD4F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=R6F9Avgn
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-521dbe5e09bso442614a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jul 2023 01:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689843261; x=1692435261;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BGYd0XzLOZIaect1B8DLqJQBB8NGVA7ArI9KPRHwCuA=;
        b=R6F9AvgnvdC0oDU+DTR4MfnnL48BCbJgyhCk9A0VhVWOhqOQpe41/AATzBaPwXrlbp
         NiVoQ4an/IEe/zBQWtSt4j+0ECY7RSMDaQhEu0LpfpScWHmLaf5l2o7v0GzABUvd19s5
         w3jdfWKKI2Z7TETv8eOzBN9Q/hcD451Hvdx3NnYuVWduVN2kzLJ7Mi+gd7kIEYAdNLGx
         PfpKo5/5UeGO/gSzn2N0keUNKeCsk90RxfmW4xQ3nGSsJBlNdtDiyYfRTsLxuM+guq5h
         JAEcEamXP44sXSMwQx4SSiQZUZV6ASyXLRxNQClqiEF/jwHGMVw/ZkwvX6yxmHqpohoE
         Ggkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689843261; x=1692435261;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGYd0XzLOZIaect1B8DLqJQBB8NGVA7ArI9KPRHwCuA=;
        b=h7kzkerOANEDz6FQpEO3Hrujj5a9gNN/LmSnc6l/tPzd3G7nZc42XG51m2bdcUfzzT
         T7AEO5O9sVkHpqX488GwAQLeaGBDPn1iXSqtOmjJpgu5LHNu4nyT6sCS19935WGh7nVw
         4VloMCcy5ocmk3s0YvNggfcf/q+fyUfxJPJOqHkrA0JjNB1ZFoLaeLy/1gFF85UjjdH2
         8N6wKQHEG1GFTnq6AHkmnXya4HXI/riEISso5LIoCLwr1H0YobKa+qzW43/xzLZtPHOv
         Ufo5tOBi+gpx0//WBRYHrw8U7YzCRRGfa8Gi+L2utwXF+7glm4ha4tl+547K7PbxSp4U
         izeg==
X-Gm-Message-State: ABy/qLbB7MVb1QpuZ2lASMDrYcuWed2QPQBEoSpfFjvH0Pkjz58FOdDf
	gm93MkdZyfxpuwBEqq0OA/4=
X-Google-Smtp-Source: 
 APBJJlFMasg2dNIicMwfx1YyIyQvduddQCgLot96389m6Z9iDA5SQh0KK8JlI0qHyY43u+aGtpP/9g==
X-Received: by 2002:aa7:c504:0:b0:51e:10d8:e066 with SMTP id
 o4-20020aa7c504000000b0051e10d8e066mr1651697edq.24.1689843260572;
        Thu, 20 Jul 2023 01:54:20 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id
 f20-20020a50ee94000000b00521ce1f04b8sm443021edr.12.2023.07.20.01.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 01:54:20 -0700 (PDT)
Message-ID: <e4486050b95ad53ba9e1d6080c4b6de4b646dcdd.camel@gmail.com>
Subject: Re: [PATCH v3 13/42] watchdog: ep93xx: add DT support for Cirrus
 EP93xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: nikita.shubin@maquefel.me, Hartley Sweeten
 <hsweeten@visionengravers.com>,  Lennert Buytenhek <kernel@wantstofly.org>,
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>,  Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Sebastian
 Reichel <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Mark
 Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, Sergey
 Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Liam Girdwood <lgirdwood@gmail.com>,  Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Andy Shevchenko
 <andy@kernel.org>,  Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen
 <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org,  linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org,  alsa-devel@alsa-project.org
Date: Thu, 20 Jul 2023 10:54:18 +0200
In-Reply-To: <20230605-ep93xx-v3-13-3d63a5f1103e@maquefel.me>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	 <20230605-ep93xx-v3-13-3d63a5f1103e@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-MailFrom: alexander.sverdlin@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 6LOTTARM6LH4ATRPEK4BMFGN6WN37STT
X-Message-ID-Hash: 6LOTTARM6LH4ATRPEK4BMFGN6WN37STT
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:53:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LOTTARM6LH4ATRPEK4BMFGN6WN37STT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Nikita,

On Thu, 2023-07-20 at 14:29 +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
>=20
> Add OF ID match table.
>=20
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

--=20
Alexander Sverdlin.

