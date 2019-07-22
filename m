Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A5C6FFEA
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:40:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BDE717C8;
	Mon, 22 Jul 2019 14:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BDE717C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563799223;
	bh=qcR6Uuzeo7Co21KsBEfKasNQlxKzXInt1JVigscIuRw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VcmpOUWjOzuDYxe4CLMmEllgLrHbAuOKbyPiRnkOb+5uJcr0DwKL3zm4ToPm1Fw7X
	 RoxLUHBLQK9hsoPcdMCqTxP93VhnShP3ppNPRRsY+smfC8X0FeDLvWrzZmuAxDJ+nq
	 xSux0BHsM2SHkeqF5xRWsOUX/EG19SKcaNvyq/24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E1A1F8045F;
	Mon, 22 Jul 2019 14:34:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2010BF80481; Mon, 22 Jul 2019 14:34:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A170F80446
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A170F80446
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 05:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="320671209"
Received: from tmgarre-mobl.amr.corp.intel.com (HELO [10.251.137.78])
 ([10.251.137.78])
 by orsmga004.jf.intel.com with ESMTP; 22 Jul 2019 05:34:08 -0700
To: Jon Flatley <jflat@chromium.org>, alsa-devel@alsa-project.org
References: <20190718231225.88991-1-jflat@chromium.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f2e1c69e-bba9-8798-536c-1a2681e02599@linux.intel.com>
Date: Mon, 22 Jul 2019 07:34:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718231225.88991-1-jflat@chromium.org>
Content-Language: en-US
Cc: benzh@chromium.org, broonie@kernel.org, bardliao@realtek.com
Subject: Re: [alsa-devel] [PATCH] ASoC: intel: Add Broadwell rt5650 machine
 driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 7/18/19 6:12 PM, Jon Flatley wrote:
> From: Ben Zhang <benzh@chromium.org>
> 
> Add machine driver for Broadwell + rt5650.

Interesting. the only Broadwell device we encountered with I2S instead 
of HDaudio was Samus w/ rt5677, can you share which model this is?

> 
> Signed-off-by: Jon Flatley <jflat@chromium.org>
> Signed-off-by: Ben Zhang <benzh@chromium.org>
> ---
>   sound/soc/intel/boards/Kconfig                |  11 +
>   sound/soc/intel/boards/Makefile               |   2 +
>   sound/soc/intel/boards/bdw-rt5650.c           | 305 ++++++++++++++++++
>   .../common/soc-acpi-intel-hsw-bdw-match.c     |   5 +
>   4 files changed, 323 insertions(+)
>   create mode 100644 sound/soc/intel/boards/bdw-rt5650.c
> 
> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> index 50bf149818b5..c111ae177b4a 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -31,6 +31,17 @@ endif ## SND_SOC_INTEL_HASWELL
>   
>   if SND_SOC_INTEL_HASWELL || SND_SOC_SOF_BROADWELL
>   
> +config SND_SOC_INTEL_BDW_RT5650_MACH
> +	tristate "Broadwell with RT5650 codec"
> +	depends on SND_SOC_INTEL_SST && X86_INTEL_LPSS && DW_DMAC

this should be updated to reflect how other machine drivers are compiled

config SND_SOC_INTEL_BDW_RT5677_MACH
	tristate "Broadwell with RT5677 codec"
	depends on I2C
	depends on I2C_DESIGNWARE_PLATFORM || COMPILE_TEST
	depends on GPIOLIB || COMPILE_TEST
	depends on X86_INTEL_LPSS || COMPILE_TEST

The depends on SND_SOC_INTEL_SST is not needed, it's already implied by 
the SND_SOF_INTEL_HASWELL.


> +	select SND_COMPRESS_OFFLOAD

Is this necessary? I don't think the legacy broadwell firmware supports 
this and the rt5650 doesn't have any DSP capability, does it?

comments below are for direct support of SOF, there are minor known 
changes needed so might as well do them from Day1.

