Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA20F378FD1
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 15:59:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 464011773;
	Mon, 10 May 2021 15:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 464011773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620655170;
	bh=pwPZlCAZTi6VxknfHc55oXvTvxE0RLtzRQtnKA2Tjm4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qUFYDHNfF46T0+ugUsQQIRBOBlcBfxPDPpRAWhkcqNbl+tkSSULFf7LfvTSTqj+VM
	 s2FNsSAp6Abe9T0v+WJZjWpG7FEzKO7fdRvJUVkxW5QRn8m1PRayqSxCgYcSfXCVcP
	 zCMgc+qh63ven2Oh6rcQcxGEzYygJgU/dFhnjPqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9116EF8026B;
	Mon, 10 May 2021 15:57:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EB40F80240; Mon, 10 May 2021 15:57:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36C01F800B4
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 15:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36C01F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ApwvqKKl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A4BA610A7;
 Mon, 10 May 2021 13:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620655068;
 bh=pwPZlCAZTi6VxknfHc55oXvTvxE0RLtzRQtnKA2Tjm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ApwvqKKljUpNmini5cWhy1lDstlG7JinBAUQYQIMMYPr8CX/b7gE2L6s+MVzxrNhB
 mgJsSfpb5OKotYLsEP5tWpOL4mV4Uo9Kurpv8q1ALoL4bxQy6CGRbWMPXV03S3XGnY
 JdaR45+yotvIyTzURz21odTuSZfZCLaKsU0wMeqBt9IO/Pghl7EpR2uCczKngsiiRU
 oD3tjg4UWLMVZFx/zIWtRhCsjxrgeZ3yLx9RYc8Vj8FQw/wSZ9zuY7dMys1VgKlcPE
 IcPHviTEKu8Ca1iZRuwwbmO2AeeUud0tdJuFtnQoe23QZtMIngbbCxbxADvLQkgHas
 uhbVvoJANin1Q==
Date: Mon, 10 May 2021 14:57:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 07/14] spi: pxa2xx: Introduce int_stop_and_reset()
 helper
Message-ID: <20210510135709.GA4496@sirena.org.uk>
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
 <20210423182441.50272-8-andriy.shevchenko@linux.intel.com>
 <20210510120953.GA15173@sirena.org.uk>
 <YJkpYDfoUg04UEMy@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <YJkpYDfoUg04UEMy@smile.fi.intel.com>
X-Cookie: Beam me up, Scotty!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Daniel Mack <daniel@zonque.org>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
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


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 10, 2021 at 03:38:56PM +0300, Andy Shevchenko wrote:

> Okay, I will resend against spi/for-5.14, but I don't see the issue here.

It'll have been against 5.14.

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCZO7QACgkQJNaLcl1U
h9DqqAf+OSmnLzwMA7xOTPi2A4I1nkk6BXNdzfJLX/E8tCcWdsfKtXOdq40yRxtC
dBhP6lY0aiBaxY7xUHROvFWrotpBlp/ZXJJu9d9ScTq2Rmx+rCjT+OeTxtbOjbfq
Ft/WEE992xJ4I7qFRwoP0OEc+OyQ8gxapXT8iL1r73rSJNL0E55QqLLJZ1cwNC7+
1GeHJugSj6aWh0Th42NuDn1GlvKRGcyG5xDeRK40v91KIJzdb4vYJsLGcBlq0f0h
nxjYKj3h4fLBRq1XDH/KhX2X2i7ayy61vhWKuonBIto0ojZ37B32hqLZUagz2wLP
eZmTTlhwJZM1Meiq+A7r4phoQc5P3A==
=ZN6h
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
