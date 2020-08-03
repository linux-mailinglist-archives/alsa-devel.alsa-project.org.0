Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737E23A2E8
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 12:50:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1033D166A;
	Mon,  3 Aug 2020 12:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1033D166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596451826;
	bh=V5jrURUsMpQUB0zv+wPAxq07yLC4/o4zAUniYie7Fmc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BlfWob7RJY5fIwSjp30FhcsYJXycejZ+DYh9p5BWwOqm+4K0dp+CTHolS4mI6T+k6
	 eJTo112+18+nd/xmlWORxzFzTBpFMiiX4XZRpIJ7RJ0mhh0SFINNC/Dck7e2RehSwq
	 wA5DI8axIUWEGtf8mkNVifFWGqzTyV9p2XIs6hmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FAC6F80234;
	Mon,  3 Aug 2020 12:48:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F8C8F80218; Mon,  3 Aug 2020 12:48:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5D91F80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 12:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5D91F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="loIjvEIW"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="OYfFXFmp"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 051DEA1F7C875;
 Mon,  3 Aug 2020 12:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1596451717; bh=V5jrURUsMpQUB0zv+wPAxq07yLC4/o4zAUniYie7Fmc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=loIjvEIWDvhIf2+spLJsB5fJx17QlfBlZ9rYTa3N9Lqi7kmTcKm6eCaS0PVy0Kqa7
 4TVxSHn3NrDRJLRd72xpkOj/5Iu7+U3Xhvzax+BDkIeb/ZnlNKizionwMut2RzBF2b
 JEx6Golbyi2iA6Xdj19QPdJNYpXpCAwk6PccLIow=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IkhCY1ShWkPF; Mon,  3 Aug 2020 12:48:36 +0200 (CEST)
Received: from [192.168.100.21] (unknown [192.168.100.21])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id CC38CA1F6760B;
 Mon,  3 Aug 2020 12:48:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1596451716; bh=V5jrURUsMpQUB0zv+wPAxq07yLC4/o4zAUniYie7Fmc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OYfFXFmpkODy/nLmqNSz3uI10V936jWpQKk3XCPhUep7juGrR9gPsvgA8LWt2n7f6
 wrk8NTDXEbqiVt7LXUOlpQAuMO/5vziU6FQNDNqgv9BQq94OPv1Ctt0kL0hmPcsh3t
 jTJdX0gQIsdC54RcTZgVwReOETPDGBBhV5ILOuY4=
Subject: Re: pcm_meter.c issue at s16_update
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
References: <f56d6a67-014a-e562-c253-830c0ec03717@ivitera.com>
 <9957e124-be4b-cdc9-ffad-579b631455df@ivitera.com>
 <s5hd04ffu4m.wl-tiwai@suse.de>
 <fd493c4d-797e-d76d-771d-7c7483ffdea7@ivitera.com>
 <1cd5de43-5f67-78d3-f5e1-bbbaa8856873@ivitera.com>
 <9bad013a-0306-90e4-adc5-547ebcac1b55@ivitera.com>
 <s5hbljs6yno.wl-tiwai@suse.de>
 <142255de-556a-bc73-dfe9-df031fb79b28@perex.cz>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <b065ea69-b014-fb4d-4b6a-f814640aac8c@ivitera.com>
Date: Mon, 3 Aug 2020 12:48:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <142255de-556a-bc73-dfe9-df031fb79b28@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: cs-CZ
Content-Transfer-Encoding: 8bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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



