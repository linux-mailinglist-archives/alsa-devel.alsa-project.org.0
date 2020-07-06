Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8647215AF9
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 17:43:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92A9C1665;
	Mon,  6 Jul 2020 17:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92A9C1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594050226;
	bh=jGPqGlgX603MiQSpwfA/296KcleJQZKsn11rhAb0N/U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LPa0L65NfwagbVzEsPM3GzrxIk8th6kzm15zJeW/CC405jIDE+s0OwzERFddQ2rzk
	 lEKHJ9XRPe5NFvvfS7SYR8Lrg8+8gyK0bAhXEYiOD1Z/sAGWCgBvi7ULl1QYfVg6qj
	 n/ziTReTKEQJInNFZPgLidn1WfNqMYUYapdAgyl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B11E6F8015C;
	Mon,  6 Jul 2020 17:42:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5917EF8015A; Mon,  6 Jul 2020 17:42:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AE57F80125
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 17:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AE57F80125
IronPort-SDR: kJCTGzD1b1pJlkORVrUkGF411iEvk7o35jaKu5XMcqE8PwjS+E6uBJObqYmY0Q3u94Xr+Goao+
 8hH/i8w065lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="145539850"
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; d="scan'208";a="145539850"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 08:41:50 -0700
IronPort-SDR: AS0HeRsqQZt0NvwtBpVT084SnSxbfpTRzLF4kAisPpb/x+Zo9438wtNF1Cuj6SmOBZvJiBxi/V
 RbpnIUrH4/lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; d="scan'208";a="313997880"
Received: from aislam-mobl1.amr.corp.intel.com ([10.212.167.133])
 by orsmga008.jf.intel.com with ESMTP; 06 Jul 2020 08:41:47 -0700
Subject: Re: [PATCH v4] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix
 kabylake_ssp_fixup function
To: Lukasz Majczak <lma@semihalf.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Harsha Priya <harshapriya.n@intel.com>
References: <20200521162518.1809995-1-lma@semihalf.com>
 <20200703121650.547944-1-lma@semihalf.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5dfc3678-0f12-7823-2571-ab0dff250d15@linux.intel.com>
Date: Mon, 6 Jul 2020 10:41:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200703121650.547944-1-lma@semihalf.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Radoslaw Biernacki <rad@semihalf.com>,
 Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Bob Brandt <brndt@google.com>,
 Marcin Wojtas <mw@semihalf.com>, Alex Levin <levinale@chromium.org>,
 Gopal Vamshi Krishna <vamshi.krishna.gopal@intel.com>
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

On 7/3/20 7:16 AM, Lukasz Majczak wrote:
> Fix kabylake_ssp_fixup function to distinguish codecs DAIs by names,
> as current approach, leads to crash while trying to get snd_soc_dpcm with
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
> v3 -> v4:
> - Updated code and commit description according to
> solution proposed by Harsha

Looks good Lukasz but you need to move the information on changes below 
the --- marker (~4 lines below).

> 
> Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
> ---
>   .../intel/boards/kbl_rt5663_rt5514_max98927.c | 28 ++++++++-----------
>   1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> index b34cf6cf11395..df454de40739a 100644
> --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> @@ -333,36 +333,32 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
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
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>   
>   	/*
>   	 * The ADSP will convert the FE rate to 48k, stereo, 24 bit
>   	 */
> -	if (!strcmp(fe_dai_link->name, "Kbl Audio Port") ||
> -	    !strcmp(fe_dai_link->name, "Kbl Audio Headset Playback") ||
> -	    !strcmp(fe_dai_link->name, "Kbl Audio Capture Port")) {
> +
> +	if (!strcmp(codec_dai->name, KBL_REALTEK_DMIC_CODEC_DAI)) {
> +		if (params_channels(params) == 2 ||
> +			DMIC_CH(dmic_constraints) == 2)
> +			channels->min = channels->max = 2;
> +		else
> +			channels->min = channels->max = 4;
> +	} else {
>   		rate->min = rate->max = 48000;
> -		chan->min = chan->max = 2;
> +		channels->min = channels->max = 2;
>   		snd_mask_none(fmt);
>   		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
> -	} else if (!strcmp(fe_dai_link->name, "Kbl Audio DMIC cap")) {
> -		if (params_channels(params) == 2 ||
> -				DMIC_CH(dmic_constraints) == 2)
> -			chan->min = chan->max = 2;
> -		else
> -			chan->min = chan->max = 4;
>   	}
>   	/*
>   	 * The speaker on the SSP0 supports S16_LE and not S24_LE.
>   	 * thus changing the mask here
>   	 */
> -	if (!strcmp(be_dai_link->name, "SSP0-Codec"))
> +	if (!strcmp(codec_dai->name, KBL_MAXIM_CODEC_DAI))
>   		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
>   
>   	return 0;
> 