> +	select SND_SOC_RT5645
> +	help
> +	  This adds the ASoC machine driver for Intel Broadwell platforms with
> +	  the RT5650 codec.
> +	  Say Y if you have such a device
> +	  If unsure select "N".
> +
>   config SND_SOC_INTEL_BDW_RT5677_MACH
>   	tristate "Broadwell with RT5677 codec"
>   	depends on I2C
> diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
> index 6445f90ea542..b5e2619607be 100644
> --- a/sound/soc/intel/boards/Makefile
> +++ b/sound/soc/intel/boards/Makefile
> @@ -2,6 +2,7 @@
>   snd-soc-sst-haswell-objs := haswell.o
>   snd-soc-sst-byt-rt5640-mach-objs := byt-rt5640.o
>   snd-soc-sst-byt-max98090-mach-objs := byt-max98090.o
> +snd-soc-sst-bdw-rt5650-mach-objs := bdw-rt5650.o
>   snd-soc-sst-bdw-rt5677-mach-objs := bdw-rt5677.o
>   snd-soc-sst-broadwell-objs := broadwell.o
>   snd-soc-sst-bxt-da7219_max98357a-objs := bxt_da7219_max98357a.o
> @@ -36,6 +37,7 @@ obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH) += snd-soc-sst-bxt-da7219_
>   obj-$(CONFIG_SND_SOC_INTEL_BXT_RT298_MACH) += snd-soc-sst-bxt-rt298.o
>   obj-$(CONFIG_SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH) += snd-soc-sst-glk-rt5682_max98357a.o
>   obj-$(CONFIG_SND_SOC_INTEL_BROADWELL_MACH) += snd-soc-sst-broadwell.o
> +obj-$(CONFIG_SND_SOC_INTEL_BDW_RT5650_MACH) += snd-soc-sst-bdw-rt5650-mach.o
>   obj-$(CONFIG_SND_SOC_INTEL_BDW_RT5677_MACH) += snd-soc-sst-bdw-rt5677-mach.o
>   obj-$(CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH) += snd-soc-sst-bytcr-rt5640.o
>   obj-$(CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH) += snd-soc-sst-bytcr-rt5651.o
> diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
> new file mode 100644
> index 000000000000..cb875eeab055
> --- /dev/null
> +++ b/sound/soc/intel/boards/bdw-rt5650.c
> @@ -0,0 +1,305 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ASoC machine driver for Intel Broadwell platforms with RT5650 codec
> + *
> + * Copyright 2019, The Chromium OS Authors.  All rights reserved.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/delay.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <sound/pcm_params.h>
> +#include <sound/jack.h>

#include <sound/soc-acpi.h>

needed for the platform override stuff below

