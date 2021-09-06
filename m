Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EB8401EA4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Sep 2021 18:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 997281750;
	Mon,  6 Sep 2021 18:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 997281750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630946657;
	bh=zCk/zZpnZEqA960SwgsciyJFp39tsoNxm+xmlKSM7t8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N8nv41XqORGCH+mPRp9wFWwCFNNQ7vGfK+52MRHz1bPC85xI9nqzCyP+MYIVqaccD
	 8DP/1jnc4oUofVEWliqv+iCbuBcw4Al51O+eKa7PrZmBRBs6M6QIM4MherhBoMUfeR
	 fcUzWBtEM6UYQHHGwsfx8ASuXsevObcIF9YBlKr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21870F8014D;
	Mon,  6 Sep 2021 18:43:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A97C3F802E7; Mon,  6 Sep 2021 18:42:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD8A5F800B5
 for <alsa-devel@alsa-project.org>; Mon,  6 Sep 2021 18:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD8A5F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XvgubvQe"
Received: by mail-wr1-x431.google.com with SMTP id q26so9720755wrc.7
 for <alsa-devel@alsa-project.org>; Mon, 06 Sep 2021 09:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bxN5ft21MI9Jrg1SLU4AYO87aZP7SDoptFjFb/4W0nk=;
 b=XvgubvQe8ZVZGJx9v4lKjdFMpW4xHk49O6UOatSJFU6aTswNGHz69ne8ah+CEhwXMj
 g+3akKwC0wgrIWEnYDYmYguEGWgHtGxmY41kUqpMNPlD4Khehi+VsGpP0PBsaHK1gbai
 t9OeZK5rDDx8EDH+y/fmYUsDkW9xqg7wQfsK4Wmd9qKkvz8YishqKYayHFyHTvvOiu24
 7RUNl1hq73ONQF7ymkRc42J7nFEOyTTDHtUkEpLLP9BxdjiLqn/l7WmVwc3uxPf7lL23
 h02OTcs+kWKLZ7a1OKtkDgAl+/hUh5n7jyabak7tJf9loKbBYs3x7SRCx9gmNSebQDcE
 nVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bxN5ft21MI9Jrg1SLU4AYO87aZP7SDoptFjFb/4W0nk=;
 b=aTgWWyEPzIlegd5/04BDou+c/TFolRIsRmPpl7oMpVG89GgOrKfrMv0vMFs2nWYDMs
 vvyZuULglD5cXAo05vEEectjUVpFWc1LhfrEnKlsytGcN1s0Q7wDB34JFcbMC5+cuLbn
 z300u2LDtdzEy6G5y7EmxuU++LkRt7aAde1baSVorpNA0w2IdsCq9HTNLp53wgMiDvL5
 YZU9NHabvyWVwMDNzajbrzWAVkTDGaXqpqh2GMflkqyXGsRxr7SMF6/E2WTZA4gyjOdF
 23lduyOxC3aqw/kQbt9Bu1361f+wU9xUNLYl2KBbAa+xof3Nk0hfVJ/rQzo5s6T2ej75
 HRFw==
X-Gm-Message-State: AOAM531iByZQiSQDjcH8HHEXMX2MyeHjTUTcxToIZ4LmOBV7M+zxyP50
 twzVYuZYBQvJccNzmEOz5/Zh5A==
X-Google-Smtp-Source: ABdhPJwVj/n/CVD1gy+YYsFJP932EXsIi4RuKKD3stoFsT+2aHvQssDqqKakd9bPP4Xh0GBSg+yQcg==
X-Received: by 2002:adf:ee48:: with SMTP id w8mr14817799wro.10.1630946572566; 
 Mon, 06 Sep 2021 09:42:52 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id z19sm55473wma.0.2021.09.06.09.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 09:42:52 -0700 (PDT)
Subject: Re: [PATCH v5 18/21] ASoC: qdsp6: audioreach: add q6apm-dai support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-19-srinivas.kandagatla@linaro.org>
 <9cd5b8ec-d3ef-5f1c-5c13-3da4c662d29a@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d48d6f1a-2a32-2da9-f314-22a265d592c4@linaro.org>
Date: Mon, 6 Sep 2021 17:42:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9cd5b8ec-d3ef-5f1c-5c13-3da4c662d29a@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

thanks Pierre for taking time to review the patches.

On 03/09/2021 16:48, Pierre-Louis Bossart wrote:
> 
> 
> On 9/3/21 6:20 AM, Srinivas Kandagatla wrote:
> 
> commit message?
> 
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/qcom/Kconfig           |   5 +
>>   sound/soc/qcom/qdsp6/Makefile    |   1 +
>>   sound/soc/qcom/qdsp6/q6apm-dai.c | 504 +++++++++++++++++++++++++++++++
>>   3 files changed, 510 insertions(+)
>>   create mode 100644 sound/soc/qcom/qdsp6/q6apm-dai.c
>>
>> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
>> index 66d8436ab0a8..fb1921889dc4 100644
>> --- a/sound/soc/qcom/Kconfig
>> +++ b/sound/soc/qcom/Kconfig
>> @@ -84,7 +84,12 @@ config SND_SOC_QDSP6_ASM_DAI
>>   	select SND_SOC_COMPRESS
>>   	tristate
>>   
>> +config SND_SOC_QDSP6_APM_DAI
>> +	select SND_SOC_COMPRESS
>> +	tristate
>> +
>>   config SND_SOC_QDSP6_APM
>> +	select SND_SOC_QDSP6_APM_DAI
>>   	tristate
> 
> usually it's tristate then select?
This is now fixed in new version.

