Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 839FD3332A5
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 02:12:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04711179C;
	Wed, 10 Mar 2021 02:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04711179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615338734;
	bh=wiZOtMo+hj0FvxThXEEaVDqXWMVWkM58PtYUb3epFtY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XF0NR/EKZvfo4iivUYWxXJV1M3xlakD0Byi183ads64NsBwwJMYgFRfA379YMFrBz
	 a0W3ltjkVYv7ODiNaKpVCjlwzUS2JB74rIX/SKv6L5xNRe+UM2/8EdV/pao9l+EazI
	 Zmsc4rUo/VA3nOMih7+0xTaNWOyRoCdlUL30+rk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A414F80256;
	Wed, 10 Mar 2021 02:10:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEBFCF80227; Wed, 10 Mar 2021 02:10:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E4B2F80166
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 02:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E4B2F80166
IronPort-SDR: 8rusf//+Vt2qkkfsScp3Hbvcek4+QZkjQ5weWYD2LaWASbMNhOR1uVvNrvcuj1iEAiW45NPLkG
 gwFMtDeZRIVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="249728484"
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; d="scan'208";a="249728484"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 17:10:26 -0800
IronPort-SDR: DqQFWujOJcuhzDT4bls+oIOu/Z3kbaFfbAVydlAmxgZ9+BvBIkkOmx02PgFK3YNz+ajPzdB1MU
 SdPFEUi24AAQ==
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; d="scan'208";a="369979495"
Received: from ckane-desk.amr.corp.intel.com (HELO [10.251.135.181])
 ([10.251.135.181])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 17:10:25 -0800
Subject: Re: [PATCH] Add audio driver for rk817 upstream
To: Chris Morgan <macromorgan@hotmail.com>, alsa-devel@alsa-project.org
References: <SN6PR06MB53424379B5FC1BB3710B59F4A5929@SN6PR06MB5342.namprd06.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <73da80b6-bdf4-f61a-d4cf-b7450b52244a@linux.intel.com>
Date: Tue, 9 Mar 2021 19:10:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <SN6PR06MB53424379B5FC1BB3710B59F4A5929@SN6PR06MB5342.namprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
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



On 3/9/21 5:41 PM, Chris Morgan wrote:
> I'm wondering if you all can help me.  I'm trying to get the rk817
> codec driver working from Rockchip's BSP kernel sources (GPL per
> the license) and I'm struggling with a few parts. The first part

is to Cc: audio maintainers (Takashi Iwai and Mark Brown).

Then you need to make sure there is a Signed-off-by tag from the 
original contribution this code is based on, along with yours. It 
doesn't hurt to have a pointer to that code either in the commit message.

> is I'm not sure if I have my audio paths set up correctly. For example
> the sinks I have set up are for HPOL and HPOR, and the source is for
> MIC. While this does work (audio output seems fine) I'm having issues
> with the GPIO to detect headphone insertion. When I insert headphones
> I expect the audio to output to the headphones, and when I remove
> headphones I expect the audio to output to a speaker. Right now I
> have to manually change the output between the different paths.

You don't necessarily have to do everything at the kernel level, it's 
not uncommon to have the driver set a kcontrol for jack detection, and 
let userspace change settings on a jack detection event. PulseAudio 
relies on UCM JackControl to switch to Headphones and Headset devices.

