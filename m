Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B49061D304B
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 14:49:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62F421686;
	Thu, 14 May 2020 14:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62F421686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589460543;
	bh=CFMUxMSo9U3SCfb8abjjqmZbqTdswjQSNZ77PhMd0JM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QcwGufYcvfrqx07T9iI9JQlKwYCIDwHZoW6XDspJGeIwdAyPVOql09HUAcIElUPEL
	 pUPgApDMdlqkwuhTcJUxNys6cyFsHgUbOCYACCrzTyg3XrHv6Wr6+eXifYJi7Tcnh+
	 8l+qrOR1Rp9BBLmrzmmBERdFQB8Vqulf1Gyd1ozo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94EB9F800BD;
	Thu, 14 May 2020 14:47:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66A4FF80158; Thu, 14 May 2020 14:47:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D673F800E3
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 14:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D673F800E3
IronPort-SDR: RX6ZmjLIHM1gdsEjlsEOih5LD59361u+z4tsAILE7Sga1kBu3mtesKGNDygZYKeLtYzm3bFXef
 25sdbsq/XBRw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2020 05:47:09 -0700
IronPort-SDR: av5Re4jD3u5L9XXPeZB1/hAQvfb+CJci9mOlMSaJ00Dzx2Wy4tlhk/hoZ52eB/2otlGoCaoyqv
 wtUvbIlVDLsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,391,1583222400"; d="scan'208";a="262824607"
Received: from dpschroe-mobl1.amr.corp.intel.com (HELO [10.254.66.46])
 ([10.254.66.46])
 by orsmga003.jf.intel.com with ESMTP; 14 May 2020 05:47:08 -0700
Subject: Re: [PATCH] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
To: Lukasz Majczak <lma@semihalf.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
References: <20200513192020.544928-1-lma@semihalf.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <52ab4557-e551-ce20-247c-681c2a0d1ad1@linux.intel.com>
Date: Thu, 14 May 2020 07:47:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513192020.544928-1-lma@semihalf.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Radoslaw Biernacki <rad@semihalf.com>,
 Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Bob Brandt <brndt@google.com>,
 Marcin Wojtas <mw@semihalf.com>, Alex Levin <levinale@chromium.org>
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



On 5/13/20 2:20 PM, Lukasz Majczak wrote:
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

This looks like a nice/welcome change, we've had these unexplained 
crashes on KBL since 4.19 (reported by Guenter and me). I thought they 
were topology related.

If indeed this fixes the issue, it might be worth applying in to all 
stable releases?

Since we have the same code structure for the other kbl drivers, would 
it also make sense to apply the same fixes there:

