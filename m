Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E48BF31200A
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 21:44:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 780B71692;
	Sat,  6 Feb 2021 21:43:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 780B71692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612644248;
	bh=PeoYsJ7CZYGcm+mosRqwPtVn9m2ZqwXKncaow3iNmJA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a796vnjLMjpq6ly3GW14MsgsGrNh94/e+TLXeXdTQmpveKo6qmqSHD8DQkWy3udJ8
	 x0DOqu8Ef698IJKXNvk0oxzg93F4avFm3wPUpspF0aoVv5akg2imQN3PpwgcO9yuzM
	 9a09QS6jt6jxFWX76ZolbJUcIPU8aJThkT/c9L/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C709EF804E1;
	Sat,  6 Feb 2021 21:39:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52976F8015A; Fri,  5 Feb 2021 11:57:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 598FBF800C0
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 11:57:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 598FBF800C0
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l7ymj-00035C-2Q; Fri, 05 Feb 2021 11:56:21 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l7ymd-0004Fb-NN; Fri, 05 Feb 2021 11:56:15 +0100
Date: Fri, 5 Feb 2021 11:56:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <20210205105615.qumu45huvntf2v4j@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
 <YBlcTXlxemmC2lgr@kroah.com>
 <20210204165224.GA1463@shell.armlinux.org.uk>
 <YBwnUrQqlAz2LDPI@kroah.com>
 <20210204165951.GB1463@shell.armlinux.org.uk>
 <20210204181551.ethtuzm65flujmwe@pengutronix.de>
 <20210205093744.kr4rc7yvfiq6wimq@pengutronix.de>
 <YB0baUzgvpd+EoO6@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vslstwmibba5nymi"
Content-Disposition: inline
In-Reply-To: <YB0baUzgvpd+EoO6@kroah.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Sat, 06 Feb 2021 21:39:09 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-watchdog@vger.kernel.org,
 linux-rtc@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Takashi Iwai <tiwai@suse.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Mike Leach <mike.leach@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Vladimir Zapolskiy <vz@mleia.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-crypto@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
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


--vslstwmibba5nymi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 11:18:17AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Feb 05, 2021 at 10:37:44AM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello Russell, hello Greg,
> >=20
> > On Thu, Feb 04, 2021 at 07:15:51PM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Thu, Feb 04, 2021 at 04:59:51PM +0000, Russell King - ARM Linux ad=
min wrote:
> > > > On Thu, Feb 04, 2021 at 05:56:50PM +0100, Greg Kroah-Hartman wrote:
> > > > > On Thu, Feb 04, 2021 at 04:52:24PM +0000, Russell King - ARM Linu=
x admin wrote:
> > > > > > On Tue, Feb 02, 2021 at 03:06:05PM +0100, Greg Kroah-Hartman wr=
ote:
> > > > > > > I'm glad to take this through my char/misc tree, as that's wh=
ere the
> > > > > > > other coresight changes flow through.  So if no one else obje=
cts, I will
> > > > > > > do so...
> > > > > >=20
> > > > > > Greg, did you end up pulling this after all? If not, Uwe produc=
ed a v2.
> > > > > > I haven't merged v2 yet as I don't know what you've done.
> > > > >=20
> > > > > I thought you merged this?
> > > >=20
> > > > I took v1, and put it in a branch I've promised in the past not to
> > > > rebase/rewind. Uwe is now asking for me to take a v2 or apply a pat=
ch
> > > > on top.
> > > >=20
> > > > The only reason to produce an "immutable" branch is if it's the bas=
is
> > > > for some dependent work and you need that branch merged into other
> > > > people's trees... so the whole "lets produce a v2" is really odd
> > > > workflow... I'm confused about what I should do, and who has to be
> > > > informed which option I take.
> > > >=20
> > > > I'm rather lost here too.
> > >=20
> > > Sorry to have cause this confusion. After I saw that my initial tag
> > > missed to adapt a driver I wanted to make it easy for you to fix the
> > > situation.
> > > So I created a patch to fix it and created a second tag with the patch
> > > squashed in. Obviously only one of them have to be picked and I hoped
> > > you (=3D Russell + Greg) would agree which option to pick.
> > >=20
> > > My preference would be if you both pick up v2 of the tag to yield a
> > > history that is bisectable without build problems, but if Russell (who
> > > already picked up the broken tag) considers his tree immutable and so
> > > isn't willing to rebase, then picking up the patch is the way to go.
> >=20
> > OK, the current state is that Russell applied the patch fixing
> > drivers/mailbox/arm_mhuv2.c on top of merging my first tag.
> >=20
> > So the way forward now is that Greg pulls
> >=20
> > 	git://git.armlinux.org.uk/~rmk/linux-arm.git devel-stable
> >=20
> > which currently points to=20
> >=20
> > 	860660fd829e ("ARM: 9055/1: mailbox: arm_mhuv2: make remove callback r=
eturn void")
> >=20
> > , into his tree that contains the hwtracing changes that conflict with =
my
> > changes. @Greg: Is this good enough, or do you require a dedicated tag
> > to pull that?
> >=20
> > I think these conflicting hwtracing changes are not yet in any of Greg's
> > trees (at least they are not in next).
> >=20
> > When I pull
> >=20
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git ne=
xt
> >=20
> > (currently pointing to 4e73ff249184 ("coresight: etm4x: Handle accesses
> > to TRCSTALLCTLR")) into 860660fd829e, I get a conflict in
> > drivers/hwtracing/coresight/coresight-etm4x-core.c as expected. My
> > resolution looks as follows:
>=20
> Ok, my resolution looked a bit different.
>=20
> Can you pull my char-misc-testing branch and verify I got this all
> pulled in correctly?

minor side-note: mentioning the repo url would have simplified that test.

I looked at

	https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-=
misc-testing

commit 0573d3fa48640f0fa6b105ff92dcb02b94d6c1ab now.

I didn't compile test, but I'm willing to bet your resolution is wrong.
You have no return statement in etm4_remove_dev() but its return type is
int and etm4_remove_amba() still returns int but should return void.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vslstwmibba5nymi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAdJEwACgkQwfwUeK3K
7AkhPggAk0ucNSGkkTWYbQF9BBYOZDKVlqvPHzvkMilvBGuAa1EXhuHHKu3esHxh
NZf5xH5Lh7cnNyXodWF4Mp20NZfV0VFjzhbfNFexDfO2QfKJhJbATh9YiJ5onzsT
cbMDvw+fQNUmooGN1gOW4OCiRvEPcYf8Z/TdrAkBXuRDaCYLiqJBPX1PCFTumEr3
8Lxp3+k4zN9Wpkt17sqmgJxalvUHqNFOuL+1II2APrzMSZHB6T5fNtxEzMXUGXHx
LzNGWjnnUKovRddHUyjFZu+rr6B/MUELKSYf9WH7lPI6osLnyjQf6vtczDdyZmlP
PmCOMN9d1QJAKEMe6RJZvyfO22d11w==
=kmsA
-----END PGP SIGNATURE-----

--vslstwmibba5nymi--
