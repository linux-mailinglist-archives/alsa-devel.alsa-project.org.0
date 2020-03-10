Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A25318048B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 18:14:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2E66167F;
	Tue, 10 Mar 2020 18:13:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2E66167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583860439;
	bh=5falJ5S6VIlQn8yJKgHS9GTcVqcbbaH4FoFfVK8rRUI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WsEszHfaTKc7IOtTanbkBSdFZe7AIv52tOsPn98p8Qk3RGnDEukjy1O+HQ6bwAXCz
	 X1uJjPnM46lIhN6Ganeud3lPGnKkJfS+zQtea2z3jy7Woji9NNgE7TT0id321IAIGv
	 OjOK4nKgJmO4tlHzMpYYmdi2NbkHc26Jrf8EKylA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4A8AF800DA;
	Tue, 10 Mar 2020 18:12:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13463F80217; Tue, 10 Mar 2020 18:12:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F326F800BC
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 18:12:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F326F800BC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 10:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="321867275"
Received: from djdickof-mobl.amr.corp.intel.com (HELO [10.252.192.103])
 ([10.252.192.103])
 by orsmga001.jf.intel.com with ESMTP; 10 Mar 2020 10:12:02 -0700
Subject: Re: [PATCH] ASoC: Intel: boards: add stereo playback by woofer speaker
To: mac.chiang@intel.com, alsa-devel@alsa-project.org
References: <1583833125-7017-1-git-send-email-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <daf627d0-ffe3-5e18-324d-4d115ec34952@linux.intel.com>
Date: Tue, 10 Mar 2020 12:05:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1583833125-7017-1-git-send-email-mac.chiang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sathya.prakash.m.r@intel.com, naveen.m@intel.com, broonie@kernel.org
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

Hi Mac,

> +#define SOF_RT1011_SPEAKER_WL		BIT(0)
> +#define SOF_RT1011_SPEAKER_WR		BIT(1)
> +#define SOF_RT1011_SPEAKER_TL		BIT(2)
> +#define SOF_RT1011_SPEAKER_TR		BIT(3)
> +#define SPK_CH 4

use a prefix maybe for consistency?
It's also unclear why this is needed when you can have 2 or more 
channels, and looking below

> +
> +/* Default: Woofer+Tweeter speakers  */

It's more like ALL devices have Woofers.
Some devices don't have tweeters.

the WL and WR quirks are always on apparently.

> +static unsigned long sof_rt1011_quirk = SOF_RT1011_SPEAKER_WL | SOF_RT1011_SPEAKER_WR |
> +					SOF_RT1011_SPEAKER_TL | SOF_RT1011_SPEAKER_TR;
> +
> +static int sof_rt1011_quirk_cb(const struct dmi_system_id *id)
> +{
> +	sof_rt1011_quirk = (unsigned long)id->driver_data;
> +	return 1;
> +}
> +
> +static const struct dmi_system_id sof_rt1011_quirk_table[] = {
> +	{
> +		.callback = sof_rt1011_quirk_cb,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Palkia"),
> +	},
> +		.driver_data = (void *)(SOF_RT1011_SPEAKER_WL |
> +					SOF_RT1011_SPEAKER_WR),
> +	},
> +	{
> +	}
> +};

