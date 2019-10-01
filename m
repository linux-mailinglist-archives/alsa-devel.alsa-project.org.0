Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C261C3264
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:23:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4CD31676;
	Tue,  1 Oct 2019 13:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4CD31676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569929019;
	bh=fTel2VBHI0dMMes1AGihBNsYWml1OpL8CMXZxPGs3JU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=egNIaVv1FrGGO/O08v2quXawu+sDVi/jFZSzJBiqBxxcZtHcKAWusbL6UWnvvozfN
	 Y7OHpPjgRSQU4LhAF3WvfqqyqwL3qTepHIbqXJ7Ll7DMo4hsWvXgrN5VaT2s0bgCDU
	 Orko6nulzODt1gg38XyjeRX7Nc7tYM25AbrpHV0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20F42F804FF;
	Tue,  1 Oct 2019 13:21:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65E5AF80506; Tue,  1 Oct 2019 13:21:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19E8DF800D0
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19E8DF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tqz2dO5e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WP08K81EP8nRSl3NecDTAL6O6lhtnramqxO7uUpAriw=; b=tqz2dO5eKDmISNQTeYJ2MH6GC
 03ziUcUXkSlarqF15sDoo7Q/ZXlc5BXRQJioCbeaJhkUSTPxhv9s3xKHdKl5e4aoe2/0RwcMrrp72
 7VRX1VWWlK+ybEScOSHExQMH8Wy/pH/U9uHa4fkXHJ9peDwhUUi9j2WvkCm92xPCFatbI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGE0-0004OZ-Ax; Tue, 01 Oct 2019 11:21:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7E257274299F; Tue,  1 Oct 2019 12:21:47 +0100 (BST)
Date: Tue, 1 Oct 2019 12:21:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20191001112147.GA5618@sirena.co.uk>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130318eucas1p126cc8be60118ffbf1f332626dde1c05a@eucas1p1.samsung.com>
 <20190920130218.32690-6-s.nawrocki@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20190920130218.32690-6-s.nawrocki@samsung.com>
X-Cookie: Dyslexics have more fnu.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v2 05/10] ASoC: samsung: arndale: Simplify
 DAI link initialization
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
Content-Type: multipart/mixed; boundary="===============1589042140488344666=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1589042140488344666==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 20, 2019 at 03:02:14PM +0200, Sylwester Nawrocki wrote:
> There is only one DAI link so we can drop an unnecessary loop statement.
> Use card->dai_link in place of direct static arndale_rt5631_dai[] array
> dereference as a prerequisite for adding support for other CODECs.
> Unnecessary assignment of dai_link->codecs->name to NULL is removed.

This doesn't apply against current code, please check and resend.

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2TNsoACgkQJNaLcl1U
h9B8Jgf/QOtwWNhy8BAfZQIc2REqWPl8fmuaapDD6MEvJOA3b+piDx2e6Q9YvKjq
afK2TLU5HN42PJIr5MTFPljexJovF0uhsmzekrLgYPV9UJR6KzsnoMtWq0aIccyu
KFRsyntw3MK+Ot9TxDVIpK/tGC4s2rAV+hJO7XV/t0V62Z3r91t0Ncp+wVxibwga
rxG4oFnwQYNp8aIpzKNc4GOqJ0W1A/5JOgUALtMlGtk6W7FJqOg4xmLsQH8TG1ne
j5YN7VCoJnki8nFk1JjiikxYYcvSLjxuB0nD/GlbBnP5McroJrCrKV/nJSooYkwd
+Sp8RijARqOYXpEbsVnN8K+DflY9pw==
=RFd7
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--

--===============1589042140488344666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1589042140488344666==--
