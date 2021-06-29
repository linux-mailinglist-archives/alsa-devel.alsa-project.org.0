Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFED3B7AD3
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jun 2021 01:54:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA74E1684;
	Wed, 30 Jun 2021 01:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA74E1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625010897;
	bh=z61uMkj6BtYcjJGDbF6XbHMPzKZ2HAxgsUJqhWbduUg=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bom1QWJI8IXISrUs3g8UMJk6TyeD2/jOoymuogecT05FX/lCJYfnSvCWvuvjsKLrj
	 eps0KXE9tW3sj0UDjcOOFHtrRVv2LvAT+wgVtk4CwXj8Hbr6r8EaV2xuDfZjnnP8kv
	 yhMcw90252q/XAPdHXTFLbqpKncE2vpjNYbutt6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4934EF80240;
	Wed, 30 Jun 2021 01:53:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F284F80259; Wed, 30 Jun 2021 01:53:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DB3EF8020C
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 01:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DB3EF8020C
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="195554323"
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="195554323"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 16:53:10 -0700
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="455085671"
Received: from srivahni-mobl1.amr.corp.intel.com (HELO [10.209.163.121])
 ([10.209.163.121])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 16:53:09 -0700
Subject: Re: [PATCH v2 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
To: David Rhodes <drhodes@opensource.cirrus.com>, broonie@kernel.org,
 robh@kernel.org, ckeepax@opensource.cirrus.com, brian.austin@cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com
References: <20210629222719.1391653-1-drhodes@opensource.cirrus.com>
 <20210629222719.1391653-2-drhodes@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b14da5ca-2b5a-43fc-11bb-7f87c873d3c4@linux.intel.com>
Date: Tue, 29 Jun 2021 18:51:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629222719.1391653-2-drhodes@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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




> diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
> new file mode 100644
> index 000000000000..f386d80fd62b
> --- /dev/null
> +++ b/include/sound/cs35l41.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * linux/sound/cs35l41.h -- Platform data for CS35L41
> + *
> + * Copyright (c) 2017-2021 Cirrus Logic Inc.
> + *
> + * Author: David Rhodes	<david.rhodes@cirrus.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

Aren't those 3 lines redundant, you've already added the SPDX statement above?

[...]

> diff --git a/sound/soc/codecs/cs35l41-i2c.c b/sound/soc/codecs/cs35l41-i2c.c
> new file mode 100644
> index 000000000000..51ef27a637c1
> --- /dev/null
> +++ b/sound/soc/codecs/cs35l41-i2c.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * cs35l41-i2c.c -- CS35l41 I2C driver
> + *
> + * Copyright 2017-2021 Cirrus Logic, Inc.
> + *
> + * Author: David Rhodes <david.rhodes@cirrus.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

same here, the SPDX tag gives the info already?

> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/version.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/acpi.h>

Alphabetical order?

> +
> +#include "cs35l41.h"
> +#include <sound/cs35l41.h>
> +
> +static struct regmap_config cs35l41_regmap_i2c = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = CS35L41_REGSTRIDE,
> +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> +	.val_format_endian = REGMAP_ENDIAN_BIG,
> +	.max_register = CS35L41_LASTREG,
> +	.reg_defaults = cs35l41_reg,
> +	.num_reg_defaults = ARRAY_SIZE(cs35l41_reg),
> +	.volatile_reg = cs35l41_volatile_reg,
> +	.readable_reg = cs35l41_readable_reg,
> +	.precious_reg = cs35l41_precious_reg,
> +	.cache_type = REGCACHE_RBTREE,
> +};
> +
> +static const struct i2c_device_id cs35l41_id_i2c[] = {
> +	{"cs35l40", 0},
> +	{"cs35l41", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, cs35l41_id_i2c);
> +
> +static int cs35l41_i2c_probe(struct i2c_client *client,
> +				const struct i2c_device_id *id)
> +{
> +	struct cs35l41_private *cs35l41;
> +	struct device *dev = &client->dev;
> +	struct cs35l41_platform_data *pdata = dev_get_platdata(dev);
> +	const struct regmap_config *regmap_config = &cs35l41_regmap_i2c;
> +	int ret;
> +
> +	cs35l41 = devm_kzalloc(dev, sizeof(struct cs35l41_private), GFP_KERNEL);
> +
> +	if (cs35l41 == NULL)

if (!cs35l41)

> +		return -ENOMEM;
> +
> +	cs35l41->dev = dev;
> +	cs35l41->irq = client->irq;
> +	cs35l41->otp_setup = NULL;
already done with the kzalloc?

> +
> +	i2c_set_clientdata(client, cs35l41);
> +	cs35l41->regmap = devm_regmap_init_i2c(client, regmap_config);
> +	if (IS_ERR(cs35l41->regmap)) {
> +		ret = PTR_ERR(cs35l41->regmap);
> +		dev_err(cs35l41->dev, "Failed to allocate register map: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	return cs35l41_probe(cs35l41, pdata);
> +}
> +
> +static int cs35l41_i2c_remove(struct i2c_client *client)
> +{
> +	struct cs35l41_private *cs35l41 = i2c_get_clientdata(client);
> +
> +	return cs35l41_remove(cs35l41);
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id cs35l41_of_match[] = {
> +	{.compatible = "cirrus,cs35l40"},
> +	{.compatible = "cirrus,cs35l41"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, cs35l41_of_match);
> +#endif
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id cs35l41_acpi_match[] = {
> +	{ "CSC3541", 0 },

Where does this "CSC" come from? it's not an ACPI ID listed here: https://uefi.org/acpi_id_list

why not use the 1013 PCI ID, e.g. as done for CS42L42?

> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_match);
> +#endif
> +
> +static struct i2c_driver cs35l41_i2c_driver = {
> +	.driver = {
> +		.name		= "cs35l41",
> +		.of_match_table = of_match_ptr(cs35l41_of_match),
> +		.acpi_match_table = ACPI_PTR(cs35l41_acpi_match),
> +	},
> +	.id_table	= cs35l41_id_i2c,
> +	.probe		= cs35l41_i2c_probe,
> +	.remove		= cs35l41_i2c_remove,
> +};
> +
> +module_i2c_driver(cs35l41_i2c_driver);
> +
> +MODULE_DESCRIPTION("I2C CS35L41 driver");
> +MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/cs35l41-spi.c b/sound/soc/codecs/cs35l41-spi.c
> new file mode 100644
> index 000000000000..582b7b484c21
> --- /dev/null
> +++ b/sound/soc/codecs/cs35l41-spi.c
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * cs35l41-spi.c -- CS35l41 SPI driver
> + *
> + * Copyright 2017-2021 Cirrus Logic, Inc.
> + *
> + * Author: David Rhodes	<david.rhodes@cirrus.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

redundant?

> + */
> +
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/version.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/delay.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/spi/spi.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/acpi.h>

alphabetical order?
> +
> +#include "cs35l41.h"
> +#include <sound/cs35l41.h>
> +
> +static struct regmap_config cs35l41_regmap_spi = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.pad_bits = 16,
> +	.reg_stride = CS35L41_REGSTRIDE,
> +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> +	.val_format_endian = REGMAP_ENDIAN_BIG,
> +	.max_register = CS35L41_LASTREG,
> +	.reg_defaults = cs35l41_reg,
> +	.num_reg_defaults = ARRAY_SIZE(cs35l41_reg),
> +	.volatile_reg = cs35l41_volatile_reg,
> +	.readable_reg = cs35l41_readable_reg,
> +	.precious_reg = cs35l41_precious_reg,
> +	.cache_type = REGCACHE_RBTREE,
> +};
> +
> +static const struct spi_device_id cs35l41_id_spi[] = {
> +	{"cs35l40", 0},
> +	{"cs35l41", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(spi, cs35l41_id_spi);
> +
> +static void cs35l41_spi_otp_setup(struct cs35l41_private *cs35l41,
> +					bool is_pre_setup, unsigned int *freq)
> +{
> +	struct spi_device *spi = NULL;

unnecessary init

> +	u32 orig_spi_freq;
> +
> +	spi = to_spi_device(cs35l41->dev);
> +
> +	if (!spi)
> +		return;
> +
> +	if (is_pre_setup) {
> +		orig_spi_freq = spi->max_speed_hz;
> +		if (orig_spi_freq > CS35L41_SPI_MAX_FREQ_OTP) {
> +			spi->max_speed_hz = CS35L41_SPI_MAX_FREQ_OTP;
> +			spi_setup(spi);
> +		}
> +		*freq = orig_spi_freq;
> +	} else {
> +		if (spi->max_speed_hz != *freq) {
> +			spi->max_speed_hz = *freq;
> +			spi_setup(spi);
> +		}
> +	}
> +}
> +
> +static int cs35l41_spi_probe(struct spi_device *spi)
> +{
> +	const struct regmap_config *regmap_config = &cs35l41_regmap_spi;
> +	struct cs35l41_platform_data *pdata =
> +					dev_get_platdata(&spi->dev);
> +	struct cs35l41_private *cs35l41;
> +	int ret;
> +
> +	cs35l41 = devm_kzalloc(&spi->dev,
> +			       sizeof(struct cs35l41_private),
> +			       GFP_KERNEL);
> +	if (cs35l41 == NULL)

if (!cs35l41)

> +		return -ENOMEM;
> +
> +
> +	spi_set_drvdata(spi, cs35l41);
> +	cs35l41->regmap = devm_regmap_init_spi(spi, regmap_config);
> +	if (IS_ERR(cs35l41->regmap)) {
> +		ret = PTR_ERR(cs35l41->regmap);
> +		dev_err(&spi->dev, "Failed to allocate register map: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	cs35l41->dev = &spi->dev;
> +	cs35l41->irq = spi->irq;
> +	cs35l41->otp_setup = cs35l41_spi_otp_setup;
> +
> +	return cs35l41_probe(cs35l41, pdata);
> +}
> +
> +static int cs35l41_spi_remove(struct spi_device *spi)
> +{
> +	struct cs35l41_private *cs35l41 = spi_get_drvdata(spi);
> +
> +	return cs35l41_remove(cs35l41);
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id cs35l41_of_match[] = {
> +	{.compatible = "cirrus,cs35l40"},
> +	{.compatible = "cirrus,cs35l41"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, cs35l41_of_match);
> +#endif
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id cs35l41_acpi_match[] = {
> +	{ "CSC3541", 0 }, /* Cirrus Logic PCI ID + part ID */

Wrong comment or wrong ID, "CSC" is clearly not a PCI ID?

> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_match);
> +#endif
> +
> +static struct spi_driver cs35l41_spi_driver = {
> +	.driver = {
> +		.name		= "cs35l41",
> +		.of_match_table = of_match_ptr(cs35l41_of_match),
> +		.acpi_match_table = ACPI_PTR(cs35l41_acpi_match),
> +	},
> +	.id_table	= cs35l41_id_spi,
> +	.probe		= cs35l41_spi_probe,
> +	.remove		= cs35l41_spi_remove,
> +};
> +
> +module_spi_driver(cs35l41_spi_driver);
> +
> +MODULE_DESCRIPTION("SPI CS35L41 driver");
> +MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/cs35l41-tables.c b/sound/soc/codecs/cs35l41-tables.c
> new file mode 100644
> index 000000000000..16fb083e3902
> --- /dev/null
> +++ b/sound/soc/codecs/cs35l41-tables.c
> @@ -0,0 +1,617 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * cs35l41-tables.c -- CS35L41 ALSA SoC audio driver
> + *
> + * Copyright 2017-2021 Cirrus Logic, Inc.
> + *
> + * Author: David Rhodes <david.rhodes@cirrus.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

ditto, redundant.

> diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
> new file mode 100644
> index 000000000000..1a1ea8a4f165
> --- /dev/null
> +++ b/sound/soc/codecs/cs35l41.c
> @@ -0,0 +1,1770 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * cs35l41.c -- CS35l41 ALSA SoC audio driver
> + *
> + * Copyright 2017-2021 Cirrus Logic, Inc.
> + *
> + * Author: David Rhodes <david.rhodes@cirrus.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

ditto, redundant.

> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/version.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/delay.h>
> +#include <linux/slab.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regmap.h>
> +#include <linux/property.h>
> +#include <linux/of_device.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/initval.h>
> +#include <sound/tlv.h>
> +#include <linux/err.h>

alphabetical order?


> +static irqreturn_t cs35l41_irq(int irq, void *data)
> +{
> +	struct cs35l41_private *cs35l41 = data;
> +	unsigned int status[4] = {0, 0, 0, 0};
> +	unsigned int masks[4] = {0, 0, 0, 0};

are those inits necessary, you override them below with the regmap reads?

> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(status); i++) {
> +		regmap_read(cs35l41->regmap,
> +			    CS35L41_IRQ1_STATUS1 + (i * CS35L41_REGSTRIDE),
> +			    &status[i]);
> +		regmap_read(cs35l41->regmap,
> +			    CS35L41_IRQ1_MASK1 + (i * CS35L41_REGSTRIDE),
> +			    &masks[i]);
> +	}
> +
> +	/* Check to see if unmasked bits are active */
> +	if (!(status[0] & ~masks[0]) && !(status[1] & ~masks[1]) &&
> +		!(status[2] & ~masks[2]) && !(status[3] & ~masks[3]))
> +		return IRQ_NONE;
> +
> +	if (status[3] & CS35L41_OTP_BOOT_DONE) {
> +		regmap_update_bits(cs35l41->regmap, CS35L41_IRQ1_MASK4,
> +				CS35L41_OTP_BOOT_DONE, CS35L41_OTP_BOOT_DONE);
> +	}
> +
> +	/*
> +	 * The following interrupts require a
> +	 * protection release cycle to get the
> +	 * speaker out of Safe-Mode.
> +	 */
> +	if (status[0] & CS35L41_AMP_SHORT_ERR) {
> +		dev_crit(cs35l41->dev, "Amp short error\n");

dev_crit_ratelimited? This is in an interrupt routine and can flood the console.
same in the rest of the routine.

> +		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
> +					CS35L41_AMP_SHORT_ERR);
> +		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
> +					CS35L41_AMP_SHORT_ERR_RLS,
> +					CS35L41_AMP_SHORT_ERR_RLS);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
> +					CS35L41_AMP_SHORT_ERR_RLS, 0);
> +	}
> +
> +	if (status[0] & CS35L41_TEMP_WARN) {
> +		dev_crit(cs35l41->dev, "Over temperature warning\n");
> +		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
> +					CS35L41_TEMP_WARN);
> +		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
> +					CS35L41_TEMP_WARN_ERR_RLS,
> +					CS35L41_TEMP_WARN_ERR_RLS);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
> +					CS35L41_TEMP_WARN_ERR_RLS, 0);
> +	}
> +
> +	if (status[0] & CS35L41_TEMP_ERR) {
> +		dev_crit(cs35l41->dev, "Over temperature error\n");
> +		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
> +					CS35L41_TEMP_ERR);
> +		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
> +					CS35L41_TEMP_ERR_RLS,
> +					CS35L41_TEMP_ERR_RLS);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
> +					CS35L41_TEMP_ERR_RLS, 0);
> +	}
> +
> +	if (status[0] & CS35L41_BST_OVP_ERR) {
> +		dev_crit(cs35l41->dev, "VBST Over Voltage error\n");
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
> +					CS35L41_BST_EN_MASK, 0);
> +		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
> +					CS35L41_BST_OVP_ERR);
> +		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
> +					CS35L41_BST_OVP_ERR_RLS,
> +					CS35L41_BST_OVP_ERR_RLS);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
> +					CS35L41_BST_OVP_ERR_RLS, 0);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
> +					CS35L41_BST_EN_MASK,
> +					CS35L41_BST_EN_DEFAULT <<
> +					CS35L41_BST_EN_SHIFT);
> +	}
> +
> +	if (status[0] & CS35L41_BST_DCM_UVP_ERR) {
> +		dev_crit(cs35l41->dev, "DCM VBST Under Voltage Error\n");
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
> +					CS35L41_BST_EN_MASK, 0);
> +		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
> +					CS35L41_BST_DCM_UVP_ERR);
> +		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
> +					CS35L41_BST_UVP_ERR_RLS,
> +					CS35L41_BST_UVP_ERR_RLS);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
> +					CS35L41_BST_UVP_ERR_RLS, 0);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
> +					CS35L41_BST_EN_MASK,
> +					CS35L41_BST_EN_DEFAULT <<
> +					CS35L41_BST_EN_SHIFT);
> +	}
> +
> +	if (status[0] & CS35L41_BST_SHORT_ERR) {
> +		dev_crit(cs35l41->dev, "LBST error: powering off!\n");
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
> +					CS35L41_BST_EN_MASK, 0);
> +		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
> +					CS35L41_BST_SHORT_ERR);
> +		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
> +					CS35L41_BST_SHORT_ERR_RLS,
> +					CS35L41_BST_SHORT_ERR_RLS);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
> +					CS35L41_BST_SHORT_ERR_RLS, 0);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
> +					CS35L41_BST_EN_MASK,
> +					CS35L41_BST_EN_DEFAULT <<
> +					CS35L41_BST_EN_SHIFT);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

[...]

> diff --git a/sound/soc/codecs/cs35l41.h b/sound/soc/codecs/cs35l41.h
> new file mode 100644
> index 000000000000..57af9d67ba72
> --- /dev/null
> +++ b/sound/soc/codecs/cs35l41.h
> @@ -0,0 +1,755 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * cs35l41.h -- CS35L41 ALSA SoC audio driver
> + *
> + * Copyright 2017-2021 Cirrus Logic, Inc.
> + *
> + * Author: David Rhodes <david.rhodes@cirrus.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

redundant?


