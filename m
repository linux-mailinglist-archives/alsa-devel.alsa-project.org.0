Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EFD762F70
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 10:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62973820;
	Wed, 26 Jul 2023 10:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62973820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690359409;
	bh=3PBwGmmLNo5LsDc6Vk46BAUMhYfkHnDVYn22klH3w7w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OPBLQCl+ScerQdm8SW3+fJOh2vSOBPLpHbE+VzB46nV51ze3VWT2zyRDRAdExXahw
	 I2peDsPTwhVXJRloSXLR73fWMEfMp0AuTsVpH2t7hOW3zLau/s10IqVf3huOTWK4u3
	 LwB6X8rbeMwab24UnfSpp9vCVRF168m462yj6ZxQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B02AF80544; Wed, 26 Jul 2023 10:15:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 749F0F80153;
	Wed, 26 Jul 2023 10:15:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8013F800C7; Wed, 26 Jul 2023 10:15:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B5B3F800C7
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 10:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B5B3F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IkFHo/Hq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690359335; x=1721895335;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3PBwGmmLNo5LsDc6Vk46BAUMhYfkHnDVYn22klH3w7w=;
  b=IkFHo/HqHMKMPN1P2VeMV8lmOFzT8jSxTqH7LTszpQTi0PkonVZLJGAH
   VotirYwLDgb03z7CjbdEtJKLyunBQZGL5UvP28TphZgvO2jlIvHWxuHM5
   D17WCU37ALGW0YULjJHh4ZH8ZjZcSGqAv+WmsUOHeG+ZqkjLhGdhEqVoC
   wYHgRHsZvyMUqXsUydGFexPG0hNYi3fSBJ6lC8TSIfo0anFRpTRx4whxU
   cgSaLpyQvlD1E/KuzyKwa+Z4pAR3BzckpJduog8nx9gSiDCg0GbWtbUVa
   NCUjJG95mIUaAR2et77fzKlV4equUM5d8yoGw0M07t8VXUeLnKu8U15Y5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431752634"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="431752634"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 01:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="840179540"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="840179540"
Received: from csmokx-mobl.ger.corp.intel.com (HELO [10.252.35.206])
 ([10.252.35.206])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 01:15:21 -0700
Message-ID: <7349d6f4-4866-6fb3-57c9-9ce2d6989576@linux.intel.com>
Date: Wed, 26 Jul 2023 10:15:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] ASoC: Intel: maxim-common: get codec number from
 ACPI
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Yong Zhi <yong.zhi@intel.com>, Terry Cheong <htcheong@chromium.org>,
 Uday M Bhat <uday.m.bhat@intel.com>, Mac Chiang <mac.chiang@intel.com>,
 "Dharageswari . R" <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230726140848.2267568-1-brent.lu@intel.com>
 <20230726140848.2267568-2-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230726140848.2267568-2-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GGELTJWSUBGVQCLFZQCGCQOJUDIGLXPP
