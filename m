Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B117BC3266
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:24:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37CBB167B;
	Tue,  1 Oct 2019 13:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37CBB167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569929081;
	bh=1ZI2P5zv5Rc/zEvuVhRQglwPBEuC2F1rkJQItSpvlC8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sk1TSbqyzbmkjSJr2e+McilTxucBM4iXnY3lGywlOaRZa15/3qLv+/Usl3DKcUwdC
	 cRCwUZgc/7Alv9rNmkOFoRVUhxnWx9yigKR+H+lJ01J7T17bibE3jg8qO1P1RUuj69
	 iVar3yAZ4rlqRMFpcb/mjG8bnCDQ0coa1pEVqKss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3F8DF805FE;
	Tue,  1 Oct 2019 13:22:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03D3DF805FC; Tue,  1 Oct 2019 13:22:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD84DF805FA
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD84DF805FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="UuD2xK4+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h0oq3hgGKfDpPykm12Ho/6mx7zx/DDd3ddTmuUJvbLg=; b=UuD2xK4+FD+o6WJLN+Z/Qktx9
 XDiLn0jqNIDd163JcaLJ/MExArYp/HdllmlH9PFpC27RB/XLKqkfDAJwXB7At1ux1xpmBz343DEVl
 4lbddFgH6aPU1e0YyeDXREXxUaBwBsmge0wnxWy1pqyZCWBDG8meMf2b38yWO0kuGR43k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGEe-0004Ox-O5; Tue, 01 Oct 2019 11:22:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2E5FD274299F; Tue,  1 Oct 2019 12:22:28 +0100 (BST)
Date: Tue, 1 Oct 2019 12:22:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20191001112228.GC5618@sirena.co.uk>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4@eucas1p2.samsung.com>
 <20190920130218.32690-9-s.nawrocki@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20190920130218.32690-9-s.nawrocki@samsung.com>
X-Cookie: Dyslexics have more fnu.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v2 08/10] ASoC: samsung: Rename Arndale
	card driver
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
Content-Type: multipart/mixed; boundary="===============3133106887215763532=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3133106887215763532==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Content-Disposition: inline


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 20, 2019 at 03:02:17PM +0200, Sylwester Nawrocki wrote:
> Rename arndale_rt5631.c to just arnddale.c as we support other CODECs
> than RT5631.  While at it replace spaces in Kconfig with tabs.

This doesn't apply against current code, please check and resend.

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2TNvMACgkQJNaLcl1U
h9B5/Qf/X9rpGHePKhgNMopSnhX5Qe21BJNNbNjUxWxPTwsw2b1QJJ6tvlNU1Plj
JxKTplpI0I8fQNhgBgK1zkc8SECbUDRSwkR/UOBthGp2s7/ZeClSHvyTD6Z2j5IT
OyFKkFi7MLpjK4eBoIlbW5NnfZYKyC7edq5RgFBn1TZsbdaGaDrx9urqoSQwJfTF
APcyzdbqNU0Y1UzyZ8jKGGXOLljoDAHW8gpGnunvRyE3Vaw4KLG6spBkuxIuep0L
hjlRBSmx0lR4UrG7CKYmWK6UmxDIaKIUfbp5nqKOQ8V3x0mHbw4cQxQp3hv7+WYk
R5jy35YHbr0NyF5bGBiPWb8OZxJhxw==
=x8KZ
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--

--===============3133106887215763532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3133106887215763532==--
