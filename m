Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E175C492BE2
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 18:07:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2D352AE5;
	Tue, 18 Jan 2022 18:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2D352AE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642525640;
	bh=ZFgCwFtYPKdyAExQU4X13HYFF3am3ud7wOGEu6ZI/zY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mNUu/QwSefgsC4fmpkHjFQWSZGuLSLla3XtEdnFK5WHObgPiapcRLD1DSQwGevCyM
	 e9xhvfIBS0JVdOSq/lyiKef5qks5VrlXjkngeaT92mJGYhoeJfpLTjNSJK61oFlA+Z
	 9VNfVpFbmh5Hb295JYvmwD0PQpIE3n+3Ftr+Ucvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60C18F80240;
	Tue, 18 Jan 2022 18:06:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C78BF8023B; Tue, 18 Jan 2022 18:06:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EC3EF800D8
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 18:06:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EC3EF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G2lZV0mx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D94D61472;
 Tue, 18 Jan 2022 17:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADB7C340E0;
 Tue, 18 Jan 2022 17:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642525565;
 bh=ZFgCwFtYPKdyAExQU4X13HYFF3am3ud7wOGEu6ZI/zY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G2lZV0mxFZly9yUCbQQjaopNqJBnzh2peaIX1mEwPmk3cbliMq8HiIeAvFohF1LRZ
 VyYSRG+3uOiZ2mnRRzc9lY/JXi2vHYLghsp3UE1MKW53hhpDHYEGEycxyV1pBxr7v8
 iUcU9C+xVzYCrm4wyTLkwQYS4CYwBqbZ6A8LKvobMHiO2TMQWQLP13x1L9cTI3X24T
 ahXKdHqCTeFkOtfyoZRgGQqHeG4LFqZdUGrFULTDsSXwEcxPSwb8Fo/PG45vY7mhHp
 wrT6TIXJgz2l33LbsACbhEXTjzc6CGxEfNEjxxIOCPIDYQM3nYKsei2Ljf3WxPTRMY
 tPfy00pBZAARA==
Date: Tue, 18 Jan 2022 17:06:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] ASoC: au1x: fix unmet dependency on SND_SOC_I2C_AND_SPI
 for SND_SOC_WM8731
Message-ID: <YebzePGTGKtud5V/@sirena.org.uk>
References: <20220117054539.81757-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rcN1/5c2jtyHEDQY"
Content-Disposition: inline
In-Reply-To: <20220117054539.81757-1-julianbraha@gmail.com>
X-Cookie: Do YOU have redeeming social value?
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, fazilyildiran@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com
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


--rcN1/5c2jtyHEDQY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 17, 2022 at 12:45:39AM -0500, Julian Braha wrote:
> @@ -54,6 +54,7 @@ config SND_SOC_DB1000
>  config SND_SOC_DB1200
>  	tristate "DB1200/DB1300/DB1550 Audio support"
>  	depends on SND_SOC_AU1XPSC
> +	depends on SND_SOC_I2C_AND_SPI
>  	select SND_SOC_AU1XPSC_AC97
>  	select SND_SOC_AC97_CODEC
>  	select SND_SOC_WM9712

This obviously not sensible, not only is _I2C_AND_SPI a control that
shouldn't be selected by any driver but this machine is AC'97 based so
clearly doesn't need either I2C or SPI support.  Whatever is going on
this isn't it.

--rcN1/5c2jtyHEDQY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHm83gACgkQJNaLcl1U
h9D0EAf/YaPyqYe1yDtTzANlhZM1UgEWj2lhHxrQhBSNUkdF3H9P0kwdU+PIiOng
NV8Xwe+JRM5dhecC5lCBCx0ZjwldbqIzGjAnSXN+60EyureNfYrPQNMNshc6g/eZ
5atQE9TqUArsS4KotL66zRNoPKuYQKFTV+/u0mjFPPngDCwVUXWDvbQx56KGomqx
Z2R4GP81UDqSoOh04g7KfqUzzj7ioanE/Cf72lj7zseLfsNXGCe7FuQ/5qZBoV2W
89YIX6pC4wIiCwyfiv+RXoGJHyj2L10mmILXj7BlYOgAnlrrkPGDw4s5zZaVeimh
Hy//ODGrYbXt/b+uG8rP+8KT0zGfpQ==
=dGet
-----END PGP SIGNATURE-----

--rcN1/5c2jtyHEDQY--
