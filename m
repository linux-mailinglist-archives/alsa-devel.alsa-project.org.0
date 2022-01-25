Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1131D49F652
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 10:28:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5A8116D4;
	Fri, 28 Jan 2022 10:27:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5A8116D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643362127;
	bh=YsOFKC7z/1KMt22YzJ291UNQcVMnZsVpv7ImNi83Rrc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rnwB3AgC9sOWj6MEVriBUfXAziALp8UfZhK8Q0dZwh7KTsoiJwwpTAa6yvnn43NYn
	 wZS+nL3HHMtFkastwCiYbUWr9LdPr7TZZ9y9+zv6ijzJ3MGqMVzddvDxEBW8xmXWfC
	 BmrDiSHdT/KdGT1Pgs1EbgwrBEaNvw2FOwm7atYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08E3FF80538;
	Fri, 28 Jan 2022 10:24:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6738EF804C3; Tue, 25 Jan 2022 11:31:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E478F80161
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 11:31:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E478F80161
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nCJ5B-0002PJ-4T; Tue, 25 Jan 2022 11:29:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nCJ4S-00CKAP-U5; Tue, 25 Jan 2022 11:29:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nCJ4R-001HhT-Dx; Tue, 25 Jan 2022 11:29:03 +0100
Date: Tue, 25 Jan 2022 11:29:03 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 5/5] spi: make remove callback a void function
Message-ID: <20220125102903.werurj56umtglcue@pengutronix.de>
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
 <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
 <20220125094759.000019c5@Huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f3kckhw255f5ljnt"
Content-Disposition: inline
In-Reply-To: <20220125094759.000019c5@Huawei.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Fri, 28 Jan 2022 10:24:41 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Gwendal Grignou <gwendal@chromium.org>,
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, Claudius Heine <ch@denx.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Nanyong Sun <sunnanyong@huawei.com>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Minghao Chi <chi.minghao@zte.com.cn>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Christian Lamparter <chunkeey@googlemail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, linux-clk@vger.kernel.org,
 Stefan Schmidt <stefan@datenfreihafen.org>, linux-omap@vger.kernel.org,
 libertas-dev@lists.infradead.org, Antti Palosaari <crope@iki.fi>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jean Delvare <jdelvare@suse.com>,
 Thomas Kopp <thomas.kopp@microchip.com>,
 =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
 Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
 James Schulman <james.schulman@cirrus.com>, Sidong Yang <realwakka@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Zhang Qilong <zhangqilong3@huawei.com>,
 linux-usb@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Michael Walle <michael@walle.cc>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vladimir Oltean <olteanv@gmail.com>,
 linux-wpan@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dan Robertson <dan@dlrobertson.com>, Markuss Broks <markuss.broks@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, David Airlie <airlied@linux.ie>,
 linux-wireless@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>,
 Thierry Reding <thierry.reding@gmail.com>, Solomon Peachy <pizza@shaftnet.org>,
 "David S. Miller" <davem@davemloft.net>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, Sam Ravnborg <sam@ravnborg.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Manivannan Sadhasivam <mani@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jon Hunter <jonathanh@nvidia.com>, dingsenjie <dingsenjie@yulong.com>,
 Heiko Schocher <hs@denx.de>, Wolfgang Grandegger <wg@grandegger.com>,
 linux-media@vger.kernel.org, Woojung Huh <woojung.huh@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 Ronald =?utf-8?B?VHNjaGFsw6Ry?= <ronald@innovation.ch>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rui Miguel Silva <rmfrfs@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>, UNGLinuxDriver@microchip.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-integrity@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Varka Bhadram <varkabhadram@gmail.com>,
 linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 linux-mtd@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>,
 linux-rtc@vger.kernel.org, Ajay Singh <ajay.kathat@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Davidlohr Bueso <dbueso@suse.de>,
 linux-staging@lists.linux.dev, wengjianfeng <wengjianfeng@yulong.com>,
 linux-input@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mark Gross <markgross@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-fbdev@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan =?utf-8?B?TcOkdGpl?= <stefan.maetje@esd.eu>,
 linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 Yang Li <yang.lee@linux.alibaba.com>, patches@opensource.cirrus.com,
 Kent Gustavsson <kent@minoris.se>, Matt Kline <matt@bitbashing.io>,
 Alexander Aring <alex.aring@gmail.com>, Jiri Prchal <jiri.prchal@aksignal.cz>,
 Vignesh Raghavendra <vigneshr@ti.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>, Mark Greer <mgreer@animalcreek.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Torin Cooper-Bennun <torin@maxiluxsystems.com>,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
 Eric Piel <eric.piel@tremplin-utc.net>, Stephan Gerhold <stephan@gerhold.net>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>, platform-driver-x86@vger.kernel.org,
 Stefan Wahren <stefan.wahren@i2se.com>, Xue Liu <liuxuenetmail@gmail.com>,
 David Lechner <david@lechnology.com>, Will Deacon <will@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Kalle Valo <kvalo@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Alessandro Zummo <a.zummo@towertech.it>, Yang Shen <shenyang39@huawei.com>,
 netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Cai Huoqing <caihuoqing@baidu.com>, Alan Ott <alan@signal11.us>,
 Thomas Zimmermann <tzimmermann@suse.de>, Colin Ian King <colin.king@intel.com>,
 Helge Deller <deller@gmx.de>, Daniel Mack <daniel@zonque.org>
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


--f3kckhw255f5ljnt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Dropped a few people from Cc that are not reachable (Harry Morris,
Charles-Antoine Couret, Marco Felsch)]

On Tue, Jan 25, 2022 at 09:47:59AM +0000, Jonathan Cameron wrote:
> On Sun, 23 Jan 2022 18:52:01 +0100
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> wrote:
>=20
> > The value returned by an spi driver's remove function is mostly ignored.
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
>=20
> For iio drivers.
>=20
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>=20
> As you mention in the cover letter we'll be wanting an immutable
> branch somewhere to pull into subsystem trees.
>=20
> Soon is good if possible as otherwise we'll end up with a bunch of merge
> conflicts getting resolved in next.

Yes, I considered creating a tag to pull already when sending out this
series, but I guessed delaying that a little bit to give people the
opportunity to ack would be a good idea.

@broonie: Do you think this change is a good idea? Would you require
some more acks for the preparatory patches? I had hoped to get Acks from
the corresponding maintainers, maybe they are busy and missed this
series as I put them on Cc: only. I promoted them to To: in this mail.

Or is it too ambitious to get this in during the next merge window?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--f3kckhw255f5ljnt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHv0OwACgkQwfwUeK3K
7AkwFgf/cvC/vOA1oS3kc72Sd8C1LyQHcuopONW8p32pISnzT5iekmQ30JqAKXUo
gYYFlK5nfLHIm1fYZ1WRJHtupkslUM3aSSSaJ5aYxSpyV9BrfcYs6HZWs2hYlBDW
YCYJmCIIr6DSDGEzoXxgZLaxgT1Tey1Dd4ibvvp/NatXvyNaV7ct0xAI9nCjbMY0
1EiaOvq8p6Kl9AnXjcIeXL6NpYehHRyZQ4A7V5CsKSUssgKRBtQz8AJrbMTC2nwB
m+l2NEaLkGNdMQ+bhmqNk7lOZPDrfXvqUuU6KwGKdK5ZSMfpGdSzzoHt4yw7X44w
2CoQ9riN0BgZI5Ri36N0pdZxlEB8kA==
=Ckzr
-----END PGP SIGNATURE-----

--f3kckhw255f5ljnt--
