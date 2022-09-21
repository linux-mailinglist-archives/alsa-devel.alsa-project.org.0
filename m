Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EF85BF93A
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 10:28:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B13F915C1;
	Wed, 21 Sep 2022 10:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B13F915C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663748926;
	bh=2QXiEiIk4bERqqKKD/2sK+HvRQRkofw4BKmhJwnpeUo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jVPB5K3YR6uyQ/FX5w/j3yv+1caHOBnCfqpE7V6N1PlQKGKRvT13QCopPh1kJMp08
	 ZvdSYlfDRUZg6rygP6+Fc9yxY7DG3NldQmoxRb54xEm5BuO+W6tBcgDy6YzrHxp/qy
	 z3tPPCCwG13mJN8+ctaUoyCoauIsemVO3rQYVkFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0DA6F80256;
	Wed, 21 Sep 2022 10:27:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FB9DF80538; Wed, 21 Sep 2022 10:27:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 881BBF8047C
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 10:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 881BBF8047C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="N7CT31LA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663748854; x=1695284854;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2QXiEiIk4bERqqKKD/2sK+HvRQRkofw4BKmhJwnpeUo=;
 b=N7CT31LANT87TesbhwhYsCvh1pVBIGtBL84RHZBCGHnHfY+9r5IcVcIi
 u2cjim1NqJjZqDJYzKh8zt7djGBh6WT+jTx52RZi0BE2//4vr0eoc7vlG
 9FRyZgieUAmPJc8ALFZasCD/rhYt4VqjQ2UL8fVt6LiSOT6fxyb57rXuw
 rvJBYwrGlF3ETCrHFo/C+chc70oBobrTKTNd1vSDlWO68FAwbWKOPnQpl
 KF3N/Tf3IYOylt/ZHKmzbVckx3gnj1O3V7HzgSUpUTmA31upANcny+xU4
 W8gWxSUzNll8B7sDhKgBaj6wNoIsEjl+7nGoEhp8tMHUtZYqMvFeD0ziw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="301337154"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="301337154"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 01:27:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="723109650"
Received: from johannes-mobl1.ger.corp.intel.com (HELO [10.249.46.195])
 ([10.249.46.195])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 01:27:28 -0700
Message-ID: <5be08dad-271a-a804-0093-8734d81ac6c6@linux.intel.com>
Date: Wed, 21 Sep 2022 10:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
Content-Language: en-US
To: Kiseok Jo <kiseok.jo@irondevice.com>,
 Gyuhwa Park <gyuhwa.park@irondevice.com>, Mark Brown <broonie@kernel.org>
References: <20220921044405.4441-1-kiseok.jo@irondevice.com>
 <20220921044405.4441-2-kiseok.jo@irondevice.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220921044405.4441-2-kiseok.jo@irondevice.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, application@irondevice.com
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




> diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
> new file mode 100644
> index 000000000000..03c969a4891e
> --- /dev/null
> +++ b/sound/soc/codecs/sma1303.c
> @@ -0,0 +1,2119 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* sma1303.c -- sma1303 ALSA SoC Audio driver
> + *
> + * Copyright 2022 Iron Device Corporation

Missing Copyright (c) ?

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

this is redundant with the SPDX line above.

> + */
> +
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/delay.h>

it's recommanded to list headers by alphabetical order.

> +#include <linux/pm.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/version.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/initval.h>
> +#include <sound/tlv.h>
> +#include <linux/of_device.h>
> +#include <linux/slab.h>
> +#include <asm/div64.h>
> +
> +#include "sma1303.h"

> +enum sma1303_type {
> +	SMA1303,
> +};

is this necessary?

