Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7A03C9CCB
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 12:35:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAA7616B6;
	Thu, 15 Jul 2021 12:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAA7616B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626345315;
	bh=bVQrpiuctp6K6q+rO/1zVoxyp3hmzGQgJkRpEXyJI3Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eI0n7i1vViIAjuagdXgRh87Wa/cRrXWnkgrYXxDEVEsLjlMOioK9MJTiGO3QB7n+9
	 JQKcU+QpP8ttQQ047ut1Oy/L8JNryACXnD4I5Sh4uOmg3RK9P1cftT7vCdPQoH1gPs
	 eYHqixfpDlAlotUcqth/qECIXMYCryWzC9QiAs6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73D02F804F2;
	Thu, 15 Jul 2021 12:32:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F583F804FC; Thu, 15 Jul 2021 12:32:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05086F804F2
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 12:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05086F804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="E3h11f88"
Received: by mail-wm1-x331.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so5725226wmb.3
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 03:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yErtTWgcO6FK0iGfpzstg3ohtWyGpJF37AOcLp6i0rU=;
 b=E3h11f88UUXXnGCXjPiHxeLqM1eLAL34bmABWBW3eR4vCSamRe50aBxoNDXPDTXClz
 3stoYZgpeJzJ4ZNKea+jrOzDRDhXHuth/SD0jb5u8zbMPlj1mEsMWJ7/DQ9qJe/MM6sY
 ppqrkU7yEaJ04hGr2gXlKJj+YqhBOXp1ivpFQ2dUe/Xbf3f8hqxupCOIdJQn9X/eYh/L
 OCwVZU685IULo0bNHfpGhnx8/Kl7ip4u8NMXw/XEXarquwuIakxzzyl6QbAnZyS3sPAU
 tOr7OHGRQUox5FFrfR18+V67aPaY2Q8wxdIRJR/vZl2wY6Q3StaAf0kLOVXwS97R4Sqs
 DMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yErtTWgcO6FK0iGfpzstg3ohtWyGpJF37AOcLp6i0rU=;
 b=UAodJo/qtJ1pIwe4GwP+6EjBTQWlJtPN6szhjzM8aqOFqtaReHaTijw6UTp8vuWkKV
 Grw8hX6Wfx92jNF3XcYK+L6xMmjcsh0R3Ry88kIgigGLPl3+M4iemAdD8uc1JzBfkr/2
 /KqxhwpAFhrqoK92TWqleCnUXrEybwNDzLMjSgtg0UoA6JZUGMhKhkdmhb8esXnt0BFv
 JucYgGnLEe7TBpFpNQH1OJllgB/nvjFn5UY246AclpmlmJd6ScFG6P35YEKkCkfDvqxq
 yStHUA54qhVgvJW4fH1wMZ+2IoeE7oNlJi4oJVx72vF99zla+BacMzwYHoBeB7DViL+D
 6axA==
X-Gm-Message-State: AOAM532JxBb73PSc/Kg5rfJvMFZKBOsJu0gqg/xF/0LgWlsUIvE1Ksek
 THawl2N5vvzSN9lVw1HV/JPEUA==
X-Google-Smtp-Source: ABdhPJyLJnG8rhsApFP959gtYhzUIb21xHkuZxXHeM6/w3dCR+i1WWHgNlCr5cYEBBkk2uF7+TbbKA==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr9961444wml.30.1626345144763; 
 Thu, 15 Jul 2021 03:32:24 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id r9sm4319671wmq.25.2021.07.15.03.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 03:32:24 -0700 (PDT)
Subject: Re: [PATCH v2 09/16] ASoC: qcom: audioreach: add q6apm-dai support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-10-srinivas.kandagatla@linaro.org>
 <9b669a36-f9e4-bd90-7b02-e55fe5b99814@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <90aafeb0-57dd-a309-e08f-a4ff31ad0853@linaro.org>
Date: Thu, 15 Jul 2021 11:32:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9b669a36-f9e4-bd90-7b02-e55fe5b99814@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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



