Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1CA1FD48A
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 20:28:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 937E41679;
	Wed, 17 Jun 2020 20:27:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 937E41679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592418520;
	bh=M23eumFEO7m/18Vd2RTbYzvO5gTDfCEQeB96lyrqjig=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M4Q5bPkYzPEUCeDs77gre3f2isCKUs5y3eCsfi6+wxw8fSe4mTnh/R1V7w1Y2tsc/
	 kqwBa7B9Rpkj1GFCkwJfNgKqSt0Qc1iHGsu3qzbVETLTT4h84075hbvnRHYFNBlSaf
	 Z3PfGuLadi1yJjAFgOZw/GSNso02QW1ERKJDIl8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0AC9F801D9;
	Wed, 17 Jun 2020 20:26:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D80FF80171; Wed, 17 Jun 2020 20:26:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BB24F800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 20:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BB24F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pq0sGFVd"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66CAE21532;
 Wed, 17 Jun 2020 18:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592418410;
 bh=M23eumFEO7m/18Vd2RTbYzvO5gTDfCEQeB96lyrqjig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pq0sGFVdooyFB5uxgUau3OLPLl6eNuT7I0DR2QsvqmhDBO76cA9EFFl+sNyStu2g3
 qzRCGyD2Yv1rtfJ7oT2X8QVxjFgk89+YqtBlmMeZGCQthIBjHrl7EAGmNAcdKGhZG1
 F64Xnjn4r3BKT+0Rivkvbl1OY+fhG8JskhCVj5Pc=
Date: Wed, 17 Jun 2020 19:26:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] regmap: fix memory leak with map->patch
Message-ID: <20200617182648.GI4613@sirena.org.uk>
References: <20200617163900.17674-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zqjkMoGlbUJ91oFe"
Content-Disposition: inline
In-Reply-To: <20200617163900.17674-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Daniel Baluta <daniel.baluta@gmail.com>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


--zqjkMoGlbUJ91oFe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2020 at 11:39:00AM -0500, Pierre-Louis Bossart wrote:
> kmemleak throws the following error on devices using
> regmap_register_patch().  map->patch is allocated dynamically with
> krealloc() but never freed.

Charles sent a patch fixing this already.

--zqjkMoGlbUJ91oFe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7qYGcACgkQJNaLcl1U
h9AQdAf/aiCzQWniNM/HM/QaHuMRCb9zM4tE5u3RHXkPzh7XABNQ1QYM9dr/3gJv
aR7eMbcI6JWime0fhShgF8X0kmSiHHnqjpXrGbtRoXs0OqfA4jKrV55tq4KtKL+y
kPo4J2qJYL4bAknKyHDC1/Cf20en8iBrH97lmvm3dXMvUgri04kgRrfSN3LA/KcD
NDNwztpwJZDnkD1Pcw0n+iET/ECR4kLG6bvfW8Gk1xGqJ7g8Yco4CcHnlW4JSlpZ
S87QCNXphLsMCBA1OHLJ7vug7a9N6vH0PirQip01gQYRqTwN4V1/Q9iGAIZ+gy9b
wvxfPZYErcY41RAidImH7LxLAYXimA==
=uQWJ
-----END PGP SIGNATURE-----

--zqjkMoGlbUJ91oFe--
