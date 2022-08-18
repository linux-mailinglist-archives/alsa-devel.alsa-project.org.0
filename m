Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 862F159826D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 13:45:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02DEB1637;
	Thu, 18 Aug 2022 13:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02DEB1637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660823125;
	bh=W7qbm1OArOQf4figCsuG16PVr8eAwymfP16yS3g/clo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FaRL3UPumiukZ2eV74+/cKQsI44f1x4pAB5X9TTxxIB8JaPU8RVkPQMXVyhBudZJm
	 +UuRb/eyGZIewr/QCIf3iWLp81hwIOt70213Dg7mUfuf1egJFDFUDPyqq+U2EWj54r
	 KJNY9DzCMnIH9Xsmthjwv6R5rykSM4J2cfbCPdWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55FA1F800EE;
	Thu, 18 Aug 2022 13:44:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46B39F80430; Thu, 18 Aug 2022 13:44:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99AB3F800EE
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 13:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99AB3F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qMgU2eKN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B41661446;
 Thu, 18 Aug 2022 11:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF77C433C1;
 Thu, 18 Aug 2022 11:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660823058;
 bh=W7qbm1OArOQf4figCsuG16PVr8eAwymfP16yS3g/clo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qMgU2eKNKyNdP/Of3yMAsen+De/EysFXc4LHWLk4tTAvQ2bgP/E0m5luICfyy+yQB
 BpmPFONKh8jzy4/yk70CqOv+mYKATVnKwye3A7Wwf4be/Pi8n7Xe1mVrN3dYWF7i7O
 brq5laPcNfpgY0BHr5giiD/JdZx1JRvNfZPsdJnGtvl5HbKp52tkqtFaIaqVwGSryU
 WeESvPWn/BnzgBTHolWI5N5MTKvNDqdDMaka4SJKy8zEoqD8+HKPeOVuU0bwKnKJeA
 o9OnZNUUn0/Eb67JhUdp32Lhcxx3NW4hdYmzZGjnKPXpQQUfWsGkacFCiSE1qGwh15
 6XcW6x8/o+vuw==
Date: Thu, 18 Aug 2022 12:44:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <Yv4mDSMgRgAdhImU@sirena.org.uk>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
 <202208090909.Pg0BZGie-lkp@intel.com>
 <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
 <Yv0Vg2bkmlEqTSVk@sirena.org.uk>
 <Yv0kC2jscXISm7Ie@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IooqLmh5lmJ8nsmY"
Content-Disposition: inline
In-Reply-To: <Yv0kC2jscXISm7Ie@dev-arch.thelio-3990X>
X-Cookie: Logic is the chastity belt of the mind!
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


--IooqLmh5lmJ8nsmY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 17, 2022 at 10:23:23AM -0700, Nathan Chancellor wrote:
> On Wed, Aug 17, 2022 at 05:21:23PM +0100, Mark Brown wrote:

> > It's probably worth talking to the 0day people about prioritising what
> > they're reporting against, especially given that the reports have
> > evolved into a bit of an eye chart - this was reported against a Hexagon
> > randconfig with an unreleased compiler which is underselling it rather.

> At the same time, I would expect developers and maintainers to focus on
> the warning text first and foremost, not what architecture,
> configuration, or compiler is being used. This issue is very clearly not
> architecture or configuration specific, there is no #ifdef in this

That's the eye chart bit of it - part of the problem with 0day
specificially is that a lot of their reports have become quite hard to
read, they've been putting in something that looks a lot like git
annotate output which makes things very wide which causes wrapping
issues (this one is actually a bit better than most now I go look at it
again since it doesn't have that indentation).  Picking obscure
configurations makes it more likely that people won't get round to
figuring out what the issue being reported is since it seems less urgent
and therefore gets pushed further to the back of the queue.  For
something that's cropping up on a wide range of configurations it'd be
good to priorirtize the more prominent ones to mitigate against this.

> function that changes the nature of the warning. While it is compiler
> specific (because possible uninitialized variable warnings are disabled
> with GCC), it is not dependent on the version (although I guess that
> isn't apparent). I suppose I can just comment on future randconfig
> reports to point out how they will affect allmodconfig and such.

That'd probably help.

--IooqLmh5lmJ8nsmY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL+JgwACgkQJNaLcl1U
h9D+awf/WxE3tfe9n5huZSpVDTMa58dJyiTniqkOAZurERcgGsxsOc5tWS1e6Q3X
ZEkp8GWl2yf6YDwDD2TfuTVjrqIEHmGHTOxnFWmgS2uQ2X6EH+IRFHe/cuNuccMy
JaMC8gJQibax1NlFEZZE9hzKiQqpRTvr/pVWhvV4NxxPCSwMvDFu3Y+aefYUbe7y
i4a7IGT6V5ObMQucgKvFUHHMWuvnbyo6XBQq9f3cjDgXFXXsVhlZvVOQj8M4dp4A
blXqe6iOImRvV9IBRV9Creaby/pFBN5OKOuCO+v929Iz8VmBj3ERDFAwV0ZNT1Sj
EfuL63crP6wnY+CWWS1MTTAXHLkcMg==
=Hczq
-----END PGP SIGNATURE-----

--IooqLmh5lmJ8nsmY--
