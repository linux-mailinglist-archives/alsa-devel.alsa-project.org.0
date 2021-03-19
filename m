Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B842D341CBB
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 13:23:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CE8D1683;
	Fri, 19 Mar 2021 13:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CE8D1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616156588;
	bh=9sLQc0kXtFuaRosJgHT6Og87yMV3BVy840SE12IzAFQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M1W+8s5uUM0r5ftJRk+aRW/0Hiqg1s0ADf+WsZmygvXg1K1vxQsVlRzehiwnaf4bT
	 wHzwkxySbn4uPPmZsZGNfS5X2hj8rac/K/MI2QuZXqx7cFfMZg57saeVmVSPD0cX0O
	 RVva71B61XLttfOI28h+KHqtBMeX2PG6uYEI0QhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A309F800BB;
	Fri, 19 Mar 2021 13:21:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B96D4F8021C; Fri, 19 Mar 2021 13:21:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CA13F80124
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 13:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CA13F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q2wT0o+w"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A8AE6146D;
 Fri, 19 Mar 2021 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616156489;
 bh=9sLQc0kXtFuaRosJgHT6Og87yMV3BVy840SE12IzAFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q2wT0o+w33CedTpTlIJq3LWp2W7cdl74qQl8ZS3olP5xq9YLd0UQH2VThwAwOwKND
 m47OwKyKhwRgqUqocMe1pmU0gcxwhzBGtmdO82pKdHL4ZUyDPnQa+i9Eaw1tLhgQx8
 CLz/u3IpZRRpb9N7LNyWbcnFOsZ/Lt4060MvIfM8blU2TgV+So4yfb9Su15Bz7BejF
 8bzl8A4uJKN2KK3BZ6oQOk0T+gZXTlKt2lF8dDkh/cMTjifVBtO/qymmk4aSxqClJ5
 AZd4vNGRHo4i7J/Vd/lBvNbRUH7f7ywwl+8MQ4kCkIIzyZs3zj3DphFP/GNlcNVC8a
 c4/v+Nozg8lhw==
Date: Fri, 19 Mar 2021 12:21:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 1/2] ASoC: rt715: add main capture switch and main
 capture volume
Message-ID: <20210319122124.GB5619@sirena.org.uk>
References: <20210319030337.16213-1-jack.yu@realtek.com>
 <2d55b97c-e781-552a-5064-5715443fb7e9@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline
In-Reply-To: <2d55b97c-e781-552a-5064-5715443fb7e9@perex.cz>
X-Cookie: No purchase necessary.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, lgirdwood@gmail.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 19, 2021 at 07:54:21AM +0100, Jaroslav Kysela wrote:

> It's bad to map multiple controls to operate on top of the same registers
> without any kind of synchronization.

Even with synchronization it's really something to do as a last resort.

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBUl0QACgkQJNaLcl1U
h9CfVAf/Q4LUFJrV6i6zS7wAE3JrCY/PP3xz31m1acbAeiGTiGILODIwGYRrBH2E
GU/afxYFRGvRRPn8DzVAUFo7YgkxNxajF1dne8lZ1GdFXQgZpBNk77TIzN3nne0k
lRjdeznkegWrw8k66PeIPd/MLJ6HDtM6rhd9vs4pCrhjshy4cIVQ96ZzaL8ckls6
g6BIJQx7ppgLj3ZuM/dc+PRg2e7V5MiMCNOSHFT9zRVtAYwHamJMddcpz2WIPsX0
ml/doQ+6LCM6yzWiFiCNEiiaChEWTpk5k2Qkyfjv3bTzyCusYCv9/fs1y7xeeiBR
Lr6oiR7oWiYN/CCXSjb1+XG5N3xlOA==
=p2nu
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
