Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D7D15D996
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 15:33:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3D4F1673;
	Fri, 14 Feb 2020 15:33:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3D4F1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581690837;
	bh=cM9aGdDpwj0q2CBGi4fpbdS3I/XFK/KZkGDPMLfzQao=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kg1iL5fDYvBB6SAfCKJ0SwYrJxSlFzX+I04DEo3ETEUcYj0Ks9R9+uXHxLIKvreNW
	 g4ZL0R74vcaiNbL440OFTLwltbE2YYvc0XA5DocuibwvIeJRjWGL+Vsak0r4/BNcdT
	 tyE/t1RXCbDl92UVOrL2uAWCyocrVEf5SVikPoUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDE15F8013E;
	Fri, 14 Feb 2020 15:32:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBC5EF8014F; Fri, 14 Feb 2020 15:32:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D949F800F0
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 15:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D949F800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 06:32:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,440,1574150400"; d="scan'208";a="234470252"
Received: from fenghao1-mobl.amr.corp.intel.com (HELO [10.252.128.190])
 ([10.252.128.190])
 by orsmga003.jf.intel.com with ESMTP; 14 Feb 2020 06:32:02 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87sgjdzyk4.wl-kuninori.morimoto.gx@renesas.com>
 <87eeuxzyi8.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b6d8a1f0-d918-2e85-a603-820c0cd9603e@linux.intel.com>
Date: Fri, 14 Feb 2020 08:32:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87eeuxzyi8.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 10/10] ASoC: soc.h: add
 for_each_pcm_streams()
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



On 2/13/20 8:36 PM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> ALSA SoC has SNDRV_PCM_STREAM_PLAYBACK/CAPTURE everywhere.
> Having for_each_xxxx macro is useful.
> This patch adds for_each_pcm_streams() for it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 
> 	- macro is implemented at sound/pcm.h
> 	- care more files
> 
>   include/sound/pcm.h                   |  5 ++
>   sound/soc/dwc/dwc-i2s.c               |  8 +--
>   sound/soc/fsl/fsl_asrc_dma.c          |  4 +-
>   sound/soc/qcom/lpass-platform.c       |  2 +-
>   sound/soc/soc-core.c                  | 31 ++++-----
>   sound/soc/soc-generic-dmaengine-pcm.c |  8 +--
>   sound/soc/soc-pcm.c                   | 97 ++++++++++-----------------
>   sound/soc/sof/sof-audio.c             | 19 ++----
>   sound/usb/usx2y/usbusx2yaudio.c       |  9 +--

Morimoto-san, could you split this last patch in core changes and then 
one patch for each hardware?

It's not fun for people doing backports to deal with completely 
unrelated platforms. If we have one patch per hardware, then it's much 
easier to avoid conflicts and it helps minimize the number of patches to 
be maintained.

Thank you!

