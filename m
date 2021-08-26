Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 131823F8694
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 13:36:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71EB416A6;
	Thu, 26 Aug 2021 13:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71EB416A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629977803;
	bh=6A2pl++IpZ7ZVR4S+PTDnbftjcy46QrlYcpSnvXhFLE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JMt9fmAH8hyy7PTUMLXKfoY62S8x5ivAstBBCRHfpi4ALzgYtkP3zASPEyebROYrU
	 fNVHB3JF1pZlAcecwHWohIDppystVHPoq9ZZHuafjcY5uhZ0o6P2IGH0Yyv1kn7rIW
	 CHvUPnjT7KdGAKe26ejKE+Cx0aZYFYXAsOKm1kAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBA12F8013F;
	Thu, 26 Aug 2021 13:35:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF016F801D8; Thu, 26 Aug 2021 13:35:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43556F80054
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 13:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43556F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c65jVXvn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2730C610C8;
 Thu, 26 Aug 2021 11:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629977710;
 bh=6A2pl++IpZ7ZVR4S+PTDnbftjcy46QrlYcpSnvXhFLE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c65jVXvn370zZs1CbyftXRz5dBb+9RTauV539gtwnU4VzUGRMi7riYRtK2GGWHb6D
 PPSKHHiM1sf78a+j/yMhlhPtGYobuwHzkqR4T53hhrJIZz93SI6YP0P1zaDTRlxZuO
 WM64qODfCaAfmmlzSoXCTAsxPf4PoOFM4qIoSv0y3ZsTfbs0dHuTP+G9kkhJahJ2Sm
 kkWm0o8vx9Rq4zoHgPB31BpYTkm/tYHnTc+rXhmPLeSfLSQu8pFa/l0Y03GXEi+MNW
 acP6MSKi1Gq4ou9vuwswfmTdFtUKPV9AnMfXCUCM4YtzLjjPDkSRcSjfAZHOMhU0y4
 timt/Sh0cTrEg==
Date: Thu, 26 Aug 2021 12:34:41 +0100
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: rt5682s: add bindings for rt5682s
Message-ID: <20210826113441.GA4148@sirena.org.uk>
References: <20210826080938.14872-1-derek.fang@realtek.com>
 <20210826080938.14872-2-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <20210826080938.14872-2-derek.fang@realtek.com>
X-Cookie: /earth: file system full.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 26, 2021 at 04:09:38PM +0800, derek.fang@realtek.com wrote:

> +  realtek,dmic1-data-pin:
> +    enum:
> +      - 0 # dmic1 is not used
> +      - 1 # using GPIO2 pin as dmic1 data pin
> +      - 2 # using GPIO5 pin as dmic1 data pin
> +
> +  realtek,dmic1-clk-pin:
> +    enum:
> +      - 0 #using GPIO1 pin as dmic1 clock pin
> +      - 1 #using GPIO3 pin as dmic1 clock pin

It works but it's a bit weird that there's no unused option on the clock
- I'd expect this to be symmetric.

> +  realtek,jd-src:
> +    enum:
> +      - 0 # No JD is used
> +      - 1 # using JD1 as JD source

Are there other possible JD sources which are not supported yet?

> +  realtek,dmic-delay-ms:
> +    description: |
> +      Set the delay time (ms) for the requirement of the particular DMIC.

Startup delay or some other delay?

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEnfFAACgkQJNaLcl1U
h9CRDgf+LqsD58u9NxgNavJIsappR3Fy1Os5lH7OjLVqNHAqfwfporHKLRkR2mwy
mN20UqX5dGVE+r+VCqwGgyHbDMFQ+PoQbRvMEgkZ9XLMLLEz50ZNQuRMS56GLqkq
D7aMKcepEqgZwJKtQciZrWcg8UxGNwz9arRoxjThOg2FtLj6/q7OexLgm4qJpQyB
uC1EFMRGewjhvJc9Mjk3tK8t7+SAvseJryPe+LsRiGomhyXtnqyYo5IQ3QdQSIGP
DCwy4cu1wIIO67Hm+OWG0hht+bpwJScoZHxLRBen+xWXzni6Zmy9/0DlX2py4J5c
oF4Z6G/EfB5qcQlPh+c1WwgOGvCXVg==
=Yor1
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
