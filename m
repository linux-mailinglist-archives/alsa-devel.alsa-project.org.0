Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 660815F9D77
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 13:20:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 864882857;
	Mon, 10 Oct 2022 13:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 864882857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665400830;
	bh=Kovg57r5VykKe/+/1vpAjKiI6SWlnob5ulkWDfEuaLY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUE69bPY5WUIEtkiFyEiMcb+vnzUVhdkEPZH7UegdNshou+UVwZDV4QLbcC7h0oPa
	 6umnrgt16OXCpVk5M/w3oZyC/LK6MNYWj4kJGtNy6Gy6E7ab88MT2wz+S9syHTB8+I
	 gYSxuPYedX4M82vAStowr7f/Gr0kju/9lk68/UZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F164CF8032B;
	Mon, 10 Oct 2022 13:19:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0D07F80107; Mon, 10 Oct 2022 13:19:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A56FF80107
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 13:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A56FF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="do+O8KBy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3CB4FB80E70;
 Mon, 10 Oct 2022 11:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4F9C433D6;
 Mon, 10 Oct 2022 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665400769;
 bh=Kovg57r5VykKe/+/1vpAjKiI6SWlnob5ulkWDfEuaLY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=do+O8KByAmhICHFjP9zRlZ3lgv8xdB45e+5xsEuNV1c5ydSPdFLpB4zQIuEQt732c
 ucggdO8j6Tax6bkHjxV3anSm6gXuYMUmyk/QhEWaJ6BP0B0yucEaVhha2S4YqafnN5
 oHcbGzO2dMChPTuZPmTDMpJz3IT+4tYu0tMYlQ8900rPUrAvsBqN3BBQjKRg0wkVzv
 TyUZSnPEqFMev20RNn2a16RkyhCU5HCnz36qK8o1q6HzfDvSfN1kzjqUGyoJkJyJrl
 WRN/JXTueIa9xp+uY3d0/GiXdGwQvZ3dIPzm4KPmlOH39DMEjbiRKqfi/kJSdMXllQ
 pBx2BeAFzVsww==
Date: Mon, 10 Oct 2022 12:19:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Siarhei Volkau <lis8215@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: jz4725b: Various improvements and fixes
Message-ID: <Y0P/u4pJT8rup8Za@sirena.org.uk>
References: <20221008181655.2747857-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Op3ThFipb3tyblPC"
Content-Disposition: inline
In-Reply-To: <20221008181655.2747857-1-lis8215@gmail.com>
X-Cookie: This sentence no verb.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>
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


--Op3ThFipb3tyblPC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 08, 2022 at 09:16:55PM +0300, Siarhei Volkau wrote:
> The patch fixes:
> - incorrectly represented dB values in alsamixer, et al.
> - Line In path stays powered off during capturing or
>   bypass to mixer.
>=20
> The patch improves:
> - Exposes all mixer inputs (both Mics, LineIn and DAC) with their
>   gain controls.
> - Exposes output stage (post mixer) gain control and makes it new
>   Master playback gain, DAC gain was the previous master.
>   However, no Master mute now.
>=20
> Known issues:
> - Bypass path enablement isn't applied immediately, for make
>   things going bit clock needs to be triggered for a bit,
>   e.g. by aplay dummy.wav
>   It might be a hardware bug, since the bit clock isn't
>   declared as required for codec operation.

As covered in submitting-patches.rst this should really be split up into
multiple patches, with one change per patch.  This is especially the
case here since you have a mix of fixes and new features which should be
applied differently.

> -	SOC_DOUBLE_R_TLV("Master Capture Volume",
> +	SOC_DOUBLE_TLV("Master Capture Volume",
> +		       JZ4725B_CODEC_REG_CGR10,
> +		       REG_CGR10_GIL_OFFSET,
> +		       REG_CGR10_GIR_OFFSET,
> +		       0xf, 0, jz4725b_adc_tlv),
> +	SOC_DOUBLE_R_TLV("Mixer Line In Bypass Playback Volume",
>  			 JZ4725B_CODEC_REG_CGR3,

This doesn't appear to correspond to what your patch description said
and will presumably cause problems for any existing configurations...

--Op3ThFipb3tyblPC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmND/7oACgkQJNaLcl1U
h9Ck3gf+MN3H2Q8YLJKMm3xOdxFyrrH0ZsGoIK4lRoS2exdLznRoBee133qnowPW
g+3+Oe3kzCX/Pd+uHl3u6Xsj63GkKUM7UewBPSqlxa0ErTBKPO7GSOaWKQanpyah
oPvhJ4CXee0Ul6nS3STH8SKZ8v57Xca64GFHn7yQ+8mFvob6PspUsYhpk7098Obj
nOMlKo1E1UCjZTJ6lmaPc5uSyBGb400n+t0jq1YYZEcWiRiCtqGITwctzplf3Cjo
6gW0O9R8goqDdIZE/rFCoDu8PfEc69ulzSw4LaKPQJKHSXdFlY/Vrzz5w5NQJgM9
R7ziLxg/PCEgA6SOQTt4KABRUxuGzw==
=jUV/
-----END PGP SIGNATURE-----

--Op3ThFipb3tyblPC--
