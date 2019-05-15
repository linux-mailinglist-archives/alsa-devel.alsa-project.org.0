Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C9A1F84C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 18:16:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9F2516C2;
	Wed, 15 May 2019 18:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9F2516C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557936991;
	bh=YSHUuA3NV9SyksyZ19bmzN14LnzSMj9NroxO5wGm/2Q=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ChEa8RqqySjyC3YG++oos4tb+apL2r5IHu3V4nJyXyqtBai37C0BaqbWYNr6+UCYp
	 PgBpXyME8Tb2vMVQiXc3CGqqNRLjg3XXeTjytmKdSt9A2jwo92tUuO1dsEyJp+QBs9
	 /KmskVaMDPW4P4SxIb4qoIUybDm/96FD3HWMrw4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AD3BF89684;
	Wed, 15 May 2019 18:14:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E593F8078F; Wed, 15 May 2019 18:14:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FE6BF8078F
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 18:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FE6BF8078F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="whcgmf+Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=19PVIFtAyZRpbTMwvSf4MVZghpptgSGY1UILLVFoRhc=; b=whcgmf+Q6cV6e9oryUmSthp27
 X2FT4NXyBiKtGzmg7GBBQzHy12Tl/re9v9ZkFIUadvMrh7HtxXy7BCJYe9hPILXqicDKjjOIAtF5y
 ojVRtp3TqukVhwVU1KDTl3hl0p24qqpN1+qxzKRKW5vLQnAkojg+i2OBSUkzcE3h8medU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hQwY5-000487-0I; Wed, 15 May 2019 16:14:33 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 1BBA71121C02; Wed, 15 May 2019 17:14:29 +0100 (BST)
Date: Wed, 15 May 2019 17:14:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Message-ID: <20190515161429.GH5613@sirena.org.uk>
References: <20190416153510.GE4834@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B8280116192E@RTITMBSVM07.realtek.com.tw>
 <20190417150518.GB5703@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B828011660AC@RTITEXDAG02.realtek.com.tw>
 <20190508064537.GN14916@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B1144E@RTITMBSVM07.realtek.com.tw>
 <20190512080621.GH21483@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B13EE2@RTITMBSVM07.realtek.com.tw>
 <20190513145608.GA5168@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B14BFF@RTITMBSVM07.realtek.com.tw>
MIME-Version: 1.0
In-Reply-To: <BC6F7617C38F3E4E8CA887E07B35B82805B14BFF@RTITMBSVM07.realtek.com.tw>
X-Cookie: You will lose an important tape file.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Albert Chen <albertchen@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1308: Add RT1308 amplifier driver
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
Content-Type: multipart/mixed; boundary="===============1243662398697945326=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1243662398697945326==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fmEUq8M7S0s+Fl0V"
Content-Disposition: inline


--fmEUq8M7S0s+Fl0V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2019 at 11:10:58AM +0000, Derek [=E6=96=B9=E5=BE=B7=E7=BE=
=A9] wrote:

> I could remove comment for the limit setting in register patch/init list
> to avoid users or integrators have any expectation.
> And also there will not be any support at all the driver according to the
> limit setting.

It's better to have a comment than not have one, I think I'd be happier
if I understood what was actually being limited here - that might make
it clear why it's not system specific which is what's concerning me.

--fmEUq8M7S0s+Fl0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzcOuQACgkQJNaLcl1U
h9DWAwf/ciMiFcz1L/yJG1WiGBUz97OFAkA6T4gEaKXBPFk6Eeqq3p+EZOBivc3e
he+ivbc5nDda/iSLN4bbgGKfTxoOImo4XL8CrXoI/1FzOl+N0IuvdSgiL9eXfr2V
9jMGOeEmxKarAxKhqg2vupkZNpYfUT54YxsQ571cYc6ekRTjMUTCvi0xMNwguwx3
J/UOIe8I8DcPDCWxz4veJS+vTXfr89n7PlGqA9MJgeZR6OjV1yHrkyYWKcAY8l3B
hzwGcR7A85DLTXvXo6FIHBD/gY68nJY1h2oTvnguUCYXJc2CX820YDiTaY3zjlk+
YRHPX/aVzIgLnl7M+zBoQlCG3wrYpg==
=U5Xu
-----END PGP SIGNATURE-----

--fmEUq8M7S0s+Fl0V--

--===============1243662398697945326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1243662398697945326==--
