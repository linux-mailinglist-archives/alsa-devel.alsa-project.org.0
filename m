Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D164E4E41
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 09:29:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B4FE16EE;
	Wed, 23 Mar 2022 09:28:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B4FE16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648024175;
	bh=ufti6nily+lAXiJEIWeXe33Luwfd2EWlze/Ssb6a0Eg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u9JG10IJrd6EYF2ZYVH2nTdfGSWlWN0Zdo3hq/Y+LgRdVSRJFyZsOCHj+ECHlO9FU
	 NPGUIj3G5Q17Ow5OlMM9j/6DWws/zj2ZRYSMulASQGdWYY/ynvWk9aZquaL4R+bHZa
	 4193MkY7vomrXDOiCJng59kRf/YkXPbM9o/ARkwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66EC3F80310;
	Wed, 23 Mar 2022 09:28:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68E59F802DB; Wed, 23 Mar 2022 09:28:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14F54F800AA
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 09:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14F54F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="m0Hkbnt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648024099; x=1679560099;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ufti6nily+lAXiJEIWeXe33Luwfd2EWlze/Ssb6a0Eg=;
 b=m0Hkbnt093Q8VD2POlK8/AasCIrEbMr94CK5mXu0jFB/BEKPBTgnfHco
 4NjlaI6ayI2FEl9StAoaZ7+PG7ZSImNdS3g3cew3bQ9JBHlLcyBlJHFuD
 /vHjkAZ9h4b9eProa9pXCNoR7Hf+Pj1G65ke92jZUcnG0gYL4dde/sOeb
 oRIoUYpobNXUom8RycdG+lAAEETm5ASvu4oBMiRnvIJutmB0DjybHQ6bl
 ST69P4GtFQo4L5n0hpRjAPwPAB/RiiKM66sikvyIAU0+7X0ttTQ2CYRnS
 PYAE8Xa25fmt25guNPLVgUgfRmCkqJV/qz+ZIFh5FWTrOFZRv/VKwzwCz A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="344487456"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="344487456"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 01:28:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="560796520"
