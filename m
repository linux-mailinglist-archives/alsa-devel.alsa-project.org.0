Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0A2D3DBC
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 12:51:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 091671670;
	Fri, 11 Oct 2019 12:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 091671670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570791117;
	bh=5O3t8gqMQ/ara/KGccnq/qqvH2ZfH2W36Gu6Jd1L/VY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q0JCCxSqQM9dPnk8IRObbmaEjs9DGxfZFLybcZiyEDzh1pyOYdrdvp20Gvajx0xS+
	 mTr3LXm93Hor5z55SRVj2V0teqsXIFlDxqUTnH+QWD4XuBr4Umw3TRf+M7i0a93O9V
	 B0xHEsa79nSxQLpU0BQj8nqg89z2IyvO0cGRGLWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AF56F802FB;
	Fri, 11 Oct 2019 12:50:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02956F802BE; Fri, 11 Oct 2019 12:50:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67F26F80113
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 12:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67F26F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="oFF+nMW8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+GYaGvn6aQG4ujRHeTb1+lopvEhjRcfgUQWj4NEdRZ0=; b=oFF+nMW8ULTocBKQP7Rg0G0OD
 ULnpmBNgzEV4j+EqDbOV/8Kdzb2mh5FWrQeFQm7wEwX6fdvC1FsK8ujWRciwYHXfBbq3oXwwe+HGq
 Baau7aDhUJjlC4PE6unDctPMCzjGx3HIrkGX42kkWsJ45W2xe8WLLJQIaNMl1O16Npsb0=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIsUk-0005Sr-Uf; Fri, 11 Oct 2019 10:50:03 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 3111DD0019E; Fri, 11 Oct 2019 11:50:01 +0100 (BST)
Date: Fri, 11 Oct 2019 11:50:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191011105001.GG4741@sirena.org.uk>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-20-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20191010203043.1241612-20-arnd@arndb.de>
X-Cookie: Void where prohibited by law.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Sangbeom Kim <sbkim73@samsung.com>, linus.walleij@linaro.org,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 20/36] ASoC: samsung: s3c2412-i2s: avoid
 hardcoded S3C2410_PA_IIS
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
Content-Type: multipart/mixed; boundary="===============8991946021695153129=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8991946021695153129==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rV8arf8D5Dod9UkK"
Content-Disposition: inline


--rV8arf8D5Dod9UkK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 10, 2019 at 10:30:04PM +0200, Arnd Bergmann wrote:
> The constant requires indirectly including a machine header file,
> but it's not actually used any more since commit 87b132bc0315 ("ASoC:
> samsung: s3c24{xx,12}-i2s: port to use generic dmaengine API"), so
> remove it completely.

Acked-by: Mark Brown <broonie@kernel.org>

--rV8arf8D5Dod9UkK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2gXlgACgkQJNaLcl1U
h9DRDwf/Z97B2zjL3Z9O+QU4Fp9jlers2KrllaRLXhvKAvYYwb8JNWOGuedCmQDi
C6Gj9aBSXHmzjjFCM08/QJMG8u6TcM5H2gCjEVFOiRCMqP5DPX5qCIiiQ0SnBrdi
G78NJlKJRTR9kLnVYFd8DRx4fOHelhaH0X7n5EPUliwMpydcV81iL9zttP39m5+h
bTSe5rNrUxE6oNaq/1Ud7YFogrTUUSHQugLgRHDwsGakNFIYpP7HYvd9lYfAlX0C
dz+DUqy/Yq8FJMN3SUlsUyNx3X1LVOkKbKCiKbcwoYIaXy+YyNCPAja8eRtrWVZU
tdnsAgWDN5OszUmItgS481uI9UwV6Q==
=6yUg
-----END PGP SIGNATURE-----

--rV8arf8D5Dod9UkK--

--===============8991946021695153129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8991946021695153129==--