> 
> 
>> +static int q6apm_dai_prepare(struct snd_soc_component *component,
>> +			     struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	struct q6apm_dai_rtd *prtd = runtime->private_data;
>> +	struct audioreach_module_config cfg;
>> +	struct q6apm_dai_data *pdata;
>> +	int ret;
>> +
>> +	pdata = snd_soc_component_get_drvdata(component);
>> +	if (!pdata)
>> +		return -EINVAL;
>> +
>> +	if (!prtd || !prtd->graph) {
>> +		dev_err(component->dev, "%s: private data null or audio client freed\n",
>> +			__func__);
>> +		return -EINVAL;
>> +	}
>> +
>> +	cfg.direction = substream->stream;
>> +	cfg.sample_rate = runtime->rate;
>> +	cfg.num_channels = runtime->channels;
>> +	cfg.bit_width = prtd->bits_per_sample;
>> +
>> +	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
>> +	prtd->pcm_irq_pos = 0;
>> +	/* rate and channels are sent to audio driver */
>> +	ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
>> +	if (ret < 0) {
>> +		dev_err(component->dev, "%s: q6apm_open_write failed\n", __func__);
>> +		return ret;
>> +	}
>> +
>> +	ret = q6apm_graph_media_format_pcm(prtd->graph, &cfg);
>> +	if (ret < 0)
>> +		pr_info("%s: CMD Format block failed\n", __func__);
>> +
>> +	ret = q6apm_map_memory_regions(prtd->graph,
>> +				       substream->stream,
>> +				       prtd->phys,
>> +				       (prtd->pcm_size / prtd->periods),
>> +				       prtd->periods);
>> +
>> +	if (ret < 0) {
>> +		dev_err(component->dev, "Audio Start: Buffer Allocation failed rc = %d\n",
>> +							ret);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	ret = q6apm_graph_prepare(prtd->graph);
>> +	if (ret) {
>> +		dev_err(component->dev, "Failed to prepare Graph %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = q6apm_graph_start(prtd->graph);
>> +	if (ret) {
>> +		dev_err(component->dev, "Failed to Start Graph %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
>> +		int i;
>> +		/* Queue the buffers */
>> +		for (i = 0; i < runtime->periods; i++)
>> +			q6apm_read(prtd->graph);
>> +
>> +	}
> 
> shouldn't the buffers be queued *before* starting? maybe add a comment
> on why this is done in this order.

I never tried it and am not 100% sure if that is possible to do if the 
graph is not active. but I can give that a go if not I will add a 
comment with more details.

> 
>> +	prtd->state = Q6APM_STREAM_RUNNING;
>> +
>> +	return 0;
>> +}
>> +
>> +static int q6apm_dai_trigger(struct snd_soc_component *component,
>> +			     struct snd_pcm_substream *substream, int cmd)
>> +{
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	struct q6apm_dai_rtd *prtd = runtime->private_data;
>> +	int ret = 0;
>> +
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +	case SNDRV_PCM_TRIGGER_RESUME:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> +			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, NO_TIMESTAMP);
>> +		break;
> 
> surprising, why do this only for playback?

We get READ DONE callbacks for capture which can queue next buffer.
> 
>> +	case SNDRV_PCM_TRIGGER_STOP:
>> +		prtd->state = Q6APM_STREAM_STOPPED;
> 
> equally surprising, you just store a state but don't take any action?

Currently I have not integrated all the modules like soft-pause which 
should have have been invoked at this point.
> 
>> +		break;
>> +	case SNDRV_PCM_TRIGGER_SUSPEND:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> 
> and for those two you do nothing?

soft-pause module implementation is missing in this version.

> 
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int q6apm_dai_open(struct snd_soc_component *component,
>> +			  struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	struct snd_soc_pcm_runtime *soc_prtd = substream->private_data;
>> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_prtd, 0);
>> +	struct q6apm_dai_rtd *prtd;
>> +	struct q6apm_dai_data *pdata;
>> +	struct device *dev = component->dev;
>> +	int ret;
>> +	int graph_id;
>> +
>> +	graph_id = cpu_dai->driver->id;
>> +
>> +	pdata = snd_soc_component_get_drvdata(component);
>> +	if (!pdata) {
>> +		dev_err(component->dev, "Drv data not found ..\n");
> 
> dev_err(dev, for consistency?

Sure.

> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	prtd = kzalloc(sizeof(*prtd), GFP_KERNEL);
>> +	if (prtd == NULL)
> 
> if (!prtd)
>> +		return -ENOMEM;
>> +
>> +	prtd->substream = substream;
>> +
>> +	prtd->graph = q6apm_graph_open(dev, (q6apm_cb)event_handler,
>> +				       prtd, graph_id);
>> +	if (IS_ERR(prtd->graph)) {
>> +		pr_info("%s: Could not allocate memory\n", __func__);
> 
> dev_info(dev,

I agree.

> 
>> +		ret = PTR_ERR(prtd->graph);
>> +		kfree(prtd);
>> +		return ret;
>> +	}
>> +
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> +		runtime->hw = q6apm_dai_hardware_playback;
>> +	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
>> +		runtime->hw = q6apm_dai_hardware_capture;
>> +
>> +	/* Ensure that buffer size is a multiple of period size */
>> +	ret = snd_pcm_hw_constraint_integer(runtime,
>> +					    SNDRV_PCM_HW_PARAM_PERIODS);
>> +	if (ret < 0) {
>> +		dev_err(dev, "snd_pcm_hw_constraint_integer failed\n");
>> +		return ret;
> 
> kfree(prtd)?
> 
> The error handling is broken in the rest of this function as well.
> please revisit.

100% true, I will revisit this thanks for spotting this.
> 
>> +	}
>> +
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +		ret = snd_pcm_hw_constraint_minmax(runtime,
>> +			SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
>> +			BUFFER_BYTES_MIN, BUFFER_BYTES_MAX);
>> +		if (ret < 0) {
>> +			dev_err(dev, "constraint for buffer bytes min max ret = %d\n",
>> +									ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	ret = snd_pcm_hw_constraint_step(runtime, 0,
>> +					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
>> +	if (ret < 0) {
>> +		dev_err(dev, "constraint for period bytes step ret = %d\n",
>> +								ret);
>> +		return ret;
>> +	}
>> +	ret = snd_pcm_hw_constraint_step(runtime, 0,
>> +					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
>> +	if (ret < 0) {
>> +		dev_err(dev, "constraint for buffer bytes step ret = %d\n",
>> +								ret);
>> +		return ret;
>> +	}
>> +
>> +	runtime->private_data = prtd;
>> +	runtime->dma_bytes = BUFFER_BYTES_MAX;
>> +	if (pdata->sid < 0)
>> +		prtd->phys = substream->dma_buffer.addr;
>> +	else
>> +		prtd->phys = substream->dma_buffer.addr | (pdata->sid << 32);
>> +
>> +	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
>> +
>> +	return 0;
>> +}
>> +
>> +static int q6apm_dai_close(struct snd_soc_component *component,
>> +			   struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	struct q6apm_dai_rtd *prtd = runtime->private_data;
>> +
>> +	if (prtd && prtd->graph) {
> 
> This is always true if the open succeeds...

Yes,
> 
>> +		q6apm_graph_stop(prtd->graph);
>> +
>> +		q6apm_unmap_memory_regions(prtd->graph,
>> +					   substream->stream);
>> +		q6apm_graph_close(prtd->graph);
>> +		prtd->graph = NULL;
>> +		kfree(prtd);
>> +		runtime->private_data = NULL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static snd_pcm_uframes_t q6apm_dai_pointer(struct snd_soc_component *component,
>> +					   struct snd_pcm_substream *substream)
>> +{
>> +
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	struct q6apm_dai_rtd *prtd = runtime->private_data;
>> +
>> +	if (prtd->pcm_irq_pos >= prtd->pcm_size)
>> +		prtd->pcm_irq_pos = 0;
> 
> that's surprising, no wrap-around?
> 
>> +
>> +	return bytes_to_frames(runtime, (prtd->pcm_irq_pos));
>> +}
>> +

>> +
>> +static int q6apm_dai_pcm_new(struct snd_soc_component *component,
>> +			     struct snd_soc_pcm_runtime *rtd)
>> +{
>> +	struct snd_pcm_substream *psubstream, *csubstream;
>> +	struct snd_pcm *pcm = rtd->pcm;
>> +	struct device *dev;
>> +	int size, ret;
>> +
>> +	dev = component->dev;
>> +	size = BUFFER_BYTES_MAX;
>> +	psubstream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
>> +	if (psubstream) {
>> +		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dev, size,
>> +					  &psubstream->dma_buffer);
>> +		if (ret) {
>> +			dev_err(dev, "Cannot allocate buffer(s)\n");
> 
> for playback. Using the same error messages in different cases isn't
> very helpful to debug bad sequences...
> 
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	csubstream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
>> +	if (csubstream) {
>> +		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dev, size,
>> +					  &csubstream->dma_buffer);
>> +		if (ret) {
>> +			dev_err(dev, "Cannot allocate buffer(s)\n");
> 
> for capture
Yes, this code has been cleaned up in 5.15 we should totally get rid of 
this allocation function and use generic function.
> 
>> +			if (psubstream)
>> +				snd_dma_free_pages(&psubstream->dma_buffer);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 
>> +MODULE_LICENSE("GPL v2");
> 
> "GPL" is enough, the SPDX line deals with the license version.

I agree.
> 
