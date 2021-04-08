Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7C5358EC9
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 22:55:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C511C1679;
	Thu,  8 Apr 2021 22:55:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C511C1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617915354;
	bh=qg6a1yx2FxWB0Nt/MrTtIMJOtnGYkaFNyw14XGv2rfk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dYifPnU5C+a8m0cEdBN0LxvVXQh96B2w5UY23aYf6TS+BtYGG75Me9wQ0Dx4BwrYS
	 6RatJnQLlRH2SSL3eKWuC5IY7yXBYrlbOdGmfaiFhwFx9hDZVDro3WzUlicQd+hL7A
	 4gd0+wIg2lJB2FftyZGmqlYAXwUZzRYeiSh3nbRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39F9AF8012F;
	Thu,  8 Apr 2021 22:54:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FCBDF80162; Thu,  8 Apr 2021 22:54:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C288DF80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 22:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C288DF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="2LZzq/L9"
Received: by mail-yb1-xb2b.google.com with SMTP id o10so4184601ybb.10
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 13:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gB/2QnoB4DkHWBJYTndAlVGZuqP7KhvUdxbUr8AasYI=;
 b=2LZzq/L97suDw+JGvJd+TuDkTdJwPXVwy+XCFHU6J8qjluywBaQgUimKhcpNISpnxJ
 7myGmy61JFdJVC/S/9YjuwHz9ERjACpvSe+z/1arlruSQPAWB3XLMcdiulruNeVqcH0h
 ceujZeUbtyg4q4p9Rd90a+vpeFzRhW5Fya3hA8ygeTI2zH5b1KjmybzLIDhfuvu1DzXy
 X6WAB0WWeXJEw2DVLjlSahxKcsly+m9N+Nl2fPJdxBFOVg3UwCsgziZuf6hZp6ZLQlWW
 ChEYBDXKmGFCqqXHM12yVKigWJf8AhidV2z+OQ2TkoHvZPioBMoGSt/N1CSnFNTCE/Gj
 WjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gB/2QnoB4DkHWBJYTndAlVGZuqP7KhvUdxbUr8AasYI=;
 b=jCFkUtSTHzIkCQeAK3R7UslygJIlF1mEoVqJCAmks6jeqhiY4Rkgr1PCqqF7E1HyMR
 JEhZjeU3+Jbok7/dcIMicZA35n4Ts6aMOyWSn5sQAnTLk9OBHq54dUp4lBVVu/hsJ58C
 FMuAq48IF/5EAoGsaMD+6hOXDYGS5VMHBmqAp+Lk3/RvSzt/Wl1Mn/arnvEX74aDJb2A
 Os2Yd5xiT6wIBU/jtoNq99UpbOMeS6k29AF0B3PZGIj6FSowm2FEUowXjj76EPTV+hMY
 8cATFqbTItI+Bvym5/swgKHk84mhJ39FsjsLOZvu4QyeUMfB/N0X9hUYSIc7eqI7vNns
 +E+w==
X-Gm-Message-State: AOAM532AX2r9Dj2n+9GALH/fV1hso/Yq6kfBqmiPDnAOi3H504ALICZn
 6blKOSRelDEo1CuaROkcNk+zMlsTawBfVE2boc+k+w==
X-Google-Smtp-Source: ABdhPJwzJ+xmzVlgLmZalstYQSSjL3wZTEC9bGl31CpJ1+/w6KIlpbSme+3s8B40TaYnlO2pPcHytrhPn/gvbihySFc=
X-Received: by 2002:a25:9942:: with SMTP id n2mr14144223ybo.230.1617915253812; 
 Thu, 08 Apr 2021 13:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
 <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
 <CAEsQvcsCJUi8eP_t8MGUKf0zSf7Zmqiof8b0fmk-XhZtUScbmg@mail.gmail.com>
 <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
 <CAEsQvcurb3s_W47f3N1h1=+oW4rX8tUSfQKv+_zyMMXXqJCBVw@mail.gmail.com>
 <CAHXb3bf4estasrkRhyME9w2hO6UmwUPAY+Vg6e4kvCnZh=R2zA@mail.gmail.com>
 <CAEsQvcs2Ov71mpSCXgefEFV1QQeqND871nu4+BV5KfT3kXtu+Q@mail.gmail.com>
