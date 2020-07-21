Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE882228B70
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 23:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 306041665;
	Tue, 21 Jul 2020 23:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 306041665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595367256;
	bh=ZDlfWzX4rguakV2MSCulIp1D+so3e2rl8gCZ/eueGsk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pMYwbIQRbG63Kzg51fzqjjkFii3w+aWTWq09kJ265zlRoypImFfgZ2MfsXI26cD8k
	 fIN43uBuy9tRo+4f7QgjZiCe7vQBPnOiGU1EJKfEkZdRKZwmyVrpZ9/pWT5CER3GfS
	 NCdm7K7wTG9UAOz77kEcRtHQxgZDLGj8K48G8HwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F698F80268;
	Tue, 21 Jul 2020 23:32:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93878F8024A; Tue, 21 Jul 2020 23:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADEDBF80117
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 23:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADEDBF80117
IronPort-SDR: +0BEgKRrArVSk4SP4ULgRGtHww6Byu3oiyw8A0WXeRs5iZWDSLJ3aZdRLxf+0WtNFzm+N70jws
 pkK26p5PtSYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="129802528"
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="129802528"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 14:32:21 -0700
IronPort-SDR: ybNbB6Dp/FbRgWS2I2DqKRYKfFdSSNj7Qg2UfmHO8E9YpeoxpHhEBrXFDuOnGvyxQ6SYg2pGly
 lLywEmsGCTug==
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="462222006"
Received: from mtchavar-mobl.amr.corp.intel.com (HELO [10.254.78.149])
 ([10.254.78.149])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 14:32:20 -0700
Subject: Re: [PATCH v7] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix
 kabylake_ssp_fixup function
To: Harsha Priya <harshapriya.n@intel.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <1595365649-8019-1-git-send-email-harshapriya.n@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d72ea889-9820-880d-0207-6d2f0dc23bcc@linux.intel.com>
Date: Tue, 21 Jul 2020 16:32:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595365649-8019-1-git-send-email-harshapriya.n@intel.com>
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

Hi Harsha,
this looks mostly good to me, only have a couple of nit-picks below.
Thanks!

> kabylake_ssp_fixup function uses snd_soc_dpcm to identify the codecs DAIs.
> The hw parameters are changed based on the codec DAI,
> the stream is intended for. The earlier approach to get
> snd_soc_dpcm was using container_of() macro on snd_pcm_hw_params.
> The structures have been modified over time and snd_soc_dpcm does
> not have snd_pcm_hw_params as a reference but as a copy.
> This causes the current driver to crash when used.
> This patch changes the way snd_soc_dpcm is extracted.
> The snd_soc_pcm_runtime holds 2 dpcm
> instances (one for playback and one for capture).
> The 2 codecs on this SSP are dmic and speakers.
> One is for capture and one is for playback respectively.
> Based on the direction of the stream,
> the snd_soc_dpcm is extracted from the snd_soc_pcm_runtime structure.
> Tested for all use cases of the driver.

Maybe reformat a bit and add newlines, this is difficult to read.

> Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
> Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
> Tested-by: Lukasz Majczak <lma@semihalf.com>

> diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> index 584e4f9cedc2..9f4b949cc39c 100644
> --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> @@ -379,22 +379,42 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
>   	struct snd_interval *chan = hw_param_interval(params,
>   			SNDRV_PCM_HW_PARAM_CHANNELS);
>   	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
> -	struct snd_soc_dpcm *dpcm = container_of(
> -			params, struct snd_soc_dpcm, hw_params);
> -	struct snd_soc_dai_link *fe_dai_link = dpcm->fe->dai_link;
> -	struct snd_soc_dai_link *be_dai_link = dpcm->be->dai_link;
> +	struct snd_soc_dpcm *dpcm, *rtd_dpcm = NULL;

The idea of initializing was also to test before dereferencing this 
pointer. Without the test, this is somewhat useless, tools may still 
complain about dereferencing a NULL pointer?

> +
> +	/*
> +	 * The following loop will be called only for playback stream
> +	 * In this platform, there is only one playback device on every SSP
> +	 */
> +	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_PLAYBACK, dpcm) {
> +		rtd_dpcm = dpcm;
> +		break;
> +	}
> +
> +	/*
> +	 * This following loop will be called only for capture stream
> +	 * In this platform, there is only one capture device on every SSP
> +	 */
> +	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_CAPTURE, dpcm) {
> +		rtd_dpcm = dpcm;
> +		break;
> +	}

add if (!rtd_dpcm) return -EINVAL here?

> +	/*
> +	 * The above 2 loops are mutually exclusive based on the strem direction,

typo: stream

> +	 * thus rtd_dpcm variable will never be overwritten
> +	 */

