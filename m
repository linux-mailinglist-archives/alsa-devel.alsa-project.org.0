Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 136D94D2F9F
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 14:02:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 110EE17E9;
	Wed,  9 Mar 2022 14:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 110EE17E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646830933;
	bh=05mWd2rzKwbYb9xhfIrjasgLspp1675V6bzZz5xZETY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IT2YlmYdny58zWA9IfRGR+Lh/fmZAegnsnuUIKmi9aWBYDRsDUYuT0+dxrt0FVPGb
	 Io8xWiayk1ubFVe5I7HvW4Ombgb5PV8G/LqTv4l8ouMWLWeBFiVqGNMNZA6+LlKZyi
	 +AUOCaokNtYKvhB6VWn5ChJpDRBjh9xL0JIvpBBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FC6AF80518;
	Wed,  9 Mar 2022 14:00:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE73AF80517; Wed,  9 Mar 2022 14:00:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 742A8F804AB
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 14:00:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 742A8F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rk37yvuJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6EE45619D2;
 Wed,  9 Mar 2022 13:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F13C340E8;
 Wed,  9 Mar 2022 13:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646830849;
 bh=05mWd2rzKwbYb9xhfIrjasgLspp1675V6bzZz5xZETY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rk37yvuJ0fjqDriItDz+V3Yf3Jlw+KIqxJ9EwiPxqe517GzBdz8Y9INqZaZkFXJO0
 aTgA0gRrILYDNSpazoNlAvJglkmWVnscCAb/iWI/UQqD/Law+iqbYzFkHTDD1hCkSf
 BZeM9PdY1IdR3x344Egfv26hr/ZYmjtZSwgdaM0mXmP8FUQWLqeAE86qXDyCKIIxbx
 F0prNvHBe5TvtzSN2ISEmmJvI/fyMAIgykRmkSX4BoNGi7awMqXDcXIeSrZxj5fB4R
 l62qg4SfPGH0xyMD3qAs6B6Yr+08O1Scqi2fvUacgPeXVk/UVTH2PLQg34Vt9SwaEf
 lUK8qXsdFhZNw==
Date: Wed, 9 Mar 2022 13:00:45 +0000
From: Mark Brown <broonie@kernel.org>
To: John Keeping <john@metanate.com>
Subject: Re: [PATCH] ASoC: tas5805m: fix pdn polarity
Message-ID: <Yiik/f+2bYbU4UL8@sirena.org.uk>
References: <20220309104104.3605112-1-john@metanate.com>
 <YiiZv7Fc8a4O1nYR@sirena.org.uk> <Yiie1OUCvi49f1Q7@donbot>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hjBCmlAKl+Qf/it8"
Content-Disposition: inline
In-Reply-To: <Yiie1OUCvi49f1Q7@donbot>
X-Cookie: You will inherit millions of dollars.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Daniel Beer <daniel.beer@igorinstitute.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--hjBCmlAKl+Qf/it8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2022 at 12:34:28PM +0000, John Keeping wrote:
> On Wed, Mar 09, 2022 at 12:12:47PM +0000, Mark Brown wrote:
> > On Wed, Mar 09, 2022 at 10:41:04AM +0000, John Keeping wrote:
> >=20
> > > Fixes: ec45268467f4 ("ASoC: add support for TAS5805M digital amplifie=
r")
> >=20
> > Please don't insert fixes tags unless you're actually fixing a bug,
> > stylistic improvements like this - people try to use the tag for
> > backporting bug fixes and so on so extra tags create noise for them.

> This isn't purely stylistic - it affects the interpretation of pdn-gpios
> in the device tree so that it matches all of the other bindings that use
> this property: active means PDN asserted.

So there's some functional change?  That's not at all clear from either
the patch description or the code - it's flipping both the ACTIVE mode
for the GPIO and all the values set which should result in no visible
change.  If there is a functional problem that is being fixed the
description needs to be clear as to what that is.

--hjBCmlAKl+Qf/it8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIopPwACgkQJNaLcl1U
h9Dz6Qf/Rx3O2NC+fo44hKIqYpJBFJAGAT1vhCKye5rC0cPnfrahsuAJlCCtNnD0
0lH5kzPWDHEDWwFgdqTReBykG6CR2XJeMbmppFJBDXRwleeKLkZsxC4L9b4iQlK3
B5/67vv6Ju0SECEO8XDQQGnqPYclkGA+Bw0fzUvFZtpLxQFgVgbvO5Zy3NDnPLIb
NEMZECzfJP2At7zBbYhBR/VgLRNNjfskD1A/fFb66ldkUUenIy5oQc4EhsowIuFQ
C6hrzwilfB8c2M5gAF1wHdr8I8oOkauoHazJJ2awQZypPn2xKU8JEW2tArhHpTQs
INvjPb0PRGQJls6P1GKKHKNngVgXzg==
=uZKY
-----END PGP SIGNATURE-----

--hjBCmlAKl+Qf/it8--