> +
> +#include "../common/sst-dsp.h"
> +#include "../haswell/sst-haswell-ipc.h"
> +
> +#include "../../codecs/rt5645.h"
> +
> +struct bdw_rt5650_priv {
> +	struct gpio_desc *gpio_hp_en;
> +	struct snd_soc_component *component;
> +};
> +
> +static const struct snd_soc_dapm_widget bdw_rt5650_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone", NULL),
> +	SND_SOC_DAPM_SPK("Speaker", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +	SND_SOC_DAPM_MIC("DMIC Pair1", NULL),
> +	SND_SOC_DAPM_MIC("DMIC Pair2", NULL),
> +};
> +
> +static const struct snd_soc_dapm_route bdw_rt5650_map[] = {
> +	/* Speakers */
> +	{"Speaker", NULL, "SPOL"},
> +	{"Speaker", NULL, "SPOR"},
> +
> +	/* Headset jack connectors */
> +	{"Headphone", NULL, "HPOL"},
> +	{"Headphone", NULL, "HPOR"},
> +	{"IN1P", NULL, "Headset Mic"},
> +	{"IN1N", NULL, "Headset Mic"},
> +
> +	/* Digital MICs
> +	 * DMIC Pair1 are the two DMICs connected on the DMICN1 connector.
> +	 * DMIC Pair2 are the two DMICs connected on the DMICN2 connector.
> +	 * Facing the camera, DMIC Pair1 are on the left side, DMIC Pair2
> +	 * are on the right side.
> +	 */
> +	{"DMIC L1", NULL, "DMIC Pair1"},
> +	{"DMIC R1", NULL, "DMIC Pair1"},
> +	{"DMIC L2", NULL, "DMIC Pair2"},
> +	{"DMIC R2", NULL, "DMIC Pair2"},
> +
> +	/* CODEC BE connections */
> +	{"SSP0 CODEC IN", NULL, "AIF1 Capture"},
> +	{"AIF1 Playback", NULL, "SSP0 CODEC OUT"},
> +};
> +
> +static const struct snd_kcontrol_new bdw_rt5650_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Speaker"),
> +	SOC_DAPM_PIN_SWITCH("Headphone"),
> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +	SOC_DAPM_PIN_SWITCH("DMIC Pair1"),
> +	SOC_DAPM_PIN_SWITCH("DMIC Pair2"),
> +};
> +
> +

extra newline

> +static struct snd_soc_jack headphone_jack;
> +static struct snd_soc_jack mic_jack;
> +
> +static struct snd_soc_jack_pin headphone_jack_pin = {
> +	.pin	= "Headphone",
> +	.mask	= SND_JACK_HEADPHONE,
> +};
> +
> +static struct snd_soc_jack_pin mic_jack_pin = {
> +	.pin	= "Headset Mic",
> +	.mask	= SND_JACK_MICROPHONE,
> +};
> +
> +static int broadwell_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
> +			struct snd_pcm_hw_params *params)
> +{
> +	struct snd_interval *rate = hw_param_interval(params,
> +			SNDRV_PCM_HW_PARAM_RATE);
> +	struct snd_interval *channels = hw_param_interval(params,
> +						SNDRV_PCM_HW_PARAM_CHANNELS);
> +
> +	/* The ADSP will covert the FE rate to 48k, max 4-channels */
> +	rate->min = rate->max = 48000;
> +	channels->min = 2;
> +	channels->max = 4;
> +
> +	/* set SSP0 to 24 bit */
> +	snd_mask_set(&params->masks[SNDRV_PCM_HW_PARAM_FORMAT -
> +				    SNDRV_PCM_HW_PARAM_FIRST_MASK],
> +				    SNDRV_PCM_FORMAT_S24_LE);
> +	return 0;
> +}
> +
> +static int bdw_rt5650_hw_params(struct snd_pcm_substream *substream,
> +	struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *codec_dai = rtd->codec_dai;
> +	int ret;
> +
> +	/* Workaround: set codec PLL to 19.2MHz that PLL source is
> +	 * from MCLK(24MHz) to conform 2.4MHz DMIC clock.
> +	 */
> +	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5645_PLL1_S_MCLK,
> +		24000000, 19200000);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* The actual MCLK freq is 24MHz. The codec is told that MCLK is
> +	 * 24.576MHz to satisfy the requirement of rl6231_get_clk_info.
> +	 * ASRC is enabled on AD and DA filters to ensure good audio quality.
> +	 */
> +	ret = snd_soc_dai_set_sysclk(codec_dai, RT5645_SCLK_S_PLL1, 24576000,
> +		SND_SOC_CLOCK_IN);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static struct snd_soc_ops bdw_rt5650_ops = {
> +	.hw_params = bdw_rt5650_hw_params,
> +};
> +
> +static int bdw_rt5650_rtd_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
> +	struct sst_pdata *pdata = dev_get_platdata(component->dev);
> +	struct sst_hsw *broadwell = pdata->dsp;
> +	int ret;
> +
> +	/* Set ADSP SSP port settings
> +	 * clock_divider = 4 means BCLK = MCLK/5 = 24MHz/5 = 4.8MHz
> +	 */
> +	ret = sst_hsw_device_set_config(broadwell, SST_HSW_DEVICE_SSP_0,
> +		SST_HSW_DEVICE_MCLK_FREQ_24_MHZ,
> +		SST_HSW_DEVICE_TDM_CLOCK_MASTER, 4);

