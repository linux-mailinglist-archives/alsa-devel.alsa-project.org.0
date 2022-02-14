Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DC34B8441
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:29:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EE9B193D;
	Wed, 16 Feb 2022 10:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EE9B193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003776;
	bh=OZQotG2gk6XR2xq4LV3A0pVU/7/HCxZ9/9J7y2cTzcg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y8h+vSybCNaGYMevSb8r6QwB2Dk5gW0R9HYtX3Zle1eQ0bEdH4kX0g6vXJTHy3iLc
	 BYT1h673KGH5+lshHcnN43LaR6Q5RNH6Pzi0JWGuaLh55uyXZucq7fhu4kra90AfUm
	 uo3W4DBT3yQQkMB9dDDl+NnI9hUk59Pn4YghtP9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 285A0F80549;
	Wed, 16 Feb 2022 10:25:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 334F4F80310; Mon, 14 Feb 2022 14:56:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66E63F8012F
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 14:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66E63F8012F
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJbqA-0006T5-AI; Mon, 14 Feb 2022 14:56:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJbq0-00GYf6-Ms; Mon, 14 Feb 2022 14:56:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJbpy-0038Nh-VX; Mon, 14 Feb 2022 14:56:18 +0100
Date: Mon, 14 Feb 2022 14:56:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <20220214135618.kdiikxi3j4j4erks@pengutronix.de>
References: <20220212201631.12648-1-s.shtylyov@omp.ru>
 <20220212201631.12648-2-s.shtylyov@omp.ru>
 <20220214071351.pcvstrzkwqyrg536@pengutronix.de>
 <YgorLXUr8aT+1ttv@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="woc7fbustut2ntcm"
Content-Disposition: inline
In-Reply-To: <YgorLXUr8aT+1ttv@smile.fi.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Wed, 16 Feb 2022 10:25:43 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, kvm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, linux-spi@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, openipmi-developer@lists.sourceforge.net,
 Peter Korsgaard <peter@korsgaard.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-pwm@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Zha Qipeng <qipeng.zha@intel.com>,
 Corey Minyard <minyard@acm.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, John Garry <john.garry@huawei.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, platform-driver-x86@vger.kernel.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Oleksij Rempel <linux@rempel-privat.de>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
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


--woc7fbustut2ntcm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Mon, Feb 14, 2022 at 12:13:01PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 14, 2022 at 08:13:51AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Sat, Feb 12, 2022 at 11:16:30PM +0300, Sergey Shtylyov wrote:
> > > This patch is based on the former Andy Shevchenko's patch:
> > >=20
> > > https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko=
@linux.intel.com/
> > >=20
> > > Currently platform_get_irq_optional() returns an error code even if I=
RQ
> > > resource simply has not been found.  It prevents the callers from bei=
ng
> > > error code agnostic in their error handling:
> > >=20
> > > 	ret =3D platform_get_irq_optional(...);
> > > 	if (ret < 0 && ret !=3D -ENXIO)
> > > 		return ret; // respect deferred probe
> > > 	if (ret > 0)
> > > 		...we get an IRQ...
> > >=20
> > > All other *_optional() APIs seem to return 0 or NULL in case an optio=
nal
> > > resource is not available.  Let's follow this good example, so that t=
he
> > > callers would look like:
> > >=20
> > > 	ret =3D platform_get_irq_optional(...);
> > > 	if (ret < 0)
> > > 		return ret;
> > > 	if (ret > 0)
> > > 		...we get an IRQ...
> > >=20
> > > Reported-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> >=20
> > While this patch is better than v1, I still don't like it for the
> > reasons discussed for v1. (i.e. 0 isn't usable as a dummy value which I
> > consider the real advantage for the other _get_optional() functions.)
>=20
> I think you haven't reacted anyhow to my point that you mixing apples and
> bananas together when comparing this 0 to the others _optional APIs.

Is this a question to me or Sergey?

I fully agree, when the 0 of platform_get_irq_optional is an apple and
the NULL of gpio_get_optional is a banana, I doubt "All other
*_optional() APIs seem to return 0 or NULL in case an optional resource
is not available.  Let's follow this good example, [...]".

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--woc7fbustut2ntcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIKX38ACgkQwfwUeK3K
7AnLpgf9EdBYBZTRjJVoNGFFTEqmmhehKa4KFk5v/UfvgXZenr00B/u2K/MHO4lF
HHazTdjZ6XfXR0zlckqQaisXEU2TXb/YxxUC3K7hBgh1k2dtS14XlUQHbh2zQXQI
HKw3Yitn6vDghQH9WkSROTJNBOvMg3PcAg8i5h8g17e0D9BI5sdJERnMTFNeMzpz
cY95lA6BqyVoJn2GW+QxAKYiYCMB5CSNw3yIxV8nd8CKPKMUQNt4aX4EFwglsJKP
dB7ddBCRW0+mJcywV7mjkU7B7q6hTtPyAkNBQrWYtaAY4xcsIH7E2T64AaNc4Rah
C/iCiRD7LGScn9QG72fV+C+upY3/gg==
=VmOP
-----END PGP SIGNATURE-----

--woc7fbustut2ntcm--
