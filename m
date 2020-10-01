Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE28280812
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 21:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB9BC1ABC;
	Thu,  1 Oct 2020 21:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB9BC1ABC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601581942;
	bh=mwx8aQI8xuCIsu9M1B/u9CUWvKJ9eo5IeX69rvkCrgs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEsitqXaDZbY9w88/CTX6ncWTFca5763sTsJ0/9rAmYL3Z+3kkrkTzqF/wRxeKMVC
	 7g54F+xJl6z/y5NYov3ACs4AcRo+HZ1H0HpU2PiZuYnblhY/emlUePlaeLrQXQP7yI
	 Cg1LuIXwYB7SB0fry1biwVueh566PUJXL7vUkxGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D30F1F8020C;
	Thu,  1 Oct 2020 21:50:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 686E9F801F5; Thu,  1 Oct 2020 21:50:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB15FF800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 21:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB15FF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kp3qT9dU"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36E2720780;
 Thu,  1 Oct 2020 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601581826;
 bh=mwx8aQI8xuCIsu9M1B/u9CUWvKJ9eo5IeX69rvkCrgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kp3qT9dUGz2QZ9xHxtqqcaB/I83BzzvH5h2LROP6y67fSevEw1UKRA/ykTPrtsHgz
 K0oF5ADRD2PRfSeRE8TVPy8E3drSnMlFIxm3ZeFNvGrV6gh/xrnMrcbuvsD1125/tW
 5Aitl1spWwnScZ7b+wdmOeumkzApp0BJP1cb/KRA=
Date: Thu, 1 Oct 2020 20:49:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v10 14/14] ASoC: Intel: Select catpt and deprecate haswell
Message-ID: <20201001194927.GY6715@sirena.org.uk>
References: <20200929141247.8058-1-cezary.rojewski@intel.com>
 <20200929141247.8058-15-cezary.rojewski@intel.com>
 <20201001183329.GA41046@sirena.org.uk>
 <20201001185409.GV3956970@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z3PcgjD2qOzdkXVS"
Content-Disposition: inline
In-Reply-To: <20201001185409.GV3956970@smile.fi.intel.com>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, ppapierkowski@habana.ai, marcin.barlik@intel.com,
 zwisler@google.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, filip.proborszcz@intel.com,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com, tiwai@suse.com,
 krzysztof.hejmowski@intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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


--z3PcgjD2qOzdkXVS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2020 at 09:54:09PM +0300, Andy Shevchenko wrote:

> This has a dependency from SPI tree. Can you merge (cherry-pick) one patch from
> there to ASoC tree, please?

> a2bee00cccf4 ("spi: pxa2xx: Add SSC2 and SSPSP2 SSP registers")

Ah, right - that was actually mentioned in the cover letter but got
missed (I think I didn't register that it was a SPI change and stopped
at the "already merged" bit).  It would have been helpful to highlight
this with the SPI change so it could have been applied as a separate
branch rather than on the main branch which would make this easier, this
sort of stuff is why I like to have per driver branches.

--z3PcgjD2qOzdkXVS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl92MsYACgkQJNaLcl1U
h9D9bAf/QKaCeSk4OmeO7CtXC+qh8AGSb/9Q6io7hzn6Rn+/1gLhO0Mfb45cE3r0
eBzXbI3xTk5+PowBEmCQE4/iY1/1Elv3wc3V0j0elawVw2kT0kgGCyICgrnE0bwP
bM/HTmXbO0VzzpK0XMRpXYzYwRK9Sh5knoVqRfXREdxd4XrBJen8x4NhwIqoZHMc
J/ycarPUslJg4a3e5wIhbPSVIUlie2VSjxbxfUDIogiovv2cH8farQlSuHJLbU/g
bb3A0vHZoe1M8AA8MIt2b85ENI5Zvj5UZwCfZzWJyze4x0rRms/eq4YE3AZvXWas
lMd5Mj2OfZ85ygpOOV9ph5t5bvMung==
=yi7d
-----END PGP SIGNATURE-----

--z3PcgjD2qOzdkXVS--
