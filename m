Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E04DC76B636
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 15:49:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1B36210;
	Tue,  1 Aug 2023 15:48:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1B36210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690897742;
	bh=X9LL4W/E66IAZckgliz0F6R+X+6Qomu9XzplGsb3Pyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pyc6omQ0/RLtfWbeP/b8FQ1ly+MECGZKKeLioEr8U1dq+aJJFOFHOWA8SBL01CHvV
	 oT1tkQk9iH+UhiWyvd0jfaLe+hIJKirnVIbFL/J2WRZ8uUd8qP676QBVJ4ua1eKC1m
	 lzC0a4hspx5h123TNm7HTyJdXrZ9p2tvLUAlOCJY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 467D0F802BE; Tue,  1 Aug 2023 15:48:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0ED9F8016D;
	Tue,  1 Aug 2023 15:48:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6191F801D5; Tue,  1 Aug 2023 15:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FD95F80149
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 15:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FD95F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bs656whv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690897672; x=1722433672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X9LL4W/E66IAZckgliz0F6R+X+6Qomu9XzplGsb3Pyo=;
  b=bs656whv+7mo6Iqt8a+4he0oUa9M7FpEyVAJoYi3PspFoKGvZ82t4l+q
   XVGPk8Z1OIi6Ty9ZAd4CyvLFj0l0ifnIPsmLM7unZKUx3yXjMW3dteUJ1
   +2602OWI/i98LU81GYZWc0XVOHVpnIDvv1So15khCBeCK9XHJhs4q1Uxq
   AWoPKzJL3EnCrAYj3NpsPMRzzlyR2LlQ+yUdR+CSDNoTaZJqtEwO7Bs0X
   LRzXG8V2lGypAAzHlHdHSRlcvb8vraUhWsIHHDNbBgqGHn029p2R3HlH7
   1CA8AlkSG0R3qIKVrANXED3UEojiRxYGwt3/n3v5eBnIEl+rhdmzzXj7v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="348901520"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200";
   d="scan'208";a="348901520"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 06:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="758352467"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200";
   d="scan'208";a="758352467"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 01 Aug 2023 06:47:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qQpic-0050DO-2l;
	Tue, 01 Aug 2023 16:47:22 +0300
Date: Tue, 1 Aug 2023 16:47:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Brent Lu <brent.lu@intel.com>
Cc: alsa-devel@alsa-project.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Yong Zhi <yong.zhi@intel.com>, Terry Cheong <htcheong@chromium.org>,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	"Dharageswari . R" <dharageswari.r@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	ye xingchen <ye.xingchen@zte.com.cn>
Subject: Re: [PATCH v4 1/1] ASoC: Intel: maxim-common: get codec number from
 ACPI table
Message-ID: <ZMkM6l8IqFBFItBk@smile.fi.intel.com>
References: <20230731103419.2536036-1-brent.lu@intel.com>
 <20230731103419.2536036-2-brent.lu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731103419.2536036-2-brent.lu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: MLPKLESIHYSLLLZCNV2VV5UB7NI2GQRO
X-Message-ID-Hash: MLPKLESIHYSLLLZCNV2VV5UB7NI2GQRO
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLPKLESIHYSLLLZCNV2VV5UB7NI2GQRO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 31, 2023 at 06:34:19PM +0800, Brent Lu wrote:
> We implement a helper function to get number of codecs from ACPI
> subsystem instead of using quirk flag in machine driver. Also refactor
> module interface by adding max_98390_dai_link() function.
> 
> On the sof_rt5682 machine driver side, we remove the quirk flag
> SOF_MAX98390_TWEETER_SPEAKER_PRESENT and use the new interface of
> max98390 to setup dai link.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
from ACPI utilization point of view.

The long standing issue with the entire ASoC subsystem, though, is the device
instance name in use, which is _strictly speaking_ fragile: The device
enumeration order was never guaranteed as far as I know, it just happened
to work because ACPICA & ACPI glue layer code doesn't change this, but it
very well has a right to.

> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>  sound/soc/intel/boards/sof_maxim_common.c | 170 +++++++++++++---------
>  sound/soc/intel/boards/sof_maxim_common.h |  21 ++-
>  sound/soc/intel/boards/sof_rt5682.c       |  37 +----
>  3 files changed, 111 insertions(+), 117 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
> index 112e89951da0..628b6d5d3ee4 100644
> --- a/sound/soc/intel/boards/sof_maxim_common.c
> +++ b/sound/soc/intel/boards/sof_maxim_common.c
> @@ -4,6 +4,7 @@
>  #include <linux/module.h>
>  #include <linux/string.h>
>  #include <sound/pcm.h>
> +#include <sound/pcm_params.h>
>  #include <sound/soc.h>
>  #include <sound/soc-acpi.h>
>  #include <sound/soc-dai.h>
> @@ -11,6 +12,18 @@
>  #include <uapi/sound/asound.h>
>  #include "sof_maxim_common.h"
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
>  #define MAX_98373_PIN_NAME 16
>  
>  const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
> @@ -168,17 +181,6 @@ static struct snd_soc_codec_conf max_98390_codec_conf[] = {
>  		.dlc = COMP_CODEC_CONF(MAX_98390_DEV1_NAME),
>  		.name_prefix = "Left",
>  	},
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
>  	{
>  		.dlc = COMP_CODEC_CONF(MAX_98390_DEV2_NAME),
>  		.name_prefix = "Tweeter Right",
> @@ -189,19 +191,7 @@ static struct snd_soc_codec_conf max_98390_4spk_codec_conf[] = {
>  	},
>  };
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
>  	{
>  		.name = MAX_98390_DEV0_NAME,
>  		.dai_name = MAX_98390_CODEC_DAI,
> @@ -219,62 +209,56 @@ struct snd_soc_dai_link_component max_98390_4spk_components[] = {
>  		.dai_name = MAX_98390_CODEC_DAI,
>  	},
>  };
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
>  static int max_98390_hw_params(struct snd_pcm_substream *substream,
>  			       struct snd_pcm_hw_params *params)
>  {
>  	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>  	struct snd_soc_dai *codec_dai;
> -	int i;
> +	int i, ret;
>  
>  	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -		if (i >= ARRAY_SIZE(max_98390_4spk_components)) {
> +		if (i >= ARRAY_SIZE(max_98390_tdm_mask)) {
>  			dev_err(codec_dai->dev, "invalid codec index %d\n", i);
>  			return -ENODEV;
>  		}
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
>  		}
>  	}
>  	return 0;
>  }
>  
> -int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
> +static int max_98390_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct snd_soc_card *card = rtd->card;
> +	unsigned int num_codecs = get_num_codecs(MAX_98390_ACPI_HID);
>  	int ret;
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
>  		ret = snd_soc_dapm_new_controls(&card->dapm, max_98390_tt_dapm_widgets,
>  						ARRAY_SIZE(max_98390_tt_dapm_widgets));
> -
>  		if (ret) {
> -			dev_err(rtd->dev, "unable to add tweeter dapm controls, ret %d\n", ret);
> +			dev_err(rtd->dev, "unable to add tweeter dapm widgets, ret %d\n",
> +				ret);
>  			/* Don't need to add routes if widget addition failed */
>  			return ret;
>  		}
> @@ -282,33 +266,79 @@ int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
>  		ret = snd_soc_add_card_controls(card, max_98390_tt_kcontrols,
>  						ARRAY_SIZE(max_98390_tt_kcontrols));
>  		if (ret) {
> -			dev_err(rtd->dev, "unable to add tweeter card controls, ret %d\n", ret);
> +			dev_err(rtd->dev, "unable to add tweeter controls, ret %d\n",
> +				ret);
>  			return ret;
>  		}
>  
>  		ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_tt_dapm_routes,
>  					      ARRAY_SIZE(max_98390_tt_dapm_routes));
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
> +		return -EINVAL;
>  	}
> +
>  	return ret;
>  }
> -EXPORT_SYMBOL_NS(max_98390_spk_codec_init, SND_SOC_INTEL_SOF_MAXIM_COMMON);
>  
> -const struct snd_soc_ops max_98390_ops = {
> +static const struct snd_soc_ops max_98390_ops = {
>  	.hw_params = max_98390_hw_params,
>  };
> -EXPORT_SYMBOL_NS(max_98390_ops, SND_SOC_INTEL_SOF_MAXIM_COMMON);
>  
> -void max_98390_set_codec_conf(struct snd_soc_card *card, int ch)
> +void max_98390_dai_link(struct device *dev, struct snd_soc_dai_link *link)
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
> +		dev_err(dev, "invalid codec number %d for %s\n", num_codecs,
> +			MAX_98390_ACPI_HID);
> +		break;
> +	}
> +
> +	link->init = max_98390_init;
> +	link->ops = &max_98390_ops;
> +}
> +EXPORT_SYMBOL_NS(max_98390_dai_link, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> +
> +void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card *card)
>  {
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
> +		dev_err(dev, "invalid codec number %d for %s\n", num_codecs,
> +			MAX_98390_ACPI_HID);
> +		break;
>  	}
>  }
>  EXPORT_SYMBOL_NS(max_98390_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
> diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
> index 7a8c53049e4d..a095b47b856b 100644
> --- a/sound/soc/intel/boards/sof_maxim_common.h
> +++ b/sound/soc/intel/boards/sof_maxim_common.h
> @@ -27,18 +27,15 @@ int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
>  /*
>   * Maxim MAX98390
>   */
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
> +#define MAX_98390_DEV0_NAME	"i2c-" MAX_98390_ACPI_HID ":00"
> +#define MAX_98390_DEV1_NAME	"i2c-" MAX_98390_ACPI_HID ":01"
> +#define MAX_98390_DEV2_NAME	"i2c-" MAX_98390_ACPI_HID ":02"
> +#define MAX_98390_DEV3_NAME	"i2c-" MAX_98390_ACPI_HID ":03"
> +
> +void max_98390_dai_link(struct device *dev, struct snd_soc_dai_link *link);
> +void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card *card);
>  
>  /*
>   * Maxim MAX98357A/MAX98360A
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index b4f07bdcf8b4..0af1e0c3a9db 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -59,7 +59,6 @@
>  #define SOF_SSP_BT_OFFLOAD_PRESENT		BIT(22)
>  #define SOF_RT5682S_HEADPHONE_CODEC_PRESENT	BIT(23)
>  #define SOF_MAX98390_SPEAKER_AMP_PRESENT	BIT(24)
> -#define SOF_MAX98390_TWEETER_SPEAKER_PRESENT	BIT(25)
>  #define SOF_RT1019_SPEAKER_AMP_PRESENT	BIT(26)
>  #define SOF_RT5650_HEADPHONE_CODEC_PRESENT	BIT(27)
>  
> @@ -195,23 +194,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
>  					SOF_RT5682_SSP_AMP(2) |
>  					SOF_RT5682_NUM_HDMIDEV(4)),
>  	},
> -	{
> -		.callback = sof_rt5682_quirk_cb,
> -		.matches = {
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
> -			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98390_ALC5682I_I2S_4SPK"),
> -		},
> -		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
> -					SOF_RT5682_SSP_CODEC(0) |
> -					SOF_SPEAKER_AMP_PRESENT |
> -					SOF_MAX98390_SPEAKER_AMP_PRESENT |
> -					SOF_MAX98390_TWEETER_SPEAKER_PRESENT |
> -					SOF_RT5682_SSP_AMP(1) |
> -					SOF_RT5682_NUM_HDMIDEV(4) |
> -					SOF_BT_OFFLOAD_SSP(2) |
> -					SOF_SSP_BT_OFFLOAD_PRESENT),
> -
> -	},
>  	{
>  		.callback = sof_rt5682_quirk_cb,
>  		.matches = {
> @@ -850,17 +832,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  			sof_rt1011_dai_link(&links[id]);
>  		} else if (sof_rt5682_quirk &
>  				SOF_MAX98390_SPEAKER_AMP_PRESENT) {
> -			if (sof_rt5682_quirk &
> -				SOF_MAX98390_TWEETER_SPEAKER_PRESENT) {
> -				links[id].codecs = max_98390_4spk_components;
> -				links[id].num_codecs = ARRAY_SIZE(max_98390_4spk_components);
> -			} else {
> -				links[id].codecs = max_98390_components;
> -				links[id].num_codecs = ARRAY_SIZE(max_98390_components);
> -			}
> -			links[id].init = max_98390_spk_codec_init;
> -			links[id].ops = &max_98390_ops;
> -
> +			max_98390_dai_link(dev, &links[id]);
>  		} else if (sof_rt5682_quirk & SOF_RT5650_HEADPHONE_CODEC_PRESENT) {
>  			links[id].codecs = &rt5650_components[1];
>  			links[id].num_codecs = 1;
> @@ -1019,12 +991,7 @@ static int sof_audio_probe(struct platform_device *pdev)
>  	else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
>  		sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
>  	else if (sof_rt5682_quirk & SOF_MAX98390_SPEAKER_AMP_PRESENT) {
> -		if (sof_rt5682_quirk & SOF_MAX98390_TWEETER_SPEAKER_PRESENT)
> -			max_98390_set_codec_conf(&sof_audio_card_rt5682,
> -						 ARRAY_SIZE(max_98390_4spk_components));
> -		else
> -			max_98390_set_codec_conf(&sof_audio_card_rt5682,
> -						 ARRAY_SIZE(max_98390_components));
> +		max_98390_set_codec_conf(&pdev->dev, &sof_audio_card_rt5682);
>  	}
>  
>  	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