> Additionally, while the codec "technically" has dual channel inputs
> for the microphone, I'm only using the L channel. Should I have a
> stereo mixer? Note that I'm using the simple-audio-card to set my
> paths, widgets, and the gpio pin. They all work, just not seamlessly
> together.
> 
> Basically, I'm wanting to know if and how I should set up my audio
> paths for the speaker and headphones, they use mostly the same pins
> and only really differ in setting the external amp settings.
> Additionally, once I set up my paths how do I ensure that the GPIO
> events will result in switching between the speaker/headphone path?
> 
> Any help you can provide is appreciated. This is my first attempt at
> something of this magnitude (for me it's a big step), even if it's
> just trying to facilitate in getting a vendor's code ready for upstream.

> --- /dev/null
> +++ b/sound/soc/codecs/rk817_codec.c
> @@ -0,0 +1,1148 @@
> +/*
> + * Copyright (c) 2018 Rockchip Electronics Co. Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

remove and replace by an SPDX line.

> +static int rk817_playback_path_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
> +	long int pre_path;

it's uncommon to see this, use either int or u32/u64 if your require a 
specific size.

> +
> +	if (rk817->playback_path == ucontrol->value.integer.value[0]) {
> +		return 0;
> +	}
> +
> +	pre_path = rk817->playback_path;

'pre' as in 'previous' or 'preamp' or as opposed to 'post'?

> +	rk817->playback_path = ucontrol->value.integer.value[0];
> +
> +	if (rk817->playback_path != OFF)
> +		clk_prepare_enable(rk817->mclk);
> +	else
> +		clk_disable_unprepare(rk817->mclk);
> +
> +	switch (rk817->playback_path) {
> +	case OFF:
> +		if (pre_path != OFF && pre_path != HP_PATH) {
> +			rk817_codec_power_down(component, RK817_CODEC_PLAYBACK);
> +			if (rk817->capture_path == 0)
> +				rk817_codec_power_down(component, RK817_CODEC_ALL);
> +		}
> +		break;
> +	case SPK_PATH:
> +		if (pre_path == OFF)
> +			rk817_codec_power_up(component, RK817_CODEC_PLAYBACK);
> +		if (!rk817->use_ext_amplifier) {
> +			/* power on dac ibias/l/r */
> +			snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
> +						PWD_DACBIAS_ON | PWD_DACD_ON |
> +						PWD_DACL_DOWN | PWD_DACR_DOWN);
> +			/* CLASS D mode, combine LR channels */
> +			snd_soc_component_write(component,
> +						RK817_CODEC_DDAC_MUTE_MIXCTL,
> +						0x10);
> +			/* CLASS D enable */
> +			snd_soc_component_write(component,
> +						RK817_CODEC_ACLASSD_CFG1,
> +						0xa5);
> +			/* restart CLASS D, OCPP/N */
> +			snd_soc_component_write(component,
> +						RK817_CODEC_ACLASSD_CFG2,
> +						0xf7);
> +		} else {
> +			/* HP_CP_EN , CP 2.3V */
> +			snd_soc_component_write(component, RK817_CODEC_AHP_CP,
> +						0x11);
> +			/* power on HP two stage opamp ,HP amplitude 0db */
> +			snd_soc_component_write(component, RK817_CODEC_AHP_CFG0,
> +						0x80);
> +			/* power on dac ibias/l/r */
> +			snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
> +						PWD_DACBIAS_ON | PWD_DACD_DOWN |
> +						PWD_DACL_ON | PWD_DACR_ON);
> +			snd_soc_component_update_bits(component,
> +						      RK817_CODEC_DDAC_MUTE_MIXCTL,
> +						      DACMT_ENABLE, DACMT_DISABLE);
> +		}
> +		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLL,
> +					rk817->spk_volume);
> +		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLR,
> +					rk817->spk_volume);
> +		break;
> +	case HP_PATH:
> +		if (pre_path == OFF)
> +			rk817_codec_power_up(component, RK817_CODEC_PLAYBACK);
> +		/* HP_CP_EN , CP 2.3V */
> +		snd_soc_component_write(component, RK817_CODEC_AHP_CP, 0x11);
> +		/* power on HP two stage opamp ,HP amplitude 0db */
> +		snd_soc_component_write(component, RK817_CODEC_AHP_CFG0, 0x80);
> +		/* power on dac ibias/l/r */
> +		snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
> +					PWD_DACBIAS_ON | PWD_DACD_DOWN |
> +					PWD_DACL_ON | PWD_DACR_ON);
> +		/* CLASS D mode disable, split LR channels */
> +		snd_soc_component_write(component,
> +					RK817_CODEC_DDAC_MUTE_MIXCTL,
> +					0x00);
> +
> +		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLL,
> +					rk817->hp_volume);
> +		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLR,
> +					rk817->hp_volume);
> +		break;
> +	case SPK_HP:
> +		if (pre_path == OFF)
> +			rk817_codec_power_up(component, RK817_CODEC_PLAYBACK);
> +
> +		/* HP_CP_EN , CP 2.3V  */
> +		snd_soc_component_write(component, RK817_CODEC_AHP_CP, 0x11);
> +		/* power on HP two stage opamp ,HP amplitude 0db */
> +		snd_soc_component_write(component, RK817_CODEC_AHP_CFG0, 0x80);
> +
> +		/* power on dac ibias/l/r */
> +		snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
> +					PWD_DACBIAS_ON | PWD_DACD_ON |
> +					PWD_DACL_ON | PWD_DACR_ON);
> +
> +		if (!rk817->use_ext_amplifier) {
> +			/* CLASS D mode, combine LR channels */
> +			snd_soc_component_write(component,
> +						RK817_CODEC_DDAC_MUTE_MIXCTL,
> +						0x10);
> +			/* CLASS D enable */
> +			snd_soc_component_write(component,
> +						RK817_CODEC_ACLASSD_CFG1,
> +						0xa5);
> +			/* restart CLASS D, OCPP/N */
> +			snd_soc_component_write(component,
> +						RK817_CODEC_ACLASSD_CFG2,
> +						0xf7);
> +		}
> +
> +		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLL,
> +					rk817->hp_volume);
> +		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLR,
> +					rk817->hp_volume);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rk817_capture_path_get(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
> +
> +	dev_dbg(component->dev, "%s:capture_path %ld\n", __func__, rk817->capture_path);
> +	ucontrol->value.integer.value[0] = rk817->capture_path;
> +	return 0;
> +}
> +
> +static int rk817_capture_path_put(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
> +	long int pre_path;
> +
> +	if (rk817->capture_path == ucontrol->value.integer.value[0]) {
> +		dev_dbg(component->dev, "%s:capture_path is not changed!\n",
> +			__func__);
> +		return 0;
> +	}
> +
> +	pre_path = rk817->capture_path;
> +	rk817->capture_path = ucontrol->value.integer.value[0];
> +
> +	if (rk817->capture_path != MIC_OFF)
> +		clk_prepare_enable(rk817->mclk);
> +	else
> +		clk_disable_unprepare(rk817->mclk);
> +
> +	switch (rk817->capture_path) {
> +	case MIC_OFF:
> +		if (pre_path != MIC_OFF)
> +			rk817_codec_power_down(component, RK817_CODEC_CAPTURE);
> +		break;
> +	case MIC:
> +		if (pre_path == MIC_OFF)
> +			rk817_codec_power_up(component, RK817_CODEC_CAPTURE);

these sequences look like trying to bypass DAPM or re-invent it with 
custom state machines.

> +
> +		if (rk817->adc_for_loopback) {
> +			/* don't need to gain when adc use for loopback */
> +			snd_soc_component_update_bits(component,
> +						      RK817_CODEC_AMIC_CFG0,
> +						      0xf,
> +						      0x0);
> +			snd_soc_component_write(component,
> +						RK817_CODEC_DMIC_PGA_GAIN,
> +						0x66);
> +			snd_soc_component_write(component,
> +						RK817_CODEC_DADC_VOLL,
> +						0x00);
> +			snd_soc_component_write(component,
> +						RK817_CODEC_DADC_VOLR,
> +						0x00);
> +			break;
> +		}
> +		if (!rk817->mic_in_differential) {
> +			snd_soc_component_write(component,
> +						RK817_CODEC_DADC_VOLR,
> +						0xff);
> +			snd_soc_component_update_bits(component,
> +						      RK817_CODEC_AADC_CFG0,
> +						      ADC_R_PWD_MASK,
> +						      ADC_R_PWD_EN);
> +			snd_soc_component_update_bits(component,
> +						      RK817_CODEC_AMIC_CFG0,
> +						      PWD_PGA_R_MASK,
> +						      PWD_PGA_R_EN);
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
[...]

> +static int rk817_codec_parse_dt_property(struct device *dev,
> +					 struct rk817_codec_priv *rk817)
> +{
> +	struct device_node *node = dev->parent->of_node;
> +	int ret;
> +
> +	if (!node) {
> +		dev_err(dev, "%s() dev->parent->of_node is NULL\n",
> +			__func__);
> +		return -ENODEV;
> +	}
> +
> +	node = of_get_child_by_name(dev->parent->of_node, "codec");
> +	if (!node) {
> +		dev_err(dev, "%s() Can not get child: codec\n",
> +			__func__);
> +		return -ENODEV;
> +	}
> +
> +	rk817->hp_ctl_gpio = devm_gpiod_get_optional(dev, "hp-ctl",
> +						  GPIOD_OUT_LOW);
> +
> +	rk817->spk_ctl_gpio = devm_gpiod_get_optional(dev, "spk-ctl",
> +						  GPIOD_OUT_LOW);
> +
> +	ret = of_property_read_u32(node, "spk-mute-delay-ms",
> +				   &rk817->spk_mute_delay);
> +	if (ret < 0) {
> +		rk817->spk_mute_delay = 0;
> +	}
> +
> +	ret = of_property_read_u32(node, "hp-mute-delay-ms",
> +				   &rk817->hp_mute_delay);
> +	if (ret < 0) {
> +		rk817->hp_mute_delay = 0;
> +	}
> +
> +	ret = of_property_read_u32(node, "spk-volume", &rk817->spk_volume);
> +	if (ret < 0) {
> +		rk817->spk_volume = OUT_VOLUME;
> +	}
> +	if (rk817->spk_volume < 3)
> +		rk817->spk_volume = 3;
> +
> +	ret = of_property_read_u32(node, "hp-volume",
> +				   &rk817->hp_volume);
> +	if (ret < 0) {
> +		rk817->hp_volume = OUT_VOLUME;
> +	}
> +	if (rk817->hp_volume < 3)
> +		rk817->hp_volume = 3;
> +
> +	ret = of_property_read_u32(node, "capture-volume",
> +				   &rk817->capture_volume);
> +	if (ret < 0) {
> +		rk817->capture_volume = CAPTURE_VOLUME;
> +	}
> +
> +	rk817->mic_in_differential =
> +			of_property_read_bool(node, "mic-in-differential");
> +
> +	rk817->pdmdata_out_enable =
> +			of_property_read_bool(node, "pdmdata-out-enable");
> +
> +	rk817->use_ext_amplifier =
> +			of_property_read_bool(node, "use-ext-amplifier");
> +
> +	rk817->adc_for_loopback =
> +			of_property_read_bool(node, "adc-for-loopback");

you will need DT bindings for all these properties.

> +
> +	return 0;
> +}
> +
> +static const struct regmap_config rk817_codec_regmap_config = {
> +	.name = "rk817-codec",
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.reg_stride = 1,
> +	.max_register = 0x4f,
> +	.cache_type = REGCACHE_NONE,
> +	.volatile_reg = rk817_volatile_register,
> +	.writeable_reg = rk817_codec_register,
> +	.readable_reg = rk817_codec_register,
> +	.reg_defaults = rk817_reg_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(rk817_reg_defaults),
> +};
> +
> +static int rk817_platform_probe(struct platform_device *pdev)
> +{
> +	struct rk808 *rk817 = dev_get_drvdata(pdev->dev.parent);
> +	struct rk817_codec_priv *rk817_codec_data;
> +	int ret;
> +
> +	if (!rk817) {
> +		dev_err(&pdev->dev, "%s : rk817 is NULL\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	rk817_codec_data = devm_kzalloc(&pdev->dev,
> +					sizeof(struct rk817_codec_priv),
> +					GFP_KERNEL);
> +	if (!rk817_codec_data)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, rk817_codec_data);
> +
> +	ret = rk817_codec_parse_dt_property(&pdev->dev, rk817_codec_data);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "%s() parse device tree property error %d\n",
> +			__func__, ret);
> +		goto err_;
> +	}
> +
> +	rk817_codec_data->regmap = devm_regmap_init_i2c(rk817->i2c,
> +					    &rk817_codec_regmap_config);
> +	if (IS_ERR(rk817_codec_data->regmap)) {
> +		ret = PTR_ERR(rk817_codec_data->regmap);
> +		dev_err(&pdev->dev, "failed to allocate register map: %d\n",
> +			ret);
> +		goto err_;
> +	}
> +
> +	rk817_codec_data->mclk = devm_clk_get(&pdev->dev, "mclk");
> +	if (IS_ERR(rk817_codec_data->mclk)) {
> +		dev_err(&pdev->dev, "Unable to get mclk\n");
> +		ret = -ENXIO;
> +		goto err_;
> +	}
> +
> +	ret = devm_snd_soc_register_component(&pdev->dev, &soc_codec_dev_rk817,
> +					      rk817_dai, ARRAY_SIZE(rk817_dai));
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "%s() register codec error %d\n",
> +			__func__, ret);
> +		goto err_;
> +	}
> +
> +	return 0;
> +err_:
> +
> +	return ret;
> +}
> +
> +static int rk817_platform_remove(struct platform_device *pdev)
> +{
> +	snd_soc_unregister_component(&pdev->dev);

humm, that looks like a bug. If you used devm_soc_register_component() 
in the probe, you don't need to release it here manually?


> +++ b/sound/soc/codecs/rk817_codec.h
> @@ -0,0 +1,197 @@
> +/*
> + * Copyright (c) 2018 Rockchip Electronics Co. Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

remove and use SPDX


