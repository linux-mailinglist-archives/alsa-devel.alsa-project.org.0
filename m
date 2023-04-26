Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B296F2EDB
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:46:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8A581757;
	Mon,  1 May 2023 08:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8A581757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923567;
	bh=dk6b/0HWYMRtfV9qMW3bV+XRoEDTJNDNRtBCLFI9nTo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tnhLvV4IH5pQIrxj7RycAFdJdWZyZ8XYMyy0GmKSQW8n9wSUFgAZtm33j/FKrGI68
	 Ik/zopQoK/gLTNfQM7F5hEvOagTpDL1UM0gd/cgfxPT+GiqeJvgDxPWpQ0bhknwaRI
	 ixwNyX09qYfeqTXa6V0zziTa26DTMjianGGf1qII=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38908F805C4;
	Mon,  1 May 2023 08:40:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4816DF80236; Wed, 26 Apr 2023 23:02:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9104EF800AC
	for <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 23:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9104EF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m0bRBe1j
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7993262F96;
	Wed, 26 Apr 2023 21:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647F8C433EF;
	Wed, 26 Apr 2023 21:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682542930;
	bh=dk6b/0HWYMRtfV9qMW3bV+XRoEDTJNDNRtBCLFI9nTo=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=m0bRBe1jhR57bR0mjtiETvtuaXuGZqananSYQclAwPRk5Bc05FEF38a7OlNCkunkp
	 yBQP+THpgawS2bcxohkuSwA1g/yxRRDo/Qx/jwW9jGSbgdDd2RQtztsPcKxg48qS0N
	 j6mGkleLmQ/76VhIaG6rJn3NmV0qI41BRuUaAE5s6mtt2/MaLPRoquZ1/JKyKslu3s
	 tPojv3kgq6p2YBjq/CHaHu7SuJmdHGKRcbQfoSIGvDUgNcyZD8jh6xGRR+Np6u6lct
	 KildN95xpHCBTi2hLfVM8v4kCW4OSWdy8i+40d+rdjxtE/WgplWyCwLKM9PSaQ0Lke
	 h7s3jo1CsTstA==
Date: Wed, 26 Apr 2023 22:01:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
Message-ID: <b5396ef5-3fed-4e98-8f37-a9cd4473bddc@sirena.org.uk>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <CACRpkdarANFQ7-p=-Pi_iuk6L=PfSLDsD3_w4dEVqarwXkEGMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I5GnqS13l10kVXrY"
Content-Disposition: inline
In-Reply-To: 
 <CACRpkdarANFQ7-p=-Pi_iuk6L=PfSLDsD3_w4dEVqarwXkEGMQ@mail.gmail.com>
X-Cookie: Drilling for oil is boring.
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: BQUFBBONZI772QPHGJZUK3L4KZPAPLBC
X-Message-ID-Hash: BQUFBBONZI772QPHGJZUK3L4KZPAPLBC
X-Mailman-Approved-At: Mon, 01 May 2023 06:40:39 +0000
CC: Nikita Shubin <nikita.shubin@maquefel.me>,
 Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Brian Norris <briannorris@chromium.org>, Chuanhong Guo <gch981213@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Jakub Kicinski <kuba@kernel.org>, Jean Delvare <jdelvare@suse.de>,
 Joel Stanley <joel@jms.id.au>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Le Moal <damien.lemoal@opensource.wdc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Liang Yang <liang.yang@amlogic.com>,
 Lukasz Majewski <lukma@denx.de>, Lv Ruyi <lv.ruyi@zte.com.cn>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Olof Johansson <olof@lixom.net>,
 Paolo Abeni <pabeni@redhat.com>, Qin Jian <qinjian@cqplus1.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>, Sebastian Reichel <sre@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Stephen Boyd <sboyd@kernel.org>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, netdev@vger.kernel.org, soc@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQUFBBONZI772QPHGJZUK3L4KZPAPLBC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--I5GnqS13l10kVXrY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 26, 2023 at 10:56:53PM +0200, Linus Walleij wrote:

> This is a big patch set and the improvement to the ARM kernel it
> brings is great, so I am a bit worried about over-review stalling the
> merged. If there start to be nitpicky comments I would prefer that
> we merge it and let minor comments and "nice-to-haves" be
> addressed in-tree during the development cycle.

I'm really not enthusiastic about the SPI bindings being merged as-is.

--I5GnqS13l10kVXrY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRJkT8ACgkQJNaLcl1U
h9B3Igf/QHH4S59NGDBfaDSgwwIyuYlvgVyy/BCHVqFNcP2pjHcpj0GHo+WkpjVP
wsDLG8hswF/nuh2Yy6i1bBVQ1ugfJUg7KkA+cj7Inagtdre2PIwXKkc8AiLH2c74
u0aKy1ihWmdVW49iT4tEm6vq8ar/UPuxorRa8RwkkFaEzFdRbC9+c0d8ZY50FdCe
erujumfY11ZfUuNVceFfDnEz9GKxjPo5w3uUE7KV9EwK6tPH20f8T9NdmH7FxtLi
k2V0DxnDxZWpGsmYFDjOI4pUDGjDxZ+KJLKKE4mSz5n+SckkAHkGhwAJQnXjl3Ct
6pcdgTLe0bfrxqlq1Hn6QWGqWMW7bw==
=5CpS
-----END PGP SIGNATURE-----

--I5GnqS13l10kVXrY--
