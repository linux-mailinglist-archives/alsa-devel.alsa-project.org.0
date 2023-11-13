Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC877E9BAA
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:59:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26B79E74;
	Mon, 13 Nov 2023 12:58:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26B79E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876749;
	bh=I/GNNmnd9KPAt/3KR9nGlyj4w6Z5obO7WVLloEcZzkc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VRVoMXhgZq7AOsO0/iEIn2qa3r/jhwg6xHVeh1lN0r/irCXst6LlhiBnLOgvrHVDa
	 DaL9uneYPF5GToVdxUAceitViO1g+r0m9k5bQMBze2+VXx4hz1uO5VsUtC6XG/RS9j
	 6+Syn0zX4rROu/3AvKCoua+RA1ELEK236Kwn4kqQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8F02F80093; Mon, 13 Nov 2023 12:57:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B50D2F8058C;
	Mon, 13 Nov 2023 12:57:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DABF8F80249; Mon, 13 Nov 2023 11:23:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3BE4F80152
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 11:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3BE4F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cQvYjLgO
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5a7d9d357faso46936707b3.0
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Nov 2023 02:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699871012; x=1700475812;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISelrhUz+tUwTPOpVjAn5G1ABI4YmRZvCmOYJcKmy7Q=;
        b=cQvYjLgO1WurBXuITM0zishMFc8WPIOD8lz83ptI5WAM84+2yI3pG39xb2v2WXeP25
         ZO+/hkf93BBV5sqi2e1w07/CnmhpdzidcEGLRBkez5zqgQrHqe2dkqVTjWtOIZIREDYa
         AT0BXxGqo3ALB/Gqq/uhRZOGQR5Stn0WFj/50uHS6QXXvO1ihsR0XV8+dYwZEsFKnenO
         VMqJ92G3tkvaMczhxlOMGIuJeqi41nmxMFEbJk5fiy25+nI127zBNR1unX6SDevhbaIv
         GxE5F4ao8dke97cGlWFlHIudUB9YFw7BdLhUVAI78jQh8sS+eWWPHAxbkxDirzxKRsDk
         1D+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699871012; x=1700475812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISelrhUz+tUwTPOpVjAn5G1ABI4YmRZvCmOYJcKmy7Q=;
        b=nh7Bv7kBm/nDY/Y8zT1PaMCYkAW9QIVmzG4XX3VCUWj5hghNv3+iFqP90DVvSf/P81
         Kix/QdX2t7krxg4M+a+zG4TH/BwZQID1z2BhxUZMPabS8lKobtf2VwE7rskuEQ5xbtTm
         V9fNN91HKoAIzqZ4h1cd1WUeB9cyNxswkUNF4oNieaX8tKKr9hh+/VuvgDdo0UThOAyp
         pesxXoREuBsfh6bFyeFkIdAqZADmmpRigGY6kUUviEvwxNZhFUfm6MVng3Z4CxWD1kR5
         Fn6rQWT+pvlN3s30ML8hdbt1t+b9v/6PnH4ElrZ1twqNpgwCV3/w3HWrZCp4poiFbMft
         +jLw==
X-Gm-Message-State: AOJu0Ywq03qmwP4uP1+P3aPN/4UNE/kFFrJ4+M2Ds4E7WB1r1efu6GLY
	LmcMBFf6qCvZ8Na2LgHvUPW8xDz3cpQh5r/UxKU=
X-Google-Smtp-Source: 
 AGHT+IGeFMq6OPRYVFpLBqn7U8F7RLctOzbaeZinyDCceNJQA9yzq0afSM1d3lxBYSz248sE7pBipt1geSP2uWLF31w=
X-Received: by 2002:a81:4782:0:b0:5a7:a817:be43 with SMTP id
 u124-20020a814782000000b005a7a817be43mr6070415ywa.6.1699871011907; Mon, 13
 Nov 2023 02:23:31 -0800 (PST)
MIME-Version: 1.0
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me>
 <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
 <fcfdc6f05926db494ea0105e5523cc21ecfdf4e7.camel@gmail.com>
In-Reply-To: <fcfdc6f05926db494ea0105e5523cc21ecfdf4e7.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Nov 2023 12:22:56 +0200
Message-ID: 
 <CAHp75VcsF8GtmE2iDf2xPWi7U5WXhi1ZFUSeA_Y+TfHQn72Jrg@mail.gmail.com>
Subject: Re: [PATCH v3 14/42] power: reset: Add a driver for the ep93xx reset
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, nikita.shubin@maquefel.me,
	Hartley Sweeten <hsweeten@visionengravers.com>,
 Lennert Buytenhek <kernel@wantstofly.org>,
	Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
	Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Michael Peters <mpeters@embeddedts.com>, Kris Bahnsen <kris@embeddedts.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, netdev@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: andy.shevchenko@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: EDICJNAC72CRYPC4TWCKXUVORILZGSNJ
X-Message-ID-Hash: EDICJNAC72CRYPC4TWCKXUVORILZGSNJ
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:57:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EDICJNAC72CRYPC4TWCKXUVORILZGSNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Nov 13, 2023 at 12:07=E2=80=AFPM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
> On Fri, 2023-07-21 at 19:37 +0300, Andy Shevchenko wrote:
> > > +       /* Issue the reboot */
>             ^^^^^^^^^^^^^^^^^^^^^^
> This is the relevant comment, one can extend it, but looks already quite
> informative considering EP93XX_SYSCON_DEVCFG_SWRST register name.

This does not explain the necessity of the mdelay() below.

> But Nikita would be able to include more verbose comment if
> you'd have a suggestion.

Please,add one.

> > > +       ep93xx_devcfg_set_clear(priv->map, EP93XX_SYSCON_DEVCFG_SWRST=
, 0x00);
> > > +       ep93xx_devcfg_set_clear(priv->map, 0x00, EP93XX_SYSCON_DEVCFG=
_SWRST);
> >
> >
> > > +       mdelay(1000);
> >
> > Atomic?! Such a huge delay must be explained, esp. why it's atomic.

--=20
With Best Regards,
Andy Shevchenko
