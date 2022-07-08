Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E00856BE8B
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 20:14:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A322C1EC;
	Fri,  8 Jul 2022 20:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A322C1EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657304047;
	bh=zC75cbLf82yZzCkLHeLDUCeFHIy9eG356Bnj+ZXabVo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hZ0zZh+RUy0rb1i4+eenf5g4B+VLFWHBWdy4E1A0O1/omKjtSDucjAwfmatBIYKak
	 eLAVcbJW4AtWgRhRzT4/3dSlOdQ8YEKl4Kh96FgTL4CQJUL7ZAYPQgEp7stIP71VD/
	 xNXm19dFY+IuGT8Rm38eJ4EKB9R+q5lNGNpBfLxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 223DCF804E7;
	Fri,  8 Jul 2022 20:13:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9876AF800E9; Fri,  8 Jul 2022 20:13:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D377F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 20:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D377F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jAMs1xlc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 541AF61455;
 Fri,  8 Jul 2022 18:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9C7C341C0;
 Fri,  8 Jul 2022 18:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657303979;
 bh=zC75cbLf82yZzCkLHeLDUCeFHIy9eG356Bnj+ZXabVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jAMs1xlc+rCdP9TYd/xTKv6w+LdD+XtsIQFyhoQ0symHPJ7S6ef/Ri18aPHriUcN0
 7QeNAh40fL7FYEK2dHI9PnPtd5VqRlm5NrcAaz3e3w/LqL9lqSEoEByA2p/wnuIcW4
 R3kclMFxLwLqLNz6BLXc9OD9Ttjd76YqNwOR+xXm5HMaOXAvQAX5lWKLM1fpL65x5G
 YHX8vPz+juua7emWb3D1eqX1rxu/HGPGKHOz4V6FGop6QFMPHFHS6E7xZKUn9/dVlz
 8krRZbsMfhp+eK3nQq9BmHvLqAJHMRhdWE0nhirbtOe8zD8Uk2N9v3Mu9aXT0Au3di
 KaYYtMeyQbsEQ==
Date: Fri, 8 Jul 2022 19:12:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Wallace Lin <savagecin@gmail.com>
Subject: Re: [PATCH] ASoC: nau8821: add new widget to control system clock
Message-ID: <YshzpRewYS0f/3qy@sirena.org.uk>
References: <20220707080751.76892-1-savagecin0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MuRdaVEaQ70yYP5Q"
Content-Disposition: inline
In-Reply-To: <20220707080751.76892-1-savagecin0@gmail.com>
X-Cookie: Familiarity breeds attempt.
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, CTLIN0@nuvoton.com, dardar923@gmail.com,
 supercraig0719@gmail.com
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


--MuRdaVEaQ70yYP5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 07, 2022 at 04:07:51PM +0800, Wallace Lin wrote:

> @@ -1430,6 +1460,7 @@ static const struct snd_soc_component_driver nau8821_component_driver = {
>  	.dapm_routes		= nau8821_dapm_routes,
>  	.num_dapm_routes	= ARRAY_SIZE(nau8821_dapm_routes),
>  	.suspend_bias_off	= 1,
> +	.non_legacy_dai_naming	= 1,
>  	.idle_bias_on		= 1,
>  	.use_pmdown_time	= 1,
>  	.endianness		= 1,

This isn't obviously connected with the rest of your change and breaks
the build since this flag has been removed in current code.  It should
probably just be dropped here.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--MuRdaVEaQ70yYP5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLIc6QACgkQJNaLcl1U
h9AeXAf/R4teP1fxf/XP3SSoHLewWFKIUe4lPQ/K0ujoKThDcqMS0ZWJfb+3dj9b
MZNOC2q9JB3IZ3dF6x1T1KBfb16fXjG8b00Y75/jdLlOUFltVHICMAfp2/c0FvNl
wM69GEfNb4FZjnpiLNnbLB6Da08Ff38PKmsRJmCCpN4b+0WioabqGE1uwr5vKdu0
KmNLmS+gI9cQNpYqmBwYwUztByg/b3qGbIuyIH571ojPTwe/0c1JeHeVH6DyJKJj
HHgiuKV/+WZEbGo6ZcfsQ3bcjV87kpKxb+Dvb6LY+NrnynJh7KKRds2WLidqG6gf
hMx81axOxI7/9G75W6G8TdsNgDps5Q==
=sqyb
-----END PGP SIGNATURE-----

--MuRdaVEaQ70yYP5Q--
