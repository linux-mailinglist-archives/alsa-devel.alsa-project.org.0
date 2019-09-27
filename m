Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C318FC09B6
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 18:40:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E109166F;
	Fri, 27 Sep 2019 18:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E109166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569602404;
	bh=TCzNl5+PwfHMnpF5UVkz5YHXPCYXJcJ5afAIKCO79V4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FNsRLmUOClWgIfP/OYzhRs6UFDw94rXCHxqN5fUXSff1pk2jk0ts2SHQjPPlufr+2
	 yNW88bOgCRhozRIlZ6wgcRm7WgV+EvksZUMPDHHvRN2FaECs2jOuh+LRQS6jvDi2YK
	 RoTbLoufTTKAQvw0wjcG5yAbGwpGyFarBONVobyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FAF8F80535;
	Fri, 27 Sep 2019 18:38:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEB63F805A8; Fri, 27 Sep 2019 18:38:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0448F80508
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 18:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0448F80508
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 09:38:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,556,1559545200"; d="scan'208";a="193286234"
Received: from sanyamba-mobl.amr.corp.intel.com (HELO [10.254.4.17])
 ([10.254.4.17])
 by orsmga003.jf.intel.com with ESMTP; 27 Sep 2019 09:38:01 -0700
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, broonie@kernel.org,
 lgirdwood@gmail.com
References: <20190927071646.22319-1-peter.ujfalusi@ti.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <70954c83-282b-802f-848d-1b86c248ee87@linux.intel.com>
Date: Fri, 27 Sep 2019 11:29:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927071646.22319-1-peter.ujfalusi@ti.com>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com
Subject: Re: [alsa-devel] [PATCH v2] ASoC: soc-pcm: Use different sequence
 for start/stop trigger
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



On 9/27/19 2:16 AM, Peter Ujfalusi wrote:
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
> 	Trigger order: dai_link, DMA, CPU DAI then the codec
> 
> case SNDRV_PCM_TRIGGER_STOP:
> case SNDRV_PCM_TRIGGER_SUSPEND:
> case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> 	Trigger order: codec, CPU DAI, DMA then dai_link
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

This patch was tested by the Intel SOF QA folks, and we don't see any 
errors added by this sequence change (more precisely we see the usual 
random IPC timeouts we are chasing but nothing new clearly caused by 
this patch). And the change makes sense so

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> Hi,
> 
> Changes since v1:
> - Rebased on top 'ASoC: soc-component: fix a couple missing error assignments'
> 
> Changes since rfc:
> - Fixed missing error assignments (copy pasted the error)
> - Document the trigger order in the commit message
> 
> Regards,
> Peter
> 
>   sound/soc/soc-pcm.c | 64 ++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 61 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index a1b99ac57d9e..66910500e3b6 100644
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
> @@ -1056,8 +1056,8 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>   	struct snd_soc_dai *codec_dai;
>   	int i, ret;
>   
> -	for_each_rtd_codec_dai(rtd, i, codec_dai) {
> -		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
> +	if (rtd->dai_link->ops->trigger) {
> +		ret = rtd->dai_link->ops->trigger(substream, cmd);
>   		if (ret < 0)
>   			return ret;
>   	}
> @@ -1074,6 +1074,42 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>   	if (ret < 0)
>   		return ret;
>   
> +	for_each_rtd_codec_dai(rtd, i, codec_dai) {
> +		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
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
> +	for_each_rtd_codec_dai(rtd, i, codec_dai) {
> +		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
> +	if (ret < 0)
> +		return ret;
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
