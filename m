Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C4463C61A
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 18:07:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE517161E;
	Tue, 29 Nov 2022 18:07:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE517161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669741674;
	bh=JPO6DnTqIBrTe5U2WHb3aJ/oUJK3P1/2bJLU2ZyVkz4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p6/6kHMsbilzlGR9DDI9B+zib8H5PKktfkWN68LcbLiF0wRNjHGHV7ykb9Cjcn0Fd
	 uV0MqguovbkAqsw9LLbO6jTAJ8IHll77Lmv4p2s71wBzYHxL9RxITw+xlHwClnja7j
	 Lv4GwTRjQ1jLtAvvzGCqE3UzZx4WTkZ5BP2v/XwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 580F0F80212;
	Tue, 29 Nov 2022 18:06:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FE40F801F7; Tue, 29 Nov 2022 18:06:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82451F800B6
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 18:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82451F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SX6HPgNe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DE95CB816D4;
 Tue, 29 Nov 2022 17:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F7CC433C1;
 Tue, 29 Nov 2022 17:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669741610;
 bh=JPO6DnTqIBrTe5U2WHb3aJ/oUJK3P1/2bJLU2ZyVkz4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SX6HPgNe5KQ+A66KV1Wd+eYWwuBk1TT4vsiq7vvKwz1uCrSjT+w6PCzkUdT0m2ulo
 Cl0HPR0E71+G1H9wpxAgQHJSprNDtkZf+JzTsNMs48bCqQwAUxKDA0sekVucdohcbf
 tr/mDMf6z+X5ZeoPAFA8LzweOEreGFH15fkEDWLL455BYXpMkhBYUmWRLiBeDpUcmP
 R8xYV8gtYsUZVnW7uMg7HczEmnCF/BYW+GhGL0yNRm0TELESJhA1NbaWn/JDLAYks7
 qIzzX8kQNPp5lHmPGVXKsds3W1gcVguKLJThUksCB1R2z141nDnsp4tXDJi9VppnWy
 33cacQCiqfoAA==
Date: Tue, 29 Nov 2022 17:06:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
Message-ID: <Y4Y8JhR/9gOMLPix@sirena.org.uk>
References: <20220914103854.11351-1-kiseok.jo@irondevice.com>
 <20220914103854.11351-2-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5nQpPhQWL85bRBfL"
Content-Disposition: inline
In-Reply-To: <20220914103854.11351-2-kiseok.jo@irondevice.com>
X-Cookie: An apple a day makes 365 apples a year.
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Gyuhwa Park <gyuhwa.park@irondevice.com>
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


--5nQpPhQWL85bRBfL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 14, 2022 at 07:38:53PM +0900, Kiseok Jo wrote:

> The Iron Device SMA1303 is a boosted Class-D audio amplifier.

This is looking quite a bit cleaner but there's still a bunch of things
here where the driver could do to fit more cleanly into the standard
kernel APIs.  I don't think there's anything here that should be too
hard to deal with, but it's all generally all some combination of
removing custom code to use framework features or stylistic stuff rather
than anything too major.

> @@ -0,0 +1,2119 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* sma1303.c -- sma1303 ALSA SoC Audio driver
> + *
> + * Copyright 2022 Iron Device Corporation
> + *

Please make the entire comment a C++ one so things look more
intentional.

> +static int sma1303_regmap_write(struct regmap *map, struct device *dev,
> +				unsigned int reg, unsigned int val)
> +{
> +	int ret = 0;
> +
> +	ret = regmap_write(map, reg, val);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to write, register: 0x%02X, ret: %d\n",
> +			       reg, ret);
> +	}
> +	return ret;
> +}

If we want these erorr logs adding it probably makes sense to do
sometihng in regmap rather than locally in the driver - regmap already
has the dev to hand so it's one less parameter too.

> +static int bytes_ext_get(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol, int reg)
> +{

It'd be better to add a driver specific name for this.

> +static int bytes_ext_put(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol, int reg)
> +{

> +	for (i = 0; i < params->max; i++) {
> +		ret = sma1303_regmap_write(
> +				sma1303->regmap, component->dev,
> +				reg + i, *(val + i));
> +		if (ret < 0) {
> +			kfree(data);
> +			return ret;
> +		}
> +	}
> +	kfree(data);
> +
> +	return 0;

This should return 1 if the value is different.

> +	if (sma1303->usage_status)
> +		dev_info(component->dev, "Amplifier Power Control Enabled\n");
> +	else
> +		dev_info(component->dev, "Amplifier Power Control Disabled\n");

Remove this logging, it allows userspace to spam the logs and hide
things.  Same issue in lots of other places in the driver.  There's
already a *lot* of standard trace available for things like DAPM.

> +	if ((sma1303->usage_status
> +			!= ucontrol->value.integer.value[0])
> +			&& (!ucontrol->value.integer.value[0])) {
> +		dev_info(component->dev, "%s\n", "Force AMP Power Down");
> +		ret = sma1303_shutdown(component);
> +		if (ret < 0) {
> +			ucontrol->value.integer.value[0]
> +			       = sma1303->usage_status;
> +			return ret;
> +		}
> +
> +	}

Why would we have a userspace control for this - why not just let DAPM
manage the power?

> +static const char * const sma1303_amp_mode_text[] = {
> +	"1 Chip", "Mono on 2 chips", "Left in 2 chips", "Right in 2chips"};
> +
> +static const struct soc_enum sma1303_amp_mode_enum =
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_amp_mode_text),
> +			sma1303_amp_mode_text);

