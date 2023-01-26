Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA0667D04E
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 16:34:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 243A014E;
	Thu, 26 Jan 2023 16:33:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 243A014E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674747255;
	bh=S+44FzgrppMOoavAOsmBiZEPceMlEDD+t+wy7gXfS24=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=T+ILzFMYfbP/JkDDDzTBoPEm9Dl4hHjwY+nsJjTiu9KCRtyjtAOjbLbMeVKMTY1KW
	 gAbICnDwF0Kwt/bwYLEH8Ryx95u07y5QnbD85zRVCX95zMeHNV7ZbIyFamTBSmf77r
	 2esiEvCJfNA4vwjZTVA0jGoIWOkurBCgzm3slJEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B81CF802DF;
	Thu, 26 Jan 2023 16:33:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCC5EF8027D; Thu, 26 Jan 2023 16:33:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EFC1F80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 16:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EFC1F80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eGh3OnJ9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98FEB61890;
 Thu, 26 Jan 2023 15:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFCFC433D2;
 Thu, 26 Jan 2023 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674747180;
 bh=S+44FzgrppMOoavAOsmBiZEPceMlEDD+t+wy7gXfS24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eGh3OnJ9GRcuM9g7cpO40tqn5NwbPhGgNnZvJmZceGjmMNFwaYbn18ZL6l5Enrhwu
 8wkHXS1zkWvjVr4qsCbdKCBIiwjWZzwf9B44GHoiOjRqeX0AeFIY9RK0Zrn4P8hSHJ
 unpaOhJ6bXJmCW3UbMJsncrqKCFgCpKYtUS/G5XvcmLps8VY2anze0C9uaHkB6tseZ
 Q3SaxF0JI0StKdUd/6JwJ33o8ndbF21+q6ssuvwe8yRXwJJ9NPnk3teFHsIFR8oi9m
 kN5kUutkHi+fb0yWQdlHkwqD2LyOtiduyBYmL/oJq2D8ajAPnoMTo+NAYx9YGnWdSV
 3JOccIhOvb9oA==
Date: Thu, 26 Jan 2023 15:32:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l56: fix DT probe
Message-ID: <Y9KdIzlqHPL19YIB@sirena.org.uk>
References: <20230126135552.3625887-1-arnd@kernel.org>
 <Y9KIN7GerLd4ziw0@sirena.org.uk>
 <20230126144635.GA36097@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Q1+h2puod9yEyzZ/"
Content-Disposition: inline
In-Reply-To: <20230126144635.GA36097@ediswmail.ad.cirrus.com>
X-Cookie: Serving suggestion.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Arnd Bergmann <arnd@kernel.org>, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>,
 Wolfram Sang <wsa@kernel.org>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--Q1+h2puod9yEyzZ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 26, 2023 at 02:46:35PM +0000, Charles Keepax wrote:
> On Thu, Jan 26, 2023 at 02:03:35PM +0000, Mark Brown wrote:

> > Or there is no mandatory properties/platform data and the
> > defaults are fine for most systems (which is a common case).

> I think Arnd is right here, the driver appears to allocate a big
> block of zeros and then blat that over the top of everything it
> read from device tree. So you can literally never use any of the
> DT properties as it stands.

Oh, the fix is fixing a real issue - it's the claim in the commit
log that the driver could never have worked that's not obviously
correct.

--Q1+h2puod9yEyzZ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPSnSIACgkQJNaLcl1U
h9DmDAf+P1aRExs02B6c0QhYJujZH3z8FJK6WQtLcZ6Tjhx8rdxgSJGvOgpyfU4H
3qVJD+/OgGJt10tP0uuO8dQ07L6Gb5dESWCcgDZrd2McR8jhYLaKjv9rjQoMxb42
zqDtN17vUrmp5AZ8CWfVjuMnrLi1sxBnfo4LvBrtOjAb8ZtOv9JHUaiSXbKZ3L5j
yZYaq5IlE10V3WkH7QFrchvI/owjd4JnP9eTGkfBoHbXcVbx/A9Q1PxLLDPgMIM6
ztd4KRFv2xv/PICsfnoxAxU+Lkca5yFQ+wRZOJ7Bj3lqNlN+RB6MTc1P/GBHXblT
nSZvTwX+ld8zvHcoylJxizJCtgOqNg==
=wS2J
-----END PGP SIGNATURE-----

--Q1+h2puod9yEyzZ/--
