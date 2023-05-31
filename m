Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BD57188C4
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 19:47:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAE8FD8;
	Wed, 31 May 2023 19:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAE8FD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685555275;
	bh=hTqd3Pee3flh4HGEZ53S3n5CSuBCfvBltkaD8gL0ZSg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pjm0rrQuNIeax5ArQydnT0BpDsyo+z6omGzqH8OtnjbIBGy9yB9s0/WBn8YIfXAYW
	 eL3LyC6uwYNl771YLrA67mxQQjUGr8PPa7uZknyW0ajwuPMUrvF+utJBXRWPQswKI9
	 dPvy5Ezxc+RkbovKvt3S0WED9eO4jZyNRwos/AB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A2F0F804FC; Wed, 31 May 2023 19:47:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A56FCF8026A;
	Wed, 31 May 2023 19:47:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01863F8042F; Wed, 31 May 2023 19:47:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 291C9F80149
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 19:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 291C9F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=exsJvHQy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685555213; x=1717091213;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hTqd3Pee3flh4HGEZ53S3n5CSuBCfvBltkaD8gL0ZSg=;
  b=exsJvHQyn5RVEFBEnngHXKXDT+nTySzviQj/HYMRFoJah3CU3uZkFoUR
   KCRB1MKa/JDvOHPa+uwlTz1z4InEzi+degxXdm6K6gcLMOg1NNBy1NviG
   wRPKhaaCZxo6a+EfQrrK6PVFkL8lohrL27Hqcoe7dpnQrYFhF19lj3aS7
   cGtjyhV2NL3uSUyproAx/BQ9/wiC6cphbuWfrKI/hCxTiUabd40qZ78u1
   sj8nb8vOzurHM0qAL5cFdSnPoc7RwtcYSsy+eZei1U43fr3KA2uh6VXR8
   gisAFqDxCVjKhkyFYPsekRFe6xzEF5zzwBROmkkjmTEnLF++3R1nsZJYw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="344832468"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400";
   d="scan'208";a="344832468"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 10:46:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="707004433"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400";
   d="scan'208";a="707004433"
Received: from tkam-mobl1.amr.corp.intel.com (HELO [10.212.252.148])
 ([10.212.252.148])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 10:46:45 -0700
Message-ID: <5048a207-4ec4-e954-0fe8-88ed25320c1b@linux.intel.com>
Date: Wed, 31 May 2023 08:53:07 -0500
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
 <f11f3370-0b72-cb1f-21cf-c574ef03fd72@linux.intel.com>
 <017abf89-a1aa-0c85-e244-a56c05b7c6e2@amd.com>
 <af5b0669-2621-7fce-358c-76dca7b521c5@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <af5b0669-2621-7fce-358c-76dca7b521c5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WTLJGVUGIORMGZBDLHFTCV7W5322YA3H
