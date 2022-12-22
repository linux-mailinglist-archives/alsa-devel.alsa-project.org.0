Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC766653D8A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 10:36:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F52339AD;
	Thu, 22 Dec 2022 10:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F52339AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671701779;
	bh=un3/itQbIGxQbHjKIjTjMRB20sdrr9i2f9RmnnhvKOE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NaffUicty2IrJH/0qRAjqoxkJAGPqg7sohkH6twROhuMe/Sxq9ixYIeCJjuIVxBi1
	 j06p9ULpT/82VQq00FtXCczCfM2WLvcnqzqtjib6g2ncxby0/5hoO30AlVZt/98zal
	 nt6x+l3Qqh8nwt6smVjL9iQ6gWcH31jNDMJ/QTms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E620CF80158;
	Thu, 22 Dec 2022 10:35:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5213F8025F; Thu, 22 Dec 2022 10:35:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2014EF80158
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 10:35:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2014EF80158
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ja4t9lxo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671701717; x=1703237717;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=un3/itQbIGxQbHjKIjTjMRB20sdrr9i2f9RmnnhvKOE=;
 b=ja4t9lxo++o+VrmuO23TIkQuWS9Yf1KD0P2XaI6aPo2ryHoonvpRjF9W
 xo+XW88BCoDDzgQdGJKUZmtFORJWsI0TDdV8IaJefc56xu46YnlCoEnmH
 XZ4ht24fSL3hriKkaSkATcKhC7m0EYG5w42KA7DupMADl/SDDKSLsSlXV
 4JjAvOudfxoGPWG4v02m8XRPlHStN9GVucNQvMDcCJAcsfSAnpxUE8WTU
 94PmB3gHLvPrEYAuV0hKZa3bhzPhgVnDzuv9fecoU+IOBvOT+y/l+Qlxw
 LTot8chaB3SJfKwP7tW9Pu6e4FBbSZu7iDLF3OpanKBxwNlEBY5/2wAIq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="347228100"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="347228100"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 01:35:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629463340"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="629463340"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 01:35:08 -0800
Message-ID: <64dc2998-dcd7-686e-2434-3facb16e4aa5@linux.intel.com>
Date: Thu, 22 Dec 2022 10:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ASoC: Intel: avs: Add support for RT5663 codec
To: Alicja Michalska <ahplka19@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <Y6No3WsiZ7Sbg35u@tora>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <Y6No3WsiZ7Sbg35u@tora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: cezary.rojewski@intel.com, upstream@semihalf.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 cujomalainey@chromium.org, lma@semihalf.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12/21/2022 9:13 PM, Alicja Michalska wrote:
> This patch adds support for RT5663 codec on KBL platform.
> Such hardware configuration can be found in Google Pixelbook (Google/Eve).
> 
> Reported-and-tested-by: CoolStar <coolstarorganization@gmail.com>
> Signed-off-by: Alicja Michalska <ahplka19@gmail.com>
> 

I've added few comments, but overall it looks ok, some minor differences 
from internal code I wrote for this device, but that can be changed 
later if we see that it is needed. The most important parts look fine to me.

> diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
> index b2823c2107f7..b167a641d1d5 100644
> --- a/sound/soc/intel/avs/board_selection.c
> +++ b/sound/soc/intel/avs/board_selection.c
> @@ -159,6 +159,14 @@ static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
>   		},
>   		.tplg_filename = "da7219-tplg.bin",
>   	},
> +	{
> +		.id = "10EC5663",
> +		.drv_name = "avs_rt5663",
> +		.mach_params = {
> +			.i2s_link_mask = AVS_SSP(1),
> +		},
> +		.tplg_filename = "rt5663-tplg.bin",
> +	},
>   	{},
>   };
>   
> diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
> index e4c230efe8d7..04c090c3f9b5 100644
> --- a/sound/soc/intel/avs/boards/Kconfig
> +++ b/sound/soc/intel/avs/boards/Kconfig
> @@ -125,6 +125,16 @@ config SND_SOC_INTEL_AVS_MACH_RT5682
>   	   Say Y or m if you have such a device. This is a recommended option.
>   	   If unsure select "N".
>   
> +config SND_SOC_INTEL_AVS_MACH_RT5663
> +	tristate "rt5663 in I2S mode"
> +	depends on I2C
> +	depends on MFD_INTEL_LPSS || COMPILE_TEST
> +	select SND_SOC_RT5663_I2C
> +	help
> +	  This adds support for ASoC machine driver with RT5663 I2S audio codec.
> +	  Say Y or m if you have such a device. This is a recommended option.
> +	  If unsure select "N".
> +

Add it before SND_SOC_INTEL_AVS_MACH_RT5682.

