Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB4074EBB
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:02:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 428061AFC;
	Thu, 25 Jul 2019 15:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 428061AFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564059727;
	bh=F6LM0IQSff15GRllNK/eX9Nt36BuZ0FIUInewsHaoNE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qxbTHnJwTH6XU5XYL4tLRLshX7TVKsphfcHFwP7QJErjCekeaFQplKmU5rUJzs8Xt
	 i1+G97/eOLcrLFBCgfjqRK+MjF2QpV8gg//4BDmQcvbMZVvDkUWH8SU8HqTjBrNI1R
	 spVLxZ2TVv0BLiI9VatsbQLLk42tQ/E1DF2lSpRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61E85F803D0;
	Thu, 25 Jul 2019 15:00:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B2D7F803D0; Thu, 25 Jul 2019 15:00:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93134F800F5
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93134F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ntrHtbgT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cwFiHQ+8lVnRhkC8EwJXQy9RvFDx6GKVTnbtr172hKw=; b=ntrHtbgTrK5RrFAcAKNPtbEk3
 hmGXUqTzSj2WgIAxbRXdUcV+DuGJBu9t7rYLai2X11kbG5uggytpi7YflTWu8UsY3LqosdntXd3Wu
 1u8GqHV3tp6ykZ/SPq7OJ41vTJZnTEClmjCK8dyUsirsOJOYox59O+WG+UEWLn9xVTTzs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqdM1-0002p8-II; Thu, 25 Jul 2019 13:00:17 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 06E062742B52; Thu, 25 Jul 2019 14:00:16 +0100 (BST)
Date: Thu, 25 Jul 2019 14:00:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20190725130016.GC4213@sirena.org.uk>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
 <20190724162405.6574-2-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20190724162405.6574-2-jbrunet@baylibre.com>
X-Cookie: Jenkinson's Law:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/6] ASoC: codec2codec: run callbacks in
	order
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
Content-Type: multipart/mixed; boundary="===============5557081429918496920=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5557081429918496920==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2019 at 06:24:00PM +0200, Jerome Brunet wrote:
> When handling dai_link events on codec to codec links, run all .startup()
> callbacks on sinks and sources before running any .hw_params(). Same goes
> for hw_free() and shutdown(). This is closer to the behavior of regular
> dai links

This looks good but needs rebasing against -next due to Morimoto-san's
recent DAI changes:

  CC      sound/soc/soc-dapm.o
sound/soc/soc-dapm.c: In function =E2=80=98snd_soc_dai_link_event=E2=80=99:
sound/soc/soc-dapm.c:3857:10: error: implicit declaration of function =E2=
=80=98soc_dai_hw_params=E2=80=99; did you mean =E2=80=98snd_soc_dai_hw_para=
ms=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    ret =3D soc_dai_hw_params(&substream, params, source);
          ^~~~~~~~~~~~~~~~~
          snd_soc_dai_hw_params

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl05p+AACgkQJNaLcl1U
h9AP+gf+KYWXJgB5nW6jPKjIT4VghTppSU3QuuCdZrhY/sNBJSzzMz6wo1IPyz97
fyMJDcDemoa6wbn2EdzxffFQKt7DlKNs8fNe1TSu6SaQaITcI5iGYaeeQ0U+t1ps
bydYObp41RlNN66PWCqoObTjwrtmbT4KjZt6VVD/rpUA+TYVaT4lAlC43lYdGOwS
s1U3cqK0UhnJ2tl7ijvp1GbohlH7hG+STTgSwMVHjnqTvDAnLJrQ7aXO4U39m4mc
GKQ2VtknUOXH4SmQ/HCyLdKOHXSv2fWdEMSeD65MBUxRnfW9ivMoQabStIA39rk9
m1xUbylnxDjw8hciPEbmbsQapqiavg==
=HgG8
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--

--===============5557081429918496920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5557081429918496920==--