> +
> +struct sma1303_pll_match {
> +	char *input_clk_name;
> +	char *output_clk_name;
> +	unsigned int input_clk;
> +	unsigned int post_n;
> +	unsigned int n;
> +	unsigned int vco;
> +	unsigned int p_cp;
> +};
> +
> +struct sma1303_priv {
> +	enum sma1303_type devtype;
> +	struct device *dev;
> +	struct attribute_group *attr_grp;
> +	struct kobject *kobj;

Usually it's not recommended to muck with kobj in drivers. If this is
for sysfs support there are better and safer ways.

> +	struct regmap *regmap;
> +	struct sma1303_pll_match *pll_matches;
> +	struct mutex lock;
> +	struct delayed_work check_fault_work;
> +	bool amp_power_status;
> +	bool usage_status;
> +	int num_of_pll_matches;
> +	unsigned int sys_clk_id;
> +	unsigned int init_vol;
> +	unsigned int cur_vol;
> +	unsigned int tdm_slot_rx;
> +	unsigned int tdm_slot_tx;
> +	unsigned int tsdw_cnt;
> +	unsigned int format;
> +	unsigned int rev_num;
> +	unsigned int last_over_temp;
> +	unsigned int last_ocp_val;
> +	unsigned int last_bclk;
> +	unsigned int frame_size;
> +	unsigned int amp_mode;
> +	long check_fault_period;
> +	long check_fault_status;
> +};
> +
> +static struct sma1303_pll_match sma1303_pll_matches[] = {
> +PLL_MATCH("1.411MHz",  "24.595MHz", 1411200,  0x07, 0xF4, 0x8B, 0x03),
> +PLL_MATCH("1.536MHz",  "24.576MHz", 1536000,  0x07, 0xE0, 0x8B, 0x03),
> +PLL_MATCH("3.072MHz",  "24.576MHz", 3072000,  0x07, 0x70, 0x8B, 0x03),
> +PLL_MATCH("6.144MHz",  "24.576MHz", 6144000,  0x07, 0x70, 0x8B, 0x07),
> +PLL_MATCH("12.288MHz", "24.576MHz", 12288000, 0x07, 0x70, 0x8B, 0x0B),
> +PLL_MATCH("19.2MHz",   "24.343MHz", 19200000, 0x07, 0x47, 0x8B, 0x0A),
> +PLL_MATCH("24.576MHz", "24.576MHz", 24576000, 0x07, 0x70, 0x8B, 0x0F),
> +};

Any reason to use strings instead of actual integer values for frequencies?


> +static int sma1303_regmap_write(struct regmap *map, struct device *dev,
> +				unsigned int reg, unsigned int val)
> +{
> +	int ret = 0;

unnecessary init, same comment for all the code.
> +
> +	ret = regmap_write(map, reg, val);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to write, register: 0x%02X, ret: %d\n",
> +			       reg, ret);
> +	}
> +	return ret;
> +}
> +
> +static int sma1303_regmap_update_bits(struct regmap *map, struct device *dev,
> +		unsigned int reg, unsigned int mask, unsigned int val)
> +{
> +	int ret = 0;
> +
> +	ret = regmap_update_bits(map, reg, mask, val);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to write, register: 0x%02X, ret: %d\n",

Failed to update?

> +			       reg, ret);
> +	}
> +	return ret;
> +}
> +
> +static int bytes_ext_get(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol, int reg)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
> +	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
> +	unsigned int i, reg_val;
> +	u8 *val;
> +	int ret = -1;
> +
> +	if (component == NULL) {

if (!component)

> +		pr_err("%s:component is NULL\n", __func__);

can pr_err be avoided?

> +		return ret;
> +	}
> +	if (sma1303 == NULL) {

if (!sma1303)

> +		pr_err("%s:sma1303 is NULL\n", __func__);

can pr_err be avoided?

Same comments for all functions using this pattern.

> +		return ret;
> +	}
> +	val = (u8 *)ucontrol->value.bytes.data;
> +	for (i = 0; i < params->max; i++) {
> +		ret = regmap_read(sma1303->regmap, reg + i, &reg_val);
> +		if (ret < 0) {
> +			dev_err(component->dev,
> +				"Failed to read, register: %x ret: %d\n",
> +				reg + i, ret);
> +			return ret;
> +		}
> +		if (sizeof(reg_val) > 2)
> +			reg_val = cpu_to_le32(reg_val);
> +		else
> +			reg_val = cpu_to_le16(reg_val);
> +		memcpy(val + i, &reg_val, sizeof(u8));

I wasn't able to figure out what this code does. sizeof(reg_val) is a
constant so the second branch is never taken, and you end-up using
memcpy to copy one byte, so what is the issue with endianness?

> +	}
> +
> +	return 0;
> +}
> +
> +static int bytes_ext_put(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol, int reg)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
> +	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
> +	void *data;
> +	u8 *val;
> +	int i, ret = -1;
> +
> +	if (component == NULL) {
> +		pr_err("%s:component is NULL\n", __func__);
> +		return ret;
> +	}
> +	if (sma1303 == NULL) {
> +		pr_err("%s:sma1303 is NULL\n", __func__);
> +		return ret;
> +	}
> +	data = kmemdup(ucontrol->value.bytes.data,
> +			params->max, GFP_KERNEL | GFP_DMA);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	val = (u8 *)data;
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

