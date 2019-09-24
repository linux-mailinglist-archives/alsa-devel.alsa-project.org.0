Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B2BC9D3
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 16:09:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85C5016A5;
	Tue, 24 Sep 2019 16:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85C5016A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569334179;
	bh=T3uhN0PJlxDOJs+H/DJgFrykd7KPCe+cX7yB7aOHqK0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ut43BleoNsv9FQhSf44AC/TSozF3pTp1d1+3UiGHfPi0QchQFBGqxCAyjWIfj6Fvk
	 X/D9zqvO2AeV2bTvOwXJ3SEYjK+gnpgCX30hZVsO81Pc16ErdgfdheTcMhew8jF25m
	 4e6MB0z7ThXFEP2+3LmxolezvlYhS7rY+xaDBHfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7EDCF80533;
	Tue, 24 Sep 2019 16:07:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD0C4F8045F; Tue, 24 Sep 2019 16:07:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D14F6F800B4
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 16:07:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D14F6F800B4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 07:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,544,1559545200"; d="scan'208";a="195704658"
Received: from kmohamme-mobl.amr.corp.intel.com (HELO [10.254.185.205])
 ([10.254.185.205])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Sep 2019 07:07:45 -0700
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, broonie@kernel.org,
 lgirdwood@gmail.com
References: <20190924114146.8116-1-peter.ujfalusi@ti.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ca102437-80e2-9e17-c40e-c50f2ac8e6d5@linux.intel.com>
Date: Tue, 24 Sep 2019 09:07:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924114146.8116-1-peter.ujfalusi@ti.com>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com
Subject: Re: [alsa-devel] [RFC] ASoC: soc-pcm: Use different sequence for
 start/stop trigger
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



On 9/24/19 6:41 AM, Peter Ujfalusi wrote:
> On stream stop currently we stop the DMA first followed by the CPU DAI.
> This can cause underflow (playback) or overflow (capture) on the DAI side
> as the DMA is no longer feeding data while the DAI is still active.
> It can be observed easily if the DAI side does not have FIFO (or it is
> disabled) to survive the time while the DMA is stopped, but still can
> happen on relatively slow CPUs when relatively high sampling rate is used:
> the FIFO is drained between the time the DMA is stopped and the DAI is
> stopped.
> 
> It can only fixed by using different sequence within trigger for 'stop' and
> 'start':
> case SNDRV_PCM_TRIGGER_START:
> case SNDRV_PCM_TRIGGER_RESUME:
> case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> 	Start DMA first followed by CPU DAI (currently used sequence)
> 
> case SNDRV_PCM_TRIGGER_STOP:
> case SNDRV_PCM_TRIGGER_SUSPEND:
> case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> 	Stop CPU DAI first followed by DMA
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> Hi,
> 
> on a new TI platform (j721e) where we can disable the McASP FIFO (the CPU dai)
> since the UDMA + PDMA provides the buffering I have started to see error
> interrupts right after pcm_trigger:STOP and in rare cases even on PAUSE that
> McASP underruns.
> I was also able to reproduce the same issue on am335x board, but it is much
> harder to trigger it.
> 
> With this patch the underrun after trigger:STOP is gone.
> 
> If I think about the issue, I'm not sure why it was not noticed before as the
> behavior makes sense:
> we stop the DMA first then we stop the CPU DAI. If between the DMA stop and DAI
> stop we would need a sample in the DAI (which is still running) then for sure we
> will underrun in the HW (or overrun in case of capture).
> 
> When I run the ALSA conformance test [1] it is easier to trigger.
> 
> Not sure if anyone else have seen such underrun/overrun when stopping a stream,
> but the fact that I have seen it with both UDMA+PDMA and EDMA on different
> platforms makes me wonder if the issue can be seen on other platforms as well.
> 
> [1] https://chromium.googlesource.com/chromiumos/platform/audiotest/+/master/alsa_conformance_test.md

This is interesting, we had a similar issue for SOF on HDaudio platforms 
with underruns on stop [1], which we fixed 'locally' with a change 
between IPC and DMA stop.

I'll ask our CI/QA folks to check if this patch improves the results 
further.

[1] https://github.com/thesofproject/linux/pull/1169/commits

> 
> Regards,
> Peter
> ---
>   sound/soc/soc-pcm.c | 66 ++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 62 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index e163dde5eab1..c96430e70752 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1047,7 +1047,7 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
>   	return 0;
>   }
>   
> -static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
> +static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
>   {
>   	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>   	struct snd_soc_component *component;
> @@ -1056,24 +1056,60 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>   	struct snd_soc_dai *codec_dai;
>   	int i, ret;
>   
> +	for_each_rtdcom(rtd, rtdcom) {
> +		component = rtdcom->component;
> +
> +		ret = snd_soc_component_trigger(component, substream, cmd);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>   	for_each_rtd_codec_dai(rtd, i, codec_dai) {
>   		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
>   		if (ret < 0)
>   			return ret;
>   	}
>   
> -	for_each_rtdcom(rtd, rtdcom) {
> -		component = rtdcom->component;
> +	snd_soc_dai_trigger(cpu_dai, substream, cmd);
> +	if (ret < 0)
> +		return ret;
>   
> -		ret = snd_soc_component_trigger(component, substream, cmd);
> +	if (rtd->dai_link->ops->trigger) {
> +		ret = rtd->dai_link->ops->trigger(substream, cmd);
>   		if (ret < 0)
>   			return ret;
>   	}
>   
> +	return 0;
> +}
> +
> +static int soc_pcm_trigger_stop(struct snd_pcm_substream *substream, int cmd)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_component *component;
> +	struct snd_soc_rtdcom_list *rtdcom;
> +	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
> +	struct snd_soc_dai *codec_dai;
> +	int i, ret;
> +
>   	snd_soc_dai_trigger(cpu_dai, substream, cmd);
>   	if (ret < 0)
>   		return ret;
>   
> +	for_each_rtd_codec_dai(rtd, i, codec_dai) {
> +		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	for_each_rtdcom(rtd, rtdcom) {
> +		component = rtdcom->component;
> +
> +		ret = snd_soc_component_trigger(component, substream, cmd);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>   	if (rtd->dai_link->ops->trigger) {
>   		ret = rtd->dai_link->ops->trigger(substream, cmd);
>   		if (ret < 0)
> @@ -1083,6 +1119,28 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>   	return 0;
>   }
>   
> +static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
> +{
> +	int ret;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		ret = soc_pcm_trigger_start(substream, cmd);
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		ret = soc_pcm_trigger_stop(substream, cmd);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
>   static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
>   				   int cmd)
>   {
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
