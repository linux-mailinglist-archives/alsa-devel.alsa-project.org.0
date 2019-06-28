Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C4559E3C
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 16:52:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F7E21662;
	Fri, 28 Jun 2019 16:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F7E21662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561733557;
	bh=41ilc4fV7odcSLljqPdbTaERGtQyPwJ9GAF9DM9Bboc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iJHBOQmAKTzjWcRHP+DzylfGnTFSSKRoYppPFHu8vDZxTiCtXzf1TWlGGAEkdao7j
	 f3Kld1SCvP5bagvCseAUxu+mEv1ZruTLW3STFWjOMLSrko/7Xe381q6QDkpChCOqpd
	 4EHH4rrSvEq3AiyoOuBotPvSzx4jw12gT2b2Cifs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 090D1F896CC;
	Fri, 28 Jun 2019 16:50:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05F28F896B9; Fri, 28 Jun 2019 16:50:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62DEAF80058
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 16:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62DEAF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yHyY0Y8+"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5SEoh35124011;
 Fri, 28 Jun 2019 09:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1561733443;
 bh=xTs4w2DViA8p2pJNSIGBC3IeWH6KyBB24wAIbdMUV5E=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yHyY0Y8+gpqQzpSlqU6z2zcjFYtiqdITQFQfntBs8W9KnhBHYJ54lBWG2Wc2PdwQJ
 KiPdGxlcWUyqEQfXZTID3hfAl7QIpUEUo06VpHxRnfTps7DuF6nOro+RSMftel9fnq
 Jg1N44pLX9k2XcsmtKJTbCN8REyVfQL2DElQHYYM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5SEohRL128145
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 28 Jun 2019 09:50:43 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 28
 Jun 2019 09:50:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 28 Jun 2019 09:50:43 -0500
Received: from [10.250.68.219] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5SEogLt114103;
 Fri, 28 Jun 2019 09:50:42 -0500
To: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Andreas Dannenberg
 <dannenberg@ti.com>, Kate Stewart <kstewart@linuxfoundation.org>
References: <20190628123416.16298-1-nikolaus.voss@loewensteinmedical.de>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <ec84d05f-af14-33dd-5f04-6e5525baf138@ti.com>
Date: Fri, 28 Jun 2019 10:50:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190628123416.16298-1-nikolaus.voss@loewensteinmedical.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, nv@vosn.de
Subject: Re: [alsa-devel] [PATCH] sound/soc/codecs/tas5720.c: add ACPI
	support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 6/28/19 8:34 AM, Nikolaus Voss wrote:
