Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D754B48FBD2
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jan 2022 09:52:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86B48181C;
	Sun, 16 Jan 2022 09:51:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86B48181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642323157;
	bh=AA7saVf6zJw1lG19esy/Y/uEwsMutpwlGNv8dw9mZnk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qc87rmIQc/xiWq2P2M9/7bxOWiHZdBHNj1lxJSLjuWDS73QtSyT9uU8sqPpv4H4RD
	 gopop5xbBD4VOEXWo7R7U/2VpQduG/tDlXrDB9fB0HWpLHoNGVqH8aRk4LWSBoDlO0
	 ZrT8EFqO4EUhB+smlf0gwX81baYkNyajaUtoKcvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 583C0F804FF;
	Sun, 16 Jan 2022 09:50:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C21FCF801D8; Sat, 15 Jan 2022 14:56:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C05E5F800B0
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 14:56:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C05E5F800B0
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8jXL-0002tw-0F; Sat, 15 Jan 2022 14:56:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8jX9-00AS44-5C; Sat, 15 Jan 2022 14:55:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8jX8-0007NV-2Y; Sat, 15 Jan 2022 14:55:54 +0100
Date: Sat, 15 Jan 2022 14:55:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] driver core: platform: Rename
 platform_get_irq_optional() to platform_get_irq_silent()
Message-ID: <20220115135550.dr4ngiz2c6rfs2rl@pengutronix.de>
References: <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <745c601f-c782-0904-f786-c9bfced8f11c@gmail.com>
 <cae0b73e-46df-a491-4a8e-415205038c2c@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f7hnqfmertxedsgl"
Content-Disposition: inline
In-Reply-To: <cae0b73e-46df-a491-4a8e-415205038c2c@omp.ru>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Sun, 16 Jan 2022 09:50:50 +0100
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
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org,
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sebastian Reichel <sre@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Mun Yew Tham <mun.yew.tham@intel.com>,
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


--f7hnqfmertxedsgl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2022 at 08:55:07PM +0300, Sergey Shtylyov wrote:
> On 1/14/22 12:42 AM, Florian Fainelli wrote:
>=20
> >> The subsystems regulator, clk and gpio have the concept of a dummy
> >> resource. For regulator, clk and gpio there is a semantic difference
> >> between the regular _get() function and the _get_optional() variant.
> >> (One might return the dummy resource, the other won't. Unfortunately
> >> which one implements which isn't the same for these three.) The
> >> difference between platform_get_irq() and platform_get_irq_optional() =
is
> >> only that the former might emit an error message and the later won't.
> >>
> >> To prevent people's expectations that there is a semantic difference
> >> between these too, rename platform_get_irq_optional() to
> >> platform_get_irq_silent() to make the actual difference more obvious.
> >>
> >> The #define for the old name can and should be removed once all patches
> >> currently in flux still relying on platform_get_irq_optional() are
> >> fixed.
> >>
> >> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> [...]
> >>>> I think at least c) is easy to resolve because
> >>>> platform_get_irq_optional() isn't that old yet and mechanically
> >>>> replacing it by platform_get_irq_silent() should be easy and safe.
> >>>> And this is orthogonal to the discussion if -ENOXIO is a sensible re=
turn
> >>>> value and if it's as easy as it could be to work with errors on irq
> >>>> lookups.
> >>>
> >>> It'd certainly be good to name anything that doesn't correspond to one
> >>> of the existing semantics for the API (!) something different rather
> >>> than adding yet another potentially overloaded meaning.
> >>
> >> It seems we're (at least) three who agree about this. Here is a patch
> >> fixing the name.
> >=20
> > From an API naming perspective this does not make much sense anymore wi=
th the name chosen,
> > it is understood that whent he function is called platform_get_irq_opti=
onal(), optional applies
> > to the IRQ. An optional IRQ is something people can reason about becaus=
e it makes sense.
>=20
>    Right! :-)
>=20
> > What is a a "silent" IRQ however? It does not apply to the object it is=
 trying to fetch to
> > anymore, but to the message that may not be printed in case the resourc=
e failed to be obtained,
> > because said resource is optional. Woah, that's quite a stretch.
>=20
>    Right again! :-)

So you oppose to the name chosen, but not the renaming as such. I
already asked Florian if he has a better name, do you have a
constructive suggestion? What about platform_silently_get_irq? Or
platform_get_irq_silently?

