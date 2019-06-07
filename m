Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BDC39519
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 20:59:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67A0F1657;
	Fri,  7 Jun 2019 20:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67A0F1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559933960;
	bh=OmyKfbXdtTfwFQDU2OhTa2tNqzFL700A6ZWebvKqn4M=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C0RWzBQKzHH1odzTdpQZ1urRDE6DZGEAFCoqIOK9sakNOtdQUeWLSV/SkYOoySGBg
	 mLPs75Zl01j0fe/+3Z0OpflHiWqVfZjluNKD2rw2SOExTi8M5PEUvHXS3eVmv+VPBm
	 yUsx8bZPxsMOZSxvB0sGhXpjCSIU49HDuCyRH5A4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C9E8F896DD;
	Fri,  7 Jun 2019 20:57:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA804F896DD; Fri,  7 Jun 2019 20:57:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9F3EF896CE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 20:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9F3EF896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ijjX8AWy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7YyENcgYWnUWI0h+gXa3lXdPcIrCG64rkMR0qaxWefQ=; b=ijjX8AWy397IdifJa14T0D/YX
 BkXzDVhOp95Tx13tZjLebfD1hROXcd8FgYT5w6FrrMVX5g50APbN9HlO+DU2oj4+jHhK6ljdqeRWg
 3Egtq8SlTs5zgoZ8fZsJfi6AE5qQX5amn5S4BrEICT4xNuyJxzgfzfNHeOmG1u089SiLY=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hZK3N-0003f5-6I; Fri, 07 Jun 2019 18:57:29 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 7BF8C440046; Fri,  7 Jun 2019 19:57:28 +0100 (BST)
Date: Fri, 7 Jun 2019 19:57:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Message-ID: <20190607185728.GJ2456@sirena.org.uk>
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <effeafed3023d8dc5f2440c8d5637ea31c02a533.1559933665.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
In-Reply-To: <effeafed3023d8dc5f2440c8d5637ea31c02a533.1559933665.git.mchehab+samsung@kernel.org>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v3 17/20] dt: bindings: fix some broken
 links from txt->yaml conversion
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
Content-Type: multipart/mixed; boundary="===============1889092994111180717=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1889092994111180717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hEaoa1KyNVzF3lFU"
Content-Disposition: inline


--hEaoa1KyNVzF3lFU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2019 at 03:54:33PM -0300, Mauro Carvalho Chehab wrote:
> Some new files got converted to yaml, but references weren't
> updated accordingly.

These should probably just be sent as normal patches rather than tied in
with the rest of this series...

--hEaoa1KyNVzF3lFU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz6s5UACgkQJNaLcl1U
h9CF/gf6A8YyjbtWR9vuIU+hiuuPGNe8l/3mKrBQmFg2nEkOiWE+N7jc0/RT0WYy
PdT6jbc6Cwn5mJJ6fqF0h32OgglLotXMlY3ZtBPiTYfgyfXYLDw8717VzdoI3BBq
AAprBuCMcg0qZJLD5pYXpWCO0cMo0YZU9dRMIFYeuw/U3RMw+oCd+mf38tXh5kce
dFFdfcmYNcxsRyICaJl42uB5swb46QAtSo+9HiOLhTQy3kMJuBVAoKjG9OjVbgNX
w9xYiPp4+6GikQO7Vl+901wH80kUHNSaZYfiTUfssYQHaorIrdRYZCd2RfmK9NO7
LeseTuJ18aBVgxKkqDEkks1EQqQrEw==
=sF8P
-----END PGP SIGNATURE-----

--hEaoa1KyNVzF3lFU--

--===============1889092994111180717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1889092994111180717==--
