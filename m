Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CA070E4A1
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 20:26:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1CE9208;
	Tue, 23 May 2023 20:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1CE9208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684866411;
	bh=QyHEP8tfyMQbyJYczp7OSH5grNvNuPCgF28/QY/9JrA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u4lNjDeS4g/pMc7gTQefOTg9dYe5P8NaEPhxVqrFHDfw29UEZ3GNgpa/SOxD7SFWY
	 43Eb7tLOOlx+ZqWe6D9BvbVw4rDb5HCAzfMlvdYYft1VfVXNDA4+5y5viJ2i6reMhd
	 RLYDrKWGHQne5iZqBbeI9Db8W7kFnDDSHZuKoB9E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6AE7F80570; Tue, 23 May 2023 20:25:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B466F80563;
	Tue, 23 May 2023 20:25:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C6FBF80425; Tue, 23 May 2023 20:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31356F800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 20:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31356F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PsYpyRzW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684866297; x=1716402297;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QyHEP8tfyMQbyJYczp7OSH5grNvNuPCgF28/QY/9JrA=;
  b=PsYpyRzWujIVv3ERunm59DbgXHvKXKTtN7g73w/slMGRkctTXNs4dYaH
   MRJ4p0fJoyIWfYpWGSIUQu2OPXRxitks4K0JihzgiIc/nR1eUKPQI7Jk0
   X+ehlymEJYt5Orenc0SeBqQYGnoKasA4QT7mEL8jRc5q4fDuE7TBBPcCV
   WAFOIlBLme51Se9k4Ore2ERXpJ/h7kD5lw3E9InduAUGPoChfQ6v0wvCc
   tuwLxDXJIdILFn9+uwrHIVulC1y/l+I1jcKE/QZq5Dp4QZQzsIb+9LFf6
   jdOGfZ9YfGsfWG19eLA2DsKVTGjI/vkOu3Vtezuo4iHPksI8+zdi/CduQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="342786258"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="342786258"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 11:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="736974298"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="736974298"
Received: from srusakov-mobl.amr.corp.intel.com (HELO [10.209.35.87])
 ([10.209.35.87])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 11:24:38 -0700
Message-ID: <f11f3370-0b72-cb1f-21cf-c574ef03fd72@linux.intel.com>
Date: Tue, 23 May 2023 10:00:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V2 5/9] ASoC: amd: ps: add support for SoundWire DMA
 interrupts
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
 <20230522133122.166841-6-Vijendar.Mukunda@amd.com>
 <fea3c862-1470-7911-ff77-5d945b1d77cf@linux.intel.com>
 <2dfeee7c-32bd-c054-22ff-3a2266e62c90@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2dfeee7c-32bd-c054-22ff-3a2266e62c90@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: B4SS3VDYNBPZUM7HWWNETWRBUMYE6M6P
X-Message-ID-Hash: B4SS3VDYNBPZUM7HWWNETWRBUMYE6M6P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4SS3VDYNBPZUM7HWWNETWRBUMYE6M6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/23/23 02:36, Mukunda,Vijendar wrote:
> On 22/05/23 23:42, Pierre-Louis Bossart wrote:
>>
>> On 5/22/23 08:31, Vijendar Mukunda wrote:
>>> Initialize workqueue for SoundWire DMA interrupts handling.
>>> Whenever audio data equal to the SoundWire FIFO watermark level
>>> are produced/consumed, interrupt is generated.
>>> Acknowledge the interrupt and schedule the workqueue.
>> It would help to explain why a work queue is needed is the first place,
>> as opposed to handling periods in the interrupt thread.
> For SoundWire DAI link, we are setting nonatomic flag to true.
> If we return period elapsed from hard irq handler instead of workqueue,
> soft lock up is observed during stream closure.
> 
> We can use interrupt thread as well. To have a symmetry with
> SoundWire manager work queues, we have used workqueue for
> DMA interrupts.

Oh, I completely missed the model here.

If you are using the bottom half/hard irq handler to read status
information, the natural thing to do would be to have an irq thread, no?

Not sure I see the benefit of aligning with the manager work queues -
unless it makes your life simpler to avoid race conditions with
cancel_work_sync()?

>>> +static void acp63_sdw_dma_workthread(struct work_struct *work)
>>> +{
>>> +	struct acp63_dev_data *adata = container_of(work, struct acp63_dev_data,
>>> +						    acp_sdw_dma_work);
>>> +	struct sdw_dma_dev_data *sdw_dma_data;
>>> +	u32 stream_index;
>>> +	u16 pdev_index;
>>> +
>>> +	pdev_index = adata->sdw_dma_dev_index;
>>> +	sdw_dma_data = dev_get_drvdata(&adata->pdev[pdev_index]->dev);
>>> +
>>> +	for (stream_index = 0; stream_index < ACP63_SDW0_DMA_MAX_STREAMS; stream_index++) {
>>> +		if (adata->sdw0_dma_intr_stat[stream_index]) {
>>> +			if (sdw_dma_data->sdw0_dma_stream[stream_index])
>>> +				snd_pcm_period_elapsed(sdw_dma_data->sdw0_dma_stream[stream_index]);
>>> +			adata->sdw0_dma_intr_stat[stream_index] = 0;
>>> +		}
>>> +	}
>>> +	for (stream_index = 0; stream_index < ACP63_SDW1_DMA_MAX_STREAMS; stream_index++) {
>>> +		if (adata->sdw1_dma_intr_stat[stream_index]) {
>>> +			if (sdw_dma_data->sdw1_dma_stream[stream_index])
>>> +				snd_pcm_period_elapsed(sdw_dma_data->sdw1_dma_stream[stream_index]);
>>> +			adata->sdw1_dma_intr_stat[stream_index] = 0;
>>> +		}
>>> +	}
>> I am not clear on the benefits of the workqueue which only tests a flag
>> that's set ...
> In top half, we are checking all stream irq mask and setting
> corresponding stream id index in interrupt status array when dma
> irq is raised.
> 
> Our intention is to handle snd_pcm_period_elapsed in process context.
> if the flag is set, call the period elapsed for the substream based on stream
> id in work queue.

