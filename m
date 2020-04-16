Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B38231AD188
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 22:53:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B6FE1662;
	Thu, 16 Apr 2020 22:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B6FE1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587070399;
	bh=79asucDXdhLpbOJ69I296G/1PIqyk/hWN4rcCmdnFTE=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JgbHSFpM/hNR5PFWpIXgw7HsD/d3MFinZXg5b21oUTpnxx7DSJVgnJDLd3UrgPdYf
	 1H8d4CJPIREB6PrB0Irwzmuict7vfDON0NcVXjPC2KOILilFfdvpP4elYzPxr8q2my
	 2qjWvlqtzCHwhGXaMwcDst71ZgwFC/a6+XP5zhFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D06DF80115;
	Thu, 16 Apr 2020 22:51:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3085F8014E; Thu, 16 Apr 2020 22:51:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60C64F8012E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 22:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C64F8012E
IronPort-SDR: FeT+R7CTXwmoW+pSujJn/NV99yUoqo1NAuE/9s6wVd8rIDpvrSKjTGZBpvVdq7Rs6TigRMe7Sv
 df+jAytn0mCw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 13:51:25 -0700
IronPort-SDR: AsoYwv8ry0Y5O13ttEOTJSWzbdmr+B9NzA2oriGRnmNOtPEkUvl2GW1CankfzMeZ4nwXsn6G6d
 X2VrhMiTiLxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,392,1580803200"; d="scan'208";a="242779835"
Received: from atrikali-mobl.amr.corp.intel.com (HELO [10.254.59.97])
 ([10.254.59.97])
 by orsmga007.jf.intel.com with ESMTP; 16 Apr 2020 13:51:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: dpcm: Only allow playback/capture if
 supported
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20200415104928.86091-1-stephan@gerhold.net>
Message-ID: <61ccf27d-a511-b3a4-2da7-56edb01b24c6@linux.intel.com>
Date: Thu, 16 Apr 2020 15:51:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415104928.86091-1-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht
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


> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 454735f8fa92..77a680da366f 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2911,8 +2911,17 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>   	int i;
>   
>   	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
> -		playback = rtd->dai_link->dpcm_playback;
> -		capture = rtd->dai_link->dpcm_capture;
> +		cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +		if (rtd->num_cpus > 1) {
> +			dev_err(rtd->dev,
> +				"DPCM doesn't support Multi CPU yet\n");
> +			return -EINVAL;
> +		}
> +
> +		playback = rtd->dai_link->dpcm_playback &&
> +			   snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK);
> +		capture = rtd->dai_link->dpcm_capture &&
> +			  snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE);

This commit introduces major regressions with SOF on CherryTrail and 
Broadwell:

     [   25.705750]  SSP2-Codec: ASoC: no backend playback stream
     [   27.923378]  SSP2-Codec: ASoC: no users playback at close - state

it's likely due to the check for min_channels > 0 in 
snd_soc_dai_stream_valid(), which wasn't a requirement before.

We are testing a fix [1] but other users of DPCM might be impacted.

Mark, this commit is on your for-5.7 branch but not on for-next? Not 
sure which SHA1 to use for the Fixes: tag

[1] 
https://github.com/thesofproject/linux/pull/2018/commits/4fa10638dca8aad7a320e85cc3e00b179b8de410
