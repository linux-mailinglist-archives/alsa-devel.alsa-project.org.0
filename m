Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9647E9B84
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:56:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04E7F850;
	Mon, 13 Nov 2023 12:55:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04E7F850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876586;
	bh=+RhEdhW/dKFA6xVa++OD9WhGhMLkWfXewwpIA75edCc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OSbbDK00pcesn5jlzKYO7zi93UcfmsTXG/kRAFpiM9FZzOFQa+v3YSXsYONvuFHQ7
	 hPrCZhzy+6IJvLxGTFdtzNK/0O3iXgB6p/og9NHq8urqi7pjFuiWP5RROMgLQXJg35
	 W7qEVOlYcl9AzbPOF6IvmIMXXb8uNMUuU1bu5yuo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D65A3F80570; Mon, 13 Nov 2023 12:54:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B0ABF8055B;
	Mon, 13 Nov 2023 12:54:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF9BAF801D5; Mon, 13 Nov 2023 11:00:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44B30F80152
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 11:00:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44B30F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CETYW+Z6
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-66d0ceba445so22074986d6.0
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Nov 2023 02:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699869626; x=1700474426;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbOR8jc4vESBCIxoa+hxCKP6qo+nQDlXSDfPg0qKWS8=;
        b=CETYW+Z6V30edWbAOXyVg7X1XQRcug24iSPM12dP9AzossEcGGhG/BBMBPIk4NL+yW
         Jd3i8IPc7S+uFe9mj4g2bjL0HBrR0hA5clyqRHV0OWOnVQ7067wurOvK/IlOSwuMWT9i
         3pyi/6l1XmQgbOzzCZ41oHQuydDwgf215Qj6jWGxD1mEwpD8mPlUGhvvTjJJnRO58qJL
         h3rb5DsXDmwGSWmjLD62FBZmFCtmWBdyAOFtSMPLHWQXff7hz4a7jwEJRhSidKkpf2KU
         ZdqPDA+g6070PbrDI6JVEaCWv9O0dS9cHp6CGP18zt+6FzS9/I4s5IxK6aadTvLSw2bw
         jVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699869626; x=1700474426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbOR8jc4vESBCIxoa+hxCKP6qo+nQDlXSDfPg0qKWS8=;
        b=D4GsvDYtga0TSmw/sXvZiItZIQudexpxL6HYzUGCR96vMd74N+7rpJFADSqal6WucZ
         z09HkU/OFq13UMnCQ4e5SoqyY4hEycnKBQZjfwBCET1WVImCwpbflHceAl2fCNRy3G5j
         2LdUtXqwx7qs/fhG+YOqFrF4ZQB6jwdhPYn4wKqdaJZ1yC2v2bVE3EA1TR2NP2a3WYaf
         3wS2avAOht/ltj7UbxOYFG1DmQACuXoP/gNe8f94cp5VzzLAN2mup5fyV9hbuxFeg5BY
         zSTO9UXbG41C7ykoi1RmU946ogTyOMD1myEt0VPVvvtNuHPZO60STt8yvqw/R5IM4pNo
         FoGw==
X-Gm-Message-State: AOJu0YwRpBbkTjY1Q8iU3cfOHf6NRRuegwLOLn6PT5iD1hBkzhGXTWML
	gvFY/CxQ+GGdKlighLYds0bPogX06p9wJS7nQ/g=
X-Google-Smtp-Source: 
 AGHT+IGCUr7PujFC+poPa2QrZRvWL4HOk1bJVQMa23HsF2MY33M5q50/7KY3Uea2911BZ50MrpHn+FMZq5R37QecRrw=
X-Received: by 2002:ad4:45b4:0:b0:658:1eec:408a with SMTP id
 y20-20020ad445b4000000b006581eec408amr4664228qvu.40.1699869626386; Mon, 13
 Nov 2023 02:00:26 -0800 (PST)
MIME-Version: 1.0
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me>
 <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
 <80ed91bb971516638fa1793d648939815eba7630.camel@gmail.com>
In-Reply-To: <80ed91bb971516638fa1793d648939815eba7630.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Nov 2023 11:59:49 +0200
Message-ID: 
 <CAHp75VeYHscM-r94kTrpH44W=OGVq+qoNNQZoVrR5_n-_K_Xsw@mail.gmail.com>
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
Message-ID-Hash: 54YH457PFHFUGNU7NH35O4JWCNRSPB5R
X-Message-ID-Hash: 54YH457PFHFUGNU7NH35O4JWCNRSPB5R
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:54:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54YH457PFHFUGNU7NH35O4JWCNRSPB5R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Nov 11, 2023 at 8:18=E2=80=AFPM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
> On Fri, 2023-07-21 at 19:37 +0300, Andy Shevchenko wrote:

...

> > > +       mdelay(1000);
> >
> > Atomic?! Such a huge delay must be explained, esp. why it's atomic.
>
> atomic or not, SoC is supposed to reset itself here.
> However there is an errata [1] and the SoC can lockup instead.

Good, and what I'm saying is that this piece of code must have a
comment explaining this.

> So even pr_emerg() makes sense to me.

This is irrelevant to the comment.

> > > +       pr_emerg("Unable to restart system\n");
> > > +       return NOTIFY_DONE;
>
> [1] http://web.archive.org/web/20161130230727/http://www.cirrus.com/en/pu=
bs/appNote/AN258REV2.pdf

--=20
With Best Regards,
Andy Shevchenko
