Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 156DFB6243
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 13:30:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8977F167B;
	Wed, 18 Sep 2019 13:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8977F167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568806246;
	bh=REkNVZHoJdwJ52xT40/nSRb1y76lycJlE3cFSKTawiw=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:References:
	 In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A0P60HsU++6MeC+zUTBHgt/NNh+6eFWPMgeGKgmV5neTFIWkx2Y7wuses3SPX5SL/
	 TnJnbBagSEr/MaHA4WMghCKPzAI/yDt7LA8PJPBxZa83NkYpYSgboNGJRg6pgrq4Bl
	 fsBWOqaizEWgksc1bzAWL5rRHFRydtM4rVCTJeFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1983DF80506;
	Wed, 18 Sep 2019 13:29:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68990F80506; Wed, 18 Sep 2019 13:28:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71339F80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 13:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71339F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xqmnNoys"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Resent-To:
 Resent-Message-ID:Resent-Date:Resent-From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Sender:
 Resent-Cc:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3sWoz4niFJSen3AGrzTkTllFTaWXdo6cCmFVRySv9g4=; b=x
 qmnNoysTjm6ByIEkJ/qyGyWNj74dBecA7qGzc3I8bPC6yMtnoU+L5BrQLi0Gx5AgzGHsOlfitA9SU
 awyMsHzGt1CqCypw21xNIZ2Bzgze2gEu/UK+YUMN6HJzKI/+2ic2Hr6MKyBDgC0d/Cv+fuZthiq2Q
 W52hSyIpX9WJCwvk=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>) id 1iAY8h-0004up-8y
 for alsa-devel@alsa-project.org; Wed, 18 Sep 2019 11:28:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3B2CA2742927; Wed, 18 Sep 2019 12:28:50 +0100 (BST)
Resent-From: Mark Brown <broonie@sirena.co.uk>
Resent-Date: Wed, 18 Sep 2019 12:28:50 +0100
Resent-Message-ID: <20190918112850.GC2596@sirena.co.uk>
Resent-To: alsa-devel@alsa-project.org
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iAXVc-0004of-L8; Wed, 18 Sep 2019 10:48:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D14012742927; Wed, 18 Sep 2019 11:48:27 +0100 (BST)
Date: Wed, 18 Sep 2019 11:48:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20190918104827.GB2596@sirena.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
 <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
 <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
 <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 linux-tegra-owner@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/8] ASoC: tegra: Add a TDM configuration
	callback
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
Content-Type: multipart/mixed; boundary="===============7014943400818606924=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7014943400818606924==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 11:25:39AM +0100, Jon Hunter wrote:

> Why 2? From looking at various codecs that support dsp-a/b modes, it is
> more common for the f-sync to be 1 regardless of the number of slots.

In DSP modes only one edge really matters anyway so it's not super
important how long the pulse is.

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CC3oACgkQJNaLcl1U
h9BFnAf/WyYMlppq9ssZv4HEBgxxsYN/XQexPFHMP7crDn62tGtHByJh3iKq1cRa
XJ3srU6r+IV+S3XI5udoz5il/R442tQjsjZ1deLoKTvih1pu83l0ELkQJOAV4YG2
3Dmt+KImny71YqKLgZ9haZTZuDEiRFGT7F4MxH1hepOS/aNYwvbojczspSncObVt
cEp1p8vSq9Wc/E628i7BQ1x+IM/3OLm3Toi3soPP+00s3Uh3s+1Ct7W/501JxCl3
bUrUIpHTI/SV8PseVs+o0Qt+6dwcXYo5GG1gVZS1IqwTsoUH5KNTZbhtrEa1SNJC
WUsl5grAThT2yA5nAL7EeG0DM9C1LA==
=Dj84
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--

--===============7014943400818606924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7014943400818606924==--
