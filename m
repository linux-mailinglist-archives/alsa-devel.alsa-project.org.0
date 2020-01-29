Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC2314CE09
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 17:13:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 707F5167C;
	Wed, 29 Jan 2020 17:12:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 707F5167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580314387;
	bh=fzZPUluOkKnlmLi/W2A9zWkNcwTU2DQte2HfGA1aaGY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JncVJM030Zd9DpWAu1KUVJVSuhMiLQxSqEM5TW5HOklAJfrifo46QQ+NwjiESnU6Q
	 0DOqETVxh4OwdCOaLWehS313qml8g2yuObi6RhgE7u3xxMmx2o/BFHWylumui+FzSo
	 4YtAXNciU+ZMM1zj4IHQn19ERAfBuPZu+WVXSygY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66D79F80082;
	Wed, 29 Jan 2020 17:11:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 726CCF8021E; Wed, 29 Jan 2020 17:11:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 296A1F80122
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 17:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 296A1F80122
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9897A328;
 Wed, 29 Jan 2020 08:11:18 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 171023F52E;
 Wed, 29 Jan 2020 08:11:17 -0800 (PST)
Date: Wed, 29 Jan 2020 16:11:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>
Message-ID: <20200129161113.GE3928@sirena.org.uk>
References: <5e31aaaa.1c69fb81.a7667.f187@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <5e31aaaa.1c69fb81.a7667.f187@mx.google.com>
X-Cookie: Chocolate chip.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
Subject: Re: [alsa-devel] next/master boot: 148 boots: 10 failed,
 136 passed with 2 untried/unknown (next-20200129)
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
Content-Type: multipart/mixed; boundary="===============6753911349523547415=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6753911349523547415==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline


--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 29, 2020 at 07:54:18AM -0800, kernelci.org bot wrote:

Today's -next fails to boot on Odroid X2 and XU3 with exynos_defconfig
or multi_v7_defconfig with SMP=n.  It appears to get stuck in a loop
probing the I2S secondary DAI for some reason:

12:07:05.997409  <6>[    6.421596] exynos-bus: new bus device registered: soc:bus_mscl ( 84000 KHz ~ 666000 KHz)
12:07:05.997653  <4>[    6.429763] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s
12:07:06.006838  <4>[    6.439652] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s
12:07:06.015764  <4>[    6.448666] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s

and so on ad infinitum.  Vanilla multi_v7_defconfig is fine and just
displays a saingle copy of that log message.  Full logs and other
details here:

	https://kernelci.org/boot/id/5e3176467f121dbdef2824fc/
	https://kernelci.org/boot/id/5e317b7322dcdaa3e5282500/
	https://kernelci.org/boot/id/5e317c0f6bfd765fb42824f1/
	https://kernelci.org/boot/id/5e317517be8559c7542824f1/

I don't *think* it's an audio issue as mainline seems fine and all the
ASoC changes have already landed in mainline for this merge window.

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4xrqAACgkQJNaLcl1U
h9ATugf/ZQktKxJUE958PkbhFp8L06jo/MfX8fgEE6ntse19PBpXeuilaGQUAPJ7
JMfQp+W9juAvCnOSh9WFvc1jzs+gVNS8KgxuPNVwNsFf2IrRRegGtC/WnnadBjJ1
Ud/4su9USIquKP1QAI/6J/PayS06xyzkwWIiO9F7YqWHUQlS3sijE3rR2ik3NqRU
Xelgon/8TonC//tBv6OSP3aX2y1US/l1P8fqtZBpQL/wz7ZBxuaWaK5Mk46ppSmk
O2X9aooL11ie3Bo2erGOQomMcy8/i70DqCzGwCXdoay1BPENPNZ9mMTmCBrEvHfL
amhYBa+Zwl2H9Gl09SNTzgjQY7b/Ow==
=2GQU
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--

--===============6753911349523547415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6753911349523547415==--
