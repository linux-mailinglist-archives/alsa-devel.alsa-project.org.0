Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B7B312008
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 21:43:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 024FF1699;
	Sat,  6 Feb 2021 21:42:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 024FF1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612644201;
	bh=i5DLsJFUYYomiL9ywquq7IGkCco/4Kr96eFi7HdmNn4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HVx41ySBlJGEVsGIoOaEMKi+QByUKsW1qBgSMRjRJGZI5xyJeOJyKD6XNFcUwAT8m
	 FL1zlTCGlqzZanoC0El3qb55yebjFV9j+iG46jq6luKM05+n4S9Ts5KJljwPpQ8L9T
	 IJxhO+sHMxuyfjDTJuGWzL9izlJ0587bLcnE/p5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BE4AF804D8;
	Sat,  6 Feb 2021 21:39:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D591F8015A; Fri,  5 Feb 2021 10:38:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B95F4F80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 10:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B95F4F80139
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l7xYm-0002y5-Rk; Fri, 05 Feb 2021 10:37:52 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l7xYf-0000Uu-2W; Fri, 05 Feb 2021 10:37:45 +0100
Date: Fri, 5 Feb 2021 10:37:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <20210205093744.kr4rc7yvfiq6wimq@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
 <YBlcTXlxemmC2lgr@kroah.com>
 <20210204165224.GA1463@shell.armlinux.org.uk>
 <YBwnUrQqlAz2LDPI@kroah.com>
 <20210204165951.GB1463@shell.armlinux.org.uk>
 <20210204181551.ethtuzm65flujmwe@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dwvdydyqhaortnqv"
Content-Disposition: inline
In-Reply-To: <20210204181551.ethtuzm65flujmwe@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Sat, 06 Feb 2021 21:39:08 +0100
Cc: alsa-devel@alsa-project.org, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Mike Leach <mike.leach@linaro.org>, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 Vladimir Zapolskiy <vz@mleia.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
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


--dwvdydyqhaortnqv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Russell, hello Greg,

On Thu, Feb 04, 2021 at 07:15:51PM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Feb 04, 2021 at 04:59:51PM +0000, Russell King - ARM Linux admin =
wrote:
> > On Thu, Feb 04, 2021 at 05:56:50PM +0100, Greg Kroah-Hartman wrote:
> > > On Thu, Feb 04, 2021 at 04:52:24PM +0000, Russell King - ARM Linux ad=
min wrote:
> > > > On Tue, Feb 02, 2021 at 03:06:05PM +0100, Greg Kroah-Hartman wrote:
> > > > > I'm glad to take this through my char/misc tree, as that's where =
the
> > > > > other coresight changes flow through.  So if no one else objects,=
 I will
> > > > > do so...
> > > >=20
> > > > Greg, did you end up pulling this after all? If not, Uwe produced a=
 v2.
> > > > I haven't merged v2 yet as I don't know what you've done.
> > >=20
> > > I thought you merged this?
> >=20
> > I took v1, and put it in a branch I've promised in the past not to
> > rebase/rewind. Uwe is now asking for me to take a v2 or apply a patch
> > on top.
> >=20
> > The only reason to produce an "immutable" branch is if it's the basis
> > for some dependent work and you need that branch merged into other
> > people's trees... so the whole "lets produce a v2" is really odd
> > workflow... I'm confused about what I should do, and who has to be
> > informed which option I take.
> >=20
> > I'm rather lost here too.
>=20
> Sorry to have cause this confusion. After I saw that my initial tag
> missed to adapt a driver I wanted to make it easy for you to fix the
> situation.
> So I created a patch to fix it and created a second tag with the patch
> squashed in. Obviously only one of them have to be picked and I hoped
> you (=3D Russell + Greg) would agree which option to pick.
>=20
> My preference would be if you both pick up v2 of the tag to yield a
> history that is bisectable without build problems, but if Russell (who
> already picked up the broken tag) considers his tree immutable and so
> isn't willing to rebase, then picking up the patch is the way to go.

OK, the current state is that Russell applied the patch fixing
drivers/mailbox/arm_mhuv2.c on top of merging my first tag.

So the way forward now is that Greg pulls

	git://git.armlinux.org.uk/~rmk/linux-arm.git devel-stable

which currently points to=20

	860660fd829e ("ARM: 9055/1: mailbox: arm_mhuv2: make remove callback retur=
n void")

, into his tree that contains the hwtracing changes that conflict with my
changes. @Greg: Is this good enough, or do you require a dedicated tag
to pull that?

I think these conflicting hwtracing changes are not yet in any of Greg's
trees (at least they are not in next).

When I pull

	https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git next

(currently pointing to 4e73ff249184 ("coresight: etm4x: Handle accesses
to TRCSTALLCTLR")) into 860660fd829e, I get a conflict in
drivers/hwtracing/coresight/coresight-etm4x-core.c as expected. My
resolution looks as follows:

diff --cc drivers/hwtracing/coresight/coresight-etm4x-core.c
index 82787cba537d,5017d33ba4f5..000000000000
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@@ -1703,6 -1906,28 +1906,27 @@@ static int __exit etm4_remove_dev(struc
  	cpus_read_unlock();
 =20
  	coresight_unregister(drvdata->csdev);
+=20
+ 	return 0;
+ }
+=20
 -static int __exit etm4_remove_amba(struct amba_device *adev)
++static void __exit etm4_remove_amba(struct amba_device *adev)
+ {
+ 	struct etmv4_drvdata *drvdata =3D dev_get_drvdata(&adev->dev);
+=20
+ 	if (drvdata)
 -		return etm4_remove_dev(drvdata);
 -	return 0;
++		etm4_remove_dev(drvdata);
+ }
+=20
+ static int __exit etm4_remove_platform_dev(struct platform_device *pdev)
+ {
+ 	int ret =3D 0;
+ 	struct etmv4_drvdata *drvdata =3D dev_get_drvdata(&pdev->dev);
+=20
+ 	if (drvdata)
+ 		ret =3D etm4_remove_dev(drvdata);
+ 	pm_runtime_disable(&pdev->dev);
+ 	return ret;
  }
 =20
  static const struct amba_id etm4_ids[] =3D {

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dwvdydyqhaortnqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAdEeUACgkQwfwUeK3K
7Ane0Qf9H0OwQL3TRduboeQKbgkaD83Bg/PYQdMDZUa5dVcE0RU0HyCLlq9GoMuz
KrRmhln3aYFhE4V9gj+XxGnEwOjL33RzaKsx19Z3dt8Pr8nNrL/vuZnyAMaA5vTZ
0EqjJssY68yu0JIKUorjKKUUA2mbDP7Go8cLatIepLPN8TIK9kSO3LXxPp1YvBqk
gSxN/QtokRPZIfXz3AJLBLWYVnTTIv0UEomfkkOnfattTycwKhpMwAxdvLjAUoXw
LOjVyp/jJ2dF6tM7oivKXffLZ2/w1i88cLU4JloNlRIqW+QNgWN+yKANQhPEYYzA
1gxRAaLiMaiyEYmYSpsVZyRDdzWUBw==
=YQY8
-----END PGP SIGNATURE-----

--dwvdydyqhaortnqv--
