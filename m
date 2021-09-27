Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4E6419F98
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 21:55:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E8D716AE;
	Mon, 27 Sep 2021 21:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E8D716AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632772527;
	bh=2LOLwXwHsq2GiJ+fXO0EYkTA8hojPPI3+1LvdtlIzkw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CO4rZfhd8Euo8+An634vExXIqHJTB21U7MyADlWhjXL2qmedh7qXYx2rDIOPdD2O5
	 GdyztKOgkkdO4ftXKr/3qAIM+c0WmrElJXrpW47siNGsunWsYH+KsFpuJStxWkI8Wq
	 /hL7z3f6KqRtUMhd+GaGqPwWmrSxSPvmLTNDp00I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30067F804E6;
	Mon, 27 Sep 2021 21:53:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAC69F804E2; Mon, 27 Sep 2021 21:53:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40BAEF8026D
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 21:53:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40BAEF8026D
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="211802387"
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="211802387"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 12:52:59 -0700
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="486268028"
Received: from asen4-mobl2.amr.corp.intel.com (HELO [10.212.27.2])
 ([10.212.27.2])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 12:52:56 -0700
Subject: Re: [PATCH v8 19/22] ASoC: qdsp6: audioreach: add q6apm-dai support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
 <20210927135559.738-20-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20605122-e6b4-1b5f-003a-96a74306f984@linux.intel.com>
Date: Mon, 27 Sep 2021 11:25:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927135559.738-20-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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


> +static int q6apm_dai_prepare(struct snd_soc_component *component,
> +			     struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct q6apm_dai_rtd *prtd = runtime->private_data;
> +	struct audioreach_module_config cfg;
> +	struct device *dev = component->dev;
> +	struct q6apm_dai_data *pdata;
> +	int ret;
> +
> +	pdata = snd_soc_component_get_drvdata(component);
> +	if (!pdata)
> +		return -EINVAL;
> +
> +	if (!prtd || !prtd->graph) {
> +		dev_err(dev, "%s: private data null or audio client freed\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	cfg.direction = substream->stream;
> +	cfg.sample_rate = runtime->rate;
> +	cfg.num_channels = runtime->channels;
> +	cfg.bit_width = prtd->bits_per_sample;
> +
> +	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
> +	prtd->pos = 0;
> +	/* rate and channels are sent to audio driver */
> +	ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
> +	if (ret < 0) {
> +		dev_err(dev, "%s: q6apm_open_write failed\n", __func__);
> +		return ret;
> +	}
> +
> +	ret = q6apm_graph_media_format_pcm(prtd->graph, &cfg);
> +	if (ret < 0)
> +		dev_err(dev, "%s: CMD Format block failed\n", __func__);
> +
> +	ret = q6apm_map_memory_regions(prtd->graph, substream->stream, prtd->phys,
> +				       (prtd->pcm_size / prtd->periods), prtd->periods);
> +
> +	if (ret < 0) {
> +		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
> +		return -ENOMEM;
> +	}
> +
> +	ret = q6apm_graph_prepare(prtd->graph);
> +	if (ret) {
> +		dev_err(dev, "Failed to prepare Graph %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = q6apm_graph_start(prtd->graph);
> +	if (ret) {
> +		dev_err(dev, "Failed to Start Graph %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> +		int i;
> +		/* Queue the buffers for Capture ONLY after graph is started */
> +		for (i = 0; i < runtime->periods; i++)
> +			q6apm_read(prtd->graph);
> +
> +	}
> +
> +	prtd->state = Q6APM_STREAM_RUNNING;

you should probably explain why a stream moves to the 'RUNNING' state in
a .prepare() callback, instead of TRIGGER_START?

> +
> +	return 0;
> +}
> +
> +static int q6apm_dai_trigger(struct snd_soc_component *component,
> +			     struct snd_pcm_substream *substream, int cmd)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct q6apm_dai_rtd *prtd = runtime->private_data;
> +	int ret = 0;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		 /* start writing buffers for playback only as we already queued capture buffers */
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +		/* TODO support be handled via SoftPause Module */
> +		prtd->state = Q6APM_STREAM_STOPPED;
> +		break;
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}

