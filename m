Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5291BA23B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 13:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 426E374C;
	Mon, 27 Apr 2020 13:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 426E374C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587986633;
	bh=0jmC6ymb22IxBunv3XGNmRuVyT/qlxFM1kkb/eWadrs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jySOZQVlJoG3UD7gpYetTSJ3/ejkUObTtQkTkdwZoZh6LHIZliqAG7OasLiQmR0AP
	 W5T+dnO8xLvRj5PyuQIGUCe4RgGSubynSCkEjeDwwxD8DXvVKfm9CND6PYtMqH0u4T
	 TazpGnBqLcVfKuV4wFx3uAMwyUtXD2MgLqeZ+QrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42EE9F8010A;
	Mon, 27 Apr 2020 13:22:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB47CF8022B; Mon, 27 Apr 2020 13:22:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3482DF8010A
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 13:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3482DF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oMCK4UYl"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A319B205C9;
 Mon, 27 Apr 2020 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587986525;
 bh=0jmC6ymb22IxBunv3XGNmRuVyT/qlxFM1kkb/eWadrs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oMCK4UYlbGod1a1y5XvygMeHe8P1YvmunwSWbIIZ552DSBYHSFnaTtzvitje4yc5D
 UzTJgJwuPOO6O26FCKCXDrZ5nLtvogMTIbATLS/45lkyOxvE8oz98oRZNmjLdx9+Y8
 prTJZl+Z5mrHc6TlOUvyi31ZKDG5NOWMKWlkKNSY=
Date: Mon, 27 Apr 2020 12:22:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 4/4] ASoC: wm8994: Silence warnings during deferred probe
Message-ID: <20200427112202.GB4272@sirena.org.uk>
References: <20200427074832.22134-1-m.szyprowski@samsung.com>
 <CGME20200427074843eucas1p1a3a265df0c7f14b0aaec25eb65daf606@eucas1p1.samsung.com>
 <20200427074832.22134-5-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <20200427074832.22134-5-m.szyprowski@samsung.com>
X-Cookie: Secrecy is the beginning of tyranny.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee.jones@linaro.org>
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


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2020 at 09:48:32AM +0200, Marek Szyprowski wrote:
> Don't confuse user with meaningless warning about the failure in getting
> clocks in case of deferred probe.

>  	if (ret < 0) {
> -		dev_err(&pdev->dev, "Failed to get clocks: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Failed to get clocks: %d\n", ret);

This completely eliminates the diagnostics which means that if the clock
isn't there the user is a bit stuck trying to work out what's missing.
There should still be a diagnostic.

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6mwFkACgkQJNaLcl1U
h9CnKgf+L0DHzyP9uJrX9mcCSOEFMqGDbUbVooabgQKACLN2NqFor9WHedKckCIh
fDOp+RpDynCvnBX7erSNkPM8Hkpo8VemUi+ULRs+Bj2qP1h6t+069tYs+AZ8f9VJ
dAWfnctdgI8rYKrfwFa7zPToZbEYNX+3tZHwBMwnpW12+maRF788h2uas/h6Ae2s
9o0nObKwrSLLvvnqvFXGPeX6UZ4kXayfQ8RojLR+y+QtkcLZTZeB2WGuowRS62wD
yccW4mzrZojzcC3aSuuCosv3h9wEMbMb+g1PIF4cCUGz14oywcWiVBDiEi7uMSWp
oyQQZ6ObUxSdmIvqgirYU5GA67W+wA==
=MSap
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
