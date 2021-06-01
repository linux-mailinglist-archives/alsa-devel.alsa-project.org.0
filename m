Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3395C3973B9
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 15:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96FFC16D1;
	Tue,  1 Jun 2021 15:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96FFC16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622552492;
	bh=UoWTLfXhx2Ae6PgEJdDnT7Tfrgogvd/PuBRErA4va/A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i0/H46Uq3P99VIPNZ/VXk4qiB9iH/c8udSfCw8Pp54vMA8vJbn0g0zlhW6jbkdMdu
	 IOc709L/NGG9+Swzu/ntjWXCjRuxVcdK3onTUIcUozh3Cc0t99A1G6UL1UkUAK5hV+
	 xtEJxUJid0EGSUFVKlfeEIKjHFqlDng0SLD/WR7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01D48F8025B;
	Tue,  1 Jun 2021 15:00:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC517F80253; Tue,  1 Jun 2021 15:00:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BF5AF80253
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 14:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BF5AF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GRPF92Ad"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 182D86136E;
 Tue,  1 Jun 2021 12:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622552389;
 bh=UoWTLfXhx2Ae6PgEJdDnT7Tfrgogvd/PuBRErA4va/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GRPF92AdTT6CC5KQHGhFuPQWQj+A3rWqvwsKbnIpmAHgwfyixY3SLEZnBQ3ww3jEo
 xHs2bYVCUVtHBXaX+dHPIpWkHtsJEzN3bRqHYSW15EZ/OYAjCVTZerPHJUFb/5ve4h
 c6EoZ9DUcdb9VW5yjtwIJdXFlAqq1v8NIPW83s8v8TGFMYv3yW4O/7CYHz3CZAsZzV
 y/Y1BNXkioR6XDyfOkEci2E2tiX5RibLRsovAyS9+ObFsC58LzJls0jOsDy9/L0sqp
 lMz4lYUhpnz2qpdjpobggzXaVQqKaTVFM8YyFnZk17teJK9CTxMb0hPOM7R51Xb7JK
 CQTJDuWtMkxwg==
Date: Tue, 1 Jun 2021 13:59:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Bertrand Jacquin <bertrand@jacquin.bzh>
Subject: Re: [PATCH] ASoC: snd-soc-lpass requires REGMAP_MMIO
Message-ID: <20210601125939.GA4322@sirena.org.uk>
References: <20210529184957.373232-1-bertrand@jacquin.bzh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
In-Reply-To: <20210529184957.373232-1-bertrand@jacquin.bzh>
X-Cookie: The savior becomes the victim.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com
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


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 29, 2021 at 07:49:57PM +0100, Bertrand Jacquin wrote:

> This does also apply to other Qualcomm Macro LPASS all making call to
> devm_regmap_init_mmio()
> ---
>  sound/soc/codecs/Kconfig | 4 ++++

A Signed-off-by is required for patches, please see submitting-patches.rst=
=20
in the kernel tree for details on what this is and why it is important.

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmC2LzoACgkQJNaLcl1U
h9ArZAf+MnXTTp2xTYb1jN/tXS77ERJ+/CdrpuikKHRuuDBdR/QgrF7w0d/LP/8L
4XFXcuDB0aNq04lEcQOjsQJwxFZy1TPbiazuqFslSgjQynvc3P/DEAF1MG+ZG8WO
a3TVw6xpaYYJ139TLCIV4bWm88eCh65sleHjFxtlc/0RnrlgU2EYuFhQXeAHNDVr
2D+ioBaN7VW2zmnnCaMF1GeK361mtuq+zecAF7OWeFZG28uNX57x7oL4XcIPZAoY
eoplWE7jKLkLdeIbrkeGY6nm1i5E4Mn1cDKzLbbPFxkVBWvC5c+sF51EiYqYoB+e
QWkctWpgOLeYejGqPaSFL3YkoE6sdw==
=ndqh
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
