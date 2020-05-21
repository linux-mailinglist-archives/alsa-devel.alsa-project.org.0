Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B541DD31C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 18:34:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5381B1847;
	Thu, 21 May 2020 18:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5381B1847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590078862;
	bh=R/NxxWx6cvWeSEowRQNoBa8Ouhk4xu42i0CVb0Edh3M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=psDOIrgGpjB7HGUioV1TQTJjj7wd7Jed471RPGXBDR6vi6RHWPLrZptrVLa7iPPvR
	 rbGiMWh3r/iJHOLfmWC7A6/tJ2bTHP9YcxXhVV+WOIYB1Rc5ecbBW96u2Jx2aYMEIU
	 boI8Uz1C7HU9SzKWOF4ag81eUoIAGq6C1PDvNTFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66D15F800E1;
	Thu, 21 May 2020 18:32:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C1BFF801D8; Thu, 21 May 2020 18:32:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E024EF800E1
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 18:32:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E024EF800E1
IronPort-SDR: AjHlEWeIyjBLHcJZaN+Jv+lZeGyxE30ZAiAtvuefX7eHBBtRq3uhcpHm6AQqe+FLDtL8WMR6hX
 pXnM9eco9O3Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 09:32:28 -0700
IronPort-SDR: RXLazYsH1pbpXyIUtm12IXZUbPqpKI479aw0yhJV5rReRQaAPpmmynHiOMPCKCTp/Ns1ZAP71L
 OskRImsJbdew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,418,1583222400"; d="scan'208";a="254027709"
Received: from dsrao-mobl.amr.corp.intel.com (HELO [10.255.229.80])
 ([10.255.229.80])
 by orsmga007.jf.intel.com with ESMTP; 21 May 2020 09:32:27 -0700
Subject: Re: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
To: Lukasz Majczak <lma@semihalf.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
References: <20200521162518.1809995-1-lma@semihalf.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3c89e614-81f5-ba87-19a9-fbe9f5c73925@linux.intel.com>
Date: Thu, 21 May 2020 11:32:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200521162518.1809995-1-lma@semihalf.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Radoslaw Biernacki <rad@semihalf.com>,
 Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org,
 Bob Brandt <brndt@google.com>, Marcin Wojtas <mw@semihalf.com>,
 Alex Levin <levinale@chromium.org>
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



On 5/21/20 11:25 AM, Lukasz Majczak wrote:
> Split be_hw_params_fixup function for different codecs as current common
> function, leads to crash while trying to get snd_soc_dpcm with
> container_of() macro in kabylake_ssp_fixup().
> The crash call path looks as below:
> soc_pcm_hw_params()
> snd_soc_dai_hw_params(codec_dai, substream, &codec_params);
> rtd->dai_link->be_hw_params_fixup(rtd, params)
> kabylake_ssp_fixup()
> In this case, codec_params is just a copy of an internal structure and is
> not embedded into struct snd_soc_dpcm thus we cannot use
> container_of() on it.
> 
> v1 -> v2:
> - Extract dmic from SSP0 as every BE should have own fixup function.
> v2 -> v3:
> - Restore naming in the dapm route table to not confuse with other
> drivers
> - Fixed indentations

you need the changelog to be below the --- marker two lines down.

> 
> Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> ---

[...]

> +static int kabylake_dmic01_hw_params(struct snd_pcm_substream *substream,
> +	struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	int ret = 0;
> +
> +	ret = snd_soc_dai_set_tdm_slot(rtd->codec_dai, 0xF, 0, 8, 16);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "set TDM slot err:%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_dai_set_sysclk(rtd->codec_dai,
> +		RT5514_SCLK_S_MCLK, 24576000, SND_SOC_CLOCK_IN);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "set sysclk err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
>   static struct snd_soc_ops kabylake_ssp0_ops = {
>   	.hw_params = kabylake_ssp0_hw_params,
>   };
>   
> +static struct snd_soc_ops kabylake_dmic01_ops = {
> +	.hw_params = kabylake_dmic01_hw_params,
> +};
> +
>   static const unsigned int channels_dmic[] = {
>   	4,
>   };
> @@ -507,14 +528,19 @@ SND_SOC_DAILINK_DEF(ssp0_pin,
>   SND_SOC_DAILINK_DEF(ssp0_codec,
>   	DAILINK_COMP_ARRAY(
>   	/* Left */ COMP_CODEC(MAXIM_DEV0_NAME, KBL_MAXIM_CODEC_DAI),
> -	/* Right */COMP_CODEC(MAXIM_DEV1_NAME, KBL_MAXIM_CODEC_DAI),
> -	/* dmic */ COMP_CODEC(RT5514_DEV_NAME, KBL_REALTEK_DMIC_CODEC_DAI)));
> +	/* Right */COMP_CODEC(MAXIM_DEV1_NAME, KBL_MAXIM_CODEC_DAI)));
>   
>   SND_SOC_DAILINK_DEF(ssp1_pin,
>   	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
>   SND_SOC_DAILINK_DEF(ssp1_codec,
>   	DAILINK_COMP_ARRAY(COMP_CODEC(RT5663_DEV_NAME, KBL_REALTEK_CODEC_DAI)));
>   
> +SND_SOC_DAILINK_DEF(dmic01_pin,
> +	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
> +SND_SOC_DAILINK_DEF(dmic01_codec,
> +	DAILINK_COMP_ARRAY(
> +		COMP_CODEC(RT5514_DEV_NAME, KBL_REALTEK_DMIC_CODEC_DAI)));
> +
>   SND_SOC_DAILINK_DEF(idisp1_pin,
>   	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
>   SND_SOC_DAILINK_DEF(idisp1_codec,
> @@ -618,9 +644,8 @@ static struct snd_soc_dai_link kabylake_dais[] = {
>   			SND_SOC_DAIFMT_NB_NF |
>   			SND_SOC_DAIFMT_CBS_CFS,
>   		.ignore_pmdown_time = 1,
> -		.be_hw_params_fixup = kabylake_ssp_fixup,
> +		.be_hw_params_fixup = kabylake_ssp0_fixup,
>   		.dpcm_playback = 1,
> -		.dpcm_capture = 1,
>   		.ops = &kabylake_ssp0_ops,
>   		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
>   	},
> @@ -632,12 +657,25 @@ static struct snd_soc_dai_link kabylake_dais[] = {
>   		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
>   			SND_SOC_DAIFMT_CBS_CFS,
>   		.ignore_pmdown_time = 1,
> -		.be_hw_params_fixup = kabylake_ssp_fixup,
> +		.be_hw_params_fixup = kabylake_ssp1_fixup,
>   		.ops = &kabylake_rt5663_ops,
>   		.dpcm_playback = 1,
>   		.dpcm_capture = 1,
>   		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
>   	},
> +	{
> +		.name = "dmic01",
> +		.id = 2,
> +		.no_pcm = 1,
> +		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
> +			SND_SOC_DAIFMT_NB_NF |
> +			SND_SOC_DAIFMT_CBS_CFS,
> +		.ignore_pmdown_time = 1,
> +		.be_hw_params_fixup = kabylake_dmic_fixup,
> +		.dpcm_capture = 1,
> +		.ops = &kabylake_dmic01_ops,
> +		SND_SOC_DAILINK_REG(dmic01_pin, dmic01_codec, platform),
> +	},

don't add a new dailink, this is not right.

>   	{
>   		.name = "iDisp1",
>   		.id = 3,
> 
> base-commit: a4f6fc98cd2fa1774bcaeb248c67156ef9402a56
> 
