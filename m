Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EA57DE77
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2019 17:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B10416A6;
	Thu,  1 Aug 2019 17:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B10416A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564672188;
	bh=dQtQMxESNfGt9Xv11F3Eufh7hmv+37+MBr1dEVY0O8A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FGO7BBmMm2NNpeCTRCVq6FBP8+ZcyZaciFyNF56W17zIXHhTlCuBGnvO9yhmFYjwN
	 5v7ZG0EDHtAuDyS0VHCSy2IQvUKTbPZfmMVm7ckfXTSVJsGQ4M2/MW9g0wi0/mgUzB
	 bcrCcyYYtuIcbeie8WIcQ3hkBKvdt7a17af+1/xA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6EFBF804CF;
	Thu,  1 Aug 2019 17:08:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10EE5F804CB; Thu,  1 Aug 2019 17:05:26 +0200 (CEST)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D2DBF804CB
 for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2019 16:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D2DBF804CB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 07:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,334,1559545200"; d="scan'208";a="174651969"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 01 Aug 2019 07:55:20 -0700
Received: from cwhanson-mobl.amr.corp.intel.com (unknown [10.252.133.191])
 by linux.intel.com (Postfix) with ESMTP id 73C4458050C;
 Thu,  1 Aug 2019 07:55:19 -0700 (PDT)
To: mac.chiang@intel.com, alsa-devel@alsa-project.org
References: <1564646564-24990-1-git-send-email-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f8641bba-5da0-1bc8-7580-f9514e2ac718@linux.intel.com>
Date: Thu, 1 Aug 2019 09:55:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564646564-24990-1-git-send-email-mac.chiang@intel.com>
Content-Language: en-US
Cc: sathya.prakash.m.r@intel.com, broonie@kernel.org, bard.liao@intel.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: boards: Add Cometlake Dialog
 Maxim machine driver
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


> -config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
> -	tristate "KBL with DA7219 and MAX98357A in I2S Mode"
> -	depends on I2C && ACPI
> -	depends on MFD_INTEL_LPSS || COMPILE_TEST
> -	select SND_SOC_DA7219
> -	select SND_SOC_MAX98357A
> -	select SND_SOC_DMIC
> -	select SND_SOC_HDAC_HDMI
> -	help
> -	  This adds support for ASoC Onboard Codec I2S machine driver. This will
> -	  create an alsa sound card for DA7219 + MAX98357A I2S audio codec.
> -	  Say Y if you have such a device.
> -
>   config SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH
>   	tristate "KBL with DA7219 and MAX98927 in I2S Mode"
>   	depends on I2C && ACPI
> @@ -363,6 +350,24 @@ config SND_SOC_INTEL_KBL_RT5660_MACH
>   
>   endif ## SND_SOC_INTEL_KBL
>   
> +if SND_SOC_INTEL_KBL || SND_SOC_SOF_COMETLAKE_LP
> +
> +config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
> +	tristate "KBL with DA7219 and MAX98357A in I2S Mode"
> +	depends on I2C && ACPI
> +	depends on MFD_INTEL_LPSS || COMPILE_TEST
> +	select SND_SOC_DA7219
> +	select SND_SOC_MAX98357A
> +	select SND_SOC_DMIC
> +	select SND_SOC_HDAC_HDMI
> +	help
> +	  This adds support for ASoC Onboard Codec I2S machine driver. This will
> +	  create an alsa sound card for DA7219 + MAX98357A I2S audio codec for
> +	  Kabylake/Cometlake platforms.
> +	  Say Y if you have such a device.
> +
> +endif ## SND_SOC_INTEL_KBL || SND_SOC_SOF_COMETLAKE_LP

We should not mix generations and SST/SOF drivers like this, it's not 
going to be maintainable.

What you can do is have a common hidden option such as

config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
	tristate
	select SND_SOC_DA7219
	select SND_SOC_MAX98357A
	select SND_SOC_DMIC
	select SND_SOC_HDAC_HDMI

if SND_SOC_INTEL_KBL
config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
	tristate "KBL with DA7219 and MAX98357A in I2S Mode"
	depends on I2C && ACPI
	depends on MFD_INTEL_LPSS || COMPILE_TEST
	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
endif


if SND_SOC_SOF_COMETLAKE_LP
config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
	tristate "CML_LP with DA7219 and MAX98357A in I2S Mode"
	depends on I2C && ACPI
	depends on MFD_INTEL_LPSS || COMPILE_TEST
	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
endif

The other problem I have with this patch is that there are two existing 
machine drivers with almost the same configuration:
bxt_da7219_max98357a
kbl_da7219_max98357a

Why did you pick the latter?
The bxt_da7219_max98357a already supports BXT and GLK, and works with 
SOF, and it wouldn't be that difficult to extend further. And if you add 
CML_LP, then we could longer term make the KBL-specific machine driver 
go away.

We really need to stop all this incremental work and reuse machine 
drivers when the only differences are clock values (24/19.2) and SSP 
indices.

I stop here, not even looking at code differences until we have an 
agreed direction on code reuse.

