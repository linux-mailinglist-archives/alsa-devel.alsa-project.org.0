Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1E555584
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 22:52:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 478F71AFD;
	Wed, 22 Jun 2022 22:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 478F71AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655931123;
	bh=U2KfDcWKYZTTs5gVWS6sucOXmKGCGeZDWQLwssDotKI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lxisbiJMv5GOhXNEZucg37OTuSIvfxxawyVG0FASBOmXxjGI1vDvdQTUzOAOZODra
	 9r5DRkuDAiJhFBwvsN7hhfJuYB7zi+p5HT1e0Jen2NFT0Dx7DrKC2c5RidAA0gkl+3
	 BhdKizWOAPHEAM3XrPqSOq+h8H7fxuPLhx6UM//k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C11A3F8032D;
	Wed, 22 Jun 2022 22:51:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60F3EF802D2; Wed, 22 Jun 2022 22:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FDF2F80118
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 22:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FDF2F80118
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o47JN-0005K4-Cg; Wed, 22 Jun 2022 22:50:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o47JI-0026iw-H6; Wed, 22 Jun 2022 22:50:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o47JJ-000UkV-9R; Wed, 22 Jun 2022 22:50:49 +0200
Date: Wed, 22 Jun 2022 22:50:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: core: Make snd_soc_unregister_card() return void
Message-ID: <20220622205046.by5jnrql6psaev3u@pengutronix.de>
References: <20220621145834.198519-1-u.kleine-koenig@pengutronix.de>
 <165591900215.1405752.6651339800557082462.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="swdrglnjzdf6gyr2"
Content-Disposition: inline
In-Reply-To: <165591900215.1405752.6651339800557082462.b4-ty@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 lgirdwood@gmail.com, nicolas.ferre@microchip.com, linmq006@gmail.com,
 tiwai@suse.com, kernel@pengutronix.de, codrin.ciubotariu@microchip.com,
 claudiu.beznea@microchip.com, linux-arm-kernel@lists.infradead.org
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


--swdrglnjzdf6gyr2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2022 at 06:30:02PM +0100, Mark Brown wrote:
> On Tue, 21 Jun 2022 16:58:34 +0200, Uwe Kleine-K=F6nig wrote:
> > The function snd_soc_unregister_card() returned 0 unconditionally and m=
ost
> > callers don't care to check the return value. Make it return void and
> > adapt the callers that didn't ignore the return value before.
> >=20
> > This is a preparation for making platform remove callbacks return void.
> >=20
> >=20
> > [...]
>=20
> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next

Did you see the kernel bot report with the build issue? It doesn't make
allmodconfig fail for me (that's why I didn't notice the issue). I'm
looking into it.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--swdrglnjzdf6gyr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKzgKMACgkQwfwUeK3K
7AkFIQf9F51ZPWL+5WGdzzEkQegR++jDKOVwfZEPYAEeGNtGEtd98Rrnu6JZ4+dS
3HxU+MlQRiSKK3uasLTAOjo8ETwUN6ES3ELyHHtjhQmpKLqbJZT8R+/U5FwONFgs
VEatPW2tPO8syRTTj71uXMiYL/5d0pldz94RFcJwjAZ3gY1YeymhePL533Qg3Hnb
hjngqkTJOWNOGJBy6Qx2L8274IHBWukbdDlIPY49tAOxTovc3fNb3AhH8+27w65D
VrfC28H2TLBjPrW0C5ZY8X+sCDAVgiJ5O6JFCZ6MHSiu5cldemGPvA19+HFN3feb
2w2MbFaC2tTHLbZa0CiOLTNAQ7TMkg==
=wEcH
-----END PGP SIGNATURE-----

--swdrglnjzdf6gyr2--
