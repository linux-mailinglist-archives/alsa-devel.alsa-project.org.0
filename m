Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA36524A0E
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 12:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 087E51941;
	Thu, 12 May 2022 12:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 087E51941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652350394;
	bh=Oey5BXGPbf1OugkOQQFP+E2qKsEx1HsDDiLcia9Q0nQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XYzqOZ0E/2S3wkbvcAmSoFEncPkHZKei0NVoHCljAvDrTrePrLqtsnU0//Sj74MSv
	 o0FrwEivQLvND3hMlnmh7wWI53ZQkvQqPkU/2OVso6/6avmEoG63zgI4DuL7Mxeti8
	 EpWRUAD2sQz34BfKy4fv8jnSdL28U/uCOxzbDecE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 551D3F800BB;
	Thu, 12 May 2022 12:12:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93AEEF8010B; Thu, 12 May 2022 12:12:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 148F4F8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 12:12:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 148F4F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CA554f/a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 75DC361BAD;
 Thu, 12 May 2022 10:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A62C385B8;
 Thu, 12 May 2022 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652350327;
 bh=Oey5BXGPbf1OugkOQQFP+E2qKsEx1HsDDiLcia9Q0nQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CA554f/a0F6olDd5UTIsirFcM+zB4aDqr5WhbIvwyyXkhDo/cP78AtprtqRVcB6SE
 t8nV4m7RGgGWftGkF68aDKcbMf5U/OZc5CNeVrEk9Z3o54apQCf174PtjBWlgXcCiL
 bSq7MWVkthCDAb8M3WaF5NHejiC1jI+HBi4nCTGXJt3yndCr75vh20YZS8jOznoZLX
 DaSxGg7VBWrJ5ANPRN8L62JZ3ZnGZ0oGXLOVF1H0JmSLzknEtPAgRskKVAI2jvMFtj
 d6h/AbatCH6+SGyMzGXnMLvXQZco74bNhdsPrCcFex72baicEk+xGqD84Jq3Ad7lkt
 8mQ5TQC7dpVrQ==
Date: Thu, 12 May 2022 11:12:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: [PATCH] ASoC: max98088: add support for reg_4a_cfg_bypass reg
Message-ID: <YnzdcubW7m+CwnvN@sirena.org.uk>
References: <20220512074359.446999-1-tommaso.merciai@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Rk/8LQJNy9MPTC4G"
Content-Disposition: inline
In-Reply-To: <20220512074359.446999-1-tommaso.merciai@amarulasolutions.com>
X-Cookie: Oh, wow!  Look at the moon!
Cc: alsa-devel@alsa-project.org, linux-amarula@amarulasolutions.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linuxfancy@googlegroups.com, linux-kernel@vger.kernel.org
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


--Rk/8LQJNy9MPTC4G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2022 at 09:43:58AM +0200, Tommaso Merciai wrote:

> Add mixer controls support for M98088_REG_4A_CFG_BYPASS register

> +++ b/sound/soc/codecs/max98088.c
> @@ -486,6 +486,11 @@ static const struct snd_kcontrol_new max98088_snd_co=
ntrols[] =3D {
>         SOC_SINGLE("EQ1 Switch", M98088_REG_49_CFG_LEVEL, 0, 1, 0),
>         SOC_SINGLE("EQ2 Switch", M98088_REG_49_CFG_LEVEL, 1, 1, 0),
> =20
> +       SOC_SINGLE("SPK Bypass Switch", M98088_REG_4A_CFG_BYPASS, 0, 1, 0=
),
> +       SOC_SINGLE("REC Bypass Switch", M98088_REG_4A_CFG_BYPASS, 1, 1, 0=
),
> +       SOC_SINGLE("MIC2 Bypass Switch", M98088_REG_4A_CFG_BYPASS, 4, 1, =
0),
> +       SOC_SINGLE("INA Bypass Switch", M98088_REG_4A_CFG_BYPASS, 7, 1, 0=
),

These look like they should be DAPM controls since they're controlling
audio routing but they're being added as regular controls.

--Rk/8LQJNy9MPTC4G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ83XEACgkQJNaLcl1U
h9B8ngf+PqafSiaHQZbAhE4xWyxrNCZE8LZdLVxT4EoKR0laiFWL/7SXyI7tdfRl
KK9c0GvCubb9MbNPl3lhFmsPutwnNGpfZmG9JQt3DNcPuyyubB9AJAxq2QUQkIPr
buGHa5C3sFvBgWK7s/tkbSiZRvAYDCYlNZULXD27e8l02qUUK/H5QH9ZB+6EM+j5
n/y4IGIU8FfioDS52UQE11f/lEaRG/arItQ8QYbdBEKOInA+Vm3eCu54j+nLknjr
zBnkr+920iw3UdzBNIasCDnzF2oW5W5tMGWvZEDT8QuQnwGDVuRvkajAylFn+PkE
BbRJ2CENvy9DMpzy5+Wg4RJVTUTuuA==
=emk8
-----END PGP SIGNATURE-----

--Rk/8LQJNy9MPTC4G--
