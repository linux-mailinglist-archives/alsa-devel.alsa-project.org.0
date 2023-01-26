Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B0267CD3F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 15:04:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E960EA7;
	Thu, 26 Jan 2023 15:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E960EA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674741891;
	bh=XFAbkKczz3+vE6lYAyx7yD6xSlpObyC5TMkTWoIuhAU=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=N6B7SYXyx8Vn3n5bcB4vnKVRBrU8uOO3PCxUjN8d2QZ59CK+AM0Cw9fVXPgPU5BSL
	 jGXAa3r4NO8idW0/g267+e2L8vwf0t10QEZ0la/ul2uPFvyMf4Wtdh+AMLhpOJ/jmG
	 PacCkI6x0rdG7TBcxFLXmmlX8Pm5y8I+zBDdFNEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CAC9F8025D;
	Thu, 26 Jan 2023 15:03:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95C50F8027D; Thu, 26 Jan 2023 15:03:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 020D1F800AE
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 15:03:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 020D1F800AE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E2DcAfVA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4703EB81DBC;
 Thu, 26 Jan 2023 14:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CA9C433D2;
 Thu, 26 Jan 2023 14:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674741819;
 bh=XFAbkKczz3+vE6lYAyx7yD6xSlpObyC5TMkTWoIuhAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E2DcAfVA+WAdLstmscrckFhOGZ5QUSDK040SfeFG+csk1tOA3gVraDr4vd0PhbUZ8
 3arOgtwV0V7+N7SeohQXCYNWUrYDrWssHwwlaPR4yGF3p/pIBVGQeL1fpXZlC+o4/E
 53cipUURYP76keojquLPmbOAK6Kmpl2NWZ2HZxl1mjYuMu0QO0SZl0/07FouXzfB++
 tiCghX0h+IevcKu6itYm/nmHZTS4a3Qc6wLHxly3KoRzm0SC2f6byJzIGqln4kVNls
 s7Vty1Af5JzM1T4LCXU6Q6yLee9t0zuYdKcWrjkzJQBaC1gpnl//s8P6FNQfkKC0Zo
 fyoWsE5DDA8hg==
Date: Thu, 26 Jan 2023 14:03:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ASoC: cs42l56: fix DT probe
Message-ID: <Y9KIN7GerLd4ziw0@sirena.org.uk>
References: <20230126135552.3625887-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/kMxXhANnbSaD4Sh"
Content-Disposition: inline
In-Reply-To: <20230126135552.3625887-1-arnd@kernel.org>
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
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>,
 Wolfram Sang <wsa@kernel.org>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--/kMxXhANnbSaD4Sh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2023 at 02:55:29PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> While looking through legacy platform data users, I noticed that
> this one could never be used with DT based probing as the
> platform_data structure gets overwritten directly after it
> is initialized.
>=20
> There have never been any boards defining the platform_data in
> the mainline kernel either, so this driver so far only worked
> with patched kernels.

Or there is no mandatory properties/platform data and the
defaults are fine for most systems (which is a common case).

--/kMxXhANnbSaD4Sh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPSiDYACgkQJNaLcl1U
h9BGGQf/TmJrEJHbdrJ/VUHGDohENM3/hBKqq91KIQ+9c/SMW3FrprCItWsdeZwJ
a2vHCpn65dwHzDWVg3SxRFEFaaCQncgPW/H+uicMq8RVuFh9CufTMOAwpP4AobUW
dxn0BMyu+bLqeC9/PSFo/TiixsqMVmb724ETP9QFzVl4sLnFQ753/ejmgsHnu/gW
vEqw/RJOOjTIZlrAvso99yymE/NDQsNXw2vo8XPyNYowRnHBtKqkYBhP16qcps3t
6eB02jpiMr8ggPig4sNjafe2aqWvOzVFI6goWvZEHdw4QtNM2+C7U658etEgBpOM
L6koux7hs7dDBBjIlHoIqJ86CAiyaw==
=eCk5
-----END PGP SIGNATURE-----

--/kMxXhANnbSaD4Sh--
