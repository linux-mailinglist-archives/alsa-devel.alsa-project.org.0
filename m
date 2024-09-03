Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB5A96A642
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 20:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3CEA84D;
	Tue,  3 Sep 2024 20:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3CEA84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725387206;
	bh=WtdrVLhuX7QUBk5Q47adV0XQCHtkPufPeUe4K0O64aM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ocqdlelYHVtdvHPMMFGfV1JUrq8Ofz5ju2G8us/tlORuU6PSW/57ntRb53KsQFuBS
	 2BpHd7LKsieqhsPoFu5G5TxpzPlojJyG5ZsF1myFM2VhONzfpqFCmAu9Redg2S+zZv
	 Ieug4sirRVnbHK/WUR/vNJYV2WelwxiBaRJoHMOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73F90F805B2; Tue,  3 Sep 2024 20:12:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9150F80199;
	Tue,  3 Sep 2024 20:12:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FAD4F80199; Tue,  3 Sep 2024 20:12:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D5FBF80116
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 20:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D5FBF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cYYRKIC0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABE615C59E4;
	Tue,  3 Sep 2024 18:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCFEC4CEC4;
	Tue,  3 Sep 2024 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725387165;
	bh=WtdrVLhuX7QUBk5Q47adV0XQCHtkPufPeUe4K0O64aM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYYRKIC0PbeYkpAoBfKETGfYGQ0LkNUp+ev/UcyIb9LpQmDreWObr9PnkNt+sy9PT
	 jzj+cqp4CujQcDOtRQbvAwui8NF6oUgteIozgzxQHaBTAsbvuEGeoUshhrxRnuND4B
	 ILgNTkyZmyuIrf6zdsLpZSxiF9QIHpQ6ktOuD0i1OCJGzXW13d8mv1gIvY1xEeOlEX
	 taDPcHxKO/cqwE6A0avt38rWJjeny0ubHRxtKFupn+SYRMFkU38QoCWi5CP85Xhvvk
	 DC8gLjsJYTroOTvJF3nZ8tL9QV1xD/gStbSTKKkiuFz11gX0FCKA0Rgl5G3r6MfCbH
	 nW9NVgsYqYYow==
Date: Tue, 3 Sep 2024 19:12:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	application@irondevice.com
Subject: Re: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Message-ID: <51e05109-049f-4efa-b923-60943fe82777@sirena.org.uk>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-2-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LRv0xbwjrHfLtCHo"
Content-Disposition: inline
In-Reply-To: <20240903054435.2659-2-kiseok.jo@irondevice.com>
X-Cookie: Words must be weighed, not counted.
Message-ID-Hash: 2FPAY4T4OCQTDCRXYUMUA7FK4I7VY6GF
X-Message-ID-Hash: 2FPAY4T4OCQTDCRXYUMUA7FK4I7VY6GF
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FPAY4T4OCQTDCRXYUMUA7FK4I7VY6GF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--LRv0xbwjrHfLtCHo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 02:44:33PM +0900, Kiseok Jo wrote:

This looks basically fine, there's some mostly minor or stylistic things
below but nothing too major.

> +static int sma1307_regmap_write(struct sma1307_priv *sma1307,
> +				unsigned int reg, unsigned int val)
> +{
> +	int ret = 0;
> +	int cnt = sma1307->retry_cnt;
> +
> +	while (cnt--) {
> +		ret = regmap_write(sma1307->regmap, reg, val);
> +		if (ret == 0)
> +			break;
> +	}

If the hardware is actually stable we probably shouldn't bother with
these wrappers.  If they really are needed then we might want to
consider having regmap support doing retries.

> +	if (sma1307->force_mute_status == val)
> +		change = false;
> +	else {
> +		change = true;
> +		sma1307->force_mute_status = val;
> +	}

If one side of the if has {} both sides should.

> +	} else {
> +		dev_err(sma1307->dev, "%s: Invalid Control ID - %s\n",
> +			__func__, kcontrol->id.name);
> +		return -EINVAL;
> +	}

We shouldn't log errors that userspace can easily trigger like this, it
lets people DoS the logs - just return the error code (a bunch of the
other controls have this).