Received: from arturlex-mobl1.ger.corp.intel.com (HELO [10.99.249.37])
 ([10.99.249.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 01:28:12 -0700
Message-ID: <9239b208-b67a-2f9e-e198-d92775965133@linux.intel.com>
Date: Wed, 23 Mar 2022 09:28:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/3] update tas27xx.c to support either TAS2764 or
 TAS2780
Content-Language: en-US
To: Raphael-Xu <13691752556@139.com>, broonie@kernel.org
References: <20220323042644.635-1-13691752556@139.com>
 <20220323042644.635-2-13691752556@139.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220323042644.635-2-13691752556@139.com>
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

On 3/23/2022 5:26 AM, Raphael-Xu wrote:
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>   sound/soc/codecs/tas27xx.c | 695 +++++++++++++++++++++++--------------
>   1 file changed, 434 insertions(+), 261 deletions(-)
> 
> diff --git a/sound/soc/codecs/tas27xx.c b/sound/soc/codecs/tas27xx.c
> index 9265af41c235..4a0ba32bdcdb 100644
> --- a/sound/soc/codecs/tas27xx.c
> +++ b/sound/soc/codecs/tas27xx.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0
> -//
> -// Driver for the Texas Instruments TAS2764 CODEC
> -// Copyright (C) 2020 Texas Instruments Inc.
> +// Driver for the Texas Instruments TAS2764/TAS2780 Mono
> +//		Audio amplifier
> +// Copyright (C) 2022 Texas Instruments Inc.
>   
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
> @@ -12,118 +12,158 @@
>   #include <linux/i2c.h>
>   #include <linux/gpio.h>
>   #include <linux/gpio/consumer.h>
> -#include <linux/regulator/consumer.h>
>   #include <linux/regmap.h>
>   #include <linux/of.h>
>   #include <linux/of_gpio.h>
> -#include <linux/slab.h>
>   #include <sound/soc.h>
>   #include <sound/pcm.h>
>   #include <sound/pcm_params.h>
>   #include <sound/initval.h>
>   #include <sound/tlv.h>
> +#include <linux/version.h>
>   
> -#include "tas2764.h"
> +#include "tas27xx.h"
>   
> -struct tas2764_priv {
> +struct tas27xx_priv {

I've scrolled through this patch, but it feels like there is too many 
things happening at the same time in it.
For example above renaming from tas2764 to tas27xx, feels to me like it 
should be part of separate patch.

>   	struct snd_soc_component *component;
>   	struct gpio_desc *reset_gpio;
>   	struct gpio_desc *sdz_gpio;
>   	struct regmap *regmap;
>   	struct device *dev;
> -	
> +	struct mutex codec_lock;
>   	int v_sense_slot;
>   	int i_sense_slot;
> +	int device_id;
> +	bool mbPowerUp;

Any reason not to follow naming convention of other variables:
bool mb_power_up;
?

>   };
>   
> -static void tas2764_reset(struct tas2764_priv *tas2764)
> +typedef enum tas27xx {
> +	TAS2764 = 0,
> +	TAS2780 = 1,
> +} tas27xx_t;
> +
> +static void tas27xx_reset(struct tas27xx_priv *tas27xx)
>   {
> -	if (tas2764->reset_gpio) {
> -		gpiod_set_value_cansleep(tas2764->reset_gpio, 0);
> +	if (tas27xx->reset_gpio) {
> +		gpiod_set_value_cansleep(tas27xx->reset_gpio, 0);
>   		msleep(20);
> -		gpiod_set_value_cansleep(tas2764->reset_gpio, 1);
> +		gpiod_set_value_cansleep(tas27xx->reset_gpio, 1);
>   	}
>   
> -	snd_soc_component_write(tas2764->component, TAS2764_SW_RST,
> +	snd_soc_component_write(tas27xx->component, TAS2764_SW_RST,
>   				TAS2764_RST);
>   }
>   
> -static int tas2764_set_bias_level(struct snd_soc_component *component,
> -				 enum snd_soc_bias_level level)
> +static int tas27xx_set_bias_level(
> +	struct snd_soc_component *component,
> +	enum snd_soc_bias_level level)
>   {
> -	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
> +	struct tas27xx_priv *tas27xx =
> +		snd_soc_component_get_drvdata(component);

Line limit was raised to 100 characters in kernel, and here as far as I 
can tell you don't even exceed 80 characters... so why break the line?

> +	int ret = 0;
>   
> +	mutex_lock(&tas27xx->codec_lock);
>   	switch (level) {
>   	case SND_SOC_BIAS_ON:
> -		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
> -					      TAS2764_PWR_CTRL_MASK,
> -					      TAS2764_PWR_CTRL_ACTIVE);
> +		ret = snd_soc_component_update_bits(component,
> +			TAS2764_PWR_CTRL,
> +			TAS2764_PWR_CTRL_MASK,
> +			TAS2764_PWR_CTRL_ACTIVE);
> +		if (ret >= 0) {
> +			tas27xx->mbPowerUp = true;
> +			ret = 0;
> +		}
>   		break;
>   	case SND_SOC_BIAS_STANDBY:
>   	case SND_SOC_BIAS_PREPARE:
> -		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
> -					      TAS2764_PWR_CTRL_MASK,
> -					      TAS2764_PWR_CTRL_MUTE);
> +		ret = snd_soc_component_update_bits(component,
> +			TAS2764_PWR_CTRL,
> +			TAS2764_PWR_CTRL_MASK,
> +			TAS2764_PWR_CTRL_MUTE);
> +		if (ret >= 0) {
> +			tas27xx->mbPowerUp = true;
> +			ret = 0;
> +		}
>   		break;
>   	case SND_SOC_BIAS_OFF:
> -		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
> -					      TAS2764_PWR_CTRL_MASK,
> -					      TAS2764_PWR_CTRL_SHUTDOWN);
> +		ret = snd_soc_component_update_bits(component,
> +			TAS2764_PWR_CTRL,
> +			TAS2764_PWR_CTRL_MASK,
> +			TAS2764_PWR_CTRL_SHUTDOWN);
> +		if (ret >= 0) {
> +			tas27xx->mbPowerUp = false;
> +			ret = 0;
> +		}
>   		break;
> -
>   	default:
> -		dev_err(tas2764->dev,
> -				"wrong power level setting %d\n", level);
> -		return -EINVAL;
> +		dev_err(tas27xx->dev,
> +			"wrong power level setting %d\n", level);
> +		ret = -EINVAL;
>   	}
> -
> -	return 0;
> +	if (ret < 0)
> +		pr_err("%s:%u:errCode:0x%0x:set BIAS error\n",
> +			__func__, __LINE__, ret);
> +	mutex_unlock(&tas27xx->codec_lock);
> +	return ret;
>   }
>   
>   #ifdef CONFIG_PM
> -static int tas2764_codec_suspend(struct snd_soc_component *component)
> +static int tas27xx_codec_suspend(
> +	struct snd_soc_component *component)
>   {
> -	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
> -	int ret;
> +	struct tas27xx_priv *tas27xx =
> +		snd_soc_component_get_drvdata(component);

Again, unnecessary line break.

> +	int ret = 0;
>   
> +	mutex_lock(&tas27xx->codec_lock);
>   	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
> -					    TAS2764_PWR_CTRL_MASK,
> -					    TAS2764_PWR_CTRL_SHUTDOWN);
> -
> -	if (ret < 0)
> -		return ret;
> -
> -	if (tas2764->sdz_gpio)
> -		gpiod_set_value_cansleep(tas2764->sdz_gpio, 0);
> -
> -	regcache_cache_only(tas2764->regmap, true);
> -	regcache_mark_dirty(tas2764->regmap);
> +		TAS2764_PWR_CTRL_MASK,
> +		TAS2764_PWR_CTRL_SHUTDOWN);
>   
> -	return 0;
> +	if (ret < 0) {
> +		pr_err("%s:%u:errCode:0x%0x:power down error\n",
> +			__func__, __LINE__, ret);
> +		goto EXIT;
> +	}
> +	ret = 0;
> +	tas27xx->mbPowerUp = false;
> +	if (tas27xx->sdz_gpio)
> +		gpiod_set_value_cansleep(tas27xx->sdz_gpio, 0);
> +
> +	regcache_cache_only(tas27xx->regmap, true);
> +	regcache_mark_dirty(tas27xx->regmap);
> +EXIT:
> +	mutex_unlock(&tas27xx->codec_lock);
> +	return ret;
>   }
>   
> -static int tas2764_codec_resume(struct snd_soc_component *component)
> +static int tas27xx_codec_resume(
> +	struct snd_soc_component *component)

Even more unnecessary line break...

I'm stopping my review here, but overall it feels like 3 things happen 
at the same time:
renaming variables, reshuffling of code and changes... which makes it a 
bit hard to review for real changes in code.
As mentioned renaming should probably be done in separate patch. 
Unnecessary reshuffling should be kept to minimum.
