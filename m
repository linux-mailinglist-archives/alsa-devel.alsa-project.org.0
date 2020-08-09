Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B502F23FFF7
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Aug 2020 22:31:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29D0111C;
	Sun,  9 Aug 2020 22:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29D0111C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597005086;
	bh=hiQ9Xh2GTSyIA8yfX1EMZeNcuu7Q9b8FPmUvt9/Qvn8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TWz6+QrIQNnvqxhE/qk2evIMu49a1WVNZCQxlKjJ1kk+Y0uXaZQM9LgVBNX/AUFa/
	 a4b798bv20+ZaEeuKu1AoCDGjoMKGBGAl5pw4bC+BAtiXFrEGhSOC4AeJGQBEbdz0i
	 pomx16+vcQ30qz25r6VrAoO8Usps83SxPHirGMao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CC57F800BC;
	Sun,  9 Aug 2020 22:29:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BC9BF8015B; Sun,  9 Aug 2020 22:29:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 023DEF800BC
 for <alsa-devel@alsa-project.org>; Sun,  9 Aug 2020 22:29:35 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 11C35A003F;
 Sun,  9 Aug 2020 22:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 11C35A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1597004975; bh=LtjKjS2avoWAFU8bI0vbfSBwyCYkt2964eAY1+ZnhTk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=D4GszW2qkLBw6K0Lxwk78bArgdJ/7NLL9LufCZwbHEkjyCvDuCI3ho2kpQcxfHeF/
 sKA5uaJwEERZIJ8ktQ4QoqOntPQbA3LqAitFadZ0Uf1QAFzg409DAtPFliX0AYG3dU
 NsbvPMgAFxV5oXc56k/aZiKFRqUB3NFLwtLrKC14=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun,  9 Aug 2020 22:29:31 +0200 (CEST)
Subject: Re: pcm_meter.c issue at s16_update
To: Pavel Hofman <pavel.hofman@ivitera.com>, Takashi Iwai <tiwai@suse.de>
References: <f56d6a67-014a-e562-c253-830c0ec03717@ivitera.com>
 <9957e124-be4b-cdc9-ffad-579b631455df@ivitera.com>
 <s5hd04ffu4m.wl-tiwai@suse.de>
 <fd493c4d-797e-d76d-771d-7c7483ffdea7@ivitera.com>
 <1cd5de43-5f67-78d3-f5e1-bbbaa8856873@ivitera.com>
 <9bad013a-0306-90e4-adc5-547ebcac1b55@ivitera.com>
 <s5hbljs6yno.wl-tiwai@suse.de>
 <142255de-556a-bc73-dfe9-df031fb79b28@perex.cz>
 <b065ea69-b014-fb4d-4b6a-f814640aac8c@ivitera.com>
 <d5ff25fb-f95e-5039-9668-6f2600efeb16@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <99077d2f-211a-ccae-cbe5-d0e78127cac7@perex.cz>
Date: Sun, 9 Aug 2020 22:29:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d5ff25fb-f95e-5039-9668-6f2600efeb16@ivitera.com>
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

