Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 769EB6A75DA
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 22:08:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 504521D9;
	Wed,  1 Mar 2023 22:07:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 504521D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677704912;
	bh=YU3OqR6PGCqyq60tMLnkQIYsH8ICE8R/mE5hLImogNY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b6/a6f8wptU8m4GQx0ZpAtcz2lKyUiZ/lne64jGEzxdSIofIjXusIm8hAJ9atGsN8
	 7cvRgXdKugr7VK9IXzqUjzfT/Pq3o6wlKE8ZNcf75IeatLchw7UNeCV+dsitFyV3cM
	 xL0n11Cej7xo+I0PB7G58LJIclqT+eZCKhOk6KVE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3AE7F80310;
	Wed,  1 Mar 2023 22:07:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DC73F8049C; Wed,  1 Mar 2023 22:07:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89C47F800DF
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 22:07:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89C47F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CsWZVm2c
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C43C1B81136;
	Wed,  1 Mar 2023 21:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2112BC433EF;
	Wed,  1 Mar 2023 21:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677704852;
	bh=YU3OqR6PGCqyq60tMLnkQIYsH8ICE8R/mE5hLImogNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CsWZVm2cutYXcKys2d2Qjp/oBkwa/j5pldnCm6GzISftZytANF4nhlO3bVhM+1vi0
	 eRlfJgcVFkqS6PUNwgFG6MOCZHQPxBFWx5ny9h6dcZJeR6muwL1wRSckfvcmWXC0h/
	 BPwDfBV53qMlvd5LKXivI8kJdbAFgjMQ3e/NQSbfr+oJxCx5QpIooobfyHsJVTY+Sf
	 WpYOz5Nl+P4X3OhVYBKGvctVJagGn3S9pKSXhMjnNasN7w8elfGiZTNvoBT5nhZS2y
	 4ct2rc4mlb4U3FcnDlcZBEpl0fNTyh17r+uRqY9pBYkRb+yWVf7Th/yvh1mFLnvifd
	 gM1PsE0oUh8jw==
Date: Wed, 1 Mar 2023 21:07:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH v2 2/2] ASoC: wm8524: Correct the MUTE setting while
 power up/down
Message-ID: <Y/++jj0bQustGAhl@sirena.org.uk>
References: <20230227091938.1671416-1-chancel.liu@nxp.com>
 <20230227091938.1671416-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h2bgY9riaA5HydEq"
Content-Disposition: inline
In-Reply-To: <20230227091938.1671416-2-chancel.liu@nxp.com>
X-Cookie: Life -- Love It or Leave It.
Message-ID-Hash: XCXBISYUIUGBHJ3ZOMDRNCSCD2HDYJYP
X-Message-ID-Hash: XCXBISYUIUGBHJ3ZOMDRNCSCD2HDYJYP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XCXBISYUIUGBHJ3ZOMDRNCSCD2HDYJYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--h2bgY9riaA5HydEq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 05:19:38PM +0800, Chancel Liu wrote:

> wm8524 should be unmuted while power up and muted while power down.

> @@ -75,7 +75,7 @@ static int wm8524_startup(struct snd_pcm_substream *sub=
stream,
>  				   SNDRV_PCM_HW_PARAM_RATE,
>  				   &wm8524->rate_constraint);
> =20
> -	gpiod_set_value_cansleep(wm8524->mute, 1);
> +	gpiod_set_value_cansleep(wm8524->mute, 0);
> =20
>  	return 0;
>  }

I *think* the theory with these is that the device should be muted by
default so that any noise during startup is minimised, and only unmuted
when there's an actual audio stream, done in wm8524_mute_stream().  I am
unclear why this default state is set up in startup(), or why we unmute
in shutdown().  It could be that the startup thing is trying to work
around some suspend/resume thing?  In any case I'm not sure this helps,
I think really we should just not be managing the GPIO in these
functions at all and setting the default state to be muted when the GPIO
is requested.  With this change we'd move the unmute _mute_stream() does
much earlier, meaning that any noise output by the SoC during startup
will get played.

--h2bgY9riaA5HydEq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP/vo0ACgkQJNaLcl1U
h9BVWQgAgHIQcJ7bDencNJpYBmtSKceFAd9HlLw0yDL6ceOi5m8NZJMKWADWory7
ybQhrjsTBz3YUg8yeeWL56j+XAVEIE387HmQdh1H/aZTA78/RVhd4Ntt/VYOiPZw
/b1VnTBZjnjBsCDTWwmhqo2Z6T69qaZLg4G1chiGvHON+rMTMXBeVhzVntlmO0vA
wkfFUmQpY5o8Uojb280mzqkJoOpsG1YbnD7XOv+NblOpdV4qGo+3s67E04p+AqPk
5pAwAIBPAcZaEnUZOtfV02gqQAeoBSn8WvU3weUzmsoexVgAnGSj0d/1X2ETiGtt
qzU90zZ3TD3qDBPBJcIaR0Y6AnvQbw==
=cAYB
-----END PGP SIGNATURE-----

--h2bgY9riaA5HydEq--
