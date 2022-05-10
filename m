Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF5D521D17
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 16:52:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C997D1919;
	Tue, 10 May 2022 16:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C997D1919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652194331;
	bh=JXls05y2gUu5gia6y474ntis4yRroQ2OlH/j4C/LJS4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p9CDfJWM6IFiUGz+HqF/VWAhflGSiE5my2DWygmx/AuvO3avFh097r1ZVsWHpe7IY
	 Xk2+6IFBlSxWNj12025kyvM5D7UcizvTC4f55qvmBPj742j8E9ebwNJeoSuRrv74Qt
	 6m9es8t3FW7CE8Plk4czMULbECBC5kskZTCr0ZmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E01BF8011C;
	Tue, 10 May 2022 16:51:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFB3CF801F5; Tue, 10 May 2022 16:51:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D66C2F8011C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 16:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D66C2F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RzqYm+6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652194274; x=1683730274;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JXls05y2gUu5gia6y474ntis4yRroQ2OlH/j4C/LJS4=;
 b=RzqYm+6kUd98/ji4LXYHtHBpAMLcf48AKmx2QqNJWbjue/JAn3dbZKTf
 W0176omnKmGo8JW1jP6ieqrAtMxaf5XIDTIBs/Dw23Hla0JNPUzLu0HLW
 ybjbtubLLYMNugL3uS7AdO+uJlzrnQJkVd45JpmEHzsRZNQlNEYvA/ptf
 aLlFfKgjml5gaymc9yO5eN8ZxsfHW1H+FINsvIRV2HxYSSETKoXvTZduc
 7mBFAtCgk9N4Ctpm90DDcsZ97Pj08+iu6baXJlq/80naoEyMb3L/oO9d3
 ZlBmaKkrzwD6x9ACDKg7It6bJeerZj5Chr2jmF7kc2QGQl2byRylEKIKV g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="332431222"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="332431222"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 07:51:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="519786590"
Received: from agupta51-mobl.amr.corp.intel.com (HELO [10.212.253.67])
 ([10.212.253.67])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 07:51:06 -0700
Message-ID: <190c9add-7fa4-8e76-bfcb-43d30f22f8d9@linux.intel.com>
Date: Tue, 10 May 2022 09:40:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] [v2] ASoC: Intel: sof_cs42l42: adding support for ADL
 configuration and BT offload audio
Content-Language: en-US
To: Terry Chen <terry_chen@wistron.corp-partner.google.com>,
 alsa-devel@alsa-project.org
References: <20220510104829.1466968-1-terry_chen@wistron.corp-partner.google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220510104829.1466968-1-terry_chen@wistron.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, casey.g.bowman@intel.com,
 yang.jie@linux.intel.com, tiwai@suse.com,
 mark_hsieh@wistron.corp-partner.google.com, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, broonie@kernel.org, seanpaul@chromium.org,
 cujomalainey@chromium.org, brent.lu@intel.com, vamshi.krishna.gopal@intel.com
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




> +static int create_bt_offload_dai_links(struct device *dev,
> +				       struct snd_soc_dai_link *links,
> +				       struct snd_soc_dai_link_component *cpus,
> +				       int *id, int ssp_bt)
> +{
> +	int ret = 0;

this variable is not used in the rest of this function, something's not
right here...

> +	/* bt offload */
> +	if (!(sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT))
> +		return 0;
> +
> +	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT",
> +					 ssp_bt);
> +	if (!links[*id].name)
> +		goto devm_err;

is this missing ret = -ENOMEM?

> +
> +	links[*id].id = *id;
> +	links[*id].codecs = dummy_component;
> +	links[*id].num_codecs = ARRAY_SIZE(dummy_component);
> +	links[*id].platforms = platform_component;
> +	links[*id].num_platforms = ARRAY_SIZE(platform_component);
> +
> +	links[*id].dpcm_playback = 1;
> +	links[*id].dpcm_capture = 1;
> +	links[*id].no_pcm = 1;
> +	links[*id].cpus = &cpus[*id];
> +	links[*id].num_cpus = 1;
> +
> +	links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
> +						   "SSP%d Pin",
> +						   ssp_bt);
> +	if (!links[*id].cpus->dai_name)
> +		goto devm_err;

