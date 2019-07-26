Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2087654F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 14:11:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74DC3202C;
	Fri, 26 Jul 2019 14:10:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74DC3202C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564143079;
	bh=LLJuvpSwKdT862ee8AMcOranD32AZ2ymzOPoAzB6A1o=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dr2z+LQm4VjPLS1y11YWkZnBxrQZ71mQm5y9CLQtYTU7mni7qNPTU6Z7gnr5NlipT
	 OHamNAS/KOw3/it2R/PJYUnIQyFVfuATDl5iID3f5R7mCQZOvdVM1vQF8Z4VPsXwM9
	 fBiArIifnyr/VmHJIRKWKuAam1gZJKz9qslrEq0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE015F80482;
	Fri, 26 Jul 2019 14:08:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3F70F80368; Fri, 26 Jul 2019 14:08:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF006F801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 14:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF006F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dgTcrG54"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gS6TFmtoV9RB8J3VH+YKQUJjv20M7Idf7n3sD7CqGlY=; b=dgTcrG54HaVxyxusxxEABL2XU
 5jK19DpyIw1uRl38Bwa3O+yVbls8pylB1S0cuIJlWBLs9+x2tDstnvkvGhrTWPF4w4wBWco5EGIGr
 lwuGdx63F3HJhbt2cidBT1pkGnrZ0YXy1CQMxwy1OEMi5xbFD1K2r+E/HWwGfBcwajLwU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqz1e-0001YP-KU; Fri, 26 Jul 2019 12:08:42 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 881C42742B63; Fri, 26 Jul 2019 13:08:41 +0100 (BST)
Date: Fri, 26 Jul 2019 13:08:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Message-ID: <20190726120841.GA55803@sirena.org.uk>
References: <cover.1564140865.git.mchehab+samsung@kernel.org>
 <9932608f32030c886d906ea656eda8408c544776.1564140865.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
In-Reply-To: <9932608f32030c886d906ea656eda8408c544776.1564140865.git.mchehab+samsung@kernel.org>
X-Cookie: Think sideways!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 7/7] docs: dt: fix a sound binding broken
	reference
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
Content-Type: multipart/mixed; boundary="===============2263275635964120667=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2263275635964120667==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 26, 2019 at 08:47:27AM -0300, Mauro Carvalho Chehab wrote:
> Address this rename:
> 	Documentation/devicetree/bindings/sound/{sun4i-i2s.txt -> allwinner,sun4i-a10-i2s.yaml}

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl067UgACgkQJNaLcl1U
h9DZ3gf/XVyELAxpK+iOsyrIIgOtkynK4H9wknGxpl2rZE0a6qJHb4tUp+EVM5k7
BP3tcLa5QVeuWG3k2rqMwoL86wXC7QLc+So1k5s612+LqO7tkgHRPQv0fFZFYFU+
iQ7E6+MUeBW4LoqA4pSOQvpeU7oNy4amI/X639LTk7qjrTwnmwcH5aagkPRGOvPL
KC+Hf/saAF5T9eue6updywRGYPWffVpQkoCO6NpwfWMk5UV071OneiL3SKXf/y+2
7ZgIh2qwDFvkrpgmTUowa8D+iODO0/P6YP3m7Q8WZXS3YBSrnp0c9pDUUG38QVVG
jB89EPyDbXAjR7L2WTMO1GCnC/j9Dg==
=gcDY
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--

--===============2263275635964120667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2263275635964120667==--
