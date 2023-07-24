Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 785707617A6
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 13:52:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F3961507;
	Tue, 25 Jul 2023 13:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F3961507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690285950;
	bh=R1cMTZX1PUU2KkohyDFYTgVjZODSeThTo605Qizu2/o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m62KEnVPGaE1s3FXm3ug1d0mk4n9OcbxtYIMcznPO6ng7GuxPiv40GVjBiwI/28Xo
	 jexgw7490PyafdDJ3zWiX1xQPKG3L4vCNs7uOtOstkR+yUAT7UJATOH/KD6oh0GcEM
	 /Jixkms6PGyGVW6wjQafgMKRJ/rItsZDyEytZ0U4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24907F8053B; Tue, 25 Jul 2023 13:51:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 731DFF80163;
	Tue, 25 Jul 2023 13:51:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29EC7F8019B; Mon, 24 Jul 2023 09:09:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0FB0F800C7
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 09:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0FB0F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iC5ZIY44
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C2E524000E;
	Mon, 24 Jul 2023 07:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690182552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0OTdgWQ6Vo/4tl1ZM7En0YdjITPLKGIP2IIxkkPFJRM=;
	b=iC5ZIY44VFrCSUNoeMIdYmOyqSrlrW7N4tyY+Hq53oXBVph3jCQ5ij8fsDynsYh6NybKfF
	47iBUwR964ggu52YB13yaU1E18wok2aDQAXdbpXfZnCVzqeybMcvNBEm04M8MJv49vz912
	60p20TKBhztddQMV6EZbSo0vTLzFb3Ok+FWErn92iDiDFjDyPmqRh1JKdYw5xT3hwpwVlV
	u4k2GthKUnBFuRNrRP/XoPSerupU1HIaiVySzO/QpWk35FaiLI3dwdIhQ2brWGTyOPPUCM
	8E3/Ier83smwYkYCv/LsZ20OWFpB5I2g8A5epoX659Pa/Omr3Rckh60nqnZ+5A==
Date: Mon, 24 Jul 2023 09:09:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: nikita.shubin@maquefel.me, Hartley Sweeten
 <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Sebastian
 Reichel <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Mark
 Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Damien
 Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Michael Peters <mpeters@embeddedts.com>, Kris Bahnsen
 <kris@embeddedts.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-spi@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 24/42] mtd: nand: add support for ts72xx
Message-ID: <20230724090902.679ea56d@xps-13>
In-Reply-To: <ZLqx+Osn3gcHjUph@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	<20230605-ep93xx-v3-24-3d63a5f1103e@maquefel.me>
	<ZLqx+Osn3gcHjUph@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-MailFrom: miquel.raynal@bootlin.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: JVCHUMNHXNIZ2L65HRXD7ECL7QXVGQXZ
X-Message-ID-Hash: JVCHUMNHXNIZ2L65HRXD7ECL7QXVGQXZ
X-Mailman-Approved-At: Tue, 25 Jul 2023 11:51:32 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JVCHUMNHXNIZ2L65HRXD7ECL7QXVGQXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

> > +static int ts72xx_nand_attach_chip(struct nand_chip *chip)
> > +{
> > +	switch (chip->ecc.engine_type) {
> > +	case NAND_ECC_ENGINE_TYPE_SOFT:
> > +		if (chip->ecc.algo =3D=3D NAND_ECC_ALGO_UNKNOWN)
> > +			chip->ecc.algo =3D NAND_ECC_ALGO_HAMMING;
> > +		break;
> > +	case NAND_ECC_ENGINE_TYPE_ON_HOST:
> > +		return -EINVAL;
> > +	default: =20
>=20
> > +		break; =20
>=20
> Here it will return 0, is it a problem?

Seems ok, there are two other situations: on-die ECC engine and no ECC
engine, both do not require any specific handling on the controller
side.

>=20
> > +	}
> > +
> > +	return 0;
> > +} =20
>=20
> ...
>=20
> > +static void ts72xx_nand_remove(struct platform_device *pdev)
> > +{
> > +	struct ts72xx_nand_data *data =3D platform_get_drvdata(pdev);
> > +	struct nand_chip *chip =3D &data->chip;
> > +	int ret;
> > +
> > +	ret =3D mtd_device_unregister(nand_to_mtd(chip)); =20
>=20
> > +	WARN_ON(ret); =20
>=20
> Why?!  Is it like this in other MTD drivers?

Yes, we did not yet change the internal machinery to return void, and
we don't want people to think getting errors there is normal.

> > +	nand_cleanup(chip);
> > +} =20
>=20

Thanks,
Miqu=C3=A8l
