Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 877DC536FD6
	for <lists+alsa-devel@lfdr.de>; Sun, 29 May 2022 08:06:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26D2318DC;
	Sun, 29 May 2022 08:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26D2318DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653804392;
	bh=2Pp4RfRSiZFFeBldeG/sWA8r5tNyuW5QfKXZin9/xNM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FGzEsvJt6gAWcpS/Cs4H8x2xxAuYoGCxkLcGMhnzTcXUSkpvxmBYw7OPaSlT6sEET
	 Z2f0dMdnAQamrAzdVCqs9K+WqVWOZww5MdipXGZwcadAiooR6r8gbwHKWfgMH4kKdW
	 yICjVUElNCqWNRVjbNzgvUd0r5Gyzf8KRa3G3U4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D13BF8010B;
	Sun, 29 May 2022 08:05:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56777F8024C; Sun, 29 May 2022 08:05:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54EBFF8010B
 for <alsa-devel@alsa-project.org>; Sun, 29 May 2022 08:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54EBFF8010B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvC37-0005FG-O6; Sun, 29 May 2022 08:05:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvC30-005CXz-Vi; Sun, 29 May 2022 08:05:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvC2z-00Coe8-2E; Sun, 29 May 2022 08:05:05 +0200
Date: Sun, 29 May 2022 08:05:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: avs: Fix build error on arc, m68k and sparc
Message-ID: <20220529060503.av7cahnu3knhnord@pengutronix.de>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
 <20220516101116.190192-12-cezary.rojewski@intel.com>
 <20220526162443.GA60418@roeck-us.net>
 <Yo+8hvwhvdx7tNGI@sirena.org.uk>
 <20220529054807.uuqpsnt3w6dwlzuj@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2eqnaaipl3lapl35"
Content-Disposition: inline
In-Reply-To: <20220529054807.uuqpsnt3w6dwlzuj@pengutronix.de>
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


--2eqnaaipl3lapl35
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On some platforms (i.e. arc, m68k and sparc) __fls returns an int (while
on most platforms it returns an unsigned long). This triggers a format
warning on these few platforms as the driver uses %ld to print a warning.

Replace it by fls (and %d) which returns an int everywhere and which is
already used in the if condition triggering the warning.

Fixes: beed983621fb ("ASoC: Intel: avs: Machine board registration")
Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
---
Hello again

On Sun, May 29, 2022 at 07:48:18AM +0200, Uwe Kleine-K=F6nig wrote:
> Tell me if you don't want to squash this into beed983621fb and prefer a
> formal patch.

I just realized this isn't a problem in next only any more, but the
commit is already in Linus Torvald's tree. So I guess this isn't fixed
by a fixup of said commit and here comes a proper patch.

 sound/soc/intel/avs/board_selection.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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

base-commit: beed983621fbdfd291e6e3a0cdc4d10517e60af8
--=20
2.36.1

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2eqnaaipl3lapl35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKTDQwACgkQwfwUeK3K
7Angvwf9GvXsD9wzUFoXu5qYRWfBrMl8YDhQQERueJl/VMg4Y3/zxv+gFvbwb1Nn
O3aNyONk3MKwYMFW2xgE2MIgl4+/uKmgnukGtM839ojI7Z5wPRSnxobiX2qHb3ev
MprS+k1p9sAnYRO5wnItept03MO//YUstGv8VsC6DTae6+XxeBQLz+akMzDX+vFz
B6pCUtG98vtaaEwaX7Zfej4lZeVSYe8w/TPgR/H3Y+jDcMtpFUbpKaQpUOwPzWhS
vnpSVthjDqnkqrZoiBkE2ClcPYWzsKde2qiNYpBJUcXEAT5ZceQ9AtYAIEQoKjsT
n0GQzQs4Fm/EmYo+thDx823uXUO8Hw==
=TAeh
-----END PGP SIGNATURE-----

--2eqnaaipl3lapl35--
