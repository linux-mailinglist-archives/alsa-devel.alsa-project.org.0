Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD8728F7A9
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Oct 2020 19:34:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 995BA1789;
	Thu, 15 Oct 2020 19:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 995BA1789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602783252;
	bh=7/ktMrN+y9RlPlNt0esVc1KuysNkY3EZ6vHms7U3vkI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S1uN6+nm1MHCPr7ShvzgUD1DY5dQwAO/jnhh0kf5nGYNGLBuw2O5T5Tc7mNN7Zt73
	 t4/uXNQPGGJizb0rtnBcBu8y6HVsPrAxxhR5+XeIWamaPuP4uo43psjBhWLy5yCOkO
	 k7m/KGhs7uVKbtKCitol5MQ6K3R+HnjswigG+Ce4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A059F80269;
	Thu, 15 Oct 2020 19:32:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78DCDF80268; Thu, 15 Oct 2020 19:32:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71816F8012A
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 19:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71816F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LD45W972"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DA9C22243;
 Thu, 15 Oct 2020 17:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602783143;
 bh=7/ktMrN+y9RlPlNt0esVc1KuysNkY3EZ6vHms7U3vkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LD45W9726yurL26MnLtgE/4TPDHPiyUFXea8r3OIhuyK+bTUokXp6nAYQf+SACX7V
 X/bjtyJ+65dY+/V0mXFmOCRV/DNPxRTAgrxHcZUJ+w4qbX7/fX8MSgRkZ5EfYAchYT
 cHsBHs7nN1KmigHWJTXNHVqFze2+ZD/Kzk15dsHw=
Date: Thu, 15 Oct 2020 18:32:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH 6/7] ARM: dts: Add dts for Raspberry Pi 4 + Cirrus Logic
 Lochnagar2
Message-ID: <20201015173216.GH4390@sirena.org.uk>
References: <20201014145418.31838-1-rf@opensource.cirrus.com>
 <20201014145418.31838-7-rf@opensource.cirrus.com>
 <e9db1a11519dce0938cef867179160a818ec4143.camel@suse.de>
 <89913f8b-fe92-1a31-77ff-49ea3f3d3294@opensource.cirrus.com>
 <5d2587193f0e99996445d5fa507a8acf7854fed3.camel@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Rn7IEEq3VEzCw+ji"
Content-Disposition: inline
In-Reply-To: <5d2587193f0e99996445d5fa507a8acf7854fed3.camel@suse.de>
X-Cookie: Neutrinos have bad breadth.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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


--Rn7IEEq3VEzCw+ji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2020 at 05:12:42PM +0200, Nicolas Saenz Julienne wrote:
> On Thu, 2020-10-15 at 12:14 +0100, Richard Fitzgerald wrote:

> > We want something in mainline so that it can be used by people
> > developing on mainline and taken as a starting point for configuring
> > the codecs for other host platforms. The RPi is a convenient platform to
> > use as the base because it is widely available and low-cost.

> If what you want to convey is the proper way of configuring your specific
> device the way to go is writing a devicetree binding. See
> Documentation/devicetree. It's even possible to validate a given devicetree
> against the bindings (given they are written in yaml format).

These devices already have bindings, that doesn't really help with
describing how a specific board is wired up.

--Rn7IEEq3VEzCw+ji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+Ih6AACgkQJNaLcl1U
h9A9yQf8Dm2aPZjUMMPafvwdr+3w8pMcyoUheiSN5MklP1b8yRi2feJfIB5PqzQn
bk13oOB7cxs4WNQgbZqLPLjJf8bgkutB5Kwga1mm2xDDIdt620GgvMrOosXH05io
xcm3oyOP5mZrvhzHyBdQV6J9DTF6t/ITVF1pefQhP0JiyOsG+jgU+ScDHrLlqXcO
yOpJiU0V2D9PEa38sCfBwHtvqBmYioIfDtAr9IZdoXgIRX+h6TQ2tnzpkrTUmXjY
vDxYu6IRjpvtT6vSvN9I0hM5VS/2AmOE8+taDkVdLUriN13gPPpk5HVJoKv9/qzw
nY4VIdhSllJWzlilek+ouj4S61KrwQ==
=cCIV
-----END PGP SIGNATURE-----

--Rn7IEEq3VEzCw+ji--
