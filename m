Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F02331106
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 15:39:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5516185B;
	Mon,  8 Mar 2021 15:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5516185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615214369;
	bh=Zb8DKQnu1TVEmOaYJrfupIqv9XI8RE4ij4ltQDSLnLs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AJugrOVwlmngZemJAk0lpnyKWV2o/d0CVI4KydWYF1/lPHCRm8t892T1YdF4qgk5B
	 RK/aKfrU/A6ukq+JBlIssAprDBlgH5Z06NOMPvrhSGHdrWokDR4dcT3b+bVdJRuOUe
	 GxGsAB7tF9PWNuuQnB8gJ/g151sK/QTqYSlrFLQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 088DBF801ED;
	Mon,  8 Mar 2021 15:23:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95F98F801D8; Mon,  8 Mar 2021 15:23:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9AFFF800D0
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 15:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9AFFF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oPdaQdrY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3599651CC;
 Mon,  8 Mar 2021 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615213378;
 bh=Zb8DKQnu1TVEmOaYJrfupIqv9XI8RE4ij4ltQDSLnLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oPdaQdrYZ6rvVQJ1v/pLUIJI7aEviku/k+xSMLJjolCqQ2d20IVyYjApKVQJaa5rm
 O3c9uW+rZ67Z5Acw2pbotwlZpRIzm+4ZcFWKNvyrnvwptqmOXlUSd8fAIrv4KvLWYz
 aAQfFzEObX1sYmKZ41VYKSEoaTJs4BcBFyi7HrW01bdKR+nygowWd9/B9x6RF9Ig9o
 zLbWTTS7nI9t/SdkUtyKOFuuJj0/IzRlEACHDsVXZdQv4W6oB+g8btB1PTNxexB7DA
 CnVT+R67WgNq+pA0VSRbKY8WseoUxO1fp9XfOh5TvULNjv8396CEt4Vfk4MRKCdOBN
 8VlPvRmpv4sdg==
Date: Mon, 8 Mar 2021 14:21:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: remove zte zx dangling kconfig
Message-ID: <20210308142147.GD4656@sirena.org.uk>
References: <20210307162338.1160604-1-pbrobinson@gmail.com>
 <20210307162338.1160604-2-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline
In-Reply-To: <20210307162338.1160604-2-pbrobinson@gmail.com>
X-Cookie: Am I SHOPLIFTING?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Barry Song <baohua@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jun Nie <jun.nie@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
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


--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 07, 2021 at 04:23:38PM +0000, Peter Robinson wrote:
> In commit dc98f1d we removed the zte zx sound drivers but there
> was a dangling Kconfig left around for the codec so fix this.
>=20
> Fixes: dc98f1d655ca (ASoC: ASoC: remove zte zx drivers)

Commit: 6973bba35377 ("ASoC: remove zte zx dangling kconfig")
	Fixes tag: Fixes: dc98f1d655ca (ASoC: ASoC: remove zte zx drivers)
	Has these problem(s):
		- Subject does not match target commit subject
		  Just use
			git log -1 --format=3D'Fixes: %h ("%s")'

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBGMvoACgkQJNaLcl1U
h9C1jQf/ZdMMZ91IWuV7Zk0JI9m0iss3F/0k/bGCMBJo8BsrfMscOgk1Mf8sLHj0
DT5W2PRrvh9aEUGwiYjRwmu9ucPArgrev69UPUikERfx9wVi7GRbFgEEB+LHBHxF
9FGnwFrNmdt/9hOsP3EE2nWAl+howKqnBlcWgZF69SwcOiwhvIFsw0lo/nEXP2hA
d78YhbReObuahUGXldiXNYVmCfXfXJOW9gnFQ7sVMZB4kAwoDdg2YfhIpBVXloBd
Ai4zw+mUAsj4ONTt/D1rq+0qumZsUS2emSDRa8GP2pO3HjaFy22Q07AmUqkY73mV
0Aao5CCFGHwWK67eg9f4VT8gqfCv/g==
=XBNu
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
