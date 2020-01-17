Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B64A41408E8
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 12:30:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9ED017E9;
	Fri, 17 Jan 2020 12:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9ED017E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579260636;
	bh=6WBMYZk5hER8P1zNB5MSxqSWD431n2uk45aoMUw5EXg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KClDiL3Rwd+W9lljYuSvjrBbkbpAKjkbZj0VKNZMVNZPOCjZjwXJohnRCcargcjN8
	 f6OjDldeiw+oEnvobq5zSzE8bvnUDDwfnUugHDpATUBKT2+0h6ZM96p94M4OhoQrnY
	 l5snDP1aLFtx5uk3D6DyGh2T9Y12BSkPiHDvFANo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E289F80086;
	Fri, 17 Jan 2020 12:28:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDCA6F8021D; Fri, 17 Jan 2020 12:28:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5886FF80086
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 12:28:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5886FF80086
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 03:28:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; d="scan'208";a="257769902"
Received: from kaiwenhs-mobl.amr.corp.intel.com (HELO [10.251.11.205])
 ([10.251.11.205])
 by fmsmga002.fm.intel.com with ESMTP; 17 Jan 2020 03:28:31 -0800
To: Bard liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org,
 tiwai@suse.de
References: <20200116202620.7401-1-yung-chuan.liao@linux.intel.com>
 <20200116202620.7401-3-yung-chuan.liao@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <609dd6ae-fa05-50c8-bd3a-acd5bad2618a@linux.intel.com>
Date: Fri, 17 Jan 2020 05:10:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116202620.7401-3-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, kuninori.morimoto.gx@renesas.com
Subject: Re: [alsa-devel] [PATCH RFC v3 2/4] ASoC: Add multiple CPU DAI
 support for PCM ops
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

I noticed a couple of code changes, we should probably do a code 
refactor first and add those changes, then add the multi-cpu support.

> @@ -892,10 +979,17 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
>   component_err:
>   	soc_pcm_components_hw_free(substream, component);
>   
> -	snd_soc_dai_hw_free(cpu_dai, substream);
> -	cpu_dai->rate = 0;
> +	i = rtd->num_cpus;
>   
>   interface_err:
> +	for_each_rtd_cpu_dai_rollback(rtd, i, cpu_dai) {
> +		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
> +			continue;

maybe this check should be added to the existing code before adding 
multi-cpu support? it looks copy/pasted from the codec case, but is it a 
miss in the existing code?

> +
> +		snd_soc_dai_hw_free(cpu_dai, substream);
> +		cpu_dai->rate = 0;
> +	}
> +

[...]

> @@ -965,7 +1062,12 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
>   		snd_soc_dai_hw_free(codec_dai, substream);
>   	}
>   
> -	snd_soc_dai_hw_free(cpu_dai, substream);
> +	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
> +		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
> +			continue;
> +
> +		snd_soc_dai_hw_free(cpu_dai, substream);
> +	}

same here, the hw_free should be first made conditional on the stream 
being valid, before introducing multi-cpu-dai support?


> @@ -1672,18 +1804,32 @@ static void dpcm_runtime_merge_chan(struct snd_pcm_substream *substream,
>   
>   	for_each_dpcm_be(fe, stream, dpcm) {
>   		struct snd_soc_pcm_runtime *be = dpcm->be;
> -		struct snd_soc_dai_driver *cpu_dai_drv =  be->cpu_dai->driver;
> +		struct snd_soc_dai_driver *cpu_dai_drv;
>   		struct snd_soc_dai_driver *codec_dai_drv;
>   		struct snd_soc_pcm_stream *codec_stream;
>   		struct snd_soc_pcm_stream *cpu_stream;
> +		struct snd_soc_dai *dai;
> +		int i;
>   
> -		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
> -			cpu_stream = &cpu_dai_drv->playback;
> -		else
> -			cpu_stream = &cpu_dai_drv->capture;
> +		for_each_rtd_cpu_dai(be, i, dai) {
> +			/*
> +			 * Skip CPUs which don't support the current stream
> +			 * type. See soc_pcm_init_runtime_hw() for more details
> +			 */
> +			if (!snd_soc_dai_stream_valid(dai, stream))
> +				continue;

and here as well, this is a new test that didn't exist before?


> @@ -2847,23 +3012,33 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>   		playback = rtd->dai_link->dpcm_playback;
>   		capture = rtd->dai_link->dpcm_capture;
>   	} else {
> +		int stream_playback;
> +		int stream_capture;
>   		/* Adapt stream for codec2codec links */
> -		struct snd_soc_pcm_stream *cpu_capture = rtd->dai_link->params ?
> -			&cpu_dai->driver->playback : &cpu_dai->driver->capture;
> -		struct snd_soc_pcm_stream *cpu_playback = rtd->dai_link->params ?
> -			&cpu_dai->driver->capture : &cpu_dai->driver->playback;
> +		if (rtd->dai_link->params) {
> +			stream_playback = SNDRV_PCM_STREAM_CAPTURE;
> +			stream_capture  = SNDRV_PCM_STREAM_PLAYBACK;
> +		} else {
> +			stream_playback = SNDRV_PCM_STREAM_PLAYBACK;
> +			stream_capture  = SNDRV_PCM_STREAM_CAPTURE;
> +		}
>   
> -		for_each_rtd_codec_dai(rtd, i, codec_dai) {
> -			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
> -			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))

the logic for this entire block isn't easy to follow, maybe we should 
first move the cpu case out of the codec_dai loop and refactor the code 
before adding the multi-cpu case.

> -				playback = 1;
> -			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
> -			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
> -				capture = 1;
> +		playback = 1;
> +		capture = 1;
> +
> +		for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
> +			if (!snd_soc_dai_stream_valid(cpu_dai, stream_playback))
> +				playback = 0;
> +			if (!snd_soc_dai_stream_valid(cpu_dai, stream_capture))
> +				capture = 0;
>   		}
>   
> -		capture = capture && cpu_capture->channels_min;
> -		playback = playback && cpu_playback->channels_min;

channels_min is no longer used so it's somewhat confusing if the new 
code is iso-functionality?
I'd prefer a code refactor that we can double check, then add the 
cpu_dai loop.

> +		for_each_rtd_codec_dai(rtd, i, codec_dai) {
> +			if (!snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
> +				playback = 0;
> +			if (!snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
> +				capture = 0;
> +		}
>   	}
>   
>   	if (rtd->dai_link->playback_only) {
> @@ -2977,7 +3152,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>   out:
>   	dev_info(rtd->card->dev, "%s <-> %s mapping ok\n",
>   		 (rtd->num_codecs > 1) ? "multicodec" : rtd->codec_dai->name,
> -		 cpu_dai->name);
> +		 (rtd->num_cpus > 1) ? "multicpu" : rtd->cpu_dai->name);
>   	return ret;
>   }
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