I still think it'd be easier to just merge a simple per chip driver and
then build the multiple device support on top since that's unusual and
new.  Though...

> +	switch (sma1303->amp_mode) {
> +	case ONE_CHIP_SOLUTION:
> +	case MONO_TWO_CHIP_SOLUTION:
> +		ret += sma1303_regmap_update_bits(
> +				sma1303->regmap, component->dev,
> +				SMA1303_11_SYSTEM_CTRL2,
> +				MONOMIX_MASK, MONOMIX_ON);
> +		ret += sma1303_regmap_update_bits(
> +				sma1303->regmap, component->dev,
> +				SMA1303_11_SYSTEM_CTRL2,
> +				LR_DATA_SW_MASK, LR_DATA_SW_NORMAL);
> +		break;

...this just looks like normal audio path routing stuff which I'd expect
to be controlled with some combination of DAPM and hw_params.  See the
mono mix control options in other drivers for example.  People might
want to use things like mono mixes or L/R channel selection for other
reasons - for example some people use mono mixes for accessibility
purposes.

> +static const char * const sma1303_outport_config_text[] = {
> +	"Enable", "Disable"};
> +
> +static const struct soc_enum sma1303_outport_config_enum =
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_outport_config_text),
> +			sma1303_outport_config_text);
> +

As mentioned on an earlier version on/off controls should be simple
booleans.

> +static const char * const sma1303_spkmute_text[] = {
> +	"Unmute", "Mute"};

This applies to mutes too.

> +	case 0:
> +		val = EN_POST_SCALER;
> +		break;
> +	case 1:
> +		val = BYP_POST_SCALER;
> +		break;

The on/off control for the post scaler should be a separate control,
this should enable you to use standard _BYTES and switch controls.

