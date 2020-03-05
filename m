Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA50D17AE25
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 19:35:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 691DC1661;
	Thu,  5 Mar 2020 19:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 691DC1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583433325;
	bh=GpD9SemdomIFoR67LuZJ+r/xwro3OWTsCX+YPt0cS/E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aywOEDIfsKQ6dxX6hFzDeXVNWnL5tFe44pL/SHyBDXbZZTujBWfjSPE6UOQRK80gG
	 8vFj6eiiBWK3G85b6HpVLjo8I9MmFP8J3GYcbJiGjmeTult1Y1/UFrPrpxPavshKYP
	 QU1dMViN+2PpKcax/YA0Ewi1neEjXzO2G8TszKvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53D62F800D8;
	Thu,  5 Mar 2020 19:33:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEA0DF8025F; Thu,  5 Mar 2020 19:33:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 204ABF800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 19:33:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 204ABF800D8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FF5930E;
 Thu,  5 Mar 2020 10:33:37 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6DF93F6CF;
 Thu,  5 Mar 2020 10:33:36 -0800 (PST)
Date: Thu, 5 Mar 2020 18:33:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
Message-ID: <20200305183335.GK4046@sirena.org.uk>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
 <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
 <20200305133638.GE4046@sirena.org.uk>
 <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
 <20200305135908.GF4046@sirena.org.uk>
 <c1419cb1-c1d6-897d-05a4-48e57a3e15db@linux.intel.com>
 <20200305174324.GH4046@sirena.org.uk>
 <7c52ff6f-76ef-7c55-65e6-9c0437bb983a@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8tUgZ4IE8L4vmMyh"
Content-Disposition: inline
In-Reply-To: <7c52ff6f-76ef-7c55-65e6-9c0437bb983a@linux.intel.com>
X-Cookie: When among apes, one must play the ape.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--8tUgZ4IE8L4vmMyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 05, 2020 at 12:08:57PM -0600, Pierre-Louis Bossart wrote:
> On 3/5/20 11:43 AM, Mark Brown wrote:
> > On Thu, Mar 05, 2020 at 08:51:03AM -0600, Pierre-Louis Bossart wrote:

> > > I *think* it's due to the need to use the codec component->dev, which is
> > > only available with the dailink callbacks - not on platform device probe
> > > which ends with the card registration.

> > Why do you have this need?  This is sounding a lot like the CODEC ought
> > to be requesting it...

> it's been that way since 2016 and the initial contribution. The Chrome folks
> might know more, I don't think anyone at Intel has worked on this code.

I'd have thought someone would've reviewed it on the way in?

> > > Well, the devm uses the component device, not the card device, so when
> > > removing the machine driver nothing should happen. The problem seems to be
> > > in the removal of the codec and component drivers.

> > Right, it's always a bad idea to do allocations with devm_ on a device
> > other than the one that you're currently working with - that clearly
> > leads to lifetime issues.

> that's precisely what I tried to correct.

In general the best (clearest, most robust) way to correct something
like this would be to continue to use devm_ but clean up the allocation
so that it's done by the device that is used.

> b) do you have any objections if we remove this devm_ use without trying to
> dig further into the gpio management. This is a 2015 product that we use to
> verify the SOF driver on Broadwell, not an Intel-owned device.

The main thing I'm missing with this is a coherent explanation of the
problem and how the changes proposed fix it.

--8tUgZ4IE8L4vmMyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5hRf4ACgkQJNaLcl1U
h9DRwgf7Bxy3PoozjcxEyO/gTbwpNRXtsCpMPF96YNOC8ZNtHcBr0LxGz69vPe7H
qF18BQXu0lxTn9uCoG5NK+317RSTIE7OdHoVW25YDZaGMxW5Vk0LrXGzmNx7ghVt
tua/vfQe8flGchckh9caOmAK4rNRKVb1gG99x9BUPg9Chi01zhuVYTNFZ5IyGUNZ
lvzoiWYumcqflkfgoa4WUYVmYRgeeND4gPQJaoyYlaZAk0Ni0K5SOaDSwK9rrUw3
vV6MUMav3bfLQZ38ejmxcVHULG36+8SX9iExG1NSSG29LmhzVe7Gts9mhVwZWQtb
9X5ZSSZz64QqIOOKw1iU1xJMc1XwPg==
=iorP
-----END PGP SIGNATURE-----

--8tUgZ4IE8L4vmMyh--
