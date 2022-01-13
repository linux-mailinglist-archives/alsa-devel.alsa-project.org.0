Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D96A948F5D9
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jan 2022 09:05:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79BDD1F19;
	Sat, 15 Jan 2022 09:05:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79BDD1F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642233951;
	bh=HA6xQGP3ltFrs/plLus3jdjhjQy9H4EJMcRYDsTwEgs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B+htKQpSWPkVstxUJZN99gU0mQ5L6M3mDlu6uVelIorSHGaC5GKefbe8ijmisvS75
	 3+uRlFkVmiIBRc1iqIMs5LnP48IM3l/rW/+RkpjqvDDJNnbsokVPc3MhsSO3vY+kHX
	 CPrSm/s87TPjI8V4G4UUs/8SgBWHtrMdRDR6RMyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA475F8051E;
	Sat, 15 Jan 2022 09:02:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 812ADF8013F; Thu, 13 Jan 2022 23:43:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23262F80054
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 23:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23262F80054
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n88oe-0007pY-PW; Thu, 13 Jan 2022 23:43:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n88oS-00A973-DR; Thu, 13 Jan 2022 23:43:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n88oR-0000VL-8T; Thu, 13 Jan 2022 23:43:19 +0100
Date: Thu, 13 Jan 2022 23:43:19 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] driver core: platform: Rename
 platform_get_irq_optional() to platform_get_irq_silent()
Message-ID: <20220113224319.akljsjtu7ps75vun@pengutronix.de>
References: <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <YeCI47ltlWzjzjYy@sirena.org.uk>
 <1df04d74-8aa2-11f1-54e9-34d0e8f4e58b@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7tuoe52njhyotvsc"
Content-Disposition: inline
In-Reply-To: <1df04d74-8aa2-11f1-54e9-34d0e8f4e58b@omp.ru>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Sat, 15 Jan 2022 09:02:46 +0100
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
 Zhang Rui <rui.zhang@intel.com>, Linux PWM List <linux-pwm@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Corey Minyard <minyard@acm.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sebastian Reichel <sre@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 platform-driver-x86@vger.kernel.org, Benson Leung <bleung@chromium.org>,
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


--7tuoe52njhyotvsc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2022 at 11:57:43PM +0300, Sergey Shtylyov wrote:
> On 1/13/22 11:17 PM, Mark Brown wrote:
>=20
> >> The subsystems regulator, clk and gpio have the concept of a dummy
> >> resource. For regulator, clk and gpio there is a semantic difference
> >> between the regular _get() function and the _get_optional() variant.
> >> (One might return the dummy resource, the other won't. Unfortunately
> >> which one implements which isn't the same for these three.) The
> >> difference between platform_get_irq() and platform_get_irq_optional() =
is
> >> only that the former might emit an error message and the later won't.
>=20
>    This is only a current difference but I'm still going to return 0 ISO
> -ENXIO from latform_get_irq_optional(), no way I'd leave that -ENXIO there
> alone... :-)

This would address a bit of the critic in my commit log. But as 0 isn't
a dummy value like the dummy values that exist for clk, gpiod and
regulator I still think that the naming is a bad idea because it's not
in the spirit of the other *_get_optional functions.

Seeing you say that -ENXIO is a bad return value for
platform_get_irq_optional() and 0 should be used instead, I wonder why
not changing platform_get_irq() to return 0 instead of -ENXIO, too.
This question is for now only about a sensible semantic. That actually
changing platform_get_irq() is probably harder than changing
platform_get_irq_optional() is a different story.

If only platform_get_irq_optional() is changed and given that the
callers have to do something like:

	if (this_irq_exists()):
		... (e.g. request_irq)
	else:
		... (e.g. setup polling)

I really think it's a bad idea that this_irq_exists() has to be
different for platform_get_irq() vs. platform_get_irq_optional().

> > Reviewed-by: Mark Brown <broonie@kernel.org>
>=20
>    Hm... I'm seeing a tag bit not seeing the patch itself...

See https://lore.kernel.org/all/20220113194358.xnnbhsoyetihterb@pengutronix=
=2Ede/

This is just a tree-wide
s/platform_get_irq_optional/platform_get_irq_silent/ + a macro to not
break callers of platform_get_irq_optional().

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7tuoe52njhyotvsc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHgqwMACgkQwfwUeK3K
7AlyrggAnnNuI35GvxF5VtWAxjQVEMBwQAZzFN2zmbCN56PVqEEi+hrB3o4qCrg5
RVngj3mJZBBvnB/EPzv0cg7FWq2/jPiopb8JGnPMf2HyN6pE6vQRw/vgdCAw1tSa
Z1uE/p+FA63qrrD0UrCjr+6bQaobnf20ljmXq6EmZ6oPXvcQLnTureudQD0YJdII
xZcTKIPC5wH7+yFedZzk1AovNre37jVzG74IzyB6Bbk4Jl22v8GJ8Nq3VUP7x2jE
Ps6AsNLRubU3vuJ1T43P8/yY0B7PRiyRHvXS+N/qCCf44UuRmpvKziXUP2vnspWR
9RIT5bkqqtknA+dRrLt/xWijFiViOQ==
=EM1y
-----END PGP SIGNATURE-----

--7tuoe52njhyotvsc--
