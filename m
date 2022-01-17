Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 806604947D5
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:06:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F4CD2F16;
	Thu, 20 Jan 2022 08:06:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F4CD2F16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662413;
	bh=KahPkGd62HlpTNRwonxkqeMzwbhhlTVHUgDFV2XrfRA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BjzNUpikz7iu3hoEZxa0GT3ApW3k28c6y762sO0xGTQCDfd31/v5FQLUyr4CSDi8Z
	 CSzXrd3J/DWUbpmdOmPFz6FsQ/hp5s5y71ny1muajhPKt6IfM4hAne5RKAFtHgWnYh
	 LytYDk97h6yPWB4wMdck4TpV5D055Ac/3XddTrD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29B85F80529;
	Thu, 20 Jan 2022 08:03:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 513E8F800CE; Mon, 17 Jan 2022 10:25:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43E51F800CE
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 10:24:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43E51F800CE
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9OFv-0006KR-Ei; Mon, 17 Jan 2022 10:24:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9OFp-00AnDX-Gd; Mon, 17 Jan 2022 10:24:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9OFo-0002fs-6r; Mon, 17 Jan 2022 10:24:44 +0100
Date: Mon, 17 Jan 2022 10:24:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
References: <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
 <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
 <61b80939-357d-14f5-df99-b8d102a4e1a1@omp.ru>
 <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
 <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
 <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ycu5k3o6g2lyq6o4"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:03:34 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 Jiri Slaby <jirislaby@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tony Luck <tony.luck@intel.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sebastian Reichel <sre@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, platform-driver-x86@vger.kernel.org,
 Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, netdev@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
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


--ycu5k3o6g2lyq6o4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Geert,

On Mon, Jan 17, 2022 at 09:41:42AM +0100, Geert Uytterhoeven wrote:
> On Sat, Jan 15, 2022 at 9:22 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
> > On 1/14/22 11:22 PM, Uwe Kleine-K=F6nig wrote:
> > > You have to understand that for clk (and regulator and gpiod) NULL is=
 a
> > > valid descriptor that can actually be used, it just has no effect. So
> > > this is a convenience value for the case "If the clk/regulator/gpiod =
in
> > > question isn't available, there is nothing to do". This is what makes
> > > clk_get_optional() and the others really useful and justifies their
> > > existence. This doesn't apply to platform_get_irq_optional().
> >
> >    I do understand that. However, IRQs are a different beast with their
> > own justifications...
>=20
> > > clk_get_optional() is sane and sensible for cases where the clk might=
 be
> > > absent and it helps you because you don't have to differentiate betwe=
en
> > > "not found" and "there is an actual resource".
> > >
> > > The reason for platform_get_irq_optional()'s existence is just that
> > > platform_get_irq() emits an error message which is wrong or suboptimal
> >
> >    I think you are very wrong here. The real reason is to simplify the
> > callers.
>=20
> Indeed.

The commit that introduced platform_get_irq_optional() said:

	Introduce a new platform_get_irq_optional() that works much like
	platform_get_irq() but does not output an error on failure to
	find the interrupt.

So the author of 8973ea47901c81a1912bd05f1577bed9b5b52506 failed to
mention the real reason? Or look at
31a8d8fa84c51d3ab00bf059158d5de6178cf890:

	[...] use platform_get_irq_optional() to get second/third IRQ
	which are optional to avoid below error message during probe:
	[...]

Look through the output of

	git log -Splatform_get_irq_optional

to find several more of these.

Also I fail to see how a caller of (today's) platform_get_irq_optional()
is simpler than a caller of platform_get_irq() given that there is no
semantic difference between the two. Please show me a single
conversion from platform_get_irq to platform_get_irq_optional that
yielded a simplification.

So you need some more effort to convince me of your POV.

> Even for clocks, you cannot assume that you can always blindly use
> the returned dummy (actually a NULL pointer) to call into the clk
> API.  While this works fine for simple use cases, where you just
> want to enable/disable an optional clock (clk_prepare_enable() and
> clk_disable_unprepare()), it does not work for more complex use cases.

Agreed. But for clks and gpiods and regulators the simple case is quite
usual. For irqs it isn't.

And if you cannot blindly use the dummy, then you're not the targetted
caller of *_get_optional() and should better use *_get() and handle
-ENODEV explicitly.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ycu5k3o6g2lyq6o4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHlNdMACgkQwfwUeK3K
7AkbyQf/dzwfw39nzRfi8yss0CiqoAU/yS+7MsnZvnWGKQxcIojgK1OX/xdxiMKI
C4HnYtImt4dRHJdZDTL5+BWmwrkKo3ytJl8YRHBffgzQdKfAXOit1Pce623dbYvd
wKJedLR6H9VXuTa1ULEvTnC0cXupHaoxjvQbKkUhlz/PahrhX91+dNJcoWTB6eB2
YSb6MMcqwMFJ6y2P4pDKDoCf0RNjt8EzTKMWUdx1zcCrqT+wDzA0Ub0UvM7EpUXn
ziLd4JEC+3SxJZvr2Y8jPQUGb4RMr+Z20vfEOG154m+zZ5lZe7Pcp1ggo6wb+fZ9
qM6JVYjExAvA43UcTTna2uSeE/+nfA==
=gHVT
-----END PGP SIGNATURE-----

--ycu5k3o6g2lyq6o4--
