Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9189F202E3
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 11:54:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 002EA16BF;
	Thu, 16 May 2019 11:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 002EA16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558000475;
	bh=yZIL+NxeOAfZ1PpDedOJydhhy6N6vCDTDhjttYNuCm0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLIIFwOWCdKpCwL12XxkOlgOn5t6oZWuZDlO2dxpEvhs0QTeerx5afjwuxctKy+eC
	 lBaBjDDDVjTzkxtECo+BlFFpkHsAaG+rvIPYl4mpWThYyaGabQEWjyOpnPLgQzgZU8
	 IJiRgQU934HBxB3vI6Xz4ElDapisOrZJVqlzsxIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 482CCF89693;
	Thu, 16 May 2019 11:52:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAE22F896B6; Thu, 16 May 2019 11:52:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CB82F8078F
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 11:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CB82F8078F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AopzEBy6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SnysxzB43S8oxCp2NWgjwoIiwEljy/JC2KPRQzjGbX8=; b=AopzEBy6K6R2Q+Tk4AZiHIhu1
 Z0aeRRaaS8CiSwbpyPZLaMSyRUz4nrWZ3yP0DWktl2mVvkcEuhQ7E0doBnbi79SJjtFQIUHeRwo4E
 6usNcQfjTRukA2CoDYPjLJoq1KHORzrdZ+OztBP1BL/XokTQ7NDc9sT61RTgoR7Z3T/hk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hRD41-0005zx-Qy; Thu, 16 May 2019 09:52:37 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 3EC1E1126D3F; Thu, 16 May 2019 10:52:34 +0100 (BST)
Date: Thu, 16 May 2019 10:52:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190516095234.GB5598@sirena.org.uk>
References: <e182bf72-c369-7344-e4d1-0524b09ca489@flatmax.org>
 <15b3a74a46f3c17f9240e5d90805e4056f80c55f.camel@nxp.com>
MIME-Version: 1.0
In-Reply-To: <15b3a74a46f3c17f9240e5d90805e4056f80c55f.camel@nxp.com>
X-Cookie: <ahzz_> i figured 17G oughta be enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "S.j. Wang" <shengjiu.wang@nxp.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "flatmax@flatmax.org" <flatmax@flatmax.org>
Subject: Re: [alsa-devel] ASoc : cs42xx8 : merge cs42xx8-i2c.c into cs42xx8.c
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
Content-Type: multipart/mixed; boundary="===============5806011392624164275=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5806011392624164275==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2019 at 06:34:47AM +0000, Daniel Baluta wrote:
> On Thu, 2019-05-16 at 16:15 +1000, Matt Flax wrote:

> > Is there a reason to keep these two related driver functions separate
> > ?

> cs42xxx codec has also an SPI interface. If anyone wants to implement
> support for that it would be easier with the current split.

Right, that's the reason for the split - the split would need to be
redone if anyone wants to add SPI support.

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzdMuEACgkQJNaLcl1U
h9B4/gf+NjLSAA6IupLoX3Fba1yPJQGR+BIHpC4hNUgTBX4dkVEnRAYOJAud0KIi
FuRnEy6qIemTDq87JFHB92Tqv8QXbyzjp/PSXr4mVKOSAgnwCDnrpG1jVV/NxaoY
EIDWb/wTGBRsP3tD0+0OMePIYL3YFq5tG/3u+pfvC09/oY7KLOucLqXwwnJg8OVb
X8tvgkBj8QJrhqznYIZbS1deeyuHFxdf9JD8ysMbFVqmZ1khv9aFrZk4MgFhYL4F
/anN5XSYEr8nObkKTcDjiYiYlaqtLH0QcHeCmXuscIrHF5jpv3ywaOLk12KCydrU
bwEERuGYbjgZDquC4EM3kjh0fXwKnw==
=j1CO
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--

--===============5806011392624164275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5806011392624164275==--