> +
>   if SND_SOC_INTEL_GLK || (SND_SOC_SOF_GEMINILAKE  && SND_SOC_SOF_HDA_LINK)
>   
>   config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
> diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
> index 537a889..fe3ac70 100644
> --- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
> +++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
> @@ -9,6 +9,7 @@
>    *   RT5663 codecs
>    */
>   
> +#include <asm/cpu_device_id.h>
>   #include <linux/input.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> @@ -17,6 +18,7 @@
>   #include <sound/pcm.h>
>   #include <sound/pcm_params.h>
>   #include <sound/soc.h>
> +#include <sound/soc-acpi.h>
>   #include "../../codecs/da7219.h"
>   #include "../../codecs/hdac_hdmi.h"
>   #include "../../codecs/da7219-aad.h"
> @@ -210,7 +212,11 @@ static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
>   	if (!pcm)
>   		return -ENOMEM;
>   
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
> +	pcm->device = dai->id;
> +#else
>   	pcm->device = device;
> +#endif
>   	pcm->codec_dai = dai;
>   
>   	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
> @@ -587,9 +593,17 @@ static struct snd_soc_card kabylake_audio_card_da7219_m98357a = {
>   	.late_probe = kabylake_card_late_probe,
>   };
>   
> +static const struct x86_cpu_id cml_ids[] = {
> +	{ X86_VENDOR_INTEL, 6, 0x8E }, /* Cometlake CPU_ID */
> +	{}
> +};
> +
>   static int kabylake_audio_probe(struct platform_device *pdev)
>   {
>   	struct kbl_codec_private *ctx;
> +	struct snd_soc_acpi_mach *mach;
> +	const char *platform_name;
> +	int ret;
>   
>   	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
>   	if (!ctx)
> @@ -600,17 +614,46 @@ static int kabylake_audio_probe(struct platform_device *pdev)
>   	kabylake_audio_card =
>   		(struct snd_soc_card *)pdev->id_entry->driver_data;
>   
> +	kabylake_audio_card = &kabylake_audio_card_da7219_m98357a;
> +
>   	kabylake_audio_card->dev = &pdev->dev;
>   	snd_soc_card_set_drvdata(kabylake_audio_card, ctx);
> +
> +	if (x86_match_cpu(cml_ids)) {
> +		unsigned int i;
> +
> +		kabylake_audio_card->name = "cmlda7219max";
> +
> +		for (i = 0; i < ARRAY_SIZE(kabylake_dais); i++) {
> +			/* MAXIM_CODEC is connected to SSP1. */
> +			if (!strcmp(kabylake_dais[i].cpus->dai_name,
> +					KBL_MAXIM_CODEC_DAI)) {
> +				kabylake_dais[i].name = "SSP1-Codec";
> +				kabylake_dais[i].cpus->dai_name = "SSP1 Pin";
> +			}
> +			/* DIALOG_CODEC is connected to SSP0 */
> +			else if (!strcmp(kabylake_dais[i].cpus->dai_name,
> +					KBL_DIALOG_CODEC_DAI)) {
> +				kabylake_dais[i].name = "SSP0-Codec";
> +				kabylake_dais[i].cpus->dai_name = "SSP0 Pin";
> +			}
> +		}
> +	}
> +
> +	mach = (&pdev->dev)->platform_data;
> +	platform_name = mach->mach_params.platform;
> +
> +	ret = snd_soc_fixup_dai_links_platform_name(kabylake_audio_card,
> +							platform_name);
> +	if (ret)
> +		return ret;
> +
>   	return devm_snd_soc_register_card(&pdev->dev, kabylake_audio_card);
>   }
>   
>   static const struct platform_device_id kbl_board_ids[] = {
> -	{
> -		.name = "kbl_da7219_max98357a",
> -		.driver_data =
> -			(kernel_ulong_t)&kabylake_audio_card_da7219_m98357a,
> -	},
> +	{.name = "kbl_da7219_max98357a",},
> +	{.name = "cml_da7219_max98357a",},
>   	{ }
>   };
>   
> @@ -628,5 +671,7 @@ module_platform_driver(kabylake_audio)
>   /* Module information */
>   MODULE_DESCRIPTION("Audio Machine driver-DA7219 & MAX98357A in I2S mode");
>   MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
> +MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
>   MODULE_LICENSE("GPL v2");
>   MODULE_ALIAS("platform:kbl_da7219_max98357a");
> +MODULE_ALIAS("platform:cml_da7219_max98357a");
> diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
> index c36c0aa..4ea32b2 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
> @@ -19,6 +19,11 @@ static struct snd_soc_acpi_codecs cml_codecs = {
>   	.codecs = {"10EC5682"}
>   };
>   
> +static struct snd_soc_acpi_codecs cml_spk_codecs = {
> +	.num_codecs = 1,
> +	.codecs = {"MX98357A"}
> +};
> +
>   struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
>   	{
>   		.id = "INT34C2",
> @@ -29,6 +34,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
>   		.sof_tplg_filename = "sof-cnl-rt274.tplg",
>   	},
>   	{
> +		.id = "DLGS7219",
> +		.drv_name = "cml_da7219_max98357a",
> +		.quirk_data = &cml_spk_codecs,
> +		.sof_fw_filename = "sof-cnl.ri",
> +		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
> +	},
> +	{
>   		.id = "MX98357A",
>   		.drv_name = "sof_rt5682",
>   		.quirk_data = &cml_codecs,
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
