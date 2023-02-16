Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA08699888
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 16:16:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7FCBED9;
	Thu, 16 Feb 2023 16:16:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7FCBED9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676560611;
	bh=ZsMqIuzb05Ne4ViqazRmOCH133Ieiya5wrDPPquG8/M=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XCDszSxUOc8aUjpasSRT/To3+A68AeCAsRR3ggb6m4e3WIj+N04qnrdNAo/1d7JOo
	 oovzDgGL0s1BAF2PbmnPZhan9MkAZMsYFuQd0edLD9Ibb5Za/DHtHq42o3FXisVF5L
	 yTnPnbeimgrpReHNe0/kvB03v8JYrqSw1LWSZx/8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E9EAF800E4;
	Thu, 16 Feb 2023 16:16:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98301F80171; Thu, 16 Feb 2023 16:15:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81C39F80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 16:15:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81C39F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aHXcznFk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C4051B825DD;
	Thu, 16 Feb 2023 15:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1602C433EF;
	Thu, 16 Feb 2023 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676560543;
	bh=ZsMqIuzb05Ne4ViqazRmOCH133Ieiya5wrDPPquG8/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aHXcznFkbedVsxumyqDWvT20Y6thvMkFgR8xuI/CfmFCAWTZqXbJDquucbTqFHavj
	 HC7A5aXXCUlR7VvU50fCHFvN4eVm0MeyxJjNULMNAQEWJBhAW8QQGNANymkkRNdpIP
	 iy0+IMU+sWc4P++3DJ1v6U8gs55ibvgBpqd7+NlxAwctvyaUp4Dfr/0PI7X/IhMOee
	 CkWl/MkbS1Y3eN4AVVBodxrOfW9h+swQu2QzDxUklOHMMK50jniWxAQjlIyRK4XomN
	 rJ9YbyY/q2x2OiR9ZpM3mGJheuuRvU1w3fLSV9hyt23W3seNtdF+bQMKVi/UcHSJri
	 P0tlhyiM+ArRA==
Date: Thu, 16 Feb 2023 15:15:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <lucas.tanure@collabora.com>
Subject: Re: [PATCH 2/9] ASoC: amd: vangogh: Update code indentation
Message-ID: <Y+5Im/6wsqNQ8FYo@sirena.org.uk>
References: <20230216103300.360016-1-lucas.tanure@collabora.com>
 <20230216103300.360016-3-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5riVcraAeE+0JMsT"
Content-Disposition: inline
In-Reply-To: <20230216103300.360016-3-lucas.tanure@collabora.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: ALMROVUMIBM5ZKDZZPMUCQ2IQ5CGGZPO
X-Message-ID-Hash: ALMROVUMIBM5ZKDZZPMUCQ2IQ5CGGZPO
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALMROVUMIBM5ZKDZZPMUCQ2IQ5CGGZPO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--5riVcraAeE+0JMsT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 10:32:53AM +0000, Lucas Tanure wrote:
> Make use of 100 character limit and modify indentation so code is
> easier to read.

I'm having a hard time seeing this as a helpful=20

> While at it:
>  - sort includes in alphabetical order
>  - sort variables declarations by line length
>  - use smaller variables names
>  - remove unnecessary "struct snd_soc_card *card" lines
>  - insert blank lines before return
>  - align defines

This isn't helping make things easier to review :/

> -static int acp5x_8821_startup(struct snd_pcm_substream *substream)
> +static int acp5x_8821_startup(struct snd_pcm_substream *sub)

We do usually refer to substreams as such, I'm not sure this is
really helping.

> -	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
> -				   &constraints_channels);
> +	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS, &co=
nstraints_channels);

I'm having a *really* hard time seeing this as helping with
legibility, it just makes things worse when viewed at 80 columns
but it's hard to see what it helps.  The 100 column limit is
flexibility we can use to avoid contortions but this is fairly
natural.

--5riVcraAeE+0JMsT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPuSJsACgkQJNaLcl1U
h9Bkpgf9He+GgisvMXfHzovOeUmaexSlr7cC8udBT98h0ba00jKK6TKSwlhxQbC9
P42L20e/Zorz014nCe42Srv9gRCllVenYG0lQZbIJ567xRuW02yP5pPHIcxJunRE
3JNtDONZ5pxl/rJC1A/wGpPTQRVCYcudtimB3jYTTx29/8Brfv+HzWNOCHOgQvn5
9Zw6Xo1wXSOhC3qQBHs3N8iQfyL6RJ2KRZ18twgw3aWTNs1yu9rBA2/hQEfSDJk1
JEvlWx+q3uIta3UFMmLiaIYScpW1S7KkIOdQNN1x/0kMiVSvszC94L2eo+K/OS+c
Ka2Q4PN+/taP2AnLQSmn1FhyqZ7DjA==
=onrk
-----END PGP SIGNATURE-----

--5riVcraAeE+0JMsT--