ret = 0;
for (i = 0; i < params->max; i++) {
	ret = sma1303_regmap_write(
			sma1303->regmap, component->dev,
			reg + i, *(val + i));
	if (ret < 0)
		break;
}

kfree(data);
return ret;

> +static int amp_usage_status_get(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
> +	int ret = -1;
> +
> +	if (component == NULL) {
> +		pr_err("%s:component is NULL\n", __func__);
> +		return ret;
> +	}
> +	if (sma1303 == NULL) {
> +		pr_err("%s:sma1303 is NULL\n", __func__);
> +		return ret;
> +	}
> +	ucontrol->value.integer.value[0] = sma1303->usage_status;
> +
> +	if (sma1303->usage_status)
> +		dev_info(component->dev, "Amplifier Power Control Enabled\n");
> +	else
> +		dev_info(component->dev, "Amplifier Power Control Disabled\n");
> +
> +	return 0;
> +}
> +
> +static int amp_usage_status_put(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
> +	int ret = -1;
> +
> +	if (component == NULL) {
> +		pr_err("%s:component is NULL\n", __func__);
> +		return ret;
> +	}
> +	if (sma1303 == NULL) {
> +		pr_err("%s:sma1303 is NULL\n", __func__);
> +		return ret;
> +	}
> +
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
> +	sma1303->usage_status = ucontrol->value.integer.value[0];
> +
> +	return 0;
> +}
> +
> +static const char * const sma1303_amp_mode_text[] = {
> +	"1 Chip", "Mono on 2 chips", "Left in 2 chips", "Right in 2chips"};
> +
> +static const struct soc_enum sma1303_amp_mode_enum =
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_amp_mode_text),
> +			sma1303_amp_mode_text);
> +static int sma1303_amp_mode_get(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
> +	int ret = -1;
> +
> +	if (component == NULL) {
> +		pr_err("%s:component is NULL\n", __func__);
> +		return ret;
> +	}
> +	if (sma1303 == NULL) {
> +		pr_err("%s:sma1303 is NULL\n", __func__);
> +		return ret;
> +	}
> +	ucontrol->value.integer.value[0] = sma1303->amp_mode;
> +
> +	switch (sma1303->amp_mode) {
> +	case ONE_CHIP_SOLUTION:
> +		dev_info(component->dev, "Amplifier 1 Chip Solution\n");
> +		break;
> +	case MONO_TWO_CHIP_SOLUTION:
> +		dev_info(component->dev, "Amplifier Mono 2 Chips Solution\n");
> +		break;
> +	case LEFT_TWO_CHIP_SOLUTION:
> +		dev_info(component->dev, "Amplifier Stereo(Left) 2 Chips Solution\n");
> +		break;
> +	case RIGHT_TWO_CHIP_SOLUTION:
> +		dev_info(component->dev, "Amplifier Stereo(Right) 2 Chips Solution\n");
> +		break;
> +	default:
> +		dev_err(component->dev, "Invalid Value");
> +		return ret;
> +	}
> +	return 0;
> +
> +}
> +
> +static int sma1303_amp_mode_put(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
> +	int ret = 0;
> +
> +	if (component == NULL) {
> +		pr_err("%s:component is NULL\n", __func__);
> +		return -1;
> +	}
> +	if (sma1303 == NULL) {
> +		pr_err("%s:sma1303 is NULL\n", __func__);
> +		return -1;
> +	}
> +
> +	sma1303->amp_mode = ucontrol->value.integer.value[0];
> +
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
> +	case LEFT_TWO_CHIP_SOLUTION:
> +		ret += sma1303_regmap_update_bits(
> +				sma1303->regmap, component->dev,
> +				SMA1303_11_SYSTEM_CTRL2,
> +				MONOMIX_MASK, MONOMIX_OFF);
> +		ret += sma1303_regmap_update_bits(
> +				sma1303->regmap, component->dev,
> +				SMA1303_11_SYSTEM_CTRL2,
> +				LR_DATA_SW_MASK, LR_DATA_SW_NORMAL);
> +		break;
> +	case RIGHT_TWO_CHIP_SOLUTION:
> +		ret += sma1303_regmap_update_bits(
> +				sma1303->regmap, component->dev,
> +				SMA1303_11_SYSTEM_CTRL2,
> +				MONOMIX_MASK, MONOMIX_OFF);
> +		ret += sma1303_regmap_update_bits(
> +				sma1303->regmap, component->dev,
> +				SMA1303_11_SYSTEM_CTRL2,
> +				LR_DATA_SW_MASK, LR_DATA_SW_SWAP);
> +		break;
> +	default:
> +		dev_err(component->dev, "Invalid Value");
> +		ret += -1;
> +	}
> +
> +	return ret;

