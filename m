Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA756420A7D
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 13:57:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35AAE168F;
	Mon,  4 Oct 2021 13:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35AAE168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633348648;
	bh=MWcG9NEjxgVBGm616kMEZe+ozaXZJxdLzllFjscHawQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JOESzanwVKm3whCp03r1roZrPOIempIh4djyhIT/CfVfBUALa382k/a2cb0rO1Hvg
	 hcdUXzHb87qeyRSoR0AJUzyjT69z/Sx2jO256sBKxbDzBbutmehMlHOfivxosphKA3
	 7BmqfFxm6VFIp2Hsw7tYmRiVsKGIXSQT9XUOozC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3A35F80171;
	Mon,  4 Oct 2021 13:56:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C8BFF80240; Mon,  4 Oct 2021 13:55:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=CTE_8BIT_MISMATCH, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C619F80171
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 13:55:38 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 60D04A003F;
 Mon,  4 Oct 2021 13:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 60D04A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1633348533; bh=Hf03CNHhv3KX0HwlWuKzXB0MfiOOSsJRgmR5KVU4Vdk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BWexQ1JzNJpRnPgIwSFFe6w/MoUDgLRC0gX1+iC5zoLCyIkwR+1pP9MX+HcWMDJJJ
 GF6QUtoRyF1bLLnzSe1T3r3333O+ksKdO8dEbdReWMLAZlXeFFi1UW7xElAiMlDRiz
 aKGXm+K7ysqFof+rjkkNAba+Kls2MS681w0bK1x4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  4 Oct 2021 13:55:31 +0200 (CEST)
Message-ID: <2ad744ed-5618-0ea0-e2a4-b919ee9dfeeb@perex.cz>
Date: Mon, 4 Oct 2021 13:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Alsaloop: sync mode PLAYSHIFT + Loopback on playback side
Content-Language: en-US
To: Pavel Hofman <pavel.hofman@ivitera.com>
References: <a87670e2-302b-8408-cdc2-f0f010646fdc@ivitera.com>
 <958623cd-7d0d-5329-567b-74edbbf0c16d@perex.cz>
 <b18c5b00-e3a8-14d1-15aa-c7d7c577530d@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <b18c5b00-e3a8-14d1-15aa-c7d7c577530d@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On 04. 10. 21 13:24, Pavel Hofman wrote:
