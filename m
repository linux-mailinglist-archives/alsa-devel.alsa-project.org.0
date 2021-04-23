Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4733698AB
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 19:51:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24E2D16E8;
	Fri, 23 Apr 2021 19:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24E2D16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619200290;
	bh=EKqQdd3JsvHGu+wfjLmk/wXeSZjWsLUz+vRrJVYcYHE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sHKf04P1QaKDaIELWIvfogcxgrLjRwhYoQ1UxAqTY8u8Vc0CpffmxE+8NXGRchGLF
	 ELIVrtIvJpICvBZaYpiGOiWOWlJZsafZ+4OhqzyBtCyvZsOQJXVGmhoKUB1iATaV/4
	 y5AqIamRl81p1l7Zcol8EF4mSSew7hwC2mtKXeHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB6CF800E3;
	Fri, 23 Apr 2021 19:50:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 739D7F8019B; Fri, 23 Apr 2021 19:49:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7AADF800AE
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 19:49:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7AADF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MEVCkxII"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DFEF6144E;
 Fri, 23 Apr 2021 17:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619200194;
 bh=EKqQdd3JsvHGu+wfjLmk/wXeSZjWsLUz+vRrJVYcYHE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MEVCkxIIEj+FggSVINLpIuRBDGoTlhn4ETwvVna2cyxpw2MibiEJBmiogqqHfuEyC
 647JM0Q2XK67xTPlPrx655ONzBn/E65Eo1jMG8f/MIFMa8tv5a1IDk5oN7c4AuquLI
 QX+39uKRwdCQbN9+gQ0bxHb+VkyclsvwRCuEZWz5kirqHeKu3rTmCvp52YB+jxc3eC
 /WmDQIR+W3P+sgY/EXlcKEBDgMysWyIKoAFl7aX8F7k0JdgnGseSLVQ04V9QcTQ/7Q
 yuTD7uUiTD8qNrs1AeaRSvmPxoc1MkMLKsvTyUKoxHXQuCAIetah/deIBZCD5Ni/8g
 Yk5jM9M+RVD4g==
Date: Fri, 23 Apr 2021 18:49:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 05/14] spi: pxa2xx: Consolidate related headers under
 include/linux/spi
Message-ID: <20210423174924.GI5507@sirena.org.uk>
References: <20210423163437.89306-1-andriy.shevchenko@linux.intel.com>
 <20210423163437.89306-5-andriy.shevchenko@linux.intel.com>
 <20210423165630.GH5507@sirena.org.uk>
 <YIMEIEnt4meMP6Hx@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8/UBlNHSEJa6utmr"
Content-Disposition: inline
In-Reply-To: <YIMEIEnt4meMP6Hx@smile.fi.intel.com>
X-Cookie: This is now.  Later is later.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Daniel Mack <daniel@zonque.org>, linux-input@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
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


--8/UBlNHSEJa6utmr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 23, 2021 at 08:30:08PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 23, 2021 at 05:56:30PM +0100, Mark Brown wrote:
> > On Fri, Apr 23, 2021 at 07:34:28PM +0300, Andy Shevchenko wrote:

> > > We have two headers split between include/linux and include/linux/spi.
> > > Consolidated them under SPI realm, i.e. in the latter folder.

> > Why?  Isn't the point to maintain an abstraction between the general
> > purpose use of the SSP IP and its application as a SPI controller?

> Aren't the General Purpose of the SSP IP is an SPI controller either way?
> What you are talking about is probably GP SPI vs. private (dedicated) SPI.

SPI and any other serial protocols that happen to come up - these
generic serial IPs also often get used for audio for example.

> > I'd
> > check the cover letter for the series but there doesn't seem to be one.

> Set of cleanups here and there related to the SPI PXA2xx driver.
> It's hard to add something else here.

It doesn't need to be much more than what you just wrote.

--8/UBlNHSEJa6utmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCDCKQACgkQJNaLcl1U
h9AtYwf9ExEjCIqGM+Q3BnqwznDy/zJKu8//lEQgEI1UwO9mrRzH4hRPYDJlKQzb
BBvSCChNpY6BiXRvYAL+Rou8kNRvo+XPUr/m+gFmY9hFhSK+k3zFsAlXVuyVgnVc
/E8k7PBZsyDCK3EJsX7G6o+uVcqJI7YzQYobrGRmpWy78xkrgr9nDEELZqFSUzJj
rmMkxWH8CLawROulDBbQVFNzip2rniOk8NnD6k4x8XH0hRSS/bTYBSEx/2vPhWuq
d8OHhKcZgdCzvDQZroG/VkpXLd3ZOujucL+qo7UiOGXGmu1P2wA87wp+ny0b4zIL
bLrbblN3MR5zkYi1zYi6JKbiISi2MQ==
=VD8t
-----END PGP SIGNATURE-----

--8/UBlNHSEJa6utmr--
