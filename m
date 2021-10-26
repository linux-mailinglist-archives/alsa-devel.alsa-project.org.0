Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E601C43B8D9
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 19:59:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7824616FE;
	Tue, 26 Oct 2021 19:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7824616FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635271189;
	bh=mkOkXcxXUr6q57gOjgUGNlcvi33x2H7q7XqXfdlkxkc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fywfIkWu1clF7OrSD7SKpK/zfNWhAWlwVRpuiTyHyVL4w5IlGPACnwQuecE2AXNdv
	 Y60uaxmILpYOitUX5oVYJ7aDTgJxaWJCQ9ZLyqvTFTT55FG/rZlOSOoJR1+AVlH6gO
	 7VJDYg6IYPxhvg7k+l63JhDvFbn3i4fYZPoWNm98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8697F80269;
	Tue, 26 Oct 2021 19:58:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C64B3F802C8; Tue, 26 Oct 2021 19:58:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DD1FF8010A
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 19:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DD1FF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j8Xl23P+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56E4E6109D;
 Tue, 26 Oct 2021 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635271100;
 bh=mkOkXcxXUr6q57gOjgUGNlcvi33x2H7q7XqXfdlkxkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j8Xl23P+smy30D06af+jQqs9IzeTHfgc1TR+ZtDCsVfuIl3U2jygg984HVp1UEZ6x
 B9Dp8bqaoTIXLm3PvXKmRmFnqfFBU9FU9RnkHBpGqPFsEB3J+1DsGPEb6vjflO1Zn5
 iphXxzWgiLinvC6iSInPuv2zfpSzaE3iQ0+81cvChSEophrQVuZOFEwpPK1FvDioaN
 vqBaz5og2iU1cjhCXK6cwD2g19Pwcg46rLpO8PDb0Q35zuE0Xt7iHcHQ92Yj+dw3JU
 EhT5t2xgzUCTChzEPuy0RZRZxKCURHQ6tAJwnVIIhqhxZNJ0LQAckvoKZCTsg9Iz3P
 IMGHkFhc0VCoA==
Date: Tue, 26 Oct 2021 18:58:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/3] ASoC: nau8825: add set_jack coponment support
Message-ID: <YXhBt0rEYSVP9CNR@sirena.org.uk>
References: <20211026093828.4188145-1-CTLIN0@nuvoton.com>
 <20211026093828.4188145-2-CTLIN0@nuvoton.com>
 <55937591-e1f1-9f1e-2355-e7680026f05d@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QL2K5ul0znd3SQXW"
Content-Disposition: inline
In-Reply-To: <55937591-e1f1-9f1e-2355-e7680026f05d@linux.intel.com>
X-Cookie: Times approximate.
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com, David Lin <CTLIN0@nuvoton.com>
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


--QL2K5ul0znd3SQXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 12:35:33PM -0500, Pierre-Louis Bossart wrote:
>=20
>=20
> On 10/26/21 4:38 AM, David Lin wrote:
> > Use set_jack ops to set jack for new machine drivers. Meanwhile,
> > the old machine drivers can still call previous export function
> > "nau8825_enable_jack_detect".
> >=20
> > Co-Developed-by: Mac Chiang <mac.chiang@intel.com>
>=20
> if you use the Co-developed-by: tag (no capital letter after 'C'), you
> still need to provide your Signed-off-by: tag
>=20
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#wh=
en-to-use-acked-by-cc-and-co-developed-by
>=20
> same comment for the 2 other patches in this series.
>=20
> > Signed-off-by: David Lin <CTLIN0@nuvoton.com>

The signoff is there AFAICT?

--QL2K5ul0znd3SQXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF4QbYACgkQJNaLcl1U
h9C79wf+Psrfu2vXiLUgh+32udE+SE6sYVgpJ4r2yzswmxDDCc7wBsBBeK1b2CZH
c4Qbj3rgVxt1MjNocCnvIN3ZvE7/3UOfIzw57lF3WVxmnyNrabpUmuNLN9FJpQ/p
aKIqjmxpTcmGABV9+Q/tNe1aXDkXtIIQSWKQhO0jM/Gpe90Id4GuJmaTsFKa7Ky7
UVhOujVUylq+yGr7j6yDlYCJO4StL0wWLZUVy6mU/TnmAsJRY56zuMHIIm9gU/LM
I5wz/5dU1zpAexMMAK9MplwgirHZ7G6GDDxecePopRGzCz9bOUWzCMMqbWK18QFS
8cuyTIsLzBsnGbrri5f5Gt+5PCWLjg==
=a8TP
-----END PGP SIGNATURE-----

--QL2K5ul0znd3SQXW--