>   config SND_SOC_INTEL_AVS_MACH_SSM4567
>   	tristate "ssm4567 I2S board"
>   	depends on I2C
> diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
> index b81343420370..3db863fc26a7 100644
> --- a/sound/soc/intel/avs/boards/Makefile
> +++ b/sound/soc/intel/avs/boards/Makefile
> @@ -13,6 +13,7 @@ snd-soc-avs-rt274-objs := rt274.o
>   snd-soc-avs-rt286-objs := rt286.o
>   snd-soc-avs-rt298-objs := rt298.o
>   snd-soc-avs-rt5682-objs := rt5682.o
> +snd-soc-avs-rt5663-objs := rt5663.o

Add it in alphabetical order.

>   snd-soc-avs-ssm4567-objs := ssm4567.o
>   
>   obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DA7219) += snd-soc-avs-da7219.o
> @@ -28,4 +29,5 @@ obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT274) += snd-soc-avs-rt274.o
>   obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT286) += snd-soc-avs-rt286.o
>   obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT298) += snd-soc-avs-rt298.o
>   obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT5682) += snd-soc-avs-rt5682.o
> +obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT5663) += snd-soc-avs-rt5663.o

Same here.

>   obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_SSM4567) += snd-soc-avs-ssm4567.o
> diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
> new file mode 100644
> index 000000000000..7d8f45267d27
> --- /dev/null
> +++ b/sound/soc/intel/avs/boards/rt5663.c
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright(c) CoolStar. All rights reserved.
> +// Based off da7219 module

No need to mention on which module it is based, they are all based on 
each other and also Skylake driver boards ;).

> +// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
> +//
> +// Author: CoolStar <coolstarorganization.com>
> +// Author: Cezary Rojewski <cezary.rojewski@intel.com>
> +//
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-acpi.h>
> +#include <sound/soc-dapm.h>
> +#include <uapi/linux/input-event-codes.h>
> +#include "../../../codecs/rt5663.h"
> +
> +#define RT5663_DAI_NAME		"rt5663-aif"
> +
> +static const struct snd_kcontrol_new card_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +};
> +
> +static const struct snd_soc_dapm_widget card_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +};
> +
> +static const struct snd_soc_dapm_route card_base_routes[] = {
> +	/* HP jack connectors - unknown if we have jack detection */
> +	{"Headphone Jack", NULL, "HPOL"},
> +	{"Headphone Jack", NULL, "HPOR"},
> +
> +	{"IN1P", NULL, "Headset Mic"},
> +	{"IN1N", NULL, "Headset Mic"},
> +};
> +
> +static int avs_rt5663_codec_init(struct snd_soc_pcm_runtime *runtime)
> +{
> +	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
> +	struct snd_soc_card *card = runtime->card;
> +	struct snd_soc_jack *jack;
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
> +	int ret;

Reverse Christmas tree style.

> +
> +	jack = snd_soc_card_get_drvdata(card);
> +

There is a comment in Skylake machine driver:
/* use ASRC for internal clocks, as PLL rate isn't multiple of BCLK */
I think it is good to have it before calling this function.

> +	rt5663_sel_asrc_clk_src(component,

Just use codec_dai->component as argument here and component in 
declarations above can be removed then.

> +				RT5663_DA_STEREO_FILTER | RT5663_AD_STEREO_FILTER,
> +				RT5663_CLK_SEL_I2S1_ASRC);
> +				
> +	snd_soc_dai_set_sysclk(codec_dai,
> +			RT5663_SCLK_S_MCLK, 24576000, SND_SOC_CLOCK_IN);
> +

Just a note, that in internal code I did same as Skylake machine driver 
and put above two functions in separate _hw_params function, but putting 
it in codec_init should also be fine.

> +	/*
> +	 * Headset buttons map to the google Reference headset.
> +	 * These can be configured by userspace.
> +	 */
> +	ret = snd_soc_card_jack_new(card, "Headset Jack",
> +				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
> +				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
> +				    SND_JACK_BTN_3 | SND_JACK_LINEOUT, jack);
> +	if (ret) {
> +		dev_err(card->dev, "Headset Jack creation failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> +	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
> +	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
> +	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
> +
> +	return 0;
> +}
> +
> +static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
> +			       struct snd_soc_dai_link **dai_link)
> +{
> +	struct snd_soc_dai_link_component *platform;
> +	struct snd_soc_dai_link *dl;
> +
> +	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
> +	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
> +	if (!dl || !platform)
> +		return -ENOMEM;
> +
> +	platform->name = platform_name;
> +
> +	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
> +	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
> +	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
> +	if (!dl->name || !dl->cpus || !dl->codecs)
> +		return -ENOMEM;
> +
> +	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
> +	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-10EC5663:00");
> +	dl->codecs->dai_name = RT5663_DAI_NAME;

dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, RT5663_DAI_NAME);

> +	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
> +		return -ENOMEM;
> +
> +	dl->num_cpus = 1;
> +	dl->num_codecs = 1;
> +	dl->platforms = platform;
> +	dl->num_platforms = 1;
> +	dl->id = 0;
> +	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS; > +	dl->init = avs_rt5663_codec_init;
> +	dl->nonatomic = 1;
> +	dl->no_pcm = 1;
> +	dl->dpcm_capture = 1;
> +	dl->dpcm_playback = 1;
> +
> +	*dai_link = dl;
> +
> +	return 0;
> +}
> +
> +static int avs_create_dapm_routes(struct device *dev, int ssp_port,
> +				  struct snd_soc_dapm_route **routes, int *num_routes)
> +{
> +	struct snd_soc_dapm_route *dr;
> +	const int num_base = ARRAY_SIZE(card_base_routes);
> +	const int num_dr = num_base + 2;
> +	int idx;
> +
> +	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
> +	if (!dr)
> +		return -ENOMEM;
> +
> +	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
> +
> +	idx = num_base;
> +	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "AIF Playback");
> +	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
> +	if (!dr[idx].sink || !dr[idx].source)
> +		return -ENOMEM;
> +
> +	idx++;
> +	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
> +	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "AIF Capture");
> +	if (!dr[idx].sink || !dr[idx].source)
> +		return -ENOMEM;
> +
> +	*routes = dr;
> +	*num_routes = num_dr;
> +
> +	return 0;
> +}
> +
> +static int avs_card_set_jack(struct snd_soc_card *card, struct snd_soc_jack *jack)
> +{
> +	struct snd_soc_component *component;
> +
> +	for_each_card_components(card, component)
> +		snd_soc_component_set_jack(component, jack, NULL);
> +	return 0;
> +}
> +