Not sure I understand your arithmetic on combining error codes.

If one transaction fails, is there any point in trying another
regmap_update_bits()?


{skipping all the way to the probe which has a lot of issues}

> +static int sma1303_i2c_probe(struct i2c_client *client,
> +				const struct i2c_device_id *id)
> +{
> +	struct sma1303_priv *sma1303;
> +	struct device_node *np = client->dev.of_node;
> +	int ret;
> +	u32 value;
> +	unsigned int device_info;
> +
> +	dev_info(&client->dev, "%s is here. Driver version REV018\n", __func__);
> +
> +	sma1303 = devm_kzalloc(&client->dev, sizeof(struct sma1303_priv),
> +							GFP_KERNEL);
> +
> +	if (!sma1303)
> +		return -ENOMEM;
> +
> +	sma1303->regmap = devm_regmap_init_i2c(client, &sma_i2c_regmap);
> +
> +	if (IS_ERR(sma1303->regmap)) {
> +		ret = PTR_ERR(sma1303->regmap);
> +		dev_err(&client->dev,
> +			"Failed to allocate register map: %d\n", ret);
> +
> +		devm_kfree(&client->dev, sma1303);

why use devm_ then?

> +
> +		return ret;
> +	}
> +
> +	if (np) {
> +		if (!of_property_read_u32(np, "tdm-slot-rx", &value)) {
> +			dev_info(&client->dev,
> +				"tdm slot rx is '%d' from DT\n", value);
> +			sma1303->tdm_slot_rx = value;
> +		} else {
> +			dev_info(&client->dev,
> +				"Default setting of tdm slot rx is '0'\n");
> +			sma1303->tdm_slot_rx = 0;
> +		}
> +		if (!of_property_read_u32(np, "tdm-slot-tx", &value)) {
> +			dev_info(&client->dev,
> +				"tdm slot tx is '%d' from DT\n", value);
> +			sma1303->tdm_slot_tx = value;
> +		} else {
> +			dev_info(&client->dev,
> +				"Default setting of tdm slot tx is '0'\n");
> +			sma1303->tdm_slot_tx = 0;
> +		}
> +		if (!of_property_read_u32(np, "sys-clk-id", &value)) {
> +			switch (value) {
> +			case SMA1303_EXTERNAL_CLOCK_19_2:
> +			case SMA1303_EXTERNAL_CLOCK_24_576:
> +			case SMA1303_PLL_CLKIN_MCLK:
> +				dev_info(&client->dev, "MCLK is not supported\n");
> +				break;
> +			case SMA1303_PLL_CLKIN_BCLK:
> +				dev_info(&client->dev,
> +				"Take an BCLK(SCK) and covert it to an internal PLL for use\n");
> +				break;
> +			default:
> +				dev_err(&client->dev,
> +					"Invalid sys-clk-id: %d\n", value);
> +				return -EINVAL;
> +			}
> +			sma1303->sys_clk_id = value;
> +		} else {
> +			dev_info(&client->dev, "Use the internal PLL clock by default\n");
> +			sma1303->sys_clk_id = SMA1303_PLL_CLKIN_BCLK;
> +		}
> +	} else {
> +		dev_err(&client->dev,
> +			"device node initialization error\n");
> +		devm_kfree(&client->dev, sma1303);
> +		return -ENODEV;
> +	}
> +
> +	ret = regmap_read(sma1303->regmap,
> +		SMA1303_FF_DEVICE_INDEX, &device_info);
> +
> +	if ((ret != 0) || ((device_info & 0xF8) != DEVICE_ID)) {
> +		dev_err(&client->dev, "device initialization error (%d 0x%02X)",
> +				ret, device_info);
> +	}
> +	dev_info(&client->dev, "chip version 0x%02X\n", device_info);
> +
> +	sma1303->last_over_temp = 0xC0;
> +	sma1303->last_ocp_val = 0x0A;
> +	sma1303->tsdw_cnt = 0;
> +	sma1303->init_vol = 0x31;
> +	sma1303->cur_vol = sma1303->init_vol;
> +	sma1303->last_bclk = 0;
> +
> +	INIT_DELAYED_WORK(&sma1303->check_fault_work,
> +		sma1303_check_fault_worker);
> +
> +	mutex_init(&sma1303->lock);
> +	sma1303->check_fault_period = CHECK_PERIOD_TIME;
> +
> +	sma1303->devtype = id->driver_data;
> +	sma1303->dev = &client->dev;
> +	sma1303->kobj = &client->dev.kobj;
> +
> +	i2c_set_clientdata(client, sma1303);
> +
> +	sma1303->amp_mode = ONE_CHIP_SOLUTION;
> +	sma1303->usage_status = true;
> +	sma1303->amp_power_status = false;
> +	sma1303->check_fault_status = true;
> +	sma1303->pll_matches = sma1303_pll_matches;
> +	sma1303->num_of_pll_matches =
> +		ARRAY_SIZE(sma1303_pll_matches);
> +
> +	ret = devm_snd_soc_register_component(&client->dev,
> +			&sma1303_component, sma1303_dai, 1);
> +
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to register component");
> +		snd_soc_unregister_component(&client->dev);

no, this is not needed if you use devm_

> +
> +		if (sma1303)
> +			devm_kfree(&client->dev, sma1303);
> +
> +		return ret;
> +	}
> +
> +	sma1303->attr_grp = &sma1303_attr_group;
> +	ret = sysfs_create_group(sma1303->kobj, sma1303->attr_grp);
> +
> +	if (ret) {
> +		dev_err(&client->dev,
> +			"failed to create attribute group [%d]\n", ret);
> +		sma1303->attr_grp = NULL;
> +	}

