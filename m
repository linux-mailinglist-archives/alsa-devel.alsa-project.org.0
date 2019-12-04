Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC132112114
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 02:35:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D6C81612;
	Wed,  4 Dec 2019 02:34:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D6C81612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575423314;
	bh=L1Q/DuVw490fGVBB9TBVDMtwjQHmyujvSTIvzx+AJ3I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oHcOmlebfhO+RyeQdP0s8GvaljKsBIE6Hkq/aXG5Pz57h5Jt3FyiNORm+xQjpCJIg
	 TsHUlq+6nRaGNACqATvfYDW7q309K3JSdpy5tzi1bZT4PD6poFdIPdGj7KFm5uNgiH
	 gci4E1TrpSa6S3X0d9l2/UGEl7H9n0mbzhPVIOcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E872F80233;
	Wed,  4 Dec 2019 02:32:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A148CF8022C; Wed,  4 Dec 2019 02:32:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E85A9F800F0
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 02:32:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E85A9F800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 17:32:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,275,1571727600"; d="scan'208";a="208639727"
Received: from cakumnji-mobl.amr.corp.intel.com (HELO [10.254.102.10])
 ([10.254.102.10])
 by fmsmga008.fm.intel.com with ESMTP; 03 Dec 2019 17:32:41 -0800
To: Curtis Malainey <cujomalainey@chromium.org>, alsa-devel@alsa-project.org
References: <20191204011118.74217-1-cujomalainey@chromium.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a828597a-2faa-d672-a6a0-43fcaaa6bca1@linux.intel.com>
Date: Tue, 3 Dec 2019 19:23:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191204011118.74217-1-cujomalainey@chromium.org>
Content-Language: en-US
Cc: Hui Wang <hui.wang@canonical.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Allison Randal <allison@lohutok.net>, Naveen Manohar <naveen.m@intel.com>,
 Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Bard Liao <bardliao@realtek.com>, Thomas Gleixner <tglx@linutronix.de>,
 Jon Flatley <jflat@chromium.org>, Bard liao <yung-chuan.liao@linux.intel.com>,
 Jenny TC <jenny.tc@intel.com>
Subject: Re: [alsa-devel] [RESEND PATCH] ASoC: intel: Add Broadwell rt5650
 machine driver
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



On 12/3/19 7:11 PM, Curtis Malainey wrote:
> From: Ben Zhang <benzh@chromium.org>
> 
> Add machine driver for Broadwell + rt5650.

Curtis, you may want to take a look at the comments posted on July 22. I 
quickly re-added the obvious ones below.

We can improve this a bit and make it SOF-ready - or at least avoid 
build conflicts.

> 
> Signed-off-by: Bard Liao <bardliao@realtek.com>
> Signed-off-by: Ben Zhang <benzh@chromium.org>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> Signed-off-by: Jon Flatley <jflat@chromium.org>
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>   sound/soc/intel/boards/Kconfig                |  11 +
>   sound/soc/intel/boards/Makefile               |   2 +
>   sound/soc/intel/boards/bdw-rt5650.c           | 310 ++++++++++++++++++
>   .../common/soc-acpi-intel-hsw-bdw-match.c     |   5 +
>   4 files changed, 328 insertions(+)
>   create mode 100644 sound/soc/intel/boards/bdw-rt5650.c
> 
> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> index 6c9fd9ad566ed..5f31fadd2e1a1 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -31,6 +31,17 @@ endif ## SND_SOC_INTEL_HASWELL
>   
>   if SND_SOC_INTEL_HASWELL || SND_SOC_SOF_BROADWELL
>   
> +config SND_SOC_INTEL_BDW_RT5650_MACH
> +	tristate "Broadwell with RT5650 codec"
> +	depends on SND_SOC_INTEL_SST && X86_INTEL_LPSS && DW_DMAC

Intel sst is not needed

Also need to aligned with other machine drivers.

> +	select SND_COMPRESS_OFFLOAD

not needed?

> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/delay.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <sound/pcm_params.h>
> +#include <sound/jack.h>

sound/soc-acpi.h

> +
> +#include "../common/sst-dsp.h"
> +#include "../haswell/sst-haswell-ipc.h"
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
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "error: failed to set device config\n");
> +		return ret;
> +	}

add ifdef for SOF

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
> +
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "can't set codec TDM slot %d\n", ret);
> +		return ret;
> +	}

move to use format defined by topology for SOF?

> +/* ASoC machine driver for Broadwell DSP + RT5650 */
> +static struct snd_soc_card bdw_rt5650_card = {
> +	.name = "bdw-rt5650",
> +	.owner = THIS_MODULE,

is this needed?

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

platform override stuff needed.

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

is this needed?

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
> index 34eb0baaa9517..cae1e559ec79b 100644
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

add SOF files?

> +	},
>   	{
>   		.id = "RT5677CE",
>   		.drv_name = "bdw-rt5677",
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
