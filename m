Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 142EF70E4A3
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 20:27:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA3BB825;
	Tue, 23 May 2023 20:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA3BB825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684866425;
	bh=kH22TXuJtFmSJ2fWfIGz1kwHZ5/aELJIPwlWwy6uGcE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l6s5LPaKaxrc3/rOfjqw/Y05RSej0hszOfm4DTxs7JRlNZm66temIJhuH9cQssE8i
	 pcum56GRnhyy4jRfNIdN3GemfLMgPa6fwpDT0tZezXVOSJzXO3GMYcr6F95wzdi10E
	 B+XeqcHPCHgq6rSjispteUhFll3oPvyiNMrMZNe8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66E4FF8057F; Tue, 23 May 2023 20:25:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0283FF8057B;
	Tue, 23 May 2023 20:25:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3329F80553; Tue, 23 May 2023 20:25:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D812F80249
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 20:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D812F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BWypFKFI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684866299; x=1716402299;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kH22TXuJtFmSJ2fWfIGz1kwHZ5/aELJIPwlWwy6uGcE=;
  b=BWypFKFIfjQqDLETI+VGji0MBVIn795wr9iIaasTvIvblrFFRyh6apAK
   5gAzk0ojEw1IioBLUHFg0sbEkTqdDLxOp0ZG/d3vFMQmOqxRoujZia8sg
   JAMjMdKqlFaXC40SfLePCXLYgVHOY1p4ZqqCUjczgYhlIS2ytCtLJ/az4
   PjNCVrheMfuHhSf1LYVRxRPWlK2OeYeaw7A2CLwY5/XcmIXxAdTCVEpcp
   f40Hh2O7TUpuucPP8rPklzTWqkITj1rr6llTQ3JDNvtGUmQIuUE/dO+9O
   mdf8t/uAWMTXZ8rKNRzY0245rToLo+VIxVVIR+vGTfMHN9XXXZlXJjx+y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="342786285"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="342786285"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 11:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="736974314"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="736974314"
Received: from srusakov-mobl.amr.corp.intel.com (HELO [10.209.35.87])
 ([10.209.35.87])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 11:24:39 -0700
Message-ID: <64948d51-dc5d-adb7-4929-74a827a004a2@linux.intel.com>
Date: Tue, 23 May 2023 10:03:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V2 6/9] ASoC: amd: ps: add pm ops support for SoundWire
 dma driver
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, open list <linux-kernel@vger.kernel.org>
References: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
 <20230522133122.166841-7-Vijendar.Mukunda@amd.com>
 <b3812c08-96fe-f125-66c6-a7db518a37ba@linux.intel.com>
 <f69b31e4-79f0-b7f5-097b-0e11699867b9@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f69b31e4-79f0-b7f5-097b-0e11699867b9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WRQXFBT74KY4HC2XY35IOWF3RPZCIOLJ
X-Message-ID-Hash: WRQXFBT74KY4HC2XY35IOWF3RPZCIOLJ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WRQXFBT74KY4HC2XY35IOWF3RPZCIOLJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> @@ -464,16 +488,79 @@ static int acp63_sdw_platform_probe(struct platform_device *pdev)
>>>  	status = devm_snd_soc_register_component(&pdev->dev,
>>>  						 &acp63_sdw_component,
>>>  						 NULL, 0);
>>> -	if (status)
>>> +	if (status) {
>>>  		dev_err(&pdev->dev, "Fail to register sdw dma component\n");
>>> +		return status;
>>> +	}
>>> +	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
>>> +	pm_runtime_use_autosuspend(&pdev->dev);
>>> +	pm_runtime_enable(&pdev->dev);
>>> +	pm_runtime_allow(&pdev->dev);
>> Can you remind me why you need the pm_runtime_allow()? I can't recall
>> where the _forbid() is done.
> We have used pm_runtime_allow() to allow the device immediately
> enter runtime suspend state. Yes you are correct. If we use pm_runtime_allow(),
> then in remove sequence we should use pm_runtime_forbid call.
>> Also is there not a pm_runtime_set_active() missing?
> 
> 
> We will change the sequence as mentioned below.
> 
> in probe sequence , we will use
> 
>     pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
>     pm_runtime_use_autosuspend(&pdev->dev);
>     pm_runtime_mark_last_busy(&pdev->dev);
>     pm_runtime_set_active(&pdev->dev);
>     pm_runtime_enable(&pdev->dev);
> 
> In remove sequence
> 
> pm_runtime_disable(&pdev->dev);