same here, ret = -ENOMEM; ?

> +
> +	(*id)++;
> +
> +	return 0;
> +
> +devm_err:
> +	return ret;

or use what the existing code does for other links:

devm_err:
	return -ENOMEM;


> +}
> +
>  static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  							  int ssp_codec,
>  							  int ssp_amp,
> +							  int ssp_bt,
>  							  int dmic_be_num,
>  							  int hdmi_num)
>  {
> @@ -522,6 +578,14 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  				goto devm_err;
>  			}
>  			break;
> +		case LINK_BT:
> +			ret = create_bt_offload_dai_links(dev, links, cpus, &id, ssp_bt);
> +			if (ret < 0) {
> +				dev_err(dev, "fail to create bt offload dai links, ret %d\n",
> +					ret);

one line?

> +				goto devm_err;
> +			}
> +			break;
>  		case LINK_NONE:
>  			/* caught here if it's not used as terminator in macro */
>  		default:
> @@ -543,7 +607,7 @@ static int sof_audio_probe(struct platform_device *pdev)
>  	struct snd_soc_acpi_mach *mach;
>  	struct sof_card_private *ctx;
>  	int dmic_be_num, hdmi_num;
> -	int ret, ssp_amp, ssp_codec;
> +	int ret, ssp_bt, ssp_amp, ssp_codec;
>  
>  	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -568,6 +632,9 @@ static int sof_audio_probe(struct platform_device *pdev)
>  
>  	dev_dbg(&pdev->dev, "sof_cs42l42_quirk = %lx\n", sof_cs42l42_quirk);
>  
> +	ssp_bt = (sof_cs42l42_quirk & SOF_CS42L42_SSP_BT_MASK) >>
> +			SOF_CS42L42_SSP_BT_SHIFT;
> +
>  	ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
>  			SOF_CS42L42_SSP_AMP_SHIFT;
>  
> @@ -578,9 +645,11 @@ static int sof_audio_probe(struct platform_device *pdev)
>  
>  	if (sof_cs42l42_quirk & SOF_SPEAKER_AMP_PRESENT)
>  		sof_audio_card_cs42l42.num_links++;
> +	if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT)
> +		sof_audio_card_cs42l42.num_links++;
>  
>  	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
> -					      dmic_be_num, hdmi_num);
> +					      ssp_bt, dmic_be_num, hdmi_num);
>  	if (!dai_links)
>  		return -ENOMEM;
>  
> @@ -621,6 +690,17 @@ static const struct platform_device_id board_ids[] = {
>  					SOF_CS42L42_SSP_AMP(1)) |
>  					SOF_CS42L42_DAILINK(LINK_HP, LINK_DMIC, LINK_HDMI, LINK_SPK, LINK_NONE),
>  	},
> +	{
> +		.name = "adl_mx98360a_cs4242",
> +		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
> +					SOF_SPEAKER_AMP_PRESENT |
> +					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
> +					SOF_CS42L42_SSP_AMP(1) |
> +					SOF_CS42L42_NUM_HDMIDEV(4) |
> +					SOF_BT_OFFLOAD_PRESENT |
> +					SOF_CS42L42_SSP_BT(2)) |
> +					SOF_CS42L42_DAILINK(LINK_HP, LINK_DMIC, LINK_HDMI, LINK_SPK, LINK_BT),
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, board_ids);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> index 7c8cd00457f81..3f40519250a90 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> @@ -384,6 +384,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  		.sof_fw_filename = "sof-adl.ri",
>  		.sof_tplg_filename = "sof-adl-cs35l41.tplg",
>  	},
> +	{
> +		.id = "10134242",
> +		.drv_name = "adl_mx98360a_cs4242",
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &adl_max98360a_amp,
> +		.sof_fw_filename = "sof-adl.ri",

no longer necessary, and probably will not compile. please remove this
field.

> +		.sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",

Why would you refer to a topology that uses a different codec?


