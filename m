Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D979B568D22
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 17:33:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17FE9AE9;
	Wed,  6 Jul 2022 17:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17FE9AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657121626;
	bh=DJ9+NqxBcuvZz3dY8V0W9IB2BN2TLB0l+pBZ9L2UV1s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fYYN9Octy+TaVU3ziHsoTTjueOiLFIwZKBYc/IryfyaO7N8VEDLwvd3muYdt8IMwF
	 5Nfjlfg2eH8b3h5R9WvdEBlqFOgZdvnWcXrSfoxmuwyFK+B1ngP9O2iAYdxn5ILpiN
	 W79EEfbVA03lG9ayplbUkvpLsmlHWZ/HTfs2g5Ck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BD29F800C5;
	Wed,  6 Jul 2022 17:32:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8193CF8023A; Wed,  6 Jul 2022 17:32:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2C84F800C5
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 17:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2C84F800C5
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o9710-0000da-6u; Wed, 06 Jul 2022 17:32:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o970v-004mkj-2S; Wed, 06 Jul 2022 17:32:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o970x-003NkV-Ki; Wed, 06 Jul 2022 17:32:31 +0200
Date: Wed, 6 Jul 2022 17:32:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: Emit useful error messages in .remove()
Message-ID: <20220706153230.xndfljxypav5dvt3@pengutronix.de>
References: <20220705063613.93770-1-u.kleine-koenig@pengutronix.de>
 <87k08rf8no.wl-kuninori.morimoto.gx@renesas.com>
 <20220706062611.73m4cwsxtl5mm32m@pengutronix.de>
 <87fsjeg2s7.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c3r3wlx2gkeggr67"
Content-Disposition: inline
In-Reply-To: <87fsjeg2s7.wl-kuninori.morimoto.gx@renesas.com>
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


--c3r3wlx2gkeggr67
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jul 06, 2022 at 06:42:49AM +0000, Kuninori Morimoto wrote:
> > The motivation of my patch is to make the remove function return 0 and
> > the eventual goal is to make the remove callback return void.
> > The difference today between returning 0 and returning an error is only
> > that the core emits an error message in the error case. In both cases
> > the device is removed. See drivers/base/platform.c:platform_remove().
>=20
> Ah, OK.  Because of "remove" funciton.
> Sorry, I was misunderstanding about it.
>=20
> Thank you for your help !!

Is this an ack now? :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--c3r3wlx2gkeggr67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLFqwsACgkQwfwUeK3K
7Akcnwf/eFQdhpldmOdyYBTRAV9o6kfnrFATHncmwBqj50SajjaufB0/MaBP8uUA
4gwmVtbcoMVEqztNnqD+3mEDR3uBrbJJXSvyl4twxJv935E3yYJ0V+2d9uI/DR1d
qqgvi1VJ4oyTpy71SwXRmRTdKYWZS3drsUGgPwUSgMw+EOfQ4SsCbTSKwpRTLAJ7
edwHRvNm53OunSBXiR8DYObcPPBiu74IzYDxx4qamojqH6J6NQM7PtGArqGqQgdS
g+hQDI8SeHU4x6d7w75kUbvaYBEqp03hW4stXKFIBR0lzFW6wGviQTsNFhqizZ7W
k8rM8YSLPcr2Sve+Ukv7/VxQhlMdmA==
=r72s
-----END PGP SIGNATURE-----

--c3r3wlx2gkeggr67--
