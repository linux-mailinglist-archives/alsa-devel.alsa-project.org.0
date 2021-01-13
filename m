Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC262F4A32
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 12:31:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C84FE16E8;
	Wed, 13 Jan 2021 12:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C84FE16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610537502;
	bh=Pr7ftSzEqQFBRyhav+VqvsVYCOqSGrjRiOX48WdaDb4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g1jInkOJqPZlD/5f2qRj3P9UsoA6TvB7nQciwifX783ElJvWyDfbFJAAZEeg6VFCz
	 JxJJzHxnJx6L8820+bS8YKvF+IoGloT4jeuZgkm+V97FHU+RXUc2kobFZInk/ytFBi
	 FmLj8mMeFG8l0FtnSYmA5A4KDSjM8Cl0rjpdJwPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C903AF80113;
	Wed, 13 Jan 2021 12:30:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4635F801ED; Wed, 13 Jan 2021 12:30:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3798CF8014D;
 Wed, 13 Jan 2021 12:30:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3798CF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rhrVfXZC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53D11233E2;
 Wed, 13 Jan 2021 11:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610537396;
 bh=Pr7ftSzEqQFBRyhav+VqvsVYCOqSGrjRiOX48WdaDb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rhrVfXZCs65OzdDtMVbfheKemMz0Or+aNf7/XFlLpV8LaL2mMNiM8nIx6vbfR97iC
 kRmOPP4IKMKSG5QwBt/NXI2B4YFNX6gim2HExyJeslQ0tVYurU8LU2UDlRC+dw9F0e
 Gm9EinpEPfKIRQNU2v/j2eTLfF0eSI3fUNyW9DIqDj4Vu/yNI3h4r7GVrNpri8+GzV
 adWFgwjMsMrByEWYtVc+Ld/nG8e2G/QGYGLJf6pyK6Jd9aZnACX1yltRpEy94/DwMb
 SflW1+ReYdLx3o0e+Pv+avejf15YU+BbzAn1aml9fuqsSKxPBzYvkRJjB6m93NDf7D
 BqEEP+B03xbAQ==
Date: Wed, 13 Jan 2021 11:29:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: intel: fix soundwire dependencies
Message-ID: <20210113112923.GA4641@sirena.org.uk>
References: <20210112203250.2576775-1-arnd@kernel.org>
 <20210112203250.2576775-2-arnd@kernel.org>
 <cde511d6-fa14-0cab-f00c-f75ad2d8281c@linux.intel.com>
 <CAK8P3a3rOG8eCNQbk01-_t7RtyJknWbo-9tKo3959KhU5tcXsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
In-Reply-To: <CAK8P3a3rOG8eCNQbk01-_t7RtyJknWbo-9tKo3959KhU5tcXsg@mail.gmail.com>
X-Cookie: Ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2021 at 11:36:15PM +0100, Arnd Bergmann wrote:

> I was indeed wondering whether the intel-dsp-config.c is just
> another layering violation: this is another generic piece
> of code that seems to contain too much knowledge about
> specific hardware implementations.

The purpose of that code is to try to figure out which of the multiple
sets of drivers and firmwares available for Intel systems it's best to
run on any given system by default and choose between them at runtime
(or allow that choice to be overridden by users) so it's all about
knowing about specific hardware implementations.

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/+2ZIACgkQJNaLcl1U
h9D4awf/f/riblTLLLU0M4zy8SvdlZaC8UIH+GjOit2GLE0GyR4zgWkE9BGrNO6U
qE31bCPBZ2Yl4juHbKwSX8eaun32fPa9KlcNTcs8VNHiBfHx6Z8umGuXglsfqnbk
U3iKit1fa+Gf82OABwAnl9EVsGIKrFMPqGU97B064/vByeEqlNlQdN7XdIIq9b0b
RLUaBEMZ8aBgXGZ1TiUCeMi1VaIvJI/YiqwqwNDhkhvb91yUNyVwDwjGtmWr0MEd
mrruFa/tgd35ngWgZ2/k/RoZUHFvKWr/dvQ52/Yh4qLfRwrouLkd9QtqNeBXgWmd
KTjwCczLvKzMe1znK8tKq4d+LVF7tA==
=pwE+
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