Do you agree that it's unfortunate that platform_get_irq_optional() has a
different usage convention than clk_get_optional() and
gpiod_get_optional()?

Do you agree that the difference between platform_get_irq_optional() and
platform_get_irq() is only that one of them issues an error message and
the other doesn't?

Currently the return values of platform_get_irq_optional() and
platform_get_irq() are identical. Do you agree that any change to clean
up the return value convention of platform_get_irq_optional() also
would be sensible for platform_get_irq()?

Do you agree that changing the way how return values of
platform_get_irq_optional() have to be evaluated without adapting
platform_get_irq() in the same way, artifially breaks the releation
between these two functions?

> > Following the discussion and original 2 patches set from Sergey, it is =
not entirely clear to me
> > anymore what is it that we are trying to fix.
>=20
>    Andy and me tried to fix the platform_get_irq[_byname]_optional() valu=
e, corresponding to
> a missing (optional) IRQ resource from -ENXIO to 0, in order to keep the =
callers error code
> agnostic. This change completely aligns e.g. platform_get_irq_optional() =
with clk_get_optional()
> and gpiod_get_optional()...

Did you read and understand my objection? Yes, in the not found case the
return value is a 32-bit or 64-bit long zero value (0 or NULL) for these
functions. But for irqs you cannot treat that as an irq number. For clks
this works, and this is the fact that justifies the "optional" in the
name and that simplifies further handling without having to check if the
value returned by clk_get_optional corresponds to the dummy clk or a
real one. Just returning 0 for not-found doesn't justify "optional" in
the name. Or do you think kmalloc should better be called
kmalloc_optional because it returns NULL if there is no more memory
available?

The only thing you accomplish with returning 0 instead of -ENXIO is that
the check for this value in the callers has to be adapted. But as you
cannot handle 0 and a "normal" irq in the same way (i.e. pass it to
request_irq)=20

In my eyes error code agnostic isn't a sensible goal. If you ask for a
resource and it's not there and your driver can cope and this cannot be
done by just treating the returned value as a valid resource, making it
explicit that the error code for "not found" is handled is a good thing.
In my opinion it's not a good enough reason to change a function's
return conventions just that I can handle one of the various results
using

	if (ret =3D=3D 0)

instead of

	if (ret =3D=3D -ENXIO)

Also there is no justification to change the value for "not found" to
zero. The next developer might be annoyed by having to check for
-EPROBE_DEFER and wants to introduce a special function that behaves
like platform_get_irq, just returns 0 when platform_get_irq returns
-ENOENT.

>    Unforunately, we can't "fix" request_irq() and company to treat 0 as m=
issing IRQ -- they have
> to keep the ability to get called from the arch/ code (that doesn't use p=
latform_get_irq(), etc.

Note that even if request_irq would be a noop for 0, the biggest part of
the drivers wouldn't be done with request_irq(0, ...) because in the
absense of an irq something has to be done about it.

Oh my, I failed to not continue this discussion really badly. But I
really cannot stand people arguing for wrong things and ignoring my
reasoning completely. In case you feel the same way: I agree that -ENXIO
is the wrong value for not-found. But to change this wrong behaviour to
another wrong behaviour isn't an improvement.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--f7hnqfmertxedsgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHi0mMACgkQwfwUeK3K
7Amddgf+PmKRGQLDtBry7VN2oRWXZdUzzuAIgx1NWsToQxG+DPPhBPzvJI8wGllo
IEHdn0PUEUeGwwXpbUhOXLYVEigSsKjPe/4fa5ZayfbYBesFUxdJH5y2z0EulDSf
HP+O2TAOO7q2hHC22VsXFz6Bpngp7SU68WAnWg1xWixSyeG1WaeRu8R+4IWbop8L
57cwdmSi7dwrmNa5SPrk/i4hyME4FXuEKhMxamxDsCzicGkW/D+oZhxb+BKgzRns
8tusvopwtph9C4OL1zJU5ko4XcGVikLa6Ce0b5MvZDL2C+kHy8foUE4fZvStD2BL
hxKHRxYG75gvEVfG91W3qgwoRlxqxw==
=1KDd
-----END PGP SIGNATURE-----

--f7hnqfmertxedsgl--
