Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9E41ABFD
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 11:34:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97F9F1686;
	Tue, 28 Sep 2021 11:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97F9F1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632821683;
	bh=jytklEDQ95fyDdpuYEPVqn2welwfEmiIVUI9Da7MNUQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O1zpKa9k78Boj1a6L93rlGn6kV+yEiWwZB5PFbk2BHRKubjMDiBxWBvVBBCFFrHic
	 2ZPqgJeuJFPlbsrfRw2Inpv9LQzLzLmTKUSPpNm2dvvtNiJPTga84fKGT2p0fEaEod
	 97jkI5pcqX8oJsj7vrtaUmYI4PElfN/TCr2ng8YY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08BF6F804AD;
	Tue, 28 Sep 2021 11:33:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82C50F804AD; Tue, 28 Sep 2021 11:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04777F80161
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 11:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04777F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vVUBSuUm"
Received: by mail-wr1-x42e.google.com with SMTP id u18so56906308wrg.5
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 02:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UFWLjB0W2jsMi2ZnH6ymwZl3bjSBnAe186vh+OeB0WU=;
 b=vVUBSuUmwZNQZQMQuWoFG0MCX8iygaH4nDSZ3bBuoSYm1eryM+fPHk3LPc3yJRifM6
 cnhmlP4XWb1o1y0ABTaQxGumsQqdxeUefWzlLCMhGcOQG1JLgPKoEBOqZpOMZIWdWgLt
 9jpiUMtY8jt4fXiH9uEf/9wkkBv3f9LzszdJL6HAhhrbJcm3yWP/Dd+PkK/Bl9qOqaSt
 zkFrKOcNJQ5GW+GMx/MgteKtzTIagHxmlCOhAexpCjBo2y3vXaVR5idqUxLwr+lfrgIx
 mWpYq5iRY9ptJd7TqHnRL6h1LxOvJknBqfhj1tTSQmfoS1SmYS/YrmTcUbYIa10pGKah
 gB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UFWLjB0W2jsMi2ZnH6ymwZl3bjSBnAe186vh+OeB0WU=;
 b=EU4EVzc/TowOmhoGoN8SpVhJf1bpmZGR2k6yu8/kj26Cqj/ua/RvnQgSNChp+zyLXq
 V1N3EFfGQfkfpkJvo4wtnPzsJtmm7fAXS8XvfAUX8utBKHCdpPG6oth9BXZXipHpPJ2L
 upNou5L/QSGw0boKdmFSWXDSkhmWAtv/eF0bl4TvUAD8FGXSIjF7qtXmQbErRI5sWOJB
 wHwypNJwFaq+2g7GIDE7EuzKjkpzMxtqRHZutvoQSiGFKZs4ing8tPjXtTBQY7ukVrCG
 XD2zL8M+07rk+0skTolXRk/k8l2MMKFaf1j+dU7aVPGc7VjHxa8KQ1fhHfzF9OyPZEcA
 My+Q==
X-Gm-Message-State: AOAM532t71ZpC68nlGzsSKn8F0/9GzC6ZUQlwXNCNVjhfahLtyQ2ZoU4
 mpiX8xGbIwqDayMbiuVha35fGg==
X-Google-Smtp-Source: ABdhPJyv/THNOKdhlB1LmnC9UxX4hlZiTSiUuFLuzeCFWMaqw7PSUijQmKwiWgKSY9IOP4ZWuehsXw==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr5202503wrz.29.1632821600565;
 Tue, 28 Sep 2021 02:33:20 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id w14sm18892145wro.8.2021.09.28.02.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 02:33:20 -0700 (PDT)
Subject: Re: [PATCH v8 19/22] ASoC: qdsp6: audioreach: add q6apm-dai support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
 <20210927135559.738-20-srinivas.kandagatla@linaro.org>
 <20605122-e6b4-1b5f-003a-96a74306f984@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c12ac2f5-bc53-ac0c-6ed0-f748a62015ac@linaro.org>
Date: Tue, 28 Sep 2021 10:33:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20605122-e6b4-1b5f-003a-96a74306f984@linux.intel.com>
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



On 27/09/2021 17:25, Pierre-Louis Bossart wrote:
> 
>> +static int q6apm_dai_prepare(struct snd_soc_component *component,
>> +			     struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	struct q6apm_dai_rtd *prtd = runtime->private_data;
>> +	struct audioreach_module_config cfg;
>> +	struct device *dev = component->dev;
>> +	struct q6apm_dai_data *pdata;
>> +	int ret;
>> +
>> +	pdata = snd_soc_component_get_drvdata(component);
>> +	if (!pdata)
>> +		return -EINVAL;
>> +
>> +	if (!prtd || !prtd->graph) {
>> +		dev_err(dev, "%s: private data null or audio client freed\n", __func__);
>> +		return -EINVAL;
>> +	}
>> +
>> +	cfg.direction = substream->stream;
>> +	cfg.sample_rate = runtime->rate;
>> +	cfg.num_channels = runtime->channels;
>> +	cfg.bit_width = prtd->bits_per_sample;
>> +
>> +	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
>> +	prtd->pos = 0;
>> +	/* rate and channels are sent to audio driver */
>> +	ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
>> +	if (ret < 0) {
>> +		dev_err(dev, "%s: q6apm_open_write failed\n", __func__);
>> +		return ret;
>> +	}
>> +
>> +	ret = q6apm_graph_media_format_pcm(prtd->graph, &cfg);
>> +	if (ret < 0)
>> +		dev_err(dev, "%s: CMD Format block failed\n", __func__);
>> +
>> +	ret = q6apm_map_memory_regions(prtd->graph, substream->stream, prtd->phys,
>> +				       (prtd->pcm_size / prtd->periods), prtd->periods);
>> +
>> +	if (ret < 0) {
>> +		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	ret = q6apm_graph_prepare(prtd->graph);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to prepare Graph %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = q6apm_graph_start(prtd->graph);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to Start Graph %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
>> +		int i;
>> +		/* Queue the buffers for Capture ONLY after graph is started */
>> +		for (i = 0; i < runtime->periods; i++)
>> +			q6apm_read(prtd->graph);
>> +
>> +	}
>> +
>> +	prtd->state = Q6APM_STREAM_RUNNING;
> 
> you should probably explain why a stream moves to the 'RUNNING' state in
> a .prepare() callback, instead of TRIGGER_START?

Sure, will add a comment,

--srini
> 
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
>> +		 /* start writing buffers for playback only as we already queued capture buffers */
>> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> +			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
>> +		break;
>> +	case SNDRV_PCM_TRIGGER_STOP:
>> +		/* TODO support be handled via SoftPause Module */
>> +		prtd->state = Q6APM_STREAM_STOPPED;
>> +		break;
>> +	case SNDRV_PCM_TRIGGER_SUSPEND:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
> 
