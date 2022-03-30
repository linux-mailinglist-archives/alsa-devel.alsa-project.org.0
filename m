Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA94ECA9D
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 19:26:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2696F168D;
	Wed, 30 Mar 2022 19:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2696F168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648661205;
	bh=i2ogFDs1/hB7tL86M3lTMBtLHed1a3thNCG6Yx4HssU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hBRF91iTTgh6WBbJktE6r8w8VrwBFdYW+8NexKPKGsWLyd8bUO0KJUDbT5wN0Cx7q
	 IdfhynN/po33SvFxTURLgvWClu6z4+LqCqOU6zVeTMiY/GvKM23pctFQVV5cnd5XQg
	 rOYTy1VWs1+H7NUY4JeQQW+yMLz3GU6ReCLALAcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ED5AF800F2;
	Wed, 30 Mar 2022 19:25:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95439F80254; Wed, 30 Mar 2022 19:25:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBA22F80253
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 19:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBA22F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FSCqcuIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648661131; x=1680197131;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=i2ogFDs1/hB7tL86M3lTMBtLHed1a3thNCG6Yx4HssU=;
 b=FSCqcuIbzQgXeAYxhFNM4X7jFWLb+4y0f4aitgqjDemPSTxiPMpQcLlE
 hiwAQGXqGJXs2WAntCbDjpKJqXWOtVpnonzeYKt6Q6F/2QilrZ7BCNsNs
 L0H9aJikdc8fOZJuMWBYkom6T+X4SVImgE/Kk1r8W3A0ZVMwNdKptYiy1
 5LDYVJUc4iO53A++8jkAyaPkxTINq+LtNmemqbsx2P3rKKdK+8ETRkdMJ
 KQ4DABWAGgZavLFfrJM1lZITSQVP6y9xgRcB0d+OEA89vrxtAaQVGDqA8
 a9VLuB4eDKizMTTLzwUCHjcmQLGWSSa18msxLDd39aUAMO89Ysvlnm6aU Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="346036720"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="346036720"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 10:25:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="565667617"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.89])
 ([10.99.241.89])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 10:25:25 -0700
Message-ID: <cf1df576-7861-d74c-6f50-86bebed0c850@linux.intel.com>
Date: Wed, 30 Mar 2022 19:25:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 4/4] update tas27xx.c to support either TAS2764 or
 TAS2780
Content-Language: en-US
To: Raphael-Xu <13691752556@139.com>, broonie@kernel.org
References: <20220330144526.498-1-13691752556@139.com>
 <20220330144526.498-4-13691752556@139.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220330144526.498-4-13691752556@139.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, raphael-xu@ti.com, shenghao-ding@ti.com,
 navada@ti.com
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

On 3/30/2022 4:45 PM, Raphael-Xu wrote:

Missing commit message in this patch and previous one. Even one sentence 
explaining what you are doing and why is better then nothing.

Overall the series looks a lot better now, I still wonder if changing 
coding style makes sense, but ultimately it's your code, so as long as 
it patches checkpatch I will leave decision to Mark.

And there are few nitpicks, below in this patch.

> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>   sound/soc/codecs/tas27xx.c | 378 ++++++++++++++++++++++++++-----------
>   1 file changed, 263 insertions(+), 115 deletions(-)
> 
> diff --git a/sound/soc/codecs/tas27xx.c b/sound/soc/codecs/tas27xx.c
> index 8118429bb2f5..bb845d4797ce 100644
> --- a/sound/soc/codecs/tas27xx.c
> +++ b/sound/soc/codecs/tas27xx.c

...

