Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 668E57E9B6D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:52:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A3E1829;
	Mon, 13 Nov 2023 12:51:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A3E1829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876354;
	bh=Os4KBIFKBrhxCNe2iV6sYOSUCifSAC9wTubOo6x2YGA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MJu5E8cnYt5NeDnxy4qk6bieGqWA6rnSRZe42yEN+wV6svW5TVGwt/N7M+DSJ5hIH
	 xDAyA3FOhSy7iViBGougKRBtaonjC58GIwnbCKCza7ahGrAICUpL4pz5cJu3k10vBq
	 9Hvw7xYCFv5TptWK1DbQfmJaiKyIWPULwyTpYrn8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16A62F80551; Mon, 13 Nov 2023 12:51:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CCFBF8016E;
	Mon, 13 Nov 2023 12:51:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EAD0F80169; Sat, 11 Nov 2023 19:18:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FE23F80125
	for <alsa-devel@alsa-project.org>; Sat, 11 Nov 2023 19:18:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FE23F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LDdvFff8
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507a29c7eefso4161548e87.1
        for <alsa-devel@alsa-project.org>;
 Sat, 11 Nov 2023 10:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699726712; x=1700331512;
 darn=alsa-project.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Os4KBIFKBrhxCNe2iV6sYOSUCifSAC9wTubOo6x2YGA=;
        b=LDdvFff8BvCCgnZj8Y+MH0xDRm6xSSNpgVbmwAEwv3CFEkjZM+ZvLN98ufwY1BXadh
         bBvnAlPQvjliXTde7TzPKG682dWZMnpIkMof0V2uyvBeyYupVE66EnqKJyB/WjERqaix
         65kei+Uk04BO0Q9BsxX8+1VaOKylBuXYdwGtL4VCCnwpEZ3RTtD83UgWlaNdfuXg6KPF
         sR79/Ro5fsDrovb4agzBlSnOfw4NCkBGxbpr4ezk8mMss9Yf+fbRAwbie68Q9X6s4Klr
         AGM9AWLNDcCXM/K51XnPeJBCwJiESDA0zKdgWmZSKP0RwNGvlp7shkDAmNecpni1PCm4
         cMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699726712; x=1700331512;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Os4KBIFKBrhxCNe2iV6sYOSUCifSAC9wTubOo6x2YGA=;
        b=ccth6kFTne6SbpUCu6aELpFYg6cM/J0furs9BQUJVdkL9R+R4oPVzGJ2XqAuxGtJCE
         G4t+PgjCStNGgDXJ9fw6JU0+fNnigqyNvYH0ImBxqhM96I+puQt041IJtaWZU0RiPiA8
         MfLAQ3qevdaXetjLR8kqtMGKxuS23PJ4+ft/dtFC96YstEmnRkrkEiaFN6AFGzzQWyK1
         PuWXOPBtQhNNx7mmlIpXaymTaTnyG9IYZPQGt87OfiJYH+SMQhEuvYNCck6gsKrpkrZL
         dwgjfRVEc/ZrrXGwiRrOdBNZt4BzlbquUjsdeN20v8Aq22dksjE7T2afqrNdWhTJw8V4
         zvoQ==
X-Gm-Message-State: AOJu0YzIxCDCG3d6nKhJ5omfgXOcXT/s2WNc9sYXmWRiN5JHyAmxOhsx
	lOiX+rmHmYQCmbevsdE12Xk=
X-Google-Smtp-Source: 
 AGHT+IGWSLvEEWKMjKSkylq9sGZ0KV/8c86kVFIgYc1m0RkjmWY37s2qpjH05vtA3bG5UrjESvvwcA==
X-Received: by 2002:a05:6512:2399:b0:500:be57:ce53 with SMTP id
 c25-20020a056512239900b00500be57ce53mr2275395lfv.42.1699726711568;
        Sat, 11 Nov 2023 10:18:31 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id
 n20-20020a170906b31400b009e656ce2930sm1403421ejz.60.2023.11.11.10.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 10:18:30 -0800 (PST)
Message-ID: <80ed91bb971516638fa1793d648939815eba7630.camel@gmail.com>
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
Date: Sat, 11 Nov 2023 19:18:28 +0100
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
Message-ID-Hash: CKSEEVBTIPUGUEAEYCX3HERKNYR2RAKF
X-Message-ID-Hash: CKSEEVBTIPUGUEAEYCX3HERKNYR2RAKF
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:51:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CKSEEVBTIPUGUEAEYCX3HERKNYR2RAKF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

On Fri, 2023-07-21 at 19:37 +0300, Andy Shevchenko wrote:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Issue the reboot */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ep93xx_devcfg_set_clear(priv=
->map, EP93XX_SYSCON_DEVCFG_SWRST, 0x00);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ep93xx_devcfg_set_clear(priv=
->map, 0x00, EP93XX_SYSCON_DEVCFG_SWRST);
>=20
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mdelay(1000);
>=20
> Atomic?! Such a huge delay must be explained, esp. why it's atomic.

atomic or not, SoC is supposed to reset itself here.
However there is an errata [1] and the SoC can lockup instead.
So even pr_emerg() makes sense to me.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_emerg("Unable to restart =
system\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NOTIFY_DONE;

[1] http://web.archive.org/web/20161130230727/http://www.cirrus.com/en/pubs=
/appNote/AN258REV2.pdf

--=20
Alexander Sverdlin.

