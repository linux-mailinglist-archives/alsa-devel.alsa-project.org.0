Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8A357A88
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 04:48:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6D121669;
	Thu,  8 Apr 2021 04:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6D121669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617850123;
	bh=UmiC282bAMMsXHJj9EvJACmeVXcmSoXHVyqBsB32djU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mh6wAH5H1BmphkLGjtr0jhf3ypyOayUssNAH0/Gw71aBa4ioro8RpvM/0Bk/e9r7B
	 FlZVqOR7FMs8giCgAWhFomfh1MndFbXN54kpIL0W6RTzv+suZMLufZGcActjf20gMP
	 YQSCj/SjYNP3hfeYmtwTE4Xu/Z8/E/cDcab3eYo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9D1CF80169;
	Thu,  8 Apr 2021 04:47:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4538F8020B; Thu,  8 Apr 2021 04:47:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE439F80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 04:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE439F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="07inNKnq"
Received: by mail-ed1-x535.google.com with SMTP id ba6so547324edb.1
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 19:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TLTSwEpxdIiajoHpJTBlK4CqLQSOMhVsmgTpBUyb6MA=;
 b=07inNKnqhLGLBYnh3MJ9vB12dLfaROs+r67izEWd3PVKrgqFVtdyp6MQXFpJBgbbQ3
 mNChvaoSAE+Bm3oVMPFihYmfdtCutqYPAFmevFw0Cl1/cvtGCvLMG8WJi+7bSTR99ABc
 wYWlXQVY6t0MFQhpcDPxWpH5tYRBE7XepPrajnM0DO3c2cwGdfYIPAVg6F8wsZ/rTVAG
 5ZY+EEupZXoWY/Na6rx/FHJctFQFqCIQrfl4iYNowxBFQo4GwfPMaWZJt2czfBxKzqE7
 j2bXOgcqSzrHEaVgm84Kc85uZBRod3lUYUCazaRXXkvt3hxR1iMWs/TVLbEkuDSw2MX1
 kNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TLTSwEpxdIiajoHpJTBlK4CqLQSOMhVsmgTpBUyb6MA=;
 b=MEm0XYcwWFRoVjDervaIRGAsHH4ehWPYNYrFORwNuRe4czOoW++FKY2p9CKomEj3RK
 OzBFmE3KoYYGtJZs0XXTbBTWIHH2w1tv2IC6DWKIm5xCRwSTnWIWwwDLAT2o/LV93C3O
 11e8hP3hgeWNPwE0ymqI+B1ttuHZhlTE/CqZ4IdtjnBKhK3WJJGSvrcEm0KpHsqYPTuB
 9NK6L9YMEIj8wbXBoGKM2vePZYaNAoLtJ/qzeXqDizI3bY+ZqL2r2LO69Nw/rb5fPaoa
 +xTcq4zgj64dng8t4L5J3UjjRXqKpD7KEPhzby5gUtL4twfy8IiL527QhKAZVEmHkKC2
 xfUA==
X-Gm-Message-State: AOAM533pFSgSdsFMLSDvB4RQjLcFEziAjvUZupvREF7ruIbu2vdp2WLf
 O3Dqz4nvMEQZHtLWler0eUrtT2Du9mrow57wU32G2Q==
X-Google-Smtp-Source: ABdhPJz1eNj9s0BLRKqEFSlGlskJ48iAT1TSf2MEEuIWOA3EfFsw19RoL0vPCl8516Wqp0rWU45Jh7xfb+Dgg61rC4A=
X-Received: by 2002:a50:aad9:: with SMTP id r25mr8438671edc.125.1617850020488; 
 Wed, 07 Apr 2021 19:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
In-Reply-To: <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Wed, 7 Apr 2021 19:46:49 -0700
Message-ID: <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

Hi Geraldo - I had the same thought and I have tried enabling playback
feedback while turning off capture feedback without my endpoint patch. It
doesn't work - at least not on the GT-1. Playback/capture fails to start.

Speaking of testing, if you (or anyone else following this discussion) have
one of these Roland/BOSS devices, it would be great if you could try
testing with playback feedback enabled and my endpoint.c workaround.

Mike

On Wed, Apr 7, 2021 at 7:21 PM Geraldo Nascimento <geraldogabriel@gmail.com>
wrote:

> Thanks, Mike, one thing I can tell you right off the bat is that if you
> turn implicit feedback sync on for both endpoints at the same time like you
> mentioned, without your workaround inside endpoint.c, they most likely will
> stall because they would both be waiting for each other to start.
>
> Have you tried engaging the generic implicit feedback sync just for the
> playback, thereby commenting out the capture implicit feedback entries, and
> re-enabling snd_usb_endpoint_implicit_feedback_sink(ep) inside endpoint.c?
> Does playback still fail to start?
>
> If you choose to perform this simple test please share with us the test's
> dyndbg logs right from the moment you turn on the device, not just after
> you start jackd.
>
> Sorry for the endless do-this, do-that. Such is the pace of teledebugging
>
>
> Em Qua, 7 de abr de 2021 21:38, Mike Oliphant <oliphant@nostatic.org>
> escreveu:
>
>> Geraldo - here is the dmesg output when starting up jackd for
>> capture/playback:
>>
>> With my patch:
>>
>> [  136.734081] usb 3-1.2: Open EP 0x8e, iface=2:1, idx=0
>> [  136.734088] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>> period_bytes=256, periods=2, implicit_fb=0
>> [  136.734092] usb 3-1.2: Setting usb interface 2:0 for EP 0x8e
>> [  136.734233] usb 3-1.2: Setting usb interface 2:1 for EP 0x8e
>> [  136.734381] usb 3-1.2: 2:1 Set sample rate 44100, clock 0
>> [  136.734388] usb 3-1.2: Setting params for data EP 0x8e, pipe 0x70480
>> [  136.734394] usb 3-1.2: Set up 12 URBS, ret=0
>> [  136.734466] usb 3-1.2: Open EP 0xd, iface=1:1, idx=0
>> [  136.734468] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>> period_bytes=256, periods=2, implicit_fb=1
>> [  136.734471] usb 3-1.2: Reopened EP 0x8e (count 1)
>> [  136.734473] usb 3-1.2: Setting usb interface 1:0 for EP 0xd
>> [  136.734605] usb 3-1.2: Setting usb interface 1:1 for EP 0xd
>> [  136.734762] usb 3-1.2: 1:1 Set sample rate 44100, clock 0
>> [  136.734774] usb 3-1.2: Setting params for data EP 0xd, pipe 0x68400
>> [  136.734781] usb 3-1.2: Set up 12 URBS, ret=0
>> [  136.734830] usb 3-1.2: Starting data EP 0xd (running 0)
>> [  136.734873] usb 3-1.2: 12 URBs submitted for EP 0xd
>> [  136.734876] usb 3-1.2: Starting data EP 0x8e (running 0)
>> [  136.734906] usb 3-1.2: 12 URBs submitted for EP 0x8e
>> [  136.740627] usb 3-1.2: Starting data EP 0x8e (running 1)
>> [  136.740634] usb 3-1.2: 2:1 Start Capture PCM
>> [  136.740635] usb 3-1.2: 1:1 Start Playback PCM
>>
>>
>> With the unpatched kernel:
>>
>> [  344.813203] usb 3-1.2: Open EP 0x8e, iface=2:1, idx=0
>> [  344.813210] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>> period_bytes=256, periods=2, implicit_fb=1
>> [  344.813213] usb 3-1.2: Open EP 0xd, iface=1:1, idx=0
>> [  344.813215] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>> period_bytes=256, periods=2, implicit_fb=0
>> [  344.813217] usb 3-1.2: Setting usb interface 2:0 for EP 0x8e
>> [  344.813367] usb 3-1.2: Setting usb interface 2:1 for EP 0x8e
>> [  344.813494] usb 3-1.2: 2:1 Set sample rate 44100, clock 0
>> [  344.813503] usb 3-1.2: Setting params for data EP 0x8e, pipe 0x70580
>> [  344.813509] usb 3-1.2: Set up 12 URBS, ret=0
>> [  344.813513] usb 3-1.2: Setting usb interface 1:0 for EP 0xd
>> [  344.813587] usb 3-1.2: Setting usb interface 1:1 for EP 0xd
>> [  344.813758] usb 3-1.2: 1:1 Set sample rate 44100, clock 0
>> [  344.813765] usb 3-1.2: Setting params for data EP 0xd, pipe 0x68500
>> [  344.813770] usb 3-1.2: Set up 2 URBS, ret=0
>> [  344.813858] usb 3-1.2: Reopened EP 0xd (count 1)
>> [  344.813883] usb 3-1.2: Starting data EP 0xd (running 0)
>> [  344.813899] usb 3-1.2: 2 URBs submitted for EP 0xd
>> [  344.819499] usb 3-1.2: Starting data EP 0x8e (running 0)
>> [  344.819532] usb 3-1.2: 12 URBs submitted for EP 0x8e
>> [  344.819535] usb 3-1.2: Starting data EP 0xd (running 1)
>> [  344.819538] usb 3-1.2: 2:1 Start Capture PCM
>> [  344.819540] usb 3-1.2: 1:1 Start Playback PCM
>> [  344.820663] usb 3-1.2: Stopping data EP 0xd (running 2)
>> [  344.820688] usb 3-1.2: Stopping data EP 0x8e (running 1)
>> [  344.820693] usb 3-1.2: 2:1 Stop Capture PCM
>> [  344.820695] usb 3-1.2: Stopping data EP 0xd (running 1)
>> [  344.820697] usb 3-1.2: 1:1 Stop Playback PCM
>> [  344.833799] usb 3-1.2: Starting data EP 0xd (running 0)
>> [  344.833852] usb 3-1.2: 2 URBs submitted for EP 0xd
>> [  344.833867] usb 3-1.2: Starting data EP 0x8e (running 0)
>> [  344.833888] usb 3-1.2: 12 URBs submitted for EP 0x8e
>> [  344.833890] usb 3-1.2: Starting data EP 0xd (running 1)
>> [  344.833891] usb 3-1.2: 2:1 Start Capture PCM
>> [  344.833893] usb 3-1.2: 1:1 Start Playback PCM
>>
>> On Wed, Apr 7, 2021 at 1:30 PM Geraldo Nascimento <
>> geraldogabriel@gmail.com> wrote:
>>
>>> Em Qua, 7 de abr de 2021 17:16, Mike Oliphant <oliphant@nostatic.org>
>>> escreveu:
>>>
>>>> Hi Geraldo - I don't have that patch applied, but it shouldn't make any
>>>> behavioral difference - it just seems to be simplifying the code.
>>>>
>>>
>>> Point taken.
>>>
>>>
>>>> The issue is that the BOSS GT-1 *does* need implicit feedback on
>>>> playback to avoid clock timing issues, and the current behavior is
>>>> disabling that feedback.
>>>>
>>>
>>> Mike, would you mind posting some dyndbg logs for both the stock
>>> behaviour and your endpoint.c/generic quirk modified behaviour?
>>>
>>> Just add snd_usb_audio.dyndbg=+p to your kernel options and please share
>>> the logs.
>>>
>>>
>>>> Mike
>>>>
>>>> On Wed, Apr 7, 2021 at 1:04 PM Geraldo Nascimento <
>>>> geraldogabriel@gmail.com> wrote:
>>>>
>>>>> Hey Mike, did you catch the latest patch by Takashi Iwai for capture
>>>>> quirky devices?
>>>>>
>>>>> You can find it here:
>>>>> https://patchwork.kernel.org/project/alsa-devel/patch/20210406113837.32041-1-tiwai@suse.de/
>>>>>
>>>>> Em Qua, 7 de abr de 2021 16:55, Mike Oliphant <oliphant@nostatic.org>
>>>>> escreveu:
>>>>>
>>>>>> I had thought that the recent implicit feedback changes were fully
>>>>>> working
>>>>>> on the BOSS GT-1, but it turns out that I just hadn't tested well
>>>>>> enough.
>>>>>>
>>>>>> Audio playback and capture works, but with periodic dropouts. I get
>>>>>> the
>>>>>> exact same behavior as I did with the quirk to completely disable
>>>>>> implicit
>>>>>> feedback. Without the implicit feedback, you get dropouts from clock
>>>>>> drift
>>>>>> - how bad probably varies from card to card. On mine it is every
>>>>>> second or
>>>>>> so.
>>>>>>
>>>>>> If I switch playback feedback for the GT-1 to generic by doing
>>>>>> "IMPLICIT_FB_GENERIC_DEV(0x0582, 0x01d6)", I get the previous old
>>>>>> behavior,
>>>>>> which is that playback completely fails to start.
>>>>>>
>>>>>> With generic playback feedback, and using my previous patch to
>>>>>> endpoint.c
>>>>>> to avoid playback waiting on capture mentioned here:
>>>>>>
>>>>>>
>>>>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-January/161951.html
>>>>>>
>>>>>> playback and capture work perfectly for me.
>>>>>>
>>>>>
