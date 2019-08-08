Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB2286D1F
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 00:23:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2904385D;
	Fri,  9 Aug 2019 00:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2904385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565303037;
	bh=xG8yCVTeUgEaxakP+ZKRmPOyOAxyzelZeSq2BwinKcI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lqmdYzfEqkmyOVMb+caje+MZJlSCqHL39jOHDR5GyQsVtoDEOByX92VN3+vngxO7S
	 Eo4MHJJ3L9eOBhG7GKhbp9WJ7Rrm5obbXp4zi0QNw/rjQd+mE1vBYq8FMFi4bJMeEp
	 66GowXyJoJebVrmwb5xNPL4DMjTmo4Q3FuHb7UIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EFC5F800E3;
	Fri,  9 Aug 2019 00:22:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9494CF80534; Fri,  9 Aug 2019 00:22:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E5B7F800E3
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 00:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E5B7F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qv6GsDJ1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HFnkpA3vj/BFHkb8G88ki/KtSQT4H8Tm6TMvUHjUd1Y=; b=qv6GsDJ1e+dtXT2MwZT+u8F8S
 7n08vUBz3ycXKLjhrZ6PmjXxvqLjYXIgAKxvTL4W9likJS8sIU/u1qw606gVPoVCmiEtSabt9Hlxs
 F1EXC+OupiZSag7Cgl8hoS64BzsIlIUsQWyzqN4csA6kq0RthQ0+5gdhatrcoCobbTAJs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvqnK-0004DY-7M; Thu, 08 Aug 2019 22:22:02 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A2A352742BDD; Thu,  8 Aug 2019 23:22:01 +0100 (BST)
Date: Thu, 8 Aug 2019 23:22:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190808222201.GQ3795@sirena.co.uk>
References: <20190808095715.29713-1-tiwai@suse.de>
 <ae7d32fe-a279-8309-2370-1832edcce413@linux.intel.com>
 <s5hr25vhg22.wl-tiwai@suse.de> <20190808190343.GK3795@sirena.co.uk>
 <s5hftmbie9i.wl-tiwai@suse.de> <20190808213311.GN3795@sirena.co.uk>
MIME-Version: 1.0
In-Reply-To: <20190808213311.GN3795@sirena.co.uk>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [alsa-devel] [PATCH 0/3] ALSA: hda: bus cleanup
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
Content-Type: multipart/mixed; boundary="===============4111359268216482010=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4111359268216482010==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dUqh8vgUBVXHzm9w"
Content-Disposition: inline


--dUqh8vgUBVXHzm9w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 10:33:11PM +0100, Mark Brown wrote:
> On Thu, Aug 08, 2019 at 10:38:33PM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
>=20
> > > I can do that easily enough.
>=20
> > OK, I pushed out the branch topic/hda-bus-ops-cleanup.
> > Please merge this one and topic/hda-dmic branch into yours.
>=20
> There were some conflicts which hopefully I resolved OK, it compiles and
> everything so it can't be that bad right?

Had to rebuild this since git has a bug with recording merge conflicts,
just pushing out a new version now - c2f16a94a80497e4b28c27f9ca2cd6cd60706f=
b6.

--dUqh8vgUBVXHzm9w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1MoIgACgkQJNaLcl1U
h9A+Lgf+OjT474QET27zAxnAHq9J7rgyNL2aZYt8Vll6YO1QtIqx4dbatRIf35b8
dHL7Kr/B2SZJ9sFNQ7uG7CkoQ6awlQ2EODz8evfYbX+QpxdVPwg8ZYkxelNWm8Tj
BWlVvXvRg5qo3jEfiJcrnD6X7lpkJ4i5VACSwhF1gEUp+/BqHv2/5tF93t/usedL
8Z92n4cwswHf1Od1T8oIBzYgTS9GJixbs0loxgAKSODl33gKE51UVPJ9E+qpF5bP
GrmVjI3PXiVM3wD2AvYdQiUc2UVsKL3IujupYSmpBmXaHZ9iedyewaQq12FVnEXS
dvVDRNz6Puk6qi3osip0+E6OWZsrlw==
=wmA5
-----END PGP SIGNATURE-----

--dUqh8vgUBVXHzm9w--

--===============4111359268216482010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4111359268216482010==--
