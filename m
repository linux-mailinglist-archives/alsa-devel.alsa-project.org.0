Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 465EE11A984
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 12:02:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC5871669;
	Wed, 11 Dec 2019 12:01:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC5871669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576062122;
	bh=lbNtBLP5Jh3MGot7TwweGpUdJwfsAnVNkseDFiHpQJc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FFVZa9Exhus2oVObdDxXbSt+YLE4DyTUk76e1PexVP64cOitFS7yHQ5ECi3ocYcBL
	 p4JJDR8+VgY1yDfWR7pAd6EWzoklLlH/RjLbmF+/hKXoBjtM214FMcWMrv9ujJ/29t
	 81v4U3UrY/SCyXVABKdDQly8+OpJ6m+RvAwdjBkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93B66F8023E;
	Wed, 11 Dec 2019 12:00:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81CA4F80240; Wed, 11 Dec 2019 12:00:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 82914F80234
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 12:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82914F80234
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 075D21FB;
 Wed, 11 Dec 2019 03:00:08 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B8D53F6CF;
 Wed, 11 Dec 2019 03:00:07 -0800 (PST)
Date: Wed, 11 Dec 2019 11:00:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20191211110005.GC3870@sirena.org.uk>
References: <20191210210735.9077-1-sashal@kernel.org>
 <20191210210735.9077-158-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191210210735.9077-158-sashal@kernel.org>
X-Cookie: NOBODY EXPECTS THE SPANISH INQUISITION!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH AUTOSEL 5.4 197/350] ASoC: SOF: imx: fix
 reverse CONFIG_SND_SOC_SOF_OF dependency
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
Content-Type: multipart/mixed; boundary="===============4264598120119052512=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4264598120119052512==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Content-Disposition: inline


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 04:05:02PM -0500, Sasha Levin wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> [ Upstream commit f9ad75468453b019b92c5296e6a04bf7c37f49e4 ]
>=20
> updated solution to the problem reported with randconfig:
>=20
> CONFIG_SND_SOC_SOF_IMX depends on CONFIG_SND_SOC_SOF, but is in
> turn referenced by the sof-of-dev driver. This creates a reverse
> dependency that manifests in a link error when CONFIG_SND_SOC_SOF_OF
> is built-in but CONFIG_SND_SOC_SOF_IMX=3Dm:

Are you sure this doesn't depend on any other Kconfig changes?

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3wzDQACgkQJNaLcl1U
h9DlBgf/e35F0BWGMvhT5FNlVpGj/p8IkGszXFooKQx4BsGuvOs6c+gXEwfuEPoR
7bZ56PB4XPlg7EF84n9F+kj+tkim0Ra+nK1cizh6S40bWn6aL2K181WhXcJx2ECu
2eF8SEbahQEAHrabJyjQ7Mhzo+GWe3Clt9t+GGZy3ZMfS3gKVR7An7P/T8DzrPx1
yLyUCKMXuXKIodZTic06E2ZEZYndjaEBNQfR2Dvhm2tNn1pRv7MG0IypgboGu2XH
NAOHagDVS35dY7ODpkP4fVY15WFK7nIBAUrYTaVt2cSpoeKe+uxBJ4Asfh/YhGdF
L33+OFWUVb7aKiWfIgqyLv1CHov2gw==
=l1W0
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--

--===============4264598120119052512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4264598120119052512==--
