Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53490434014
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 22:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5973169F;
	Tue, 19 Oct 2021 22:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5973169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634677182;
	bh=rhPypLi7UC3CBPjMpeHi4/oEhXvz+4GXXr0ZtVPJ14o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ukJyeQ6nAVBSmdSvAeJt126i/hAZWFW9p4hGr/tFOVh5L8e0npYEs1A0ObMSfZekO
	 GF6PsFw6K66waJIIU+Vc5Jvgh5dl2kpBnTuz87r7tPpCBNbapgC72vDF5tnV4Ly3Lv
	 X6CLqIMDpEyEc2MJGVZM5u5mWseTSqpp8EwmS7tI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 299F8F80082;
	Tue, 19 Oct 2021 22:58:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 612FCF80240; Tue, 19 Oct 2021 22:58:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=NICE_REPLY_A,PRX_BODY_65,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36606F80111
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 22:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36606F80111
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="209424853"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="209424853"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 13:58:08 -0700
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="483423812"
Received: from kumarr1-mobl1.amr.corp.intel.com (HELO [10.212.58.240])
 ([10.212.58.240])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 13:58:04 -0700
Subject: Re: [v4] ASoC: max98520: add max98520 audio amplifier driver
To: George Song <george.song@maximintegrated.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org
References: <20211019084914.14622-1-george.song@maximintegrated.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <888a488c-9f29-3ac1-2dfc-a14380abfc68@linux.intel.com>
Date: Tue, 19 Oct 2021 15:58:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019084914.14622-1-george.song@maximintegrated.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 steves.lee@maximintegrated.com, ryans.lee@maximintegrated.com,
 george.song@analog.com, linux-kernel@vger.kernel.org
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


> +static int max98520_dai_tdm_slot(struct snd_soc_dai *dai,
> +				 unsigned int tx_mask, unsigned int rx_mask,
> +				 int slots, int slot_width)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct max98520_priv *max98520 =
> +		snd_soc_component_get_drvdata(component);
> +	int bsel = 0;

nit-pick: useless initialization....

> +	unsigned int chan_sz = 0;
> +
> +	if (!tx_mask && !rx_mask && !slots && !slot_width)
> +		max98520->tdm_mode = false;
> +	else
> +		max98520->tdm_mode = true;
> +
> +	/* BCLK configuration */
> +	bsel = max98520_get_bclk_sel(slots * slot_width);

... it's overridden here.

> +	if (bsel == 0) {
> +		dev_err(component->dev, "BCLK %d not supported\n",
> +			slots * slot_width);
> +		return -EINVAL;
> +	}
> +
> +	regmap_update_bits(max98520->regmap,
> +			   MAX98520_R2041_PCM_CLK_SETUP,
> +			   MAX98520_PCM_CLK_SETUP_BSEL_MASK,
> +			   bsel);
> +
> +	/* Channel size configuration */
> +	switch (slot_width) {
> +	case 16:
> +		chan_sz = MAX98520_PCM_MODE_CFG_CHANSZ_16;
> +		break;
> +	case 24:
> +		chan_sz = MAX98520_PCM_MODE_CFG_CHANSZ_24;
> +		break;
> +	case 32:
> +		chan_sz = MAX98520_PCM_MODE_CFG_CHANSZ_32;
> +		break;
> +	default:
> +		dev_err(component->dev, "format unsupported %d\n",
> +			slot_width);
> +		return -EINVAL;
> +	}
> +
> +	regmap_update_bits(max98520->regmap,
> +			   MAX98520_R2040_PCM_MODE_CFG,
> +			   MAX98520_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
> +
> +	/* Rx slot configuration */
> +	regmap_update_bits(max98520->regmap,
> +			   MAX98520_R2044_PCM_RX_SRC2,
> +			   MAX98520_PCM_DMIX_CH0_SRC_MASK,
> +			   rx_mask);
> +	regmap_update_bits(max98520->regmap,
> +			   MAX98520_R2044_PCM_RX_SRC2,
> +			   MAX98520_PCM_DMIX_CH1_SRC_MASK,
> +			   rx_mask << MAX98520_PCM_DMIX_CH1_SHIFT);
> +
> +	return 0;
> +}
> +
> +#define MAX98520_RATES SNDRV_PCM_RATE_8000_192000
> +
> +#define MAX98520_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
> +	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
> +
> +static const struct snd_soc_dai_ops max98520_dai_ops = {
> +	.set_fmt = max98520_dai_set_fmt,
> +	.hw_params = max98520_dai_hw_params,
> +	.set_tdm_slot = max98520_dai_tdm_slot,
> +};
> +
> +static int max98520_dac_event(struct snd_soc_dapm_widget *w,
> +			      struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct max98520_priv *max98520 =
> +		snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:

is it intentional that you use POST_PMU here? for symmetry with POST_PMD
below, should this be PRE_PMU?

> +		dev_dbg(component->dev, " AMP ON\n");
> +
> +		regmap_write(max98520->regmap, MAX98520_R209F_AMP_EN, 1);
> +		regmap_write(max98520->regmap, MAX98520_R210F_GLOBAL_EN, 1);
> +		usleep_range(30000, 31000);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		dev_dbg(component->dev, " AMP OFF\n");
> +
> +		regmap_write(max98520->regmap, MAX98520_R210F_GLOBAL_EN, 0);
> +		regmap_write(max98520->regmap, MAX98520_R209F_AMP_EN, 0);
> +		usleep_range(30000, 31000);
> +		break;
> +	default:
> +		return 0;
> +	}
> +	return 0;
> +}
>
> +static void max98520_reset(struct max98520_priv *max98520, struct device *dev)
> +{
> +	int ret, reg, count;
> +
> +	/* Software Reset */
> +	ret = regmap_write(max98520->regmap, MAX98520_R2000_SW_RESET, 1);
> +	if (ret)
> +		dev_err(dev, "Reset command failed. (ret:%d)\n", ret);

return; ?

Trying to verify if the reset worked is the reset command failed seems
unnecessary?

> +
> +	count = 0;
> +	while (count < 3) {
> +		usleep_range(10000, 11000);
> +		/* Software Reset Verification */
> +		ret = regmap_read(max98520->regmap, MAX98520_R21FF_REVISION_ID, &reg);
> +		if (!ret)
> +			return;
> +
> +		count++;
> +	}
> +	dev_err(dev, "Reset failed. (ret:%d)\n", ret);
> +}

