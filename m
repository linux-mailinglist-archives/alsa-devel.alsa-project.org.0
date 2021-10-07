Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 261914256B0
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 17:35:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A50A166B;
	Thu,  7 Oct 2021 17:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A50A166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633620913;
	bh=RZtC9SckuBYLR6n3989lXcUoUAjlvqR2cIuhENugt/k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nofaHTjGXypYDVbLCJ6QlPJp2raLgPihz72HjP6dvfstJnJBA7EUoG1UHGguL29Lx
	 o9WP/htFZXW08ZwjiPUwmL3e2RB4KR8W6HBEIjHholxSTQJUIHs+gvLy7iEt+FK9Zu
	 7PRasThXG3BBJD8umSsJJaUxQNTO4fxLuFi61MDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D873F804BD;
	Thu,  7 Oct 2021 17:33:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 117BAF804BB; Thu,  7 Oct 2021 17:33:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ACA5F80259
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 17:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ACA5F80259
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="226590145"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="226590145"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 08:24:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="440301474"
Received: from klmutolo-mobl.amr.corp.intel.com (HELO [10.212.1.203])
 ([10.212.1.203])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 08:24:48 -0700
Subject: Re: [RFC PATCH v2 0/5] ASoC: soc-pcm: fix trigger race conditions
 with shared BE
To: Takashi Iwai <tiwai@suse.de>
References: <20211004225441.233375-1-pierre-louis.bossart@linux.intel.com>
 <cce82420-d744-ee43-d514-b77ac4905ffa@nvidia.com>
 <1efa1c31-7342-05f8-5f73-95e2462d4179@linux.intel.com>
 <3683cf39-632b-50df-c65d-63779c464850@nvidia.com>
 <11257d77-9975-3b00-94da-5dc1b5c95fc6@linux.intel.com>
 <s5hk0ip9js7.wl-tiwai@suse.de>
 <ff43fede-aa66-3cb7-6365-e1f279cd135f@linux.intel.com>
 <s5hzgrk98y9.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <80882fe6-ea30-43f6-8d83-8995dd28c748@linux.intel.com>
Date: Thu, 7 Oct 2021 10:24:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hzgrk98y9.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>, vkoul@kernel.org, broonie@kernel.org,
 Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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



>>>> Takashi, Mark, do you think that an all/none assumption on FE nonatomic
>>>> properties would make sense?
>>>
>>> As long as BE's are updated from FE's PCM callback, BE has to follow
>>> the atomicity of its FE, so we can't assume all or none globally.
>>
>> A BE may have more than one FEs. That's precisely the point of
>> mixers/demux, and if the BE has FEs with different 'atomicity' then I
>> don't see how locking can work: the BE operations are run in the context
>> of each of its FE, typically using the following loop:
>>
>> for_each_dpcm_be(fe, stream, dpcm) {
>>    do_something();
>> }
> 
> Do we really have the cases where FEs have different atomicity?
> I don't think it's a valid configuration, and we should catch it via
> WARN_ON() or such.

I don't think we have this configuration today, that's why I suggested
making the assumption it's an unsupported configuration.

That would allow us to use the relevant locking mechanism, as done for
PCM streams.

>> Applications will view multiple FEs as completely independent. They may
>> be opened/prepared/started/stopped/paused as needed. When the BE is
>> shared, then there is a need for consistency, such as starting the BE
>> when the first FE becomes active and stopping it when the last FE stops.
>>
>>> How is the expected lock granularity and the protection context?  Do
>>> we need a card global lock/mutex, or is it specific to each BE
>>> substream?
>>
>> We already have a dpcm_lock at the card level, which protects the
>> addition of BEs and BE states. That spin_lock is fine for most cases.
>>
>> The only real problem is the trigger, which is currently completely
>> unprotected: we have to serialize the BE triggers, otherwise you could
>> STOP before you START due to scheduling, or other problems that I saw in
>> my SoundWire tests with two START triggers, or the STOP never sent.
> 
> So it's about calling triggers to the same BE stream concurrently?
> If that's the case, can't we simply protect the trigger handling of
> each BE like below?

Using snd_pcm_stream_lock_irqsave(be_substream, flags); will prevent
multiple triggers indeed, but the state management is handled by
dpcm_lock, so I think we have to use dpcm_lock/mutex in all BE transitions.

if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))

if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))

The position of the lock also matters, we may have to take the lock
before walking through the list, since that list can be modified. that's
what Gyeongtaek Lee reported with a separate patch, I was hoping that we
can fix all BE state handling in a consistent manner.
