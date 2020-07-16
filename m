Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69924222A6A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 19:50:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E77301662;
	Thu, 16 Jul 2020 19:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E77301662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594921833;
	bh=njkw8LG+b1F3vWPEielID5ktURLxMqtqArZ2aoVk7AU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OfuMyGEcoUTnX2VQvI7TvBCDwASK2N3rRKOfhAzpgTXZEs/QB4rkkO7FeZCE6gbWN
	 /rfqEQt831Oaz6vQcW4GmZjStoZsREBjWxjz+VzVXWgBVIWk8AYxYkzhYuZbK41qI0
	 Bb0K13+jT3cUlLF6uhpOT/sLVBA7lm5lwuU401F0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8CB1F80110;
	Thu, 16 Jul 2020 19:49:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFD1BF801F2; Thu, 16 Jul 2020 19:49:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFB11F8014C
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 19:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFB11F8014C
IronPort-SDR: pOGtmBzzOWsU18pPmch3l7sT084C8XmYjwcJMYMBcvD3vq7nRcmd1FPrDAaaX2P4LynWAo3anZ
 7MSsE/bNaGJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="146963913"
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; d="scan'208";a="146963913"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 10:49:13 -0700
IronPort-SDR: +FJMnqbi0e5opvXc/QNBLvyCHwRoCRa12NBi7JzCh7a/livn8ib1kDpO+9d2btffBpmf85sew7
 Cy+xleFVaiug==
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; d="scan'208";a="486691924"
Received: from unknown (HELO [10.254.114.13]) ([10.254.114.13])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 10:49:12 -0700
Subject: Re: [PATCH v6] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix
 kabylake_ssp_fixup function
To: Harsha Priya <harshapriya.n@intel.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <1594919637-31460-1-git-send-email-harshapriya.n@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <48a6db3a-2aef-cfca-19ec-7825573fc3da@linux.intel.com>
Date: Thu, 16 Jul 2020 12:49:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594919637-31460-1-git-send-email-harshapriya.n@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: yang.jie@linux.intel.com, rad@semihalf.com, zwisler@google.com,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 sathya.prakash.m.r@intel.com, brndt@google.com, mw@semihalf.com,
 levinale@chromium.org, lma@semihalf.com
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




> diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> index 584e4f9cedc2..b261b1c466a8 100644
> --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> @@ -379,22 +379,30 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
>   	struct snd_interval *chan = hw_param_interval(params,
>   			SNDRV_PCM_HW_PARAM_CHANNELS);
>   	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
> -	struct snd_soc_dpcm *dpcm = container_of(
> -			params, struct snd_soc_dpcm, hw_params);
> -	struct snd_soc_dai_link *fe_dai_link = dpcm->fe->dai_link;
> -	struct snd_soc_dai_link *be_dai_link = dpcm->be->dai_link;
> +	struct snd_soc_dpcm *dpcm, *rtd_dpcm;
> +
> +	/*
> +	 * This macro will be called for playback stream
> +	 */
> +	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_PLAYBACK, dpcm)
> +		rtd_dpcm = dpcm;
> +	/*
> +	 * This macro will be called for capture stream
> +	 */
> +	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_CAPTURE, dpcm)
> +		rtd_dpcm = dpcm;

is the assumption that both of those loops return the same pointer?
If yes, why not stop for the first non-NULL dpcm value?
Also wondering if you are using a loop because there's no other helper 
available?

>   
>   	/*
>   	 * The ADSP will convert the FE rate to 48k, stereo, 24 bit
>   	 */
> -	if (!strcmp(fe_dai_link->name, "Kbl Audio Port") ||
> -	    !strcmp(fe_dai_link->name, "Kbl Audio Headset Playback") ||
> -	    !strcmp(fe_dai_link->name, "Kbl Audio Capture Port")) {
> +	if (!strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Port") ||
> +	    !strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Headset Playback") ||
> +	    !strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Capture Port")) {
>   		rate->min = rate->max = 48000;
>   		chan->min = chan->max = 2;
>   		snd_mask_none(fmt);
>   		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
> -	} else if (!strcmp(fe_dai_link->name, "Kbl Audio DMIC cap")) {
> +	} else if (!strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio DMIC cap")) {
>   		if (params_channels(params) == 2 ||
>   				DMIC_CH(dmic_constraints) == 2)
>   			chan->min = chan->max = 2;
> @@ -405,7 +413,7 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
>   	 * The speaker on the SSP0 supports S16_LE and not S24_LE.
>   	 * thus changing the mask here
>   	 */
> -	if (!strcmp(be_dai_link->name, "SSP0-Codec"))
> +	if (!strcmp(rtd_dpcm->be->dai_link->name, "SSP0-Codec"))
>   		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
>   
>   	return 0;
> 