>   9 files changed, 75 insertions(+), 108 deletions(-)
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index f657ff08f317..2628246b76fa 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -644,6 +644,11 @@ void snd_pcm_stream_unlock_irqrestore(struct snd_pcm_substream *substream,
>   #define snd_pcm_group_for_each_entry(s, substream) \
>   	list_for_each_entry(s, &substream->group->substreams, link_list)
>   
> +#define for_each_pcm_streams(stream)			\
> +	for (stream  = SNDRV_PCM_STREAM_PLAYBACK;	\
> +	     stream <= SNDRV_PCM_STREAM_LAST;		\
> +	     stream++)
> +
>   /**
>    * snd_pcm_running - Check whether the substream is in a running state
>    * @substream: substream to check
> diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
> index a8bff6f08a69..515f88456dbd 100644
> --- a/sound/soc/dwc/dwc-i2s.c
> +++ b/sound/soc/dwc/dwc-i2s.c
> @@ -422,15 +422,15 @@ static int dw_i2s_resume(struct snd_soc_component *component)
>   {
>   	struct dw_i2s_dev *dev = snd_soc_component_get_drvdata(component);
>   	struct snd_soc_dai *dai;
> +	int stream;
>   
>   	if (dev->capability & DW_I2S_MASTER)
>   		clk_enable(dev->clk);
>   
>   	for_each_component_dais(component, dai) {
> -		if (dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK])
> -			dw_i2s_config(dev, SNDRV_PCM_STREAM_PLAYBACK);
> -		if (dai->stream_active[SNDRV_PCM_STREAM_CAPTURE])
> -			dw_i2s_config(dev, SNDRV_PCM_STREAM_CAPTURE);
> +		for_each_pcm_streams(stream)
> +			if (dai->stream_active[stream])
> +				dw_i2s_config(dev, stream);
>   	}
>   
>   	return 0;
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index ece130f59d15..44e5924be870 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -400,7 +400,7 @@ static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
>   		return ret;
>   	}
>   
> -	for (i = SNDRV_PCM_STREAM_PLAYBACK; i <= SNDRV_PCM_STREAM_LAST; i++) {
> +	for_each_pcm_streams(i) {
>   		substream = pcm->streams[i].substream;
>   		if (!substream)
>   			continue;
> @@ -428,7 +428,7 @@ static void fsl_asrc_dma_pcm_free(struct snd_soc_component *component,
>   	struct snd_pcm_substream *substream;
>   	int i;
>   
> -	for (i = SNDRV_PCM_STREAM_PLAYBACK; i <= SNDRV_PCM_STREAM_LAST; i++) {
> +	for_each_pcm_streams(i) {
>   		substream = pcm->streams[i].substream;
>   		if (!substream)
>   			continue;
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index b05091c283b7..5d1bc5757169 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -529,7 +529,7 @@ static void lpass_platform_pcm_free(struct snd_soc_component *component,
>   	struct snd_pcm_substream *substream;
>   	int i;
>   
> -	for (i = 0; i < ARRAY_SIZE(pcm->streams); i++) {
> +	for_each_pcm_streams(i) {
>   		substream = pcm->streams[i].substream;
>   		if (substream) {
>   			snd_dma_free_pages(&substream->dma_buffer);
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 13df3175e184..6f3fc22e0562 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -432,6 +432,7 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
>   	struct snd_soc_component *component;
>   	struct device *dev;
>   	int ret;
> +	int stream;
>   
>   	/*
>   	 * for rtd->dev
> @@ -466,10 +467,10 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
>   
>   	rtd->dev = dev;
>   	INIT_LIST_HEAD(&rtd->list);
> -	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].be_clients);
> -	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
> -	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
> -	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].fe_clients);
> +	for_each_pcm_streams(stream) {
> +		INIT_LIST_HEAD(&rtd->dpcm[stream].be_clients);
> +		INIT_LIST_HEAD(&rtd->dpcm[stream].fe_clients);
> +	}
>   	dev_set_drvdata(dev, rtd);
>   	INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
>   
> @@ -559,17 +560,14 @@ int snd_soc_suspend(struct device *dev)
>   	snd_soc_flush_all_delayed_work(card);
>   
>   	for_each_card_rtds(card, rtd) {
> +		int stream;
>   
>   		if (rtd->dai_link->ignore_suspend)
>   			continue;
>   
> -		snd_soc_dapm_stream_event(rtd,
> -					  SNDRV_PCM_STREAM_PLAYBACK,
> -					  SND_SOC_DAPM_STREAM_SUSPEND);
> -
> -		snd_soc_dapm_stream_event(rtd,
> -					  SNDRV_PCM_STREAM_CAPTURE,
> -					  SND_SOC_DAPM_STREAM_SUSPEND);
> +		for_each_pcm_streams(stream)
> +			snd_soc_dapm_stream_event(rtd, stream,
> +						  SND_SOC_DAPM_STREAM_SUSPEND);
>   	}
>   
>   	/* Recheck all endpoints too, their state is affected by suspend */
> @@ -665,17 +663,14 @@ static void soc_resume_deferred(struct work_struct *work)
>   	}
>   
>   	for_each_card_rtds(card, rtd) {
> +		int stream;
>   
>   		if (rtd->dai_link->ignore_suspend)
>   			continue;
>   
> -		snd_soc_dapm_stream_event(rtd,
> -					  SNDRV_PCM_STREAM_PLAYBACK,
> -					  SND_SOC_DAPM_STREAM_RESUME);
> -
> -		snd_soc_dapm_stream_event(rtd,
> -					  SNDRV_PCM_STREAM_CAPTURE,
> -					  SND_SOC_DAPM_STREAM_RESUME);
> +		for_each_pcm_streams(stream)
> +			snd_soc_dapm_stream_event(rtd, stream,
> +						  SND_SOC_DAPM_STREAM_RESUME);
>   	}
>   
>   	/* unmute any active DACs */
> diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> index 2cc25651661c..d6b4831e8aec 100644
> --- a/sound/soc/soc-generic-dmaengine-pcm.c
> +++ b/sound/soc/soc-generic-dmaengine-pcm.c
> @@ -237,7 +237,7 @@ static int dmaengine_pcm_new(struct snd_soc_component *component,
>   		max_buffer_size = SIZE_MAX;
>   	}
>   
> -	for (i = SNDRV_PCM_STREAM_PLAYBACK; i <= SNDRV_PCM_STREAM_CAPTURE; i++) {
> +	for_each_pcm_streams(i) {
>   		substream = rtd->pcm->streams[i].substream;
>   		if (!substream)
>   			continue;
> @@ -371,8 +371,7 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
>   		dev = config->dma_dev;
>   	}
>   
> -	for (i = SNDRV_PCM_STREAM_PLAYBACK; i <= SNDRV_PCM_STREAM_CAPTURE;
> -	     i++) {
> +	for_each_pcm_streams(i) {
>   		if (pcm->flags & SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX)
>   			name = "rx-tx";
>   		else
> @@ -401,8 +400,7 @@ static void dmaengine_pcm_release_chan(struct dmaengine_pcm *pcm)
>   {
>   	unsigned int i;
>   
> -	for (i = SNDRV_PCM_STREAM_PLAYBACK; i <= SNDRV_PCM_STREAM_CAPTURE;
> -	     i++) {
> +	for_each_pcm_streams(i) {
>   		if (!pcm->chan[i])
>   			continue;
>   		dma_release_channel(pcm->chan[i]);
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index bbecf8f5f4b9..d69b53e21a18 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2612,6 +2612,7 @@ static int dpcm_run_old_update(struct snd_soc_pcm_runtime *fe, int stream)
>   static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
>   {
>   	struct snd_soc_dapm_widget_list *list;
> +	int stream;
>   	int count, paths;
>   
>   	if (!fe->dai_link->dynamic)
> @@ -2625,69 +2626,42 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
>   	dev_dbg(fe->dev, "ASoC: DPCM %s runtime update for FE %s\n",
>   		new ? "new" : "old", fe->dai_link->name);
>   
> -	/* skip if FE doesn't have playback capability */
> -	if (!snd_soc_dai_stream_valid(fe->cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK) ||
> -	    !snd_soc_dai_stream_valid(fe->codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
> -		goto capture;
> -
> -	/* skip if FE isn't currently playing */
> -	if (!fe->cpu_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK] ||
> -	    !fe->codec_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK])
> -		goto capture;
> -
> -	paths = dpcm_path_get(fe, SNDRV_PCM_STREAM_PLAYBACK, &list);
> -	if (paths < 0) {
> -		dev_warn(fe->dev, "ASoC: %s no valid %s path\n",
> -			 fe->dai_link->name,  "playback");
> -		return paths;
> -	}
> -
> -	/* update any playback paths */
> -	count = dpcm_process_paths(fe, SNDRV_PCM_STREAM_PLAYBACK, &list, new);
> -	if (count) {
> -		if (new)
> -			dpcm_run_new_update(fe, SNDRV_PCM_STREAM_PLAYBACK);
> -		else
> -			dpcm_run_old_update(fe, SNDRV_PCM_STREAM_PLAYBACK);
> +	for_each_pcm_streams(stream) {
>   
> -		dpcm_clear_pending_state(fe, SNDRV_PCM_STREAM_PLAYBACK);
> -		dpcm_be_disconnect(fe, SNDRV_PCM_STREAM_PLAYBACK);
> -	}
> -
> -	dpcm_path_put(&list);
> +		/* skip if FE doesn't have playback/capture capability */
> +		if (!snd_soc_dai_stream_valid(fe->cpu_dai,   stream) ||
> +		    !snd_soc_dai_stream_valid(fe->codec_dai, stream))
> +			continue;
>   
> -capture:
> -	/* skip if FE doesn't have capture capability */
> -	if (!snd_soc_dai_stream_valid(fe->cpu_dai,   SNDRV_PCM_STREAM_CAPTURE) ||
> -	    !snd_soc_dai_stream_valid(fe->codec_dai, SNDRV_PCM_STREAM_CAPTURE))
> -		return 0;
> +		/* skip if FE isn't currently playing/capturing */
> +		if (!fe->cpu_dai->stream_active[stream] ||
> +		    !fe->codec_dai->stream_active[stream])
> +			continue;
>   
> -	/* skip if FE isn't currently capturing */
> -	if (!fe->cpu_dai->stream_active[SNDRV_PCM_STREAM_CAPTURE] ||
> -	    !fe->codec_dai->stream_active[SNDRV_PCM_STREAM_CAPTURE])
> -		return 0;
> +		paths = dpcm_path_get(fe, stream, &list);
> +		if (paths < 0) {
> +			dev_warn(fe->dev, "ASoC: %s no valid %s path\n",
> +				 fe->dai_link->name,
> +				 stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				 "playback" : "capture");
> +			return paths;
> +		}
>   
> -	paths = dpcm_path_get(fe, SNDRV_PCM_STREAM_CAPTURE, &list);
> -	if (paths < 0) {
> -		dev_warn(fe->dev, "ASoC: %s no valid %s path\n",
> -			 fe->dai_link->name,  "capture");
> -		return paths;
> -	}
> +		/* update any playback/capture paths */
> +		count = dpcm_process_paths(fe, stream, &list, new);
> +		if (count) {
> +			if (new)
> +				dpcm_run_new_update(fe, stream);
> +			else
> +				dpcm_run_old_update(fe, stream);
>   
> -	/* update any old capture paths */
> -	count = dpcm_process_paths(fe, SNDRV_PCM_STREAM_CAPTURE, &list, new);
> -	if (count) {
> -		if (new)
> -			dpcm_run_new_update(fe, SNDRV_PCM_STREAM_CAPTURE);
> -		else
> -			dpcm_run_old_update(fe, SNDRV_PCM_STREAM_CAPTURE);
> +			dpcm_clear_pending_state(fe, stream);
> +			dpcm_be_disconnect(fe, stream);
> +		}
>   
> -		dpcm_clear_pending_state(fe, SNDRV_PCM_STREAM_CAPTURE);
> -		dpcm_be_disconnect(fe, SNDRV_PCM_STREAM_CAPTURE);
> +		dpcm_path_put(&list);
>   	}
>   
> -	dpcm_path_put(&list);
> -
>   	return 0;
>   }
>   
> @@ -3117,19 +3091,18 @@ static ssize_t dpcm_state_read_file(struct file *file, char __user *user_buf,
>   {
>   	struct snd_soc_pcm_runtime *fe = file->private_data;
>   	ssize_t out_count = PAGE_SIZE, offset = 0, ret = 0;
> +	int stream;
>   	char *buf;
>   
>   	buf = kmalloc(out_count, GFP_KERNEL);
>   	if (!buf)
>   		return -ENOMEM;
>   
> -	if (snd_soc_dai_stream_valid(fe->cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
> -		offset += dpcm_show_state(fe, SNDRV_PCM_STREAM_PLAYBACK,
> -					buf + offset, out_count - offset);
> -
> -	if (snd_soc_dai_stream_valid(fe->cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
> -		offset += dpcm_show_state(fe, SNDRV_PCM_STREAM_CAPTURE,
> -					buf + offset, out_count - offset);
> +	for_each_pcm_streams(stream)
> +		if (snd_soc_dai_stream_valid(fe->cpu_dai, stream))
> +			offset += dpcm_show_state(fe, stream,
> +						  buf + offset,
> +						  out_count - offset);
>   
>   	ret = simple_read_from_buffer(user_buf, count, ppos, buf, offset);
>   
> diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
> index 75f2ef2bd94b..fc4ed2a8a914 100644
> --- a/sound/soc/sof/sof-audio.c
> +++ b/sound/soc/sof/sof-audio.c
> @@ -23,7 +23,7 @@ bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev)
>   	int dir;
>   
>   	list_for_each_entry(spcm, &sdev->pcm_list, list) {
> -		for (dir = 0; dir <= SNDRV_PCM_STREAM_CAPTURE; dir++) {
> +		for_each_pcm_streams(dir) {
>   			substream = spcm->stream[dir].substream;
>   			if (!substream || !substream->runtime)
>   				continue;
> @@ -71,7 +71,7 @@ int sof_set_hw_params_upon_resume(struct device *dev)
>   	 * have been suspended.
>   	 */
>   	list_for_each_entry(spcm, &sdev->pcm_list, list) {
> -		for (dir = 0; dir <= SNDRV_PCM_STREAM_CAPTURE; dir++) {
> +		for_each_pcm_streams(dir) {
>   			/*
>   			 * do not reset hw_params upon resume for streams that
>   			 * were kept running during suspend
> @@ -319,16 +319,11 @@ struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_soc_component *scomp,
>   	int dir;
>   
>   	list_for_each_entry(spcm, &sdev->pcm_list, list) {
> -		dir = SNDRV_PCM_STREAM_PLAYBACK;
> -		if (spcm->stream[dir].comp_id == comp_id) {
> -			*direction = dir;
> -			return spcm;
> -		}
> -
> -		dir = SNDRV_PCM_STREAM_CAPTURE;
> -		if (spcm->stream[dir].comp_id == comp_id) {
> -			*direction = dir;
> -			return spcm;
> +		for_each_pcm_streams(dir) {
> +			if (spcm->stream[dir].comp_id == comp_id) {
> +				*direction = dir;
> +				return spcm;
> +			}
>   		}
>   	}
>   
> diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
> index 772f6f3ccbb1..37d290fe9d43 100644
> --- a/sound/usb/usx2y/usbusx2yaudio.c
> +++ b/sound/usb/usx2y/usbusx2yaudio.c
> @@ -906,11 +906,12 @@ static const struct snd_pcm_ops snd_usX2Y_pcm_ops =
>    */
>   static void usX2Y_audio_stream_free(struct snd_usX2Y_substream **usX2Y_substream)
>   {
> -	kfree(usX2Y_substream[SNDRV_PCM_STREAM_PLAYBACK]);
> -	usX2Y_substream[SNDRV_PCM_STREAM_PLAYBACK] = NULL;
> +	int stream;
>   
> -	kfree(usX2Y_substream[SNDRV_PCM_STREAM_CAPTURE]);
> -	usX2Y_substream[SNDRV_PCM_STREAM_CAPTURE] = NULL;
> +	for_each_pcm_streams(stream) {
> +		kfree(usX2Y_substream[stream]);
> +		usX2Y_substream[stream] = NULL;
> +	}
>   }
>   
>   static void snd_usX2Y_pcm_private_free(struct snd_pcm *pcm)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