kbl_da7219_max98927.c:  struct snd_soc_dpcm *dpcm = container_of(
kbl_rt5663_max98927.c:  struct snd_soc_dpcm *dpcm = container_of(


> 
> Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> ---
>   .../intel/boards/kbl_rt5663_rt5514_max98927.c | 68 +++++++++++--------
>   1 file changed, 39 insertions(+), 29 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> index 1b1f8d7a4ea3..2e0ae724122c 100644
> --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> @@ -328,46 +328,55 @@ static const struct snd_soc_ops kabylake_rt5663_fe_ops = {
>   	.startup = kbl_fe_startup,
>   };
>   
> -static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
> -					struct snd_pcm_hw_params *params)
> +static void kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
> +	struct snd_pcm_hw_params *params, snd_pcm_format_t pcm_fmt)
>   {
>   	struct snd_interval *rate = hw_param_interval(params,
>   			SNDRV_PCM_HW_PARAM_RATE);
> -	struct snd_interval *chan = hw_param_interval(params,
> +	struct snd_interval *channels = hw_param_interval(params,
>   			SNDRV_PCM_HW_PARAM_CHANNELS);
>   	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
> -	struct snd_soc_dpcm *dpcm = container_of(
> -			params, struct snd_soc_dpcm, hw_params);
> -	struct snd_soc_dai_link *fe_dai_link = dpcm->fe->dai_link;
> -	struct snd_soc_dai_link *be_dai_link = dpcm->be->dai_link;
>   
>   	/*
>   	 * The ADSP will convert the FE rate to 48k, stereo, 24 bit
>   	 */
> -	if (!strcmp(fe_dai_link->name, "Kbl Audio Port") ||
> -	    !strcmp(fe_dai_link->name, "Kbl Audio Headset Playback") ||
> -	    !strcmp(fe_dai_link->name, "Kbl Audio Capture Port")) {
> -		rate->min = rate->max = 48000;
> -		chan->min = chan->max = 2;
> -		snd_mask_none(fmt);
> -		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
> -	} else if (!strcmp(fe_dai_link->name, "Kbl Audio DMIC cap")) {
> -		if (params_channels(params) == 2 ||
> -				DMIC_CH(dmic_constraints) == 2)
> -			chan->min = chan->max = 2;
> -		else
> -			chan->min = chan->max = 4;
> -	}
> -	/*
> -	 * The speaker on the SSP0 supports S16_LE and not S24_LE.
> -	 * thus changing the mask here
> -	 */
> -	if (!strcmp(be_dai_link->name, "SSP0-Codec"))
> -		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
>   
> +	rate->min = rate->max = 48000;
> +	channels->min = channels->max = 2;
> +
> +	snd_mask_none(fmt);
> +	snd_mask_set_format(fmt, pcm_fmt);
> +}
> +
> +static int kabylake_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
> +	struct snd_pcm_hw_params *params)
> +{
> +	kabylake_ssp_fixup(rtd, params, SNDRV_PCM_FORMAT_S16_LE);
>   	return 0;
>   }
>   
> +static int kabylake_ssp1_fixup(struct snd_soc_pcm_runtime *rtd,
> +	struct snd_pcm_hw_params *params)
> +{
> +
> +	kabylake_ssp_fixup(rtd, params, SNDRV_PCM_FORMAT_S24_LE);
> +	return 0;
> +}
> +
> +static int kabylake_dmic_cap_fixup(struct snd_soc_pcm_runtime *rtd,
> +	struct snd_pcm_hw_params *params)
> +{
> +	struct snd_interval *channels = hw_param_interval(params,
> +			SNDRV_PCM_HW_PARAM_CHANNELS);
> +
> +	if (params_channels(params) == 2 ||
> +			DMIC_CH(dmic_constraints) == 2)
> +		channels->min = channels->max = 2;
> +	else
> +		channels->min = channels->max = 4;
> +
> +	return 0;
> +}
>   static int kabylake_rt5663_hw_params(struct snd_pcm_substream *substream,
>   	struct snd_pcm_hw_params *params)
>   {
> @@ -582,6 +591,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
>   		.dpcm_capture = 1,
>   		.nonatomic = 1,
>   		.dynamic = 1,
> +		.be_hw_params_fixup = kabylake_dmic_cap_fixup,
>   		.ops = &kabylake_dmic_ops,
>   		SND_SOC_DAILINK_REG(dmic, dummy, platform),
>   	},
> @@ -618,7 +628,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
>   			SND_SOC_DAIFMT_NB_NF |
>   			SND_SOC_DAIFMT_CBS_CFS,
>   		.ignore_pmdown_time = 1,
> -		.be_hw_params_fixup = kabylake_ssp_fixup,
> +		.be_hw_params_fixup = kabylake_ssp0_fixup,
>   		.dpcm_playback = 1,
>   		.dpcm_capture = 1,
>   		.ops = &kabylake_ssp0_ops,
> @@ -632,7 +642,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
>   		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
>   			SND_SOC_DAIFMT_CBS_CFS,
>   		.ignore_pmdown_time = 1,
> -		.be_hw_params_fixup = kabylake_ssp_fixup,
> +		.be_hw_params_fixup = kabylake_ssp1_fixup,
>   		.ops = &kabylake_rt5663_ops,
>   		.dpcm_playback = 1,
>   		.dpcm_capture = 1,
> 
