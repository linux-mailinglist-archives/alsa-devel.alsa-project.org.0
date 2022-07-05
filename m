Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A437A566A88
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 14:00:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 152F316DC;
	Tue,  5 Jul 2022 13:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 152F316DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657022427;
	bh=95LY5+qJGtghE+KPUxRvTlrikxpyhWepoRD0B1kqI0M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vUcVMRTJ+NPbR71jdfWBETagERqEVjrZbSigYO8XBwCC9EJOaQVLouapAI9UhI+u9
	 098VwKLlF9joNn4yJIIRWVqAwWKb6IGegdoAU6roA2E2C4JGPa7qpaubKudgxao+Aa
	 LstzOLCA0kbbJlOaluOMrR0uWmVJGJhS1Uzpxftk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B06BF8052E;
	Tue,  5 Jul 2022 13:58:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 830D9F8015B; Tue,  5 Jul 2022 12:36:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C646AF8012A
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 12:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C646AF8012A
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8fuq-0001LC-19; Tue, 05 Jul 2022 12:36:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8fue-004XxA-J7; Tue, 05 Jul 2022 12:36:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8fuh-0038F6-8t; Tue, 05 Jul 2022 12:36:15 +0200
Date: Tue, 5 Jul 2022 12:36:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220705103615.ceeq7rku53x743ps@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <20220705120852.049dc235@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gut2agzhpaayxotv"
Content-Disposition: inline
In-Reply-To: <20220705120852.049dc235@endymion.delvare>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Tue, 05 Jul 2022 13:58:46 +0200
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev,
 kasan-dev@googlegroups.com, linux-clk@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--gut2agzhpaayxotv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2022 at 12:08:52PM +0200, Jean Delvare wrote:
> On Tue, 28 Jun 2022 16:03:12 +0200, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
> >=20
> > The value returned by an i2c driver's remove function is mostly ignored.
> > (Only an error message is printed if the value is non-zero that the
> > error is ignored.)
> >=20
> > So change the prototype of the remove function to return no value. This
> > way driver authors are not tempted to assume that passing an error to
> > the upper layer is a good idea. All drivers are adapted accordingly.
> > There is no intended change of behaviour, all callbacks were prepared to
> > return 0 before.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
>=20
> That's a huge change for a relatively small benefit, but if this is
> approved by the I2C core maintainer then fine with me. For:

Agreed, it's huge. The benefit isn't really measureable, the motivation
is to improve the situation for driver authors who with the change
cannot make wrong assumptions about what to return in .remove(). During
the preparation this uncovered a few bugs. See for example
bbc126ae381cf0a27822c1f822d0aeed74cc40d9.

> >  drivers/hwmon/adc128d818.c                                | 4 +---
> >  drivers/hwmon/adt7470.c                                   | 3 +--
> >  drivers/hwmon/asb100.c                                    | 6 ++----
> >  drivers/hwmon/asc7621.c                                   | 4 +---
> >  drivers/hwmon/dme1737.c                                   | 4 +---
> >  drivers/hwmon/f75375s.c                                   | 5 ++---
> >  drivers/hwmon/fschmd.c                                    | 6 ++----
> >  drivers/hwmon/ftsteutates.c                               | 3 +--
> >  drivers/hwmon/ina209.c                                    | 4 +---
> >  drivers/hwmon/ina3221.c                                   | 4 +---
> >  drivers/hwmon/jc42.c                                      | 3 +--
> >  drivers/hwmon/mcp3021.c                                   | 4 +---
> >  drivers/hwmon/occ/p8_i2c.c                                | 4 +---
> >  drivers/hwmon/pcf8591.c                                   | 3 +--
> >  drivers/hwmon/smm665.c                                    | 3 +--
> >  drivers/hwmon/tps23861.c                                  | 4 +---
> >  drivers/hwmon/w83781d.c                                   | 4 +---
> >  drivers/hwmon/w83791d.c                                   | 6 ++----
> >  drivers/hwmon/w83792d.c                                   | 6 ++----
> >  drivers/hwmon/w83793.c                                    | 6 ++----
> >  drivers/hwmon/w83795.c                                    | 4 +---
> >  drivers/hwmon/w83l785ts.c                                 | 6 ++----
> >  drivers/i2c/i2c-core-base.c                               | 6 +-----
> >  drivers/i2c/i2c-slave-eeprom.c                            | 4 +---
> >  drivers/i2c/i2c-slave-testunit.c                          | 3 +--
> >  drivers/i2c/i2c-smbus.c                                   | 3 +--
> >  drivers/i2c/muxes/i2c-mux-ltc4306.c                       | 4 +---
> >  drivers/i2c/muxes/i2c-mux-pca9541.c                       | 3 +--
> >  drivers/i2c/muxes/i2c-mux-pca954x.c                       | 3 +--
>=20
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gut2agzhpaayxotv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLEFBwACgkQwfwUeK3K
7AkavggAgLmynakXX/rOF4Jwy2OuBXH29kecKqPd6xj4yHsu3ggy8kd/hlU4jJib
vV0H9ioq69hhMqjme5AHJJsueLFi/t/iwuQwuWUKluCBBlx0RXBsVx8qxV7A0uWa
mdKU3ApPaN7y0cS1jccdN7ydsL3H2ayzIwfQuNqx1G3P/uqXfkusV0fjwQ/rQct3
qs4t2/QiHUd0tStlGw2eSKxp1z5KRrDMstK17fiZSsw/SYoMyldV8Ame6+gaxx0X
e93FqM5jj67ovjD3jJanfOwI5vesu4+szu4GK6vHRWvpsieHsSeyS+GNgfM5oLA7
iguZ0rauzy0je3hrHuKgp1maJ59ibQ==
=fYiS
-----END PGP SIGNATURE-----

--gut2agzhpaayxotv--