> 
> Dne 04. 10. 21 v 11:24 Jaroslav Kysela napsal(a):
>> On 01. 10. 21 10:35, Pavel Hofman wrote:
>>> Hi,
>>>
>>> I added support for "Playback Pitch 1000000" ctl elem to UAC2 gadget
>>> (not submitted to USB yet) and now I am working on alsaloop support for
>>> this ctl elem. The changes are simple (tested to work perfectly, patch
>>> to follow), but during the work I hit the following issue with playback
>>> Loopback "PCM Rate Shift 100000".
>>>
>>> If the snd-aloop device is on playback side (i.e. capture from soundcard
>>> -> Loopback), the required sync mode is PLAYSHIFT. That means Loopback
>>> ctl elem "PCM Rate Shift 100000" should be controlled (by a reciprocal).
>>> That is simple by a patch like this:
>>>
>>> diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
>>> index 845ab82..619bf35 100644
>>> --- a/alsaloop/pcmjob.c
>>> +++ b/alsaloop/pcmjob.c
>>> @@ -1061,7 +1061,13 @@ static int set_rate_shift(struct loopback_handle
>>> *lhandle, double pitch)
>>>            int err;
>>>
>>>            if (lhandle->ctl_rate_shift) {
>>> -               snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift,
>>> 0, pitch * 100000);
>>> +               long value;
>>> +               if (lhandle->loopback->play == lhandle)
>>> +                       // playback => reciprocal
>>> +                       value = 1/(pitch) * 100000;
>>> +               else
>>> +                       value = pitch * 100000;
>>> +               snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift,
>>> 0, value);
>>>                    err = snd_ctl_elem_write(lhandle->ctl,
>>> lhandle->ctl_rate_shift);
>>>            } else if (lhandle->capt_pitch) {
>>>                    snd_ctl_elem_value_set_integer(lhandle->capt_pitch, 0,
>>> (1 / pitch) * 1000000);
>>> @@ -1205,15 +1211,18 @@ static int openctl(struct loopback_handle
>>> *lhandle, int device, int subdevice)
>>>            int err;
>>>
>>>            lhandle->ctl_rate_shift = NULL;
>>> +       // both play and capture
>>> +       openctl_elem(lhandle, device, subdevice, "PCM Notify",
>>> +                       &lhandle->ctl_notify);
>>> +       openctl_elem(lhandle, device, subdevice, "PCM Rate Shift 100000",
>>> +                       &lhandle->ctl_rate_shift);
>>>            if (lhandle->loopback->play == lhandle) {
>>> +               // play only
>>>                    if (lhandle->loopback->controls)
>>>                            goto __events;
>>>                    return 0;
>>>            }
>>> -       openctl_elem(lhandle, device, subdevice, "PCM Notify",
>>> -                       &lhandle->ctl_notify);
>>> -       openctl_elem(lhandle, device, subdevice, "PCM Rate Shift 100000",
>>> -                       &lhandle->ctl_rate_shift);
>>> +       // capture only
>>>            openctl_elem(lhandle, device, subdevice, "Capture Pitch
>>> 1000000",
>>>                            &lhandle->capt_pitch);
>>>            set_rate_shift(lhandle, 1);
>>>
>>>
>>> However, IIUC how the Loopback device works, the "PCM Rate Shift 100000"
>>> ctl elem applicable to device=0 on playback side is that of the capture
>>> side, i.e. for device=1. The patch above would pick the playback-side
>>> device=0 ctl elem in pcmjob.c:openctl_elem. Hard-coding the device=0 ->
>>> device=1 is possible, but Loopback supports more devices.
>>>
>>> Please what solution for picking the correct "PCM Rate Shift 100000" ctl
>>> elem for the PLAYSHIFT sync mode would you recommend?
>>
>> Hi,
>>
>> I would not touch the controls associated to the capture PCM by default.
>> It would be possible to add another alsaloop option and code to
>> configure the rate shift control identifier separately for this use
>> case. The user should avoid the double pitch control (playback +
>> capture) for the loopback devices.
> 
> Thanks for your input. I am not sure I understand correctly your intention.
> 
> The current code already avoids running playback and capture pitch
> control concurrently by one alsaloop as the loop->sync is either
> SYNC_TYPE_CAPTRATESHIFT or SYNC_TYPE_PLAYRATESHIFT. IMO the current code
> ignores SYNC_TYPE_PLAYRATESHIFT because the code jumps to
> set_rate_shift(loop->play, pitch)
> https://github.com/alsa-project/alsa-utils/blob/master/alsaloop/pcmjob.c#L1103
> but the lhandle->ctl_rate_shift elem is never set for playback side in
> pcmjob.c:openctl
> https://github.com/alsa-project/alsa-utils/blob/master/alsaloop/pcmjob.c#L1208
> (lhandle->loopback->play == lhandle). I confirmed it using the debug
> patch you accepted today (thanks! :-)).
> 
> Therefore my patch of the openctl moves the "PCM Notify" and "PCM Rate
> Shift 100000" setup before the playback check, so that lhandles of both
> directions can have the two elems configured.
> 
> But the loopback->play lhandle should configure elements for the capture
> side of the snd-aloop pipe which I do not know how to locate nicely. I
> can always use some hack "if device==0 then use device = 1" for the
> playback side etc. but that does not look nice.

Please, assume that the 'PCM Rate Shift 100000' control is for the capture PCM 
only by default. The applications should not handle those driver specific mapping.

If the user wants to use this control for the playback side, a new command 
line option may be added to cope with the alternate playback rate shift 
control indentifier (it may be parsed using snd_ctl_ascii_elem_id_parse() for 
example). So the user may specify the correct (different) device number there.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
