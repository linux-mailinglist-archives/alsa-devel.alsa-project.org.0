Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C447425A79
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 20:15:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2D641661;
	Thu,  7 Oct 2021 20:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2D641661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633630503;
	bh=CorTNxY65AqHDioCaz24I7yAKnSpyjqVkmJQMbfmdgQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I9LS85jwJQ5/ZF8SPOGcCc5P1F89zW+r8qdCoMs37cv7JlE2nMAvn/M8idLGXwBla
	 B+SCSZVMR4MqGPP18sjfW5jGXoK6LqiTvo1yrv2EWjBsCkWqV7U+s8AylLOcA9aPyg
	 c0OXD5O08taIYLMoZSyjLDJG3/BitpLeyuoYWBdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A7C5F80130;
	Thu,  7 Oct 2021 20:13:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F25C0F8027D; Thu,  7 Oct 2021 20:13:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF62BF80130
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 20:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF62BF80130
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="289826400"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="289826400"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 11:13:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="440362659"
Received: from klmutolo-mobl.amr.corp.intel.com (HELO [10.212.1.203])
 ([10.212.1.203])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 11:13:25 -0700
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
 <80882fe6-ea30-43f6-8d83-8995dd28c748@linux.intel.com>
 <s5hwnmo96vh.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <60c6a90b-290d-368c-ce61-4d86e70eaa78@linux.intel.com>
Date: Thu, 7 Oct 2021 13:13:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hwnmo96vh.wl-tiwai@suse.de>
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


>> Using snd_pcm_stream_lock_irqsave(be_substream, flags); will prevent
>> multiple triggers indeed, but the state management is handled by
>> dpcm_lock, so I think we have to use dpcm_lock/mutex in all BE transitions.
>>
>> if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
>>     (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
>>  			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
>>
>> if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
>>     (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
>>  			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
> 
> The stream lock can be put around those appropriate places, I suppose?

I doubled checked the code a bit more, and all functions using
be->dpcm[stream].state and be->dpcm[stream].users are protected by the
card->mutex.

The exceptions are dpcm_be_dai_trigger() and dpcm_show_state() so we
probably don't need to worry too much about these fields.

I am more nervous about that the dpcm_lock was supposed to protect. It
was added in "ASoC: dpcm: prevent snd_soc_dpcm use after free" to solve
a race condition, according to the commit log between

void dpcm_be_disconnect(
    	...
    	list_del(&dpcm->list_be);
    	list_del(&dpcm->list_fe);
    	kfree(dpcm);
    	...

and
    	for_each_dpcm_fe()
    	for_each_dpcm_be*()

That would suggest that every one of those loops should be protected,
but that's not the case at all. In some cases the spinlock is taken
*inside* of the loops.

I think this is what explains the problem reported by Gyeongtaek Lee in

https://lore.kernel.org/alsa-devel/002f01d7b4f5$c030f4a0$4092dde0$@samsung.com/

the for_each_dpcm_be() loop in dpcm_be_dai_trigger() is NOT protected.

But if we add a spin-lock in there, the atomicity remains a problem.

I think the only solution is to follow the example of the PCM case,
where the type of lock depends on the FE types, with the assumption that
there are no mixed atomic/non-atomic FE configurations.
