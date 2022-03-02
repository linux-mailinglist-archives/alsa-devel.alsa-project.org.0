Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0394CA895
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 15:53:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E49FE1DE2;
	Wed,  2 Mar 2022 15:53:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E49FE1DE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646232837;
	bh=bsDpNsBiV0D7JTJLb5ZDLbSUEUKjXXvHOpnIfJGFFjM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J2QF2eJTS1Rao1gTrdte5kbg/9mCkeL71CW08hfcPCROOAMlG/G69Z8fYH25arXs5
	 lTKHe8VfKrJpx2I1EgVk6KnLq10Ztdyh8N9bFtoDMfJWtH0pFy7kB1S581n5qSWGhh
	 h5M+AN4BaZJAqpmdwvdN4V791S1/dUgQnKuvmfxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48FABF8027D;
	Wed,  2 Mar 2022 15:52:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40C47F801D5; Wed,  2 Mar 2022 15:52:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81D2DF80054
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 15:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81D2DF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nUu2LKfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646232761; x=1677768761;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bsDpNsBiV0D7JTJLb5ZDLbSUEUKjXXvHOpnIfJGFFjM=;
 b=nUu2LKfFT6c0mr/XAHmsIjIc9LrlgdBH6A89gXQH9vQqEN3xrZFj7WlL
 0Wv0cFfIEIWeGuB7fuFBVdXkGUtqI7HjHQGwS13BI5bZhlUKcVdQhdj8R
 TPc8XqY+sLQiL08OvjTE4WzkgfgPujeEuKUqFuifc/tq11p1ufy6zAz07
 2K5sPLpJhKwdhd5f7L0Yby/KRDfqd4EEgT2a2CtXEA5f75qNfyItg9THz
 rQFdHv2OQFaDftW/sukldtVkM5OrW82scgEs2+j/et/bxGfvvXkVKffFC
 iqSYqIFo4lByRzsExBbTfnLWnuSFvAfKpckyZvEByYJ2gRl1oKX90tseJ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="250989674"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="250989674"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 06:52:25 -0800
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="535413502"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.26])
 ([10.99.241.26])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 06:52:23 -0800
Message-ID: <b03ca8eb-0ceb-6814-e947-baf3a15f7fe9@linux.intel.com>
Date: Wed, 2 Mar 2022 15:51:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 6/8] ASoC: Intel: cirrus-common: support cs35l41 amplifier
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
 <20220301194903.60859-7-pierre-louis.bossart@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220301194903.60859-7-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>
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

On 3/1/2022 8:49 PM, Pierre-Louis Bossart wrote:
> From: Brent Lu <brent.lu@intel.com>
> 
> Implement cs35l41 support code in this common module so it could be
> shared between multiple SOF machine drivers.
> 
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   sound/soc/intel/boards/Kconfig             |   3 +
>   sound/soc/intel/boards/Makefile            |   3 +
>   sound/soc/intel/boards/sof_cirrus_common.c | 163 +++++++++++++++++++++
>   sound/soc/intel/boards/sof_cirrus_common.h |  25 ++++
>   4 files changed, 194 insertions(+)
>   create mode 100644 sound/soc/intel/boards/sof_cirrus_common.c
>   create mode 100644 sound/soc/intel/boards/sof_cirrus_common.h
> 
> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> index d96ebc335249..f29f9b731ed9 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -35,6 +35,9 @@ config SND_SOC_INTEL_SOF_MAXIM_COMMON
>   config SND_SOC_INTEL_SOF_REALTEK_COMMON
>   	tristate
>   
> +config SND_SOC_INTEL_SOF_CIRRUS_COMMON
> +	tristate
> +
>   if SND_SOC_INTEL_CATPT
>   
>   config SND_SOC_INTEL_HASWELL_MACH
> diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
> index b2966020e7ed..d0ef71b7af6e 100644
> --- a/sound/soc/intel/boards/Makefile
> +++ b/sound/soc/intel/boards/Makefile
> @@ -91,3 +91,6 @@ obj-$(CONFIG_SND_SOC_INTEL_SOF_MAXIM_COMMON) += snd-soc-intel-sof-maxim-common.o
>   
>   snd-soc-intel-sof-realtek-common-objs += sof_realtek_common.o
>   obj-$(CONFIG_SND_SOC_INTEL_SOF_REALTEK_COMMON) += snd-soc-intel-sof-realtek-common.o
> +
> +snd-soc-intel-sof-cirrus-common-objs += sof_cirrus_common.o
> +obj-$(CONFIG_SND_SOC_INTEL_SOF_CIRRUS_COMMON) += snd-soc-intel-sof-cirrus-common.o
> diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
> new file mode 100644
> index 000000000000..e71d74ec1b0b
> --- /dev/null
> +++ b/sound/soc/intel/boards/sof_cirrus_common.c
> @@ -0,0 +1,163 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * This file defines data structures and functions used in Machine
> + * Driver for Intel platforms with Cirrus Logic Codecs.
> + *
> + * Copyright 2022 Intel Corporation.

