Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9842A7B8
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 16:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B4D8168D;
	Tue, 12 Oct 2021 16:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B4D8168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634050590;
	bh=ThdmByDjDeUDIS+TR7RAO9cKl9cDDcDUXXfVAx7aSF8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oVdTftpcZ5HZ2KcHCKCclFmTkrjLVrr6movTt+HbArCGI9brdIMkiU2TAdlFJOmbk
	 sWWTbcrHGgXEYtOrFAWQtmKbZKd9ahkOiaXuxxrbdHgkrNE5SlS6WR9bIiqVFqApWR
	 wuxqwx0ClV+A3GesWzwcOf2557KaqTixz/Up4Bmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72C71F80302;
	Tue, 12 Oct 2021 16:55:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BA36F80245; Tue, 12 Oct 2021 16:55:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D31E5F80088
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 16:55:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D31E5F80088
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="290662537"
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="290662537"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 07:54:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="486417507"
Received: from csharp1-mobl.amr.corp.intel.com (HELO [10.213.183.127])
 ([10.213.183.127])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 07:54:54 -0700
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
 <60c6a90b-290d-368c-ce61-4d86e70eaa78@linux.intel.com>
 <s5hily88rri.wl-tiwai@suse.de>
 <75894aba-ca1a-51d6-df7d-ad53fcd89f79@linux.intel.com>
 <s5hee8w82ng.wl-tiwai@suse.de>
 <e9340874-320a-8fc6-f3a4-9cf77f85db25@linux.intel.com>
 <s5hczof7eoq.wl-tiwai@suse.de>
 <dcdb8f74-51db-86a1-959f-909dfac22b26@linux.intel.com>
 <29397354-dc5b-7837-c71b-df4bde707df2@linux.intel.com>
 <8c1353f0-e897-e7b0-c7b9-5712b05ac91f@linux.intel.com>
 <s5htuhm3g68.wl-tiwai@suse.de> <s5h1r4q34ot.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9d336461-b2fe-8cd4-0096-356620622f8d@linux.intel.com>
Date: Tue, 12 Oct 2021 08:45:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5h1r4q34ot.wl-tiwai@suse.de>
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


>>> And indeed there's a deadlock!
>>>
>>> snd_pcm_period_elapsed() takes the FE pcm stream lock, and will call
>>> snd_pcm_trigger.
>>
>> Indeed, this would deadlock.
>>
>>> So if we also take the pcm stream lock in the BE
>>> trigger, there's a conceptual deadlock: we painted ourselves in a corner
>>> by using the same lock twice.
>>>
>>> Takashi, are you really sure we should protect these for_each_dpcm_be()
>>> loops with the same pcm lock?
>>
>> The call within the FE lock is done only in dpcm_dai_trigger_fe_be(),
>> and this should call dpcm_be_dai_trigger() as is.  In other places,
>> the calls are without FE lock, hence they can take the lock,
>> e.g. create a variant dpcm_dai_trigger_fe_be_lock().
> 
> Or rather it was the code path of snd_soc_dpcm_check_state()?
> The function could be called from dpcm_be_dai_trigger().
> Currently dpcm_lock seems to be added at places casually covering some
> of the for_each_dpcm_be() or whatever...  The whole lock scheme has to
> be revisited.
> 
>>> it seems like asking for trouble to
>>> revisit the ALSA core just to walking through a list of BEs? Would you
>>> object to changing dpcm_lock as I suggested, but not interfering with
>>> stream handling?
>>
>> That would work, too, it's just a pity to degrade the fine-grained
>> locks that have been already taken into global locks...
> 
> For the performance problem, at least, you can make it rwlock and
> rwsem types (depending on nonatomic) so that the concurrent accesses
> would work.  The only exclusive lock is the case for adding and
> removing the entries, which should be done with write lock / sem down,
> while other link traversals can be executed in the read lock / sem.

Thanks Takashi for your feedback.

Let's first get the locking right. We can optimize performance later.

I will continue with the idea of using existing fine-grained locks a bit
more, I am with you that this dpcm_lock was not added in a consistent
way and reusing the concept is really building on sand.

We can remove the lock in snd_soc_dpcm_check_state, I already did the
change in other versions. But what I'll need to check further is if
indeed dpcm_be_dai_trigger() is called with the FE lock taken already.
Adding a lockdep_assert_help() or something would help I guess.

The part where I am still not clear is that snd_pcm_period_elapsed uses
the irqsave/irqrestore version, but in the initial code you suggested
the vanilla irq version is fine. I am not sure I get the nuance here,
and btw in the case of SOF the snd_pcm_period_elapsed is called from a
workqueue, not an interrupt handler, as a work-around to avoid an IPC
deadlock, so we probably don't need the irqsave/irqrestore version anyways.
