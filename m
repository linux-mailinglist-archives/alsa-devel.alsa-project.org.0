Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD3A12788
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 08:13:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DACD61876;
	Fri,  3 May 2019 08:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DACD61876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556863988;
	bh=k0S6WNc4WmV+rhXhgCmIIjdBiQvBlAqhLuycU8RphS4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Di/US7jE1ZzN8UWax2YMiSdT5bZIoEJt4Ab+13PtnXFWjad1Rnz/5CuxZjbKuOwNg
	 uSnXi6h12uslnGINda3Bidn0j/qOfeBcIgsF8DiW6+EiwNKTDknj4E12v5j1qTdZuX
	 o+jUQsFeo3t+ND9btDLNt1r1WWbiXIWllg8mB+NA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B3A6F896B9;
	Fri,  3 May 2019 08:11:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1467DF896B7; Fri,  3 May 2019 08:11:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_76 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71B7FF80720
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 08:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71B7FF80720
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="eyWvdSg4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a8B1muFE7lmKz338Eq4rDraWNNZB+Seiq1IuidyrS40=; b=eyWvdSg4GxfOe9V5fBDgDA2CR
 67XEx5ktm3mnEGj4Djz4SzHp8FsCJh8Pw4BlzCaLh4kYbNWGAqdE/RFXc1uS/C+PvQkWApQWF/vgj
 /qP0z8dRf6VBmhnRvZkienTvrq+t5UC1kdhnEAqUjcBl4T8cQYMJ0/u1PSAf5QJY4+ESk=;
Received: from [42.29.24.106] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hMRPf-0000T3-OZ; Fri, 03 May 2019 06:11:16 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id A1199441D3C; Fri,  3 May 2019 07:11:11 +0100 (BST)
Date: Fri, 3 May 2019 15:11:11 +0900
From: Mark Brown <broonie@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Message-ID: <20190503061111.GA32229@sirena.org.uk>
References: <20190502131214.24009-1-fparent@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20190502131214.24009-1-fparent@baylibre.com>
X-Cookie: Never kick a man, unless he's down.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v2] ASoC: mediatek: mt8516: register ADDA
	DAI
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
Content-Type: multipart/mixed; boundary="===============1707073498773839880=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1707073498773839880==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 03:12:14PM +0200, Fabien Parent wrote:

> This patch depends on patch serie:
> 	[PATCH 0/5] ASoC: mediatek: Add basic PCM driver for MT8516
>=20
> v2:
> 	* Register ADDA before memif to fix ordering issue.

This is v2 of a single patch which depends on an in review patch series?
Please don't do things like this, it makes it much more confusing to
follow what's going on - unless there's some strong reason to do
otherwise it's better to either wait for the existing patch series to be
reviewed or to resend the whole thing.

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzL234ACgkQJNaLcl1U
h9DlYAf+NB6GD7ylQBBA7/swvGJd8bxeuqc3fRRWHfYBVXV1nkAQOhs5IoTziCE3
W2b1ACZX9lv2scdJ/8/OwxN10Q4/i30ShHMTIPeY2/hEn6dnPcYoTQg8n+W+Ca5e
Aa0ixg+VrXMYV7mSo8qYtuVULeOK1H8drM8pA61is2RlupNHtdwdFwfiCXO6uKRU
1FKvToH0OGsohgfGXdfGlz1JpSLNZrWefcyo2talqy3GTpXnMpROsGGZyNNx0EyF
bWLfdfuArrauf4kXhF559nMoWTIuA2/paZFVNNxZrmC5C8ViyU51Yh+nAz4iLFbg
f+dC4E1ARwca+ZyOMN/7V06nYMyx0A==
=dh9z
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--

--===============1707073498773839880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1707073498773839880==--