> +static int sma1307_reset_put(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +	    snd_soc_kcontrol_component(kcontrol);
> +	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
> +	bool val = (bool)ucontrol->value.integer.value[0];
> +
> +	if (sma1307->reset == val)
> +		return false;
> +
> +	sma1307->reset = val;
> +	if (ucontrol->value.integer.value[0] != 0
> +	    && ucontrol->value.integer.value[0] != 1) {
> +		dev_err(sma1307->dev, "%s: Invalid value\n", __func__);
> +		return false;
> +	}

You probably don't need to store a value here, you can just always read
0 for the control.  It's how other similar one shot controls work IIRC.

> +	sma1307_regmap_update_bits(sma1307, SMA1307_00_SYSTEM_CTRL,
> +				   SMA1307_RESET_MASK, SMA1307_RESET_ON);
> +	sma1307_reset(component);

This should really generate a change notification for all the controls
with non-default values (or all the controls would be easier and
probably fine, it's not like this is going to be a particularly pretty
process for userspace whatever happens).  snd_ctl_notify() does this.

It'd also be good to have a comment about why we've got this.

> +static int sma1307_dapm_amp_enable_put(struct snd_kcontrol *kcontrol,
> +				       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm =
> +	    snd_soc_dapm_kcontrol_dapm(kcontrol);
> +	struct sma1307_priv *sma1307 =
> +	    snd_soc_component_get_drvdata(dapm->component);
> +	int val = (int)ucontrol->value.integer.value[0];
> +	bool change;
> +
> +	if ((val < 0) || (val > 1)) {
> +		dev_err(sma1307->dev, "%s: Out of range\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (sma1307->dapm_amp_en != val) {
> +		change = true;
> +		sma1307->dapm_amp_en = val;

I didn't manage to find what reads this value - do we need this control
at all, I'm not clear what it does?  If it's for stopping the amp from
coming on the normal approach is for the board to register a
_PIN_SWITCH() DAPM control attached to whatever the end output is for
the path, that will cause DAPM to not power anything in the output path
up.

A similar thing is true for at least the binary_mode control, I can't
see where the written value is read.

> +static void sma1307_check_fault_worker(struct work_struct *work)
> +{

> +	ret = sma1307_regmap_read(sma1307, SMA1307_FA_STATUS1, &status1_val);
> +	if (ret != 0) {
> +		dev_err(sma1307->dev,
> +			"%s: failed to read SMA1307_FA_STATUS1 : %d\n",
> +			__func__, ret);
> +		return;
> +	}
> +
> +	ret = sma1307_regmap_read(sma1307, SMA1307_FB_STATUS2, &status2_val);
> +	if (ret != 0) {
> +		dev_err(sma1307->dev,
> +			"%s: failed to read SMA1307_FB_STATUS2 : %d\n",
> +			__func__, ret);
> +		return;
> +	}

If we manage to read one of the registers should we perhaps soldier on
and try to report any errors it shows?  Probably a bit academic.

> +	if (~status1_val & SMA1307_OT1_OK_STATUS) {
> +		dev_crit(sma1307->dev,
> +			 "%s: OT1(Over Temperature Level 1)\n", __func__);
> +		if (sma1307->sw_ot1_prot) {
> +			/* Volume control (Current Volume -3dB) */
> +			if ((sma1307->cur_vol + 6) <= 0xFA)
> +				sma1307_regmap_write(sma1307,
> +						     SMA1307_0A_SPK_VOL,
> +						     sma1307->cur_vol + 6);
> +		}
> +		sma1307->tsdw_cnt++;

This is changing a user visible control so it should really generate an
event, although given that it should never happen it's not the end of
the world.  Given that a lot of other speaker drivers have a similar
setup with warning and critical temperature alerts I actually wonder if
we should consider factoring this out as a helper other things can use,
that's definitely a separate thing though and you don't need to do it
right now.

> +static DEVICE_ATTR_RW(check_fault_period);

Any reason the fault stuff isn't an ALSA control?

> +static const struct regmap_config sma_i2c_regmap = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = SMA1307_FF_DEVICE_INDEX,
> +	.readable_reg = sma1307_readable_register,
> +	.writeable_reg = sma1307_writeable_register,
> +	.volatile_reg = sma1307_volatile_register,
> +
> +	.cache_type = REGCACHE_NONE,

_NONE is the default, although given that you've described the volatile
registers I don't see why you wouldn't just enable _MAPLE.  There's
regcache_drop_region() which can be used to throw away cached values
during reset if you want to do that.  Most drivers use a cache to help
make suspend/resume easier to implement - if the device looses power you
can just write the cache contents back to it to restore most userspace
visible things.

Not doing a cache (or suspend/resume) is also OK though, it can always
be implemented when needed.

> +++ b/sound/soc/codecs/sma1307.h
> @@ -0,0 +1,454 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + * sma1307.h -- sma1307 ALSA SoC Audio driver
> + *
> + * r005,
> + *
> + * Copyright 2023 Iron Device Corporation

2024 now!

--LRv0xbwjrHfLtCHo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbXUZcACgkQJNaLcl1U
h9CzIQf+Ji9zGTJET0wedIKT9B8Otdn4R1QZjLksm9TywNQGsBi2nvw4lJMRgdUu
wtuG013UE2v3QR0R0RWXxKnFkkmMJgh++av9IfG9EG9ffi4Fz6LwBCgYcwhwgQeV
Xh/VYpeivVjMWz6Kzy0xo/7K/uj+JYmc/WW0ARtt8MwkkzKAUrc1PdYU0e70gYUG
eJa6Yf89C8VrfqGN/uQxKXgrJGd9DfGPqzDeoYIucgN0O0Gxs0z3RoKcrn1qDWum
uIRvam4KIDqcncCyRfKKIFmpDYE1EH64jvMej+vojhDLk3GziB03lxvAuxHa/KlK
Ql/ZdjGsnzSywYQdD2KVqB57+T0ScQ==
=yskV
-----END PGP SIGNATURE-----

--LRv0xbwjrHfLtCHo--
