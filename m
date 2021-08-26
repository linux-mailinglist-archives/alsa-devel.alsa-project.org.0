Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0D03F8DE3
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 20:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2EE516C2;
	Thu, 26 Aug 2021 20:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2EE516C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630002855;
	bh=1l+Mw2uIGwJbpiGgYW8v8RNTyHB2OUijRoA6VyCujNk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nTH24ALHm7VYpLXAdYPJ/eAMj2kxDH+5dMH+ujLAIfU2Y91yy1zOgq3pl7jyklNgf
	 ZWWgfiTHLnAZhtf0cWIKrBOJSFU2bnGne2c7/PHhh8NUz0mj26IR7c3LDs46T71Awv
	 Gduvu/Q+/autTBdjk6PZjGUf+Ldu+R4gh/K1VlK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 099C6F80224;
	Thu, 26 Aug 2021 20:32:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD13CF801D8; Thu, 26 Aug 2021 20:32:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61C8CF8013F
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 20:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61C8CF8013F
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="204948624"
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="204948624"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 11:32:42 -0700
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="474302955"
Received: from hjasuja-mobl.amr.corp.intel.com (HELO [10.251.134.37])
 ([10.251.134.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 11:32:41 -0700
Subject: Re: [PATCH] [v3] ASoC: Intel: sof_rt5682: Add support for max98390
 speaker amp
To: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>,
 alsa-devel@alsa-project.org
References: <20210826103032.22262-1-mark_hsieh@wistron.corp-partner.google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7caa519c-edf6-2c4a-4ca4-6adb41f5985d@linux.intel.com>
Date: Thu, 26 Aug 2021 08:06:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826103032.22262-1-mark_hsieh@wistron.corp-partner.google.com>
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



On 8/26/21 5:30 AM, Mark Hsieh wrote:
> Configure adl_max98390_rt5682 to support the rt5682 headset codec
> and max98390 speaker.
> 
> Signed-off-by: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>

LGTM, thanks!

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/Kconfig                |  1 +
>  sound/soc/intel/boards/sof_maxim_common.c     | 57 +++++++++++++++++++
>  sound/soc/intel/boards/sof_maxim_common.h     | 12 ++++
>  sound/soc/intel/boards/sof_rt5682.c           | 19 +++++++
>  .../intel/common/soc-acpi-intel-adl-match.c   | 13 +++++
>  5 files changed, 102 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> index 7e29b0d911e2..0017c08c5a62 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -470,6 +470,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
>  	select SND_SOC_RT1015
>  	select SND_SOC_RT1015P
>  	select SND_SOC_RT5682_I2C
> +	select SND_SOC_MAX98390
>  	select SND_SOC_DMIC
>  	select SND_SOC_HDAC_HDMI
>  	select SND_SOC_INTEL_HDA_DSP_COMMON
> diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
> index e9c52f8b6428..a6fcf6e08996 100644
> --- a/sound/soc/intel/boards/sof_maxim_common.c
> +++ b/sound/soc/intel/boards/sof_maxim_common.c
> @@ -133,6 +133,63 @@ void max_98373_set_codec_conf(struct snd_soc_card *card)
>  }
>  EXPORT_SYMBOL_NS(max_98373_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
>  
> +/*
> + * Maxim MAX98390
> + */
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
> +		.name = MAX_98390_DEV0_NAME,
> +		.dai_name = MAX_98390_CODEC_DAI,
> +	},
> +	{  /* For Left */
> +		.name = MAX_98390_DEV1_NAME,
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
> +	int i;
> +
> +	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +		/* DEV0 tdm slot configuration */
> +		if (!strcmp(codec_dai->component->name, MAX_98390_DEV0_NAME))
> +			snd_soc_dai_set_tdm_slot(codec_dai, 0x03, 3, 2, 16);
> +		/* DEV1 tdm slot configuration */
> +		if (!strcmp(codec_dai->component->name, MAX_98390_DEV1_NAME))
> +			snd_soc_dai_set_tdm_slot(codec_dai, 0x0C, 3, 2, 16);
> +	}
> +	return 0;
> +}
> +
> +const struct snd_soc_ops max_98390_ops = {
> +	.hw_params = max_98390_hw_params,
> +};
> +EXPORT_SYMBOL_NS(max_98390_ops, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> +
> +void max_98390_set_codec_conf(struct snd_soc_card *card)
> +{
> +	card->codec_conf = max_98390_codec_conf;
> +	card->num_configs = ARRAY_SIZE(max_98390_codec_conf);
> +}
> +EXPORT_SYMBOL_NS(max_98390_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> +
>  /*
>   * Maxim MAX98357A
>   */
> diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
> index 2674f1e373ef..bad7b5303280 100644
> --- a/sound/soc/intel/boards/sof_maxim_common.h
> +++ b/sound/soc/intel/boards/sof_maxim_common.h
> @@ -24,6 +24,18 @@ int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
>  void max_98373_set_codec_conf(struct snd_soc_card *card);
>  int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
>  
> +/*
> + * Maxim MAX98390
> + */
> +#define MAX_98390_CODEC_DAI	"max98390-aif1"
> +#define MAX_98390_DEV0_NAME	"i2c-MX98390:00"
> +#define MAX_98390_DEV1_NAME	"i2c-MX98390:01"
> +
> +extern struct snd_soc_dai_link_component max_98390_components[2];
> +extern const struct snd_soc_ops max_98390_ops;
> +
> +void max_98390_set_codec_conf(struct snd_soc_card *card);
> +
>  /*
>   * Maxim MAX98357A
>   */
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 39217223d50c..18b6ef311462 100644
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
> @@ -781,6 +782,13 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  		} else if (sof_rt5682_quirk &
>  				SOF_RT1011_SPEAKER_AMP_PRESENT) {
>  			sof_rt1011_dai_link(&links[id]);
> +		} else if (sof_rt5682_quirk &
> +				SOF_MAX98390_SPEAKER_AMP_PRESENT) {
> +			links[id].codecs = max_98390_components;
> +			links[id].num_codecs = ARRAY_SIZE(max_98390_components);
> +			links[id].init = max_98373_spk_codec_init;
> +			links[id].ops = &max_98390_ops;
> +			links[id].dpcm_capture = 1;
>  		} else {
>  			max_98357a_dai_link(&links[id]);
>  		}
> @@ -917,6 +925,8 @@ static int sof_audio_probe(struct platform_device *pdev)
>  		sof_rt1011_codec_conf(&sof_audio_card_rt5682);
>  	else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
>  		sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
> +	else if (sof_rt5682_quirk & SOF_MAX98390_SPEAKER_AMP_PRESENT)
> +		max_98390_set_codec_conf(&sof_audio_card_rt5682);
>  
>  	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
>  		sof_audio_card_rt5682.num_links++;
> @@ -1043,6 +1053,15 @@ static const struct platform_device_id board_ids[] = {
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
> +					SOF_RT5682_NUM_HDMIDEV(4)),
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