> +	ret = regmap_read(sma1303->regmap, SMA1303_A4_TOP_MAN3, &data);
> +	val = data & O_FORMAT_MASK;
> +	switch (val) {
> +	case O_FMT_LJ:
> +		ucontrol->value.integer.value[0] = 0;
> +		break;
> +	case O_FMT_I2S:
> +		ucontrol->value.integer.value[0] = 1;
> +		break;
> +	case O_FMT_TDM:
> +		ucontrol->value.integer.value[0] = 2;
> +		break;

The DAI format definitely should not be user controllable, implement a
DAI set_fmt() operation.

> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +
> +		if (sma1303->usage_status &&
> +			(sma1303->sys_clk_id == SMA1303_PLL_CLKIN_MCLK
> +			|| sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK)) {
> +
> +			if (sma1303->last_bclk != bclk) {
> +				if (sma1303->amp_power_status) {
> +					sma1303_shutdown(component);
> +					sma1303_setup_pll(component, bclk);
> +					sma1303_startup(component);
> +				} else
> +					sma1303_setup_pll(component, bclk);
> +
> +				sma1303->last_bclk = bclk;
> +			}
> +		}

If the driver can't change clock rate while there's active audio then it
should set constraints - there's a bunch of other drivers with examples
of constraints code you could look at.

> +		case 24000:
> +		case 32000:
> +		case 44100:
> +		case 48000:
> +		case 96000:
> +		ret += sma1303_regmap_update_bits(
> +				sma1303->regmap, component->dev,
> +				SMA1303_A2_TOP_MAN1,
> +				DAC_DN_CONV_MASK, DAC_DN_CONV_DISABLE);

Please follow the kernel coding style for indentation, all this switch
stuff is off.

> +static struct snd_soc_dai_driver sma1303_dai[] = {
> +{
> +	.name = "sma1303-amplifier",
> +	.id = 0,
> +	.playback = {

Again, please follow the kernel coding style.

> +static void sma1303_check_fault_worker(struct work_struct *work)
> +{
> +	struct sma1303_priv *sma1303 =
> +		container_of(work, struct sma1303_priv, check_fault_work.work);
> +	int ret = 0;
> +	unsigned int over_temp, ocp_val, uvlo_val;
> +
> +	mutex_lock(&sma1303->lock);

Nothing else seems to take this lock, what is it actually protecting?

> +#ifdef CONFIG_PM
> +static int sma1303_suspend(struct snd_soc_component *component)
> +{
> +	return 0;
> +}
> +
> +static int sma1303_resume(struct snd_soc_component *component)
> +{
> +	return 0;
> +}
> +#else
> +#define sma1303_suspend NULL
> +#define sma1303_resume NULL
> +#endif

Just remove the suspend/resume operations if they're not implemented.

> +static int sma1303_probe(struct snd_soc_component *component)
> +{
> +	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_component_get_dapm(component);
> +	char *dapm_widget_str = NULL;
> +	int prefix_len = 0, str_max = 30, ret = 0, i = 0;
> +	unsigned int status, otp_stat;
> +
> +	if (component->name_prefix != NULL) {
> +		dev_info(component->dev, "%s : component name prefix - %s\n",
> +			__func__, component->name_prefix);
> +
> +		prefix_len = strlen(component->name_prefix);
> +		dapm_widget_str = kzalloc(prefix_len + str_max, GFP_KERNEL);
> +
> +		if (!dapm_widget_str) {
> +			kfree(dapm_widget_str);
> +			return -ENOMEM;
> +		}

The core will handle prefixing for you, no need for the driver to do
anything.

> +	ret += sma1303_regmap_update_bits(
> +			sma1303->regmap, component->dev,
> +			SMA1303_00_SYSTEM_CTRL,
> +			RESETBYI2C_MASK, RESETBYI2C_RESET);
> +
> +	ret += regmap_read(sma1303->regmap, SMA1303_FF_DEVICE_INDEX, &status);
> +	if (ret < 0) {
> +		dev_err(sma1303->dev,
> +			"failed to read, register: %02X, ret: %d\n",
> +				SMA1303_FF_DEVICE_INDEX, ret);
> +		return ret;
> +	}
> +	sma1303->rev_num = status & REV_NUM_STATUS;
> +	if (sma1303->rev_num == REV_NUM_TV0)
> +		dev_info(component->dev, "SMA1303 Trimming Version 0\n");
> +	else if (sma1303->rev_num == REV_NUM_TV1)
> +		dev_info(component->dev, "SMA1303 Trimming Version 1\n");

Move all this basic enumeration stuff to the device level probe, no need
to repeat it every time the card probes and if there's any problem it's
better to fail early.

> +	for (i = 0; i < (unsigned int)ARRAY_SIZE(sma1303_reg_def); i++)
> +		ret += sma1303_regmap_write(
> +				sma1303->regmap, component->dev,
> +				sma1303_reg_def[i].reg,
> +				sma1303_reg_def[i].def);

Why are we writing out the defaults, if there's a reason it needs a
comment?  Also the cast on the ARRAY_SIZE() is weird.

> +
> +	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
> +			SMA1303_0A_SPK_VOL, sma1303->init_vol);

Let userspace configure volumes, the driver shouldn't have any defaults
separate to that especially not configurable ones.

> +static struct attribute *sma1303_attr[] = {
> +	&dev_attr_check_fault_period.attr,
> +	&dev_attr_check_fault_status.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group sma1303_attr_group = {
> +	.attrs = sma1303_attr,
> +};

If this is configurable it'd be better to expose it via ALSA controls,
though for things like the poll interval it's not clear to me why we'd
make it configurable.

> +	dev_info(&client->dev, "%s is here. Driver version REV018\n", __func__);

We don't version drivers separately to the kernel upstream, it's
something that generally looses all meaning.

> +static int __init sma1303_init(void)
> +{
> +	int ret;
> +
> +	ret = i2c_add_driver(&sma1303_i2c_driver);
> +
> +	if (ret)
> +		pr_err("Failed to register sma1303 I2C driver: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void __exit sma1303_exit(void)
> +{
> +	i2c_del_driver(&sma1303_i2c_driver);
> +}
> +
> +module_init(sma1303_init);
> +module_exit(sma1303_exit);

module_i2c_driver()

--5nQpPhQWL85bRBfL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOGPCUACgkQJNaLcl1U
h9AV6Qf/UvWRYWStRvj1Fja1iB1YOpOKUCmETRdjiNekGOTYMfC0fCWnzCGZYane
v1IutS8N63kGS7djegxj7xi8KA9MHPH7Ed0pSeZQMhfz8ejbFnXRc7oUSvf6vEpg
m7fgZBEGH32fei5er4lRM9gCfOCHuih9aG8pPMyjaI5fixsOKW1mN7oOu5ATvLbZ
vdC50oJdWz6npSZY97EcccvehbuYEu/FExvVFKj6j+gm+VpKt3jleHK5c8CxMUhU
VPrrx5699ct3ldEoapUqiiRKS5hKUWcMOFfOLhXb579U0I9yelxUxPVB/G8Pv5rM
Jo3f6j7giPsWob2PXGFw3lvfRJxLqw==
=d2vY
-----END PGP SIGNATURE-----

--5nQpPhQWL85bRBfL--