> +#ifdef CONFIG_PM_SLEEP

the recommendation is to remove these ifdefs and use __maybe_unused for
pm functions.

> +static int max98520_suspend(struct device *dev)
> +{
> +	struct max98520_priv *max98520 = dev_get_drvdata(dev);
> +
> +	regcache_cache_only(max98520->regmap, true);
> +	regcache_mark_dirty(max98520->regmap);
> +	return 0;
> +}
> +
> +static int max98520_resume(struct device *dev)
> +{
> +	struct max98520_priv *max98520 = dev_get_drvdata(dev);
> +
> +	regcache_cache_only(max98520->regmap, false);
> +	max98520_reset(max98520, dev);
> +	regcache_sync(max98520->regmap);
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops max98520_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(max98520_suspend, max98520_resume)
> +};
> +
> +static const struct snd_soc_component_driver soc_codec_dev_max98520 = {
> +	.probe			= max98520_probe,
> +	.controls		= max98520_snd_controls,
> +	.num_controls		= ARRAY_SIZE(max98520_snd_controls),
> +	.dapm_widgets		= max98520_dapm_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(max98520_dapm_widgets),
> +	.dapm_routes		= max98520_audio_map,
> +	.num_dapm_routes	= ARRAY_SIZE(max98520_audio_map),
> +	.idle_bias_on		= 1,
> +	.use_pmdown_time	= 1,
> +	.endianness		= 1,
> +	.non_legacy_dai_naming	= 1,
> +};
> +
> +static const struct regmap_config max98520_regmap = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.max_register = MAX98520_R21FF_REVISION_ID,
> +	.reg_defaults  = max98520_reg,
> +	.num_reg_defaults = ARRAY_SIZE(max98520_reg),
> +	.readable_reg = max98520_readable_register,
> +	.volatile_reg = max98520_volatile_reg,
> +	.cache_type = REGCACHE_RBTREE,
> +};
> +
> +static void max98520_power_on(struct max98520_priv *max98520, bool poweron)
> +{
> +	if (max98520->reset_gpio)
> +		gpiod_set_value_cansleep(max98520->reset_gpio, !poweron);
> +}
> +
> +static int max98520_i2c_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
> +{
> +	int ret = 0;

useless init

> +	int reg = 0;
> +	struct max98520_priv *max98520 = NULL;

useless init

> +	struct i2c_adapter *adapter = to_i2c_adapter(i2c->dev.parent);
> +
> +	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA);
> +	if (!ret) {
> +		dev_err(&i2c->dev, "I2C check functionality failed\n");
> +		return -ENXIO;
> +	}
> +
> +	max98520 = devm_kzalloc(&i2c->dev, sizeof(*max98520), GFP_KERNEL);
> +
> +	if (!max98520) {
> +		ret = -ENOMEM;
> +		return ret;

return -ENOMEM;

> +	}
> +	i2c_set_clientdata(i2c, max98520);
> +
> +	/* regmap initialization */
> +	max98520->regmap =
> +		devm_regmap_init_i2c(i2c, &max98520_regmap);

one line?

> +	if (IS_ERR(max98520->regmap)) {
> +		ret = PTR_ERR(max98520->regmap);
> +		dev_err(&i2c->dev,
> +			"Failed to allocate regmap: %d\n", ret);

one line?

> +		return ret;
> +	}
> +
> +	/* Power on device */
> +	max98520->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_HIGH);
> +	if (max98520->reset_gpio) {
> +		if (IS_ERR(max98520->reset_gpio)) {
> +			ret = PTR_ERR(max98520->reset_gpio);
> +			dev_err(&i2c->dev, "Unable to request GPIO pin: %d.\n", ret);
> +			return ret;
> +		}
> +
> +		max98520_power_on(max98520, 1);
> +	}
> +
> +	/* Check Revision ID */
> +	ret = regmap_read(max98520->regmap, MAX98520_R21FF_REVISION_ID, &reg);
> +	if (ret < 0) {
> +		dev_err(&i2c->dev,
> +			"Failed to read: 0x%02X\n", MAX98520_R21FF_REVISION_ID);
> +		return ret;
> +	}
> +	dev_info(&i2c->dev, "MAX98520 revisionID: 0x%02X\n", reg);
> +
> +	/* codec registration */
> +	ret = devm_snd_soc_register_component(&i2c->dev,
> +					      &soc_codec_dev_max98520,
> +		max98520_dai, ARRAY_SIZE(max98520_dai));

alignment?

> +	if (ret < 0)
> +		dev_err(&i2c->dev, "Failed to register codec: %d\n", ret);
> +
> +	return ret;
> +}

> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id max98520_acpi_match[] = {
> +	{ "MX98520", 0 },

MX is not a valid ACPI/PNP vendor identifier but I suppose it's been
used by Maxim for all products...

