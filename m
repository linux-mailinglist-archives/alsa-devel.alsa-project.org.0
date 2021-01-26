Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E053043E5
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 17:36:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6534717A3;
	Tue, 26 Jan 2021 17:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6534717A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611678979;
	bh=0iyjx9boFIh74MC5/l/2Yp8BztMttqvXyEtvQewHavA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c98EEsAHSE7M5itXJzuZyRH3LVX9xfnx/dZfdwttiiA9N02fZQDgmBD37qFFZ5Ez8
	 qrH4zfnhTWNaUOEo9f9t2H9vPaqAkP9L/jBaONGXfdiQnG4QYfa3yz2F+tkRs2iI8I
	 hZoULLrbiuWW7cHoIOcVfHQ1SxV4ainsBa+JfWQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07950F801D8;
	Tue, 26 Jan 2021 17:34:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14E3DF8015B; Tue, 26 Jan 2021 17:34:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0D37F80130
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 17:34:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0D37F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ek4sZI8a"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 307BE22228;
 Tue, 26 Jan 2021 16:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611678878;
 bh=0iyjx9boFIh74MC5/l/2Yp8BztMttqvXyEtvQewHavA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ek4sZI8aCOq02qRSkkAah5D3YfuYGj9sge2KMt6yowtj6N0AE605A/AFr+Dtq69n3
 3BnzIcR8LoG5gejwnhlGMZehSA02+zTsnBkxAQNJJOYkVPXy3qe1ORHyNpodqL55vQ
 Ec+9XxyG8Wizd40+eFXuPj9ALr4B+JOMLptgjdQzX2aLbQvAekXpVqcXKZuM64525g
 iFSmbjqtzq4lLJuPO7J4iaSbXqOl5P8mibuTX5hyb6/RpB1WMaWSc3JaqoiDDa/D/u
 c2J9jwsppZwW+MyhO/8z7HefwoG0YD4NdGJAHWhxhDiDiJHQ659zo5xT44s3nFeQk2
 inn5zy0EHBhgQ==
Date: Tue, 26 Jan 2021 16:33:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH 1/2] ASoC: soc-component: add
 snd_soc_component_read/write_field()
Message-ID: <20210126163356.GD4839@sirena.org.uk>
References: <20210126122020.19735-1-srinivas.kandagatla@linaro.org>
 <20210126133612.GB4839@sirena.org.uk>
 <6816a9fe-9b71-6a39-485e-1b6ce2b732ed@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
Content-Disposition: inline
In-Reply-To: <6816a9fe-9b71-6a39-485e-1b6ce2b732ed@linaro.org>
X-Cookie: I don't understand you anymore.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, vkoul@kernel.org
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


--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 26, 2021 at 02:03:29PM +0000, Srinivas Kandagatla wrote:

> Does that look okay to you?

Yes, your proposed versions look good.

--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAQRHMACgkQJNaLcl1U
h9ADwwf+JT6mbAuIukTVeyd/KxuU+4ZK6Kq36Lwy7d+pRUHdwy/6sJ3z2fwr6EA3
Km7ACyvU6uWpCbmTZkVbHbaIUnz5S+sqfGKXWJCLs9/5aNHsJr1hYa3C/nAe43fK
aZ3oxmzq5tqisBS+M/4RpsrpRbgCmDLV4oeC8YQ7BcJSTZ3Y4FYSlNEaRaEtBK2L
qJSB6cVIwHs1nEpTI/8nL7MYgv/MYvlsaOhRUR92csp/h3pNB+FAOjnkXMWN8Yyj
RNWfLjYdH6sX3t8hUoSedWNFqQ6NsEZ+JeJ4k8GjP1fS0o0UoMR/3XfkkxmNm4eP
ONn79xWMP5K/tbcJ/ERQyMXrugYHiA==
=IBI4
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--
