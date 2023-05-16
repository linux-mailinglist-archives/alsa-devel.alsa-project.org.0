Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2949F708FC6
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 08:20:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B07A8828;
	Fri, 19 May 2023 08:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B07A8828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684477239;
	bh=R3NyR73k7IhF7nI84HX4UghfXKGpid2SwwTSfXwtO70=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RhzyZT0OS0I/i1IGEhCCtfK64a+Z2W3cihFhkcF7J3BA+B075ZbYnxwjRXcZ+ptYi
	 Cr6KzyapQPVPbl4GdDKQT25fZSTvAPQfn0QnZ3GikFik6UxmkVihTrP4bFwUCEaAeY
	 H+OLMjh1Rk6Ytmg6YCFr+Yqza/JUGjSiUTTofOtk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 244E3F80578; Fri, 19 May 2023 08:18:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EDE2F8057B;
	Fri, 19 May 2023 08:18:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 410A2F80272; Tue, 16 May 2023 09:38:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d501])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22619F80087
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 09:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22619F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=maquefel.me header.i=@maquefel.me header.a=rsa-sha256
 header.s=mail header.b=QotG58g6
Received: from mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:2991:0:640:bb47:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTP id 6695D5F29E;
	Tue, 16 May 2023 10:38:03 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id rbVsqF6Wo4Y0-UkaxrYJI;
	Tue, 16 May 2023 10:38:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1684222681;
	bh=R3NyR73k7IhF7nI84HX4UghfXKGpid2SwwTSfXwtO70=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=QotG58g6dFkLdzg/jCTCPqPNHWfIFJSnx9H8OHC12M2roLLuxVWKx6W2h25dkjVSe
	 HRwtXoqfClom0cLuEY16ejoh6MbeEy+uPI8UAhwOs+j0NQ/gw1AVexLnYUBpraFKDp
	 l0egQl1rEQANggrBncTSCi4j3ZinsQfxms2ylvX4=
Authentication-Results: 
 mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Message-ID: <4f81a96b826344f45d0994539e3b3fe94fe7eb50.camel@maquefel.me>
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jonathan =?ISO-8859-1?Q?Neusch=E4fer?=
 <j.neuschaefer@gmx.net>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>,  Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Brian Norris <briannorris@chromium.org>,
 Chuanhong Guo <gch981213@gmail.com>,  Conor Dooley
 <conor.dooley@microchip.com>, Damien Le Moal <dlemoal@kernel.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,  Emil Renner Berthing <kernel@esmil.dk>, Eric
 Dumazet <edumazet@google.com>, Guenter Roeck <linux@roeck-us.net>, Hartley
 Sweeten <hsweeten@visionengravers.com>, Heiko Stuebner <heiko@sntech.de>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Jakub Kicinski
 <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Jean Delvare
 <jdelvare@suse.de>, Joel Stanley <joel@jms.id.au>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Le Moal
 <damien.lemoal@opensource.wdc.com>,  Liam Girdwood <lgirdwood@gmail.com>,
 Liang Yang <liang.yang@amlogic.com>, Linus Walleij
 <linus.walleij@linaro.org>, Lukasz Majewski <lukma@denx.de>, Lv Ruyi
 <lv.ruyi@zte.com.cn>, Mark Brown <broonie@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Nicolas Saenz Julienne
 <nsaenz@kernel.org>, Olof Johansson <olof@lixom.net>, Paolo Abeni
 <pabeni@redhat.com>, Qin Jian <qinjian@cqplus1.com>, Richard Weinberger
 <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Robert Jarzmik
 <robert.jarzmik@free.fr>,  Russell King <linux@armlinux.org.uk>, Sebastian
 Reichel <sre@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,  Stephen
 Boyd <sboyd@kernel.org>, Sumanth Korikkar <sumanthk@linux.ibm.com>, Sven
 Peter <sven@svenpeter.dev>,  Takashi Iwai <tiwai@suse.com>, Thierry Reding
 <thierry.reding@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,  Ulf
 Hansson <ulf.hansson@linaro.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Walker Chen <walker.chen@starfivetech.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Yinbo Zhu <zhuyinbo@loongson.cn>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org,  linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org,  linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, netdev@vger.kernel.org, soc@kernel.org
Date: Tue, 16 May 2023 13:37:54 +0300
In-Reply-To: <1ff2333a-8f78-c066-0158-9c8a1a17684f@gmail.com>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
	 <1ff2333a-8f78-c066-0158-9c8a1a17684f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-MailFrom: nikita.shubin@maquefel.me
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: TQMEYLIBLB4U4LINHFQ7WCPEA2ABQEPP
X-Message-ID-Hash: TQMEYLIBLB4U4LINHFQ7WCPEA2ABQEPP
X-Mailman-Approved-At: Fri, 19 May 2023 06:16:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQMEYLIBLB4U4LINHFQ7WCPEA2ABQEPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Florian!

On Mon, 2023-05-15 at 20:47 -0700, Florian Fainelli wrote:
>=20
>=20
> On 4/24/2023 5:34 AM, Nikita Shubin wrote:
> > This series aims to convert ep93xx from platform to full device
> > tree support.
> >=20
> > Tested on ts7250 64 RAM/128 MiB Nand flash, edb9302.
> >=20
> > Thank you Linus and Arnd for your support, review and comments,
> > sorry if i missed something -
> > these series are quite big for me.
> >=20
> > Big thanks to Alexander Sverdlin for his testing, support, review,
> > fixes and patches.
>=20
> If anyone is interested I still have a TS-7300 board [1] that is
> fully=20
> functional and could be sent out to a new home.

Thank you kindly, i'll keep this in mind !

>=20
> https://www.embeddedts.com/products/TS-7300

