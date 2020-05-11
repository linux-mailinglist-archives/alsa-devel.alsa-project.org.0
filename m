Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C68261CD727
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 13:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67E9B1607;
	Mon, 11 May 2020 13:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67E9B1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589195141;
	bh=DgjQ4t5B+iWHHzTaX1d+gS0bC2w3AC2yiTIZkqa7eeM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXo3gVDhsvZZ0+LD2ijQ/N1zoBMRjm3e0s2QOkN7Np5vfCMX/OSkHJxGYlZ52qraj
	 uilgT7dEEy9hJ9wWJ8mYWkNgtliRBOe1+P4GV9ql/bu0IfHkfeqC91J1Ghyqh+b6pz
	 mp9x3CsP0QrX9yf5PCvrNuG9Qzg59vU02FFShD9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79776F8014C;
	Mon, 11 May 2020 13:04:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFA8AF80157; Mon, 11 May 2020 13:03:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A64E8F80107
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 13:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A64E8F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ilMbR2Rb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D888206F9;
 Mon, 11 May 2020 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589195028;
 bh=DgjQ4t5B+iWHHzTaX1d+gS0bC2w3AC2yiTIZkqa7eeM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ilMbR2RbeQu1sVlK/6nq9NvkernGroLe5nJnzglwmy/sJ4zbJghwgi4k9M7dGdIVy
 C+GW49ni9H21Y77QNl1v8EPAMCtc78nuk0c57nJpt5k7kZWydXbRhbfAy1OzyyH+lt
 T9ZReD/SOo1Nn2M+OnyIZCyZPazmZRm6kuouGbVw=
Date: Mon, 11 May 2020 12:03:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Steve Lee <steves.lee.maxim@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: max98390: Added Amplifier Driver
Message-ID: <20200511110346.GE8216@sirena.org.uk>
References: <20200509031919.9006-1-steves.lee@maximintegrated.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tNQTSEo8WG/FKZ8E"
Content-Disposition: inline
In-Reply-To: <20200509031919.9006-1-steves.lee@maximintegrated.com>
X-Cookie: TANSTAAFL
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, ryan.lee.maxim@gmail.com,
 ckeepax@opensource.cirrus.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, krzk@kernel.org,
 lgirdwood@gmail.com, nuno.sa@analog.com, geert@linux-m68k.org, dmurphy@ti.com,
 shumingf@realtek.com, srinivas.kandagatla@linaro.org,
 rf@opensource.wolfsonmicro.com
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


--tNQTSEo8WG/FKZ8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 09, 2020 at 12:19:19PM +0900, Steve Lee wrote:
> Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>

This looks mostly good, a few smallish things below though:

> +++ b/sound/soc/codecs/max98390.c
> @@ -0,0 +1,1039 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020, Maxim Integrated.
> + */

Please make the entire comment a C++ one so things look more
intentional.

> +	dev_info(component->dev, "Tdm mode : %d\n",
> +			max98390->tdm_mode);

This is a bit noisy, please make it at most a dev_dbg().

> +static const char * const max98390_analog_gain_text[] = {
> +	"Mute", "3dB", "6dB", "9dB", "12dB", "15dB", "18dB"};

Use TLV data with regulator Volume controls for volumes, don't make them
enums.

> +static const char * const max98390_boost_voltage_text[] = {
> +	"6.5V", "6.625V", "6.75V", "6.875V", "7V", "7.125V", "7.25V", "7.375V",
> +	"7.5V", "7.625V", "7.75V", "7.875V", "8V", "8.125V", "8.25V", "8.375V",
> +	"8.5V", "8.625V", "8.75V", "8.875V", "9V", "9.125V", "9.25V", "9.375V",
> +	"9.5V", "9.625V", "9.75V", "9.875V", "10V"
> +};

Is this really something that should be configured at runtime rather
than through DT?

> +static const char * const max98390_current_limit_text[] = {
> +	"0.00A", "0.50A", "1.00A", "1.05A", "1.10A", "1.15A", "1.20A", "1.25A",
> +	"1.30A", "1.35A", "1.40A", "1.45A", "1.50A", "1.55A", "1.60A", "1.65A",

This looks like it should be in DT too.

> +static int max98390_dsm_calib_get(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +
> +	dev_warn(component->dev, "Get dsm_calib_get not supported\n");
> +
> +	return 0;
> +}

Just don't implement the operation if you can't implement it.

> +	dev_info(component->dev,
> +		"max98390: param fw size %d\n",
> +		fw->size);

This should probably be a dev_dbg() too.

> +	/* Amp Setting */
> +	regmap_write(max98390->regmap, MAX98390_CLK_MON, 0x6f);
> +	regmap_write(max98390->regmap, MAX98390_PCM_RX_EN_A, 0x03);
> +	regmap_write(max98390->regmap, MAX98390_R203D_SPK_GAIN, 0x05);
> +	regmap_write(max98390->regmap, MAX98390_MEAS_EN, 0x03);
> +	regmap_write(max98390->regmap, MAX98390_PWR_GATE_CTL, 0x2d);
> +	regmap_write(max98390->regmap, MAX98390_ENV_TRACK_VOUT_HEADROOM, 0x0e);
> +	regmap_write(max98390->regmap, MAX98390_BOOST_BYPASS1, 0x46);
> +	regmap_write(max98390->regmap, MAX98390_FET_SCALING3, 0x03);

Are some of these things that might vary per system?  If so they
probably shouldn't be hard code but instead in DT.  Things like the
speaker gain jump out.

> +static int max98390_suspend(struct device *dev)
> +{
> +	struct max98390_priv *max98390 = dev_get_drvdata(dev);
> +
> +	dev_info(dev, "%s:Enter\n", __func__);

dev_dbg()

> +static int max98390_resume(struct device *dev)
> +{
> +	struct max98390_priv *max98390 = dev_get_drvdata(dev);
> +
> +	dev_info(dev, "%s:Enter\n", __func__);

dev_dbg()

> +	dev_info(&i2c->dev, "ASoC: MAX98390 i2c probe\n");

Just drop this.

> +	ret = device_property_read_u32(&i2c->dev, "maxim,temperature_calib",
> +				       &max98390->ambient_temp_value);

Normally for DT that'd be maxim,temperature-calib.

--tNQTSEo8WG/FKZ8E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl65MREACgkQJNaLcl1U
h9Agswf/W7wxYge4lX5Nh8L9Ijk9piGmVyMcg0PO7bOy0r7wGdBZN85THGa7q4XD
XvddrMrImLsI1/bur3AJ4R0Qxi6SM7VsWGtYvIM153KPDPJAeu4cAesjD2PhsHzL
tFWU11c9Ziq0chNU8t7Mx9i0gYMcxvEgDjMGQlY7+FMJqYlh2ivRq6gpYYtPMWVA
oGscpFnuOz8aJ8QBC/OrLyljDofbaoBzVcp0Jng5wo89azm0nKN9yTxCaBUr/oop
ET+J+wQ0eWbFVCBCukvT9zi3ODi0EoE+kQeO6Iuqo2QQCMye57CWMRb50F/ZSl7a
6YpOnVX+X/Fooyrx6G8hauaEjUS8Pg==
=sOxO
-----END PGP SIGNATURE-----

--tNQTSEo8WG/FKZ8E--
