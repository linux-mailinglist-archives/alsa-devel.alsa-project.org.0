Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB332D59E6
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 13:01:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DBE0167C;
	Thu, 10 Dec 2020 13:00:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DBE0167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607601662;
	bh=PjRXfNwwNNxRxtmoWX/XK3WiMERL8ANubSMVIm9lqSw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YBcBdc6Y8OuWq7Wj73uRKfZKZly1fHj8uPFMnFvThoGnOIJCDSfAaa2iOGE2ItTEa
	 FXJX/4m963sJ0aE50DHB/AD4T5VHtAnTTrE+QXtp4hUdviczgADl4a4sh5qTtx45Ny
	 aX4P7jx0URLyvz0Oa1tW0qDJ0sevWiuk2xhTtf7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D6ADF8019D;
	Thu, 10 Dec 2020 12:59:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69CEEF8016E; Thu, 10 Dec 2020 12:59:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3403F800E1
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 12:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3403F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c0WGPQ5y"
Date: Thu, 10 Dec 2020 11:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607601555;
 bh=PjRXfNwwNNxRxtmoWX/XK3WiMERL8ANubSMVIm9lqSw=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=c0WGPQ5y0TDK06OtlMsr4vn5qWLOMkmHfD0+Dg3kt241O764C7FhI4ExCOb8oyXjb
 cqOuNIK7UzaejpMSGOrwQQm2HgfCNF/5wFcLPyyPeZ5ZhxAvMmgzYe3YMw9BwkhBLK
 sZxv5iSAiFPyW2IDxAxvDJcx6n+efSgOxleVeP/r4d7th4Ppx9pafNXx8LVdsqaajV
 FfYgSh9nvJY8+l0oSKDTJJ/RZ5cf0Io1Ntu3HYD1p6ivcVoGbVS1z9sSvAFTOI1hc5
 C9GlSHEjxJsUHEVgHOMA2JbCf1sbauaprIKEIwk6ckG7s+f+wpzwK+jzuoV9rVA9x8
 tkJ35lRyqShWw==
From: Mark Brown <broonie@kernel.org>
To: "Liao, Bard" <bard.liao@intel.com>
Subject: Re: [RFC] ASoC: max98373: don't access volatile registers in bias
 level off
Message-ID: <20201210115907.GA4747@sirena.org.uk>
References: <20201109135543.7862-1-yung-chuan.liao@linux.intel.com>
 <160683107675.35139.2203434126118347345.b4-ty@kernel.org>
 <DM6PR11MB407439429C8C348D61DE4E8AFFCB0@DM6PR11MB4074.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB407439429C8C348D61DE4E8AFFCB0@DM6PR11MB4074.namprd11.prod.outlook.com>
X-Cookie: Your step will soil many countries.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "ryans.lee@maximintegrated.com" <ryans.lee@maximintegrated.com>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 10, 2020 at 06:18:45AM +0000, Liao, Bard wrote:

> > [1/1] ASoC: max98373: don't access volatile registers in bias level off
> >       (no commit info)

> Sorry but I don't find the patch on your tree. Is it applied?
> Does "no commit info" mean the commit doesn't apply?

Yes, this was a b4 bug and it wasn't applied.

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/SDYsACgkQJNaLcl1U
h9AJvwf/ShARsLMySjpTfVysqMolgZ3ZbvqPvklVu7DtDnInsPDIU6eBTVV9CVDU
cUXVBR+2TlZNnvo0BVpTTcCQXmQbNX850mnRv1uWYbSfnt0MVNWa4VVKsSR0LU1r
UTN1z87ALDALqhKv/sUc5SYxB6sxPI3Ty5iK8vaInuPNh4+dbVHHU/pdm+OylD29
gvCuoiM6Z77C4kLtgqRH//U8SoJ7T52mWYUj89m/Irzj671gkqvAyFw1PEqC+u62
MLFEh/t8R+IjC4UTncIr9ZCouC+Z9sYsH9uUK61umDoG8/dF6q5zBjkqfOuxSi8K
j5rnHdwQHajU3jKo/AQt6zoHvuXcAA==
=Qa3d
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