X-Message-ID-Hash: WTLJGVUGIORMGZBDLHFTCV7W5322YA3H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTLJGVUGIORMGZBDLHFTCV7W5322YA3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/31/23 02:28, Mukunda,Vijendar wrote:
> On 24/05/23 13:15, Mukunda,Vijendar wrote:
>> On 23/05/23 20:30, Pierre-Louis Bossart wrote:
>>> On 5/23/23 02:36, Mukunda,Vijendar wrote:
>>>> On 22/05/23 23:42, Pierre-Louis Bossart wrote:
>>>>> On 5/22/23 08:31, Vijendar Mukunda wrote:
>>>>>> Initialize workqueue for SoundWire DMA interrupts handling.
>>>>>> Whenever audio data equal to the SoundWire FIFO watermark level
>>>>>> are produced/consumed, interrupt is generated.
>>>>>> Acknowledge the interrupt and schedule the workqueue.
>>>>> It would help to explain why a work queue is needed is the first place,
>>>>> as opposed to handling periods in the interrupt thread.
>>>> For SoundWire DAI link, we are setting nonatomic flag to true.
>>>> If we return period elapsed from hard irq handler instead of workqueue,
>>>> soft lock up is observed during stream closure.
>>>>
>>>> We can use interrupt thread as well. To have a symmetry with
>>>> SoundWire manager work queues, we have used workqueue for
>>>> DMA interrupts.
>>> Oh, I completely missed the model here.
>>>
>>> If you are using the bottom half/hard irq handler to read status
>>> information, the natural thing to do would be to have an irq thread, no?
>>>
>>> Not sure I see the benefit of aligning with the manager work queues -
>>> unless it makes your life simpler to avoid race conditions with
>>> cancel_work_sync()?
>> We can implement request_threaded_irq() and move the handling of
>> DMA interrupts to thread function whereas we need to handle SoundWire
>> manager interrupts in top half only. Reason as follows.
>>
>> As per our design, we are not masking the interrupts in top half and
>> restoring mask after thread execution like Intel and
>> our IP supports line based interrupts. If we move SoundWire manager
>> interrupt handling to thread function, we have observed interrupts are
>> reported but not handled properly due to thread execution is in progress
>> sometimes.
>> we will add comments for this design constraint in the code if we have to
>> go with threaded_irq implementation.
>>
>> @Bossart: we are waiting for your reply.

I am not sure I get the point about using workqueues v. threads for the
manager, which in turn makes it difficult to understand why the DMA
interrupt handling should be aligned with that of the manager interrupt
handling.

Using the combination of hard irq handler + workqueue feels odd. I may
very well 'work' but others should chime in since I am far from the most
knowledgeable reviewer in this area.

>>>>>> +static void acp63_sdw_dma_workthread(struct work_struct *work)
>>>>>> +{
>>>>>> +	struct acp63_dev_data *adata = container_of(work, struct acp63_dev_data,
>>>>>> +						    acp_sdw_dma_work);
>>>>>> +	struct sdw_dma_dev_data *sdw_dma_data;
>>>>>> +	u32 stream_index;
>>>>>> +	u16 pdev_index;
>>>>>> +
>>>>>> +	pdev_index = adata->sdw_dma_dev_index;
>>>>>> +	sdw_dma_data = dev_get_drvdata(&adata->pdev[pdev_index]->dev);
>>>>>> +
>>>>>> +	for (stream_index = 0; stream_index < ACP63_SDW0_DMA_MAX_STREAMS; stream_index++) {
>>>>>> +		if (adata->sdw0_dma_intr_stat[stream_index]) {
>>>>>> +			if (sdw_dma_data->sdw0_dma_stream[stream_index])
>>>>>> +				snd_pcm_period_elapsed(sdw_dma_data->sdw0_dma_stream[stream_index]);
>>>>>> +			adata->sdw0_dma_intr_stat[stream_index] = 0;
>>>>>> +		}
>>>>>> +	}
>>>>>> +	for (stream_index = 0; stream_index < ACP63_SDW1_DMA_MAX_STREAMS; stream_index++) {
>>>>>> +		if (adata->sdw1_dma_intr_stat[stream_index]) {
>>>>>> +			if (sdw_dma_data->sdw1_dma_stream[stream_index])
>>>>>> +				snd_pcm_period_elapsed(sdw_dma_data->sdw1_dma_stream[stream_index]);
>>>>>> +			adata->sdw1_dma_intr_stat[stream_index] = 0;
>>>>>> +		}
>>>>>> +	}
>>>>> I am not clear on the benefits of the workqueue which only tests a flag
>>>>> that's set ...
>>>> In top half, we are checking all stream irq mask and setting
>>>> corresponding stream id index in interrupt status array when dma
>>>> irq is raised.
>>>>
>>>> Our intention is to handle snd_pcm_period_elapsed in process context.
>>>> if the flag is set, call the period elapsed for the substream based on stream
>>>> id in work queue.
> 