(c) seems to be missing? All other boards have it in some form.

> + */
> +#include <linux/module.h>
> +#include <sound/sof.h>
> +#include "../../codecs/cs35l41.h"
> +#include "sof_cirrus_common.h"
> +
> +/*
> + * Cirrus Logic CS35L41/CS35L53
> + */
> +static const struct snd_kcontrol_new cs35l41_kcontrols[] = {
> +	SOC_DAPM_PIN_SWITCH("WL Spk"),
> +	SOC_DAPM_PIN_SWITCH("WR Spk"),
> +	SOC_DAPM_PIN_SWITCH("TL Spk"),
> +	SOC_DAPM_PIN_SWITCH("TR Spk"),
> +};
> +
> +static const struct snd_soc_dapm_widget cs35l41_dapm_widgets[] = {
> +	SND_SOC_DAPM_SPK("WL Spk", NULL),
> +	SND_SOC_DAPM_SPK("WR Spk", NULL),
> +	SND_SOC_DAPM_SPK("TL Spk", NULL),
> +	SND_SOC_DAPM_SPK("TR Spk", NULL),
> +};
> +
> +static const struct snd_soc_dapm_route cs35l41_dapm_routes[] = {
> +	/* speaker */
> +	{"WL Spk", NULL, "WL SPK"},
> +	{"WR Spk", NULL, "WR SPK"},
> +	{"TL Spk", NULL, "TL SPK"},
> +	{"TR Spk", NULL, "TR SPK"},
> +};
> +
> +static struct snd_soc_dai_link_component cs35l41_components[] = {
> +	{
> +		.name = CS35L41_DEV0_NAME,
> +		.dai_name = CS35L41_CODEC_DAI,
> +	},
> +	{
> +		.name = CS35L41_DEV1_NAME,
> +		.dai_name = CS35L41_CODEC_DAI,
> +	},
> +	{
> +		.name = CS35L41_DEV2_NAME,
> +		.dai_name = CS35L41_CODEC_DAI,
> +	},
> +	{
> +		.name = CS35L41_DEV3_NAME,
> +		.dai_name = CS35L41_CODEC_DAI,
> +	},
> +};
> +
> +static struct snd_soc_codec_conf cs35l41_codec_conf[] = {
> +	{
> +		.dlc = COMP_CODEC_CONF(CS35L41_DEV0_NAME),
> +		.name_prefix = "WL",
> +	},
> +	{
> +		.dlc = COMP_CODEC_CONF(CS35L41_DEV1_NAME),
> +		.name_prefix = "WR",
> +	},
> +	{
> +		.dlc = COMP_CODEC_CONF(CS35L41_DEV2_NAME),
> +		.name_prefix = "TL",
> +	},
> +	{
> +		.dlc = COMP_CODEC_CONF(CS35L41_DEV3_NAME),
> +		.name_prefix = "TR",
> +	},
> +};
> +
> +static int cs35l41_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	int ret;
> +
> +	ret = snd_soc_dapm_new_controls(&card->dapm, cs35l41_dapm_widgets,
> +					ARRAY_SIZE(cs35l41_dapm_widgets));
> +	if (ret) {
> +		dev_err(rtd->dev, "fail to add dapm controls, ret %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_add_card_controls(card, cs35l41_kcontrols,
> +					ARRAY_SIZE(cs35l41_kcontrols));
> +	if (ret) {
> +		dev_err(rtd->dev, "fail to add card controls, ret %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_dapm_add_routes(&card->dapm, cs35l41_dapm_routes,
> +				      ARRAY_SIZE(cs35l41_dapm_routes));
> +
> +	if (ret)
> +		dev_err(rtd->dev, "fail to add dapm routes, ret %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int cs35l41_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *codec_dai;
> +	int clk_freq, i, ret;
> +
> +	clk_freq = sof_dai_get_bclk(rtd); /* BCLK freq */
> +
> +	if (clk_freq <= 0) {
> +		dev_err(rtd->dev, "fail to get bclk freq, ret %d\n", clk_freq);
> +		return -EINVAL;
> +	}
> +
> +	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +		/* call dai driver's set_sysclk() callback */
> +		ret = snd_soc_dai_set_sysclk(codec_dai, CS35L41_CLKID_SCLK,
> +					     clk_freq, SND_SOC_CLOCK_IN);
> +		if (ret < 0) {
> +			dev_err(codec_dai->dev, "fail to set sysclk, ret %d\n",
> +				ret);
> +			return ret;
> +		}
> +
> +		/* call component driver's set_sysclk() callback */
> +		ret = snd_soc_component_set_sysclk(codec_dai->component,
> +						   CS35L41_CLKID_SCLK, 0,
> +						   clk_freq, SND_SOC_CLOCK_IN);
> +		if (ret < 0) {
> +			dev_err(codec_dai->dev, "fail to set component sysclk, ret %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_ops cs35l41_ops = {
> +	.hw_params = cs35l41_hw_params,
> +};
> +
> +void cs35l41_set_dai_link(struct snd_soc_dai_link *link)
> +{
> +	link->codecs = cs35l41_components;
> +	link->num_codecs = ARRAY_SIZE(cs35l41_components);
> +	link->init = cs35l41_init;
> +	link->ops = &cs35l41_ops;
> +}
> +EXPORT_SYMBOL_NS(cs35l41_set_dai_link, SND_SOC_INTEL_SOF_CIRRUS_COMMON);
> +
> +void cs35l41_set_codec_conf(struct snd_soc_card *card)
> +{
> +	card->codec_conf = cs35l41_codec_conf;
> +	card->num_configs = ARRAY_SIZE(cs35l41_codec_conf);
> +}
> +EXPORT_SYMBOL_NS(cs35l41_set_codec_conf, SND_SOC_INTEL_SOF_CIRRUS_COMMON);
> +
> +MODULE_DESCRIPTION("ASoC Intel SOF Cirrus Logic helpers");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/intel/boards/sof_cirrus_common.h b/sound/soc/intel/boards/sof_cirrus_common.h
> new file mode 100644
> index 000000000000..ca438c12c386
> --- /dev/null
> +++ b/sound/soc/intel/boards/sof_cirrus_common.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * This file defines data structures used in Machine Driver for Intel
> + * platforms with Cirrus Logic Codecs.
> + *
> + * Copyright 2022 Intel Corporation.

Same here.

> + */
> +#ifndef __SOF_CIRRUS_COMMON_H
> +#define __SOF_CIRRUS_COMMON_H
> +
> +#include <sound/soc.h>
> +
> +/*
> + * Cirrus Logic CS35L41/CS35L53
> + */
> +#define CS35L41_CODEC_DAI	"cs35l41-pcm"
> +#define CS35L41_DEV0_NAME	"i2c-CSC3541:00"
> +#define CS35L41_DEV1_NAME	"i2c-CSC3541:01"
> +#define CS35L41_DEV2_NAME	"i2c-CSC3541:02"
> +#define CS35L41_DEV3_NAME	"i2c-CSC3541:03"
> +
> +void cs35l41_set_dai_link(struct snd_soc_dai_link *link);
> +void cs35l41_set_codec_conf(struct snd_soc_card *card);
> +
> +#endif /* __SOF_CIRRUS_COMMON_H */