not clear what you are trying to do with sysfs?
> +
> +	return ret;
> +}
> +
> +static int sma1303_i2c_remove(struct i2c_client *client)
> +{
> +	struct sma1303_priv *sma1303 =
> +		(struct sma1303_priv *) i2c_get_clientdata(client);
> +
> +	cancel_delayed_work_sync(&sma1303->check_fault_work);
> +
> +	snd_soc_unregister_component(&client->dev);

not needed when you use devm_snd_soc_register_component ?
> +
> +	if (sma1303)
> +		devm_kfree(&client->dev, sma1303);

is this needed? if you use devm_ the memory will be released when the
remove() completes.
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id sma1303_i2c_id[] = {
> +	{"sma1303", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, sma1303_i2c_id);
> +
> +static const struct of_device_id sma1303_of_match[] = {
> +	{ .compatible = "irondevice,sma1303", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, sma1303_of_match);
> +
> +static struct i2c_driver sma1303_i2c_driver = {
> +	.driver = {
> +		.name = "sma1303",
> +		.of_match_table = sma1303_of_match,
> +	},
> +	.probe = sma1303_i2c_probe,
> +	.remove = sma1303_i2c_remove,
> +	.id_table = sma1303_i2c_id,
> +};
> +
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

use module_i2c_driver() ?

> +
> +MODULE_DESCRIPTION("ALSA SoC SMA1303 driver");
> +MODULE_AUTHOR("Gyuhwa Park, <gyuhwa.park@irondevice.com>");
> +MODULE_AUTHOR("Kiseok Jo, <kiseok.jo@irondevice.com>");
> +MODULE_LICENSE("GPL v2");

"GPL" is equivalent.

> diff --git a/sound/soc/codecs/sma1303.h b/sound/soc/codecs/sma1303.h
> new file mode 100644
> index 000000000000..d1fa2acaba85
> --- /dev/null
> +++ b/sound/soc/codecs/sma1303.h
> @@ -0,0 +1,609 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + * sma1303.h -- sma1303 ALSA SoC Audio driver
> + *
> + * Copyright 2022 Iron Device Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

same, this paragraph is not needed


> +
> +/* SMA1303 Registers Bit Fields */

use prefixes for all definitions below?

> +/* SYSTEM_CTRL : 0x00 */
> +#define RESETBYI2C_MASK (1<<1)
> +#define RESETBYI2C_NORMAL (0<<1)
> +#define RESETBYI2C_RESET (1<<1)
> +
> +#define POWER_MASK (1<<0)
> +#define POWER_OFF (0<<0)
> +#define POWER_ON (1<<0)
> +
>
