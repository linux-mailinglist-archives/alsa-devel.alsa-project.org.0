Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBD47E9B86
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:56:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5ACBDEB;
	Mon, 13 Nov 2023 12:55:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5ACBDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876607;
	bh=eGIVjSPir/sGVZs6XhhCSofiEOO6iVpoTkDwmiyHHMU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c3sDGYRQ7FeTNLZYsCkiQOi3A03LImyNFEOzmZBX8xinnSbLeJa9/LgzouIkXc91I
	 bsB+sDzj0rXG14JWzKZny5vpr4NQ9pIU7bwKmsobVrVSEsRhwD9MS3WMjGIMO3UwBM
	 72+gEuZGM505dKHyhTC2U4DtJQF7TNHyTteLVp04=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1ED1F8059F; Mon, 13 Nov 2023 12:54:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37661F8059F;
	Mon, 13 Nov 2023 12:54:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 146F3F801D5; Mon, 13 Nov 2023 11:07:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 600BBF800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 11:07:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 600BBF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=J+N+nGUo
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54394328f65so6508903a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Nov 2023 02:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699870023; x=1700474823;
 darn=alsa-project.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a1UVNwz3drUtlCcbwnzq+CFMoiQbpRGCy5kRE6bKE8o=;
        b=J+N+nGUoI4rZ1PvqfUTpbMvevJR/amLh7Uveg/BW7IJuZ5fgAdOTL4rjp8+v079HR0
         4brAxiIeSuFU8PO8PfloJx4cvSVAkRgTi0MSo8ukBxwUzPsJmlXDpAbo+Vs6tjUrHq/N
         fhLiouY3xZBiVaQp5g4dy8eHSFhKPPk3GZo6OWWBk9IYPsjtBzt3xJG4bgNJEAxpUsW6
         phEwYcSRk/xCCXwW2WvEDqPQ82bP0pBTGSRPBzEuBQixoADxJo6W6tXma5k5FYSDk2tg
         3VKPGn9ZxJoZ0mI1lZCvLyOD6wXQDVZlJBbBRlIFCJVLiVPOWfNyP6i5socoAQsG8i5A
         mOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699870023; x=1700474823;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a1UVNwz3drUtlCcbwnzq+CFMoiQbpRGCy5kRE6bKE8o=;
        b=iLEipjKB/QJifqjKV/ULR+Y7bNWll+brFnqPhoMn1M4IBbu/5uS/hVPGeRuXUyl/pW
         1epeFgiO4DVKkBqEY6Q49/ABDBIVZnzKlxBeCGJtZNlfnn++b9oGOvfeUwImdsUpJ3SH
         y/nIUwwvwh/Kv8Ki/KhEJFFO3JlQoLndSHexG3/GSS76ogStCdiio4cVT1R6sWwXDa40
         OvxpJ5hnTU13q+oaLHn37ujRVND3MfEWhXkLmdEVA52SPBqsWqg3B+nd9AtCoxbyzm5E
         P3YuyORpLrVNhYX8xBEmViZ0iN4lddfSOrHxQ2pEKNG8b4b8io7OHNJvUJnwNHa+IO9E
         hgLg==
X-Gm-Message-State: AOJu0YwLk1N8bGqNmbUMjj2gD3QSX5DsdaXTRXpULHOtPN+lQtFzn+GE
	chF8ogBPiVmXqjJatH2ewW4=
X-Google-Smtp-Source: 
 AGHT+IGyrROtTFxyW749aHe9+Qh+zqYm6ESaHF42cs0Vlkcr6OoBfx4smMeCzi+Q7xnXlEg7ryaVeQ==
X-Received: by 2002:a17:906:7ad5:b0:9dd:64ca:dc69 with SMTP id
 k21-20020a1709067ad500b009dd64cadc69mr3930534ejo.1.1699870023492;
        Mon, 13 Nov 2023 02:07:03 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id
 ga23-20020a170906b85700b009ae587ce128sm3761920ejb.216.2023.11.13.02.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 02:07:03 -0800 (PST)
Message-ID: <fcfdc6f05926db494ea0105e5523cc21ecfdf4e7.camel@gmail.com>
Subject: Re: [PATCH v3 14/42] power: reset: Add a driver for the ep93xx reset
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
Date: Mon, 13 Nov 2023 11:07:01 +0100
In-Reply-To: <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me>
	 <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
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
Message-ID-Hash: 6MAXRHVC47K5RTHJDKIGIS6IBAAHA3DG
X-Message-ID-Hash: 6MAXRHVC47K5RTHJDKIGIS6IBAAHA3DG
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:54:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MAXRHVC47K5RTHJDKIGIS6IBAAHA3DG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy!

On Fri, 2023-07-21 at 19:37 +0300, Andy Shevchenko wrote:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Issue the reboot */
            ^^^^^^^^^^^^^^^^^^^^^^
This is the relevant comment, one can extend it, but looks already quite
informative considering EP93XX_SYSCON_DEVCFG_SWRST register name.

But Nikita would be able to include more verbose comment if
you'd have a suggestion.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ep93xx_devcfg_set_clear(priv=
->map, EP93XX_SYSCON_DEVCFG_SWRST, 0x00);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ep93xx_devcfg_set_clear(priv=
->map, 0x00, EP93XX_SYSCON_DEVCFG_SWRST);
>=20
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mdelay(1000);
>=20
> Atomic?! Such a huge delay must be explained, esp. why it's atomic.

--=20
Alexander Sverdlin.

