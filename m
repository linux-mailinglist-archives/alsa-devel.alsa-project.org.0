Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8983386C85
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 23:35:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED7BC1612;
	Thu,  8 Aug 2019 23:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED7BC1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565300107;
	bh=HQCiG1mnq2/YduJa1y3nSaeNQ7qGuVvNZo8g8qMvQfg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JIkNicY5kFpA+i0/G0lKFM7PHOz29JdPVxHsY5agbgqzD30hhVsxfOnwOxnxL/2+d
	 jnt2eMlntx02A7h47OM6aHL4U0AL1IF9heusBUchZCcowK5NpdsrqkBkX2BekmLC5D
	 4ExXEVb0vLGFaNU0Hz3oAhFQNStvOHhP3eKfA5aU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C91FF8053A;
	Thu,  8 Aug 2019 23:33:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B09F7F80534; Thu,  8 Aug 2019 23:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 164F6F800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 23:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 164F6F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="brHM2tuw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ngK4jJAdzY6701IVP5VRtRVGLIWVl2ivwNbDvH9L1d0=; b=brHM2tuwj+WYsXDf5GaJ80r9r
 PrW3B0PduKWQ0Hgk2V8Z+MvMHdNDju8V5Gq9heqsdYR3lRdWL0ti0H93YtJt2egml/HOcwq1XmubV
 lqk48YG9dN+dAC58IJYyVPswkl7f5lQ8vnAWAUSppDElKzV5RMkB43lPTg4L0pj7MeXp0=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvq24-0004Ai-NQ; Thu, 08 Aug 2019 21:33:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5F80E2742BDD; Thu,  8 Aug 2019 22:33:11 +0100 (BST)
Date: Thu, 8 Aug 2019 22:33:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190808213311.GN3795@sirena.co.uk>
References: <20190808095715.29713-1-tiwai@suse.de>
 <ae7d32fe-a279-8309-2370-1832edcce413@linux.intel.com>
 <s5hr25vhg22.wl-tiwai@suse.de> <20190808190343.GK3795@sirena.co.uk>
 <s5hftmbie9i.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hftmbie9i.wl-tiwai@suse.de>
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
Content-Type: multipart/mixed; boundary="===============4928947547696254627=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4928947547696254627==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cs5saTBZh7UZl2eX"
Content-Disposition: inline


--cs5saTBZh7UZl2eX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2019 at 10:38:33PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > I can do that easily enough.

> OK, I pushed out the branch topic/hda-bus-ops-cleanup.
> Please merge this one and topic/hda-dmic branch into yours.

There were some conflicts which hopefully I resolved OK, it compiles and
everything so it can't be that bad right?

--cs5saTBZh7UZl2eX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1MlRYACgkQJNaLcl1U
h9DiXwf/ZTczst1ezjK7W+0tEDc74yWuvsSH2RFmprD9jwicQTkfsr4tYSXrooQw
7HAc3zweDmtuiLy3+YxnR1ArStpnpicVjHXevCqtQ1FgKQBxETv0Sr+d6N9ptkpU
Xgj5kQwcMVEtNzRo/Byn+58cBbR1CB4lZjly7vfJ7WXmL9C0OKHQwiknzS0Chx1O
T0mqi1DZWTTzHn7NdTIH9qAI0zZCBWD1wmE4YTsaT/ftzbMoxKal5B9ax7p5XaIP
R4N+Nw889bBEWR42Hrpw09Cq+TrAH+LaV0GB2tp1343sLL+lNeoFNxC1IEZHdEXG
W3OBo6juE/EYv7gGhsiAxZxf5/ZQgw==
=vi1U
-----END PGP SIGNATURE-----

--cs5saTBZh7UZl2eX--

--===============4928947547696254627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4928947547696254627==--
