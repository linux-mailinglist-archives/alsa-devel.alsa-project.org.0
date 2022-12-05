Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 575B16429A6
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 14:41:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1E91185C;
	Mon,  5 Dec 2022 14:41:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1E91185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670247714;
	bh=9BwwjWTjae5Sx6WsU/KbmXmPJ41/awjUpJ2CY0ac+cU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XpbtpgbjCIAT7ESY/N9HSkl9+UiET44V3NruTpynYdE9Od4Xo+ANtxWvvopmd4AZB
	 1MC1SJxQ9WFmYl/hSeZbcngfmnrvrWIvKV86+Jfr1jbgwfv7JHP25xMRlo+qtGJOwD
	 /bMpFvOOT/GQA1fz765hvb8fECYOfSQOuvBw1YfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9555BF80155;
	Mon,  5 Dec 2022 14:40:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A094F8014C; Mon,  5 Dec 2022 14:40:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE509F8014C
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 14:40:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE509F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EZmRIVHb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05AAD6112F;
 Mon,  5 Dec 2022 13:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DFDC433D6;
 Mon,  5 Dec 2022 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670247647;
 bh=9BwwjWTjae5Sx6WsU/KbmXmPJ41/awjUpJ2CY0ac+cU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EZmRIVHbtZRJc0+QMZtqYwUAQmn70Ns75jeMF1cB1JNVBI7mAlDM9S8EZgewtLcCb
 FaqpIrtmz/Uddf/COe12oW5Ey5/hCmgu/l/7fZRo9p154CDvVhQnBVK9bvPBVrR5ot
 fLH+9tGLDjsLG245yDa0Nu5FT9bLygFx1zeffwmmYhL53Akw3ZTg08oA1XMT/N1TvO
 6R6lKWAE1xGS2N98EO5ED7MiyEgRPg7nW+jQJovQw/ES805sd7yzjdhK0Sc2kGoKRe
 FJ4w/QsfviltVz8td+OdbRNndBSMbxlMuU7dItekPXhyJWSnZdwH8MZsb0IM7wPL4J
 oarJoec5LLagQ==
Date: Mon, 5 Dec 2022 13:40:41 +0000
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?77+977+977+977+977+977+9?= <s47.kang@samsung.com>
Subject: Re: [PATCH] ASoC: soc-compress: Reposition and add pcm_mutex
Message-ID: <Y4302Y5hnW6Ovf0a@sirena.org.uk>
References: <CGME20221205051742epcas2p4e4724276da916d308b9c1a4aaccca672@epcas2p4.samsung.com>
 <700072760.81670217603154.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HZAt4ZnEdryDGFUR"
Content-Disposition: inline
In-Reply-To: <700072760.81670217603154.JavaMail.epsvc@epcpadp3>
X-Cookie: If it ain't broke, don't fix it.
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.de, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 cpgs@samsung.com
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


--HZAt4ZnEdryDGFUR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 02:17:42PM +0900, =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD wrote:
> From 3f8fd1efedd77331d948b16a8e44ffa6cf0e811f Mon Sep 17 00:00:00 2001
>=20
> From: "s47.kang" <s47.kang@samsung.com>
>=20
> Date: Fri, 2 Dec 2022 18:32:35 +0900
>=20
> Subject: [PATCH] [COMMON] ASoC: soc-compress.c: Reposition and add
> pcm_mutex.
>=20
> =20
>=20
> If panic_on_warn is set and compress stream(DPCM) is started,

This mail is still really badly corrupted, it's got lots of blank lines
added, other whitespace damage and I think is word wrapped as well.

--HZAt4ZnEdryDGFUR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmON9NkACgkQJNaLcl1U
h9B3nwf9Ekwj79NULn2aFtyLRoJVSkRNrX6YxVsln2wTXvnzVWCxx6HouLIddquG
SAJ1cJdWCn5Skuht0T4Uyv8s937rWWI6U0SjMO2ltx8Ghho723byDKJy1apfj2/2
or8yIt2hrEP0InM80m9IpWHTAPWzHH52hIJmx0BzNIKuXurF+03aQ5zfOfiazYIR
DQRG5hC4igstH2yFkhE3C4T9x5Ss1iQ4PTMUwDYY/QHKGV/t0qnp7y2uKrNWq/nv
eedQ0Xsyz9H+/4Twz4/kHZrw5SswL3qHjp/GsqexRNXYn8qYEry+CaR34HUAcZ/W
lQGna+TgiNtx9zwUC+/i2wcuJciXiA==
=2hVZ
-----END PGP SIGNATURE-----

--HZAt4ZnEdryDGFUR--