In-Reply-To: <CAEsQvcs2Ov71mpSCXgefEFV1QQeqND871nu4+BV5KfT3kXtu+Q@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Thu, 8 Apr 2021 13:54:03 -0700
Message-ID: <CAHXb3bcpUBH9F=K9npwK-xO5sX+H11EV0_Nc7Otw7o93M=DKYQ@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Lucas <jaffa225man@gmail.com>, alsa-devel@alsa-project.org
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

Geraldo - the implicit feedback stuff is by no means new - it's been there
for quite some time. The recent changes just refactored it a bit.

Mike

On Thu, Apr 8, 2021 at 1:09 PM Geraldo Nascimento <geraldogabriel@gmail.com>
wrote:

> Em Qui, 8 de abr de 2021 16:42, Mike Oliphant <oliphant@nostatic.org>
> escreveu:
>
>> Hi Geraldo - yes. In fact, that is how I've been operating for the past
>> year or so before the recent implicit feedback changes. I use the GT-1 most
>> every day as a guitar interface and it works perfectly.
>>
>
> Thanks Mike, but I'm not sure I understand. You have been operating with
> implicit feedback sync on the playback for the past year? I thought that
> was a new idea?
>
> The key point here is that with a stock kernel you have to comment out the
> IMPLICIT_FB_SKIP_DEV() entry for the GT-1 for the Roland code inside
> audioformat_implicit_fb_quirk properly kick in.
>
> I was suggesting you try your workaround without adding a
> IMPLICIT_FB_GENERIC_DEV() for your device.
>
>
>> The GT-1 (and I suspect many of the other Roland/BOSS devices) doesn't
>> seem to be quirky at all with regard to implicit feedback setup - it works
>> exactly as the endpoint definitions say it should.
>>
>> Where the GT-1 *does* seem to be quirky is that is doesn't seem to want
>> to send capture data until it receives some playback data - hence my
>> endpoint.c patch.
>>
>
> If that is true then there's definitely a need to rewrite endpoint.c. But
> it could be something else, Mike. One thing is certain: the present kernel
> behaviour is far from the ideal.
>
> I insist: engage implicit feedback sync for the playback, disable it for
> the captures and inspect your dyndbg logs for the failure cases in starting
> JACK that happen when you don't patch endpoint.c.
>
> If you see something related to sync_ep then the problem lies elsewhere,
> specifically inside pcm.c
>
> Although whether this behavior is quirky or typical I don't know. I do
>> know that the GT-1 does not claim to be USB class compliant. It requires
>> custom drivers on Windows and macOS and does not work at all with iOS, so
>> it definitely seems to be somewhat non-standard.
>>
>
> Non-standard to say the least. I really hope that's not the case or it'll
> give Takashi Iwai plenty of headache ;-)
>
>
>> Mike
>>
>> On Thu, Apr 8, 2021 at 12:13 PM Geraldo Nascimento <
>> geraldogabriel@gmail.com> wrote:
>>
>>> Hey Mike, got another question for you, sorry about that.
>>>
>>> If you comment out your GT-1 IMPLICIT_FB_GENERIC_DEV() entry and instead
>>> let audioformat_implicit_fb_quirk() call add_roland_implicit_fb() with
>>> everything else customized your way, your custom endpoint.c etc., does it
>>> still work? And does it work crystal clear?
>>>
>>> I'm sorry about this test this, test that, provide the dyndbg logs
>>> attitude but I'm honestly just trying to help you write the best patch
>>> possible.
>>>
>>> Thank you,
>>> Geraldo
>>>
>>> Em Qui, 8 de abr de 2021 02:05, Geraldo Nascimento <
>>> geraldogabriel@gmail.com> escreveu:
>>>
>>>> Mike, I just realize I missed reply-to-all once again.
>>>>
>>>> In case you were wondering, I was looking for a sync_ep event right in
>>>> the start of the loading of snd-usb-audio. It happens inside pcm.c. If you
>>>> see one of those specifically let me know.
>>>>
>>>> With my Pioneer device, the DDJ-SR2, snd-usb-audio recognized the
>>>> device's implicit feedback EP as sync_ep and that prevented JACK from
>>>> starting.
>>>>
>>>> Em Qua, 7 de abr de 2021 23:47, Mike Oliphant <oliphant@nostatic.org>
>>>>> escreveu:
>>>>>
>>>>>> Hi Geraldo - I had the same thought and I have tried enabling
>>>>>> playback feedback while turning off capture feedback without my endpoint
>>>>>> patch. It doesn't work - at least not on the GT-1. Playback/capture fails
>>>>>> to start.
>>>>>>
>>>>>
>>>>> Would you mind sharing the dyndbg logs for the failure case from the
>>>>> point you connect the device, and trying to start JACK?
>>>>>
>>>>> Sometimes failures elucidate more than success cases.
>>>>>
>>>>>
>>>>>> Speaking of testing, if you (or anyone else following this
>>>>>> discussion) have one of these Roland/BOSS devices, it would be great if you
>>>>>> could try testing with playback feedback enabled and my endpoint.c
>>>>>> workaround.
>>>>>>
>>>>>
>>>>> I don't have the hardware, but I'm sure it works. The problem is that
>>>>> endpoint.c code really shouldn't be disabled unless all the other options
>>>>> fail, and even then, I'm not so sure the maintainers will be so willing to
>>>>> disable it. So let's keep some other options on the table by debugging a
>>>>> little further.
>>>>>
>>>>> Thank you,
>>>>> Geraldo
>>>>>
>>>>>
>>>>>> Mike
>>>>>>
>>>>>> On Wed, Apr 7, 2021 at 7:21 PM Geraldo Nascimento <
>>>>>> geraldogabriel@gmail.com> wrote:
>>>>>>
>>>>>>> Thanks, Mike, one thing I can tell you right off the bat is that if
>>>>>>> you turn implicit feedback sync on for both endpoints at the same time like
>>>>>>> you mentioned, without your workaround inside endpoint.c, they most likely
>>>>>>> will stall because they would both be waiting for each other to start.
>>>>>>>
>>>>>>> Have you tried engaging the generic implicit feedback sync just for
>>>>>>> the playback, thereby commenting out the capture implicit feedback entries,
>>>>>>> and re-enabling snd_usb_endpoint_implicit_feedback_sink(ep) inside
>>>>>>> endpoint.c? Does playback still fail to start?
>>>>>>>
>>>>>>> If you choose to perform this simple test please share with us the
>>>>>>> test's dyndbg logs right from the moment you turn on the device, not just
>>>>>>> after you start jackd.
>>>>>>>
>>>>>>> Sorry for the endless do-this, do-that. Such is the pace of
>>>>>>> teledebugging
>>>>>>>
>>>>>>>
>>>>>>> Em Qua, 7 de abr de 2021 21:38, Mike Oliphant <oliphant@nostatic.org>
>>>>>>> escreveu:
>>>>>>>
>>>>>>>> Geraldo - here is the dmesg output when starting up jackd for
>>>>>>>> capture/playback:
>>>>>>>>
>>>>>>>> With my patch:
>>>>>>>>
>>>>>>>> [  136.734081] usb 3-1.2: Open EP 0x8e, iface=2:1, idx=0
>>>>>>>> [  136.734088] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>>>>>>>> period_bytes=256, periods=2, implicit_fb=0
>>>>>>>> [  136.734092] usb 3-1.2: Setting usb interface 2:0 for EP 0x8e
>>>>>>>> [  136.734233] usb 3-1.2: Setting usb interface 2:1 for EP 0x8e
>>>>>>>> [  136.734381] usb 3-1.2: 2:1 Set sample rate 44100, clock 0
>>>>>>>> [  136.734388] usb 3-1.2: Setting params for data EP 0x8e, pipe
>>>>>>>> 0x70480
>>>>>>>> [  136.734394] usb 3-1.2: Set up 12 URBS, ret=0
>>>>>>>> [  136.734466] usb 3-1.2: Open EP 0xd, iface=1:1, idx=0
>>>>>>>> [  136.734468] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>>>>>>>> period_bytes=256, periods=2, implicit_fb=1
>>>>>>>> [  136.734471] usb 3-1.2: Reopened EP 0x8e (count 1)
>>>>>>>> [  136.734473] usb 3-1.2: Setting usb interface 1:0 for EP 0xd
>>>>>>>> [  136.734605] usb 3-1.2: Setting usb interface 1:1 for EP 0xd
>>>>>>>> [  136.734762] usb 3-1.2: 1:1 Set sample rate 44100, clock 0
>>>>>>>> [  136.734774] usb 3-1.2: Setting params for data EP 0xd, pipe
>>>>>>>> 0x68400
>>>>>>>> [  136.734781] usb 3-1.2: Set up 12 URBS, ret=0
>>>>>>>> [  136.734830] usb 3-1.2: Starting data EP 0xd (running 0)
>>>>>>>> [  136.734873] usb 3-1.2: 12 URBs submitted for EP 0xd
>>>>>>>> [  136.734876] usb 3-1.2: Starting data EP 0x8e (running 0)
>>>>>>>> [  136.734906] usb 3-1.2: 12 URBs submitted for EP 0x8e
>>>>>>>> [  136.740627] usb 3-1.2: Starting data EP 0x8e (running 1)
>>>>>>>> [  136.740634] usb 3-1.2: 2:1 Start Capture PCM
>>>>>>>> [  136.740635] usb 3-1.2: 1:1 Start Playback PCM
>>>>>>>>
>>>>>>>>
>>>>>>>> With the unpatched kernel:
>>>>>>>>
>>>>>>>> [  344.813203] usb 3-1.2: Open EP 0x8e, iface=2:1, idx=0
>>>>>>>> [  344.813210] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>>>>>>>> period_bytes=256, periods=2, implicit_fb=1
>>>>>>>> [  344.813213] usb 3-1.2: Open EP 0xd, iface=1:1, idx=0
>>>>>>>> [  344.813215] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>>>>>>>> period_bytes=256, periods=2, implicit_fb=0
>>>>>>>> [  344.813217] usb 3-1.2: Setting usb interface 2:0 for EP 0x8e
>>>>>>>> [  344.813367] usb 3-1.2: Setting usb interface 2:1 for EP 0x8e
>>>>>>>> [  344.813494] usb 3-1.2: 2:1 Set sample rate 44100, clock 0
>>>>>>>> [  344.813503] usb 3-1.2: Setting params for data EP 0x8e, pipe
>>>>>>>> 0x70580
>>>>>>>> [  344.813509] usb 3-1.2: Set up 12 URBS, ret=0
>>>>>>>> [  344.813513] usb 3-1.2: Setting usb interface 1:0 for EP 0xd
>>>>>>>> [  344.813587] usb 3-1.2: Setting usb interface 1:1 for EP 0xd
>>>>>>>> [  344.813758] usb 3-1.2: 1:1 Set sample rate 44100, clock 0
>>>>>>>> [  344.813765] usb 3-1.2: Setting params for data EP 0xd, pipe
>>>>>>>> 0x68500
>>>>>>>> [  344.813770] usb 3-1.2: Set up 2 URBS, ret=0
>>>>>>>> [  344.813858] usb 3-1.2: Reopened EP 0xd (count 1)
>>>>>>>> [  344.813883] usb 3-1.2: Starting data EP 0xd (running 0)
>>>>>>>> [  344.813899] usb 3-1.2: 2 URBs submitted for EP 0xd
>>>>>>>> [  344.819499] usb 3-1.2: Starting data EP 0x8e (running 0)
>>>>>>>> [  344.819532] usb 3-1.2: 12 URBs submitted for EP 0x8e
>>>>>>>> [  344.819535] usb 3-1.2: Starting data EP 0xd (running 1)
>>>>>>>> [  344.819538] usb 3-1.2: 2:1 Start Capture PCM
>>>>>>>> [  344.819540] usb 3-1.2: 1:1 Start Playback PCM
>>>>>>>> [  344.820663] usb 3-1.2: Stopping data EP 0xd (running 2)
>>>>>>>> [  344.820688] usb 3-1.2: Stopping data EP 0x8e (running 1)
>>>>>>>> [  344.820693] usb 3-1.2: 2:1 Stop Capture PCM
>>>>>>>> [  344.820695] usb 3-1.2: Stopping data EP 0xd (running 1)
>>>>>>>> [  344.820697] usb 3-1.2: 1:1 Stop Playback PCM
>>>>>>>> [  344.833799] usb 3-1.2: Starting data EP 0xd (running 0)
>>>>>>>> [  344.833852] usb 3-1.2: 2 URBs submitted for EP 0xd
>>>>>>>> [  344.833867] usb 3-1.2: Starting data EP 0x8e (running 0)
>>>>>>>> [  344.833888] usb 3-1.2: 12 URBs submitted for EP 0x8e
>>>>>>>> [  344.833890] usb 3-1.2: Starting data EP 0xd (running 1)
>>>>>>>> [  344.833891] usb 3-1.2: 2:1 Start Capture PCM
>>>>>>>> [  344.833893] usb 3-1.2: 1:1 Start Playback PCM
>>>>>>>>
>>>>>>>> On Wed, Apr 7, 2021 at 1:30 PM Geraldo Nascimento <
>>>>>>>> geraldogabriel@gmail.com> wrote:
>>>>>>>>
>>>>>>>>> Em Qua, 7 de abr de 2021 17:16, Mike Oliphant <
>>>>>>>>> oliphant@nostatic.org> escreveu:
>>>>>>>>>
>>>>>>>>>> Hi Geraldo - I don't have that patch applied, but it shouldn't
>>>>>>>>>> make any behavioral difference - it just seems to be simplifying the code.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Point taken.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> The issue is that the BOSS GT-1 *does* need implicit feedback on
>>>>>>>>>> playback to avoid clock timing issues, and the current behavior is
>>>>>>>>>> disabling that feedback.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Mike, would you mind posting some dyndbg logs for both the stock
>>>>>>>>> behaviour and your endpoint.c/generic quirk modified behaviour?
>>>>>>>>>
>>>>>>>>> Just add snd_usb_audio.dyndbg=+p to your kernel options and please
>>>>>>>>> share the logs.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> Mike
>>>>>>>>>>
>>>>>>>>>> On Wed, Apr 7, 2021 at 1:04 PM Geraldo Nascimento <
>>>>>>>>>> geraldogabriel@gmail.com> wrote:
>>>>>>>>>>
>>>>>>>>>>> Hey Mike, did you catch the latest patch by Takashi Iwai for
>>>>>>>>>>> capture quirky devices?
>>>>>>>>>>>
>>>>>>>>>>> You can find it here:
>>>>>>>>>>> https://patchwork.kernel.org/project/alsa-devel/patch/20210406113837.32041-1-tiwai@suse.de/
>>>>>>>>>>>
>>>>>>>>>>> Em Qua, 7 de abr de 2021 16:55, Mike Oliphant <
>>>>>>>>>>> oliphant@nostatic.org> escreveu:
>>>>>>>>>>>
>>>>>>>>>>>> I had thought that the recent implicit feedback changes were
>>>>>>>>>>>> fully working
>>>>>>>>>>>> on the BOSS GT-1, but it turns out that I just hadn't tested
>>>>>>>>>>>> well enough.
>>>>>>>>>>>>
>>>>>>>>>>>> Audio playback and capture works, but with periodic dropouts. I
>>>>>>>>>>>> get the
>>>>>>>>>>>> exact same behavior as I did with the quirk to completely
>>>>>>>>>>>> disable implicit
>>>>>>>>>>>> feedback. Without the implicit feedback, you get dropouts from
>>>>>>>>>>>> clock drift
>>>>>>>>>>>> - how bad probably varies from card to card. On mine it is
>>>>>>>>>>>> every second or
>>>>>>>>>>>> so.
>>>>>>>>>>>>
>>>>>>>>>>>> If I switch playback feedback for the GT-1 to generic by doing
>>>>>>>>>>>> "IMPLICIT_FB_GENERIC_DEV(0x0582, 0x01d6)", I get the previous
>>>>>>>>>>>> old behavior,
>>>>>>>>>>>> which is that playback completely fails to start.
>>>>>>>>>>>>
>>>>>>>>>>>> With generic playback feedback, and using my previous patch to
>>>>>>>>>>>> endpoint.c
>>>>>>>>>>>> to avoid playback waiting on capture mentioned here:
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-January/161951.html
>>>>>>>>>>>>
>>>>>>>>>>>> playback and capture work perfectly for me.
>>>>>>>>>>>>
>>>>>>>>>>>
