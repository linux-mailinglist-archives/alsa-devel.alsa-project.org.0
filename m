Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F3C3A7DC0
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 14:01:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6091F168B;
	Tue, 15 Jun 2021 14:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6091F168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623758484;
	bh=o9m5uYdWypXnHiw+JVsH+6TGXbaK0vTOBsnBqRYBTAE=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AOWSSxhPUWgSl9g9abD/g/5XLy3Uj2zF3a+arfOejxz5u8xd8NYhNhYPRQz+wt7zb
	 uzkGd1MQ3S/N5XRsdeSoWRF2ujltRUDmQPJGVwoRYXRbe8x4mwb9iqN5j5D9+bQZwn
	 629Jbbz+tptdhfE9FVUN7kQ2XFvH45p6eTS23Oc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE6C3F80171;
	Tue, 15 Jun 2021 13:59:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FBA1F80171; Tue, 15 Jun 2021 13:59:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECD67F8016C
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 13:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECD67F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="dN8UGUxF"
Received: from [10.88.0.186]
 (dslb-084-062-104-230.084.062.pools.vodafone-ip.de [84.62.104.230])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ch@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 29C6582893;
 Tue, 15 Jun 2021 13:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623758388;
 bh=tnuwTY4vQioWVj20GOrjUSAN3a+5fCtqLoAkGUa3w3A=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=dN8UGUxFs7cSLmq+Kg0x1MOCEtbNWxatGXn0KpWHdq/mUkw0Np9hvrIhyg2UJq19t
 ehYF6WGleEikPAwTpR/giz0hSKpi19I29025WEnY/5Pxq50zvLW9vwXgdnGjGLEkRU
 0NHd9tPAN5R4lSKUJaU3w9GkLB56Uost++cXjId733HgWikYOVBM8LUYJ3Cbt1F/OH
 OLBumhGwaBpkBAWL8aKZhZd+RNPAKhqdwokdJ+sCElM+BknXE6i4dqQDfb0kzYv0mM
 7NVjuypveqxs5P7sSQI/sd+aQlXZ13RGTeDcwYQWOrjjSEHxptwA7NmpNJxZwlw/Jy
 h4Pgy9sAxMY9A==
Subject: Re: [PATCH 2/3] ASoC: tlv320aic32x4: add support for TAS2505
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Marek Vasut <marex@denx.de>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sia Jee Heng <jee.heng.sia@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Annaliese McDermond <nh6z@nh6z.net>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20210615094933.3076392-1-ch@denx.de>
 <20210615094933.3076392-3-ch@denx.de>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
Message-ID: <8545c0a8-3284-25f2-6725-1b3641e0752e@denx.de>
Date: Tue, 15 Jun 2021 13:59:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210615094933.3076392-3-ch@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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

On 2021-06-15 11:49, Claudius Heine wrote:
> This adds support for TAS2505 and TAS2521 to the tlv320aic32x4 driver.

There are some rebase issues here, I will have to fix up.

regards,
Claudius

