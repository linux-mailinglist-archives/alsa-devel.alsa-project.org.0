Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAD9124612
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 12:48:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40FA615F9;
	Wed, 18 Dec 2019 12:47:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40FA615F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576669700;
	bh=p7VfBKoCKZXAzFXv4tR9JRvyaF+150/1PnHeQOEjfF0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ufPQctRPnRPofGidg90a3UPFbWijZe0igceYi3ggTmAGvUdB1DO7VCLW8etB7ibGH
	 6YuScMrK6KjpA48aGGg9VxEWPgvpye8wY2PWdnHhUncim8XuB2NaIcr0LZWG9dAWIG
	 /vPV7L+iAGA+yjne8nlnHy+wqWLxU50MikyiyqbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D99A1F8015A;
	Wed, 18 Dec 2019 12:46:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13FE4F8022C; Wed, 18 Dec 2019 12:46:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4B8F9F80088
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 12:46:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B8F9F80088
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0DC430E;
 Wed, 18 Dec 2019 03:46:26 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AE713F6CF;
 Wed, 18 Dec 2019 03:46:26 -0800 (PST)
Date: Wed, 18 Dec 2019 11:46:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191218114624.GB3219@sirena.org.uk>
References: <20191217121642.28534-1-srinivas.kandagatla@linaro.org>
 <20191217121642.28534-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20191217121642.28534-4-srinivas.kandagatla@linaro.org>
X-Cookie: Power is poison.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, lee.jones@linaro.org,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v5 03/11] ASoC: wcd934x: add support to
 wcd9340/wcd9341 codec
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
Content-Type: multipart/mixed; boundary="===============1427201724637989686=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1427201724637989686==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline


--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2019 at 12:16:34PM +0000, Srinivas Kandagatla wrote:

> +config SND_SOC_WCD934X
> +	tristate "WCD9340/WCD9341 Codec"
> +	depends on SLIMBUS
> +	select REGMAP_SLIMBUS
> +	select REGMAP_IRQ
> +	help

Why does this not depend on the MFD change?

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl36EY8ACgkQJNaLcl1U
h9CJewf/UNyw0O0xrJ7lqLqOtpx2X0NT8thQQh2NcyNp4m8qbmYDJ15qmTMAM+yj
mP+3wP/Qf8hD8sTAidpOg9krTC5rCGi8k7lHizePkZEkmxilFp6IEr4xPSFimHhR
bp2p/9XvAgJcXlsDTaRRknBtErDfSIfcNmPjC9Lz0Q9jAlQKMjPVj9K7Wm4o96zQ
L/Cz3jQOHeNSRCBQKjkMDUSesDQIzZUAAEShRq82RT+dxa8K531f8AoFQKf+D2KZ
3EmrYGye3MJgMTZ+8elie/8uBaRKqhCei3zZecF05lN43KThV/U5aEGY/p/RW6O4
xnnuzr+hkC5Hu7jMR8DbzcNHfEuS+g==
=vos4
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--

--===============1427201724637989686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1427201724637989686==--
