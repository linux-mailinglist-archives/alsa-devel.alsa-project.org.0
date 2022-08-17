Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3036A59740E
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 18:22:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88E371652;
	Wed, 17 Aug 2022 18:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88E371652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660753357;
	bh=EB8auf1uFAtLTf+Qxg+8QHDmcneYTnfJMO/MXWK/HTg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i8c6XNt3LZ9gw6p7UKlr+aZZ0k3A8tSAUJa2YAWTeMG0WMEeAMKXARuuV3AyxcpLT
	 IqJpRJoqqAR3tqdVB2iBG7pNVNjlGv3/JRgBX/QJvL0wl9ExV/E6Bi4GjUS7McejrC
	 lZfDzPK/f8Ocpfd+jzXK5zkJMXXdUNFN+EQlx4qM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C69CF8021D;
	Wed, 17 Aug 2022 18:21:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7B9FF80130; Wed, 17 Aug 2022 18:21:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1DC4F80088
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 18:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1DC4F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="To7zHbx3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4AB8F615AF;
 Wed, 17 Aug 2022 16:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45444C433C1;
 Wed, 17 Aug 2022 16:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660753288;
 bh=EB8auf1uFAtLTf+Qxg+8QHDmcneYTnfJMO/MXWK/HTg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=To7zHbx34gaUT874XZ5fU+azhtjIBXbXyPh3os46m8LAwShwg5CHmKwhu0gcdoFDW
 wgvYRnWvpOZMymwhtqCyjK7MXkryyAmrRcfnyfnQXqZGvrJ4WdIkLim7etvWw49bml
 11v8kh+mHHqrckZar5PD8UgtEb1dr4psZzL4EyUujkGme7/9hf5LofvhaTvYs+jtKi
 kQTTl8loDyBmnYckdbFuRaUWviMW3efv61VNTD6J5SBHHZKfFPxFcs7pMI9OVXIHu/
 1gTpisunFqCou1sJy8q/MmIEQFsVvB8KR81DvWracAHx6dCdMIN8D7UEb+Nh/Sx9aj
 NNBzL7fDfJMCw==
Date: Wed, 17 Aug 2022 17:21:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <Yv0Vg2bkmlEqTSVk@sirena.org.uk>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
 <202208090909.Pg0BZGie-lkp@intel.com>
 <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="J34F5h37Q62QuYk3"
Content-Disposition: inline
In-Reply-To: <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
X-Cookie: Use extra care when cleaning on stairs.
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, Matt Flax <flatmax@flatmax.com>
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


--J34F5h37Q62QuYk3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 16, 2022 at 11:00:10AM -0700, Nathan Chancellor wrote:
> On Tue, Aug 09, 2022 at 09:49:38AM +0800, kernel test robot wrote:

> > config: hexagon-randconfig-r002-20220808 (https://download.01.org/0day-ci/archive/20220809/202208090909.Pg0BZGie-lkp@intel.com/config)
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)

> It doesn't look like these warnings were addressed before the change was
> applied to -next as commit 4e6bedd3c396 ("ASoC: codecs: add support for
> the TI SRC4392 codec"). I now see them in next-20220816.

It's probably worth talking to the 0day people about prioritising what
they're reporting against, especially given that the reports have
evolved into a bit of an eye chart - this was reported against a Hexagon
randconfig with an unreleased compiler which is underselling it rather.

--J34F5h37Q62QuYk3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL9FYMACgkQJNaLcl1U
h9DIXQf/ftJfs+bHR8zt5BTlHyxCQFhZuBic3PscdVU4Y1E2gtjAt6vLmUAYYlva
o7Wlwf3oiOjThS5EgUZNRNltyiZT1TJQE2Zoo/xeYRx/gfAof+sBsM6f1xFxuv4+
7Vh7flrmYhjUTBuSqflZszQ5kbXJyXVkfq4NdiOFsIDEzFZeR6YDfYLEnjhcTV8Y
YfmQdgHt1hBhk7Dt9sA8YXJMlcLbbGAVYiFb9qVC6uvnhwTdoXSKB3LBn0GKGsuo
2QA1zqT4TdymsMzIAEbpHih7mli4pEs/eDVHfc4Co7+0B4wuZmLg7SKZOlIVjniH
taL7aCXWp+LNvaFC2sk5331kwoM1kw==
=zux7
-----END PGP SIGNATURE-----

--J34F5h37Q62QuYk3--