> Add support for ACPI enumeration for tas5720 and tas5722.
> Use device_match API to unify access to driver data for DT and ACPI.
> Aggregate variant stuff into its own struct and directly reference
> it in variant data for i2c/of/acpi_device_id.
> 
> Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
> ---
>  sound/soc/codecs/tas5720.c | 215 +++++++++++++++++--------------------
>  1 file changed, 99 insertions(+), 116 deletions(-)
> 
> diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
> index 37fab8f22800..ea973764c745 100644
> --- a/sound/soc/codecs/tas5720.c
> +++ b/sound/soc/codecs/tas5720.c
> @@ -7,6 +7,7 @@
>   * Author: Andreas Dannenberg <dannenberg@ti.com>
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/module.h>
>  #include <linux/errno.h>
>  #include <linux/device.h>
> @@ -28,9 +29,10 @@
>  /* Define how often to check (and clear) the fault status register (in ms) */
>  #define TAS5720_FAULT_CHECK_INTERVAL		200
>  
> -enum tas572x_type {
> -	TAS5720,
> -	TAS5722,
> +struct tas5720_variant {
> +	const int device_id;
> +	const struct regmap_config reg_config;
> +	const struct snd_soc_component_driver comp_drv;
>  };
>  
>  static const char * const tas5720_supply_names[] = {
> @@ -44,7 +46,7 @@ struct tas5720_data {
>  	struct snd_soc_component *component;
>  	struct regmap *regmap;
>  	struct i2c_client *tas5720_client;
> -	enum tas572x_type devtype;
> +	const struct tas5720_variant *variant;
>  	struct regulator_bulk_data supplies[TAS5720_NUM_SUPPLIES];
>  	struct delayed_work fault_check_work;
>  	unsigned int last_fault;
> @@ -179,17 +181,13 @@ static int tas5720_set_dai_tdm_slot(struct snd_soc_dai *dai,
>  		goto error_snd_soc_component_update_bits;
>  
>  	/* Configure TDM slot width. This is only applicable to TAS5722. */
> -	switch (tas5720->devtype) {
> -	case TAS5722:
> +	if (tas5720->variant->device_id == TAS5722_DEVICE_ID) {
>  		ret = snd_soc_component_update_bits(component, TAS5722_DIGITAL_CTRL2_REG,
>  						    TAS5722_TDM_SLOT_16B,
>  						    slot_width == 16 ?
>  						    TAS5722_TDM_SLOT_16B : 0);
>  		if (ret < 0)
>  			goto error_snd_soc_component_update_bits;
> -		break;
> -	default:
> -		break;
>  	}
>  
>  	return 0;
> @@ -277,7 +275,7 @@ static void tas5720_fault_check_work(struct work_struct *work)
>  static int tas5720_codec_probe(struct snd_soc_component *component)
>  {
>  	struct tas5720_data *tas5720 = snd_soc_component_get_drvdata(component);
> -	unsigned int device_id, expected_device_id;
> +	unsigned int device_id;
>  	int ret;
>  
>  	tas5720->component = component;
> @@ -301,21 +299,9 @@ static int tas5720_codec_probe(struct snd_soc_component *component)
>  		goto probe_fail;
>  	}
>  
> -	switch (tas5720->devtype) {
> -	case TAS5720:
> -		expected_device_id = TAS5720_DEVICE_ID;
> -		break;
> -	case TAS5722:
> -		expected_device_id = TAS5722_DEVICE_ID;
> -		break;
> -	default:
> -		dev_err(component->dev, "unexpected private driver data\n");
> -		return -EINVAL;
> -	}
> -
> -	if (device_id != expected_device_id)
> +	if (device_id != tas5720->variant->device_id)
>  		dev_warn(component->dev, "wrong device ID. expected: %u read: %u\n",
> -			 expected_device_id, device_id);
> +			 tas5720->variant->device_id, device_id);
>  
>  	/* Set device to mute */
>  	ret = snd_soc_component_update_bits(component, TAS5720_DIGITAL_CTRL2_REG,
> @@ -462,24 +448,6 @@ static bool tas5720_is_volatile_reg(struct device *dev, unsigned int reg)
>  	}
>  }
>  
> -static const struct regmap_config tas5720_regmap_config = {
> -	.reg_bits = 8,
> -	.val_bits = 8,
> -
> -	.max_register = TAS5720_MAX_REG,
> -	.cache_type = REGCACHE_RBTREE,
> -	.volatile_reg = tas5720_is_volatile_reg,
> -};
> -
> -static const struct regmap_config tas5722_regmap_config = {
> -	.reg_bits = 8,
> -	.val_bits = 8,
> -
> -	.max_register = TAS5722_MAX_REG,
> -	.cache_type = REGCACHE_RBTREE,
> -	.volatile_reg = tas5720_is_volatile_reg,
> -};
> -
>  /*
>   * DAC analog gain. There are four discrete values to select from, ranging
>   * from 19.2 dB to 26.3dB.
> @@ -558,40 +526,6 @@ static const struct snd_soc_dapm_route tas5720_audio_map[] = {
>  	{ "OUT", NULL, "DAC" },
>  };
>  
> -static const struct snd_soc_component_driver soc_component_dev_tas5720 = {
> -	.probe			= tas5720_codec_probe,
> -	.remove			= tas5720_codec_remove,
> -	.suspend		= tas5720_suspend,
> -	.resume			= tas5720_resume,
> -	.controls		= tas5720_snd_controls,
> -	.num_controls		= ARRAY_SIZE(tas5720_snd_controls),
> -	.dapm_widgets		= tas5720_dapm_widgets,
> -	.num_dapm_widgets	= ARRAY_SIZE(tas5720_dapm_widgets),
> -	.dapm_routes		= tas5720_audio_map,
> -	.num_dapm_routes	= ARRAY_SIZE(tas5720_audio_map),
> -	.idle_bias_on		= 1,
> -	.use_pmdown_time	= 1,
> -	.endianness		= 1,
> -	.non_legacy_dai_naming	= 1,
> -};
> -
> -static const struct snd_soc_component_driver soc_component_dev_tas5722 = {
> -	.probe = tas5720_codec_probe,
> -	.remove = tas5720_codec_remove,
> -	.suspend = tas5720_suspend,
> -	.resume = tas5720_resume,
> -	.controls = tas5722_snd_controls,
> -	.num_controls = ARRAY_SIZE(tas5722_snd_controls),
> -	.dapm_widgets = tas5720_dapm_widgets,
> -	.num_dapm_widgets = ARRAY_SIZE(tas5720_dapm_widgets),
> -	.dapm_routes = tas5720_audio_map,
> -	.num_dapm_routes = ARRAY_SIZE(tas5720_audio_map),
> -	.idle_bias_on		= 1,
> -	.use_pmdown_time	= 1,
> -	.endianness		= 1,
> -	.non_legacy_dai_naming	= 1,
> -};
> -
>  /* PCM rates supported by the TAS5720 driver */
>  #define TAS5720_RATES	(SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |\
>  			 SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000)
> @@ -637,29 +571,25 @@ static int tas5720_probe(struct i2c_client *client,
>  {
>  	struct device *dev = &client->dev;
>  	struct tas5720_data *data;
> -	const struct regmap_config *regmap_config;
> +	const struct tas5720_variant *type;
>  	int ret;
>  	int i;
>  
> +	type = device_get_match_data(&client->dev);
> +	if (!type && id)
> +		type = (const struct tas5720_variant *)id->driver_data;
> +
> +	if (!type)
> +		return -EINVAL;
> +
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
>  
>  	data->tas5720_client = client;
> -	data->devtype = id->driver_data;
> +	data->variant = type;
>  
> -	switch (id->driver_data) {
> -	case TAS5720:
> -		regmap_config = &tas5720_regmap_config;
> -		break;
> -	case TAS5722:
> -		regmap_config = &tas5722_regmap_config;
> -		break;
> -	default:
> -		dev_err(dev, "unexpected private driver data\n");
> -		return -EINVAL;
> -	}
> -	data->regmap = devm_regmap_init_i2c(client, regmap_config);
> +	data->regmap = devm_regmap_init_i2c(client, &type->reg_config);
>  	if (IS_ERR(data->regmap)) {
>  		ret = PTR_ERR(data->regmap);
>  		dev_err(dev, "failed to allocate register map: %d\n", ret);
> @@ -678,51 +608,104 @@ static int tas5720_probe(struct i2c_client *client,
>  
>  	dev_set_drvdata(dev, data);
>  
> -	switch (id->driver_data) {
> -	case TAS5720:
> -		ret = devm_snd_soc_register_component(&client->dev,
> -					&soc_component_dev_tas5720,
> -					tas5720_dai,
> -					ARRAY_SIZE(tas5720_dai));
> -		break;
> -	case TAS5722:
> -		ret = devm_snd_soc_register_component(&client->dev,
> -					&soc_component_dev_tas5722,
> -					tas5720_dai,
> -					ARRAY_SIZE(tas5720_dai));
> -		break;
> -	default:
> -		dev_err(dev, "unexpected private driver data\n");
> -		return -EINVAL;
> -	}
> -	if (ret < 0) {
> -		dev_err(dev, "failed to register component: %d\n", ret);
> -		return ret;
> -	}
> +	ret = devm_snd_soc_register_component(&client->dev,
> +					      &type->comp_drv,
> +					      tas5720_dai,
> +					      ARRAY_SIZE(tas5720_dai));
>  
> -	return 0;
> +	if (ret < 0)
> +		dev_err(dev, "failed to register component: %d\n", ret);
> +
> +	return ret;
>  }
>  
> +static const struct tas5720_variant variant[] = {
> +	{
> +		.device_id = TAS5720_DEVICE_ID,
> +		.reg_config = {


This patch would be a lot more simple if you leave the regmap_config and
snd_soc_component_driver definitions where they are above and just store
a pointer to them down here in this new struct. That also would allow
for new devices to use them in this list should they ever match.

If you really want to move the data down here for some reason, do it in
a separate patch at least, this isn't needed as part of adding ACPI support.

Andrew

> +			.reg_bits = 8,
> +			.val_bits = 8,
> +
> +			.max_register = TAS5720_MAX_REG,
> +			.cache_type = REGCACHE_RBTREE,
> +			.volatile_reg = tas5720_is_volatile_reg,
> +		},
> +		.comp_drv = {
> +			.probe = tas5720_codec_probe,
> +			.remove = tas5720_codec_remove,
> +			.suspend = tas5720_suspend,
> +			.resume = tas5720_resume,
> +			.controls = tas5720_snd_controls,
> +			.num_controls = ARRAY_SIZE(tas5720_snd_controls),
> +			.dapm_widgets = tas5720_dapm_widgets,
> +			.num_dapm_widgets = ARRAY_SIZE(tas5720_dapm_widgets),
> +			.dapm_routes = tas5720_audio_map,
> +			.num_dapm_routes = ARRAY_SIZE(tas5720_audio_map),
> +			.idle_bias_on = 1,
> +			.use_pmdown_time = 1,
> +			.endianness = 1,
> +			.non_legacy_dai_naming = 1
> +		},
> +	},
> +	{
> +		.device_id = TAS5722_DEVICE_ID,
> +		.reg_config = {
> +			.reg_bits = 8,
> +			.val_bits = 8,
> +
> +			.max_register = TAS5722_MAX_REG,
> +			.cache_type = REGCACHE_RBTREE,
> +			.volatile_reg = tas5720_is_volatile_reg,
> +		},
> +		.comp_drv = {
> +			.probe = tas5720_codec_probe,
> +			.remove = tas5720_codec_remove,
> +			.suspend = tas5720_suspend,
> +			.resume = tas5720_resume,
> +			.controls = tas5722_snd_controls,
> +			.num_controls = ARRAY_SIZE(tas5722_snd_controls),
> +			.dapm_widgets = tas5720_dapm_widgets,
> +			.num_dapm_widgets = ARRAY_SIZE(tas5720_dapm_widgets),
> +			.dapm_routes = tas5720_audio_map,
> +			.num_dapm_routes = ARRAY_SIZE(tas5720_audio_map),
> +			.idle_bias_on = 1,
> +			.use_pmdown_time = 1,
> +			.endianness = 1,
> +			.non_legacy_dai_naming = 1,
> +		},
> +	},
> +};
> +
>  static const struct i2c_device_id tas5720_id[] = {
> -	{ "tas5720", TAS5720 },
> -	{ "tas5722", TAS5722 },
> +	{ "tas5720", (kernel_ulong_t)&variant[0] },
> +	{ "tas5722", (kernel_ulong_t)&variant[1] },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tas5720_id);
>  
>  #if IS_ENABLED(CONFIG_OF)
>  static const struct of_device_id tas5720_of_match[] = {
> -	{ .compatible = "ti,tas5720", },
> -	{ .compatible = "ti,tas5722", },
> +	{ .compatible = "ti,tas5720", .data = &variant[0], },
> +	{ .compatible = "ti,tas5722", .data = &variant[1], },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, tas5720_of_match);
>  #endif
>  
> +#if IS_ENABLED(CONFIG_ACPI)
> +static const struct acpi_device_id tas5720_acpi_match[] = {
> +	{ "10TI5720", (kernel_ulong_t)&variant[0] },
> +	{ "10TI5722", (kernel_ulong_t)&variant[1] },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, tas5720_acpi_match);
> +#endif
> +
>  static struct i2c_driver tas5720_i2c_driver = {
>  	.driver = {
>  		.name = "tas5720",
>  		.of_match_table = of_match_ptr(tas5720_of_match),
> +		.acpi_match_table = ACPI_PTR(tas5720_acpi_match),
>  	},
>  	.probe = tas5720_probe,
>  	.id_table = tas5720_id,
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
