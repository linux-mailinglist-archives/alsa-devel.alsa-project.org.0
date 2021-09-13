Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3D44098E9
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:23:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C568B17B3;
	Mon, 13 Sep 2021 18:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C568B17B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631550216;
	bh=x3kFLQUpccqNk8OrX1YNcdQ8VsR2zMhWHpq0irChdKA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qhPUN1YYGLvmCOUYdAcgYOC9d7s0i47uQNUwk/ZUr3geSHzREE+npReXH54/GFsm4
	 q6i8+2DDBwc8lUFxn9Q7Kvz9VWzl8a0QSJ/y7xcqMlRhw5dN1O95+hBxiepgic2euG
	 fsii7sqAMUbQd2rLTRxwHt0OrBA1tahM/eqSkEgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BFAEF802E8;
	Mon, 13 Sep 2021 18:22:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37385F8027C; Mon, 13 Sep 2021 18:22:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64E46F80169
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64E46F80169
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="221759423"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="221759423"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 09:22:02 -0700
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="543334450"
Received: from rljames-mobl1.amr.corp.intel.com (HELO [10.255.78.21])
 ([10.255.78.21])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 09:22:01 -0700
Subject: Re: [PATCH v2] ASoC: Intel: boards: add max98390 2/4 speakers support
To: Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
References: <20210913100026.19393-1-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <06178b15-9ab2-4c8b-4354-17063ed0fe0d@linux.intel.com>
Date: Mon, 13 Sep 2021 11:21:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913100026.19393-1-mac.chiang@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: jairaj.arava@intel.com, mark_hsieh@wistron.com, keith.tzeng@quantatw.com,
 broonie@kernel.org, sathyanarayana.nujella@intel.com, bard.liao@intel.com
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


I don't quite follow the initialization part. In the 4-ch case, you will
setup control and widgets but...

