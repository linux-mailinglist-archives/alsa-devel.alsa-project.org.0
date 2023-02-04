Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E18468C139
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 16:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF08A1EB;
	Mon,  6 Feb 2023 16:20:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF08A1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675696875;
	bh=VY/4txuOr/CHvl+E4Ut2tqQwAqaXZViNwIEQb0oI0f0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HXZ0ve2PS+Pd+cPs2Er3qD3XWe843q9A8yZuQ7389IfIqtdvcbVZOdp4pZbLlPCK5
	 azXO4/u5i74CfwKBXRL+O2YP8SqOI/6NzHeNHsuASZnmrPx09NVHWymsQ0hPI40eCS
	 peW5d3aS25tPkMEGRr+I/JJkvAVd3HLlf3DfDchY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1C57F804E7;
	Mon,  6 Feb 2023 16:20:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21282F804FB; Mon,  6 Feb 2023 16:20:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F109F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 16:20:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F109F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bWODPXG1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675696810; x=1707232810;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VY/4txuOr/CHvl+E4Ut2tqQwAqaXZViNwIEQb0oI0f0=;
 b=bWODPXG19R6y3irt2iQAZafA60ZM9repLjW61xLPyX8EnDMeGeFuRdli
 cy+JhG55QGeH8rT4cL5tF84Mjo7i1TEz7XhWbnP60YzHw1n8wEWrneNgr
 x0hibH9mlqIkq0g8FFvNG6eiIXw3uqdY4wl4KAW83TIxfFhB1dVwmETzk
 gq+IE81ineWE3qKyBBnKlecYruAF9P2ba56+gZVe30tJfyYxTF29sbJJx
 oWthu2FsdtFsQr79OAI2rQZhoM+lD4aNZHAWtr5+OhCtrtkmFqzoKLMKC
 nHgMHvj20fSas9KEcTXPrgl+7JrhxNg6KAl6/znhbDyIIGQeNccBAfHdN A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="331360719"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="331360719"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 07:20:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="696888657"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="696888657"
Received: from pmagdum-mobl1.amr.corp.intel.com (HELO [10.209.159.190])
 ([10.209.159.190])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 07:20:01 -0800
Message-ID: <4398e3f3-ea2f-1e23-d64b-39723e4790d2@linux.intel.com>
Date: Fri, 3 Feb 2023 18:54:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: Overflow in calculating audio timestamp
To: Jaroslav Kysela <perex@perex.cz>, Alan Young <consult.awy@gmail.com>,
 o-takashi@sakamocchi.jp
References: <70ff4e3a-b171-131c-a039-4fc99aa4bbfc@gmail.com>
 <Y9xWlbhPg3PteH5G@workstation>
 <2598bf64-708c-cf62-e634-44db5a850226@gmail.com>
 <74350bce-a6ea-c3b8-7b00-4deb47f7e623@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <74350bce-a6ea-c3b8-7b00-4deb47f7e623@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 2/3/23 12:02, Jaroslav Kysela wrote:
> On 03. 02. 23 17:11, Alan Young wrote:
>>
>> On 03/02/2023 00:34, Takashi Sakamoto wrote:
>>> Hi,
>>>
>>> Thank you for the report.
>>>
>>> On Thu, Feb 02, 2023 at 01:55:24PM +0000, Alan Young wrote:
>>>> sound/core/pcm_lib.c:update_audio_tstamp() contains the following
>>>> calculation:
>>>>
>>>>           audio_nsecs = div_u64(audio_frames * 1000000000LL,
>>>>                   runtime->rate);
>>>>
>>>> This will result in a 64-bit overflow after 4.4 days at 48000 Hz, or
>>>> 1.1
>>>> days at 192000.
>>>>
>>>> Are you interested in a patch to improve this?
>>>>
>>>> The same calculation occurs in a couple of other places.
>>> I'm interested in your patch. Would you please post it C.C.ed to the
>>> list and me?  As you noted, we can see the issue in ALSA PCM core and
>>> Intel HDA stuffs at least.
>>>
>>>    * sound/core/pcm_lib.c
>>>    * sound/pci/hda/hda_controller.c
>>>    * sound/soc/intel/skylake/skl-pcm.c
>>>
>>> I note that 'NSEC_PER_SEC' macro is available once including
>>> 'linux/time.h'. It is better to use instead of the literal.
>>> The macro is defined in 'include/vdso/time64.h'.
>>>
>>>
>>> As another issue, the value of 'audio_frames' comes from the value of
>>> 'struct snd_pcm_runtime.hw_ptr_wrap'. In ALSA PCM core, the value is
>>> increased by the size of PCM buffer every time hw_ptr cross the boundary
>>> of PCM buffer, thus multiples of the size is expected. Nevertheless,
>>> there is no check for overflow within 64 bit storage. In my opinion, the
>>> committer had less care of it since user does not practically
>>> playback or
>>> capture PCM substream so long. But the additional check is preferable as
>>> long as it does not break the fallback implementation of audio time
>>> stamp.
>>
>>
>> I have not yet finished testing various alternatives. I want to extend
>> the overflow by "enough" and also am conscious of the need to keep the
>> overhead down.
>>
>> I actually think, on reflection, that the only case that matters is the
>> call from update_audio_tstamp(). The others only deal with codec delays
>> which will be small (unless I misunderstand those drivers).
>>
>> This is what I have so far but I'll submit a proper patch when I have it
>> refined.
>>
>> static u64 snd_pcm_lib_frames_to_nsecs(u64 frames, unsigned int rate)
>> {
>>       /*
>>        *  Avoid 64-bit calculation overflow after:
>>        *  - 4.8 days @ 44100
>>        *  - 0.56 days @ 384000
>>        *  extending these intervals by a factor of 100.
>>        */
>>       if (frames < 0xffffffffffffffffLLU / NSEC_PER_SEC)
>>           return div_u64(frames * NSEC_PER_SEC, rate);
>>
>>       if (rate % 100 == 0)
>>           return div_u64(frames * (NSEC_PER_SEC/100), (rate/100));
>>
>>       /* Fallback: reduce precision to approximately
>> deci-micro-seconds: 1.28e-7 */
>>       return div_u64(frames * (NSEC_PER_SEC >> 7), rate) << 7;
>> }
> 
> Thank you for your suggestion, but I think that the *whole* code for
> !get_time_info in update_audio_tstamp() should be recoded. The calling
> of ns_to_timespec64() is not enough to handle the boundary wraps in a
> decent range (tenths years for 24x7 operation) and the bellow code is
> dangerous for 32-bit apps / system:
> 
>      if (crossed_boundary) {
>                 snd_BUG_ON(crossed_boundary != 1);
>                 runtime->hw_ptr_wrap += runtime->boundary;
>      }
> 
> I would probably propose to have just hw_ptr_wrap +1 counter (we can
> reconstruct the frame position back by multiplication and do range check
> later), remove snd_BUG_ON and improve the timespec64 calculation.
> 
> The calculation should be split to two parts (tv_sec / tv_nsec):
> 
> 1) calculate seconds: (frames / rate)
> 2) calculate the remainder (ns): ((frames % rate) * NSEC_PER_SEC) / rate
> 
> With 64-bit integer range, we should go up to (for 384000Hz rate):
> 
> 2**64 / 384000 / 3600 / 24 / 365 = ~1523287 years
> 
> Maybe I did a mistake somewhere. I'm open for comments.

I am not following how the boundary comes into play for cases where the
timestamp comes directly from a link counter, and is not related to the
DMA hw_ptr at all.
