Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C3F167ECD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 14:39:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC0BB16D0;
	Fri, 21 Feb 2020 14:39:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC0BB16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582292394;
	bh=xwZtYdVGm1YdaKV8BKeiJhwK+7maJ+h8QKPM8JBtYqQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rIm2wFhk+9hv8AnkKOqE4nHmuWfrRak3LJVPE5cgb/nDkGyHikSHk5sFST26STSyA
	 UyqeohOJ8eu6tHsJRkjtm7x6D7dqnKfVC4fErpxJ6kRTQmUJOqNWxcbijMeowGtjXe
	 4OzGBhcsJUp0TNyjGZw8mtmlDl3aGzq/2ndD+fPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A6DF80273;
	Fri, 21 Feb 2020 14:38:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53708F8025F; Fri, 21 Feb 2020 14:38:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6908FF800C5
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 14:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6908FF800C5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1539630E;
 Fri, 21 Feb 2020 05:38:06 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24D5D3F703;
 Fri, 21 Feb 2020 05:38:05 -0800 (PST)
Date: Fri, 21 Feb 2020 13:38:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 05/10] ASoC: tegra: add Tegra210 based AHUB driver
Message-ID: <20200221133803.GF5546@sirena.org.uk>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-6-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p8PhoBjPxaQXD0vg"
Content-Disposition: inline
In-Reply-To: <1582180492-25297-6-git-send-email-spujar@nvidia.com>
X-Cookie: Dead?	No excuse for laying off work.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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


--p8PhoBjPxaQXD0vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 12:04:47PM +0530, Sameer Pujar wrote:

> The Audio Hub (AHUB) comprises a collection of hardware accelerators for
> audio pre/post-processing and a programmable full crossbar (XBAR) for
> routing audio data across these accelerators in time and in parallel.
> AHUB supports multiple interfaces to I2S, DSPK, DMIC etc., XBAR is a
> switch used to configure or modify audio routing between HW accelerators
> present inside AHUB.
>=20
> This patch registers AHUB component with ASoC framework. The component
> driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
> driver exposes AHUB interfaces, which can be used to connect different
> components in the ASoC layer. Currently the driver takes care of XBAR
> programming to allow audio data flow through various clients of the AHUB.

The current way to represent complex digitial routing inside SoCs is to
use DPCM, this is not great and causes a bunch of problems with the
framework but it's at least consistent between SoCs and is less visible
to the ABI than this is.  Ideally what we'd be doing is propagating
digital configuration along audio paths like we do for analog with DAPM,
Morimoto-san has done a lot of the groundwork for doing that with
converting everything to components but nobody has worked on that yet.
Your stuff looks a lot more like this than it does DPCM at the minute
but it completely sidesteps the digital configuration part of things
without trying to integrate with the framework which isn't great.

I'm really not thrilled about the idea of just hacking around the side
of things like this is doing, the ideal thing would be starting the work
on the framework to propagate digital configuration - I *think* you can
get away with only a subset of the problem here (just copying
configuration straight through) since this looks like it's just straight
point to point links with little in the way of DSP.  If not DPCM would
be the way to go I think.

--p8PhoBjPxaQXD0vg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5P3ToACgkQJNaLcl1U
h9Dwzwf/advF/uesEAwOfyBFgKsZU2OvOfZNWh3z/hn0WbNlr6NtvLRDYEOjdsbA
1cWkU2QWhi1rmf+aeWuOOXLwfJ69OczEeEmo0PODUMrWFNFfWGhnyyo7vGU5MP0S
lHxiqyUhlU4SQJDNuHKhUZigSKEcwH1ofxGTk4SS43VGvG4KrQIZrIZeuWkYcdzN
Py+JpKWnpqDPAs19Rqe9jNUY2qFnF0V7VT5zZKMnXEVwHSjlHqzMHH/maokSugYa
ftNy9GuN7MKL18zAZ7DKDqljpUOPnRfnoiys4qq1LYXXey7e5nbFpOdihRBU5XQS
csloEVBpHZgw77kXeOmlE5dbWwlsQw==
=c0+G
-----END PGP SIGNATURE-----

--p8PhoBjPxaQXD0vg--
