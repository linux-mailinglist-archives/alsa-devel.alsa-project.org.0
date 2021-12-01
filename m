Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C209D464E20
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 13:43:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D3B52570;
	Wed,  1 Dec 2021 13:42:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D3B52570
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638362599;
	bh=rSVNBU0Mai7mLvd+511wn/vU46u81GHXG+FTglABM+I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KFYvlmlSj5Vrxg7OW17Wdz4gwrciVYVFrw3GvkRIeASqS0B9zYbRpqd5Wi3VxMw8p
	 nrxC60fkd6T9PRMxW9g1ui/6mXEbs0zMaUZ3YwyvKSxWrU1IxwL81JHDMuutXTh62o
	 bFlt648JtBmiMmgX2IWCM+9RTdUMug5o3DwPnmE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEC45F80249;
	Wed,  1 Dec 2021 13:42:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B785EF80246; Wed,  1 Dec 2021 13:41:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29D06F80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 13:41:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29D06F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V+wFN94d"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6051DCE1D3D;
 Wed,  1 Dec 2021 12:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47682C53FAD;
 Wed,  1 Dec 2021 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638362505;
 bh=rSVNBU0Mai7mLvd+511wn/vU46u81GHXG+FTglABM+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V+wFN94d0TqTFNNa6P2KRsy/1XU47FkyzwwPj0Kpl3U2BnUQN1GR2oemkRNZ5jsUP
 q7Jj7b4Qp9I/XXrg3tW+Y/r3/7wz1FtKzOolnR/4empwKLtSJWzgTC24Xcy5Be3et9
 W8FPVgEZDH5fT1ydhPTdDknNiFCGFDXv/WUBMZcuryvxoaa8HelFeOWR3K36ebajoy
 mpOSXrJ6dFAoMFR6nHcCB8tjnv2g9LJwPURk5DPs3K94wwY0FKuQkXzLfYRJwpwNpr
 TJmddl0Zo1U/AHUN9TY00tUUKS8HK+bxIt+tIHrMwsFS0l9eaOqzzMkFmnBj0Q8VsE
 4D8U4gd6xBCvQ==
Date: Wed, 1 Dec 2021 12:41:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt5640: Fix the wrong state of the JD in the HDA
 header
Message-ID: <YadthEmF05HxTEjh@sirena.org.uk>
References: <20211201095629.21818-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="McXkhZJB46Hq4KH2"
Content-Disposition: inline
In-Reply-To: <20211201095629.21818-1-oder_chiou@realtek.com>
X-Cookie: All true wisdom is found on T-shirts.
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, jacal_tseng@realtek.com,
 danielz@nvidia.com, spujar@nvidia.com, lgirdwood@gmail.com,
 albertchen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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


--McXkhZJB46Hq4KH2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 01, 2021 at 05:56:29PM +0800, Oder Chiou wrote:
> The patch fixes the wrong state of the JD with 1M pull up resistor in the
> HDA header.

Does every system have this pull up or will this need some quirking?

--McXkhZJB46Hq4KH2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGnbYMACgkQJNaLcl1U
h9AHCAf9GIWZfRX8I2wyJH72FEwSepOuw94Ggv1T2vyE7+A5KXEFSVgcNxYmHJ1L
vGsIAwFjIjGBhzqQdIXu08sypvRtsmgt29fyO/G4+GpaKgw19fKGRwa9uJ97sMJF
V2ZuVsWSYDcsr69vyqm6CmeK5DmyVYa7FojkALV7Ad/KT9TwdlEawamoydphNkv/
jFEJgJQ8nlaDeZlzUBwH3VY52qbSMNtVFQEX6xrnH6TOw8XLeKie/B0NxeqOjFH3
hPQGbPMU+mwhGwjzGnp3mv9t/1j353xDpXU7XBBKZlCrHajFY2KfW3QXsGbOkSoF
zkG4FZtUFRmRuS8Bx7dCPkKkvOEOJA==
=3bG2
-----END PGP SIGNATURE-----

--McXkhZJB46Hq4KH2--