> +static const struct snd_soc_dapm_widget cml_rt1011_tt_widgets[] = {
> +	SND_SOC_DAPM_SPK("TL Ext Spk", NULL),
> +	SND_SOC_DAPM_SPK("TR Ext Spk", NULL),
> +};
> +
>   static const struct snd_soc_dapm_route cml_rt1011_rt5682_map[] = {
>   	/*speaker*/
>   	{"TL Ext Spk", NULL, "TL SPO"},

Something's not right, if I look at the code after applying this patch I 
get:

static const struct snd_soc_dapm_route cml_rt1011_rt5682_map[] = {
	/*speaker*/
	{"TL Ext Spk", NULL, "TL SPO"},
	{"TR Ext Spk", NULL, "TR SPO"},

That's duplicaged from [1]

> @@ -82,6 +118,12 @@ static const struct snd_soc_dapm_route cml_rt1011_rt5682_map[] = {
>   	{"DMic", NULL, "SoC DMIC"},
>   };
>   
> +static const struct snd_soc_dapm_route cml_rt1011_tt_map[] = {
> +	/*TL/TR speaker*/
> +	{"TL Ext Spk", NULL, "TL SPO" },
> +	{"TR Ext Spk", NULL, "TR SPO" },
> +};

[1] we should remove the tweeeter maps in cml_rt1011_rt5682_map, no?

>   static int cml_rt5682_hw_params(struct snd_pcm_substream *substream,
>   				struct snd_pcm_hw_params *params)
>   {
> @@ -192,31 +263,52 @@ static int cml_rt1011_hw_params(struct snd_pcm_substream *substream,
>   		 * The feedback is captured for each codec individually.
>   		 * Hence all 4 codecs use 1 Tx slot each for feedback.
>   		 */
> -		if (!strcmp(codec_dai->component->name, "i2c-10EC1011:00")) {
> -			ret = snd_soc_dai_set_tdm_slot(codec_dai,
> -						       0x4, 0x1, 4, 24);
> -			if (ret < 0)
> -				break;
> -		}
> -		if (!strcmp(codec_dai->component->name, "i2c-10EC1011:02")) {
> -			ret = snd_soc_dai_set_tdm_slot(codec_dai,
> -						       0x1, 0x1, 4, 24);
> -			if (ret < 0)
> -				break;
> -		}
> -		/* TDM Rx slot 2 is used for Right Woofer & Tweeters pair */
> -		if (!strcmp(codec_dai->component->name, "i2c-10EC1011:01")) {
> -			ret = snd_soc_dai_set_tdm_slot(codec_dai,
> -						       0x8, 0x2, 4, 24);
> -			if (ret < 0)
> -				break;
> -		}
> -		if (!strcmp(codec_dai->component->name, "i2c-10EC1011:03")) {
> -			ret = snd_soc_dai_set_tdm_slot(codec_dai,
> -						       0x2, 0x2, 4, 24);
> -			if (ret < 0)
> -				break;
> +		if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_TL |
> +					SOF_RT1011_SPEAKER_TR)) {
> +			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:00")) {
> +				ret = snd_soc_dai_set_tdm_slot(codec_dai,
> +							       0x4, 0x1, 4, 24);
> +				if (ret < 0)
> +					break;
> +			}
> +
> +			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:02")) {
> +				ret = snd_soc_dai_set_tdm_slot(codec_dai,
> +							       0x1, 0x1, 4, 24);
> +				if (ret < 0)
> +					break;
> +			}
> +
> +			/* TDM Rx slot 2 is used for Right Woofer & Tweeters pair */
> +			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:01")) {
> +				ret = snd_soc_dai_set_tdm_slot(codec_dai,
> +							       0x8, 0x2, 4, 24);
> +				if (ret < 0)
> +					break;
> +			}
> +
> +			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:03")) {
> +				ret = snd_soc_dai_set_tdm_slot(codec_dai,
> +							       0x2, 0x2, 4, 24);
> +				if (ret < 0)
> +					break;
> +			}
> +		} else {
> +			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:00")) {
> +				ret = snd_soc_dai_set_tdm_slot(codec_dai,
> +							       0x4, 0x1, 4, 24);
> +				if (ret < 0)
> +					break;
> +			}
> +
> +			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:01")) {
> +				ret = snd_soc_dai_set_tdm_slot(codec_dai,
> +							       0x8, 0x2, 4, 24);
> +				if (ret < 0)
> +					break;
> +			}
>   		}

the if/else case can be simplified. The baseline is two woofers, so they 
can be added unconditionally, and then you can add what's missing for 
the tweeters. That way you have a consistent way of handling the TL/TR 
quirk.
>   static int snd_cml_rt1011_probe(struct platform_device *pdev)
>   {
> +	struct snd_soc_dai_link_component *rt1011_dais_components;
> +	struct snd_soc_codec_conf *rt1011_dais_confs;
>   	struct card_private *ctx;
>   	struct snd_soc_acpi_mach *mach;
>   	const char *platform_name;
> -	int ret;
> +	int ret, i;
>   
>   	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_ATOMIC);

D'oh! Did we again let this slip in?

cml_rt1011_rt5682.c:    ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), 
GFP_ATOMIC);
sof_da7219_max98373.c:  ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), 
GFP_ATOMIC);

This should be fixed in a separate patch, we don't need th ATOMIC 
attribute in any machine drivers - copy-paste!

>   	if (!ctx)
> @@ -456,6 +541,59 @@ static int snd_cml_rt1011_probe(struct platform_device *pdev)
>   	snd_soc_card_cml.dev = &pdev->dev;
>   	platform_name = mach->mach_params.platform;
>   
> +	dmi_check_system(sof_rt1011_quirk_table);
> +
> +	dev_info(&pdev->dev, "sof_rt1011_quirk = %lx\n", sof_rt1011_quirk);
> +
> +	if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_TL |
> +				SOF_RT1011_SPEAKER_TR)) {
> +		rt1011_dais_confs = devm_kzalloc(&pdev->dev,
> +					sizeof(struct snd_soc_codec_conf) *
> +					SPK_CH, GFP_KERNEL);
> +
> +		rt1011_dais_components = devm_kzalloc(&pdev->dev,
> +					sizeof(struct snd_soc_dai_link_component) *
> +					SPK_CH, GFP_KERNEL);
> +
> +		for (i = 0; i < SPK_CH; i++) {
> +			rt1011_dais_confs[i].dlc.name = devm_kasprintf(&pdev->dev,
> +								GFP_KERNEL,
> +								"i2c-10EC1011:0%d",
> +								i);

Check for NULL and return -ENOMEM for all 3 devm_ calls above?

