Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C1E23A038
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 09:24:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 327001667;
	Mon,  3 Aug 2020 09:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 327001667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596439467;
	bh=tQMF/nrizJ3xQXI1bYicleLzU1k0h2Q75oosf7yLe0E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZgBndG/oelqf/a5+V6wbEVo6wvABj+7lJwdO4w0c6WKcc2+V20q49CBeS745Adp14
	 oB0/CKKfBXSzFBIW0A9lmExUfWx6RkfHbwpow9zH2tScjrfk5BnO+sS0qU9M2JAmrA
	 48wCOG4IwpCsZYAtioDWr8620XfIbA7TjQusMy9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66F6BF800BD;
	Mon,  3 Aug 2020 09:22:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E0ABF80218; Mon,  3 Aug 2020 09:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96555F800BD
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 09:22:32 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2921FA003F;
 Mon,  3 Aug 2020 09:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2921FA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1596439352; bh=648IxudvmiieHglwJ5XbezTnde0tJRrLUP5/Oo1RHvQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=N3R+jRTONMA5yKxml3zZ0+dmKtbIw2cfcHbx8+492ii5pbPUyY+7UcWc3dxdFrezE
 Ae92cDP9pS05Msy3GSqKyjH/573ErweVFg0Kiint5dxwpqzJvRn2REBKPm0x4nptwY
 ABuBIbnsmVn6YLbrjhcenx8pgQLrw1QjNwcY+DuE=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  3 Aug 2020 09:22:29 +0200 (CEST)
Subject: Re: pcm_meter.c issue at s16_update
To: Takashi Iwai <tiwai@suse.de>, Pavel Hofman <pavel.hofman@ivitera.com>
References: <f56d6a67-014a-e562-c253-830c0ec03717@ivitera.com>
 <9957e124-be4b-cdc9-ffad-579b631455df@ivitera.com>
 <s5hd04ffu4m.wl-tiwai@suse.de>
 <fd493c4d-797e-d76d-771d-7c7483ffdea7@ivitera.com>
 <1cd5de43-5f67-78d3-f5e1-bbbaa8856873@ivitera.com>
 <9bad013a-0306-90e4-adc5-547ebcac1b55@ivitera.com>
 <s5hbljs6yno.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <142255de-556a-bc73-dfe9-df031fb79b28@perex.cz>
Date: Mon, 3 Aug 2020 09:22:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hbljs6yno.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Dne 03. 08. 20 v 8:17 Takashi Iwai napsal(a):
> On Sun, 02 Aug 2020 19:50:44 +0200,
> Pavel Hofman wrote:
>>
>>
>> Dne 28. 07. 20 v 20:54 Pavel Hofman napsal(a):
>>>
>>> Dne 28. 07. 20 v 20:04 Pavel Hofman napsal(a):
>>>> Dne 28. 07. 20 v 19:04 Takashi Iwai napsal(a):
>>>>> Would adding atomic_add(&meter->reset, 1) in snd_pcm_meter_reset()
>>>>> help?
>>>>>
>>>> Unfortunately not.
>>>>
>>>> s16_reset is called correctly, setting s16->old = meter->now;  But at
>>>> that time meter->now is still 22751, setting s16->old to the same value.
>>>>
>>>> s16_update 1: meter->now 22751, s16->old 22751, size 0
>>>>
>>>> However, in the next update call meter->now comes from the freshly
>>>> started application pointer:
>>>>
>>>> s16_update 1: meter->now 839, s16->old 22751, size -21912
>>>>
>>>>
>>>> Of course this helps:
>>>>
>>>> -       if (size < 0)
>>>> -               size += spcm->boundary;
>>>> +       if (size < 0) {
>>>> +               size = meter->now;
>>>> +               s16->old = 0;
>>>> +       }
>>>>
>>>> But I understand this is not a solution because:
>>>>
>>>> * it will not work at reaching spcm->boundary (after thousands of hours?)
>>>> * it will cause the same problem when the stream is rewound (which is
>>>> the problem now too) - size will equal to large meter->now (length from
>>>> the beginning of the stream minus the rewound = large number).
>>>>
>>>
>>> IMHO there are two cases of the [application pointer + delay] drop
>>> compared to the previous run:
>>>
>>> * stream start, rewinding => s16->old = meter->now; size =0, i.e.
>>> skipping the samples to show
>>> * wrapping at spcm->boundary => size += spcm->boundary, i.e. showing the
>>> wrapped samples
>>>
>>> Optionally the second case could be handled just like the first case by
>>> resetting s16->old, assuming the boundary wrap occurs very infrequently.
>>
>> The following patch is tested to work OK, no CPU peaks and no meter
>> output glitches when the size < 0 condition occurs:
>>
>> diff --git a/src/pcm/pcm_meter.c b/src/pcm/pcm_meter.c
>> index 20b41876..48df5945 100644
>> --- a/src/pcm/pcm_meter.c
>> +++ b/src/pcm/pcm_meter.c
>> @@ -1098,8 +1098,15 @@ static void s16_update(snd_pcm_scope_t *scope)
>>         snd_pcm_sframes_t size;
>>         snd_pcm_uframes_t offset;
>>         size = meter->now - s16->old;
>> -       if (size < 0)
>> -               size += spcm->boundary;
>> +       if (size < 0) {
>> +               /**
>> +                * Application pointer adjusted for delay (meter->now)
>> has dropped compared
>> +                * to the previous update cycle. Either spcm->boundary
>> wraparound, pcm rewinding,
>> +                * or pcm restart without s16->old properly reset.
>> +                * In any case the safest solution is skipping this
>> conversion cycle.
>> +                */
>> +               size = 0;
>> +       }
>>         offset = s16->old % meter->buf_size;
>>         while (size > 0) {
>>                 snd_pcm_uframes_t frames = size;
>>
>>
>>
>> Please will you accept this (workaround) bugfix? If so, I would send a
>> proper patch.
> 
> It looks OK, at least this must be safe.
> So yes, I'll happily apply if you submit a proper patch.

It would be probably better to check against the boundary / 2 value to check
correctly the boundary wrap instead to drop all negative size values:

  if (size < 0) {
     if (size < -(spcm->boundary / 2))
        size += spcm->boundary;
     else
        size = 0;
  }

The "hidden" pcm restart referred in the comment should not occur, otherwise
it's another bug somewhere.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
