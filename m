Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E8016A56A
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 12:46:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D64ED1683;
	Mon, 24 Feb 2020 12:45:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D64ED1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582544761;
	bh=KmxduwQKZjZKSqFWNovrd741QLsrLPnBuv2/ssSA9Gc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ITldfXYZj61q7goys/bDi5+Ta6xXzB6a379TKzKcNQfJNDkagMZGFVzF9/+V8NPLj
	 DktvGP0oG7CgDe5VkprTB7mHqUCTDoSX4viPArdRCqe8QgUAHjXaeqCA5jCkIpsd14
	 64ofHaR5SBGnzyBrD3DmurOafe5rwIyX1wgR7vLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3926F80090;
	Mon, 24 Feb 2020 12:44:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 576F2F80137; Mon, 24 Feb 2020 12:44:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id EA347F80137
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 12:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA347F80137
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9580A30E;
 Mon, 24 Feb 2020 03:44:08 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E92EF3F703;
 Mon, 24 Feb 2020 03:44:07 -0800 (PST)
Date: Mon, 24 Feb 2020 11:44:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
Message-ID: <20200224114406.GB6215@sirena.org.uk>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
 <20200221130005.GD5546@sirena.org.uk>
 <316ce0d5-318d-0533-ef06-bd7e8672f893@nvidia.com>
 <20200221165535.GG5546@sirena.org.uk>
 <47f94534-e997-d56c-5793-ae832fb2add4@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <47f94534-e997-d56c-5793-ae832fb2add4@nvidia.com>
X-Cookie: How you look depends on where you go.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org,
 Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com, tiwai@suse.com,
 viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 24, 2020 at 11:28:57AM +0000, Jon Hunter wrote:
> On 21/02/2020 16:55, Mark Brown wrote:

> > The ideal thing in a component model would be to represent those sample
> > rate convertors directly to usrspace so the routing and rewriting is
> > explicit.

> I assume that it would be OK for the sample rate converter itself to
> expose mixer controls to configure its input and output rates so the
> user could configure as needed?

I don't think so, I'd not expect the individual drivers to be doing
anything user visible here - if we know what a digital transformation
looks like the framework should be offering anything that's needed to
users (and hiding controls that don't have any practical control in a
given system).

> > Is there any *need* for these to be user configurable?  What's normally
> > happening at the minute is that either the external DAIs are fixed
> > configuration and the DSP just converts everything or there's no format
> > conversion done and things get passed through.

> I can see that in most cases there are a finite set of configurations
> that the end user may use. However, we would like to make the
> configuration flexible as possible and this also allow us to test lots
> of different configurations for verification purposes as well.

Internal testing often requires things that can't be exposed to users,
the extreme examples are things like battery chargers with health and
safety issues if the full range of control is available.

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5TtwUACgkQJNaLcl1U
h9Crqgf/ZrHdav/H3sg+ks8XPns3tfhmaN7zdKxLkEl7rclyGrxXkz0hGGNflA0b
ZmCq+byMf1McM1Ay4GqHsIP6kYxwqqZzKPpoV1tOZRHrH85RoI3qrofsZAuEYGMP
KZ36BR55I1oIZXa6NxuOM/Fdrg4hcNanuK43zaXWS9mM3UweiIlXCmvBiWZR4koK
dArroM9BXo7ZXuWWVbhmAfnu6Mi/ZUk3uGauKjlP1Odo7N9B4aRvhV686h3Baaq1
zeLawuT/y9N6G623+AkUKTuuEUfLfk/fhE16y2SsrCxgxrRvBqKDNZLjO9YkiiD9
vcfUOJKsjpBy/LOF4JV2iwHc5xC+wA==
=rFOB
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
