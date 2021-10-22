Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A82043728B
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Oct 2021 09:14:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 985E0166F;
	Fri, 22 Oct 2021 09:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 985E0166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634886849;
	bh=2JsabZkAwIodc8EAeHuIwq5G9NPopFgxazEZB7ZlI2I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ScXvImsFg31N1TEbIsW8JFQqc6qXRwYsAvjwKS02KNWMpxcjOE9PBY/THD++0QfsS
	 dP/Sv/wPNhu2lnYef/rscNcOjcniiSdZiKvqOdqNo30dPbp3MmdjUMvpncDlvS6bKe
	 cLYSLJLwhbALY9RwAO2KvArOoBPjTGRl5lobrkUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1E86F8011C;
	Fri, 22 Oct 2021 09:12:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57F1EF80229; Fri, 22 Oct 2021 09:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D349F8011C
 for <alsa-devel@alsa-project.org>; Fri, 22 Oct 2021 09:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D349F8011C
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdojF-0006Fr-Jv; Fri, 22 Oct 2021 09:12:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdojD-0002gv-VM; Fri, 22 Oct 2021 09:12:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdojD-0006ZV-UR; Fri, 22 Oct 2021 09:12:35 +0200
Date: Fri, 22 Oct 2021 09:12:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: cs42l51: improve error handling in cs42l51_remove()
Message-ID: <20211022071217.462qrfutxvufqssc@pengutronix.de>
References: <20211021103627.70975-1-u.kleine-koenig@pengutronix.de>
 <YXGzkNEUpil9lsdh@sirena.org.uk>
 <20211021205839.mbknjtfwzkjf3brg@pengutronix.de>
 <YXHcTKSJoABKuJ7J@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="34xp72ufsep32gfp"
Content-Disposition: inline
In-Reply-To: <YXHcTKSJoABKuJ7J@sirena.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, kernel@pengutronix.de,
 James Schulman <james.schulman@cirrus.com>
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


--34xp72ufsep32gfp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2021 at 10:31:56PM +0100, Mark Brown wrote:
> On Thu, Oct 21, 2021 at 10:58:39PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Thu, Oct 21, 2021 at 07:38:08PM +0100, Mark Brown wrote:
>=20
> > > Realistically you'd have to really be trying to trigger an error here
> > > and it's most likely that the system is in enough trouble if one is
> > > triggered that it's just not worrying about.  I'm not sure how likely
> > > it is that anyone would ever remove one of these devices in production
> > > though.
>=20
> > So compared to my patch you'd just drop the warning?!
>=20
> The warning is fine so long as there's no action on it but use regular
> regulator_bulk_disable() since as you youself said force disable is not
> appropriate here.

It's just the documentation of regulator_bulk_force_disable() that
irritates me. It's behaviour is exactly fine. If a user of several
regulators goes away, it should try to disable all regulators and if one
fails to disable it's better to the others instead of keeping all
enabled.

But I didn't feel strong enough to continue to argue, my focus is a
different one. Will send a v2 with keeping regulator_bulk_disable().

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--34xp72ufsep32gfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFyZEcACgkQwfwUeK3K
7AlASwf/eP9vkh5J5GgYRdRuQ83L5JzOI0rS/t0OGWc6ZniH6h+KMaZVoUGo/Rdu
TkwSdfAs6bznxLSQC9PetWSaSI1A2Fk9ePWzbxdOW+wW8KoJud8jCjoKnVSBJYpR
5SrezjEIAtM9XJvm1Z+UEA8rFMTHQr0u8pniZKjiE4WPQz3k2lPv90rv3fiumRR+
1eNQdXYdcuz95/Qotx4jGddb/xjnxedTvC/ubbHgjHYPQiPreGwIJyxzM27KPUh1
dKmL2MBwos1qH0YacvLMBZ9a4Q4s6prJ62UPDnvXqvWIZ1eESk/T7wW4FO3mOjKE
E2KXTmNfCIneJmXiSlZX0TqntG/aGQ==
=LWK4
-----END PGP SIGNATURE-----

--34xp72ufsep32gfp--
