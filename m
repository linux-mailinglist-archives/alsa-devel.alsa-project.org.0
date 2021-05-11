Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53037A816
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 15:49:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBE12844;
	Tue, 11 May 2021 15:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBE12844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620740960;
	bh=UmLVfYv/Ytt9Rgiry4s8eNtetCcYoRGB/Ct/IuvwlNs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ryej8eFxGRSkbuyGEAQD3zZrMWSRsTPFwBXHWAhCyQYhqt1uIKKkJ73ndM/foerj1
	 0R8gM7tn+11gGrm+6wKh0vOLI3GWY1FmV3Yv4PH7RzyZlBmTp73FuZVKbK+HhJnvLI
	 x2rzphU8dZfaVmozFdVj/nRAMnQ+5LsJLlqmT8R4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FAABF8016B;
	Tue, 11 May 2021 15:47:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C84E9F80163; Tue, 11 May 2021 15:47:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A03AF8013A
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 15:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A03AF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tjjmCPIv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11D7E61364;
 Tue, 11 May 2021 13:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620740866;
 bh=UmLVfYv/Ytt9Rgiry4s8eNtetCcYoRGB/Ct/IuvwlNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tjjmCPIvBh4x6Ha6g0MQt/leM4pPUE873yViHt7Zon76Otxf7gxaWdFvUW2crS1CC
 zRLvcXRhaeoLqr5FybQqySx7oz4mIbMqqN2/b2oR8U7I6nswxIEHHo3l42+UVWW9qR
 WH7AcpiiY1aVotn7YQVtIyxNabroCbR+H7vmrPLKTnnEbtHXPg4JzWn/tUl9gB0bBM
 JfjH7EX96+9mdFV4UdfgKyAY1ukQPhBHsi9QJ0dN2kE9uABn1Tc86xg26jLVx7/fM3
 v2pd+xdW0F0DT40zKG+c/RriiSZUHHb/Ub7DiwfUeEbigMn2gMWIgLAjASJ9yP4xW4
 Az0Lnr1hmGrSg==
Date: Tue, 11 May 2021 14:47:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 00/14] spi: pxa2xx: Set of cleanups
Message-ID: <20210511134706.GI4496@sirena.org.uk>
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
 <162072071980.33404.13031284441613044277.b4-ty@kernel.org>
 <CAHp75Vck5izDB4mTRV5hTaknpx5Bm+OA4rNLVznQxVaEwigBZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+PbGPm1eXpwOoWkI"
Content-Disposition: inline
In-Reply-To: <CAHp75Vck5izDB4mTRV5hTaknpx5Bm+OA4rNLVznQxVaEwigBZg@mail.gmail.com>
X-Cookie: Beam me up, Scotty!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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


--+PbGPm1eXpwOoWkI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 11, 2021 at 03:28:18PM +0300, Andy Shevchenko wrote:
> On Tue, May 11, 2021 at 11:27 AM Mark Brown <broonie@kernel.org> wrote:

> > On Fri, 23 Apr 2021 21:24:27 +0300, Andy Shevchenko wrote:
> > > Set of cleanups here and there related to the SPI PXA2xx driver.
> > > On top of them, adding the special type for Intel Merrifield.

> > [07/14] spi: pxa2xx: Introduce int_stop_and_reset() helper
> >         (no commit info)

> The above patches are effectively missed.
> Anything to fix in your scripts / my patches?

Like I said, patch 7 didn't apply so you should check and resend.

--+PbGPm1eXpwOoWkI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCaitkACgkQJNaLcl1U
h9CNZQf/XCg3kAZe8x4TQDVH7+UnadT7m/gM1TitiXHxim8Yi52rdkJB13fVwXU/
TTVM8xqpSBe9KVjRy90TB5fDxXdv/X/EJtI5L9LRu8c9PXxig8jEaEmDyCw+ezDS
BvdurHa9xSStpjA0dgFL/ntYxESHBq16OoTXw2Qhk4K+D9ouv67Y3kpaRW5fucRo
lFC6fAdA3T0Ju/QuA53WSs3gXy3PPbt3iKx/HNIRKEQy0AzzoKbTgEPiU+iMGNCC
41k/czYtvqH5zC6LrzTqq/gUEsw9fiAGCsfTqUKEwyB9LLRTbS+7ehYwkVzGfJ0H
ma+ZEGEWIuAPq7a5d/chIl9RdBbr5g==
=HvNy
-----END PGP SIGNATURE-----

--+PbGPm1eXpwOoWkI--
