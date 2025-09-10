Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B08BBB518DF
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Sep 2025 16:07:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F540601FF;
	Wed, 10 Sep 2025 16:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F540601FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757513264;
	bh=bwDzemNw4BbjpPMICDGxskQKr6TFxzB4f34cZ/km2ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=luGxIlW4JnUzC6xyPsyckjads+bJMB2rkeYKJIVlqaUe213nUi/PzfKRcVOjUosQz
	 U/g9gisR2dHjLopPI0doGyZ1/TtR1ITS8GM1CcwW/KyGr2rrxbnoG5022+1KjW4LTU
	 fikiMF+aSqnxd/enhmvumrrmBGT6xpUiOopP/6oA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B07AF805C6; Wed, 10 Sep 2025 16:07:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45BADF805C3;
	Wed, 10 Sep 2025 16:07:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EEBBF8042F; Wed, 10 Sep 2025 16:06:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B993CF801F7
	for <alsa-devel@alsa-project.org>; Wed, 10 Sep 2025 16:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B993CF801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O+wuWQ7w
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50376417CC;
	Wed, 10 Sep 2025 14:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE4FC4CEF8;
	Wed, 10 Sep 2025 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757513205;
	bh=bwDzemNw4BbjpPMICDGxskQKr6TFxzB4f34cZ/km2ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+wuWQ7wqhOAR1XspYke6QpmuUfK/GvlFw4XOf+w/R6IQStpd52Yt8t3M+m47CQAt
	 Q5ZvPvrAwinkLgT52jkYqLaA4EPTQQ8+84ibegRzhrtFXdQrwlIBVlsudxImfY3jlW
	 6tTJLKqg8Pe5gWbkiJVY6+k/EIRbfybgAEncRCkuNohP/tyiVnf0o/CgOpPPTQ8oDi
	 ig6Z3gR7Tl0yEr+q5VNwz5rSbMO2woxYLt+n+Fzl9atTVhwkumdB3s6dpEA5ep/Uxi
	 fbzyqtE6hLEhM1rZZ/EBnoKxZCRHuUx412EWp0v7t04g2BgRxIamZYbR17HzPljnbM
	 8j9pRTBW3Ln1A==
Date: Wed, 10 Sep 2025 15:06:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	navada@ti.com, shenghao-ding@ti.com, v-hampiholi@ti.com,
	baojun.xu@ti.com
Subject: Re: [PATCH v3 1/4] ASoc: tas2783A: Add soundwire based codec driver
Message-ID: <125fc7e8-facc-4dea-80b0-38551036a075@sirena.org.uk>
References: <20250910121917.458-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="980EMwrbTAPsrSiM"
Content-Disposition: inline
In-Reply-To: <20250910121917.458-1-niranjan.hy@ti.com>
X-Cookie: I think my career is ruined!
Message-ID-Hash: MWXROATEBFXABYWYEBXBGQVNT4K76MWY
X-Message-ID-Hash: MWXROATEBFXABYWYEBXBGQVNT4K76MWY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MWXROATEBFXABYWYEBXBGQVNT4K76MWY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--980EMwrbTAPsrSiM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 10, 2025 at 05:49:14PM +0530, Niranjan H Y wrote:

> new file mode 100644
> index 000000000..ddadfb7c5
> --- /dev/null
> +++ b/sound/soc/codecs/tas2783-sdw.c
> @@ -0,0 +1,1417 @@

> +#if !IS_ENABLED(CONFIG_SND_SOC_TAS2783_UTIL)
> +static void tas25xx_register_misc(struct sdw_slave *peripheral) {}
> +static void tas25xx_deregister_misc(void) {}
> +#endif

This config symbol doesn't exist already and isn't defined by the patch.
If it did exist I'd expect these stubs to be in a header file rather
than a C file.  What's going on here?

> +static s32 tas2783_digital_getvol(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct tas2783_prv *tas_dev =
> +		snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	s32 val, ret;
> +
> +	ret = regmap_read(tas_dev->regmap, mc->reg, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	ucontrol->value.integer.value[0] =
> +		tas_clamp(val, mc->max, mc->invert);

It feels like rather than define a custom read operation it'd be better
to make this clamping part of the generic ASoC ops if it's needed - the
code is totally generic and you could see something similar for any
device that has a limited set of values that are valid.  Presumably your
device happens to trigger this in some common situation but anything
could be affected and we should handle it generically.

> +static s32 tas2783_digital_putvol(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{

> +	val = tas_clamp(ucontrol->value.integer.value[0],
> +			mc->max, mc->invert);

This appears to be the only non-standard part of this function but the
generic implementation should already deal with invalid inputs.

> +	ret = regmap_write(tas_dev->regmap, mc->reg, val);
> +	if (ret)
> +		dev_dbg(tas_dev->dev, "put vol %d into %x %x\n",
> +			val, mc->reg, ret);
> +
> +	return ret;

This won't return 1 on change, mixer-test will tell you that (and spot a
bunch of other errors).

> +static const struct snd_kcontrol_new tas2783_snd_controls[] = {
> +	SOC_SINGLE_RANGE_EXT_TLV("Amp Gain Volume", TAS2783_AMP_LEVEL,
> +				 1, 0, 20, 0, tas2783_amp_getvol,
> +				 tas2783_amp_putvol, tas2781_amp_tlv),

Just Amp Volume.

--980EMwrbTAPsrSiM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjBhe4ACgkQJNaLcl1U
h9Agbwf+ILKfkPHGvI9VWLbEWmwM/iracD2tFkOxZ+TjknoLm1z9Q35Jqtprtb2u
EoR6szdSWQWnhbj49sXkVhdaPtob3Gc2YZ7ZF/qN34ko7FaPpvdYLpFvGNVJtYZr
kdX0Fu95aKqPDm6/Wl820WUY2M6BuY3FI+avxAwKMCi64BsaseyMjl1DN3enM4gw
DRkPz+scwn+ooEWCEWyqy/ij/zHHT2t2gtFTw+WgqWM8ECpX427g1PtHRw25pw44
jp3XydaDPM7S/0p4+ggWBuLw4A1cbv0QBManTkFQXAYIWP6qPkOXyYZZKZqw0fyu
qQKyCVbjKlwrsp+awRkBFEQLOwWZjw==
=2Wh4
-----END PGP SIGNATURE-----

--980EMwrbTAPsrSiM--
