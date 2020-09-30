Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0073E27E798
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 13:25:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5539617DB;
	Wed, 30 Sep 2020 13:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5539617DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601465104;
	bh=t4fJYLLk5v/baZ4ozrfL7ftBEQeUgJ8sTtgn0/r7FAY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nB1dV7dfR/YQJQdUHUu10uw82szscz3tevGmhW2i4tUljLO3iNthVhUrcMqac8j6W
	 xPYOosrTls1puFyAKtC/Nrz8nuhRpXYGTcvPLm9XWQrvFWWBTTeXPGka1ehXY/0MVk
	 baqMYkC618AuQo+8H8nmax/IaTR1j4W68+DUwBZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FFACF800AB;
	Wed, 30 Sep 2020 13:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87DA3F801ED; Wed, 30 Sep 2020 13:23:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,PRX_BODY_78,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 511A7F80110
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 13:23:14 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4887DA0040;
 Wed, 30 Sep 2020 13:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4887DA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1601464994; bh=mP9oDLCKsj33GY5syGcfIGxw7Pn+xsAuLjA5WRli98I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eWrXBMeqAXOGJasmt/GNnfU1im55pcZmm+0ylJki2ZShGKlfI1ydSCeduM42e5Avs
 J9ZTgUEOFOomjtd0ltOIHKaZb4UvujAWhyKeQtAUqcdwbxfl5MLIyMgRRAD6MAIDnu
 WoGh/ICHdav9LahWxzugOu0o5AOTVbkMxN3QxEeg=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 30 Sep 2020 13:23:01 +0200 (CEST)
Subject: Re: [PATCH] ALSA: compress: allow pause and resume during draining
To: Takashi Iwai <tiwai@suse.de>
References: <CGME20200928105009epcas2p4a65d50d9d09800281395a490d1844ef3@epcas2p4.samsung.com>
 <000c01d69585$228db6b0$67a92410$@samsung.com>
 <7ba714ce-8b33-1b64-7503-6b155bf43909@perex.cz>
 <eaa35431-01f4-f858-0673-cc3b4ddf1c5a@linux.intel.com>
 <000f01d69603$10573fb0$3105bf10$@samsung.com> <s5ho8lpkqdv.wl-tiwai@suse.de>
 <e0c15222-6604-6c59-0d29-575337f7b58b@perex.cz>
 <s5h7dsbip4i.wl-tiwai@suse.de>
 <fcea8be1-cfca-1643-847c-6ca4a63f37af@perex.cz>
 <s5hzh57h7v0.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f415056d-7bc9-8b82-c75a-ab062a8ccca3@perex.cz>
Date: Wed, 30 Sep 2020 13:23:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <s5hzh57h7v0.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, lgirdwood@gmail.com,
 kimty@samsung.com, s47.kang@samsung.com,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 vkoul@kernel.org, hmseo@samsung.com, Gyeongtaek Lee <gt82.lee@samsung.com>,
 pilsun.jang@samsung.com, tkjung@samsung.com
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

