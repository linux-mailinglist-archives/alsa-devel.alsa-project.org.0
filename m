Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7339748DA24
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 15:51:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DA1E1F7D;
	Thu, 13 Jan 2022 15:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DA1E1F7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642085486;
	bh=Rl4cYWMV8h1J8XxpmCmzqZfaoBMwLhpNARBfd20DoT4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CnxEGl1L7XeHgnVX8oSZ7z2V4ihteMscZ8AJrbkUnB6QXF+G9SLdOIVxUsV1KHztE
	 mzWUU5wSlH/nOY4u6UCu6ONz68hUermCROP1DF3qnH7mATI9hcZvz/9WCdmoxMTx/N
	 1gSCK+3QS8z2nxX17yIxZI0IOrDXXSuw26SbC9T8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 011DEF8019B;
	Thu, 13 Jan 2022 15:49:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DBACF80054; Wed, 12 Jan 2022 22:45:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7DA9F80054
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 22:45:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7DA9F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Khszb13U"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83260B820E0;
 Wed, 12 Jan 2022 21:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6540C36AE5;
 Wed, 12 Jan 2022 21:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642023943;
 bh=Rl4cYWMV8h1J8XxpmCmzqZfaoBMwLhpNARBfd20DoT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Khszb13U1jmu+m7bsIzdnnnT1iCYGXg5GGE42/oJuMQsK9Yn6UuauPQmmihxCed8g
 I1F6FNxWdahiv8HObXLZ1MgG9aNbNh1vuWd5lPBPEE8jOf+os+a0Eg3ZNc61OeDpAd
 oG1pZPxuhBAj0VIDmNNIk5GiF3ZYFM98qq+jWT/t93oYg9ih3f230JowrUn42Y60WL
 bkt6CNPh+5WsNOS7M+9MpTJWTFF/zRWDIyY+MuNMqob1T2eWMhLpwtYRPlw8g7cffu
 gO+N6rZqa7cTguyMABuPC7x4dDwKst9lAVidnA7ik+1nWq+j4fbnhftwUHOLMDmzq6
 MQ+g/36gi+i7A==
Date: Wed, 12 Jan 2022 21:45:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <Yd9L9SZ+g13iyKab@sirena.org.uk>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
 <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bKSGz4pQDpFpvPus"
Content-Disposition: inline
In-Reply-To: <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
X-Cookie: Bridge ahead.  Pay troll.
X-Mailman-Approved-At: Thu, 13 Jan 2022 15:49:43 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
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
 Linux PM list <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Borislav Petkov <bp@alien8.de>,
 Eric Auger <eric.auger@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Richard Weinberger <richard@nod.at>,
 Mun Yew Tham <mun.yew.tham@intel.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 netdev@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>, Sebastian Reichel <sre@kernel.org>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
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


--bKSGz4pQDpFpvPus
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2022 at 10:31:21PM +0100, Uwe Kleine-K=F6nig wrote:
> On Wed, Jan 12, 2022 at 11:27:02AM +0100, Geert Uytterhoeven wrote:

(Do we really need *all* the CCs here?)

> That convinces me, that platform_get_irq_optional() is a bad name. The
> only difference to platform_get_irq is that it's silent. And returning
> a dummy irq value (which would make it aligned with the other _optional
> functions) isn't possible.

There is regulator_get_optional() which is I believe the earliest of
these APIs, it doesn't return a dummy either (and is silent too) - this
is because regulator_get() does return a dummy since it's the vastly
common case that regulators must be physically present and them not
being found is due to there being an error in the system description.
It's unfortunate that we've ended up with these two different senses for
_optional(), people frequently get tripped up by it.

> > To me it sounds much more logical for the driver to check if an
> > optional irq is non-zero (available) or zero (not available), than to
> > sprinkle around checks for -ENXIO. In addition, you have to remember
> > that this one returns -ENXIO, while other APIs use -ENOENT or -ENOSYS
> > (or some other error code) to indicate absence. I thought not having
> > to care about the actual error code was the main reason behind the
> > introduction of the *_optional() APIs.

> No, the main benefit of gpiod_get_optional() (and clk_get_optional()) is
> that you can handle an absent GPIO (or clk) as if it were available.

Similarly for the regulator API, kind of.

--bKSGz4pQDpFpvPus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHfS/QACgkQJNaLcl1U
h9BO/wf/X52fQIYQFCYJDsHS4pHQDXMDv8aCyyoEen4dO7d7t6fuflAYrOGj/MXP
UkHWhHmjH5EJrD5XQQmsOLQV5qXKD/mmvAuXQzNA/aUITdBah/r9xt3Y2nYb4+zR
Nm3ZzFmvTZVLATEdRt39LZxBwD/gCkwQpEd1tSBKsiNsq2k9eyGs6zff3Aj5xUzC
+9zfg/GCQOESdU+jRATqvdl69QGdA5N6dPgzgIQEtecGNmx02jn8bEqmaN0SX1NZ
zQXn1ChOAI4lWDhW4uAEnD4aF8hUN//xR2DiHIjNuGFgb7vTKdJgbI0iG2iH30Nm
zgsgo5YMgTHurpX6yL8pMaJC54r/Pg==
=MHmO
-----END PGP SIGNATURE-----

--bKSGz4pQDpFpvPus--
