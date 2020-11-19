Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D72282B9A85
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 19:22:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BA1D1715;
	Thu, 19 Nov 2020 19:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BA1D1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605810170;
	bh=ueSkCfRtNpq3F8O5KHS2XvvNvasJoRvH2nmvNFXNjjo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vM13odWeAkiGMgyRQTkfCXPhsEv5xTnW9WsbilhgC2QwYDs6nkadE6Tpm0tiuGqPX
	 3y7kD2PxzKZiPAiPGSJyP7uMJr0TCuJIsaJCTl3yZfT89RPqR8WXRd6peBUziUJt0O
	 SbMavqm8KGO5mg6WQad0vb/UwJJ9OrpoRJ7YNs9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6137F801F5;
	Thu, 19 Nov 2020 19:21:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2F5FF801ED; Thu, 19 Nov 2020 19:21:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E88B9F800C5
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 19:21:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E88B9F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zi1zMEZ7"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D5CC22248;
 Thu, 19 Nov 2020 18:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605810058;
 bh=ueSkCfRtNpq3F8O5KHS2XvvNvasJoRvH2nmvNFXNjjo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zi1zMEZ77MspOdKBD2IAQM34+P6Wcb0wQ8rlqXPjoOo5G8kLj2S2FUIk0lWbTu/Ca
 V7/+5d9NuQEcLlhVPVveVMdyhOcp8UnjEqS8uH1gmfJWADj2T0OSsGLOn0VZY1uR5P
 3tS8D4gXgsGHupmXaZ+9u0QqCP89CAEC9kgPowvY=
Date: Thu, 19 Nov 2020 18:20:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Jamie Meacham <Jamie.Meacham@onsemi.com>
Subject: Re: [PATCH v1] ona10iv: add ona10iv smart PA kernel driver
Message-ID: <20201119182038.GH5554@sirena.org.uk>
References: <DBDC5A1C646D0E44AAF2E13C59E2BADDBC964915@usco01ws0032.ad.onsemi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nFBW6CQlri5Qm8JQ"
Content-Disposition: inline
In-Reply-To: <DBDC5A1C646D0E44AAF2E13C59E2BADDBC964915@usco01ws0032.ad.onsemi.com>
X-Cookie: Chocolate chip.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
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


--nFBW6CQlri5Qm8JQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 02:40:07PM +0000, Jamie Meacham wrote:
> From: Jamie Meacham <jamie.meacham@onsemi.com>
>=20
> add ona10iv smart PA kernel driver

There's quite a few comments here but I think they should be relatively
straightforward to address - a lot of them are fairly simple stylistic
issues and while it looks like the power management is fairly confused
the fix should just be to remove most of that code as the issue is that
the driver is doing the same thing in a lot of places.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jamie Meacham <jamie.meacham@onsemi.com>

This Reported-by doesn't make much sense - are you *sure* that the bot
asked for this driver?

> +++ b/sound/soc/codecs/ona10iv.c
> @@ -0,0 +1,699 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ALSA SoC ON Semiconductor ONA10IV 16W Digital Input Mono Class-D
> + * Audio Amplifier with Speaker I/V Sense

Please make the entire comment a C++ one to make things look more
intentional.

> +///////////////////////////////////////////////////////
> +// Local function prototypes
> +///////////////////////////////////////////////////////
> +static void param_errcheck(int retval, struct device *dev,
> +				const char *errmsg, int param_val);
> +
> +///////////////////////////////////////////////////////
> +// Local structure definitions
> +///////////////////////////////////////////////////////

These comments don't resemble the usual kernel coding style, please try
to do something more consistent with the usual style.

