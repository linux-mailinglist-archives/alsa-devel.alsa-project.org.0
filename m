Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C047E9B74
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:53:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5510886F;
	Mon, 13 Nov 2023 12:52:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5510886F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876386;
	bh=BjJpwKGCecxdkQ5LjdaCff64J4ZeBO10oL7F7MwcVn4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xky2blAQuVA2zBG315pZF+kAAAzkJFmYuxaAJ/5xZ2KHNXaLVoRSZzO9k05YaWpBf
	 tFtiwTl2N8hCgrxS2oeukVF0I0DT4t2eSB+Q8iH0fT5yilv6i1pCkg1jtWsVw6uM7a
	 iYl+CMYKrcSiIDS3tqrKMdPUbVlu9qwaT1OL8Rds=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40DC0F80579; Mon, 13 Nov 2023 12:51:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0B0FF80571;
	Mon, 13 Nov 2023 12:51:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7187BF80169; Sat, 11 Nov 2023 22:33:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F5C6F800ED
	for <alsa-devel@alsa-project.org>; Sat, 11 Nov 2023 22:33:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F5C6F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OHBB5G6+
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-408382da7f0so25426535e9.0
        for <alsa-devel@alsa-project.org>;
 Sat, 11 Nov 2023 13:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699738422; x=1700343222;
 darn=alsa-project.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BjJpwKGCecxdkQ5LjdaCff64J4ZeBO10oL7F7MwcVn4=;
        b=OHBB5G6+A29NbkjXFExZ1QeSsguD/s2ZcLipy3+/BRwF2ubWRiH5higDxohIWTcS1q
         WvAWRwa99qaqlzMSJEOSvp+5C2orKlq+gwBXLXx/m1//wu7whmMu/b1n2hkq60OeChQ7
         IGYiAUTCsuAT0+EhKg1fs+60fZhlOUmHGlkrLtTejkgZdeaQ6glEaN/iGMkwPtd4nZze
         OfCb1ZMke40yyhvYZrnLkrbidXLeLO0Ijr12i/g96VxEDrOy5w5h4AiKukC/ZgUU3wwI
         SBF6qYJy5ZtFtLxJL2fyx5gKReo4BI4k/Lrp8NtIgq87UopdylKb+RjFaLN8BHsX7eoE
         ORmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699738422; x=1700343222;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjJpwKGCecxdkQ5LjdaCff64J4ZeBO10oL7F7MwcVn4=;
        b=VN9iGv9FzW9ehzOBiqDg+IKzFEOG9w/qYXblX4VLtUd58EsYemYdKXUqvqfxBB6KOA
         CS9s6aF0k7WYoRrVecf0LmQPKqA8+nXL5Jy8hrH9w9rrpO7nRBMzET9QMvAXicSpJkoQ
         2Q/YaLbgdyoDt2sNodoTfuJnTSlYeWKkazRBDQcRKkCKS+6sq9YeMwQrzf3+Kipdhg4w
         gR9Z1nbS/bYk8DENwAToAiQB+roYgSlmS+izKOEmw1jDctZzSWkwm6bNtzS+49fd+nTx
         eaw4ZaGka+y55dI+TQ62HaUAwFHLM9OzVs6v92/qE+z9CfDnkQ745nUUORqGlW64H90c
         0ySg==
X-Gm-Message-State: AOJu0Yyp5ok/T5vcHhnvmh2CxRvJXzyj8VLKBKEIxXEMl1mbA/LZ72N/
	hWplX6eue/Ry/6r2xC7LmAM=
X-Google-Smtp-Source: 
 AGHT+IGcspAIBmQE8uECroiT5zYPxAfvcuIKjKOjZDZOhwNchFn+oYO8zOgLHmFyk1hPD+Lg8347oA==
X-Received: by 2002:a05:600c:5121:b0:408:57bb:ef96 with SMTP id
 o33-20020a05600c512100b0040857bbef96mr2147252wms.30.1699738422278;
        Sat, 11 Nov 2023 13:33:42 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id
 be14-20020a05600c1e8e00b00401b242e2e6sm8935242wmb.47.2023.11.11.13.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 13:33:41 -0800 (PST)
Message-ID: <c49f77492cacc5a30079720af58a9f2fca761609.camel@gmail.com>
Subject: Re: [PATCH v3 07/42] soc: Add SoC driver for Cirrus ep93xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>, Lennert Buytenhek
 <kernel@wantstofly.org>, Russell King <linux@armlinux.org.uk>, Lukasz
 Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>,  Thomas Gleixner <tglx@linutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
  Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Uwe
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
Date: Sat, 11 Nov 2023 22:33:38 +0100
In-Reply-To: <ZLqSo6B5cJXVRJS/@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	 <20230605-ep93xx-v3-7-3d63a5f1103e@maquefel.me>
	 <ZLqSo6B5cJXVRJS/@smile.fi.intel.com>
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
Message-ID-Hash: O3VBG6ZG64IIGTUKDLMBFJDOIR3BFAHE
X-Message-ID-Hash: O3VBG6ZG64IIGTUKDLMBFJDOIR3BFAHE
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:51:20 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3VBG6ZG64IIGTUKDLMBFJDOIR3BFAHE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Andy,

On Fri, 2023-07-21 at 17:13 +0300, Andy Shevchenko wrote:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_lock_irqsave(&ep93xx_sw=
lock, flags);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_read(map, EP93XX_SYSC=
ON_DEVCFG, &val);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val &=3D ~clear_bits;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0val |=3D set_bits;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_write(map, EP93XX_SYS=
CON_SWLOCK, EP93XX_SWLOCK_MAGICK);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_write(map, EP93XX_SYS=
CON_DEVCFG, val);
>=20
> Is this sequence a must?
> I.o.w. can you first supply magic and then update devcfg?
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_unlock_irqrestore(&ep93=
xx_swlock, flags);
>=20
> ...
>=20
> > +void ep93xx_swlocked_update_bits(struct regmap *map, unsigned int reg,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int mask, unsigned int =
val)
> > +{
>=20
> Same Q as above.

EP93xx User Manual [1] has most verbose description of SWLock for ADC
block:
"Writing 0xAA to this register will unlock all locked registers until the
next block access. The ARM lock instruction prefix should be used for the
two consequtive write cycles when writing to locked chip registers."

One may conclude that RmW (two accesses to the particular block) sequence
is not appropriate.

[1]=C2=A0https://cdn.embeddedts.com/resource-attachments/ts-7000_ep9301-ug.=
pdf=20

--=20
Alexander Sverdlin.