sounds about right.

>>
>>> +	return 0;
>>> +}
>>>  
>>> -	return status;
>>> +static int acp63_sdw_platform_remove(struct platform_device *pdev)
>>> +{
>>> +	pm_runtime_disable(&pdev->dev);
>>> +	return 0;
>>>  }
>>>  
>>> +static int __maybe_unused acp63_sdw_pcm_resume(struct device *dev)
>>> +{
>>> +	struct sdw_dma_dev_data *sdw_data;
>>> +	struct acp_sdw_dma_stream *stream;
>>> +	struct snd_pcm_runtime *runtime;
>>> +	u32 period_bytes, buf_size, water_mark_size_reg;
>>> +	int ret;
>>> +	int index;
>>> +
>>> +	sdw_data = dev_get_drvdata(dev);
>>> +	for (index = 0; index < ACP63_SDW0_DMA_MAX_STREAMS; index++) {
>>> +		if (sdw_data->sdw0_dma_stream[index] &&
>>> +		    sdw_data->sdw0_dma_stream[index]->runtime) {
>>> +			water_mark_size_reg = sdw0_dma_ring_buf_reg[index].water_mark_size_reg;
>>> +			runtime = sdw_data->sdw0_dma_stream[index]->runtime;
>>> +			stream = runtime->private_data;
>>> +			period_bytes = frames_to_bytes(runtime, runtime->period_size);
>>> +			buf_size = frames_to_bytes(runtime, runtime->buffer_size);
>>> +			acp63_config_dma(stream, sdw_data->acp_base, index);
>>> +			ret = acp63_configure_sdw_ringbuffer(sdw_data->acp_base, index,
>>> +							     buf_size, ACP_SDW0);
>>> +			if (ret)
>>> +				return ret;
>>> +			writel(period_bytes, sdw_data->acp_base + water_mark_size_reg);
>>> +		}
>>> +	}
>>> +	for (index = 0; index < ACP63_SDW1_DMA_MAX_STREAMS; index++) {
>>> +		if (sdw_data->sdw1_dma_stream[index] &&
>>> +		    sdw_data->sdw1_dma_stream[index]->runtime) {
>>> +			water_mark_size_reg = sdw1_dma_ring_buf_reg[index].water_mark_size_reg;
>>> +			runtime = sdw_data->sdw1_dma_stream[index]->runtime;
>>> +			stream = runtime->private_data;
>>> +			period_bytes = frames_to_bytes(runtime, runtime->period_size);
>>> +			buf_size = frames_to_bytes(runtime, runtime->buffer_size);
>>> +			acp63_config_dma(stream, sdw_data->acp_base, index);
>>> +			ret = acp63_configure_sdw_ringbuffer(sdw_data->acp_base, index,
>>> +							     buf_size, ACP_SDW1);
>>> +			if (ret)
>>> +				return ret;
>>> +			writel(period_bytes, sdw_data->acp_base + water_mark_size_reg);
>>> +		}
>>> +	}
>> Isn't this set of configurations something that needs to be done already
>> somewhere else, i.e. could there be a common helper?
> In hw_params() callback, we are setting period_bytes and buf_size from
> params structure. We are extracting same variables from runtime structures
> in resume() callback.
> We can implement a helper function to further simplify above logic
> instead of having two separate loops.

ok

