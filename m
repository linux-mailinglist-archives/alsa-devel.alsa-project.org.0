Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF08B3DEF4D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 15:50:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7B13182D;
	Tue,  3 Aug 2021 15:49:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7B13182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627998599;
	bh=AMcrqt+zHiJDLEsGJOlaIwbRKF0N/wpmrgBq5qSDrlM=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gSw717FsM4vC0e2BWu342vC1uUBRUujGOtso5lkTHjunzujx3bjlm00lO4aOa8byl
	 d4mozWIEzsiUoyGU0vTe88e9jut3KZ6Hc6dyuDxkmxCFzUdV1FA8GN82y04U5cXV+3
	 pP8Enjy0BZLzAbJkTe5kT2zqGTXoRvdaZMdYEK38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A97AF804AB;
	Tue,  3 Aug 2021 15:48:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0737BF8049E; Tue,  3 Aug 2021 15:48:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A420F80082
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 15:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A420F80082
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="277453583"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="277453583"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 06:48:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="521256861"
Received: from vmustya-mobl1.amr.corp.intel.com (HELO [10.213.171.71])
 ([10.213.171.71])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 06:48:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Add max98390 echo reference
 support
To: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>,
 alsa-devel@alsa-project.org
References: <20210803092013.10749-1-mark_hsieh@wistron.corp-partner.google.com>
Message-ID: <1160d111-fe9c-3a66-fab0-e11675b86169@linux.intel.com>
Date: Tue, 3 Aug 2021 08:46:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803092013.10749-1-mark_hsieh@wistron.corp-partner.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: lance.hou@intel.com, cezary.rojewski@intel.com, mark_hsieh@wistron.com,
 kai.vehmanen@linux.intel.com, yang.jie@linux.intel.com,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, broonie@kernel.org, brent.lu@intel.com,
 bard.liao@intel.com
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

The commit subject is not really correct, it's not about echo reference
support, it's really about basic support for max98390

My main objection is that there's a rather large copy-paste from the
max98373 code, when the only change I can see is the device and dai
names, see below

