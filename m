Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B61AF1CF1D0
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 11:42:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32F791688;
	Tue, 12 May 2020 11:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32F791688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589276562;
	bh=p0H+1A9ZtxK8/3CANSemNUB3JdiDXVfouvOzKgQzVM8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZL+CgHg4SsQeIIzknEXXsUO1nU0v/pkNBdnIcQm/Gvh1azimY5x7cjMCrLW7lEc85
	 i0L+SczmxXxdmuLaggKD7JwHqxtsBc5q9GWR+vrlaxhpqJnLGhWh2fJZNlfEDdiZZm
	 U+fGQQH4MwYe+FJhCrkYwt1jjEk9VezjJdpMJ+zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D660F800B7;
	Tue, 12 May 2020 11:41:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE307F80112; Tue, 12 May 2020 11:40:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E798BF800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 11:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E798BF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EmQaEgm7"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82F2F206A3;
 Tue, 12 May 2020 09:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589276452;
 bh=p0H+1A9ZtxK8/3CANSemNUB3JdiDXVfouvOzKgQzVM8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EmQaEgm7TTpSUNS3aPcHTk4HrhcAl4HH5Zz4oYgZujO3r1uTQ8jmPdubQCsJkmuGU
 lDqndTVtS3aejmhVBwfoQfy1nVoAwgP0wkO/5s1ritqdJ0Xqo+hexhrzhsSkRTh/3+
 qNBYVMld6gTLO3vcvEuaSugnnb7rP1+Pe1XtJcKI=
Date: Tue, 12 May 2020 10:40:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Yongbo Zhang <giraffesnn123@gmail.com>
Subject: Re: [PATCH v2] SoC: rsnd: add interrupt support for SSI BUSIF buffer
Message-ID: <20200512094049.GA5110@sirena.org.uk>
References: <20200511160731.GA3618@sirena.org.uk>
 <20200512093003.28332-1-giraffesnn123@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <20200512093003.28332-1-giraffesnn123@gmail.com>
X-Cookie: The only perfect science is hind-sight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Chen Li <licheng0822@thundersoft.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2020 at 05:30:03PM +0800, Yongbo Zhang wrote:

> Acked-by: Mark Brown <broonie@kernel.org>

I didn't send an Acked-by...

> Changes since v1:
> - Fix build errors for sound/soc/sh/rcar/ssi.c
>=20
> Changes since v0 (thanks for the feedback Morimoto):
> - Replace the value of a register variable
> ---

As covered in submitting-patches.rst the inter-version changelog should
come after the --- so they get automatically dropped by the tools when
the patches are applied.

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl66byAACgkQJNaLcl1U
h9BJbgf+LkSOsLJXqaPOOA4t0WY7+ZFUXwq3yyiBXkB0RwzQJW6ncVLUwgCPce5E
Dpr80WMMGZNFbJ8OywdMDqNucSc0Ivqan0lUrueq95EBHouOA0f4Ll4ehbovwg6J
rfaY8bR+jJPGKX0XD8G8gnxvwDb5JxcjawIxJZfHFZIMzgTRmY5l/8OUIL3oAJBS
ov+YTx5WKj6ngCzHx8cs0Sj/xn09uX+a41Qy/w5D4bTSJA0UwypN0nmH+hCseB8e
GoT8N/Pl0l5t/WPyuAem5cy+GdH3t6CPZVHjvIHoTrSePrnE5Bwy2P9K1Rje2mKK
VnLYgSxlm4HclknEmSHNbkXe//PE5w==
=fVhb
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
