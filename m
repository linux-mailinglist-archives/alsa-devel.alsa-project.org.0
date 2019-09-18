Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394AB6771
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 17:48:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A776E15F2;
	Wed, 18 Sep 2019 17:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A776E15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568821695;
	bh=ifVrvtBSQ4KFXNMkVd/47ZGBvPmw8iwAjTRR0XXjUmk=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:References:
	 In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rULiaOdTk0vxoreqF/WG4aytn/kajG+svy7wj9ktHWM3xaXxgKlugoYcsgYIL3sBF
	 o/qtJMtCntG9pNie6RIpDUcMN3TVhIzAAc+b2x+hD80TbvIvvecnrm0L06B4wdTHOj
	 e1KbzOvOmqyQ+rZFVv3PU3rtwISg86bGpXOOZZOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C18BBF805A1;
	Wed, 18 Sep 2019 17:45:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 963B1F8053A; Wed, 18 Sep 2019 17:45:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CAF6F80534
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 17:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CAF6F80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Q/dtBBFP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Resent-To:
 Resent-Message-ID:Resent-Date:Resent-From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Sender:
 Resent-Cc:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NUuwtGyFyjN2+qqevPZPct0GdyeWLmKJgrIv+an/otE=; b=Q
 /dtBBFPmCd5hdYSVGgU+CztR0qFdDwDh5qWiAqu5zD6eK9U2bKFuPZh02fVH7BQhcLPm2SI2ldmt8
 IdU6l9m5EPa6tkCUkaDNGt9htIRlhCmM1omIa+PXkrPHiI3BvTFzAvdCK+0jWUZJ0lCRPlhCX5/B+
 D6cEb9N417d9if8g=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>) id 1iAc9M-00068t-T3
 for alsa-devel@alsa-project.org; Wed, 18 Sep 2019 15:45:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6E1B92742927; Wed, 18 Sep 2019 16:45:48 +0100 (BST)
Resent-From: Mark Brown <broonie@sirena.co.uk>
Resent-Date: Wed, 18 Sep 2019 16:45:48 +0100
Resent-Message-ID: <20190918154548.GR2596@sirena.co.uk>
Resent-To: alsa-devel@alsa-project.org
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iAbTl-0005iW-HF; Wed, 18 Sep 2019 15:02:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 07CDD2742927; Wed, 18 Sep 2019 16:02:48 +0100 (BST)
Date: Wed, 18 Sep 2019 16:02:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190918150248.GM2596@sirena.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
 <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
 <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
 <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
 <20190918104827.GB2596@sirena.co.uk>
 <40d78f13-c1b9-3e2d-c144-2209a4c0d716@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <40d78f13-c1b9-3e2d-c144-2209a4c0d716@linux.intel.com>
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra-owner@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============1085987757472726500=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1085987757472726500==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qVHblb/y9DPlgkHs"
Content-Disposition: inline


--qVHblb/y9DPlgkHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 08:33:50AM -0500, Pierre-Louis Bossart wrote:
> On 9/18/19 5:48 AM, Mark Brown wrote:

> > In DSP modes only one edge really matters anyway so it's not super
> > important how long the pulse is.

> There are exceptions to the rule.
> In the early days of SOF, we had to provide support for amplifiers that did
> require a pulse larger than a bit. In the SOF IPC we added an
> 'frame_pulse_width' field to pass the configuration all the way from
> topology to the firmware and Intel SSP driver.
> The other quirk we added is the ability to control zero-padding per slot
> instead of at the end of the frame, e.g. 1 bit of padding after 24 bits when
> using 4 slots w/ 25 bits in a 100-bit frame.

Neither of those is part of the core DSP mode definition though in the
same way that constraints like MCLK or BCLK ratios aren't.  They're
modifiers on top.

--qVHblb/y9DPlgkHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CRxgACgkQJNaLcl1U
h9C3Uwf/d11JTgMoTNFlwHEDfWmf2l9yjezFSXcGaRxBGWDdfB+EPZe3EMNMC4Ry
Mq5zM2De0sa4JdiGgeKqUtXcBJqmRWeX8RBb66tyI1Qid5FVA/LPfWoMGgBExI9v
SpqXvUswmxvD9oJ4shc7Qg80TMdC4TMorfHnZidVSmv+jP0ovmRep/ZRPQK24b+h
vtClYbf85B7dUorPEAUD6Dgewh4/ZYe2u37tGh9X944Bqw/ze4+BGtQ2XEtXoycR
rOGENVk8V+8EVyqekA4tnv6cCnxSA09/3msb8+AolTJMouP8MK2VTOitnhJ+lrMU
RH7cdZXk43RRCJ0OqzDJZSZT3OIUUA==
=omCB
-----END PGP SIGNATURE-----

--qVHblb/y9DPlgkHs--

--===============1085987757472726500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1085987757472726500==--
