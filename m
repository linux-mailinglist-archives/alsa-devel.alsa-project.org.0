Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B5F7E9B85
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:56:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 740377F4;
	Mon, 13 Nov 2023 12:55:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 740377F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876593;
	bh=wYZtbNfscHtuB7ayNjS/FaQpaEtL1M0UhXyvKDUhQKc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lovv9qgYLJFvXISOZsm42hYt6QHacilcGz4VgDILtMn0HaCxl9FYzOcV6SjeXZ/3K
	 Z3dCU3HJLtYUaj8FOIRDj27uJvL38Nd8Td4FGwWGoHD6ZPCK6iHACwb6+llifXcOE8
	 OFRK8SEKiV2Eby/WsKN48Trgm/LmHkBQpW3eXmBA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4049DF8057C; Mon, 13 Nov 2023 12:54:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48F41F8056F;
	Mon, 13 Nov 2023 12:54:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C163CF801D5; Mon, 13 Nov 2023 11:04:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E840F800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 11:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E840F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PFD1z6eN
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c6b5841f61so47030861fa.0
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Nov 2023 02:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699869885; x=1700474685;
 darn=alsa-project.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wYZtbNfscHtuB7ayNjS/FaQpaEtL1M0UhXyvKDUhQKc=;
        b=PFD1z6eNb1pE7EG+vVB/92dtaIY+zwRHFydyRzRlevA6EXEHwJ3mOmXVa7i/qobcbu
         dMaCv/nWrOBJlVuHRcnbyKwgsCiBEgHzViwwP59NLjU8QoV3EQK0zlXIg0JgAJ4FdYTd
         yU/NnLz0U7UhHJl1tFOx6nz0IgFTPs4RNrHZha0gQUTMRQxGXzsWX9DbHAkA6J7eBchd
         iKI/AudGFm25rPehTU8CGFD4/+l7TxkXwLnQWbQ5BF5pFQJpS/lfSj6oZ7Vu4lfpy1kG
         UxLMrscExDog+xUzFr6trkKI/+5RPlEQ77V6GH/0mxJk6vC7QK6JyFHSJSdrclKzJMVJ
         luTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699869885; x=1700474685;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wYZtbNfscHtuB7ayNjS/FaQpaEtL1M0UhXyvKDUhQKc=;
        b=L1EMwJ7EW3VPqesNn4FJJB5XAhWiKygcGXelInQ8x93QnFttJM+kkbgpW36sfav78Y
         Fk9IgkGaHjme/RzWWEtbK87mtl+tk42jFkREpSWAfV4DkP49oiS6sXqEa8LGz9njQyNg
         c1WXeGO8PBznfZRe00tKZF8vd5/elDGtyWjvDBY13RLfwbM2hhdE6vyjJlfKdG9P6REM
         30Fzlw4RqUpjk7VJT0WixEEhecWHSKetluY3yb4HzC6aGhn9s7zWua7bvyEei7yrDNQJ
         /S4TBc5ZHXKeo9cbuL9CNIifREZUdt77SRSkVv8yM9ku0BGd3LlRXIjD+K5JWT4/V3LG
         VjBg==
X-Gm-Message-State: AOJu0YwQs6d0L7+OVo2sf4u0A6jXEy2UfdZMqpytMz7SwHWhZoiCvA3r
	aGYf48FRDoQ0UGcDyZpcJEtlR9VwG6zvHg==
X-Google-Smtp-Source: 
 AGHT+IFY0VBv65sXA0Ec0khQRe36/4QIzik1qErLOvxwk7VCfLMt8d6A4Y8Yy/Esbvbw7QCTYBejoA==
X-Received: by 2002:a05:6402:520b:b0:543:5144:1779 with SMTP id
 s11-20020a056402520b00b0054351441779mr8907514edd.11.1699869864130;
        Mon, 13 Nov 2023 02:04:24 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id
 a67-20020a509ec9000000b0053e43492ef1sm3514675edf.65.2023.11.13.02.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 02:04:23 -0800 (PST)
Message-ID: <0cf1d748cb4a672483991f44d638a271218effe6.camel@gmail.com>
Subject: Re: [PATCH v3 14/42] power: reset: Add a driver for the ep93xx reset
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, nikita.shubin@maquefel.me, Hartley
 Sweeten <hsweeten@visionengravers.com>, Lennert Buytenhek
 <kernel@wantstofly.org>, Russell King <linux@armlinux.org.uk>, Lukasz
 Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>,
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
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michael Peters
 <mpeters@embeddedts.com>, Kris Bahnsen <kris@embeddedts.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org,  linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org,  alsa-devel@alsa-project.org
Date: Mon, 13 Nov 2023 11:04:21 +0100
In-Reply-To: 
 <CAHp75VeYHscM-r94kTrpH44W=OGVq+qoNNQZoVrR5_n-_K_Xsw@mail.gmail.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me>
	 <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
	 <80ed91bb971516638fa1793d648939815eba7630.camel@gmail.com>
	 <CAHp75VeYHscM-r94kTrpH44W=OGVq+qoNNQZoVrR5_n-_K_Xsw@mail.gmail.com>
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
Message-ID-Hash: DEHE3OIR5IVGMHHDGZBVA62F2RBOSNBU
X-Message-ID-Hash: DEHE3OIR5IVGMHHDGZBVA62F2RBOSNBU
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:54:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DEHE3OIR5IVGMHHDGZBVA62F2RBOSNBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy!

On Mon, 2023-11-13 at 11:59 +0200, Andy Shevchenko wrote:
> On Sat, Nov 11, 2023 at 8:18=E2=80=AFPM Alexander Sverdlin
> <alexander.sverdlin@gmail.com> wrote:
> > On Fri, 2023-07-21 at 19:37 +0300, Andy Shevchenko wrote:
>=20
> ...

[1]

>=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mdelay(1000);
> > >=20
> > > Atomic?! Such a huge delay must be explained, esp. why it's atomic.
> >=20
> > atomic or not, SoC is supposed to reset itself here.
> > However there is an errata [1] and the SoC can lockup instead.
>=20
> Good, and what I'm saying is that this piece of code must have a
> comment explaining this.

And it has, but for some reason you've trimmed it in your reply...

--=20
Alexander Sverdlin.