On 14/07/2021 17:59, Pierre-Louis Bossart wrote:
> 
> 
>> +static void event_handler(uint32_t opcode, uint32_t token,
>> +			  uint32_t *payload, void *priv)
>> +{
>> +	struct q6apm_dai_rtd *prtd = priv;
>> +	struct snd_pcm_substream *substream = prtd->substream;
>> +
>> +	switch (opcode) {
>> +	case APM_CLIENT_EVENT_CMD_EOS_DONE:
>> +		prtd->state = Q6APM_STREAM_STOPPED;
>> +		break;
>> +	case APM_CLIENT_EVENT_DATA_WRITE_DONE: {
>> +		prtd->pcm_irq_pos += prtd->pcm_count;
>> +		snd_pcm_period_elapsed(substream);
> 
> A comment on the relationship between data writes and periods would be nice. It looks like the code assumes the period and data transfers are identical, but periods can be chosen by applications, can't they?

Yes, pcm_count is set to period size, so we get ack for each period.


> 
>> +		if (prtd->state == Q6APM_STREAM_RUNNING) {
>> +			q6apm_write_async(prtd->graph,
>> +					   prtd->pcm_count, 0, 0, NO_TIMESTAMP);
>> +		}
>> +
>> +		break;
>> +		}
>> +	case APM_CLIENT_EVENT_DATA_READ_DONE:
>> +		prtd->pcm_irq_pos += prtd->pcm_count;
>> +		snd_pcm_period_elapsed(substream);
>> +		if (prtd->state == Q6APM_STREAM_RUNNING)
>> +			q6apm_read(prtd->graph);
>> +
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
> 
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
>> +	case SNDRV_PCM_TRIGGER_STOP:
>> +		prtd->state = Q6APM_STREAM_STOPPED;
>> +		//ret = q6apm_cmd_nowait(prtd->graph, CMD_EOS);
>> +		break;
>> +	case SNDRV_PCM_TRIGGER_SUSPEND:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +		//ret = q6apm_cmd_nowait(prtd->graph, CMD_PAUSE);
> 
> these // comments are odd, with a clear imbalance between suspend/resume and pause_push/pause_release...
> is this intentional or a left-over from an experiment?

Yes, I forgot to clean this up before sending out.

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
>> +		return -EINVAL;
>> +	}
>> +
>> +	prtd = kzalloc(sizeof(*prtd), GFP_KERNEL);
>> +	if (prtd == NULL)
>> +		return -ENOMEM;
>> +
>> +	prtd->substream = substream;
>> +
>> +	prtd->graph = q6apm_graph_open(dev, (q6apm_cb)event_handler,
>> +				       prtd, graph_id);
>> +	if (IS_ERR(prtd->graph)) {
>> +		pr_info("%s: Could not allocate memory\n", __func__);
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
>> +	if (ret < 0)
>> +		dev_err(dev, "snd_pcm_hw_constraint_integer failed\n");
>> +
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +		ret = snd_pcm_hw_constraint_minmax(runtime,
>> +			SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
>> +			BUFFER_BYTES_MIN, BUFFER_BYTES_MAX);
>> +		if (ret < 0) {
>> +			dev_err(dev, "constraint for buffer bytes min max ret = %d\n",
>> +									ret);
>> +		}
>> +	}
>> +
>> +	ret = snd_pcm_hw_constraint_step(runtime, 0,
>> +					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
>> +	if (ret < 0) {
>> +		dev_err(dev, "constraint for period bytes step ret = %d\n",
>> +								ret);
>> +	}
>> +	ret = snd_pcm_hw_constraint_step(runtime, 0,
>> +					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
>> +	if (ret < 0) {
>> +		dev_err(dev, "constraint for buffer bytes step ret = %d\n",
>> +								ret);
>> +	}
> 
> dev_err() used but no return code sent?

Ack.

> 
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
> 
>> +static int q6apm_dai_hw_params(struct snd_soc_component *component,
>> +			       struct snd_pcm_substream *substream,
>> +			       struct snd_pcm_hw_params *params)
>> +{
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	struct q6apm_dai_rtd *prtd = runtime->private_data;
>> +
>> +	prtd->pcm_size = params_buffer_bytes(params);
>> +	prtd->periods = params_periods(params);
>> +
>> +	switch (params_format(params)) {
>> +	case SNDRV_PCM_FORMAT_S16_LE:
>> +		prtd->bits_per_sample = 16;
>> +		break;
>> +	case SNDRV_PCM_FORMAT_S24_LE:
>> +		prtd->bits_per_sample = 24;
>> +		break;
> 
> default:
>      return -EINVAL
> ?
Ack, will do that in next spin.

--srini
> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +
> 
