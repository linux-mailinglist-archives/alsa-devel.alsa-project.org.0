Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5564C669C83
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 16:35:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7A5FAA86;
	Fri, 13 Jan 2023 16:34:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7A5FAA86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673624136;
	bh=3U/tR90xZAmgQ8jgUbo87DXwMZXVKpCuk8glWNtjYVg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YEmh9DAf6n02aG1ReV2rewYnlniF3solLs0Lc9IsA3vdT2Qu+hkS/Z9Um3eosxLNd
	 dsR3Uv4sDS+/Wmi3t3Q+SuaN3ty/6x/JbUbZXNoCX0O4zKYaib0X1xSY0FyGJM8d15
	 CvcllQHpmxKYNgsFxME3NrMr+nEIm1GeNFCAW54U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A04AF8016D;
	Fri, 13 Jan 2023 16:34:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F361F80424; Fri, 13 Jan 2023 16:34:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC208F8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 16:34:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC208F8016D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EOadKdmb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 836D4620DB;
 Fri, 13 Jan 2023 15:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113BBC433EF;
 Fri, 13 Jan 2023 15:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673624062;
 bh=3U/tR90xZAmgQ8jgUbo87DXwMZXVKpCuk8glWNtjYVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EOadKdmbN76sfVOd21OmL20NPliLZX1gUGS5m4IFkk3LZ1vq2wLdfHvIw8Ks2KAhB
 Ovq5BPrs+M2/SKmvkF3be3UvKL3fep/UaatBP++kfFZIRaR7kGMKG4JRiQZmsQOPq7
 P4hRsTFPr/7xOz3cf+u2tVOBz+G3eSE47VJLLtX4SYYu4FoPRsOnlQgV/96p5mYQyL
 2EoA/3v3XAyvVhTpcyrDbZQlePjnW3Rxz5UV0RMvRj/G9wK1l6t0rDp1BKgSFuthvk
 l0xPyx9rNUMrfnGlBOoGgo1URyHn+b3nbM16e+qQ26SArIiw0yCsc47OExTsXGggxR
 2aQ4Sgjju/oYg==
Date: Fri, 13 Jan 2023 15:34:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH v2 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303
 Amp
Message-ID: <Y8F5+7vgl+f9rytb@sirena.org.uk>
References: <20230109091402.11790-3-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7mekKCSsQkNFJpO5"
Content-Disposition: inline
In-Reply-To: <20230109091402.11790-3-kiseok.jo@irondevice.com>
X-Cookie: I know how to do SPECIAL EFFECTS!!
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, application@irondevice.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--7mekKCSsQkNFJpO5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2023 at 06:14:01PM +0900, Kiseok Jo wrote:

> The Iron Device SMA1303 is a boosted Class-D audio amplifier.

This looks pretty good now, there's some things that need fixing below
but nothing too huge.

> +		result =3D true;
> +		break;
> +	default:
> +		result =3D false;
> +	}

Please put the break statements in for all cases, even the last one.

> +void sma1303_set_callback_func(struct callback_ops ops)
> +{
> +	if (ops.set_i2c_err)
> +		gCallback.set_i2c_err =3D ops.set_i2c_err;
> +}
> +EXPORT_SYMBOL(sma1303_set_callback_func);

ASoC symbols should be _GPL, and variables shouldn't use hungarian
notation, but in any case this callback looks very questionable - why is
it needed?  Looking at the uses...

