Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 975CE312007
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 21:43:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AD4C1680;
	Sat,  6 Feb 2021 21:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AD4C1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612644189;
	bh=GaVlfy0h/QqNLdOlfFxMw+mqAGbSkyT8mgIF0e3mUDE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YTaY1Pcr4c15ISO2roDubVfqwokfuii+VSzQhCS6A45KQv/HHXJZXEcxEixV6SLO+
	 IFizpmhQHgWV35Of+CrVzdu1L5igPFld3PVRRwehI9lw3Gd+FW29qU60EPvZl6fIAv
	 dYMlWjfrYCROBddTgHY/asy/eu3NJBacXQss6qMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71311F80430;
	Sat,  6 Feb 2021 21:39:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C746CF80171; Thu,  4 Feb 2021 19:16:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC3CFF80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 19:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC3CFF80152
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l7jAm-0002WQ-TD; Thu, 04 Feb 2021 19:16:08 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l7jAV-0005Pi-Pr; Thu, 04 Feb 2021 19:15:51 +0100
Date: Thu, 4 Feb 2021 19:15:51 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <20210204181551.ethtuzm65flujmwe@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
 <YBlcTXlxemmC2lgr@kroah.com>
 <20210204165224.GA1463@shell.armlinux.org.uk>
 <YBwnUrQqlAz2LDPI@kroah.com>
 <20210204165951.GB1463@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mw66hszyvu2hxhxe"
Content-Disposition: inline
In-Reply-To: <20210204165951.GB1463@shell.armlinux.org.uk>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Sat, 06 Feb 2021 21:39:08 +0100
Cc: linux-fbdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 kvm@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-watchdog@vger.kernel.org, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzk@kernel.org>, David Airlie <airlied@linux.ie>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Mike Leach <mike.leach@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Vladimir Zapolskiy <vz@mleia.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Leo Yan <leo.yan@linaro.org>,
 dmaengine@vger.kernel.org
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


--mw66hszyvu2hxhxe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2021 at 04:59:51PM +0000, Russell King - ARM Linux admin wr=
ote:
> On Thu, Feb 04, 2021 at 05:56:50PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Feb 04, 2021 at 04:52:24PM +0000, Russell King - ARM Linux admi=
n wrote:
> > > On Tue, Feb 02, 2021 at 03:06:05PM +0100, Greg Kroah-Hartman wrote:
> > > > I'm glad to take this through my char/misc tree, as that's where the
> > > > other coresight changes flow through.  So if no one else objects, I=
 will
> > > > do so...
> > >=20
> > > Greg, did you end up pulling this after all? If not, Uwe produced a v=
2.
> > > I haven't merged v2 yet as I don't know what you've done.
> >=20
> > I thought you merged this?
>=20
> I took v1, and put it in a branch I've promised in the past not to
> rebase/rewind. Uwe is now asking for me to take a v2 or apply a patch
> on top.
>=20
> The only reason to produce an "immutable" branch is if it's the basis
> for some dependent work and you need that branch merged into other
> people's trees... so the whole "lets produce a v2" is really odd
> workflow... I'm confused about what I should do, and who has to be
> informed which option I take.
>=20
> I'm rather lost here too.

Sorry to have cause this confusion. After I saw that my initial tag
missed to adapt a driver I wanted to make it easy for you to fix the
situation.
So I created a patch to fix it and created a second tag with the patch
squashed in. Obviously only one of them have to be picked and I hoped
you (=3D Russell + Greg) would agree which option to pick.

My preference would be if you both pick up v2 of the tag to yield a
history that is bisectable without build problems, but if Russell (who
already picked up the broken tag) considers his tree immutable and so
isn't willing to rebase, then picking up the patch is the way to go.

I suggest that Russell descides which option he wants to pick and tells
Greg to do the same!?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mw66hszyvu2hxhxe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAcOdQACgkQwfwUeK3K
7AlatwgAoTySm2q5g+gxl/CCA9C6tYko2Pu8wLkL3YfNBIgf05iOJ9G8Miwhd95G
eDv5Ue6LEvHVOMZHbbZMliKzacCtSGzzhTpNpIcL7SZH/Vu0nyB8qGbN+PAm+rsX
K54DEaOvyPIcDUkuXgUGC2e0nXjg7499oDQs/rajEADbs8ECpDvKCTRYczmQ6E8v
VS9a/GOt/WDa0dqOdAt6OfxirahLKjPQC1/FS1kcREk1QBYbH6TqM/t8b4t0ED9p
A5RYkSHAXArD/ifkinbRDUIhLY7XzhBYGEiiNgwCCtsbHE06GP/BNPlXMj6+fLAY
g/wGBoyP1j9OrCrpGDnsy/oyv64XRg==
=Rv8c
-----END PGP SIGNATURE-----

--mw66hszyvu2hxhxe--
