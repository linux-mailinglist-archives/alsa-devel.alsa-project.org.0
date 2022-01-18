Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC94947E3
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:08:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A64AA2FB5;
	Thu, 20 Jan 2022 08:07:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A64AA2FB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662528;
	bh=4hqV9JC5wUHUEbX9o4LzTMMXP+VybskaeOyNZ2DQE4A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MpQvL4MkP/LhvUh6Jz264CnoO4uWvhiLseNnDUBqN21e5u/0o7ySqoKkZ6bgdL420
	 g0DhfIOONbnPjpqARyuYumBmFj4nJDmi8WHSJHRUn6nHP+6cTI8yQ9a0LjAHP2vLqL
	 R9PXNzvbCIxA3hWviDp5VWLwPK9MDFAe+lxPH46I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BEBFF8055A;
	Thu, 20 Jan 2022 08:03:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFFCFF8023B; Tue, 18 Jan 2022 10:09:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3882FF80100
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 10:09:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3882FF80100
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9kUa-0004vq-CT; Tue, 18 Jan 2022 10:09:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9kUO-00AyFG-5e; Tue, 18 Jan 2022 10:09:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9kUN-0002sb-15; Tue, 18 Jan 2022 10:09:15 +0100
Date: Tue, 18 Jan 2022 10:09:13 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <20220118090913.pjumkq4zf4iqtlha@pengutronix.de>
References: <61b80939-357d-14f5-df99-b8d102a4e1a1@omp.ru>
 <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
 <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
 <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
 <20220117092444.opoedfcf5k5u6otq@pengutronix.de>
 <CAMuHMdUgZUeraHadRAi2Z=DV+NuNBrKPkmAKsvFvir2MuquVoA@mail.gmail.com>
 <20220117114923.d5vajgitxneec7j7@pengutronix.de>
 <CAMuHMdWCKERO20R2iVHq8P=BaoauoBAtiampWzfMRYihi3Sb0g@mail.gmail.com>
 <20220117170609.yxaamvqdkivs56ju@pengutronix.de>
 <CAMuHMdXbuZqEpYivyS6hkaRN+CwTOGaHq_OROwVAWvDD6OXODQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bm2t43tlpbmr2x5i"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXbuZqEpYivyS6hkaRN+CwTOGaHq_OROwVAWvDD6OXODQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:03:35 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 linux-spi <linux-spi@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 platform-driver-x86@vger.kernel.org,
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Richard Weinberger <richard@nod.at>,
 Mun Yew Tham <mun.yew.tham@intel.com>, Eric Auger <eric.auger@redhat.com>,
 netdev <netdev@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>,
 Sebastian Reichel <sre@kernel.org>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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


--bm2t43tlpbmr2x5i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Geert,

On Tue, Jan 18, 2022 at 09:25:01AM +0100, Geert Uytterhoeven wrote:
> On Mon, Jan 17, 2022 at 6:06 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Mon, Jan 17, 2022 at 02:08:19PM +0100, Geert Uytterhoeven wrote:
> > > On Mon, Jan 17, 2022 at 12:49 PM Uwe Kleine-K=F6nig
> > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > So there are three reasons: because the absence of an optional IRQ
> > > > > is not an error, and thus that should not cause (a) an error code
> > > > > to be returned, and (b) an error message to be printed, and (c)
> > > > > because it can simplify the logic in device drivers.
> > > >
> > > > I don't agree to (a). If the value signaling not-found is -ENXIO or=
 0
> > > > (or -ENODEV) doesn't matter much. I wouldn't deviate from the return
> > > > code semantics of platform_get_irq() just for having to check again=
st 0
> > > > instead of -ENXIO. Zero is then just another magic value.
> > >
> > > Zero is a natural magic value (also for pointers).
> > > Errors are always negative.
> > > Positive values are cookies (or pointers) associated with success.
> >
> > Yeah, the issue where we don't agree is if "not-found" is special enough
> > to deserve the natural magic value. For me -ENXIO is magic enough to
> > handle the absence of an irq line. I consider it even the better magic
> > value.
>=20
> It differs from other subsystems (clk, gpio, reset), which do return
> zero on not found.

IMHO it doesn't matter at all that the return value is zero, relevant is
the semantic of the returned value. For clk, gpio, reset and regulator
NULL is a usable dummy, for irqs it's not. So what you do with the value
returned by platform_get_irq_whatever() is: you compare it with the
(magic?) not-found value, and if it matches, you enter a suitable
if-block.

For the (clk|gpiod|regulator)_get_optional() you don't have to check
against the magic not-found value (so no implementation detail magic
leaks into the caller code) and just pass it to the next API function.
(And my expectation would be that if you chose to represent not-found by
(void *)66 instead of NULL, you won't have to adapt any user, just the
framework internal checks. This is a good thing!)

> What's the point in having *_optional() APIs if they just return the
> same values as the non-optional ones?

The upside is that functions with a similar name have similar semantics.
But I agree, having platform_get_irq_optional() with the same return
value for not-found is bad. Changing the return semantic is only one way
to cope with that, renaming such the actual semantic difference is
obvious from the function name is another (IMHO better one).=20

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bm2t43tlpbmr2x5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHmg7YACgkQwfwUeK3K
7Amhogf/dAjmJCBciWgz5NV3TfnJ8zBdFusKYKkLMRX6hggDS981lVDd/+0J/CXt
OTZ/mg6pMVEdM4ZgmE7oLUUXSj26rQAXG0Tn0LElJNjNi2w6+jApwXacf1NIrjdY
xuNSbiN94DwWHsG5fgK6ij9XQ1Y0VM23PBPhfBFJUBh2uwTWa/N2akSLPpO4xpcI
qRk9h8QiaRxs+68qmLL5RA1wkp7oyAigMEUcgBr3qUFhTdSGAENP2ZWfgy1ONoFr
ajWgfvPfJ0DAwLiGwyrLebtzFgmd1NwSqNEVsBLdDSkGDq1ysDF6kccVIYnJmWdD
ioq82+vTregbKeZC6dz5wBLZ/E1KSA==
=u/8Z
-----END PGP SIGNATURE-----

--bm2t43tlpbmr2x5i--
