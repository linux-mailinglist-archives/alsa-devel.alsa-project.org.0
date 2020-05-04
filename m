Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5A91C4370
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 19:57:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39BCB1715;
	Mon,  4 May 2020 19:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39BCB1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588615069;
	bh=7AASLHxv2Rby4dstXR1mZull2LY1/sl46uo96ENxXog=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=okjimmcU1Rln8sjsmi91zEg3zNubdab14bvCpaBPdyiT/ILzQAcbs43y+SUz40lnP
	 zeT9aJx2uOVcYQ+NQLCPWecpv1KuaDYgisFC1Lddjxy8wY6aJWPOvas4d6WgT/h+p6
	 wTsuGsp3G0us+zNbeA4WZ5Q2mU5HMUbwcs+YrFW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF07CF800DE;
	Mon,  4 May 2020 19:56:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59D1EF80249; Mon,  4 May 2020 19:56:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62117F800DE
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 19:55:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62117F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T/4b4jqa"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 40165206B8;
 Mon,  4 May 2020 17:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588614957;
 bh=7AASLHxv2Rby4dstXR1mZull2LY1/sl46uo96ENxXog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T/4b4jqaWekrwSnAOxrrDnnsqhQdyBbqnCTaU4oZvRIk1eLfkoYWFZ1ih5QvyBaPn
 /XDMyxX07GqjYgR0nbxYkb7arLT1aQCJjt4ADoIePOJItfhJ06Z1Gf3LlyxSV+FfeV
 FizZRIenSvfWO2jknmk2ojaBVX7K1p8zWc+VBTk0=
Date: Mon, 4 May 2020 18:55:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [RFC] DPCM for Tegra
Message-ID: <20200504175555.GG5491@sirena.org.uk>
References: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ahP6B03r4gLOj5uD"
Content-Disposition: inline
In-Reply-To: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
X-Cookie: My life is a patio of fun!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, nwartikar@nvidia.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, swarren@nvidia.com, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


--ahP6B03r4gLOj5uD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 06:11:23PM +0530, Sameer Pujar wrote:

>  a) Can I use a DAPM Mux control to activate a BE path? This in turn can
>     program required switch in XBAR.

If it works then sure, that seems sensible.

>  b) I have modelled SFC and MIXER as backends. Is this allowed?
>=20
>     This was done to include SFC or MIXER HW components as part of the
>     sound card and use like below in one of the audio use cases.
> =20
>     ADMAIF1(FE) --> SFC(BE1) --> I2S(BE2) ... OR
>     ADMAIF2(FE) --> SFC(BE1) --> I2S(BE2) ...

This is the sort of setup that'd be a lot happier using a component
model.

>     I used following workaround to connect multiple BE components.
>     With this I can see PCM callbacks happen for all BE DAIs along the DA=
PM
>     path. The obective was to connect multiple components together and (a)
>     was used to connect one component to another. Each "-->" here connects
>     two components and it is a switch in XBAR.=20

This doesn't strike me as something that's likely to be robust but given
that that applies to DPCM in general so long as it doesn't break anyone
else's existing stuff I guess it should be viable, it's not like there
are actually good options that you could use currently.  It's really
hard to get enthusiastic about it though.

>  c) Hostless mode did NOT work:
>      - Following audio path was intended to be tested:
>        I2S1 --> SFC --> I2S2

>      - [3] offers two options:
>          * CODEC<->CODEC: If I were to use a separate DAI link for each B=
E to BE
>            connection, then it will result in a similar design what we ha=
ve
>            currently.

This is more in line with components so will probably be easier going
forwards.

>          * Hostless: I did not come across references for this.
>            (Any references in this regard will be helpful)

Not sure anyone has ever done this with DPCM, could be wrong though.

> May be the current Tegra ASoC design is more suitable for component model=
 as you
> had previously mentioned. I wanted to understand if above, especially (a)=
 and (b),
> are acceptable in this regard or if there are better options to interconn=
ect
> multiple ASoC components.

In general most systems would be happier with components but yeah, I
think that's particularly the case for something as powerful and
flexible as your hardware seems to be.

--ahP6B03r4gLOj5uD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6wVyoACgkQJNaLcl1U
h9BsCQf+NDpQnXUKOhrp8OMCAs73chnv7fTrNscXnf0V+rnrqqSC7b6d0Q2tz3QL
8HYzl1AiMtRaAmybm98BhWpdUWXMGTKdYMBM7uKX2r+uVkm6oWhhK+EST6fOMv3k
ZvgRM35+2mIXUrSR5b62uPIi8O3mtbLuFkPb3oWkw/hT0jQm4MPKl/c6h3f9e2qb
FY8yrgExhRQkp+NAKMSNKV4gEZbViEJG5M9w879aEjQdWWhJ4tqo2s2QQXZmg5p2
x/uNk6mgWU+edW21BN78iaOB8urYcnac5ItgRCiVVCrhRjNeP8qhs0irsRF5l03X
656KL7U44mgySYNW2tlLHsXV/jmJXg==
=W0ip
-----END PGP SIGNATURE-----

--ahP6B03r4gLOj5uD--
