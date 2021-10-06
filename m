Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0448B4243B0
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 19:07:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94732844;
	Wed,  6 Oct 2021 19:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94732844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633540071;
	bh=PZnbaxq69kHYjc3aakilyUEfdbtdfSaOIp4kp8liWU8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DFSFB6wThuiako/ExDGKhMJkGia2ru6IBeM90D6s+bMAmrbtbRH2OtB7EUfmQWYje
	 VaH9T450GO1LhhYK7bIzdR7Ah3ERT4mzoK3boHL9j/WFWCDUG4FLYxQO0gaIscbepC
	 4yfaIX4tUrFzxb1Vl8DSEls3mhqIpeVHdUafPf8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04565F8010B;
	Wed,  6 Oct 2021 19:06:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E10AF80240; Wed,  6 Oct 2021 19:06:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0AF1F8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 19:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0AF1F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hUVfD0R+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22F22610E5;
 Wed,  6 Oct 2021 17:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633539986;
 bh=PZnbaxq69kHYjc3aakilyUEfdbtdfSaOIp4kp8liWU8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hUVfD0R+rR3WdH6ywZh4W0FObPq9rS6YuqePu1Zd1KGQKfQUbpWj/djDPOwXEEhQ7
 WghL5YkDaNdOazPK6j06bljx2IoC4KUF95/6CWROLWwnDRBiqsJIqZDpFYHkmDbKcO
 Xo0pfLSpCDgLjXYOdcvIQLjFHjciy6PsepjyvKuA4Ochxd8UgHm435d5n7QpeXfbsV
 hxwwRBogz3Y5UuofrQWJ9rRDPcZoGl0bJOj9zvX5l66KM/VT4xHl5x/oUZhsFKucrA
 DAN2zz05sK8Qci3ell1sWNpHBCqiZibL1xnpW/RaGxxh+bjwBSn6yc6bUisjqEuz38
 +XjlhgeKsounA==
Date: Wed, 6 Oct 2021 18:06:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 3/4] ASoC: Intel: bytcr_rt5651: use
 devm_clk_get_optional() for mclk
Message-ID: <YV3XkLzs5VBv3Sic@sirena.org.uk>
References: <20211006150451.16561-1-andriy.shevchenko@linux.intel.com>
 <20211006150451.16561-3-andriy.shevchenko@linux.intel.com>
 <2d190513-7ac4-731c-7c9a-1f60a98f6345@linux.intel.com>
 <YV3NZnb6mg43nUC1@smile.fi.intel.com>
 <015e084e-70ed-7b5c-b103-8426ef0842d4@linux.intel.com>
 <YV3T5evF+hghuwge@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="P5y5CYfh4SMnZ2u/"
Content-Disposition: inline
In-Reply-To: <YV3T5evF+hghuwge@smile.fi.intel.com>
X-Cookie: A is for Apple.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
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


--P5y5CYfh4SMnZ2u/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2021 at 07:50:45PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 06, 2021 at 11:37:24AM -0500, Pierre-Louis Bossart wrote:

> > By looking at this code only one cannot really visualize that it's a
> > no-op. I personally prefer to see explicit intent rather than have to
> > dig hundreds of lines below what this clock is optional.

> > I am also not even sure that in real products this clock is actually
> > optional,

> The code tells that it's optional. If it's not the case, the code has
> to be fixed accordingly.

AIUI with the clock API the idiomatic thing is that any optionality is
handled at the point where the clock is acquired - if the clock is
optional you end up with NULL which in the clock API is a dummy clock
and ignored.  The rest of the code then doesn't need to worry about any
of this stuff and the handling can only be in one place.

--P5y5CYfh4SMnZ2u/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFd148ACgkQJNaLcl1U
h9BJPgf/WyCnwaI1cBrz1bAWU3LhKG7Fpeirk9LCyIGjBxKx3hLF/6ZpYdgj7ZE+
IKXTNDfc3bA7UKhQ32Rck6Yi4rDJDa4MdAqwgeGf2jUrLYnZcjOechs3ckABPovb
QVu25PIwHU38QJO70K00wUhOOnleqPbFcpPbamwzIrXPIZepxtnB3uvXmrv8vG80
S1pTTSf7Rcz076AG++FbYIR+ppSPUBopUS2Y4/eiFfDpWQjIPwvsLWmB5PZ97hvm
YqyTTOWPJ0k6mG2p4qtJs7VLEbExZkHb91NvUZNtGNwnJXjSiEclJtodBCxU6xZa
kfnNG6XvDZctYdE5r1NHPX5J80XLmg==
=5awA
-----END PGP SIGNATURE-----

--P5y5CYfh4SMnZ2u/--
