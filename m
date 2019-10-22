Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E083E096C
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:44:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEB9D16AA;
	Tue, 22 Oct 2019 18:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEB9D16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571762674;
	bh=FUIyinrS21A+0oRbh7gbAC0Itob1VNuR/9e82YjqZUM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SWpBZ0ochyslH/Dr+tXYKqMdnEDAG5Ju0yeUqLTaVr5tRuiKyedhT1+FQ6tLYVC5q
	 GGnaJXCXAL3s3aVL3uZuEN1LO9f8Fod3NcOtN7j4YZW9MsJGYwl3nVLeoR/y3rg8XU
	 av02hKDAqcn4cxVHCXAV0dO5cC+RcZMHugL/EoKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ECDCF8060D;
	Tue, 22 Oct 2019 18:40:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F136F805FF; Tue, 22 Oct 2019 18:40:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBC80F805FC
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 18:39:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBC80F805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nmZ4YUJZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qzw4H24i5wT2P9XqsoiLtE39qc3Xr5JeEHgOsZqF2E8=; b=nmZ4YUJZkXoFq/0K0+fsp/oLi
 v6olQ5aRCRgeis8SLK8AL9g5WKFw1fwkNYSW2r0RJxXLxZCvA7WHLq2lu3GafBLvD4faZZEGhw+xO
 v36gO58/IlzFCRkEtqLIGPwX+jF1cHdODPGyEUbT4Ywsrn7OU92hktD0zZ2z2MGKvS5fU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMxCQ-00074Z-Fm; Tue, 22 Oct 2019 16:39:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 039C42743259; Tue, 22 Oct 2019 17:39:57 +0100 (BST)
Date: Tue, 22 Oct 2019 17:39:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191022163957.GW5554@sirena.co.uk>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-32-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20191018154201.1276638-32-arnd@arndb.de>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 32/46] ASoC: pxa: i2s: use normal MMIO
	accessors
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
Content-Type: multipart/mixed; boundary="===============4234705438460990006=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4234705438460990006==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QVzQgM+zdZ3YWXqn"
Content-Disposition: inline


--QVzQgM+zdZ3YWXqn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2019 at 05:41:47PM +0200, Arnd Bergmann wrote:
> To avoid dereferencing hardwired constant pointers from a global header
> file, change the driver to use devm_platform_ioremap_resource for getting
> an __iomem pointer, and then using readl/writel on that.

Acked-by: Mark Brown <broonie@kernel.org>

--QVzQgM+zdZ3YWXqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2vMN0ACgkQJNaLcl1U
h9AR2Qf+KErM5EMnNx2LKVCOPfSuSN0Tyx/CfJONY87iW8gmPKc33rZ7qwEETZOm
oJpXIqkpkv4i20C/g0p8tma1Tc5S3nSchO4+DGEXf6Ym/0EMz7XweRalM9IpdI9E
TjdnVCbBt1JXRGeHp7MJJb1/Y7pNUhmUiTA4Tjy9a2LLTCwNqjNplPFikzEpT7h8
UmcDTLkr/evh6CCETbmWcdFvWCYsqHi866/9VHvfU7lSAQ2agmxQ9roTZ/mQZpe4
0xpDBqHawfsw7hoHrLpdz3TQcu6p27muy9ECoJ08WiCY7qYt0vR7pEwItPHaQn27
VzNBaEhD/oaZIr7AtQ7335B0Z4zz3Q==
=0eC3
-----END PGP SIGNATURE-----

--QVzQgM+zdZ3YWXqn--

--===============4234705438460990006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4234705438460990006==--