> +/*
> + * Maxim MAX98390
> + */
> +
> +const struct snd_soc_dapm_route max_98390_dapm_routes[] = {
> +	/* speaker */
> +	{ "Left Spk", NULL, "Left BE_OUT" },
> +	{ "Right Spk", NULL, "Right BE_OUT" },
> +};
> +EXPORT_SYMBOL_NS(max_98390_dapm_routes, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> +
> +static struct snd_soc_codec_conf max_98390_codec_conf[] = {
> +	{
> +		.dlc = COMP_CODEC_CONF(MAX_98390_DEV0_NAME),
> +		.name_prefix = "Right",
> +	},
> +	{
> +		.dlc = COMP_CODEC_CONF(MAX_98390_DEV1_NAME),
> +		.name_prefix = "Left",
> +	},
> +};
> +
> +struct snd_soc_dai_link_component max_98390_components[] = {
> +	{  /* For Right */
> +		.name = MAX_98373_DEV0_NAME,
> +		.dai_name = MAX_98390_CODEC_DAI,
> +	},
> +	{  /* For Left */
> +		.name = MAX_98373_DEV1_NAME,

you've even left two references to 98373 in this structure...

> +		.dai_name = MAX_98390_CODEC_DAI,
> +	},
> +};
> +EXPORT_SYMBOL_NS(max_98390_components, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> +
> +static int max_98390_hw_params(struct snd_pcm_substream *substream,
> +			       struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *codec_dai;
> +	int j;
> +
> +	for_each_rtd_codec_dais(rtd, j, codec_dai) {
> +		if (!strcmp(codec_dai->component->name, MAX_98390_DEV0_NAME)) {
> +			/* DEV0 tdm slot configuration */
> +			snd_soc_dai_set_tdm_slot(codec_dai, 0x03, 3, 8, 32);
> +		}
> +		if (!strcmp(codec_dai->component->name, MAX_98390_DEV1_NAME)) {
> +			/* DEV1 tdm slot configuration */
> +			snd_soc_dai_set_tdm_slot(codec_dai, 0x0C, 3, 8, 32);
> +		}
> +	}
> +	return 0;
> +}
> +
> +int max_98390_trigger(struct snd_pcm_substream *substream, int cmd)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *codec_dai;
> +	struct snd_soc_dai *cpu_dai;
> +	int j;
> +	int ret = 0;
> +
> +	/* set spk pin by playback only */
> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> +		return 0;
> +
> +	cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	for_each_rtd_codec_dais(rtd, j, codec_dai) {
> +		struct snd_soc_dapm_context *dapm =
> +				snd_soc_component_get_dapm(cpu_dai->component);
> +		char pin_name[MAX_98390_PIN_NAME];
> +
> +		snprintf(pin_name, ARRAY_SIZE(pin_name), "%s Spk",
> +			 codec_dai->component->name_prefix);
> +
> +		switch (cmd) {
> +		case SNDRV_PCM_TRIGGER_START:
> +		case SNDRV_PCM_TRIGGER_RESUME:
> +		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +			ret = snd_soc_dapm_enable_pin(dapm, pin_name);
> +			if (!ret)
> +				snd_soc_dapm_sync(dapm);
> +			break;
> +		case SNDRV_PCM_TRIGGER_STOP:
> +		case SNDRV_PCM_TRIGGER_SUSPEND:
> +		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +			ret = snd_soc_dapm_disable_pin(dapm, pin_name);
> +			if (!ret)
> +				snd_soc_dapm_sync(dapm);
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS(max_98390_trigger, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> +
> +struct snd_soc_ops max_98390_ops = {
> +	.hw_params = max_98390_hw_params,
> +	.trigger = max_98390_trigger,
> +};
> +EXPORT_SYMBOL_NS(max_98390_ops, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> +
> +int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	int ret;
> +
> +	ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_dapm_routes,
> +				      ARRAY_SIZE(max_98390_dapm_routes));
> +	if (ret)
> +		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS(max_98390_spk_codec_init, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> +
> +void max_98390_set_codec_conf(struct snd_soc_card *card)
> +{
> +	card->codec_conf = max_98390_codec_conf;
> +	card->num_configs = ARRAY_SIZE(max_98390_codec_conf);
> +}
> +EXPORT_SYMBOL_NS(max_98390_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> +

... and until this line, I don't see much difference with 98373
>  /*
>   * Maxim MAX98357A
>   */
> diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
> index 2674f1e373ef..e1ad25dfb915 100644
> --- a/sound/soc/intel/boards/sof_maxim_common.h
> +++ b/sound/soc/intel/boards/sof_maxim_common.h
> @@ -24,6 +24,21 @@ int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
>  void max_98373_set_codec_conf(struct snd_soc_card *card);
>  int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
>  
> +/*
> + * Maxim MAX98390
> + */
> +#define MAX_98390_CODEC_DAI	"max98390-aif1"
> +#define MAX_98390_DEV0_NAME	"i2c-MX98390:00"
> +#define MAX_98390_DEV1_NAME	"i2c-MX98390:01"

again it really seems like this is the only difference?

> +
> +extern struct snd_soc_dai_link_component max_98390_components[2];
> +extern struct snd_soc_ops max_98390_ops;
> +extern const struct snd_soc_dapm_route max_98390_dapm_routes[];
> +
> +int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
> +void max_98390_set_codec_conf(struct snd_soc_card *card);
> +int max_98390_trigger(struct snd_pcm_substream *substream, int cmd);
> +
>  /*
>   * Maxim MAX98357A
>   */
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 39217223d50c..ea4b8056db62 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -49,6 +49,7 @@
>  #define SOF_RT1015P_SPEAKER_AMP_PRESENT		BIT(16)
>  #define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(17)
>  #define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(18)
> +#define SOF_MAX98390_SPEAKER_AMP_PRESENT	BIT(23)
>  
>  /* BT audio offload: reserve 3 bits for future */
>  #define SOF_BT_OFFLOAD_SSP_SHIFT		19
> @@ -162,6 +163,19 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
>  					SOF_RT5682_SSP_AMP(2) |
>  					SOF_RT5682_NUM_HDMIDEV(4)),
>  	},
> +	{
> +		.callback = sof_rt5682_quirk_cb,
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
> +			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98390_ALC5682I_I2S"),
> +		},
> +		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
> +					SOF_RT5682_SSP_CODEC(0) |
> +					SOF_SPEAKER_AMP_PRESENT |
> +					SOF_MAX98390_SPEAKER_AMP_PRESENT |
> +					SOF_RT5682_SSP_AMP(2) |
> +					SOF_RT5682_NUM_HDMIDEV(4)),
> +	},

this should be in a separate patch?

>  	{}
>  };
>  
> @@ -445,6 +459,14 @@ static int sof_card_late_probe(struct snd_soc_card *card)
>  		if (err < 0)
>  			return err;
>  	}
> +	if (sof_rt5682_quirk & SOF_MAX98390_SPEAKER_AMP_PRESENT) {
> +		/* Disable Left and Right Spk pin after boot */
> +		snd_soc_dapm_disable_pin(dapm, "Left Spk");
> +		snd_soc_dapm_disable_pin(dapm, "Right Spk");
> +		err = snd_soc_dapm_sync(dapm);
> +		if (err < 0)
> +			return err;
> +	}
>  	return hdac_hdmi_jack_port_init(component, &card->dapm);
>  }
>  
> @@ -781,6 +803,13 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  		} else if (sof_rt5682_quirk &
>  				SOF_RT1011_SPEAKER_AMP_PRESENT) {
>  			sof_rt1011_dai_link(&links[id]);
> +		} else if (sof_rt5682_quirk &
> +				SOF_MAX98390_SPEAKER_AMP_PRESENT) {
> +			links[id].codecs = max_98390_components;
> +			links[id].num_codecs = ARRAY_SIZE(max_98390_components);
> +			links[id].init = max_98390_spk_codec_init;
> +			links[id].ops = &max_98390_ops;
> +			links[id].dpcm_capture = 1;
>  		} else {
>  			max_98357a_dai_link(&links[id]);
>  		}
> @@ -917,7 +946,8 @@ static int sof_audio_probe(struct platform_device *pdev)
>  		sof_rt1011_codec_conf(&sof_audio_card_rt5682);
>  	else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
>  		sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
> -
> +	else if (sof_rt5682_quirk & SOF_MAX98390_SPEAKER_AMP_PRESENT)
> +		max_98390_set_codec_conf(&sof_audio_card_rt5682);
>  	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
>  		sof_audio_card_rt5682.num_links++;
>  
> @@ -1043,6 +1073,17 @@ static const struct platform_device_id board_ids[] = {
>  					SOF_RT5682_SSP_AMP(2) |
>  					SOF_RT5682_NUM_HDMIDEV(4)),
>  	},
> +	{
> +		.name = "adl_max98390_rt5682",
> +		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
> +					SOF_RT5682_SSP_CODEC(0) |
> +					SOF_SPEAKER_AMP_PRESENT |
> +					SOF_MAX98390_SPEAKER_AMP_PRESENT |
> +					SOF_RT5682_SSP_AMP(2) |
> +					SOF_RT5682_NUM_HDMIDEV(4) |
> +					SOF_BT_OFFLOAD_SSP(2) |
> +					SOF_SSP_BT_OFFLOAD_PRESENT),

I don't get why this is different from the 'Google Brya' quirk above -
which is missing the BT_OFFLOAD information.

If this is not for the same device/configuration, we should have
different patches or a better set of comments that keeps track of the
differences.

And now that I think of it, this may be a mistake. Usually the headset
uses SSP0, the amp SSP1 and BT offload SSP2. I am pretty sure you cannot
use SSP2 for BT offload as well as the amplifier links, the
configurations are different.

> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, board_ids);
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
> 
