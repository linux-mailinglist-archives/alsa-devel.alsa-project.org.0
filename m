Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D7161236
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 13:38:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF1F81677;
	Mon, 17 Feb 2020 13:37:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF1F81677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581943120;
	bh=ydifzsJ40KU0yQFS5L7E9psBLEjJmYBfvnPBxZQejfs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rOkKZRncVmL5B7zA+7WFHEMVGTbxJHKrA5yrBUJ7BmqfpWjPcLmLSU1qsE54JOdS9
	 yd0/JC7TsJXjzR/oWC9nB03adp6RBpm3I3R7V97n2XBy54T4SnHn0V7hM7Gf7bhd5h
	 +XpHW1WJ3mXqGd6UyiEYeCB3vTCjxjLXYSHWCkRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD4C4F801F4;
	Mon, 17 Feb 2020 13:36:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DDA4F80172; Mon, 17 Feb 2020 13:36:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A8DD5F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 13:36:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8DD5F800B6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30CBB30E;
 Mon, 17 Feb 2020 04:36:52 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A84553F703;
 Mon, 17 Feb 2020 04:36:51 -0800 (PST)
Date: Mon, 17 Feb 2020 12:36:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Message-ID: <20200217123650.GD9304@sirena.org.uk>
References: <1581666814-6380-1-git-send-email-derek.fang@realtek.com>
 <20200214123803.GG4827@sirena.org.uk>
 <b9cfe003aeb34216b59c9a22c4601bf1@realtek.com>
MIME-Version: 1.0
In-Reply-To: <b9cfe003aeb34216b59c9a22c4601bf1@realtek.com>
X-Cookie: There was a phone call for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Albert Chen <albertchen@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: rt5682: Add CCF usage for
	providing I2S clks
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
Content-Type: multipart/mixed; boundary="===============5898061874182434278=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5898061874182434278==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 10:59:55AM +0000, Derek [=E6=96=B9=E5=BE=B7=E7=BE=
=A9] wrote:
> > Subject: Re: [PATCH 1/2] ASoC: rt5682: Add CCF usage for providing I2S =
clks

> > > +	if (parent_rate !=3D CLK_PLL2_FIN)
> > > +		dev_warn(component->dev, "clk %s only support %d Hz input\n",
> > > +			clk_name, CLK_PLL2_FIN);

> > > +	if (rate !=3D CLK_48) {
> > > +		dev_warn(component->dev, "clk %s only support %d Hz output\n",
> > > +			clk_name, CLK_48);
> > > +		rate =3D CLK_48;
> > > +	}

> > Are these genuine restrictions of the hardware or is this just being
> > hard coded in the driver?

> It's hard coded for an application case.
> Generate a 48kHz clk with a parent 48 MHz clk.

I see...  obviously this is really not good quality of implementation
although it doesn't actually break any external interfaces so I guess we
could take it.  I would at least want to see some clear comments in both
the code and the changelog explaining that this limitation is just a
temporary hack until a better implementation is done though.

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5KiOEACgkQJNaLcl1U
h9DMXQf+Kon4Z0ajfBKari7ZjfJBGGoDxE3CDeiCPfGliI89G4zGAZkg4rOyrNkE
xnvk5TsRwBCe+yYRz6PXukm8FXIV6Th0tcABe/KzKfSfsJpk7T0Mmez2Yz++SNKa
QKOHFXF2AGtXFhbfQ6eq6nj9d+9es49KWBixzf6HBrpBrqoGCGmK/eUcmvggjEgs
tOq3WIDTjHnSvR1Zt/I15u0O46NVQ2jwvwP2htvHVcrId2Kk3lInSkXl3mMshqf6
Lio0vKQ4mSkgLOPXh+tUlYWRBpLfrbZFLFRLvoZnD5aUCB9aZ3UaFvFzy17cUL5W
ldYn9lt0R26U9RgCzF1jAkgxQDaaRQ==
=L9HC
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--

--===============5898061874182434278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5898061874182434278==--
