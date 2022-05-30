Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F545387C0
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 21:30:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAC691FB3;
	Mon, 30 May 2022 21:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAC691FB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653939001;
	bh=EICv3BODjKHt6CV/YJ3CCF6Ea2qlV7FoLJtAoFqLk28=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OUSWZ/u/WgpDNZzbkc3aL66Ujuez1DONuY5y4pMhalE2zxLvqemLMOMmbR8aNH+1V
	 nvzth5bWu324yvv8QooDgXJWFnpEaDWsIasECHz6A4JWIdcmmJRy0497CJlUFjWn/5
	 XVw9lwVXzb6BoWdegtLUJlT84CuDi7Qsr0X2f4WQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56346F801F5;
	Mon, 30 May 2022 21:29:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E85E4F8019D; Mon, 30 May 2022 21:28:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A85CF800DE
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 21:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A85CF800DE
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvl4K-00030f-Fk; Mon, 30 May 2022 21:28:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvl4J-005VdD-Vs; Mon, 30 May 2022 21:28:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvl4I-00D9sP-26; Mon, 30 May 2022 21:28:46 +0200
Date: Mon, 30 May 2022 21:28:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: da7219: Drop no-op remove function
Message-ID: <20220530192844.vt7odtc3tuu3h7ic@pengutronix.de>
References: <20220526204145.1725323-1-u.kleine-koenig@pengutronix.de>
 <20220530083616.xggbphc7ip7h2jr7@pengutronix.de>
 <YpTcBL2UoI8sSiUb@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dmnu44tmsirjbjwu"
Content-Disposition: inline
In-Reply-To: <YpTcBL2UoI8sSiUb@sirena.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org,
 Support Opensource <support.opensource@diasemi.com>, kernel@pengutronix.de,
 Liam Girdwood <lgirdwood@gmail.com>
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


--dmnu44tmsirjbjwu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 05:00:20PM +0200, Mark Brown wrote:
> On Mon, May 30, 2022 at 10:36:16AM +0200, Uwe Kleine-K=F6nig wrote:
>=20
> > This patch conflicts with 89be5dc60d67 ("ASoC: da[79]*: use simple i2c
> > probe function"), the trivial(?) conflict resolution is:
>=20
> > Please tell me if I should resend the patch rebased to
> > sound.git/for-next (or 5.19-rc1 once that's out). The same applies to:
> >=20
> > 	ASoC: lm49453: Drop no-op remove function
> > 	ASoC: da732x: Drop no-op remove function
> > 	ASoC: ak4642: Drop no-op remove function
>=20
> It'd be really handy if you could resend please.

OK, will do when 5.19-rc1 is out.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dmnu44tmsirjbjwu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKVGuoACgkQwfwUeK3K
7AmdWwf/atdNZAoXoAh+AJn8BMdLNu6NzZHBN+CuLzo8P4dDcFTPwLRcD5rQbsqM
p8OhTLf9RKTJ4yRiFzq+HkSay/JAJZmNVzO1y7dAZ41MD3lG8vJ9023vpR2BJXpw
wCESn6655BRuzXfsQyYUtLlZoSBWHC5zOhqF88szODVfzhrOk6CGmV6b/B9M6R+4
bdAlNRBuvd2WDbkRIk1J6PqUirXlZ8mNkmr+zGCKYIBBkQZWxyfafDhj1t8NxQQZ
dvG1tbCV3BZFBvkpYYOj94I72UlMrafN9tEgNNzIvGZ2kaJpkO9f6ucfCNqYaNGP
hc/jIcmSXZnIiHdIPtUc3S/9LVuy1Q==
=hOjT
-----END PGP SIGNATURE-----

--dmnu44tmsirjbjwu--