> 
> Signed-off-by: Claudius Heine <ch@denx.de>
> ---
>   sound/soc/codecs/tlv320aic32x4-i2c.c |   2 +
>   sound/soc/codecs/tlv320aic32x4.c     | 170 ++++++++++++++++++++++++++-
>   sound/soc/codecs/tlv320aic32x4.h     |   5 +
>   3 files changed, 175 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/tlv320aic32x4-i2c.c b/sound/soc/codecs/tlv320aic32x4-i2c.c
> index 247fb1e13674..04ad38311360 100644
> --- a/sound/soc/codecs/tlv320aic32x4-i2c.c
> +++ b/sound/soc/codecs/tlv320aic32x4-i2c.c
> @@ -50,6 +50,7 @@ static int aic32x4_i2c_remove(struct i2c_client *i2c)
>   static const struct i2c_device_id aic32x4_i2c_id[] = {
>   	{ "tlv320aic32x4", (kernel_ulong_t)AIC32X4_TYPE_AIC32X4 },
>   	{ "tlv320aic32x6", (kernel_ulong_t)AIC32X4_TYPE_AIC32X6 },
> +	{ "tas2505", (kernel_ulong_t)AIC32X4_TYPE_TAS2505 },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(i2c, aic32x4_i2c_id);
> @@ -57,6 +58,7 @@ MODULE_DEVICE_TABLE(i2c, aic32x4_i2c_id);
>   static const struct of_device_id aic32x4_of_id[] = {
>   	{ .compatible = "ti,tlv320aic32x4", .data = (void *)AIC32X4_TYPE_AIC32X4 },
>   	{ .compatible = "ti,tlv320aic32x6", .data = (void *)AIC32X4_TYPE_AIC32X6 },
> +	{ .compatible = "ti,tas2505", .data = (void *)AIC32X4_TYPE_TAS2505 },
>   	{ /* senitel */ }
>   };
>   MODULE_DEVICE_TABLE(of, aic32x4_of_id);
> diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
> index 70a1574fb72a..58e773d682d2 100644
> --- a/sound/soc/codecs/tlv320aic32x4.c
> +++ b/sound/soc/codecs/tlv320aic32x4.c
> @@ -221,6 +221,38 @@ static int aic32x4_set_mfp5_gpio(struct snd_kcontrol *kcontrol,
>   	return 0;
>   };
>   
> +static int aic32x4_tas2505_spkdrv_getvol(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int val;
> +
> +	val = snd_soc_component_read(component, TAS2505_SPKVOL1);
> +	val = (val > mc->max) ? mc->max : val;
> +	val = mc->invert ? mc->max - val : val;
> +	ucontrol->value.integer.value[0] = val;
> +
> +	return 0;
> +}
> +
> +static int aic32x4_tas2505_spkdrv_putvol(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	u8 val;
> +
> +	val = (ucontrol->value.integer.value[0] & 0x7f);
> +	val = mc->invert ? mc->max - val : val;
> +	val = (val < 0) ? 0 : val;
> +	snd_soc_component_write(component, TAS2505_SPKVOL1, val);
> +
> +	return 0;
> +}
> +
>   static const struct snd_kcontrol_new aic32x4_mfp1[] = {
>   	SOC_SINGLE_BOOL_EXT("MFP1 GPIO", 0, aic32x4_get_mfp1_gpio, NULL),
>   };
> @@ -251,6 +283,9 @@ static DECLARE_TLV_DB_SCALE(tlv_driver_gain, -600, 100, 0);
>   /* -12dB min, 0.5dB steps */
>   static DECLARE_TLV_DB_SCALE(tlv_adc_vol, -1200, 50, 0);
>   
> +static DECLARE_TLV_DB_LINEAR(tlv_spk_vol, TLV_DB_GAIN_MUTE, 0);
> +static DECLARE_TLV_DB_SCALE(tlv_amp_vol, 0, 600, 1);
> +
>   static const char * const lo_cm_text[] = {
>   	"Full Chip", "1.65V",
>   };
> @@ -1059,6 +1094,130 @@ static const struct snd_soc_component_driver soc_component_dev_aic32x4 = {
>   	.non_legacy_dai_naming	= 1,
>   };
>   
> +static const struct snd_kcontrol_new aic32x4_tas2505_snd_controls[] = {
> +	SOC_DOUBLE_R_S_TLV("PCM Playback Volume", AIC32X4_LDACVOL,
> +			AIC32X4_LDACVOL, 0, -0x7f, 0x30, 7, 0, tlv_pcm),
> +	SOC_ENUM("DAC Playback PowerTune Switch", l_ptm_enum),
> +	SOC_DOUBLE_R_S_TLV("HP Driver Gain Playback Volume", AIC32X4_HPLGAIN,
> +			AIC32X4_HPLGAIN, 0, -0x6, 0x1d, 5, 0,
> +			tlv_driver_gain),
> +	SOC_DOUBLE_R("HP DAC Playback Switch", AIC32X4_HPLGAIN,
> +			AIC32X4_HPLGAIN, 6, 0x01, 1),
> +
> +	SOC_SINGLE("Auto-mute Switch", AIC32X4_DACMUTE, 4, 7, 0),
> +
> +	SOC_SINGLE_RANGE_EXT_TLV("Speaker Driver Playback Volume", TAS2505_SPKVOL1,
> +			0, 0, 117, 1, aic32x4_tas2505_spkdrv_getvol,
> +			aic32x4_tas2505_spkdrv_putvol, tlv_spk_vol),
> +	SOC_SINGLE_TLV("Speaker Amplifier Playback Volume", TAS2505_SPKVOL2,
> +			4, 5, 0, tlv_amp_vol),
> +};
> +
> +static const struct snd_kcontrol_new hp_output_mixer_controls[] = {
> +	SOC_DAPM_SINGLE("DAC Switch", AIC32X4_HPLROUTE, 3, 1, 0),
> +};
> +
> +static const struct snd_soc_dapm_widget aic32x4_tas2505_dapm_widgets[] = {
> +	SND_SOC_DAPM_DAC("DAC", "Playback", AIC32X4_DACSETUP, 7, 0),
> +	SND_SOC_DAPM_MIXER("HP Output Mixer", SND_SOC_NOPM, 0, 0,
> +			   &hp_output_mixer_controls[0],
> +			   ARRAY_SIZE(hp_output_mixer_controls)),
> +	SND_SOC_DAPM_PGA("HP Power", AIC32X4_OUTPWRCTL, 5, 0, NULL, 0),
> +
> +	SND_SOC_DAPM_PGA("Speaker Driver", TAS2505_SPK, 1, 0, NULL, 0),
> +
> +	SND_SOC_DAPM_OUTPUT("HP"),
> +	SND_SOC_DAPM_OUTPUT("Speaker"),
> +};
> +
> +static const struct snd_soc_dapm_route aic32x4_tas2505_dapm_routes[] = {
> +	/* Left Output */
> +	{"HP Output Mixer", "DAC Switch", "DAC"},
> +
> +	{"HP Power", NULL, "HP Output Mixer"},
> +	{"HP", NULL, "HP Power"},
> +
> +	{"Speaker Driver", NULL, "DAC"},
> +	{"Speaker", NULL, "Speaker Driver"},
> +};
> +
> +static struct snd_soc_dai_driver aic32x4_tas2505_dai = {
> +	.name = "tas2505-hifi",
> +	.playback = {
> +			 .stream_name = "Playback",
> +			 .channels_min = 1,
> +			 .channels_max = 1,
> +			 .rates = SNDRV_PCM_RATE_8000_96000,
> +			 .formats = AIC32X4_FORMATS,},
> +	.ops = &aic32x4_ops,
> +	.symmetric_rates = 1,
> +};
> +
> +static int aic32x4_tas2505_component_probe(struct snd_soc_component *component)
> +{
> +	struct aic32x4_priv *aic32x4 = snd_soc_component_get_drvdata(component);
> +	u32 tmp_reg;
> +	int ret;
> +
> +	struct clk_bulk_data clocks[] = {
> +		{ .id = "codec_clkin" },
> +		{ .id = "pll" },
> +		{ .id = "bdiv" },
> +		{ .id = "mdac" },
> +	};
> +
> +	ret = devm_clk_bulk_get(component->dev, ARRAY_SIZE(clocks), clocks);
> +	if (ret)
> +		return ret;
> +
> +	if (aic32x4->setup)
> +		aic32x4_setup_gpios(component);
> +
> +	clk_set_parent(clocks[0].clk, clocks[1].clk);
> +	clk_set_parent(clocks[2].clk, clocks[3].clk);
> +
> +	/* Power platform configuration */
> +	if (aic32x4->power_cfg & AIC32X4_PWR_AVDD_DVDD_WEAK_DISABLE)
> +		snd_soc_component_write(component, AIC32X4_PWRCFG, AIC32X4_AVDDWEAKDISABLE);
> +
> +	tmp_reg = (aic32x4->power_cfg & AIC32X4_PWR_AIC32X4_LDO_ENABLE) ?
> +			AIC32X4_LDOCTLEN : 0;
> +	snd_soc_component_write(component, AIC32X4_LDOCTL, tmp_reg);
> +
> +	tmp_reg = snd_soc_component_read(component, AIC32X4_CMMODE);
> +	if (aic32x4->power_cfg & AIC32X4_PWR_CMMODE_LDOIN_RANGE_18_36)
> +		tmp_reg |= AIC32X4_LDOIN_18_36;
> +	if (aic32x4->power_cfg & AIC32X4_PWR_CMMODE_HP_LDOIN_POWERED)
> +		tmp_reg |= AIC32X4_LDOIN2HP;
> +	snd_soc_component_write(component, AIC32X4_CMMODE, tmp_reg);
> +
> +	/*
> +	 * Enable the fast charging feature and ensure the needed 40ms ellapsed
> +	 * before using the analog circuits.
> +	 */
> +	snd_soc_component_write(component, TAS2505_REFPOWERUP,
> +				AIC32X4_REFPOWERUP_40MS);
> +	msleep(40);
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_component_driver soc_component_dev_aic32x4_tas2505 = {
> +	.probe			= aic32x4_tas2505_component_probe,
> +	.set_bias_level		= aic32x4_set_bias_level,
> +	.controls		= aic32x4_tas2505_snd_controls,
> +	.num_controls		= ARRAY_SIZE(aic32x4_tas2505_snd_controls),
> +	.dapm_widgets		= aic32x4_tas2505_dapm_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(aic32x4_tas2505_dapm_widgets),
> +	.dapm_routes		= aic32x4_tas2505_dapm_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(aic32x4_tas2505_dapm_routes),
> +	.suspend_bias_off	= 1,
> +	.idle_bias_on		= 1,
> +	.use_pmdown_time	= 1,
> +	.endianness		= 1,
> +	.non_legacy_dai_naming	= 1,
> +};
> +
>   static int aic32x4_parse_dt(struct aic32x4_priv *aic32x4,
>   		struct device_node *np)
>   {
> @@ -1250,8 +1409,15 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
>   	if (ret)
>   		goto err_disable_regulators;
>   
> -	ret = devm_snd_soc_register_component(dev,
> -			&soc_component_dev_aic32x4, &aic32x4_dai, 1);
> +	switch (aic32x4->type) {
> +	case AIC32X4_TYPE_TAS2505:
> +		ret = devm_snd_soc_register_component(dev,
> +			&soc_component_dev_aic32x4_tas2505, &aic32x4_tas2505_dai, 1);
> +		break;
> +	default:
> +		ret = devm_snd_soc_register_component(dev,
> +	}
> +
>   	if (ret) {
>   		dev_err(dev, "Failed to register component\n");
>   		goto err_disable_regulators;
> diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
> index 8a18dbec76a6..e9fd2e55d6c3 100644
> --- a/sound/soc/codecs/tlv320aic32x4.h
> +++ b/sound/soc/codecs/tlv320aic32x4.h
> @@ -13,6 +13,7 @@ struct regmap_config;
>   enum aic32x4_type {
>   	AIC32X4_TYPE_AIC32X4 = 0,
>   	AIC32X4_TYPE_AIC32X6,
> +	AIC32X4_TYPE_TAS2505,
>   };
>   
>   extern const struct regmap_config aic32x4_regmap_config;
> @@ -93,6 +94,9 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
>   #define	AIC32X4_LOLGAIN		AIC32X4_REG(1, 18)
>   #define	AIC32X4_LORGAIN		AIC32X4_REG(1, 19)
>   #define AIC32X4_HEADSTART	AIC32X4_REG(1, 20)
> +#define TAS2505_SPK		AIC32X4_REG(1, 45)
> +#define TAS2505_SPKVOL1		AIC32X4_REG(1, 46)
> +#define TAS2505_SPKVOL2		AIC32X4_REG(1, 48)
>   #define AIC32X4_MICBIAS		AIC32X4_REG(1, 51)
>   #define AIC32X4_LMICPGAPIN	AIC32X4_REG(1, 52)
>   #define AIC32X4_LMICPGANIN	AIC32X4_REG(1, 54)
> @@ -101,6 +105,7 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
>   #define AIC32X4_FLOATINGINPUT	AIC32X4_REG(1, 58)
>   #define AIC32X4_LMICPGAVOL	AIC32X4_REG(1, 59)
>   #define AIC32X4_RMICPGAVOL	AIC32X4_REG(1, 60)
> +#define TAS2505_REFPOWERUP	AIC32X4_REG(1, 122)
>   #define AIC32X4_REFPOWERUP	AIC32X4_REG(1, 123)
>   
>   /* Bits, masks, and shifts */
> 

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: ch@denx.de

            PGP key: 6FF2 E59F 00C6 BC28 31D8 64C1 1173 CB19 9808 B153
                              Keyserver: hkp://pool.sks-keyservers.net
