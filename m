Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9455748FBD6
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jan 2022 09:53:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43AB117BB;
	Sun, 16 Jan 2022 09:52:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43AB117BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642323213;
	bh=HT98Ukmb6Cc4L2JuE8akbWwATVT2lqMXmJBt11yti/4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b2+7tp4EIDeP+FrY7sB32npkYohUDkrZOPyv52y7JHJAF44qtEF7v1O/r+bOZVbp7
	 i8KBl5rElkC4//1FQSKwzhuancaNOphndXjWqANJEOLI5z9ouN17kfTlNEEMJktMUZ
	 LeRvkngAx1SEEnk14CRlNQ0edEi79yVvXwjOciKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42B89F8051B;
	Sun, 16 Jan 2022 09:50:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82DB4F801D8; Sat, 15 Jan 2022 19:37:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06F4BF80141
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 19:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F4BF80141
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8nvA-0003Jj-3l; Sat, 15 Jan 2022 19:37:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8nux-00AUOf-7m; Sat, 15 Jan 2022 19:36:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8nuv-0005gB-Q6; Sat, 15 Jan 2022 19:36:45 +0100
Date: Sat, 15 Jan 2022 19:36:43 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
 (summary)
Message-ID: <20220115183643.6zxalxqxrhkfgdfq@pengutronix.de>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="j6ppxzwmobiijznr"
Content-Disposition: inline
In-Reply-To: <20220110195449.12448-2-s.shtylyov@omp.ru>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Sun, 16 Jan 2022 09:50:50 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, kvm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, "David S. Miller" <davem@davemloft.net>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Robert Richter <rric@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Corey Minyard <minyard@acm.org>, linux-pm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Auger <eric.auger@redhat.com>,
 Takashi Iwai <tiwai@suse.com>, openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Richard Weinberger <richard@nod.at>,
 Mun Yew Tham <mun.yew.tham@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>,
 Sebastian Reichel <sre@kernel.org>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 netdev@vger.kernel.org
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


--j6ppxzwmobiijznr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to objectively summarize the discussions in this thread in
the hope this helps finding a way that most people can live with.

First a description of the status quo:

There are several function pairs *get() and *get_optional() that however
are different in various aspects. Their relevant properties are listes
in the following table. Ideally each line had only identical entries.

					| clk_get		| gpiod_get		| platform_get_irq	| regulator_get		|
	return value			|			|			|			|			|
	on not-found			| ERR_PTR(-ENOENT)	| ERR_PTR(-ENOENT)	| -ENXIO		| dummy[1]	=
	|
	(plain get)			|			|			|			|			|
					|			|			|			|			|
	return value			|			|			|			|			|
	on not-found			| dummy[1]		| dummy[1]		| -ENXIO		| ERR_PTR(-ENOENT)	|
	(get_optional)			|			|			|			|			|
					|			|			|			|			|
	emits an error message		|			|			|			|			|
	on error (including 		| no			| no			| yes[2]		| no			|
	not-found)			|			|			|			|			|
					|			|			|			|			|
	get_optional emits an error	|			|			|			|			|
	message on error (including	| no			| no			| no			| no			|
	not-found)			|			|			|			|			|
					|			|			|			|			|
	summary:			| returning a dummy	| returning a dummy	| doesn't emit an	| ret=
urning error code	|
	*_get_optional() differs from	| on not-found		| on not-found		| error mess=
age		| on not-found		|
	*_get by:			|			|			|			|			|


	[1] the dummy value is a valid resource descriptor, the API functions
	    are a noop for this dummy value. This dummy value is NULL for
	    all three subsystems.
	[2] no error is printed for -EPROBE_DEFER.

The inversion between clk+gpio vs. regulator is unforunate, swaping one
or the other would be good for consistency, but this isn't the topic of
this thread. Only so much: It's not agreed upon which variant is the
better one and the difference is of historical origin.

There are now different suggestions to improve the situation regarding
platform_get_irq() compared to the other functions:

a) by Sergey
   platform_get_irq_optional() is changed to return 0 on not-found.

b) by Uwe
   rename platform_get_irq_optional() to platform_get_irq_silent()

The argument pro a) is:

	platform_get_irq_optional() is aligned to clk_get() and
	gpiod_get() by returning 0 on not-found.

The argument contra a)=20

	The return value 0 for platform_get_irq() is only syntactically
	nearer to the dummy value of clk_get() and gpiod_get(). A dummy
	value isn't available and probably not sensible to introduce for
	irq because most drivers have to check for the not-found
	situation anyhow to setup polling.=20

The argument pro b) is:

	The relevant difference between platform_get_irq() and its
	optional variant is that the latter is silent. This is a
	different concept for the meaning of optional compared to the
	other *_get_optional().

The argument contra b) is:

	The chosen name is bad, because driver authors might wonder what
	a silent irq is.

---- end of summary
=09
A possible compromise: We can have both. We rename
platform_get_irq_optional() to platform_get_irq_silent() (or
platform_get_irq_silently() if this is preferred) and once all users are
are changed (which can be done mechanically), we reintroduce a
platform_get_irq_optional() with Sergey's suggested semantic (i.e.
return 0 on not-found, no error message printking).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--j6ppxzwmobiijznr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHjFDcACgkQwfwUeK3K
7Al8ywf+IeUGmQ++ZSqrHA1sy8iG93DkE7XqgEI+/OYaQABSzKpE6w55cBp0EbHJ
TXkVcUUkd5e6eFtr5FwZEgzO1/vKIlB6IkuD5jbuqXJy0oRz9whaVLAJvpYN/mmy
KTHzmFssgA4mbUBx8XRteoVSNn6k9z0UF6EGrb0Vyfu70Q4yTdZKDP2mznyAnLee
rw1Oj2UCu2Jn5QrSTg0jNrPqGbHrmEeadE08d3oZRpL/ZcO1Er30Oj3aYFDiiE1V
p0J5fzDs0GZN4r/mwNSUDyq2edsIF3F2/ILOt05pf6AsFudhufarTMh2VWIu/mz7
mMHkAm6dYTtw1VKd1mp/RwSpxhhJSw==
=6uea
-----END PGP SIGNATURE-----

--j6ppxzwmobiijznr--
