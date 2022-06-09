Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DED8544DC8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20EEA1A23;
	Thu,  9 Jun 2022 15:34:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20EEA1A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654781696;
	bh=By/LmjmkZstbquCKqvZQy6ApS9VkUQsifOo+GuV6Dko=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNDZgBfFWdmGmVJlLpVchcK+JAcmZy9ySfaSghGxnftCM9DKdVoQpnzwvL0/xx1WP
	 P3OUhptS0Kik0/c5y4tAMKMJsRrTTlptmlP8nV38dCOBYxA1lvCJNo1zm4nZMAGBE1
	 9xWi7m0cYOy+xOOB01ZQ1T3CAeecYnkFZDz2+a+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3530F801F5;
	Thu,  9 Jun 2022 15:33:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF792F8019D; Thu,  9 Jun 2022 15:33:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07456F800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07456F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jBjS/rOw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3C9161684;
 Thu,  9 Jun 2022 13:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A641BC34114;
 Thu,  9 Jun 2022 13:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654781630;
 bh=By/LmjmkZstbquCKqvZQy6ApS9VkUQsifOo+GuV6Dko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jBjS/rOwm0hXNM3I8qiEPO7/IWTr1BS4RG6x9wN9iGRDrDP9gF+wZT1lEBA/ZPR3E
 /IznIWKF1BjwRBQm+yZjYzHz4pWUj8mScY/u/lV2NkIej/gw6RywABIeNCvJs9IdK4
 th2rkhqsJp/PKLG3zb1z9m9UeN6qRprBs562Aj/2KeDD+OeNMciH67M6F5pVx6scZ0
 ZcH7msHNtn5u64cIA6FePjvBIyLF4Ix87m6SMxaXkGNAhALWn6ZXdcMSUKX09U5OZ7
 bEByuQ0LUh4bmqVP9WuIiZTTSWrp0ZzdcUuzDTDkfYjNAEF0IfjvbysQQuF/vGSYMc
 rGQAi9DvNHL8g==
Date: Thu, 9 Jun 2022 14:33:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH v2 5/5] ASoC: apple: Add macaudio machine driver
Message-ID: <YqH2uCgaedf0HQPE@sirena.org.uk>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-6-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Yt9911NapMtJ1eUK"
Content-Disposition: inline
In-Reply-To: <20220606191910.16580-6-povik+lin@cutebit.org>
X-Cookie: Space is limited.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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


--Yt9911NapMtJ1eUK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 09:19:10PM +0200, Martin Povi=C5=A1er wrote:

> +		/*
> +		 * Primary FE
> +		 *
> +		 * The mclk/fs ratio at 64 for the primary frontend is important
> +		 * to ensure that the headphones codec's idea of left and right
> +		 * in a stereo stream over I2S fits in nicely with everyone else's.
> +		 * (This is until the headphones codec's driver supports
> +		 * set_tdm_slot.)
> +		 *
> +		 * The low mclk/fs ratio precludes transmitting more than two
> +		 * channels over I2S, but that's okay since there is the secondary
> +		 * FE for speaker arrays anyway.
> +		 */
> +		.mclk_fs =3D 64,
> +	},

This seems weird - it looks like it's confusing MCLK and the bit clock
for the audio bus.  These are two different clocks.  Note that it's very
common for devices to require a higher MCLK/fs ratio to deliver the best
audio performance, 256fs is standard.

> +	{
> +		/*
> +		 * Secondary FE
> +		 *
> +		 * Here we want frames plenty long to be able to drive all
> +		 * those fancy speaker arrays.
> +		 */
> +		.mclk_fs =3D 256,
> +	}

Same thing here - this is at least confusing MCLK and the bit clock.

> +static bool macaudio_match_kctl_name(const char *pattern, const char *na=
me)
> +{
> +	if (pattern[0] =3D=3D '*') {
> +		int namelen, patternlen;
> +
> +		pattern++;
> +		if (pattern[0] =3D=3D ' ')
> +			pattern++;
> +
> +		namelen =3D strlen(name);
> +		patternlen =3D strlen(pattern);
> +
> +		if (namelen > patternlen)
> +			name +=3D (namelen - patternlen);
> +	}
> +
> +	return !strcmp(name, pattern);
> +}
> +
> +static int macaudio_limit_volume(struct snd_soc_card *card,
> +				 const char *pattern, int max)
> +{
> +	struct snd_kcontrol *kctl;
> +	struct soc_mixer_control *mc;
> +	int found =3D 0;
> +
> +	list_for_each_entry(kctl, &card->snd_card->controls, list) {
> +		if (!macaudio_match_kctl_name(pattern, kctl->id.name))
> +			continue;
> +
> +		found++;
> +		dev_dbg(card->dev, "limiting volume on '%s'\n", kctl->id.name);
> +
> +		/*
> +		 * TODO: This doesn't decrease the volume if it's already
> +		 * above the limit!
> +		 */
> +		mc =3D (struct soc_mixer_control *)kctl->private_value;
> +		if (max <=3D mc->max)
> +			mc->platform_max =3D max;
> +
> +	}
> +
> +	return found;
> +}

This shouldn't be open coded in a driver, please factor it out into the
core so we've got an API for "set limit X on control Y" then call that.

--Yt9911NapMtJ1eUK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKh9rcACgkQJNaLcl1U
h9Be8Qf/cbx1SuNmXunfKG1D6mfqR8Q1iocw25ztL4MzTR16bJ8oAGIVuIFGvp6F
65sLYF0riHrCUz1DZvyFCKmcDB+GeSWR9BICYOSnaQg6DnBXQdaBl3uY7v9DRrA6
ypLzKzTdy5LhR58xRaThyGAiep77ZxpxGmOmPyMZS+oq+NQ4idOE/5z5ENxRSg3n
qjMDlWlotFv3MjVNNBBFmZsH1oWa2CuxnXjpM/JrOAhEk7rt7Ylx4I3Bhqpv+lgo
++g3qBUAP1cMdsyYOJza5Jkh4WynmGe3dQ7zj68UbdWoGtvHV8x6SucSnSeVrWXM
IzZswmQla/NHnxdszylvTnONJmU8kg==
=K4AF
-----END PGP SIGNATURE-----

--Yt9911NapMtJ1eUK--
