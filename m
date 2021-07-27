Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7B53D7A25
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 17:48:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF7FD1F12;
	Tue, 27 Jul 2021 17:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF7FD1F12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627400898;
	bh=HUIjHerzvYhlBigcQk821SL3p23LtIH8quEZTjLtn/Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gLaH3MxNJh3ufV6ZzudSFvKmPq6JAdZCju9WT1dMaxg17EkOMZdhbC7b5u5QAkcMc
	 6kMGHlD6FtA00FXKHXzG8elC6WcZQRf7Te9/19Pc1Hz9lh/Pznb+4yysMDSTnY6WdV
	 KZwWxkz6CqbXLU8Vf3C5OD1hFjFS52RwAjBxggp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67DE5F80159;
	Tue, 27 Jul 2021 17:46:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94C88F8026C; Tue, 27 Jul 2021 17:46:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCE96F80212
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 17:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCE96F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F8uwt+we"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E33561B5F;
 Tue, 27 Jul 2021 15:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627400795;
 bh=HUIjHerzvYhlBigcQk821SL3p23LtIH8quEZTjLtn/Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F8uwt+weqYRfR3ssByqpuQf8Pwx3xu22ebe1m//Ryva0e7nKVmZ9PIbIj2DbrLaq5
 RhQi1kKljpZyag5i9K4z2Y8wcSEfCNktBDvtH3m8hnmb6xoL3RCP8oIoJrbRHxAZjn
 nDqKthPXDO9m6q3GRAc0oxlLA2kvhCddAmz1wSMn+mWXcy060MKSDDixzbhud97p7q
 rTnfDnCAaYLHbj9nSi0QN44bO/tY13lgd7NjCUNGk1dVAm3JRpEz30oTfIwJvNowWa
 0xxyEeAE8xpzsyGu0FEo/RMsq49renOtfiC35J/8gNenEyrF0ajf1sdcC5H/SYxTO9
 al19xRdzSlCHA==
Date: Tue, 27 Jul 2021 16:46:07 +0100
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v4 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Message-ID: <20210727154607.GV4670@sirena.org.uk>
References: <20210726223438.1464333-1-drhodes@opensource.cirrus.com>
 <20210726223438.1464333-2-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ou5B7nmexOOGXbzo"
Content-Disposition: inline
In-Reply-To: <20210726223438.1464333-2-drhodes@opensource.cirrus.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, brian.austin@cirrus.com, ckeepax@opensource.cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com
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


--Ou5B7nmexOOGXbzo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 26, 2021 at 05:34:37PM -0500, David Rhodes wrote:

This looks mostly good, a few pretty small things below:

> +++ b/sound/soc/codecs/cs35l41-i2c.c
> @@ -0,0 +1,116 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

C files need to have a C++ style SPDX header, please make the entire
comment a C++ one so things look more consistent.

> +static const struct snd_kcontrol_new cs35l41_aud_controls[] = {
> +       SOC_SINGLE_SX_TLV("Digital PCM Volume", CS35L41_AMP_DIG_VOL_CTRL,
> +                     3, 0x4CF, 0x391, dig_vol_tlv),
> +       SOC_SINGLE_TLV("AMP PCM Gain", CS35L41_AMP_GAIN_CTRL, 5, 0x14, 0,
> +                       amp_gain_tlv),

Volume controls need to end in Volume like the one immediately above,
see control-names.rst.

> +	/* returning NULL can be an option if in stereo mode */
> +	cs35l41->reset_gpio = devm_gpiod_get_optional(cs35l41->dev, "reset",
> +							GPIOD_OUT_LOW);

Was this included in the DT binding?

> +	ret = devm_snd_soc_register_component(cs35l41->dev,
> +					&soc_component_dev_cs35l41,
> +					cs35l41_dai, ARRAY_SIZE(cs35l41_dai));
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "%s: Register codec failed\n", __func__);
> +		goto err;
> +	}
> +
> +	ret = cs35l41_set_pdata(cs35l41);
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "%s: Set pdata failed\n", __func__);
> +		goto err;
> +	}

Are you sure it's safe to register the device before applying the
platform data configuration - as soon as the device is registered the
sound card might become visible?

--Ou5B7nmexOOGXbzo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEAKj4ACgkQJNaLcl1U
h9CXOgf+KTHTvaJPGQbzIAfSKCWvXguPgBqmyHXl3g//JwE88a096BPkctg5xAMF
lEoWsR6dogwTETPlZfISplGFxhAaob+lcCxTK+zcCqzPVrbqiwsvtRP5gAD4iqf6
Ck5FHWi6x6GC9iyTuH30bRhvsfiktFs/7N2bNcQl0c0aMGfYw+E+KxbD1CpVU45o
lrrWm6VFkUKcD1c8Ptwb1dHFihMnIkfMxIdeJ7r4l+1maiRcCKsoWmxrHp6RWYGu
d3w9M206IEcArfmwsbSqLp404hsBZEe6kEqRpa6IiHSIewahVqvQmZQsEvcR80BG
rfSSR6ABjRe3le3EsR7sMkrhTFm/iQ==
=m1Cp
-----END PGP SIGNATURE-----

--Ou5B7nmexOOGXbzo--
