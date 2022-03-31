Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AF14ED918
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 14:01:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5A4918D8;
	Thu, 31 Mar 2022 14:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5A4918D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648728070;
	bh=adnfpVD7oqXHj4mfPH8O1DTjb8aRLseC4Dvlx5i6vF0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ri+Tle3qdpB8pPWA31OzSMpGxDcZE56Kd50vkSGSRwvKtimJi1xxv1m+zEHV8sZgW
	 pcbEqgVMtj2KC4X6iK4KjgOBe+6Zg2bzhUh8KocEO1PpA57ZU9cI8UFjMgK+TzOCxL
	 it8a2DDxupgYYF9Rlq6xoPNeZUOwnbTi7dVf0lXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58916F80238;
	Thu, 31 Mar 2022 14:00:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5170CF80227; Thu, 31 Mar 2022 14:00:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD5E2F800B8
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 13:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD5E2F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="swJP9pqi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A7C1616A6;
 Thu, 31 Mar 2022 11:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C23C340EE;
 Thu, 31 Mar 2022 11:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648727994;
 bh=adnfpVD7oqXHj4mfPH8O1DTjb8aRLseC4Dvlx5i6vF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=swJP9pqiZw1PBslMi6kbCZdmGGEiPUICuHiBfiDTo4t2rDC46yANqiK8ahb1iwCkX
 DUKLDUtfxGiKLaeh1DnLq0GkGDygdI+QfwlZG51KvYHQzsyJ6ZQr1rB+RRYqmz62aH
 xxAoeYM0TzoLffX/gwbxmZUy80qqN92o7WT69od3BeuS7D6GHl9mDzFz4hto9EWKsN
 rk3i8v7+tcoCKMWomAkTTUtSqgCzrxXiXFtQwE32YwMtNtwcWuJAeDSogo2RTVCSKX
 1/DffffixgiTFrqYd0HJ3aGu4c6IHkp47snP0VeE1Iahf9juWMpgZK5qkX/ZMSNpZN
 cBvqxDx9+y6qQ==
Date: Thu, 31 Mar 2022 12:59:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH 5/5] ASoC: Add macaudio machine driver
Message-ID: <YkWXs/f7edZwg1+W@sirena.org.uk>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <20220331000449.41062-6-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+MLBZhiivx60M6iZ"
Content-Disposition: inline
In-Reply-To: <20220331000449.41062-6-povik+lin@cutebit.org>
X-Cookie: Reunite Gondwondaland!
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
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


--+MLBZhiivx60M6iZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 02:04:49AM +0200, Martin Povi=C5=A1er wrote:

> --- /dev/null
> +++ b/sound/soc/apple/macaudio.c
> @@ -0,0 +1,597 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ASoC machine driver for Apple Silicon Macs
> + *

Please make the entire comment a C++ one so things look more
intentional.

> +		/* CPU side is bit and frame clock master, I2S with both clocks invert=
ed */

Please refer to clock providers here.

> +		ret =3D of_property_read_string(np, "link-name", &link->name);
> +		if (ret) {
> +			dev_err(card->dev, "Missing link name\n");
> +			goto err_put_np;
> +		}

This doesn't look like it's mandatory in the binding.

> +static int macaudio_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card =3D rtd->card;
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(card);
> +	struct snd_soc_component *component;
> +	int ret, i;
> +
> +	if (rtd->num_codecs > 1) {
> +		ret =3D macaudio_assign_tdm(rtd);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	for_each_rtd_components(rtd, i, component)
> +		snd_soc_component_set_jack(component, &ma->jack, NULL);

What is the jack configuration this is attempting to describe?  It looks
like you have some dedicated speaker driver devices which are going to
get attached to jacks here for example.

> +} macaudio_kctlfixes[] =3D {
> +	{"* ASI1 Sel", "Left"},
> +	{"* ISENSE Switch", "Off"},
> +	{"* VSENSE Switch", "Off"},
> +	{ }
> +};
> +
> +static bool macaudio_kctlfix_matches(const char *pattern, const char *na=
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

This looks worryingly like use case configuration.

> +/*
> + * Maybe this could be a general ASoC function?
> + */
> +static void snd_soc_kcontrol_set_strval(struct snd_soc_card *card,
> +				struct snd_kcontrol *kcontrol, const char *strvalue)

No, we should not be setting user visible control values from the
kernel.  This shouldn't be a machine driver function either.  What are
you trying to accomplish here?

--+MLBZhiivx60M6iZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJFl7MACgkQJNaLcl1U
h9AvpQf+NQTe35sa2gGAL6J5r3unBmmRuUI+0Lmize/e9oyklq/3LgUI3zy2In6m
gWr5laQlG/Eq41KJZecdtZ5BrY+BENGZ4PzCtR06uc8hM7KJV17O6hdRXrK3VSWZ
9Tl8uSSh2xNqw6bwflA6XyfULttxC6NLsKP1RxCOaHJGG4cU1G5GkvT9sTpcQH9/
bi7Y9TzxUi6Q7zgK6vVHXygqusZ4UTHdt5fyxX4ou1tV2V1fYAO64eMJ4pA+8jUA
0ZafQA1BVTbkHK7JZjbc2ILGcu5NBR1eJK/hbv9X0OknpKrRsafaQQTRywE1hWb5
NM2xv163DU7RQTC8vqYC+rKBiQ/ypQ==
=dyOa
-----END PGP SIGNATURE-----

--+MLBZhiivx60M6iZ--