this is going to break compilation if SOF is selected. this function 
should be filtered out with
#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)

as done in bdw-rt5677

> +	if (ret < 0) {
> +		dev_err(rtd->dev, "error: failed to set device config\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int bdw_rt5650_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct bdw_rt5650_priv *bdw_rt5650 =
> +		snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_component *component = rtd->codec_dai->component;
> +	struct snd_soc_dai *codec_dai = rtd->codec_dai;
> +	int ret;
> +
> +	/* Enable codec ASRC function for Stereo DAC/Stereo1 ADC/DMIC/I2S1.
> +	 * The ASRC clock source is clk_i2s1_asrc.
> +	 */
> +	rt5645_sel_asrc_clk_src(component,
> +				RT5645_DA_STEREO_FILTER |
> +				RT5645_DA_MONO_L_FILTER |
> +				RT5645_DA_MONO_R_FILTER |
> +				RT5645_AD_STEREO_FILTER |
> +				RT5645_AD_MONO_L_FILTER |
> +				RT5645_AD_MONO_R_FILTER,
> +				RT5645_CLK_SEL_I2S1_ASRC);
> +
> +	/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
> +	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xF, 0xF, 4, 24);

could we move this to bdw_rt5650_rtd_init() so that this doesn't impact SOF?

> +
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "can't set codec TDM slot %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Create and initialize headphone jack */
> +	if (snd_soc_card_jack_new(rtd->card, "Headphone Jack",
> +			SND_JACK_HEADPHONE, &headphone_jack,
> +			&headphone_jack_pin, 1)) {
> +		dev_err(component->dev, "Can't create headphone jack\n");
> +	}
> +
> +	/* Create and initialize mic jack */
> +	if (snd_soc_card_jack_new(rtd->card, "Mic Jack", SND_JACK_MICROPHONE,
> +			&mic_jack, &mic_jack_pin, 1)) {
> +		dev_err(component->dev, "Can't create mic jack\n");
> +	}
> +
> +	rt5645_set_jack_detect(component, &headphone_jack, &mic_jack, NULL);
> +
> +	bdw_rt5650->component = component;
> +
> +	return 0;
> +}
> +
> +/* broadwell digital audio interface glue - connects codec <--> CPU */
> +SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
> +SND_SOC_DAILINK_DEF(fe, DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
> +SND_SOC_DAILINK_DEF(platform,
> +	DAILINK_COMP_ARRAY(COMP_PLATFORM("haswell-pcm-audio")));
> +SND_SOC_DAILINK_DEF(be,
> +	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5650:00", "rt5645-aif1")));
> +
> +static struct snd_soc_dai_link bdw_rt5650_dais[] = {
> +	/* Front End DAI links */
> +	{
> +		.name = "System PCM",
> +		.stream_name = "System Playback",
> +		.dynamic = 1,
> +		.init = bdw_rt5650_rtd_init,
> +		.trigger = {
> +			SND_SOC_DPCM_TRIGGER_POST,
> +			SND_SOC_DPCM_TRIGGER_POST
> +		},
> +		.dpcm_playback = 1,
> +		.dpcm_capture = 1,
> +		SND_SOC_DAILINK_REG(fe, dummy, platform),
> +	},
> +
> +	/* Back End DAI links */
> +	{
> +		/* SSP0 - Codec */
> +		.name = "Codec",
> +		.id = 0,
> +		.no_pcm = 1,
> +		.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF |
> +			SND_SOC_DAIFMT_CBS_CFS,
> +		.ignore_suspend = 1,
> +		.ignore_pmdown_time = 1,
> +		.be_hw_params_fixup = broadwell_ssp0_fixup,
> +		.ops = &bdw_rt5650_ops,
> +		.dpcm_playback = 1,
> +		.dpcm_capture = 1,
> +		.init = bdw_rt5650_init,
> +		SND_SOC_DAILINK_REG(dummy, be, dummy)
> +	},
> +};
> +
> +/* ASoC machine driver for Broadwell DSP + RT5650 */
> +static struct snd_soc_card bdw_rt5650_card = {
> +	.name = "bdw-rt5650",
> +	.owner = THIS_MODULE,
> +	.dai_link = bdw_rt5650_dais,
> +	.num_links = ARRAY_SIZE(bdw_rt5650_dais),
> +	.dapm_widgets = bdw_rt5650_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(bdw_rt5650_widgets),
> +	.dapm_routes = bdw_rt5650_map,
> +	.num_dapm_routes = ARRAY_SIZE(bdw_rt5650_map),
> +	.controls = bdw_rt5650_controls,
> +	.num_controls = ARRAY_SIZE(bdw_rt5650_controls),
> +	.fully_routed = true,
> +};
> +
> +static int bdw_rt5650_probe(struct platform_device *pdev)
> +{
> +	struct bdw_rt5650_priv *bdw_rt5650;
> +
> +	bdw_rt5650_card.dev = &pdev->dev;
> +
> +	/* Allocate driver private struct */
> +	bdw_rt5650 = devm_kzalloc(&pdev->dev, sizeof(struct bdw_rt5650_priv),
> +		GFP_KERNEL);
> +	if (!bdw_rt5650)
> +		return -ENOMEM;

can you add the part for the platform name override to help with SOF 
usage, same as in bdw-rt5677, this would be:

	/* override plaform name, if required */
	mach = (&pdev->dev)->platform_data;
	if (mach) /* extra check since legacy does not pass parameters */
		platform_name = mach->mach_params.platform;

	ret = snd_soc_fixup_dai_links_platform_name(&bdw_rt5650_card,
						    platform_name);
	if (ret)
		return ret;


> +	snd_soc_card_set_drvdata(&bdw_rt5650_card, bdw_rt5650);
> +
> +	return snd_soc_register_card(&bdw_rt5650_card);
> +}
> +
> +static int bdw_rt5650_remove(struct platform_device *pdev)
> +{
> +	snd_soc_unregister_card(&bdw_rt5650_card);
> +	return 0;
> +}
> +
> +static struct platform_driver bdw_rt5650_audio = {
> +	.probe = bdw_rt5650_probe,
> +	.remove = bdw_rt5650_remove,
> +	.driver = {
> +		.name = "bdw-rt5650",
> +		.owner = THIS_MODULE,

.owner is not necessary?

> +	},
> +};
> +
> +module_platform_driver(bdw_rt5650_audio)
> +
> +/* Module information */
> +MODULE_AUTHOR("Ben Zhang <benzh@chromium.org>");
> +MODULE_DESCRIPTION("Intel Broadwell RT5650 machine driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:bdw-rt5650");
> diff --git a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
> index d27853e7a369..ba3d25658436 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
> @@ -29,6 +29,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_broadwell_machines[] = {
>   		.sof_fw_filename = "sof-bdw.ri",
>   		.sof_tplg_filename = "sof-bdw-rt286.tplg",
>   	},
> +	{
> +		.id = "10EC5650",
> +		.drv_name = "bdw-rt5650",
> +		.fw_filename = "intel/IntcSST2.bin",

can you add a placeholder for SOF?

		.sof_fw_filename = "sof-bdw.ri",
		.sof_tplg_filename = "sof-bdw-rt5650.tplg",

> +	},
>   	{
>   		.id = "RT5677CE",
>   		.drv_name = "bdw-rt5677",
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