> @@ -146,8 +182,9 @@ static int tas27xx_dac_event(struct snd_soc_dapm_widget *w,
>   		snd_soc_dapm_to_component(w->dapm);
>   	struct tas27xx_priv *tas27xx =
>   		snd_soc_component_get_drvdata(component);
> -	int ret;
> +	int ret = 0;
>   
> +	mutex_lock(&tas27xx->codec_lock);
>   	switch (event) {
>   	case SND_SOC_DAPM_POST_PMU:
>   		ret = snd_soc_component_update_bits(component,
> @@ -163,13 +200,16 @@ static int tas27xx_dac_event(struct snd_soc_dapm_widget *w,
>   		break;
>   	default:
>   		dev_err(tas27xx->dev, "Unsupported event\n");
> -		return -EINVAL;
> +			ret = -EINVAL;

There seems to be one tab to many here.

>   	}
> -
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> +	if (ret < 0) {
> +		pr_err("%s:%u:errCode:0x%0x:PWR_CTRL error\n",
> +			__func__, __LINE__, ret);
> +	} else {
> +		ret = 0;
> +	}
> +	mutex_unlock(&tas27xx->codec_lock);
> +	return ret;
>   }
>   
>   static const struct snd_kcontrol_new isense_switch =
> @@ -207,55 +247,96 @@ static const struct snd_soc_dapm_route tas27xx_audio_map[] = {
>   static int tas27xx_mute(struct snd_soc_dai *dai, int mute, int direction)
>   {
>   	struct snd_soc_component *component = dai->component;
> -	int ret;
> +	struct tas27xx_priv *tas27xx =
> +		snd_soc_component_get_drvdata(component);
> +	int ret = 0;
> +	
> +	mutex_lock(&tas27xx->codec_lock);
>   
> +	if (mute == 0) {

alternatively if (!mute), but you can leave as is

> +		ret = snd_soc_component_update_bits(component,
> +			TAS27XX_CLK_CFG,
> +			TAS27XX_CLK_CFG_MASK,
> +			TAS27XX_CLK_CFG_ENABLE);
> +		if (ret < 0) {
> +			dev_err(tas27xx->dev,
> +				"%s:%u: Failed to CLK_CFG_ENABLE\n",
> +				__func__, __LINE__);
> +			goto EXIT;
> +		}
> +		usleep_range(2000, 2000);
> +	}
>   	ret = snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
> -					    TAS27XX_PWR_CTRL_MASK,
> -					    mute ? TAS27XX_PWR_CTRL_MUTE : 0);
> -
> -	if (ret < 0)
> -		return ret;
> +		TAS27XX_PWR_CTRL_MASK,
> +		mute ? TAS27XX_PWR_CTRL_MUTE : 0);
> +	if (ret >= 0) {
> +		tas27xx->mb_power_up = mute?false:true;
> +		ret = 0;
> +	}
>   
> -	return 0;
> +	if (ret < 0) {

You could probably just use } else { here with above if.

> +		pr_err("%s:%u: Failed to set powercontrol\n",
> +			__func__, __LINE__);
> +	}
> +EXIT:
> +	mutex_unlock(&tas27xx->codec_lock);
> +	return ret;
>   }
>   

...

>   
>   static const struct snd_soc_dai_ops tas27xx_dai_ops = {
> @@ -495,13 +615,13 @@ static struct snd_soc_dai_driver tas27xx_dai_driver[] = {
>   		},
>   		.capture = {
>   			.stream_name    = "ASI1 Capture",
> -			.channels_min   = 0,
> +			.channels_min   = 1,
>   			.channels_max   = 2,
>   			.rates = TAS27XX_RATES,
>   			.formats = TAS27XX_FORMATS,
>   		},
>   		.ops = &tas27xx_dai_ops,
> -		.symmetric_rate = 1,
> +		.symmetric_rates = 1,

I'm pretty sure struct snd_soc_dai_driver uses .symmetric_rate, so this 
change would result in build failure?

>   	},
>   };
>   
> @@ -509,7 +629,7 @@ static int tas27xx_codec_probe(struct snd_soc_component *component)
>   {
>   	struct tas27xx_priv *tas27xx =
>   		snd_soc_component_get_drvdata(component);
> -	int ret;
> +	int ret = 0;
>   
>   	tas27xx->component = component;
>   

...

>   
>   static DECLARE_TLV_DB_SCALE(tas27xx_digital_tlv, 1100, 50, 0);
> @@ -551,8 +685,10 @@ static const struct snd_kcontrol_new tas27xx_snd_controls[] = {
>   
>   static const struct snd_soc_component_driver soc_component_driver_tas27xx = {
>   	.probe			= tas27xx_codec_probe,
> +#ifdef CONFIG_PM
>   	.suspend		= tas27xx_codec_suspend,
>   	.resume			= tas27xx_codec_resume,
> +#endif
>   	.set_bias_level		= tas27xx_set_bias_level,
>   	.controls		= tas27xx_snd_controls,
>   	.num_controls		= ARRAY_SIZE(tas27xx_snd_controls),
> @@ -590,6 +726,12 @@ static const struct regmap_range_cfg tas27xx_regmap_ranges[] = {
>   	},
>   };
>   
> +static bool tas27xx_volatile(struct device *dev,
> +	unsigned int reg)
> +{
> +		return true;
> +}
> +

This seems bit weird, are all registers considered volatile?

>   static const struct regmap_config tas27xx_i2c_regmap = {
>   	.reg_bits = 8,
>   	.val_bits = 8,
> @@ -599,6 +741,7 @@ static const struct regmap_config tas27xx_i2c_regmap = {
>   	.ranges = tas27xx_regmap_ranges,
>   	.num_ranges = ARRAY_SIZE(tas27xx_regmap_ranges),
>   	.max_register = 1 * 128,
> +	.volatile_reg = tas27xx_volatile,
>   };
>   
>   static int tas27xx_parse_dt(struct device *dev, struct tas27xx_priv *tas27xx)

...
