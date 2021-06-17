Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 505A53AB34D
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 14:09:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6CAC16EC;
	Thu, 17 Jun 2021 14:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6CAC16EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623931789;
	bh=i6kJUpBxHxG+QzGCDo+Do5icLvOgpxju9jJwwtE9c60=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AsZRd+6UQRtNw/pM5Dohh3e9/rtWGUx0fILxmUWBkIlytb/uK7JpNU/csfK2ksCdG
	 xS/8aXF3o+GwwdxWhh256h1+cFrt+O+lz/ECBX0lAP+zGxN4XiZEopWXY6qhf/uT/s
	 3QCRp8pQ4Zwqr0nCxexgBaYc3MpPMzz6Oxs2KTeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E9B1F80171;
	Thu, 17 Jun 2021 14:08:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9AF1F8025A; Thu, 17 Jun 2021 14:08:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E3C0F80148
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 14:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E3C0F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B/MF8VS5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B2FC610EA;
 Thu, 17 Jun 2021 12:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623931688;
 bh=i6kJUpBxHxG+QzGCDo+Do5icLvOgpxju9jJwwtE9c60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B/MF8VS5eLhlJg7fqU/4oVwicWtdYZrsBUlhtr0IshhwqQr/yWHEbmL8gV6+k/4Ma
 HCNySERsghT73XoINOrMFjd85j9xERAS/2UL6pyZAM+eV3z8t5aWkhNCepKtKcxrBg
 yKPstJrlTl6T6Xedpb5AR9zwZl+MMpxKlRA9Gj1soZttmwEvwDlT3q56Im7yAFcm7Y
 2E8aRmsggzinAf9XrDXPhZoZXC+v+LfJvYVfQ3TII6YdQPUtf+1ZV6Nj1Kfw93tFat
 lwUfksBlcWAEdmcYLRyDLyg2/YZ19zyBkBbEdrj+ujMc5tTf6NhN57b9QvM//bTiWF
 YGy8ozgXe9l0g==
Date: Thu, 17 Jun 2021 13:07:47 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?54+t5rab?= <fengzheng923@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
Message-ID: <20210617120747.GB5067@sirena.org.uk>
References: <20210615130326.2044-1-fengzheng923@gmail.com>
 <20210615132207.GG5149@sirena.org.uk>
 <CAE=m61-kHPeKNvEEc08w8DeUwssGPWNf5UaYojRPNZRJ0v=arw@mail.gmail.com>
 <20210617104828.GA5067@sirena.org.uk>
 <CAE=m618Gtx_RQ4+h=8+TFvbcuSTpNWVcx1bry+8OggL6uDCzfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline
In-Reply-To: <CAE=m618Gtx_RQ4+h=8+TFvbcuSTpNWVcx1bry+8OggL6uDCzfw@mail.gmail.com>
X-Cookie: But it does move!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, krzk@kernel.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, jernej.skrabec@gmail.com, lgirdwood@gmail.com, wens@csie.org,
 mripard@kernel.org, p.zabel@pengutronix.de, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 07:50:42PM +0800, =E7=8F=AD=E6=B6=9B wrote:
> Mark Brown <broonie@kernel.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=8817=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:48=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Jun 17, 2021 at 03:42:43PM +0800, =E7=8F=AD=E6=B6=9B wrote:
> > > Mark Brown <broonie@kernel.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=8815=E6=
=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=889:22=E5=86=99=E9=81=93=EF=BC=9A

> > No, that's what you have already make the entire thing a C++ comment
> > with //s.

> I don=E2=80=99t understand. For example, sun4i-codec.c sun4i-i2s.c
> sun8i-codec.c and sun4i-spdif.c files are the same as mine.

Other people doing a bad job is no excuse for doing a bad job yourself.

> Which file can I refer to? what should I do......

Make every line of the comment start with //.  See soc-core.c

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDLOxIACgkQJNaLcl1U
h9B0Zwf9F77pXhY9/b+1fLkmyUPL4p+njHaVTXcpjPLK+YIOfmiX/pNhREBXmMnc
LdIdlGNvIBKzJ0VDd8SBzL8ARlpaQe7tKqzaxBOHMU5dwnN8q0QueQcYWsO3CeJt
5r6781yl1ugFsKrzC3BIhebjleMk6a+qng15JFRX+cHj04xhbEtBDfcsLwJ1nZMz
+THnsoZRSTCF85GXriv8+fJsXHrTGUEFnveSSXhuAuWAMZJzqIrHdyBo0xhzWpRh
69xN583U++MDxvV5evOlyGJ9OC7KSqRqSIZOsADHlgEhWaHhZt9sz1nbNRmquXY3
9U/3IhGf/VSvyYqELpfU4Ka8wL672Q==
=JYR3
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