X-Message-ID-Hash: GGELTJWSUBGVQCLFZQCGCQOJUDIGLXPP
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGELTJWSUBGVQCLFZQCGCQOJUDIGLXPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/26/23 4:08 PM, Brent Lu wrote:
> Implement a helper function to get number of codecs from ACPI
> subsystem to remove the need of quirk flag in machine driver.
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>   sound/soc/intel/boards/sof_maxim_common.c | 171 +++++++++++++---------
>   sound/soc/intel/boards/sof_maxim_common.h |  21 ++-
>   2 files changed, 110 insertions(+), 82 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
> index 112e89951da0..1fdd66f5adc2 100644
> --- a/sound/soc/intel/boards/sof_maxim_common.c
> +++ b/sound/soc/intel/boards/sof_maxim_common.c
> @@ -4,6 +4,7 @@
>   #include <linux/module.h>
>   #include <linux/string.h>
>   #include <sound/pcm.h>
> +#include <sound/pcm_params.h>
>   #include <sound/soc.h>
>   #include <sound/soc-acpi.h>
>   #include <sound/soc-dai.h>
> @@ -11,6 +12,18 @@
>   #include <uapi/sound/asound.h>
>   #include "sof_maxim_common.h"
>   
> +/* helper function to get the number of specific codec */
> +static unsigned int get_num_codecs(const char *hid)
> +{
> +	struct acpi_device *adev;
> +	unsigned int dev_num = 0;
> +
> +	for_each_acpi_dev_match(adev, hid, NULL, -1)
> +		dev_num++;
> +
> +	return dev_num;
> +}
> +
>   #define MAX_98373_PIN_NAME 16
>   
>   const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
> @@ -168,17 +181,6 @@ static struct snd_soc_codec_conf max_98390_codec_conf[] = {
>   		.dlc = COMP_CODEC_CONF(MAX_98390_DEV1_NAME),
>   		.name_prefix = "Left",
>   	},
> -};
> -
> -static struct snd_soc_codec_conf max_98390_4spk_codec_conf[] = {
> -	{
> -		.dlc = COMP_CODEC_CONF(MAX_98390_DEV0_NAME),
> -		.name_prefix = "Right",
> -	},
> -	{
> -		.dlc = COMP_CODEC_CONF(MAX_98390_DEV1_NAME),
> -		.name_prefix = "Left",
> -	},

if you remove the codec conf, doesn't this impact the Kcontrols names? 
Does this break existing UCM files?

It's rather hard to review with just the diff.

>   	{
>   		.dlc = COMP_CODEC_CONF(MAX_98390_DEV2_NAME),
>   		.name_prefix = "Tweeter Right",
> @@ -189,19 +191,7 @@ static struct snd_soc_codec_conf max_98390_4spk_codec_conf[] = {
>   	},
>   };
>   
> -struct snd_soc_dai_link_component max_98390_components[] = {
> -	{
> -		.name = MAX_98390_DEV0_NAME,
> -		.dai_name = MAX_98390_CODEC_DAI,
> -	},
> -	{
> -		.name = MAX_98390_DEV1_NAME,
> -		.dai_name = MAX_98390_CODEC_DAI,
> -	},
> -};
> -EXPORT_SYMBOL_NS(max_98390_components, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> -
> -struct snd_soc_dai_link_component max_98390_4spk_components[] = {
> +static struct snd_soc_dai_link_component max_98390_components[] = {
>   	{
>   		.name = MAX_98390_DEV0_NAME,
>   		.dai_name = MAX_98390_CODEC_DAI,
> @@ -219,62 +209,56 @@ struct snd_soc_dai_link_component max_98390_4spk_components[] = {
>   		.dai_name = MAX_98390_CODEC_DAI,
>   	},
>   };
> -EXPORT_SYMBOL_NS(max_98390_4spk_components, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> +
> +static const struct {
> +	unsigned int tx;
> +	unsigned int rx;
> +} max_98390_tdm_mask[] = {
> +	{.tx = 0x01, .rx = 0x3},
> +	{.tx = 0x02, .rx = 0x3},
> +	{.tx = 0x04, .rx = 0x3},
> +	{.tx = 0x08, .rx = 0x3},
> +};
>   
>   static int max_98390_hw_params(struct snd_pcm_substream *substream,
>   			       struct snd_pcm_hw_params *params)
>   {
>   	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>   	struct snd_soc_dai *codec_dai;
> -	int i;
> +	int i, ret = 0;
>   
>   	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -		if (i >= ARRAY_SIZE(max_98390_4spk_components)) {
> +		if (i >= ARRAY_SIZE(max_98390_tdm_mask)) {
>   			dev_err(codec_dai->dev, "invalid codec index %d\n", i);
>   			return -ENODEV;
>   		}
>   
> -		if (!strcmp(codec_dai->component->name, MAX_98390_DEV0_NAME)) {
> -			/* DEV0 tdm slot configuration Right */
> -			snd_soc_dai_set_tdm_slot(codec_dai, 0x01, 3, 4, 32);
> -		}
> -		if (!strcmp(codec_dai->component->name, MAX_98390_DEV1_NAME)) {
> -			/* DEV1 tdm slot configuration Left */
> -			snd_soc_dai_set_tdm_slot(codec_dai, 0x02, 3, 4, 32);
> -		}
> -
> -		if (!strcmp(codec_dai->component->name, MAX_98390_DEV2_NAME)) {
> -			/* DEVi2 tdm slot configuration Tweeter Right */
> -			snd_soc_dai_set_tdm_slot(codec_dai, 0x04, 3, 4, 32);
> -		}
> -		if (!strcmp(codec_dai->component->name, MAX_98390_DEV3_NAME)) {
> -			/* DEV3 tdm slot configuration Tweeter Left */
> -			snd_soc_dai_set_tdm_slot(codec_dai, 0x08, 3, 4, 32);
> +		ret = snd_soc_dai_set_tdm_slot(codec_dai, max_98390_tdm_mask[i].tx,
> +					       max_98390_tdm_mask[i].rx, 4,
> +					       params_width(params));
> +		if (ret < 0) {
> +			dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
> +				ret);
> +			return ret;
>   		}
>   	}
>   	return 0;
>   }
>   
> -int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
> +static int max_98390_init(struct snd_soc_pcm_runtime *rtd)
>   {
>   	struct snd_soc_card *card = rtd->card;
> +	unsigned int num_codecs = get_num_codecs(MAX_98390_ACPI_HID);
>   	int ret;
>   
> -	/* add regular speakers dapm route */
> -	ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_dapm_routes,
> -				      ARRAY_SIZE(max_98390_dapm_routes));
> -	if (ret) {
> -		dev_err(rtd->dev, "unable to add Left/Right Speaker dapm, ret %d\n", ret);
> -		return ret;
> -	}
> -
> -	/* add widgets/controls/dapm for tweeter speakers */
> -	if (acpi_dev_present("MX98390", "3", -1)) {
> +	switch (num_codecs) {
> +	case 4:
> +		/* add widgets/controls/dapm for tweeter speakers */
>   		ret = snd_soc_dapm_new_controls(&card->dapm, max_98390_tt_dapm_widgets,
>   						ARRAY_SIZE(max_98390_tt_dapm_widgets));
> -
>   		if (ret) {
> -			dev_err(rtd->dev, "unable to add tweeter dapm controls, ret %d\n", ret);
> +			dev_err(rtd->dev, "unable to add tweeter dapm widgets, ret %d\n",
> +				ret);
>   			/* Don't need to add routes if widget addition failed */
>   			return ret;
>   		}
> @@ -282,33 +266,80 @@ int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
>   		ret = snd_soc_add_card_controls(card, max_98390_tt_kcontrols,
>   						ARRAY_SIZE(max_98390_tt_kcontrols));
>   		if (ret) {
> -			dev_err(rtd->dev, "unable to add tweeter card controls, ret %d\n", ret);
> +			dev_err(rtd->dev, "unable to add tweeter controls, ret %d\n",
> +				ret);
>   			return ret;
>   		}
>   
>   		ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_tt_dapm_routes,
>   					      ARRAY_SIZE(max_98390_tt_dapm_routes));
> -		if (ret)
> -			dev_err(rtd->dev,
> -				"unable to add Tweeter Left/Right Speaker dapm, ret %d\n", ret);
> +		if (ret) {
> +			dev_err(rtd->dev, "unable to add tweeter dapm routes, ret %d\n",
> +				ret);
> +			return ret;
> +		}
> +
> +		fallthrough;
> +	case 2:
> +		/* add regular speakers dapm route */
> +		ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_dapm_routes,
> +					      ARRAY_SIZE(max_98390_dapm_routes));
> +		if (ret) {
> +			dev_err(rtd->dev, "unable to add dapm routes, ret %d\n",
> +				ret);
> +			return ret;
> +		}
> +		break;
> +	default:
> +		dev_err(rtd->dev, "invalid codec number %d\n", num_codecs);
> +		ret = -EINVAL;
> +		break;
>   	}
> +
>   	return ret;
>   }
> -EXPORT_SYMBOL_NS(max_98390_spk_codec_init, SND_SOC_INTEL_SOF_MAXIM_COMMON);
>   
> -const struct snd_soc_ops max_98390_ops = {
> +static const struct snd_soc_ops max_98390_ops = {
>   	.hw_params = max_98390_hw_params,
>   };
> -EXPORT_SYMBOL_NS(max_98390_ops, SND_SOC_INTEL_SOF_MAXIM_COMMON);
>   
> -void max_98390_set_codec_conf(struct snd_soc_card *card, int ch)
> +void max_98390_dai_link(struct snd_soc_dai_link *link)
> +{
> +	unsigned int num_codecs = get_num_codecs(MAX_98390_ACPI_HID);
> +
> +	link->codecs = max_98390_components;
> +
> +	switch (num_codecs) {
> +	case 2:
> +	case 4:
> +		link->num_codecs = num_codecs;
> +		break;
> +	default:
> +		pr_err("invalid codec number %d for %s\n", num_codecs,
> +			MAX_98390_ACPI_HID);
> +		break;
> +	}
> +
> +	link->init = max_98390_init;
> +	link->ops = &max_98390_ops;
> +}
> +EXPORT_SYMBOL_NS(max_98390_dai_link, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> +
> +void max_98390_set_codec_conf(struct snd_soc_card *card)
>   {
> -	if (ch == ARRAY_SIZE(max_98390_4spk_codec_conf)) {
> -		card->codec_conf = max_98390_4spk_codec_conf;
> -		card->num_configs = ARRAY_SIZE(max_98390_4spk_codec_conf);
> -	} else {
> -		card->codec_conf = max_98390_codec_conf;
> -		card->num_configs = ARRAY_SIZE(max_98390_codec_conf);
> +	unsigned int num_codecs = get_num_codecs(MAX_98390_ACPI_HID);
> +
> +	card->codec_conf = max_98390_codec_conf;
> +
> +	switch (num_codecs) {
> +	case 2:
> +	case 4:
> +		card->num_configs = num_codecs;
> +		break;
> +	default:
> +		pr_err("invalid codec number %d for %s\n", num_codecs,
> +			MAX_98390_ACPI_HID);
> +		break;
>   	}
>   }
>   EXPORT_SYMBOL_NS(max_98390_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
> index 7a8c53049e4d..a3676d68cc12 100644
> --- a/sound/soc/intel/boards/sof_maxim_common.h
> +++ b/sound/soc/intel/boards/sof_maxim_common.h
> @@ -27,18 +27,15 @@ int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
>   /*
>    * Maxim MAX98390
>    */
> -#define MAX_98390_CODEC_DAI     "max98390-aif1"
> -#define MAX_98390_DEV0_NAME     "i2c-MX98390:00"
> -#define MAX_98390_DEV1_NAME     "i2c-MX98390:01"
> -#define MAX_98390_DEV2_NAME     "i2c-MX98390:02"
> -#define MAX_98390_DEV3_NAME     "i2c-MX98390:03"
> -
> -extern struct snd_soc_dai_link_component max_98390_components[2];
> -extern struct snd_soc_dai_link_component max_98390_4spk_components[4];
> -extern const struct snd_soc_ops max_98390_ops;
> -
> -void max_98390_set_codec_conf(struct snd_soc_card *card, int ch);
> -int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
> +#define MAX_98390_ACPI_HID	"MX98390"
> +#define MAX_98390_CODEC_DAI	"max98390-aif1"
> +#define MAX_98390_DEV0_NAME	"i2c-MX98390:00"
> +#define MAX_98390_DEV1_NAME	"i2c-MX98390:01"
> +#define MAX_98390_DEV2_NAME	"i2c-MX98390:02"
> +#define MAX_98390_DEV3_NAME	"i2c-MX98390:03"
> +
> +void max_98390_dai_link(struct snd_soc_dai_link *link);
> +void max_98390_set_codec_conf(struct snd_soc_card *card);
>   
>   /*
>    * Maxim MAX98357A/MAX98360A

