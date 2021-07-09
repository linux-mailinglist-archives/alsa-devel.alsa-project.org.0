Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9273C2399
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 14:41:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C39861607;
	Fri,  9 Jul 2021 14:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C39861607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625834462;
	bh=zx3as4aTIYkQYTOD08iIftZG3t7pVkPX+jvUbfWH6Kw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UsZL6VWBWdYKEIKWJd2Ue4Z5pfq6Chw6t2g4B73WUKXTEEB7wkmX9S82C5VEteCjd
	 7j36LH5dRnPYAWHkVogR9yx0Ho0Nf1DSmc1AfyhPDKFm7uOsULRY2ogCz5+w/RiI2E
	 a6dY96RpkTQOUX+1+yoLUQ4t54OGGkwWJWQFiXms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5899DF8012A;
	Fri,  9 Jul 2021 14:39:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F33D5F80224; Fri,  9 Jul 2021 14:39:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BAB2F8012A
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 14:39:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BAB2F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O+whJ8vQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4873A6139A;
 Fri,  9 Jul 2021 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625834367;
 bh=zx3as4aTIYkQYTOD08iIftZG3t7pVkPX+jvUbfWH6Kw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O+whJ8vQT6h5zF5horMd8PaIPMpqCRERHAu1zYxvsP5zjGel/A32OG2zQ44NGQzbj
 YSCClQhetihVco9Yi34rfxEwh7dM9YvLEtntAaTr0XeXY1NatgAM3IkKshodn50zL9
 3I/ML5phYdtXMPuxZUub/LG5VzO4JOAhuhJ/BaE5HC4Lhx1JREjNZ2cp19WvfINm7A
 tGTOtYLgw7XmfaKkT6mvMoM0S+aRDPBbCVT3WNK7ZdLOfF67lDH6t3BxlMw0HM3g9G
 +7M54mJ18oLabj6BGX0cnOoZe1vYnijb/Bjp3BM52HVIhSdSiQy7YgPAVegJooOMG5
 nWAFafqdCTzXg==
Date: Fri, 9 Jul 2021 13:38:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: Issues using simple-audio-card driver with Xilinx Audio Formatter
Message-ID: <20210709123854.GA4112@sirena.org.uk>
References: <6c7635f59ea9b162999f060334eef48e0812534b.camel@calian.com>
 <874kd63oqa.wl-kuninori.morimoto.gx@renesas.com>
 <52eda9910822e7e854b049127e462bf468f912ed.camel@calian.com>
 <87r1g91ygm.wl-kuninori.morimoto.gx@renesas.com>
 <2cccca32d53e1d832df67d070bac9ca998a931c6.camel@calian.com>
 <87bl7cl20y.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <87bl7cl20y.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: This fortune intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 Robert Hancock <robert.hancock@calian.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
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


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 09, 2021 at 10:16:45AM +0900, Kuninori Morimoto wrote:

> > So the next issue I'm now facing is that the MCLK to SCLK divider is not being
> > set properly in either the Audio Formatter (MM2S Fs Multiplier register) or in
> > the I2S Transmitter (I2S Timing Control register). The xlnx_i2s driver has a
> > set_clkdiv function defined in its snd_soc_dai_ops structure, however that
> > doesn't appear to be getting called. And the xlnx_formatter_pcm driver doesn't
> > seem to have any code to set XLNX_AUD_FS_MULTIPLIER at all.

> > In this case I have a sample rate to MCLK divider of 256, so it looks like I
> > should add mclk-fs = <256> into the dai-link nodes in the device tree, but
> > there will need to be some code added to the xlnx_formatter_pcm to do something
> > with that information? And then should that driver have code to trigger the
> > call to set_clkdiv on the CPU DAI as well?

> Hmm... clock is one of difficult point to be generic, I guess.
> audio-graph / audio-graph2 has customize feature in such case,
> but simple-card doesn't.

> 	- create generic clock handling way on simple-card ?
> 	- add customize feature to simple-card ?
> 	- switch to audio-graph / audio-graph2, and use customize feature ?

> Thank you for your help !!

For something like this I think the driver should be able to figure out
the ratio based on the configured MCLK and sample rate.  For the most
part set_clkdiv() should be a legacy thing, it's very manual and hard to
see why a system would do something different to the obvious ratio
usually.

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDoQ10ACgkQJNaLcl1U
h9AYcQf/dTsd3K264yv8Ah+5nvdHVaV3hvl9bwL4lT4uhvLXErYs586oJwoPGdYZ
aoV4wPUPJ5lL9o9lH29X1b0tJr3Jw1zU9lXUn5uotx0NFoXgvAuP2nXANTUMoYL4
JaXbSp4ZXFTRt6nJ5zmiR70tRFp0mCx0AuKY6Nm5hR1xcIBgQSCnUurADWbhskCS
kp2kYqXvJPJG4qy9pI8Vj9VqJ5ZQd3rUckTRCPlA4z7GAXQH5DCg+9xpgk6Y62k4
SvGCK7NUJlduzx6VALQg0xe5cF4M+HvNJrkDfsGlWiLEHaswib2wbvkvfDXmKEgS
IzZ1mhq3h64HI9rnGxEwEKKyTVyp5A==
=QIG/
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
