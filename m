Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF7B439653
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 14:28:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 536A1820;
	Mon, 25 Oct 2021 14:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 536A1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635164883;
	bh=fMXcg+GdSlelNG/dNhpHouz7HIAxjkUT8uU3fdIIkgU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IygCMPeGVcaeVgsgeMeOomvTWPyuD5MHW//54jOvu+6v+4lhRrzy5+dXvwBXiHDGI
	 lcRxPZFB9uwk9y6Fm4DVJouZefX/YzTlo+kFLc3nVonxbAbIZrIbDC4gxQIBFku6Dx
	 2guf5Hvd4Y618BGdrVGlRYifVOKn7kMZFE4pcmxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE67AF8025E;
	Mon, 25 Oct 2021 14:26:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADD62F8025A; Mon, 25 Oct 2021 14:26:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EF7CF80153
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 14:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EF7CF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iyLJ9VPm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97FA760EE9;
 Mon, 25 Oct 2021 12:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635164792;
 bh=fMXcg+GdSlelNG/dNhpHouz7HIAxjkUT8uU3fdIIkgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iyLJ9VPmFFcJsCa6d5yhGS7C5FaSxaXyAyrsFMmmuGaZ6C93EabSWqtIzjbEdvVBl
 S5y+FNj6diPbLeFzu7RLVNuvJxpZMxK4uRH0z0j23h3OEauGjug/C+3qKeABB4CNSY
 0o7tP4ezNIUsSr9GZqxA0wbX960VQNp5dGUis6dn7wG+DpmJvX2/+qRRi22Y06j7ed
 r0Fpi0ZcuIrpsXAnQFjtr/C4BGRIDQGSXjexH7bejpuuLE3U1CBmIvGS2t8Z75WhhI
 RbZIMzDVvdH1DuiFAqIiqjRJgJx5FaIsoyNNU6lQ7r0OYQO3ndFn8v8tzc18IH3kCM
 Rl0kZAhg+hjdg==
Date: Mon, 25 Oct 2021 13:26:29 +0100
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Subject: Re: [PATCH 1/2] ASoC: nau8825: add set_jack coponment support
Message-ID: <YXaidVceACviFFob@sirena.org.uk>
References: <20211025113857.3860951-1-CTLIN0@nuvoton.com>
 <20211025113857.3860951-2-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k4b44JJTgXc9zeto"
Content-Disposition: inline
In-Reply-To: <20211025113857.3860951-2-CTLIN0@nuvoton.com>
X-Cookie: From concentrate.
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com
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


--k4b44JJTgXc9zeto
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 07:38:57PM +0800, David Lin wrote:
> Use set_jack ops to set jack for new machine drivers. Meanwhile,
> the old machine drivers can still call previous export function
> "nau8825_enable_jack_detect".
>=20
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> ---

One other thing, sorry - your signoff should generally come last.  If
Mac wrote this then the commit should say it comes from them, if you
worked on it together then Co-developed-by is usually used.

--k4b44JJTgXc9zeto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF2onQACgkQJNaLcl1U
h9ASPgf/bvfpfPc/MmrT/DGn3VFp2cNqX7vteCVseoM6ie7FUQfLxiE23md8sFVy
WPCRCaMy6OVFwAIMFHqhs/Ke5NAL81KGhK0HVqIL2GpTWSXkEMVLwIIEuT4udLYK
YbraPB+932IcmZJ255v+gpurQlnN57+HbclEOsEQvnTqYXBbehkG3FyEMPgR5lpE
B+vP1yFsMPxdp0/SkV65zejRek8xaMb2EKL2HStZpSTYh3fQ70wE0DjR0wisTq9d
rNrL4ETe5UWyUUPy2O9iwzOk1ZaRf522tNoNvJtxOXC4aDGa+TO34/AmErcHI6RH
tF1lJgHGf/uo02tBy79lHeiLb/SA7A==
=PZfm
-----END PGP SIGNATURE-----

--k4b44JJTgXc9zeto--
