Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB92136B52F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 16:44:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67EEC1686;
	Mon, 26 Apr 2021 16:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67EEC1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619448287;
	bh=NEeQ4EruQnOHxrjpszRpyZMHSQFNWSJbOxCIXxRd3Bc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IlfqtMupYCVUjfxMlqVnkt5MMeSgKUSy6jYWkzQidhinImjrz5AGDO9dnPtTN3Jy9
	 3lK/d5PzX3WKYJQ7K75xTYHkT/zJ4edPEATJpy2G2NnOe3p7CoEZUTaGra7ZR7r57o
	 4t2VSzzrh0tR7Kc5vBK3ao/OlLu4PUH7MY9WaGBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A50DEF80171;
	Mon, 26 Apr 2021 16:43:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F91BF8016C; Mon, 26 Apr 2021 16:43:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35818F8012A
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 16:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35818F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R1AcrUkb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C08D60E0C;
 Mon, 26 Apr 2021 14:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619448191;
 bh=NEeQ4EruQnOHxrjpszRpyZMHSQFNWSJbOxCIXxRd3Bc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R1AcrUkbTKcWLHCBLnQUOtT3SeGk2ZvzLVhfIJ8ur6FiRdUyvm5zxYuTrmyPrWDZ/
 LXL3tT7K+rwHwiuPkXOZstveSIUrJW4XKZRGPwcBi9fsk8+/Vk5zZW/5CEawBByYLn
 PnJ0a76ZpHQB4AYc0UjwAtzWpa2EYvACwBRJXQ1IptEDzisRuKwCNrIym9E4ZxnDp2
 /wk8Gw56dEKzZyhHK86znfOaF/Wp+514hsaBpa2dvlnzOVyyEpS5dIsNHhFwXmOqrW
 L7XQsbj/lrwYACp0D2he5G46hnJt+47iFblGg41AGewPb/F0Z3oapJLv43oXQE1Gco
 tIDbkFwo8tL4A==
Date: Mon, 26 Apr 2021 15:42:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: broonie-sound/for-next bisection:
 baseline.bootrr.asoc-simple-card-probed on kontron-sl28-var3-ads2
Message-ID: <20210426144242.GF4590@sirena.org.uk>
References: <6080e82c.1c69fb81.cd60c.2a13@mx.google.com>
 <3ca62063-41b4-c25b-a7bc-8a8160e7b684@collabora.com>
 <877dkp5141.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XIiC+We3v3zHqZ6Z"
Content-Disposition: inline
In-Reply-To: <877dkp5141.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Zeus gave Leda the bird.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jon Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
 Thierry Reding <treding@nvidia.com>, Stephan Gerhold <stephan@gerhold.net>,
 kernelci-results@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
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


--XIiC+We3v3zHqZ6Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 26, 2021 at 09:41:02AM +0900, Kuninori Morimoto wrote:

> I'm not 100% sure about kontron-sl28-var3-ads2, but it seems
> below doesn't have .name, and I think no one add it to
> sai->cpu_dai_drv.

> 	${LINUX}/sound/soc/fsl/fsl_sai.c :: fsl_sai_dai_template

> Maybe it is the reason of naming "(null)" ?

Seems likely.

> If so, all sai1 - sai6 are using "fsl,vf610-sai",
> all saiX doesn't have .name. I think it should have different name.
> In your case, at least, sai5 / sai6 needs to have

You could send a patch along with re-adding the three patches I dropped?

--XIiC+We3v3zHqZ6Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCG0WEACgkQJNaLcl1U
h9BjDgf+ONWBtF7V53jG5s2MEtMAaQGjYMPl4mrsbu99hpJx4ecmmcHyQpETITl/
7NUfmiuxz3O/fmXCY2aPCQ6NvLVxnEfDhUKpWaqKEnHZBPZLdNnxxrUHrMbPXj2k
bDL/spL8mEWSgXzMlIPQtVH/pjPLaTopevlpJ/Sbbw+TuJ/9EhhEwfsn9Wuozica
1fr+rnisgDTopQiwiqJb3SbH8gNjQhWlvdja+y14Wor7R4Cl9n6uxupbYKTMw1vx
rlLeIIMzbZNr3fdSkxnK4aYiczBQ8XqfE7blXy3e+/TS9JDEDLrvC465A26fIt2g
3E4Jf6Z5BRtRb8TeFSAb6bA0/sEQYQ==
=DKxv
-----END PGP SIGNATURE-----

--XIiC+We3v3zHqZ6Z--
