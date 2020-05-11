Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0E61CE788
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:36:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F05D71661;
	Mon, 11 May 2020 23:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F05D71661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232968;
	bh=t9E+zQZhFkb0os8ZvYyTkZuaKKcEmnobBlRdjDhPC0E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G94G5p5ENZ9BgaJQAXD9ewWOnPnylQtFvFwDsyuthEGVThVkGiQcV0ANLDNvEzj74
	 RBt/OJ+fNqidKFlp9/YEcYKlBysaSSbkIkov57nzROVg8wnixP7Qjgv90K5aE4YYtE
	 4NAasW4S7X+epleKRTCDYq9kY9NwnBTQdeqzhgJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E5D7F801F2;
	Mon, 11 May 2020 23:34:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 351C2F80157; Mon, 11 May 2020 23:34:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39B96F800E3
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39B96F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QncDUzyO"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84B82206D9;
 Mon, 11 May 2020 21:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589232854;
 bh=t9E+zQZhFkb0os8ZvYyTkZuaKKcEmnobBlRdjDhPC0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QncDUzyOZeBFybgBiX9gsjwe87Qx6LUTJw0s553WmO/CNx3eWsWgCnTZvgKzMyeu8
 Au0L9d5eGaPtHcWP919KDAT1DDcN9RHkBmT1iNlxCyq6VVi26jJrck4ziCNBycSwBA
 BpKlLkwPCOA1QdqdsZ5BOA8C4McPoyoKHXK7ICYM=
Date: Mon, 11 May 2020 22:34:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Johannes Krude <johannes@krude.de>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] sound/soc: only first codec is master in multicodec setup
Message-ID: <20200511213411.GC23852@sirena.org.uk>
References: <20191120202334.GA4579@phlox.h.transitiv.net>
 <158895800278.30774.7135029343990319515.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline
In-Reply-To: <158895800278.30774.7135029343990319515.b4-ty@kernel.org>
X-Cookie: APL hackers do it in the quad.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <lgirdwood@gmail.com>
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


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2020 at 06:13:43PM +0100, Mark Brown wrote:
> On Wed, 20 Nov 2019 21:23:34 +0100, Johannes Krude wrote:
> > When using multiple codecs, at most one codec should generate the master
> > clock. All codecs except the first are therefore configured for slave
> > mode. Before this patch all codecs in a multicodec setup had to be=20
> > slaves. This is needed when e.g., connecting multiple sound hats for=20
> > simultaneous playback to the raspberry pi I2S output and one of the=20
> > sound hats generates the I2S clocks=20
> > (https://github.com/raspberrypi/linux/pull/3337).
> >=20
> > [...]
>=20
> Applied to
>=20
>    local tree regulator/for-5.7
>=20
> Thanks!
>=20
> [1/1] sound/soc: only first codec is master in multicodec setup
>       (no commit info)

Sorry, this was sent in error - the patch wasn't applied.

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl65xNIACgkQJNaLcl1U
h9A/vAf/bTil+xw+i7XxXf85X4We7tSvylK1EnQWIYEKR23tvIucSQKvl4g8Rvm4
Yw4/zpKrVL1jltkLIpTl8EZA229fTEPSbktJhDbBwBU48paI89gTe+4wo7n6uX3D
y/vGtlsbWGf5AtT8wOUJM9w0D+XleaMAPK0+QHfzL9/xaMHEH0CL0VEALWWLjKM9
uzbLJ+wNW5iaC8eUk2Hlg20UgOTBFbNrgzqcpPinwX5zbJgdhorc8V6v40cYfuUZ
A7+hTEOH44ItlglyvFkD1f+qfMTlsodn9QWzcMFS3QcSIcykzg2xb9J4lULJJ03U
//YVYse0B6z/RPKqFzpCSK6fLWTv/Q==
=Cb1C
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
