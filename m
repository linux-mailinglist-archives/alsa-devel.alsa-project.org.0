Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98766AFB05
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 13:02:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DC82166D;
	Wed, 11 Sep 2019 13:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DC82166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568199729;
	bh=SQQnPPewcvIs+UWRnEdo4ErDQ1aB69NsGzMrZx/BXP0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XVr1XyEOaPXpbK8AaVX89XSo0UnpMMHoR80Lf35oRJrxuBnVZ4sZzXjYShyWPUKXM
	 7tPDtlCNPDw3wuM9gT7plxJ0USYWE4MmAWPw5md8B5ve2jOuy7qf4diMOioUfpM7PI
	 DV41EoWgcBguiwz19N10INKKDJMcjyMyBTPXz8e4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD616F8044B;
	Wed, 11 Sep 2019 13:00:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4704F80323; Wed, 11 Sep 2019 13:00:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3950CF800A9
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 13:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3950CF800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="V0gdhRqs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TZQLypzWeA/ilSOYe3wzlLd06xCmw+pwR+Ix533idW0=; b=V0gdhRqskzcdurAO9eFX3mVdj
 h2iVFeEf05IwfJEsafqzFNUOrrkpE5snp9+fnI1usUcQ7ecZjcI8OYv5QCq1z0C8RD1QjwS9KlR/e
 PdI8or5Z/dRsphnfoAcrRFWBiPpegfvqpogoO2DUePEcrUv6Eyu/fbTELFjNC+9eLSbAQ=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i80ME-0008NR-3j; Wed, 11 Sep 2019 11:00:18 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 6FE80D00451; Wed, 11 Sep 2019 12:00:17 +0100 (BST)
Date: Wed, 11 Sep 2019 12:00:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Message-ID: <20190911110017.GA2036@sirena.org.uk>
References: <20190830215910.31590-1-daniel.baluta@nxp.com>
 <20190906012938.GB17926@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20190906012938.GB17926@Asurada-Nvidia.nvidia.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 Daniel Baluta <daniel.baluta@nxp.com>, shengjiu.wang@nxp.com,
 linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, festevam@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: Implement set_bclk_ratio
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
Content-Type: multipart/mixed; boundary="===============3878071665017064447=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3878071665017064447==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1ar0NSVY9gjTGNA2"
Content-Disposition: inline


--1ar0NSVY9gjTGNA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2019 at 06:29:39PM -0700, Nicolin Chen wrote:
> On Sat, Aug 31, 2019 at 12:59:10AM +0300, Daniel Baluta wrote:

> > This is to allow machine drivers to set a certain bitclk rate
> > which might not be exactly rate * frame size.

> Just a quick thought of mine: slot_width and slots could be
> set via set_dai_tdm_slot() actually, while set_bclk_ratio()
> would override that one with your change. I'm not sure which
> one could be more important...so would you mind elaborating
> your use case?

The reason we have both operations is partly that some hardware
can configure the ratio but not do TDM and partly that setting
TDM slots forces us to configure the slot size depending on the
current stream configuration while just setting the ratio means
we can just fix the configuration once.  I'd say it's just a user
error to try to do both simultaneously.

--1ar0NSVY9gjTGNA2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1408AACgkQJNaLcl1U
h9DPtAf7BDckq3blE9Yvy2E6HPiI+Pp9nt1hQ9NDgfX9Mypn7Vp6rfruIjCr5kKK
Pk3fQYVDLvUt0LjscDDDibjxgRnk+mPUcSc0/i9KLuS+AGpIyo+RJP2xnzG+KLox
dgzhk6Ti0RzhqxUcv8tamcsRApdEN+rHOFm7zE8NxJR13AEGR5/BIbJnixGDDZtA
GfmZPcxreMijqLu43Gt5EURM7b1tyKW7usyuYsD9K7tn71E2OuBUJJQhWTWKBiDS
vC+6KmzfUqPuJNH2tO/Wq7ZWZ4ho7+1F+nTmk0s6h1YJI6Qz6jWEmU2MCSgyioTi
X+G5eL6O9bY8OC2mL/IxNrE0j8wbIw==
=fLXK
-----END PGP SIGNATURE-----

--1ar0NSVY9gjTGNA2--

--===============3878071665017064447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3878071665017064447==--
