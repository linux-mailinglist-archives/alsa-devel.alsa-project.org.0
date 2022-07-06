Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3D3567E52
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 08:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C0801622;
	Wed,  6 Jul 2022 08:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C0801622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657088846;
	bh=6y/rCkWWSn3N2phBGsrlMfQNgmVfs7piPLSNN1/z6Ns=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V4TzE/7+ef8Hlw4cCrHmngJK+PVKozq/p23PpMbKLFYbGj9gJGjoqYWJm1KbRSFoY
	 mHaezy9HFzcCYXYIBbi+bNWAw1XIB6fIN94SY7qNuv/ADzSfNKvhezv2cp/aC65KkL
	 pnzg1G+EyZbfhepJFXFop1GnhJ0On+FvjMUJtZ4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACD83F8012A;
	Wed,  6 Jul 2022 08:26:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBCC3F8023A; Wed,  6 Jul 2022 08:26:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4551F80104
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 08:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4551F80104
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8yUK-0005LQ-Gk; Wed, 06 Jul 2022 08:26:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8yUF-004hzb-Mv; Wed, 06 Jul 2022 08:26:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8yUI-003IyZ-Dr; Wed, 06 Jul 2022 08:26:14 +0200
Date: Wed, 6 Jul 2022 08:26:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: Emit useful error messages in .remove()
Message-ID: <20220706062611.73m4cwsxtl5mm32m@pengutronix.de>
References: <20220705063613.93770-1-u.kleine-koenig@pengutronix.de>
 <87k08rf8no.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3cn7unq6trxdz6ol"
Content-Disposition: inline
In-Reply-To: <87k08rf8no.wl-kuninori.morimoto.gx@renesas.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Liam Girdwood <lgirdwood@gmail.com>, kernel@pengutronix.de
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


--3cn7unq6trxdz6ol
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2022 at 11:21:20PM +0000, Kuninori Morimoto wrote:
>=20
> Hi Uwe
>=20
> Thank you for your patch
>=20
> >  	for_each_rsnd_dai(rdai, priv, i) {
> > -		ret |=3D rsnd_dai_call(remove, &rdai->playback, priv);
> > -		ret |=3D rsnd_dai_call(remove, &rdai->capture, priv);
> > +		int ret;
> > +
> > +		ret =3D rsnd_dai_call(remove, &rdai->playback, priv);
> > +		if (ret)
> > +			dev_warn(&pdev->dev, "Failed to remove playback dai #%d\n", i);
> > +
> > +		ret =3D rsnd_dai_call(remove, &rdai->capture, priv);
> > +		if (ret)
> > +			dev_warn(&pdev->dev, "Failed to remove capture dai #%d\n", i);
> >  	}
> > =20
> >  	for (i =3D 0; i < ARRAY_SIZE(remove_func); i++)
> >  		remove_func[i](priv);
> > =20
> > -	return ret;
> > +	return 0;
> >  }
>=20
> I think we want to get return error ?

The motivation of my patch is to make the remove function return 0 and
the eventual goal is to make the remove callback return void.
The difference today between returning 0 and returning an error is only
that the core emits an error message in the error case. In both cases
the device is removed. See drivers/base/platform.c:platform_remove().
=20
> The reason why it was using |=3D is that it should call all function
> without break even though it was error

It's right to call all cleanup functions also if some of them fail. But
returning an error is useless.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3cn7unq6trxdz6ol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLFKwAACgkQwfwUeK3K
7AlRcwf/Y2lRzKmAVDV60aqWsVYGynHByWv0WNdlYTEbjlGVocgCpz6loBbzXiB1
vpABHrsYi0+ysFhZyTxN46eLPwIz49yzmJM166CFMsWrmHOiYfPteNf1UlSC3Plh
IAyGGovyA7cC0q+2g6AVGmqxWz7kneGHySRmz7OEAuzfLeriFOdUb8PRRUl8mPwt
TCKZfbDY9kqK1ifeoK9eU4p5z3Mvc51yXzej/U4MmCMU97vh91EbiJKjRS5SDSoS
zrHB5PWFnOUj900tGD1EBNImz4mSMbnsoZsTme3MSSS8HLGbk/5rQGV3wuQomMeR
DwBzt5ndw6vXYao0XKuJOZIjRliO5A==
=x0Tk
-----END PGP SIGNATURE-----

--3cn7unq6trxdz6ol--
