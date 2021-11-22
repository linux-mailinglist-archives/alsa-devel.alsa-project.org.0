Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96684459025
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Nov 2021 15:23:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1980A84A;
	Mon, 22 Nov 2021 15:23:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1980A84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637591036;
	bh=WKzltYKcWxxR0C3ceu4znEwrAGhBPzs0S1yq2paT+UY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kMYm/xQvNXBGqy/60nDEJxr6kRwCAcMbBfq9OUdxS9eblDUKVcgcikEc8Jv6nY6Fe
	 sfcP6qccYtAvM0Xy3/BwIDJZBt8loCzxDYSKmdABxRjgBZbM7AeoUrj8aDI61H0ET1
	 WBuct2WHBFqGPknBBHlfJCrT2yzhHcgyXe5LQPjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 940CDF80245;
	Mon, 22 Nov 2021 15:22:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D479EF80212; Mon, 22 Nov 2021 15:22:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE3E9F800E7
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 15:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE3E9F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Pa42aqND"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A50446023E;
 Mon, 22 Nov 2021 14:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637590944;
 bh=WKzltYKcWxxR0C3ceu4znEwrAGhBPzs0S1yq2paT+UY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pa42aqNDzulWRQi9OYypU8lYqnWjd/AgYdW+TB0RC1H/0owbOKtTb1kdVXY/obGu7
 zrNYvnC4z8kzKxth5diPD3kB7M5ir1Ctl6rlm2GeUUQb0P661lXvdQM808bBjNpXab
 SFbtDdSbLc7QjBAz9UaYKD4JOz9jjgkyaktulzKOOwU5Or5D2jRmHUFWFaWKyBphFv
 7ex/YGqtlVnGaILx/InZXt0AECbfrg+FAfTjeyBWvfHrPNLC9wNqoJsfInwEfYzUkT
 7Mq4rZVxQ/0Iphwozy55MUwJJ9mJ7q2r7OTLOANgZfjOl+G8si4bpByY7mA4GzXLd9
 EjL8PJCqM8yrA==
Date: Mon, 22 Nov 2021 14:22:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [RFC patch 2/5] ASoC: tlv320aic31xx: Add support for pll_r
 coefficient
Message-ID: <YZunmnHqemZRJ6JK@sirena.org.uk>
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
 <20211119153248.419802-3-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PmgQRVULIqfojczT"
Content-Disposition: inline
In-Reply-To: <20211119153248.419802-3-ariel.dalessandro@collabora.com>
X-Cookie: Lake Erie died for your sins.
Cc: bkylerussell@gmail.com, lgirdwood@gmail.com,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 nicoleotsuka@gmail.com, michael@amarulasolutions.com, festevam@gmail.com
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


--PmgQRVULIqfojczT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 12:32:45PM -0300, Ariel D'Alessandro wrote:
> When the clock used by the codec is BCLK, the operation parameters need
> to be calculated from input sample rate and format. Low frequency rates
> required different r multipliers, in order to achieve a higher PLL
> output frequency.
>=20
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Did Michael write this code (in which case there should be a From: from
him) or did he work on the code with you?  The signoffs are a little
confusing.

--PmgQRVULIqfojczT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGbp5oACgkQJNaLcl1U
h9CvBAf9GOA835hDgBLet04zGnfaBKpUlrl7hmECxdRr48Sa7/Px2zGXfjVQuTMm
DUlgYzbqInQKwYzyZc6fJZuckQ6rH1XE0I5abjYX2u1lmzxI+cZxFqXn36DIuzdh
vQ42B3TA6qTsYiXsu/gPqiOiXvnN/WQdTHY7tEI7EoOOBTZLJGqtMogLPC017BLL
nHeSmAeEnyWb3dPXEcgDGf5skYaKT9wTLIordEI801/mUn9a1vJO7eqFDSDcWoMe
U4uXqWun43CWTkzOa0TPQHx2/F3WGO5tOmnumCO+KYspRDmfGn2oh6dPsuF56IV1
kn4ax3imRAqnWphauh3/dilfO1kRsA==
=ZDS5
-----END PGP SIGNATURE-----

--PmgQRVULIqfojczT--
