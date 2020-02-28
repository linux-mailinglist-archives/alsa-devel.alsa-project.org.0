Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FB6173C9D
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 17:14:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F31AF16D9;
	Fri, 28 Feb 2020 17:13:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F31AF16D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582906450;
	bh=pxD46haJcaA6QS3w+Cb8Q6cio3wO8f8mOzJb+lvVvF8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O84cySJHZ7brr5QQ/rhWvC3d9fmSiwIZlmU/R/kOXE9z9Y0c6FQxRatL/tJrC/aWk
	 wWeaW/208BWDOCBK38wA72rKXkfazbhtciA9qaN2TcZnRlnjyQkzePtT7PzGSK2cfM
	 MrMLA4J1Zsy8W2SM5QlFL4s+I9MJ7/TSWqIAsYqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED312F80086;
	Fri, 28 Feb 2020 17:12:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8181F8014E; Fri, 28 Feb 2020 17:12:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0F850F80086
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 17:12:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F850F80086
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E1AF31B;
 Fri, 28 Feb 2020 08:12:23 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F85C3F73B;
 Fri, 28 Feb 2020 08:12:22 -0800 (PST)
Date: Fri, 28 Feb 2020 16:12:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] ASoC: samsung: Silence warnings during deferred probe
Message-ID: <20200228161220.GB4956@sirena.org.uk>
References: <CGME20200228101124eucas1p1f6ab761a38f4a953a4eeed89859fcf4a@eucas1p1.samsung.com>
 <20200228101120.28819-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <20200228101120.28819-1-m.szyprowski@samsung.com>
X-Cookie: There Is No Cabal.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
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


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 28, 2020 at 11:11:20AM +0100, Marek Szyprowski wrote:

> Don't confuse user with meaningless warning about the failure in getting
> resources and registering card in case of deferred probe.

>  	if (ret) {
> -		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev,
> +				"snd_soc_register_card() failed: %d\n", ret);

This is completely removing the diagnostics so if things do get stuck
the user will generally not have any hint as to what's going wrong -
it's better with this sort of change to lower to dev_dbg() for deferral
rather than completely removing the error message so the user has some
ability to figure out what was missing.  However in this case it's also
the case that snd_soc_register_card() is fairly noisy.

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5ZO+QACgkQJNaLcl1U
h9B5fgf/S13C+As9tfpnYGFNZjiPn/6K9QTR2M0U36HTwFtV64VWQDhIUJT8JAB7
GGcy3Tvpotahf0rdgkdwULZqR7rQlxEWDBm5oGYvVkUtPcThDWAn20ykhBTaEuqX
1aYxEB+xmwtEyS0YE+aXfTIKERWRvUThvihaSFEdSlCBFYUlpH1uuw1XjNjeS1iT
7ovjutAtzvU+E+g3Sro6mVRUigLpcl0SXLemtpICohjZna53vbUqnOQOIUm1mCBa
sWBo89lsYED8fPkNlSeQHSj01XdzR+RI8bLZqOc/cUTamMuZfEtU1oAosrdjf6Q/
L5iDpjMP+yeCLQ7XdaXZ6uK0dWaMwA==
=x5Pa
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