Dne 30. 09. 20 v 12:33 Takashi Iwai napsal(a):
> On Wed, 30 Sep 2020 11:57:45 +0200,
> Jaroslav Kysela wrote:
>>
>> Dne 30. 09. 20 v 11:35 Takashi Iwai napsal(a):
>>> On Tue, 29 Sep 2020 19:27:17 +0200,
>>> Jaroslav Kysela wrote:
>>>>
>>>> Dne 29. 09. 20 v 9:12 Takashi Iwai napsal(a):
>>>>> On Tue, 29 Sep 2020 03:51:35 +0200,
>>>>> Gyeongtaek Lee wrote:
>>>>>>
>>>>>> On 9/28/20 11:35 PM, Pierre-Louis Bossart wrote:
>>>>>>> On 9/28/20 6:13 AM, Jaroslav Kysela wrote:
>>>>>>>> Dne 28. 09. 20 v 12:50 Gyeongtaek Lee napsal(a):
>>>>>>>>> With a stream with low bitrate, user can't pause or resume the stream
>>>>>>>>> near the end of the stream because current ALSA doesn't allow it.
>>>>>>>>> If the stream has very low bitrate enough to store whole stream into
>>>>>>>>> the buffer, user can't do anything except stop the stream and then
>>>>>>>>> restart it from the first.
>>>>>>>>> If pause and resume is allowed during draining, user experience can be
>>>>>>>>> enhanced.
>>>>>>>>
>>>>>>>> It seems that we need a new state to handle the pause + drain condition for
>>>>>>>> this case.
>>>>>>>>
>>>>>>>> With this proposed change, the pause state in drain is invisible.
>>>>>>>
>>>>>>> Indeed it's be much nicer to have a new state, e..g 
>>>>>>> SNDRV_PCM_STATE_DRAINING_PAUSED.
>>>>>> Ok. I will add the new state.
>>>>>>>
>>>>>>> One concern is that states are defined in uapi/sound/asoc.h, so wouldn't 
>>>>>>> this have impacts on userspace as well? We'd change the value of 
>>>>>>> SNDRV_PCM_STATE_LAST.
>>>>>>>
>>>>>> I also agree that adding new state and increase LAST value in the header of uapi
>>>>>> could be dangerous. So, I added it to comress_offload.h for now.
>>>>>> It could be merged into snd_pcm_state_t in someday with big changes.
>>>>>> Could you review the fixed patch below?
>>>>
>>>> I don't see a big problem to improve the API, but don't forget to increase the
>>>> SNDRV_COMPRESS_VERSION, so the user space apps can check for this new behaviour.
>>>>
>>>>> Hrm, this resulted in rather more complex changes than the original
>>>>> patch.  It shows that introducing yet another state is no good idea
>>>>> for this particular case.
>>>>
>>>> I don't think so. The states should be isolated and it's clearly a new state
>>>> and the resulted code at least gives a commented idea, what's going on. It
>>>> seems that the compress driver state is not exported to the user space at the
>>>> moment, so I would consider this extension as harmless. We can add this state
>>>> to asound.h so the user space can be updated. We may use this state for the
>>>> standard PCM devices one day, too. It makes sense to reserve it sooner than later.
>>>
>>> Well, adding a new state can be cumbersome sometimes. For example, the
>>> code like below may hit a segfault out of sudden after the upgrade:
>>>
>>> 	const char *states[SNDRV_PCM_STATE_LAST + 1] = {
>>> 		[SNDRV_PCM_STATE_RUNNING] = "running",
>>> 		....
>>> 	};
>>>
>>> 	printf("current state = %s\n", states[s]);
>>>
>>> It's not much frequent breakage, but this can give certainly some
>>> incompatibilities even in the source code level.
>>
>> alsa-lib has already the correct protection for this case:
>>
>> const char *snd_pcm_state_name(const snd_pcm_state_t state)
>> {
>>         if (state > SND_PCM_STATE_LAST)
>>                 return NULL;
>>         return snd_pcm_state_names[state];
>> }
>>
>> If there's no check, it's a clear bug.
> 
> That's not what I meant; the code I showed was just an example
> implying that the addition of a new state may require the deep code
> change that can't be caught by a compiler.  It may be silently
> broken.
> 
> And imagine the user-space library code that contains handling of the
> PCM state.  All those has to be updated as well to deal with a new
> state, not only alsa-lib.
> 
> IOW, by adding a new item to an exposed attribute like PCM state, the
> possibly needed change would be spread over all lib / application
> code, and its influence shouldn't be underestimated.  If it were only
> some internal change in alsa-lib, I won't be concerned at all.
> 
>>> That's the reason I'm reluctant to add a new state unless it's a must.
>>> As mentioned, the expected application's behavior is just like the
>>> normal pause state, either resuming pause or dropping.  The only case
>>> where a new state would help for application is at most that they may
>>> foresee beforehand which state it'll go after the resume, to drain or
>>> to running.  If this is a must-to-have feature, we can reconsider.
>>
>> I don't agree here. It's much better to not hide the state related transitions
>> even in the kernel in my eyes. For example drivers may behave differently when
>> they resume from running+pause or drain+pause states.
> 
> Yes, but that's basically the driver's business.  As mentioned, "if
> this is a must-to-have feature" for applications, we'll need to
> reconsider.  But it's not clear from the scenario yet.
> (FWIW, if any, we may add another function to tell the after-resume
> state, too; this might be even safer from the compatibility POV,
> although it can be more complicated.)
> 
>> The correct SNDRV_PCM_STATE_LAST is just an implementation issue, which can be
>> easily solved.
> 
> How easily solvable -- that's the question :)

My proposal is reasonable - use the new state only internally in the kernel
for the moment, but update the headers and SNDRV_PCM_STATE_LAST now so the
depending code can be updated until the new state is exposed to the user
space, too. Something like future reservation. I believe that we need this
state also for the standard PCM API.

The SNDRV_PCM_STATE_LAST was added because it was supposed to be changed. It
great to keep the 100% driver compatibility but not if it forces us to do
hidden changes.

Another way is to activate the new state (and behaviour) conditionally using a
new parameter / flag or so from the user space. In this case, both sides know
what to do.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
