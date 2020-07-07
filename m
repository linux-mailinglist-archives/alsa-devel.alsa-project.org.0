Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD85A217356
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 18:09:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47472836;
	Tue,  7 Jul 2020 18:08:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47472836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594138157;
	bh=zPfaQ7+/qfP0sux56bqb6v4k4CoZL8HXESETSyEaadY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Go4Otk562RKKgHZN84wq64/EaitEr539CLRCbnj/oWMdLtqJqo/Kvh3OVMsj4ImMZ
	 a+Mt2ugdopxR15GFCmRi3dRc41eS5Rr9hTZXhOAJVo52a38BKmjOvnLg4RvbZEAFKT
	 KyKoR6GkseQ6Lz5xcjbB18SwBNyHbJrhBQuQeHTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58FB5F8027C;
	Tue,  7 Jul 2020 18:06:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37418F800DF; Tue,  7 Jul 2020 18:06:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04331F800D0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 18:06:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04331F800D0
IronPort-SDR: LplHI+hw7qJ9qby5Gae4HcZuNHtuwyEWdM6sbXfeeUVlQzambiqbX2WnCXFuF4u9zE3R2PVQ1I
 MCCEBPw61o0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="149148668"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="149148668"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 09:06:30 -0700
IronPort-SDR: nWzZSRwTYFqoBfaDlAkFLsCJyfwsTGyETLYfq5n1HLZ0dF0GicOQgpoHJU44M6tg9L8HxECkUI
 Lekna+wYWHUg==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="305713010"
Received: from stortizs-mobl1.amr.corp.intel.com (HELO [10.254.109.228])
 ([10.254.109.228])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 09:06:29 -0700
Subject: Re: [PATCH v5] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix
 kabylake_ssp_fixup function
To: Lukasz Majczak <lma@semihalf.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Harsha Priya <harshapriya.n@intel.com>
References: <20200703121650.547944-1-lma@semihalf.com>
 <20200707083404.3846-1-lma@semihalf.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4cb5ea5a-60b3-7f74-0f68-e66d2f2872bf@linux.intel.com>
Date: Tue, 7 Jul 2020 10:47:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707083404.3846-1-lma@semihalf.com>
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



On 7/7/20 3:34 AM, Lukasz Majczak wrote:
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
> Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> Signed-off-by: Harsha Priya <harshapriya.n@intel.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> v1 -> v2:
> - Extract dmic from SSP0 as every BE should have own fixup function.
> v2 -> v3:
> - Restore naming in the dapm route table to not confuse with other
> drivers
> - Fixed indentations
> v3 -> v4:
> - Updated code and commit description according to
> solution proposed by Harsha
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
