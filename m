Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D52EE75C23E
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:57:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35622846;
	Fri, 21 Jul 2023 10:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35622846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689929836;
	bh=tx4bjwgSSJSb6YT5+Vwiw5cr91ahSeHGqQoHPOhKX8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HHHSp+xjKpztFwoHAsJkZhqaOpP/5qWJNz+iLInYXv6fogEZwK7DVG571cIypsvO/
	 ghiKFMfINiROascVaf4h0leFZYr4jR2035/J5gaSrODzcCbF5Y3z4/8w9/GZoHtWhM
	 0/lDNg79GTitJ+gcXs8JZBfMjDI7lN3k6InFrcxs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1ED9F805FC; Fri, 21 Jul 2023 10:54:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4396DF805F1;
	Fri, 21 Jul 2023 10:54:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65FFAF8047D; Thu, 20 Jul 2023 14:36:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A53F6F8027B
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 14:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A53F6F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OxsinWvI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53C3661A41;
	Thu, 20 Jul 2023 12:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E69C433C7;
	Thu, 20 Jul 2023 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689856578;
	bh=tx4bjwgSSJSb6YT5+Vwiw5cr91ahSeHGqQoHPOhKX8c=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=OxsinWvIFF5gSYzeC9nprmcJnexZ2+pzRTEtCPGSDVXBXTxmtyD8J6cScmlKDK3cB
	 5yE1supJc9fsWZHybibJENoDpuz2+JtJq0G0/o1M9H5vusZ/mbBNE89kmITtLNWiUv
	 VoYJp6D/sT5jvqV22YqlSQtVCg1Ds1tBAbxEP0qahLvXW+mcnCR+r5IZSf1AolV+A8
	 TLA3CjFa77OdSPos2Qg4O1B7BjDbMZaGdV7iiw3FoGeIJWPra6iLOe3D7hFUktjPhd
	 pswJWK5/sxEEqZ7EFzaPyQhlO+ROBbnAN36OJeucLXcjKaVy7Z0N1/uAdQi0D9efa3
	 FUZwjDuSIiyQw==
Date: Thu, 20 Jul 2023 13:36:01 +0100
From: Mark Brown <broonie@kernel.org>
To: nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Lennert Buytenhek <kernel@wantstofly.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sebastian Reichel <sre@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michael Peters <mpeters@embeddedts.com>,
	Kris Bahnsen <kris@embeddedts.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 42/42] ASoC: cirrus: edb93xx: Delete driver
Message-ID: <d77bee81-190a-4aa2-98ac-8da3a9801b50@sirena.org.uk>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-42-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5GyV5EkRHy37I+rH"
Content-Disposition: inline
In-Reply-To: <20230605-ep93xx-v3-42-3d63a5f1103e@maquefel.me>
X-Cookie: Ginger snap.
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: SI4SVVIAKIVIADCKNEKZFQAEAVXELS4S
X-Message-ID-Hash: SI4SVVIAKIVIADCKNEKZFQAEAVXELS4S
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:54:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SI4SVVIAKIVIADCKNEKZFQAEAVXELS4S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--5GyV5EkRHy37I+rH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 02:29:42PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>=20
> Can be replaced with "simple-audio-card" for the rates up to 50kHz, refer
> to commit "ARM: dts: ep93xx: Add EDB9302 DT".

Acked-by: Mark Brown <broonie@kernel.org>

--5GyV5EkRHy37I+rH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS5KjEACgkQJNaLcl1U
h9B6aQf/XDtbT4LN4vU9F6keDfckOFzxaWiUcy57r8jPcwHJg8vCxhKWHLrclREk
XH6ynZJ84wMW6ghI1RW3NJ06CVhs/KPzBcZ30la2LplfkeaUXMcB6Gh7C3NSzzkZ
47MAW/Y4HgC8BFFwixdr6vcqulgad7GD8AZcJq0FfaRSuv0OBYpicItwd2Hjxyev
yx3wdBDRiwxBn4FdFOd1KU3fnLZbvVBEmrF54V5z8AM3nkN+u0tSyAHyoaEMNQ+N
bBbcQi0/TIdD0ktmis2z41SHRJJUpLB65MWk6Kjs92gE9GS7g4m3LJrDtrm/FqVT
81KRIgPAl1ZTlDxAZhUIyTGU9MecZw==
=aMu7
-----END PGP SIGNATURE-----

--5GyV5EkRHy37I+rH--