This change seems to be based on a bit older code, take a look at 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/sound/soc/intel/avs/boards/da7219.c?id=833e250ef592c3c02dda400c1c44306f74241d33
this will remove the above function and change jack handling to better 
flow. As mentioned in above commit we don't need to loop to find jack, 
as we can find right component using codec name.

> +static int avs_card_remove(struct snd_soc_card *card)
> +{
> +	return avs_card_set_jack(card, NULL);
> +}
> +
> +static int avs_card_suspend_pre(struct snd_soc_card *card)
> +{
> +	return avs_card_set_jack(card, NULL);
> +}
> +
> +static int avs_card_resume_post(struct snd_soc_card *card)
> +{
> +	struct snd_soc_jack *jack = snd_soc_card_get_drvdata(card);
> +
> +	return avs_card_set_jack(card, jack);
> +}
> +
> +static int avs_rt5663_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_dapm_route *routes;
> +	struct snd_soc_dai_link *dai_link;
> +	struct snd_soc_acpi_mach *mach;
> +	struct snd_soc_card *card;
> +	struct snd_soc_jack *jack;
> +	struct device *dev = &pdev->dev;
> +	const char *pname;
> +	int num_routes, ssp_port, ret;
> +
> +	mach = dev_get_platdata(dev);
> +	pname = mach->mach_params.platform;
> +	ssp_port = __ffs(mach->mach_params.i2s_link_mask);
> +
> +	ret = avs_create_dai_link(dev, pname, ssp_port, &dai_link);
> +	if (ret) {
> +		dev_err(dev, "Failed to create dai link: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = avs_create_dapm_routes(dev, ssp_port, &routes, &num_routes);
> +	if (ret) {
> +		dev_err(dev, "Failed to create dapm routes: %d", ret);
> +		return ret;
> +	}
> +
> +	jack = devm_kzalloc(dev, sizeof(*jack), GFP_KERNEL);
> +	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
> +	if (!jack || !card)
> +		return -ENOMEM;
> +
> +	card->name = "avs_rt5663";
> +	card->dev = dev;
> +	card->owner = THIS_MODULE;
> +	card->remove = avs_card_remove;
> +	card->suspend_pre = avs_card_suspend_pre;
> +	card->resume_post = avs_card_resume_post;
> +	card->dai_link = dai_link;
> +	card->num_links = 1;
> +	card->controls = card_controls;
> +	card->num_controls = ARRAY_SIZE(card_controls);
> +	card->dapm_widgets = card_widgets;
> +	card->num_dapm_widgets = ARRAY_SIZE(card_widgets);
> +	card->dapm_routes = routes;
> +	card->num_dapm_routes = num_routes;
> +	card->fully_routed = true;
> +	snd_soc_card_set_drvdata(card, jack);
> +
> +	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
> +	if (ret)
> +		return ret;
> +
> +	return devm_snd_soc_register_card(dev, card);
> +}
> +
> +static struct platform_driver avs_rt5663_driver = {
> +	.probe = avs_rt5663_probe,
> +	.driver = {
> +		.name = "avs_rt5663",
> +		.pm = &snd_soc_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(avs_rt5663_driver);
> +
> +MODULE_AUTHOR("CoolStar <coolstarorganization@gmail.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:avs_rt5663");

