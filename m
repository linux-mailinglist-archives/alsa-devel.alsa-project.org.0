Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0EA289038
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 19:45:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E25BA1682;
	Fri,  9 Oct 2020 19:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E25BA1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602265547;
	bh=6pTLRaUDbvUMhdMwlF9BsXbGHagwsZ5s/tmnkm1AGUw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eDbZ8fUNZYi1oYa5+Ixm0mvL9dVd8lKaA5/bbFwgRnm6yxYd4n5Kf4GTxLvhpKQQY
	 uDFOMXqaDhKdW8M1OvBfaHCpDLGMh1eL29GYTuSl9x+/hr6T3Ruz3zlwAIcgGyB18i
	 zoT1b5EFp88XBTorjLW32AlWxxsQQ7xJEx02YdHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70DA3F8014D;
	Fri,  9 Oct 2020 19:44:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E91E4F8015B; Fri,  9 Oct 2020 19:44:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DE61F80148
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 19:43:54 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4A3EAA0040;
 Fri,  9 Oct 2020 19:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4A3EAA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1602265433; bh=0EznXpz+tQ0zvkedrrD4GcLEUCfT8aooGR6esiUm98k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DdRBvVQXKfUJl/dZKGd6e8YLfVhPoMwYSKiA1j7M0XjUC49o1WCpUB/A3vvYr8P8j
 uMHNS1RltJFES8c/chjBLC7RhQtNGafBqbP3j/jMACLYJghj3lWhWfhbQjdJVcvHf7
 /Z5qa+vIwAdhzMeC2tzvgTlpGMkamytNN63OEUXo=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  9 Oct 2020 19:43:40 +0200 (CEST)
Subject: Re: [PATCH] ALSA: compress: allow pause and resume during draining
To: Takashi Iwai <tiwai@suse.de>, Gyeongtaek Lee <gt82.lee@samsung.com>
References: <CGME20200929084051epcas2p35fb2228ed1bdfce6a7ddf5b37c944823@epcas2p3.samsung.com>
 <000001d6963c$3cc53690$b64fa3b0$@samsung.com> <s5heemlklo0.wl-tiwai@suse.de>
 <20201001102938.GU2968@vkoul-mobl>
 <2bf52360-bd11-b4cd-b255-8a5610b4aa5f@linux.intel.com>
 <20201006062105.GQ2968@vkoul-mobl>
 <4bbc385b-d35a-8766-7981-034455287225@linux.intel.com>
 <000d01d69d58$4e2db6f0$ea8924d0$@samsung.com> <s5hr1q7sa9f.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <831bbfcf-9720-9100-8633-65932b415cab@perex.cz>
Date: Fri, 9 Oct 2020 19:43:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <s5hr1q7sa9f.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 lgirdwood@gmail.com, tiwai@suse.com, 'Vinod Koul' <vkoul@kernel.org>,
 hmseo@samsung.com, tkjung@samsung.com, pilsun.jang@samsung.com,
 s47.kang@samsung.com
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

Dne 09. 10. 20 v 17:13 Takashi Iwai napsal(a):
> On Thu, 08 Oct 2020 11:49:24 +0200,
> Gyeongtaek Lee wrote:
>>
>> On 10/06/20 11:57 PM, Pierre-Louis Bossart wrote:
>>>> The SM in kernel might be bit more convoluted so was wondering if we can
>>>> handle this in userland. The changelog for this patch says that for
>>>> test case was sending whole file, surely that is not an optimal approach.
>>>
>>> It's rather common to have to deal with very small files, even with PCM, 
>>> e.g. for notifications. It's actually a classic test case that exposes 
>>> design issues in drivers, where e.g. the last part of the notification 
>>> is not played.
>>>
>>>> Should we allow folks to send whole file to kernel and then issue
>>>> partial drain?
>>>
>>> I don't think there should be a conceptual limitation here. If the 
>>> userspace knows that the last part of the file is smaller than a 
>>> fragment it should be able to issue a drain (or partial drain if it's a 
>>> gapless solution).
>>>
>>> However now that I think of it, I am not sure what happens if the file 
>>> is smaller than a fragment. That may very well be a limitation in the 
>>> design.
>>>
>> Thanks for the comments.
>>
>> Actually, problem can be occurred with big file also.
>> Application usually requests draining after sending last frame.
>> If user clicks pause button after draining, pause will be failed
>> and the file just be played until end.
>> If application stop and start playback for this case, 
>> start of last frame will be heard again because stop sets state to SETUP,
>> and write is needed to set the state to PREPARED for start.
>> If bitrate of the file is low, time stamp will be reversed and be heard weird.
>> I also hope this problem can be handled in userspace easily but I couldn't find a way for now.
>>
>> I think that this is the time that I should share fixed patch following the comments to help the discussion.
>> Following opinions are added to the patch.
>> 1. it's be much nicer to have a new state - Takashi
> 
> Well, it wasn't me; I'm not against the new state *iff* it would end
> up with cleaner code.  Admittedly, the new state can be more
> "consistent" regarding the state transition.  If we allow the PAUSE
> state during DRAINING, it'll lead to multiple states after resuming
> the pause.
> 
>> 2. We can add this state to asound.h so the user space can be updated. - Jaroslav
>> 3. don't forget to increase the SNDRV_COMPRESS_VERSION - Jaroslav
>>
>> I'm bit wondering whether it is good to increase SNDRV_COMPRESS_VERSION
>> with a change in asound.h not in compress_offload.h.
>> Should I increase SNDRV_PCM_VERSION also?
> 
> Yes, if we really add the PCM state, it's definitely needed.
> 
>> And what happened if I request back-porting a patch which changes VERSION to stables?
> 
> If we introduce the new change, it must be safe to the old kernels,
> too.  The problem is only about the compatibility of the user-space
> program, not about the kernel.
> 
> 
> HOWEVER: I'm still concerned by the addition of a new PCM state.
> Jaroslav suggested two steps approach, (1) first add the state only in
> the uapi header, then use (2) the new state actually.  But, this
> doesn't help much, simply because the step 1 won't catch real bugs.
> 
> Even if we add a new state and change the SNDRV_PCM_STATE_LAST, I
> guess most of code can be compiled fine.  So, at the step 1, no one
> notices it and bothered, either.  But, at the step 2, you'll hit a
> problem.
> 
> Adding a new state is something like to add a new color to the traffic
> signal.  In some countries, the car turning right at a crossing
> doesn't have to stop at a red signal.  Suppose that we want to control
> it, and change the international rule by introducing a new color (say
> magenta) signal to stop the car turning right.  That'll be a big
> confusion because most drivers are trained for only red, green and
> yellow signals.
> 
> Similarly, if we add a new PCM state, every program code that deals
> with the PCM state may be confused by the new state.  It has to be
> reviewed and corrected manually, because it's no syntax problem the
> compiler may catch.

If there is a handshake between both side, this problem is gone. We can just
add another flag / ioctl / whatever to activate the new behaviour.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
