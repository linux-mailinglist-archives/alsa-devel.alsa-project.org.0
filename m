Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B49BC7E9B88
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:57:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CED8852;
	Mon, 13 Nov 2023 12:56:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CED8852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876626;
	bh=yfUE3JjgApZWaOiPs5blNMrWF0xbq2o5lcQvO2GdSf4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jM5aSzuE3mN7n3IL3OCvat+oEokcNeR3wXLaC1GFyBAwHG5fRdDG2hJMbawd9Nsov
	 sd/xkleTgp7VEn7xmC7QE+h6dbuxrD8qFmY9zl9jM2YrnoVcfJaZKZ/KH5YhCycwvA
	 WvPJL9Iv6FwY34tRTNBT0Q1fv8crIkesBDPfKcj4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EFEEF805AC; Mon, 13 Nov 2023 12:54:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CC14F805AE;
	Mon, 13 Nov 2023 12:54:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B52AF801D5; Mon, 13 Nov 2023 11:20:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D4E2F80152
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 11:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D4E2F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dAh3pQTD
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-77ba957043cso293167285a.2
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Nov 2023 02:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699870832; x=1700475632;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FB3t9eIHw+pKT3CBB8s0t2nQUBpXnYyol/A+bIoemXQ=;
        b=dAh3pQTD5eU2YBL3k828EvgBPBiNLnSlQ9Z5c7h1JnQ00fjOpDUw0mM5qt9pJL7qba
         95MbykHePMJbado605yxpT/ExoPoM+4W/x1jp8iQCgUFcVG6kQm0ZnR5pb+EbZ11G8JN
         BrOwd7zuglaqsB089oF3sDfe3p9JyXdPg020PVwz4WWgPDuOsfMD3li7s6knMjmzNVmh
         Py4bjbhnHn2vAcTLQjXhX9PEb9OOOvJ6+VwE7tmgp+95M4EPefcXDZaB0r1J0s3VNmXk
         uO67vsoy+hfplzgr0ZEoobBKMbmsgglGnnIJWGEtwH54tTZg+h7RdmtofoBhOBJJPYpA
         p35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699870832; x=1700475632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FB3t9eIHw+pKT3CBB8s0t2nQUBpXnYyol/A+bIoemXQ=;
        b=NXl6wmylrspVe8KboW2PRUDw48ogMYZGKfcE++SvI1Ue1SVNdW0JLBjq3lRjIP1QKU
         2/eZ0TgcYPhuAjzuhN4EUyS6zighWhkCJzlIZ5ZciNVU6FQJ9uSXkT9N1cj53hDsxSLI
         L1Uhv+X42o6Pbtf32O7r8WvC53pB7AlSDCdiR3cAeh+cnsEKDU38QjIlYzyZr2WMGOoF
         jwxaaeNUqQb+eeyXESFw4y18tVfoMjxe1hbypnbrms7x6sDTn9Kd56uAHSUTMVSare/Q
         CvSiqacSinexsh/D21BnI6wgFNMVmrQe9bg7I2vZ7FBzfRn2eWrolqqVQw04og/1ScVO
         viIQ==
X-Gm-Message-State: AOJu0YykhKBIAalBcE//QOLqrS/YbZdp1E2K3+F3p3eyj6Jrx8UsDDkx
	lfaHuNBXeuCxgT2QQly4rCfKQVl6X1kdRoS8teY=
X-Google-Smtp-Source: 
 AGHT+IHcamihKm+ziuVIZapYWw1ITNZRzLvq04tB/x59umIja9AF0bX8BVytW1nYcQa699XIK195qbQ3GDjcnycnRno=
X-Received: by 2002:a05:6214:a90:b0:671:8630:f590 with SMTP id
 ev16-20020a0562140a9000b006718630f590mr5914012qvb.18.1699870832421; Mon, 13
 Nov 2023 02:20:32 -0800 (PST)
MIME-Version: 1.0
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-7-3d63a5f1103e@maquefel.me>
 <ZLqSo6B5cJXVRJS/@smile.fi.intel.com>
 <c49f77492cacc5a30079720af58a9f2fca761609.camel@gmail.com>
In-Reply-To: <c49f77492cacc5a30079720af58a9f2fca761609.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Nov 2023 12:19:56 +0200
Message-ID: 
 <CAHp75VccVh+M444AAixVzSvM6-FsDm8jDYdakHhNFTAL8WOGMA@mail.gmail.com>
Subject: Re: [PATCH v3 07/42] soc: Add SoC driver for Cirrus ep93xx
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
Message-ID-Hash: RAXUE27FHFGTFFLM342IK4FZIG65TH4K
X-Message-ID-Hash: RAXUE27FHFGTFFLM342IK4FZIG65TH4K
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:54:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RAXUE27FHFGTFFLM342IK4FZIG65TH4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Nov 11, 2023 at 11:33=E2=80=AFPM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
> On Fri, 2023-07-21 at 17:13 +0300, Andy Shevchenko wrote:

...

> > > +       spin_lock_irqsave(&ep93xx_swlock, flags);
> > > +
> > > +       regmap_read(map, EP93XX_SYSCON_DEVCFG, &val);
> > > +       val &=3D ~clear_bits;
> > > +       val |=3D set_bits;
> > > +       regmap_write(map, EP93XX_SYSCON_SWLOCK, EP93XX_SWLOCK_MAGICK)=
;
> > > +       regmap_write(map, EP93XX_SYSCON_DEVCFG, val);
> >
> > Is this sequence a must?
> > I.o.w. can you first supply magic and then update devcfg?
> >
> > > +       spin_unlock_irqrestore(&ep93xx_swlock, flags);

...

> > > +void ep93xx_swlocked_update_bits(struct regmap *map, unsigned int re=
g,
> > > +                                unsigned int mask, unsigned int val)

> > Same Q as above.
>
> EP93xx User Manual [1] has most verbose description of SWLock for ADC
> block:
> "Writing 0xAA to this register will unlock all locked registers until the
> next block access. The ARM lock instruction prefix should be used for the
> two consequtive write cycles when writing to locked chip registers."
>
> One may conclude that RmW (two accesses to the particular block) sequence
> is not appropriate.

It's not obvious to me. The terms "block access" and "block cycle"
occur only once in the very same section that describes ADCSWLock. The
meaning of these terms is not fully understandable. So, assuming that
you have tried it differently and it indeed doesn't work, let's go
with this one.

> [1] https://cdn.embeddedts.com/resource-attachments/ts-7000_ep9301-ug.pdf



--
With Best Regards,
Andy Shevchenko
