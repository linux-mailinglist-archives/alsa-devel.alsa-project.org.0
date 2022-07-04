Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25015565562
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 14:31:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D66B173C;
	Mon,  4 Jul 2022 14:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D66B173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656937884;
	bh=rL/dVXu9lFFmv1sy4wiNe9geEPKJ9bDBVQR3zWGDtV4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXDm8+52AyD9a4sxn5YPB4kkoHF/o2sdaxWamyM6Kcz7566fPsEizdDnyP5X5h9Hv
	 0FnpPBibhiFTsCdl+EnOcP9CnMKCug7OgFTI41Z8VHt82u2lrllzfQlP0HgcgtGSuF
	 YlvtknQU1qvyS6e5ancyASjLxl+kY5BES5rsZLc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED89FF8052E;
	Mon,  4 Jul 2022 14:30:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2581CF804AC; Mon,  4 Jul 2022 14:30:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F74AF802BE
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 14:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F74AF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dJFXTDnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656937825; x=1688473825;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rL/dVXu9lFFmv1sy4wiNe9geEPKJ9bDBVQR3zWGDtV4=;
 b=dJFXTDnQDs606FdHiXGAedNcrn/MmXMbHbbn4iSK2lu/txkvtlqP8rxZ
 S7RqUfCf2UoI0r8xY8annPqOIzgI0UaCxQVVevLWa9EL+GWqmyoivMPw2
 YTBJwOqcMTWWEANEUQ0wU/2aLqRZzto8RWCSYufyofk1St/+qpWLhbFp3
 RjWyQVBhNkwQgYrNRZqwywi/efCqKaNqBvXROwQ8K2rYpc7q3mnSPK2aK
 e2W5udqmFahNAftHRsC2RcDA2YxrPlS5zg9wd74HOu2Dpm06v89ahiJyA
 thPoptIhCQ/28wfr2SnNfpRe1foSifO7i54ZjFITCKs/ExP1CgMUEH+tD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="284226793"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="284226793"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 05:30:14 -0700
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="619276267"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.83])
 ([10.99.241.83])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 05:30:12 -0700
Message-ID: <f1ebe9c6-0809-084e-2361-4d13c09b2037@linux.intel.com>
Date: Mon, 4 Jul 2022 14:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1] add tas2780
Content-Language: en-US
To: Raphael-Xu <13691752556@139.com>, broonie@kernel.org
References: <20220704104759.21083-1-13691752556@139.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220704104759.21083-1-13691752556@139.com>
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

On 7/4/2022 12:47 PM, Raphael-Xu wrote:
> 1.update Kconfig and Makefile 2.add tas2780.c and tas2780.h
> 
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---

...

> diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
> new file mode 100644
> index 000000000000..0e452c7464fb
> --- /dev/null
> +++ b/sound/soc/codecs/tas2780.c
> @@ -0,0 +1,726 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Driver for the Texas Instruments TAS2780 Mono
> +//		Audio amplifier
> +// Copyright (C) 2022 Texas Instruments Inc.
> +
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/delay.h>
> +#include <linux/pm.h>
> +#include <linux/i2c.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regmap.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
> +#include <sound/soc.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/initval.h>
> +#include <sound/tlv.h>
> +
> +#include "tas2780.h"
> +
> +struct tas2780_priv {
> +	struct snd_soc_component *component;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *sdz_gpio;
> +	struct regmap *regmap;
> +	struct device *dev;
> +	int v_sense_slot;
> +	int i_sense_slot;
> +

Unnecessary empty line?

> +};
> +
> +static void tas2780_reset(struct tas2780_priv *tas2780)
> +{
> +	if (tas2780->reset_gpio) {
> +		gpiod_set_value_cansleep(tas2780->reset_gpio, 0);
> +		usleep_range(2000, 2050);
> +		gpiod_set_value_cansleep(tas2780->reset_gpio, 1);
> +		usleep_range(2000, 2050);
> +	}
> +
> +	snd_soc_component_write(tas2780->component, TAS2780_SW_RST,
> +				TAS2780_RST);
> +}
> +

...

> +
> +static const struct snd_soc_component_driver soc_component_driver_tas2780 = {
> +	.probe			= tas2780_codec_probe,
> +#ifdef CONFIG_PM
> +	.suspend		= tas2780_codec_suspend,
> +	.resume			= tas2780_codec_resume,
> +#endif
> +	.controls		= tas2780_snd_controls,
> +	.num_controls		= ARRAY_SIZE(tas2780_snd_controls),
> +	.dapm_widgets		= tas2780_dapm_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(tas2780_dapm_widgets),
> +	.dapm_routes		= tas2780_audio_map,
> +	.num_dapm_routes	= ARRAY_SIZE(tas2780_audio_map),
> +	.idle_bias_on		= 1,
> +	.endianness		= 1,
> +	.non_legacy_dai_naming	= 1,

 From what I see change removing non_legacy_dai_naming field is merged 
in for-next branch, so you can skip it, as it is default now.

> +};
> +
> +static const struct reg_default tas2780_reg_defaults[] = {
> +	{ TAS2780_PAGE, 0x00 },
> +	{ TAS2780_SW_RST, 0x00 },
> +	{ TAS2780_PWR_CTRL, 0x1a },
> +	{ TAS2780_DVC, 0x00 },
> +	{ TAS2780_CHNL_0, 0x00 },
> +	{ TAS2780_TDM_CFG0, 0x09 },
> +	{ TAS2780_TDM_CFG1, 0x02 },
> +	{ TAS2780_TDM_CFG2, 0x0a },
> +	{ TAS2780_TDM_CFG3, 0x10 },
> +	{ TAS2780_TDM_CFG5, 0x42 },
> +};
> +
