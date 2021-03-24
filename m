Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA39A3480D8
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 19:45:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2281A15E0;
	Wed, 24 Mar 2021 19:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2281A15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616611503;
	bh=XUM8mAx9ePtthebXoX1uoiavdmE5TUuJRovaTVUFX2w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h3m0ZbB1MeTYoFQxrExSs3NWlAuxZBdTeKoVB67r7MG0jBgCA8P5dPT3cZZOPaFId
	 bG6ui+M5ZsAabF7FU9JEnsCzWFe+nYS5YUXUotVaYr3lqtW2eFblyBlRcjdk5fhJSv
	 uB7vF7/sK2HH7N0X5+h1MRKNnx62w61fCiBtfW44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A14BF800FF;
	Wed, 24 Mar 2021 19:43:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DDF6F8016B; Wed, 24 Mar 2021 19:43:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF34AF80104
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 19:43:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF34AF80104
IronPort-SDR: krE9SmFyvVLT3IJN3Odu+EF+JLveqsg6GNTtDM1dKxDOMMhHpA+BR1YgMC+1cc68xpUJZzrs9W
 wlWA27vaPCCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="170114460"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="170114460"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 11:43:09 -0700
IronPort-SDR: lBLxggSLXt7jcEtCOZiliFsWmOVIZBbm/5mdubY5obY+zHDYlO0MjC+Fqvj83tpmNYf/DYx7Vg
 AvETGfYnKglA==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="436132525"
Received: from jmtabang-mobl2.amr.corp.intel.com (HELO [10.213.166.106])
 ([10.213.166.106])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 11:43:08 -0700
Subject: Re: [PATCH 2/2] ASoc: Intel: board: add BE DAI link for WoV
To: vamshi.krishna.gopal@intel.com, alsa-devel@alsa-project.org,
 "Rojewski, Cezary" <cezary.rojewski@intel.com>
References: <20210324175200.44922-1-vamshi.krishna.gopal@intel.com>
 <20210324175200.44922-3-vamshi.krishna.gopal@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <66a73c07-8152-9f55-c8e6-bb5bf68056ac@linux.intel.com>
Date: Wed, 24 Mar 2021 13:43:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210324175200.44922-3-vamshi.krishna.gopal@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: harshapriya.n@intel.com, sathya.prakash.m.r@intel.com, broonie@kernel.org,
 biernacki@google.com, pierre-louis.bossart@intel.com
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



On 3/24/21 12:52 PM, vamshi.krishna.gopal@intel.com wrote:
> From: Mac Chiang <mac.chiang@intel.com>
> 
> create dai link in kbl_da7219_max98357a driver for wake on voice
> functionality.
> 
> changes picked from broonie's tree
> commit 0c7941a63a0f
> ("ASoC: Intel: Skylake: Use refcap device for mono recording")
> commit 2154be362c90
> ("ASoc: Intel: boards: Add WOV as sink for nau88l25_ssm4567 machine")
> 
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
> Tested-by: Kaiyen Chang <kaiyen.chang@intel.corp-partner.google.com>
> Tested-by: luke yang <luke_yang@compal.corp-partner.google.com>
> Tested-by: Grace Kao <grace.kao@intel.com>
> Tested-by: Kaiyen Chang <kaiyen.chang@intel.com>
> Reviewed-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>   sound/soc/intel/boards/kbl_da7219_max98357a.c | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
> index 1d6b2855874d..c9d83eebf4a8 100644
> --- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
> +++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
> @@ -44,6 +44,7 @@ struct kbl_codec_private {
>   enum {
>   	KBL_DPCM_AUDIO_PB = 0,
>   	KBL_DPCM_AUDIO_CP,
> +	KBL_DPCM_AUDIO_REF_CP,
>   	KBL_DPCM_AUDIO_DMIC_CP,
>   	KBL_DPCM_AUDIO_HDMI1_PB,
>   	KBL_DPCM_AUDIO_HDMI2_PB,
> @@ -335,12 +336,36 @@ static struct snd_soc_ops kabylake_dmic_ops = {
>   	.startup = kabylake_dmic_startup,
>   };
>   
> +static const struct snd_pcm_hw_constraint_list constraints_refcap = {
> +	.count = ARRAY_SIZE(ch_mono),
> +	.list  = ch_mono,
> +};
> +
> +static int kabylake_refcap_startup(struct snd_pcm_substream *substream)
> +{
> +	substream->runtime->hw.channels_max = 1;
> +	snd_pcm_hw_constraint_list(substream->runtime, 0,
> +					SNDRV_PCM_HW_PARAM_CHANNELS,
> +					&constraints_refcap);
> +
> +	return snd_pcm_hw_constraint_list(substream->runtime, 0,
> +					SNDRV_PCM_HW_PARAM_RATE,
> +					&constraints_16000);
> +}
> +
> +static struct snd_soc_ops skylaye_refcap_ops = {
> +	.startup = kabylake_refcap_startup,
> +};
> +
>   SND_SOC_DAILINK_DEF(dummy,
>   	DAILINK_COMP_ARRAY(COMP_DUMMY()));
>   
>   SND_SOC_DAILINK_DEF(system,
>   	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
>   
> +SND_SOC_DAILINK_DEF(reference,
> +	DAILINK_COMP_ARRAY(COMP_CPU("Reference Pin")));
> +
>   SND_SOC_DAILINK_DEF(dmic,
>   	DAILINK_COMP_ARRAY(COMP_CPU("DMIC Pin")));
>   
> @@ -415,6 +440,16 @@ static struct snd_soc_dai_link kabylake_dais[] = {
>   		.ops = &kabylake_da7219_fe_ops,
>   		SND_SOC_DAILINK_REG(system, dummy, platform),
>   	},
> +	[KBL_DPCM_AUDIO_REF_CP] = {
> +		.name = "Kbl Audio Reference cap",
> +		.stream_name = "Wake on Voice",

Does anyone have a clear definition of what "REF_CP" and "reference" 
mean? it's not echo reference since there is a separate entry for this, 
so not sure what the term means.

Half of the SKL/KBL drivers seem to use this FE for "Wake on Voice" and 
the other half use it for 'Refcap', this doesn't look very consistent.

> +		.init = NULL,
> +		.dpcm_capture = 1,
> +		.nonatomic = 1,
> +		.dynamic = 1,
> +		.ops = &skylaye_refcap_ops,
> +		SND_SOC_DAILINK_REG(reference, dummy, platform),
> +	},
>   	[KBL_DPCM_AUDIO_DMIC_CP] = {
>   		.name = "Kbl Audio DMIC cap",
>   		.stream_name = "dmiccap",
> 
