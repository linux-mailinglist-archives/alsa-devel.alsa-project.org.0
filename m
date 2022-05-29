Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44953712C
	for <lists+alsa-devel@lfdr.de>; Sun, 29 May 2022 15:52:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 107431929;
	Sun, 29 May 2022 15:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 107431929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653832331;
	bh=hpvVj1aEdAjQSjj2ru6JGQ0qyWEyhS8+Fb3je6JM8Bs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kBXt1MRw43vXfOw8Iog/UE/dHF9XyrDWbXS+rl8JGFaKnwJ6N7shRQvimhIOww1rZ
	 elzkVdmv3wolmpei1WPtAm78PgRBl57jx5KtvhKOEO4LzEqunCFxMW6XNtUWSBGWBM
	 t8R0sdFLwEqBA1BxB7fA2gK9I8p3G0wxgSl9cgjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 866B8F8010B;
	Sun, 29 May 2022 15:51:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53163F8024C; Sun, 29 May 2022 15:51:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 472E2F8010B
 for <alsa-devel@alsa-project.org>; Sun, 29 May 2022 15:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 472E2F8010B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvJJk-00042o-EK; Sun, 29 May 2022 15:50:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvJJe-005Gjx-4H; Sun, 29 May 2022 15:50:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvJJb-00CshO-QV; Sun, 29 May 2022 15:50:43 +0200
Date: Sun, 29 May 2022 15:50:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v3 11/15] ASoC: Intel: avs: Machine board registration
Message-ID: <20220529135039.dvw6kbffxqju452p@pengutronix.de>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
 <20220516101116.190192-12-cezary.rojewski@intel.com>
 <20220526162443.GA60418@roeck-us.net>
 <Yo+8hvwhvdx7tNGI@sirena.org.uk>
 <20220529054807.uuqpsnt3w6dwlzuj@pengutronix.de>
 <550c53c2-b638-d087-58af-4a1f30131237@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cfisxxyhd64hbztk"
Content-Disposition: inline
In-Reply-To: <550c53c2-b638-d087-58af-4a1f30131237@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 Mark Brown <broonie@kernel.org>, lma@semihalf.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 Guenter Roeck <linux@roeck-us.net>
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


--cfisxxyhd64hbztk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 29, 2022 at 03:24:48PM +0200, Cezary Rojewski wrote:
> On 2022-05-29 7:48 AM, Uwe Kleine-K=F6nig wrote:
> > Hello Mark,
> >=20
> > On Thu, May 26, 2022 at 06:44:38PM +0100, Mark Brown wrote:
>=20
> > > FWIW given how hard the 0-day reports have become to read I'd not rely
> > > on people paying attention to things that are clearly pure build
> > > coverage based off a 0-day report alone.
> >=20
> > I'm unsure if I understand your sentiment correctly. Are you saying it
> > doesn't matter if a patch breaks the build on some arch using a
> > randconfig?
> >=20
> > My position is: The commit under discussion (i.e. beed983621fb ("ASoC:
> > Intel: avs: Machine board registration")) breaks an allmodconfig build
> > on all platforms where __fls doesn't return a long int (i.e. arc, m68k,
> > and sparc). This actively hurts people who do build tests using
> > allmodconfig (or allyesconfig) for their patch series (e.g. me).
> >=20
> > I agree that some reports by the 0-day bot are hard to parse. But still,
> > if there is a build problem someone should look into that. If you (with
> > your maintainer hat on) don't have the resource to do that, that's IMHO
> > fine. But I'd wish you'd push back on the patch submitter in that case
> > and don't apply the patch until the problem is resolved. If this is a
> > corner case randconfig issue, applying might be fine despite the build
> > error but breaking allmodconfig on 3 archs is bad.
> >=20
> > The fix would be
>=20
>=20
> Hello Uwe,
>=20
> I don't believe anyone here wanted to break the build-configurations you =
did
> mention above. I also believe it's important to mention that below is not=
 a
> fix but a W/A. Developer should be able to use __fls() if required. Value
> returned by fls() differs from one returned by __fls(), and using fls() in
> below context is misleading (hurts the debug-ability).
>=20
> Yes, the faulty print should be devoid of __fls() until the function is
> fixed for all the archs. It's too late for that and I'm sorry for any
> inconvenience caused by the change.
> To my knowledge the real fix has been provided on LKML by Amadeo [1] and =
is
> under review since Friday. I'd kindly appreciate helping fix the root cau=
se
> of the problem. If there's anything missing in the series let us know.

Hmm, I doubt this (i.e. unify the return value of __fls) will be merged
during this cycle. I'd want that to cook a bit in next before it hits
mainline, there might be similar problems introduced by changing __fls
to the one under discussion here.

A more short-term fix would be:

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/bo=
ard_selection.c
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -325,8 +325,8 @@ static int avs_register_i2s_board(struct avs_dev *adev,=
 struct snd_soc_acpi_mach
  	num_ssps =3D adev->hw_cfg.i2s_caps.ctrl_count;
  	if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
 		dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%=
ld\n",
-			num_ssps, mach->drv_name, __fls(mach->mach_params.i2s_link_mask));
+			num_ssps, mach->drv_name, (unsigned long)__fls(mach->mach_params.i2s_li=
nk_mask));
  		return -ENODEV;
  	}

i.e. explicitly cast the return value of __fls to unsigned long.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cfisxxyhd64hbztk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKTeiwACgkQwfwUeK3K
7AnrvAf/fBk2Sy3ZnxwkntTnP1DDjf/QVmV88AJ3yQlX8mdMQ+UjGDgqqAcLBMJx
l+snszB1Z0teltgCnIsCDaE+5p1cpY7P+81y2KwerTwMY0/nYnzjvm5TtPiqj2Is
DMVCB9wK8FkLjAz3SsKCQ6JLCDq+pAhAAllPnckNGSLJNO3/QnV5+lqJYN1R6kmH
h7sonWOiesUQlLSSRt05QtCE4ns6ylUsmdHbGRFENcEgslTjkIYr7lhkjtl5j0vY
b4XO0vE2oRHu372o3NkmScMeb3g9a9A5aT0hqeOPjtZ9D7fhTjzEmKdBeujetwET
z39fJJTj+vlJ6dhKr65Vkua+1twepg==
=smqM
-----END PGP SIGNATURE-----

--cfisxxyhd64hbztk--