> +static int ona10iv_set_bias_level(struct snd_soc_component *component,
> +					enum snd_soc_bias_level level)
> +{

> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

Or just return the value?  This is a repeating pattern throughout the
driver.

> +#ifdef CONFIG_PM
> +static int ona10iv_codec_suspend(struct snd_soc_component *component)
> +{
> +	int from_state;
> +	int ret;
> +
> +	dev_dbg(component->dev, "ONA10IV-->suspend (standby)\n");
> +	from_state =3D snd_soc_component_get_bias_level(component);

You should never be suspending from a non-idle state.

> +	ret =3D snd_soc_component_update_bits(component,
> +			ONA10IV_REG_PWR_CTRL, ONA10IV_PWR_STATE_MASK,
> +			ONA10IV_SD_N_NORMAL | ONA10IV_STBY);
> +
> +	if (from_state =3D=3D SND_SOC_BIAS_ON)
> +		msleep(255);	// pause for volume ramp to complete

=2E..and the implementation appears to duplicate set_bias_level() anyway?

> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}

The delay here doesn't appear to actually be waiting to do anything?

> +#else
> +#define ona10iv_codec_suspend NULL
> +#define ona10iv_codec_resume NULL
> +#endif

Use DEV_PM_OPS()

> +static int ona10iv_dac_event(struct snd_soc_dapm_widget *w,
> +				struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =3D
> +			snd_soc_dapm_to_component(w->dapm);
> +	int ret =3D 0;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		dev_dbg(component->dev, "ONA10IV-->post power-up\n");
> +		ret =3D snd_soc_component_update_bits(component,
> +				ONA10IV_REG_PWR_CTRL, ONA10IV_PWR_STATE_MASK,
> +				ONA10IV_SD_N_NORMAL | ONA10IV_STBY_RELEASE);
> +		break;

This also appears to be duplicating things done in set_bias_level() -
I'm not sure what the goal is here but it looks like this entire event
handler should just be removed.

> +static int ona10iv_mute(struct snd_soc_dai *dai, int mute, int dir)
> +{
> +	int ret;
> +	struct snd_soc_component *component =3D dai->component;
> +	struct ona10iv_priv *ona10iv;
> +
> +	ona10iv =3D snd_soc_component_get_drvdata(component);
> +
> +	/* using "mute" bit can cause a pop. Instead store volume setting
> +	 * and set volume to minimum allowing a smooth ramp-down.
> +	 */

If your device doesn't have a useful mute control just don't implement
this operation.

> +static int ona10iv_set_bitwidth(struct ona10iv_priv *ona10iv, int format)
> +{

> +static int ona10iv_set_samplerate(struct ona10iv_priv *ona10iv,
> +					int samplerate)
> +{

Both these functions are very simple, linear functions with exactly one
user - it would be cleaner to just inline them in hw_params().

> +static void param_errcheck(int retval, struct device *dev,
> +				const char *errmsg, int param_val)
> +{
> +	if (retval < 0)
> +		dev_dbg(dev, "Error %d: %s =3D %d\n", retval, errmsg, param_val);
> +}

It would be much better to just have dev_err() messages in the error
paths where this is used, it's confusing when reading the code as it's
not idiomatic to have this and it's hard to see what it's achieving -
it's duplicating the ret check which follows it immediately anyway.

Also note that the logging style here does not really reflect the usual
kernel style for log messages.

> +static struct snd_soc_dai_ops ona10iv_dai_ops =3D {
> +	.mute_stream =3D ona10iv_mute,
> +	.hw_params  =3D ona10iv_hw_params,
> +	.set_fmt    =3D NULL,
> +	.set_tdm_slot =3D ona10iv_set_dai_tdm_slot,
> +	.startup =3D NULL,
> +	.shutdown =3D NULL,
> +	.prepare =3D NULL,
> +};

There is no need to assign NULL to unused function pointers, just omit
them.

> +static int ona10iv_codec_probe(struct snd_soc_component *component)
> +{
> +	struct ona10iv_priv *ona10iv =3D
> +			snd_soc_component_get_drvdata(component);
> +
> +	ona10iv->component =3D component;
> +
> +	dev_dbg(component->dev, "ONA10IV-->device probe\n");
> +
> +	ona10iv_reset(ona10iv);

Better to do the reset on I2C probe so we get the device into a known
good state as early as possible, you can then omit this function
entirely.

> +static const struct snd_kcontrol_new ona10iv_snd_controls[] =3D {
> +	SOC_SINGLE_TLV("Playback Volume", ONA10IV_REG_MAX_VOL, 0, 255, 1,
> +					ona10iv_playback_volume),
> +	SOC_SINGLE_TLV("Amp Gain", ONA10IV_REG_GAIN_CTRL1, 0, 31, 1,
> +					ona10iv_digital_tlv),

Volume controls should end in Volume so userspace knows how to handle
them, see control-names.rst for details on the naming conventions.=20

> +static bool ona10iv_volatile(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case ONA10IV_REG_PWR_CTRL:	/* reset bit is self clearing */
> +	case ONA10IV_REG_INT_FLAG:
> +	case ONA10IV_REG_ERR_STAT:
> +	case ONA10IV_REG_T_SENSE_OUT1:
> +	case ONA10IV_REG_T_SENSE_OUT2:/* Sticky interrupt flags */

Missing spaces after the : here.

> +static int ona10iv_i2c_remove(struct i2c_client *client)
> +{
> +	return 0;
> +}

Remove empty functions.

> +static const struct of_device_id ona10iv_of_match[] =3D {
> +	{ .compatible =3D "onnn,ona10iv" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ona10iv_of_match);

New device tree bindings need to have binding documentation added.

> +#define ONA10IV_REG_MAX_VOL		(0x09)
> +#define		ONA10IV_VOL_0DB			(0x00)
> +#define		ONA10IV_VOL_MINUS_0_375DB	(0x01)

There's rather a lot of these volume defines and the values are already
documented much more compactly by the TLV for the volume controls - are
these really required?

--nFBW6CQlri5Qm8JQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+2t3UACgkQJNaLcl1U
h9CZkwf+MGlcySYXKEnl/4zpsuPsBa/QuNwV4qo6VFgNBr8lBxnRUe9eua6OeKpB
3HWUdYrcsSYpZtAbKSaYSoUPzMbG4EWUntpls/WcgQ7+pv94GyoEnbKjhbPUYay2
+JqK6iThzQHne9cwL/2FptNjS3f8wIp0ihxlvqHKdwZ7O3iNVTYYO0Ma8LoxPBaR
4pmwBkOuVwDZpJtEH2RMAFhLm4HLDVfyA8gUJ2aZVzD0/YBY7qrEL+CVI8GDGAGa
YNpSseAvduHfM9tgOxsN+TkOm+7cELT9da6cW4bozde27wpb41zY844ueIJuTxH+
eIXNPv+USpH2Lzz0+GcstXEJkePTiA==
=bFJM
-----END PGP SIGNATURE-----

--nFBW6CQlri5Qm8JQ--
