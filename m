Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8114751183C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 15:22:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06E28D8;
	Wed, 27 Apr 2022 15:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06E28D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651065760;
	bh=bSuNWn8SB/OUo+GliqVMBV65XZdC3K7nhtI9D2zQO78=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AMB0/vxsnsncVy+VGT1LOd+LyooZm2ef3GVQEGsVWgGJqD7IidnLjH4a9ptkhwfjA
	 2jCj2FLtJcZVYhIpFtMbQu6g1n6x9r0RJfiYCxlsbLe3topTxVjFyHmLPP+ZQqOJwn
	 VdaDBcL/jZKcNCTppoP+GlEOg0valuxO6NkpOXRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8106EF800AE;
	Wed, 27 Apr 2022 15:21:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EA3FF8016E; Wed, 27 Apr 2022 15:21:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5842F80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 15:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5842F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V38vu+iL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1838ECE24F9;
 Wed, 27 Apr 2022 13:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB57C385AC;
 Wed, 27 Apr 2022 13:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651065691;
 bh=bSuNWn8SB/OUo+GliqVMBV65XZdC3K7nhtI9D2zQO78=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V38vu+iLpU/6NXydJI1reE5q1wRIK8lI2L+36CmYpohtpC0QTGSzoHxRfs+aKTTEg
 Ndyr3L5hriSLhLu7we1Mb43aIvEbTevYFGkGyna+cBIM4+ChHsOSsjMCbEviFpxyVa
 l7yhgSfE9p6ShxihLJVKkAQXl0X+RNWV18HARZLWffhIB9N1s+nr87lxVr8L9gSZR5
 1LGtbPks+ZQXt+Q8xBJhmm6+DuPS3k46PTy6KR0qoyLl2wWqbsZrc5+edM7uryh9TZ
 u15KqIzPCB721V2pc6ooyUhWtVkSpUHPIbEJ5Nzl7cpkv8k4CiH8zBqWS52Xrvmu5Q
 1Scji2AbKevrQ==
Date: Wed, 27 Apr 2022 14:21:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Adam Ford <aford173@gmail.com>
Subject: Re: WM8962 crashing on suspend
Message-ID: <YmlDVsDQY3oL8SYs@sirena.org.uk>
References: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
 <20220426174150.GZ38351@ediswmail.ad.cirrus.com>
 <CAHCN7xLqixKxM_L7P9T2BqLpyHoGTYpMODKJotCneXZK+wUEMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jgN3L7WWn7YAFiWg"
Content-Disposition: inline
In-Reply-To: <CAHCN7xLqixKxM_L7P9T2BqLpyHoGTYpMODKJotCneXZK+wUEMg@mail.gmail.com>
X-Cookie: Buckle up!
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--jgN3L7WWn7YAFiWg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2022 at 08:12:56AM -0500, Adam Ford wrote:

> I found this:

> static const struct dev_pm_ops wm8962_pm = {
> + SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> SET_RUNTIME_PM_OPS(wm8962_runtime_suspend, wm8962_runtime_resume, NULL)
> };

> I applied this, and it appears to make the issue go away on a 5.15
> kernel.  I haven't tried it on a 5.18 yet.  If this fixes the issue,
> would that be an acceptable solution to push upstream?

Yes, that's fine - it's fixing the thing I was pointing out with only
having runtime suspend but no system suspend.

--jgN3L7WWn7YAFiWg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJpQ1UACgkQJNaLcl1U
h9ByQAf+OHecR6uhdv6GFSH7wquWmysH9nN/xQPZkaWjY+7fPPlZxXuL6HED5c/P
WLNxYjpsZh4Ec6EzAzlUr/pomxodx4JzlawKpm1bdugBJDL9RUNmVIURA9m0UNC8
9fwwRkwuRCfaojCDpDsEJun6rtMNoHCSpmHfPYZxMwKfOZnLTaKNUkigQnOKjEUv
stPh+rFIDya5kI6fcHBjHTPirT683rELgKBNQb6j2CNE1Vs6Ki6G4t+dB2QE/gUH
ykMVOZMxQZcgHncGd099ZYjhDo1UUfZgG4+G+mIlnDyX3vvydkzjod7H9OMMnM4W
G3UjQ/tmlot2qIPr4Wzl4u52R5nf3g==
=7Z93
-----END PGP SIGNATURE-----

--jgN3L7WWn7YAFiWg--