> +static int sma1303_regmap_write(struct sma1303_priv *sma1303,
> +				unsigned int reg, unsigned int val)
> +{
> +	int ret =3D 0;
> +	int cnt =3D sma1303->retry_cnt;
> +
> +	while (cnt--) {
> +		ret =3D regmap_write(sma1303->regmap, reg, val);
> +		if (ret < 0) {
> +			dev_err(sma1303->dev,
> +					"Failed to write [0x%02X]\n", reg);
> +			if (gCallback.set_i2c_err)
> +				gCallback.set_i2c_err(sma1303->dev, ret);
> +		} else
> +			break;
> +	}
> +	return ret;

=2E..this isn't something we do in other drivers, not just the callback
but the whole retry mechanism.  Is it really the device itself that's
this unstable, the callback suggests it might be the board?  It feels
like if this is needed it'd fit better in regmap rather than wrapping
things in the driver.

> +static int sma1303_force_mute_get(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct sma1303_priv *sma1303 =3D snd_soc_component_get_drvdata(componen=
t);
> +
> +	ucontrol->value.integer.value[0] =3D (int)sma1303->force_mute_status;
> +	dev_info(sma1303->dev, "%s : Force Mute %s\n", __func__,
> +			sma1303->force_mute_status ? "ON" : "OFF");

If you must add logging use dev_dbg() to avoid spamming the console,
same for most of the other logging at dev_info().

> +static int sma1303_force_mute_put(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct sma1303_priv *sma1303 =3D snd_soc_component_get_drvdata(componen=
t);
> +
> +	sma1303->force_mute_status =3D (bool)ucontrol->value.integer.value[0];
> +	dev_info(sma1303->dev, "%s : Force Mute %s\n", __func__,
> +			sma1303->force_mute_status ? "ON" : "OFF");
> +
> +	return 0;
> +}

This (and the other controls) should return 1 if the value changed so
events are generated, the mixer-test selftest will spot this and other
errors for you.

> +static int sma1303_postscaler_get(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct sma1303_priv *sma1303 =3D snd_soc_component_get_drvdata(componen=
t);
> +	int val, ret;
> +
> +	ret =3D sma1303_regmap_read(sma1303, SMA1303_90_POSTSCALER, &val);
> +	ucontrol->value.integer.value[0] =3D (val & 0x7E) >> 1;
> +
> +	return ret;
> +}

Here we get with a mask of 0x7e...

> +static int sma1303_postscaler_put(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct sma1303_priv *sma1303 =3D snd_soc_component_get_drvdata(componen=
t);
> +	int ret, sel =3D (int)ucontrol->value.integer.value[0];
> +
> +	ret =3D sma1303_regmap_update_bits(sma1303,
> +			SMA1303_90_POSTSCALER, 0x70, (sel << 1));

=2E..but put with a mask of 0x70.  What's going on with lower bits there?

> +	if (!(sma1303->amp_power_status)) {
> +		dev_info(component->dev, "%s : %s\n",
> +			__func__, "Already AMP Shutdown");
> +		return ret;
> +	}
> +
> +	cancel_delayed_work_sync(&sma1303->check_fault_work);
> +
> +	msleep(55);
> +

That sleep looks odd - what are we delaying after? =20

> +static int sma1303_power_event(struct snd_soc_dapm_widget *w,
> +		struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =3D
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct sma1303_priv *sma1303 =3D snd_soc_component_get_drvdata(componen=
t);
> +	int ret =3D 0;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		dev_info(sma1303->dev,
> +			"%s : SND_SOC_DAPM_POST_PMU\n", __func__);
> +		ret =3D sma1303_startup(component);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		dev_info(sma1303->dev,
> +			"%s : SND_SOC_DAPM_PRE_PMD\n", __func__);
> +		ret =3D sma1303_shutdown(component);
> +		break;
> +	}
> +	return ret;
> +}

If this is done using DAPM then it's a bit concerning that you need the
amp_enabled checks in your startup() and shutdown() functions, DAPM
should refcount appropriately.  TBH I'd just inline those functions,
they are small and only called from here.  I'd also rename this to have
something about it being for the speaker/amplifier in the function name,
it looked like it was a whole CODEC thing.

> +	SOC_SINGLE_BOOL_EXT("Force Mute", 0,
> +		sma1303_force_mute_get, sma1303_force_mute_put),

Simple on/off controls should have Switch at the end of the name -
mixer-test will spot that one too.

> +	for (index =3D 0; index < ARRAY_SIZE(sma1303_snd_controls); index++) {
> +		sma1303_controls[index] =3D sma1303_snd_controls[index];
> +		name[index] =3D devm_kzalloc(sma1303->dev,
> +				MAX_CONTROL_NAME, GFP_KERNEL);
> +		size =3D strlen(sma1303_snd_controls[index].name)
> +			+ strlen(sma1303->dev->driver->name);

No need to add the driver name or anything here, the core has support
for allowing boards to add prefixes to all the control names if there's
a need to avoid naming clashes which allows things to be more user
friendly and supports more than one of a given device on a board.  See
name_prefix.

> +static int sma1303_dai_mute(struct snd_soc_dai *dai, int mute, int strea=
m)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct sma1303_priv *sma1303 =3D snd_soc_component_get_drvdata(componen=
t);
> +	int ret =3D 0;
> +
> +	if (stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
> +		return ret;
> +
> +	if (!(sma1303->amp_power_status)) {
> +		dev_info(component->dev, "%s : %s\n",
> +			__func__, "Already AMP Shutdown");
> +		return ret;
> +	}
> +
> +	if (mute) {
> +		dev_info(component->dev, "%s : %s\n", __func__, "MUTE");
> +
> +		ret +=3D sma1303_regmap_update_bits(sma1303,
> +				SMA1303_0E_MUTE_VOL_CTRL,
> +				SMA1303_SPK_MUTE_MASK,
> +				SMA1303_SPK_MUTE);
> +	} else {
> +		if (!sma1303->force_mute_status) {
> +			dev_info(component->dev, "%s : %s\n",
> +					__func__, "UNMUTE");
> +			ret +=3D sma1303_regmap_update_bits(sma1303,
> +					SMA1303_0E_MUTE_VOL_CTRL,
> +					SMA1303_SPK_MUTE_MASK,
> +					SMA1303_SPK_UNMUTE);
> +		} else {
> +			dev_info(sma1303->dev,
> +					"%s : FORCE MUTE!!!\n", __func__);
> +		}
> +	}

If you need to shut the device down to implement mute then it's better
to just not implement it, you shouldn't emulate features in the driver
but instead let the core worry about how to handle that case.  AFAICT
this is why there's the startup/shutdown thing for the speaker amp?

> +	case SND_SOC_DAIFMT_CBS_CFS:

Use the modern names _CBC_CFC=20

> +	case SND_SOC_DAIFMT_CBM_CFM:

and _CBP_CFP instead, we're trying to phase out the old defines.

> +static void sma1303_check_fault_worker(struct work_struct *work)
> +{
> +	struct sma1303_priv *sma1303 =3D
> +		container_of(work, struct sma1303_priv, check_fault_work.work);
> +	int ret =3D 0;
> +	unsigned int over_temp, ocp_val, uvlo_val;
> +
> +	mutex_lock(&sma1303->lock);
> +

It looks like this mutex is only taken in this function, is it needed?

> +static int sma1303_probe(struct snd_soc_component *component)
> +{
> +	struct sma1303_priv *sma1303 =3D snd_soc_component_get_drvdata(componen=
t);
> +	struct snd_soc_dapm_context *dapm =3D
> +		snd_soc_component_get_dapm(component);
> +	int ret =3D 0;
> +
> +	ret +=3D sma1303_add_component_controls(component);
> +
> +	snd_soc_dapm_sync(dapm);
> +
> +	ret +=3D sma1303_regmap_write(sma1303,
> +			SMA1303_0A_SPK_VOL, sma1303->init_vol);

Just use the hardware defaults for the registers, let userspace set what
it needs to.

> +static ssize_t check_fault_period_show(struct device *dev,
> +	struct device_attribute *devattr, char *buf)
> +{
> +	struct sma1303_priv *sma1303 =3D dev_get_drvdata(dev);
> +	int rc;
> +
> +	rc =3D (int)snprintf(buf, PAGE_SIZE,
> +			"%ld\n", sma1303->check_fault_period);

Use sysfs_emit().

--7mekKCSsQkNFJpO5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPBefoACgkQJNaLcl1U
h9CwYwf/a/fvQLe1kUiDwmicmFa16l411j4cuA9T0hgiQUVsJyVeB39ehJ9UJh1s
HB7+woivug1WZ+eSgVAGKh4Rbn5rhjNBk9TPAcKL7DKuHS4aihH6p7JOHecLjjCR
69AlSjL1pLVD306PsW7bfe8BmcoD8/pe6f8Jzm1NNB4St6XIdSH+D0xXg29kYdn5
A9IKNp1NCUxWkyu+YE6mnQXIOVfUtDwhxXPe9Uy8mwvQ42kJxJdZTHwJtskRuZqK
G3lJKkdQ25UJbq1nvmEaGpChA7sBbNLKYjRzaq0FqD875pI3b8mZBCFeGoWustFZ
gUV8ZBlcMbIJU+e5TuSiI2nuQtrw+w==
=w+J9
-----END PGP SIGNATURE-----

--7mekKCSsQkNFJpO5--
