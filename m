Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B160A436C62
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Oct 2021 23:00:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 216A91685;
	Thu, 21 Oct 2021 22:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 216A91685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634850016;
	bh=BLJtZTHYlHlvkkSH89cbP4RtrSj8GuddDYj2EO2G9Qw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EE7ZQ6A6k2Yv+vSBitTPlqmtRveV5wKh404HSd9/gbp5GgPzxclja39abGILXArcG
	 DhnMBniBpAnl8JQcOdi94ZP6ku0vXrkQwZgSIuZiAo8fC+o/6qztWFcbej4tO7cwcV
	 aPiu0XQrokcTUU5ZmdWUAT/kyIHs6fVRF4xKbZ5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CB33F80246;
	Thu, 21 Oct 2021 22:58:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FF99F80240; Thu, 21 Oct 2021 22:58:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA193F80155
 for <alsa-devel@alsa-project.org>; Thu, 21 Oct 2021 22:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA193F80155
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdf97-00041R-KR; Thu, 21 Oct 2021 22:58:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdf95-0001VG-Bj; Thu, 21 Oct 2021 22:58:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdf95-0003zH-Am; Thu, 21 Oct 2021 22:58:39 +0200
Date: Thu, 21 Oct 2021 22:58:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: cs42l51: improve error handling in cs42l51_remove()
Message-ID: <20211021205839.mbknjtfwzkjf3brg@pengutronix.de>
References: <20211021103627.70975-1-u.kleine-koenig@pengutronix.de>
 <YXGzkNEUpil9lsdh@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bstx6uze62smomjj"
Content-Disposition: inline
In-Reply-To: <YXGzkNEUpil9lsdh@sirena.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, kernel@pengutronix.de,
 David Rhodes <david.rhodes@cirrus.com>
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


--bstx6uze62smomjj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2021 at 07:38:08PM +0100, Mark Brown wrote:
> On Thu, Oct 21, 2021 at 12:36:27PM +0200, Uwe Kleine-K=F6nig wrote:
>=20
> > a bit unsure if regulator_bulk_force_disable() is indeed the right
> > function here, its documentation specifies a different usecase.
>=20
> > My motivation for this change was to make it obvious in
> > cs42l51_i2c_remove() that there is no error to handle to eventually make
> > i2c remove callbacks return void, too.
>=20
> It would be better to just ignore the errors on disable.=20

Yeah, and part of this is if regulator #1 fails to disable still disable
regulators #2 and #3. (I don't know how many there are.) That was why I
picked regulator_bulk_force_disable() which has this behaviour.

> Realistically you'd have to really be trying to trigger an error here
> and it's most likely that the system is in enough trouble if one is
> triggered that it's just not worrying about.  I'm not sure how likely
> it is that anyone would ever remove one of these devices in production
> though.

So compared to my patch you'd just drop the warning?!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bstx6uze62smomjj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFx1HwACgkQwfwUeK3K
7AkGrQf9EH5LjK1NQrgnEEsXYd2KNyLCtcM1AvXwTLHcoVUstYvUlJdXfU+GurG8
QGLR5QTIYQx2wckdYVrnl5Jcx2EEnZPC8kUlwh6Uf96cscpLmTUsd5TuXpshywo5
N1VeD0XVpASFm3nDqRFD/VSM+eQ/aXtl/iY11mv6Av8JV/WHnqFqXabx1SPJRf7H
YO9fStfnQH2uvhDqx+Ec8RsZbpHAUmHp+J8DL+jiAADU4Qz64qbCuWmvgmuZbAF8
PeY4CGwDeQmOL1bpQD8jyPtswRD4MtzWaKduI8ZDnb+lsVJ1xEo6gzHUQ5ZzOgBU
Q9Lg3Dd5UZi1DWnbIS5vEMoJ6jOgjg==
=RFel
-----END PGP SIGNATURE-----

--bstx6uze62smomjj--