Dne 03. 08. 20 v 9:22 Jaroslav Kysela napsal(a):
> Dne 03. 08. 20 v 8:17 Takashi Iwai napsal(a):
>> On Sun, 02 Aug 2020 19:50:44 +0200,
>> Pavel Hofman wrote:
>>>
>>>
>>> Dne 28. 07. 20 v 20:54 Pavel Hofman napsal(a):
>>>>
>>>> Dne 28. 07. 20 v 20:04 Pavel Hofman napsal(a):
>>>>> Dne 28. 07. 20 v 19:04 Takashi Iwai napsal(a):
>>>>>> Would adding atomic_add(&meter->reset, 1) in snd_pcm_meter_reset()
>>>>>> help?
>>>>>>
>>>>> Unfortunately not.
>>>>>
>>>>> s16_reset is called correctly, setting s16->old = meter->now;  But at
>>>>> that time meter->now is still 22751, setting s16->old to the same value.
>>>>>
>>>>> s16_update 1: meter->now 22751, s16->old 22751, size 0
>>>>>
>>>>> However, in the next update call meter->now comes from the freshly
>>>>> started application pointer:
>>>>>
>>>>> s16_update 1: meter->now 839, s16->old 22751, size -21912
>>>>>
>>>>>
>>>>> Of course this helps:
>>>>>
>>>>> -       if (size < 0)
>>>>> -               size += spcm->boundary;
>>>>> +       if (size < 0) {
>>>>> +               size = meter->now;
>>>>> +               s16->old = 0;
>>>>> +       }
>>>>>
>>>>> But I understand this is not a solution because:
>>>>>
>>>>> * it will not work at reaching spcm->boundary (after thousands of hours?)
>>>>> * it will cause the same problem when the stream is rewound (which is
>>>>> the problem now too) - size will equal to large meter->now (length from
>>>>> the beginning of the stream minus the rewound = large number).
>>>>>
>>>>
>>>> IMHO there are two cases of the [application pointer + delay] drop
>>>> compared to the previous run:
>>>>
>>>> * stream start, rewinding => s16->old = meter->now; size =0, i.e.
>>>> skipping the samples to show
>>>> * wrapping at spcm->boundary => size += spcm->boundary, i.e. showing the
>>>> wrapped samples
>>>>
>>>> Optionally the second case could be handled just like the first case by
>>>> resetting s16->old, assuming the boundary wrap occurs very infrequently.
>>>
>>> The following patch is tested to work OK, no CPU peaks and no meter
>>> output glitches when the size < 0 condition occurs:
>>>
>>> diff --git a/src/pcm/pcm_meter.c b/src/pcm/pcm_meter.c
>>> index 20b41876..48df5945 100644
>>> --- a/src/pcm/pcm_meter.c
>>> +++ b/src/pcm/pcm_meter.c
>>> @@ -1098,8 +1098,15 @@ static void s16_update(snd_pcm_scope_t *scope)
>>>          snd_pcm_sframes_t size;
>>>          snd_pcm_uframes_t offset;
>>>          size = meter->now - s16->old;
>>> -       if (size < 0)
>>> -               size += spcm->boundary;
>>> +       if (size < 0) {
>>> +               /**
>>> +                * Application pointer adjusted for delay (meter->now)
>>> has dropped compared
>>> +                * to the previous update cycle. Either spcm->boundary
>>> wraparound, pcm rewinding,
>>> +                * or pcm restart without s16->old properly reset.
>>> +                * In any case the safest solution is skipping this
>>> conversion cycle.
>>> +                */
>>> +               size = 0;
>>> +       }
>>>          offset = s16->old % meter->buf_size;
>>>          while (size > 0) {
>>>                  snd_pcm_uframes_t frames = size;
>>>
>>>
>>>
>>> Please will you accept this (workaround) bugfix? If so, I would send a
>>> proper patch.
>>
>> It looks OK, at least this must be safe.
>> So yes, I'll happily apply if you submit a proper patch.
> 
> It would be probably better to check against the boundary / 2 value to check
> correctly the boundary wrap instead to drop all negative size values:
> 
>    if (size < 0) {
>       if (size < -(spcm->boundary / 2))
>          size += spcm->boundary;
>       else
>          size = 0;
>    }

Is there a reliable way to detect the boundary wraparound, at best using 
some dedicated API? I could find any, IMO the wraparound does not create 
any notification. The check is OK for a rewind, half of boundary is 
usually a very large number too. I am not sure what would happen at 
reset when application pointer was already past the boundary half - see 
below.

> 
> The "hidden" pcm restart referred in the comment should not occur, otherwise
> it's another bug somewhere.

I do not know the exact moments when plugin API methods are called. The 
fact is Takashi's suggestion to call s16 reset explicitely in 
snd_pcm_meter_reset created this order:

snd_pcm_meter_reset -> s16->reset
s16_update: meter->now 22751, s16->old 22751, size 0
s16_update: meter->now 839, s16->old 22751, size -21912

I.e. AFTER resetting meter/s16 the variable meter->now was still at the 
original large 22751 (with s16->old equal to its value due to 
s16->reset). The value of meter->now was reset to 839 (= app pointer - 
delay) only in the next call of s16_update (when s16->old was still the 
previous old value => size < 0 => huge size => high CPU load).  From 
this I kind of conclude that the reset is buggy. Maybe the reset code 
should re-calculate meter->now = appl.pointer - delay before aligning 
s16->old = meter->now.

Nevertheless all this (except for the boundary wraparound) would result 
in the same size = 0, thus skipping samples from the last cycle, just 
like what the proposed patch does.


Pavel.