> +int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	int ret;
> +
> +	ret = snd_soc_dapm_new_controls(&card->dapm, max_98390_tt_dapm_widgets,
> +						ARRAY_SIZE(max_98390_tt_dapm_widgets));
> +	if (ret) {
> +		dev_err(rtd->dev, "unable to add dapm controls, ret %d\n", ret);
> +		/* Don't need to add routes if widget addition failed */
> +		return ret;
> +	}
> +
> +	ret = snd_soc_add_card_controls(card, max_98390_tt_kcontrols,
> +						ARRAY_SIZE(max_98390_tt_kcontrols));
> +	if (ret) {
> +		dev_err(rtd->dev, "unable to add card controls, ret %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_dapm_add_routes(&card->dapm, max_98373_dapm_routes,
> +					ARRAY_SIZE(max_98373_dapm_routes));
> +	if (ret) {
> +		dev_err(rtd->dev, "Speaker Left, Right  map addition failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_tt_dapm_routes,
> +						ARRAY_SIZE(max_98390_tt_dapm_routes));
> +	if (ret)
> +		dev_err(rtd->dev, "Tweeter Speaker Left, Right map addition failed: %d\n", ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS(max_98390_spk_codec_init, SND_SOC_INTEL_SOF_MAXIM_COMMON);

> @@ -745,6 +778,21 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  		} else if (sof_rt5682_quirk &
>  				SOF_RT1011_SPEAKER_AMP_PRESENT) {
>  			sof_rt1011_dai_link(&links[id]);
> +		} else if (sof_rt5682_quirk &
> +				SOF_MAX98390_SPEAKER_AMP_PRESENT) {
> +			if (sof_rt5682_quirk &
> +				SOF_MAX98390_TWEETER_SPEAKER_PRESENT) {
> +				links[id].codecs = max_98390_4spk_components;
> +				links[id].num_codecs = ARRAY_SIZE(max_98390_4spk_components);
> +				links[id].init = max_98390_spk_codec_init;
> +			} else {
> +				links[id].codecs = max_98390_components;
> +				links[id].num_codecs = ARRAY_SIZE(max_98390_components);
> +				links[id].init = max_98373_spk_codec_init;
> +			}

... in the 2 ch case you use this function

int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
{
	struct snd_soc_card *card = rtd->card;
	int ret;

	ret = snd_soc_dapm_add_routes(&card->dapm, max_98373_dapm_routes,
				      ARRAY_SIZE(max_98373_dapm_routes));
	if (ret)
		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
	return ret;
}

which only adds routes. Isn't there a need for widgets/controls for the
2 channel case as well?

It's also not good practice to mix the initialization of max98090 with a
function with an explicit 98373 prefix. it's hard to maintain and
error-prone. You might as well duplicate the function, if it's not used
it will be removed while linking.

> +			links[id].ops = &max_98390_ops;
> +			links[id].dpcm_capture = 1;
> +
>  		} else {
>  			max_98357a_dai_link(&links[id]);
>  		}
> @@ -881,6 +929,14 @@ static int sof_audio_probe(struct platform_device *pdev)
>  		sof_rt1011_codec_conf(&sof_audio_card_rt5682);
>  	else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
>  		sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
> +	else if (sof_rt5682_quirk & SOF_MAX98390_SPEAKER_AMP_PRESENT) {
> +		if (sof_rt5682_quirk & SOF_MAX98390_TWEETER_SPEAKER_PRESENT)
> +			max_98390_set_codec_conf(&sof_audio_card_rt5682,
> +						ARRAY_SIZE(max_98390_4spk_components));
> +		else
> +			max_98390_set_codec_conf(&sof_audio_card_rt5682,
> +						ARRAY_SIZE(max_98390_components));
> +	}
>  
>  	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
>  		sof_audio_card_rt5682.num_links++;
> @@ -1007,6 +1063,18 @@ static const struct platform_device_id board_ids[] = {
>  					SOF_RT5682_SSP_AMP(2) |
>  					SOF_RT5682_NUM_HDMIDEV(4)),
>  	},
> +	{
> +		.name = "adl_max98390_rt5682",
> +		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
> +					SOF_RT5682_SSP_CODEC(0) |
> +					SOF_SPEAKER_AMP_PRESENT |
> +					SOF_MAX98390_SPEAKER_AMP_PRESENT |
> +					SOF_RT5682_SSP_AMP(1) |
> +					SOF_RT5682_NUM_HDMIDEV(4) |
> +					SOF_BT_OFFLOAD_SSP(2) |
> +					SOF_SSP_BT_OFFLOAD_PRESENT),
> +	},
> +
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, board_ids);
> @@ -1026,6 +1094,7 @@ MODULE_DESCRIPTION("SOF Audio Machine driver");
>  MODULE_AUTHOR("Bard Liao <bard.liao@intel.com>");
>  MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
>  MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
> +MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
>  MODULE_LICENSE("GPL v2");
>  MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
>  MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> index a0f6a69c7038..2db152998e4a 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> @@ -280,6 +280,11 @@ static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
>  	.codecs = {"MX98357A"}
>  };
>  
> +static const struct snd_soc_acpi_codecs adl_max98390_amp = {
> +	.num_codecs = 1,
> +	.codecs = {"MX98390"}
> +};
> +
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  	{
>  		.id = "10EC5682",
> @@ -297,6 +302,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  		.sof_fw_filename = "sof-adl.ri",
>  		.sof_tplg_filename = "sof-adl-max98357a-rt5682.tplg",
>  	},
> +	{
> +		.id = "10EC5682",
> +		.drv_name = "adl_max98390_rt5682",
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &adl_max98390_amp,
> +		.sof_fw_filename = "sof-adl.ri",
> +		.sof_tplg_filename = "sof-adl-max98390-rt5682.tplg",
> +	},
>  	{},
>  };
>  EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
> index bc9e70765678..be90a5f79766 100644
> --- a/sound/soc/sof/sof-pci-dev.c
> +++ b/sound/soc/sof/sof-pci-dev.c
> @@ -59,6 +59,15 @@ static const struct dmi_system_id sof_tplg_table[] = {
>  		},
>  		.driver_data = "sof-adl-rt5682-ssp0-max98373-ssp2.tplg",
>  	},
> +	{
> +		.callback = sof_tplg_cb,
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
> +			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98390_ALC5682I_I2S"),
> +		},
> +		.driver_data = "sof-adl-max98390-ssp2-rt5682-ssp0.tplg",
> +	},
> +

I am still relatively confused since you still have two alternatives for
topology but you described three configurations.
