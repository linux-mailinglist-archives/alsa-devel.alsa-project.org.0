Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D3C536FCC
	for <lists+alsa-devel@lfdr.de>; Sun, 29 May 2022 07:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2AEF18A8;
	Sun, 29 May 2022 07:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2AEF18A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653803391;
	bh=V3PV9farmqViHBpIT0WtBAVLi4xinN2jhvewYSsvhDQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iCIkgBo1fJNIqcXqEaK+jicO/0O42T1bLqVomJBT7/9OfFXB6Scdd4MsQegA8t7JZ
	 oQHk0BRO53sZ2trf2vtccuQ0VfWH4DPBvfR9WhXItf0WY0foG7HEkdNX9ExAW+FcGg
	 yfgQuNNjcDxeWPsy+PmAUvPCnIGo+sxL5ntpX42Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E0F2F800DE;
	Sun, 29 May 2022 07:48:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1CD7F8024C; Sun, 29 May 2022 07:48:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD17DF800DE
 for <alsa-devel@alsa-project.org>; Sun, 29 May 2022 07:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD17DF800DE
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvBmt-0003MX-Id; Sun, 29 May 2022 07:48:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvBmm-005CW9-LR; Sun, 29 May 2022 07:48:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvBmk-00Cobx-M9; Sun, 29 May 2022 07:48:18 +0200
Date: Sun, 29 May 2022 07:48:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 11/15] ASoC: Intel: avs: Machine board registration
Message-ID: <20220529054807.uuqpsnt3w6dwlzuj@pengutronix.de>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
 <20220516101116.190192-12-cezary.rojewski@intel.com>
 <20220526162443.GA60418@roeck-us.net>
 <Yo+8hvwhvdx7tNGI@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nq7jzhs2oztkhuc2"
Content-Disposition: inline
In-Reply-To: <Yo+8hvwhvdx7tNGI@sirena.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 hdegoede@redhat.com, lma@semihalf.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, Guenter Roeck <linux@roeck-us.net>
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


--nq7jzhs2oztkhuc2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Mark,

On Thu, May 26, 2022 at 06:44:38PM +0100, Mark Brown wrote:
> On Thu, May 26, 2022 at 09:24:43AM -0700, Guenter Roeck wrote:
> > On Mon, May 16, 2022 at 12:11:12PM +0200, Cezary Rojewski wrote:
>=20
> > > +	if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
> > > +		dev_err(adev->dev, "Platform supports %d SSPs but board %s require=
s SSP%ld\n",
>=20
> >    sound/soc/intel/avs/board_selection.c: In function 'avs_register_i2s=
_board':
> > >> sound/soc/intel/avs/board_selection.c:328:36: warning: format '%ld' =
expects argument of type 'long int', but argument 5 has type 'int' [-Wforma=
t=3D]
> >      328 |                 dev_err(adev->dev, "Platform supports %d SSP=
s but board %s requires SSP%ld\n",
> >                                                                        =
                           ^^^
> > Reported by 0-day but still made it into mainline.
>=20
> FWIW given how hard the 0-day reports have become to read I'd not rely
> on people paying attention to things that are clearly pure build
> coverage based off a 0-day report alone.

I'm unsure if I understand your sentiment correctly. Are you saying it
doesn't matter if a patch breaks the build on some arch using a
randconfig?

My position is: The commit under discussion (i.e. beed983621fb ("ASoC:
Intel: avs: Machine board registration")) breaks an allmodconfig build
on all platforms where __fls doesn't return a long int (i.e. arc, m68k,
and sparc). This actively hurts people who do build tests using
allmodconfig (or allyesconfig) for their patch series (e.g. me).

I agree that some reports by the 0-day bot are hard to parse. But still,
if there is a build problem someone should look into that. If you (with
your maintainer hat on) don't have the resource to do that, that's IMHO
fine. But I'd wish you'd push back on the patch submitter in that case
and don't apply the patch until the problem is resolved. If this is a
corner case randconfig issue, applying might be fine despite the build
error but breaking allmodconfig on 3 archs is bad.

The fix would be=20

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/bo=
ard_selection.c
index 80cb0164678a..f189f71b8e1e 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -325,8 +325,8 @@ static int avs_register_i2s_board(struct avs_dev *adev,=
 struct snd_soc_acpi_mach
=20
 	num_ssps =3D adev->hw_cfg.i2s_caps.ctrl_count;
 	if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
-		dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%=
ld\n",
-			num_ssps, mach->drv_name, __fls(mach->mach_params.i2s_link_mask));
+		dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%=
d\n",
+			num_ssps, mach->drv_name, fls(mach->mach_params.i2s_link_mask));
 		return -ENODEV;
 	}
=20
which uses fls instead of __fls (as is done in the test triggering the
error). The former returns an int on all platforms.

Tell me if you don't want to squash this into beed983621fb and prefer a
formal patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nq7jzhs2oztkhuc2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKTCQ0ACgkQwfwUeK3K
7AmlOwf/RzQqWUGyVyl0g37Il66LFUEYoAR3iHZAynG+dtIZLmhySCzzVyEERIBo
8sEL/1rv6MAAU1wgoMJTqJax9i7YBWaCMgIPKUvmjTHieFWlxHABOqgOtrA3WUG9
4oFIb7ouPDKDy/xKXay6LdJ3bWVDh0H8ecxQJJQF5GR0MGq2trGCv/FYed/FVa3v
VyAiQLIk4kddn/e6A8syF/cKn35bMh2b+864L0JMFryX/qEfN3EW0JflWDVjqsn9
eU33mAkwW6iaYNcq1bgLsjiFdSVKgBVGsSV5snHr8UOEswLrZE+cQIAWtr0PzK1g
0/DAb+LvZVYZrV6RfvK9hF8eohdlfw==
=ENS4
-----END PGP SIGNATURE-----

--nq7jzhs2oztkhuc2--