Dne 09. 08. 20 v 9:05 Pavel Hofman napsal(a):
> Dne 03. 08. 20 v 12:48 Pavel Hofman napsal(a):
>>
>>
>> Dne 03. 08. 20 v 9:22 Jaroslav Kysela napsal(a):
>>> Dne 03. 08. 20 v 8:17 Takashi Iwai napsal(a):
>>>> On Sun, 02 Aug 2020 19:50:44 +0200,
>>>>>>
>>>>>> Optionally the second case could be handled just like the first
>>>>>> case by
>>>>>> resetting s16->old, assuming the boundary wrap occurs very
>>>>>> infrequently.
>>>>>
>>>>> The following patch is tested to work OK, no CPU peaks and no meter
>>>>> output glitches when the size < 0 condition occurs:
>>>>>
>>>>> diff --git a/src/pcm/pcm_meter.c b/src/pcm/pcm_meter.c
>>>>> index 20b41876..48df5945 100644
>>>>> --- a/src/pcm/pcm_meter.c
>>>>> +++ b/src/pcm/pcm_meter.c
>>>>> @@ -1098,8 +1098,15 @@ static void s16_update(snd_pcm_scope_t *scope)
>>>>>          snd_pcm_sframes_t size;
>>>>>          snd_pcm_uframes_t offset;
>>>>>          size = meter->now - s16->old;
>>>>> -       if (size < 0)
>>>>> -               size += spcm->boundary;
>>>>> +       if (size < 0) {
>>>>> +               /**
>>>>> +                * Application pointer adjusted for delay (meter->now)
>>>>> has dropped compared
>>>>> +                * to the previous update cycle. Either spcm->boundary
>>>>> wraparound, pcm rewinding,
>>>>> +                * or pcm restart without s16->old properly reset.
>>>>> +                * In any case the safest solution is skipping this
>>>>> conversion cycle.
>>>>> +                */
>>>>> +               size = 0;
>>>>> +       }
>>>>>          offset = s16->old % meter->buf_size;
>>>>>          while (size > 0) {
>>>>>                  snd_pcm_uframes_t frames = size;
>>>>>
>>>>>
>>>>>
>>>>> Please will you accept this (workaround) bugfix? If so, I would send a
>>>>> proper patch.
>>>>
>>>> It looks OK, at least this must be safe.
>>>> So yes, I'll happily apply if you submit a proper patch.
>>>
>>> It would be probably better to check against the boundary / 2 value to
>>> check
>>> correctly the boundary wrap instead to drop all negative size values:
>>>
>>>    if (size < 0) {
>>>       if (size < -(spcm->boundary / 2))
>>>          size += spcm->boundary;
>>>       else
>>>          size = 0;
>>>    }
>>
>> Is there a reliable way to detect the boundary wraparound, at best using
>> some dedicated API? I could find any, IMO the wraparound does not create
>> any notification. The check is OK for a rewind, half of boundary is
>> usually a very large number too. I am not sure what would happen at
>> reset when application pointer was already past the boundary half - see
>> below.

Yes, it's a good argument. In this case, the s16->old value is not properly
synced during the reset operation, otherwise the boundary / 2 threshold
(change limit) is sufficient to detect the boundary wrap.

>>> The "hidden" pcm restart referred in the comment should not occur,
>>> otherwise
>>> it's another bug somewhere.
>>
>> I do not know the exact moments when plugin API methods are called. The
>> fact is Takashi's suggestion to call s16 reset explicitely in
>> snd_pcm_meter_reset created this order:
>>
>> snd_pcm_meter_reset -> s16->reset
>> s16_update: meter->now 22751, s16->old 22751, size 0
>> s16_update: meter->now 839, s16->old 22751, size -21912
>>
>> I.e. AFTER resetting meter/s16 the variable meter->now was still at the
>> original large 22751 (with s16->old equal to its value due to
>> s16->reset). The value of meter->now was reset to 839 (= app pointer -
>> delay) only in the next call of s16_update (when s16->old was still the
>> previous old value => size < 0 => huge size => high CPU load).  From
>> this I kind of conclude that the reset is buggy. Maybe the reset code
>> should re-calculate meter->now = appl.pointer - delay before aligning
>> s16->old = meter->now.
>>
>> Nevertheless all this (except for the boundary wraparound) would result
>> in the same size = 0, thus skipping samples from the last cycle, just
>> like what the proposed patch does.
>>
>>
> 
> Please can we reach a decision and close the problem so that affected
> use cases do not have to be patched with the next the alsa-lib version?

I think that this problem should be fixed for reset and rewind separately. The
meter->reset should be set in snd_pcm_meter_reset() inside the running_mutex
lock to serialize correctly the update operations in the
snd_pcm_meter_thread(). And perhaps, we can follow this logic for the rewind.

I mean, we should ensure to call the s16->reset at the proper time to avoid
broken old/now combinations inside the scope "clients".

Your proposed solution is just a workaround.

						Jaroslav

> 
> Thanks a lot in advance,
> 
> Pavel.
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
