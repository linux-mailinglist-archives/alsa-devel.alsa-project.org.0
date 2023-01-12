Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DDD667918
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 16:24:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDCCE91BF;
	Thu, 12 Jan 2023 16:23:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDCCE91BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673537055;
	bh=D0hNIdfv9EWyP1RVxQgqv7k1sO7+UaCb9F79/VZ74AM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GuooqCAJrqs1ry2v4KK6tZoQf6sskteAvGGGEWVuqQUniNibRSiL0ylcyRbIqoCaA
	 KjeVxhY3zwKeQ+kmrG8xliXtlQf5PbjEAmwKdMomPLsQYiZCV58P5pgdWhKt+pR8bc
	 2uegNWVDmo3AEsEIFYRpksnO05A2rukGxJKAVp6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 963D8F8016E;
	Thu, 12 Jan 2023 16:23:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8B00F8016E; Thu, 12 Jan 2023 16:23:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A48CBF8016E
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 16:23:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A48CBF8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G2fA/egN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673536993; x=1705072993;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=D0hNIdfv9EWyP1RVxQgqv7k1sO7+UaCb9F79/VZ74AM=;
 b=G2fA/egN1Wi66kYUs5lcEIydoEcAddA/DiYghSsts2VMfNRnlpaQkgYe
 ya3bQD+Wu0AiC4TdNikmrpwKJGsRMZSbVNpU1Q557rrPcWuRBjlgH9e/G
 7OUSGe6i3TmdDfT8gyw9CsG8GTQKmrahCOseRlL29AYHBAU1sC9LTGzxJ
 3DRj3QWF6dNdFO0xwBTAUiSooMzEpueOp+A8m4/Lh1QZwMR7rPsauW/AE
 r7FPXGWwNlK1GMnLei0Wls7zEu4dosob0U9g03TqCcxnOVYHjN+RY1obw
 tSxZRJQuad9UAzQdHj4Yeh4NpVP/Wyr1cCFdEMwqHYylVhhoEXEBhSpOc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="388212560"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="388212560"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 06:57:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="607816924"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="607816924"
Received: from jbetan3x-mobl1.amr.corp.intel.com (HELO [10.209.143.163])
 ([10.209.143.163])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 06:57:10 -0800
Message-ID: <d83615ae-10d9-ca5b-26aa-522b3f10b43f@linux.intel.com>
Date: Thu, 12 Jan 2023 08:19:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: soc-pcm.c: Introduce a count to record the times of
 setting DAIs parameters
To: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230112065834.580192-1-chancel.liu@nxp.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230112065834.580192-1-chancel.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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



On 1/12/23 00:58, Chancel Liu wrote:
> The commit 1da681e52853 ("ASoC: soc-pcm.c: Clear DAIs parameters after
> stream_active is updated") tries to make sure DAIs parameters can be
> cleared properly through moving the cleanup to the place where
> stream_active is updated. However, it will cause the cleanup only
> happening in soc_pcm_close().
> 
> Suppose a case: aplay -Dhw:0 44100.wav 48000.wav. The case calls
> soc_pcm_open()->soc_pcm_hw_params()->soc_pcm_hw_free()->
> soc_pcm_hw_params()->soc_pcm_hw_free()->soc_pcm_close() in order. The
> parameters would be remained in the system even if the playback of
> 44100.wav is finished.
> 
> The case requires us clearing parameters in phase of soc_pcm_hw_free().
> We shouldn't use stream_active to decide if we must do the cleanup
> since it is finally updated in soc_pcm_close().
> 
> This patch introduces a usage count called hw_params_count in
> snd_soc_dai structure. It records the times of setting parameters to
> this DAI then decreases each time soc_pcm_hw_free() is called. If the
> count decreases to 0, it means this DAI is not used now and we should
> clear the parameters.

what makes you think that the use of hw_params and hw_free is symmetrical?

A couple of years ago we found a case where the FE hw_params failed, and
in that case the BE hw_free was called without the BE hw_params ever
being invoked first. This is due to the DPCM error handling, and as a
result all our hw_free implementations test if the resources are
actually allocated/valid and never assume hw_params was used.

IIRC it's also valid to call hw_params multiple times without calling
hw_free every time.

> Fixes: 1da681e52853 ("ASoC: soc-pcm.c: Clear DAIs parameters after stream_active is updated")
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  include/sound/soc-dai.h |  3 +++
>  sound/soc/soc-pcm.c     | 16 +++++++++++-----
>  2 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
> index ea7509672086..a7e589a0fe72 100644
> --- a/include/sound/soc-dai.h
> +++ b/include/sound/soc-dai.h
> @@ -451,6 +451,9 @@ struct snd_soc_dai {
>  	unsigned int channels;
>  	unsigned int sample_bits;
>  
> +	/* Count of setting DAI parameters */
> +	unsigned int hw_params_count;
> +
>  	/* parent platform/codec */
>  	struct snd_soc_component *component;
>  
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 579a44d81d9a..2c2a5dcf9e06 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -711,14 +711,10 @@ static int soc_pcm_clean(struct snd_soc_pcm_runtime *rtd,
>  
>  	if (!rollback) {
>  		snd_soc_runtime_deactivate(rtd, substream->stream);
> -		/* clear the corresponding DAIs parameters when going to be inactive */
> -		for_each_rtd_dais(rtd, i, dai) {
> -			if (snd_soc_dai_active(dai) == 0)
> -				soc_pcm_set_dai_params(dai, NULL);
>  
> +		for_each_rtd_dais(rtd, i, dai)
>  			if (snd_soc_dai_stream_active(dai, substream->stream) == 0)
>  				snd_soc_dai_digital_mute(dai, 1, substream->stream);
> -		}
>  	}
>  
>  	for_each_rtd_dais(rtd, i, dai)
> @@ -949,6 +945,14 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
>  
>  	snd_soc_dpcm_mutex_assert_held(rtd);
>  
> +	/* clear the corresponding DAIs parameters when hw_params_count decreases to 0 */
> +	for_each_rtd_dais(rtd, i, dai)
> +		if (snd_soc_dai_stream_valid(dai, substream->stream)) {
> +			dai->hw_params_count--;
> +			if (dai->hw_params_count == 0)
> +				soc_pcm_set_dai_params(dai, NULL);
> +		}
> +
>  	/* run the stream event */
>  	snd_soc_dapm_stream_stop(rtd, substream->stream);
>  
> @@ -1051,6 +1055,7 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
>  
>  		soc_pcm_set_dai_params(codec_dai, &codec_params);
>  		snd_soc_dapm_update_dai(substream, &codec_params, codec_dai);
> +		codec_dai->hw_params_count++;
>  	}
>  
>  	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> @@ -1068,6 +1073,7 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
>  		/* store the parameters for each DAI */
>  		soc_pcm_set_dai_params(cpu_dai, params);
>  		snd_soc_dapm_update_dai(substream, params, cpu_dai);
> +		cpu_dai->hw_params_count++;
>  	}
>  
>  	ret = snd_soc_pcm_component_hw_params(substream, params);
