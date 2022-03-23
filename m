Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FC14E56F2
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 17:51:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8259B177E;
	Wed, 23 Mar 2022 17:50:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8259B177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648054290;
	bh=xf+XqqrgAYRxBHVe+Le21WDKSwsXPQzHU0dcmKDKNsc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tCnk5oT1MSB6Con4/EQL7kDFs8jaMQAyLeJgyDqb+nyu6pWbV065mvfobeoUm1klN
	 uzUHsva0vvMBfIPxnk1AlTdrzVQw2rWLBAHE7+SXYCxiyS2DsdlIRg72kcemtroVmx
	 dWjq8gHEn6Q/mKT/43V/iKUJErNqOupulji/f3kY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E866FF800F5;
	Wed, 23 Mar 2022 17:50:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27429F800F5; Wed, 23 Mar 2022 17:50:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B239F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 17:50:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B239F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TR7jxs85"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 180D3618CE;
 Wed, 23 Mar 2022 16:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2014CC340E8;
 Wed, 23 Mar 2022 16:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648054214;
 bh=xf+XqqrgAYRxBHVe+Le21WDKSwsXPQzHU0dcmKDKNsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TR7jxs85hrk9F7LYb6Np5yRPjvemuUtvMFeyYrCkftHxIzdVKAC1qsppYpXI2jxM0
 7rBycWeY/HzBLp3FRUDyhmleUjt+DgKHIZiVQdUPtzEtmfU4rNmZYyWZVF0v0boZr4
 MnlA1IBjCBSG5rdhI9UdfGQ7wPre5fRVmOcUPLqxHE6p3gRSwuyYt8C9U+NXermr7r
 VzBa67pisbnR68up76bGzTkFgTH23ASUYsJZBlfUrSIZp+jRUXdvCz5GpKzCZwajYE
 l1zepg8QDePAalyFBE7VWrBQObnxdRagTXenlrNcTmuFV2GxWLRjaoTZJAjfeKMn6l
 lBGLQyYJMti1Q==
Date: Wed, 23 Mar 2022 16:50:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [EXTERNAL] Re: [PATCH v4 3/3] update tas27xx.h to support either
 TAS2764 or TAS2780
Message-ID: <YjtPwKaH68HPsfDC@sirena.org.uk>
References: <20220323042644.635-1-13691752556@139.com>
 <20220323042644.635-3-13691752556@139.com>
 <f96222e2-dd66-45aa-7615-7fed99479da6@linux.intel.com>
 <f4ae130bbdde4bf8842b23f3cb3c10b2@ti.com>
 <eda347eb-f7dd-fe05-d670-5365899b74f5@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3IubDKez+C+CwgGu"
Content-Disposition: inline
In-Reply-To: <eda347eb-f7dd-fe05-d670-5365899b74f5@linux.intel.com>
X-Cookie: Nice guys get sick.
Cc: "Navada Kanyana, Mukund" <navada@ti.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Ding,
 Shenghao" <shenghao-ding@ti.com>, Raphael-Xu <13691752556@139.com>, "Xu,
 Yang" <raphael-xu@ti.com>
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


--3IubDKez+C+CwgGu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 10:56:04AM +0100, Amadeusz S=C5=82awi=C5=84ski wrot=
e:

> this would be probably overdoing it, 4 patches should be enough.
> Patch 1 and 3 seem ok to me, I would just split patch 2, and reorder a bi=
t,
> so something like:
> 1. [PATCH v4 1/3] rename tas2764 to tas27xx-Makefile and Kconfig
> 2. here patch renaming variables (2764 -> xxxx)
> 3. [PATCH v4 3/3] update tas27xx.h to support either TAS2764 or TAS2780
> 4. here patch adding TAS2780 support

That looks like a good plan.

> The reason why patch 3, should go before one adding support is that there=
 is
> dependency on information present in header, and you don't want to break
> build when someone does git bisect with your driver enabled.

Indeed I test for this when applying patches.

--3IubDKez+C+CwgGu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmI7T8AACgkQJNaLcl1U
h9DvAAf/TZ4OvXI/oX9r5r5UbO4yVafo3biddplmTaNgSlq3+a0L97NH04H85Edq
38qh1s3W5zonKxjBCGKHoPahFnhUiIzYDshkLr87klNW3YDEoJ3GS3ealwxk7CXz
srQV+EejEiwP2OE25eTAS0uax2XBcTepwW9+w0fszL2VhFxhOSJCa7qXXfHToLwJ
tcjOi+YoBxj82qkMvh0JGhMF6YiAxdujuIvEZxztkHNkY418P5A0Wa7pFLd5iObn
iDe49M0dpHBW2weZE7esYtIfvBOw+cI/c1//AuUj5auIyNMssOHWpVd6B/2KTvxi
B7kYttXbLwx6HiamSEFFUYo7EUttZw==
=4BgJ
-----END PGP SIGNATURE-----

--3IubDKez+C+CwgGu--
