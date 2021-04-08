Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D26D358D9C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 21:43:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C026A166C;
	Thu,  8 Apr 2021 21:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C026A166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617911034;
	bh=Hu8LBnQC5Dfhx3sOxRzaFQLak7SpZSuuEPBjl1DmCTo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nf/2d1Fb/6LUbpkI/sLivGSudLdRtSxSXiOqLcP2XCPjwl6lCoOC2/ngrlTBH3svl
	 RYbJ9pfwFlS8bG003aORhj5Le7zatUEw3f9ZiTCtXzXP9XV/fU0dd7kvGvkzRwfjql
	 6sGcENSjkAlbqHJQyiez7GDpENmYu/4ODwPDkXTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1C29F8025D;
	Thu,  8 Apr 2021 21:42:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37CD8F80259; Thu,  8 Apr 2021 21:42:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6A4EF800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 21:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6A4EF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="eW1iok6t"
Received: by mail-yb1-xb2c.google.com with SMTP id v3so1663242ybi.1
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6NJtNGSv7YrNKs6cciLiKHbsT3bUTa0PBmijaDCxOaI=;
 b=eW1iok6tAjLxNH0HQ66GtldBqdiHiCOaC6+fOW+jruhMoFzQ2cFkCODwrL+zlcDj2O
 tFwcWTF6dehQWaBSwKMEIRtsHsXLEH8MNPRBY1nrztVlhtEsyg/HuPz9nJK4mJRqT/Iw
 QWppXPorvzSxtlOH+jqYo9qs+/obzEvYrYm5tI86TguOIprMMmHfJPG2I50oP44t9O2N
 OTfAufRzB6jdGsqWr5uh9JxsALCJdJB0VmHUAwCRxB3VgLV9XgnA70LZxAWzKpew0zLA
 8y4Xsh2ZcNy2bHsVO5N6zI9003JrbFBxoM4BDnwaPtWtgOxI/lfY33lZQCB6jPxQhrvx
 tQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6NJtNGSv7YrNKs6cciLiKHbsT3bUTa0PBmijaDCxOaI=;
 b=n6ST4R131VXx1Q+WhLNCuCMPsZXmqzB2nL8QxcC73Sq/ZBp+CuZrRS0pVa84v9Z/7Z
 QKol2c8/5pOfLw5A8kIXq/gBIEsIlQLcSGun7TakXwuH/qs3ktm2znJGs3e+wy6ADNrJ
 sLae+LDr5h3TVmO0MSb0DRXMOB+578SS1qTcafqbqguZlqIWMoSou0oSr5VFx9EvGDlh
 iPXzcvu850YQVGvoN8dzz90hIjvhHkGj7DmjDmUnHLWVJ8HvwVIYgmNZlx74QASVxbLW
 TLxkDY32TBaY2fPduEPhwCbUX1WUWZ7rX7kYKCxR/3BdzMVaqWYcQmlYF4g0vzo3KsI5
 TnGQ==
X-Gm-Message-State: AOAM530eKpBuH3YvQVjhsAGoYKs9pnm+s92kLbQTCAlv5bMgRXynSwaH
 qm7khJyTeVHEUqieSYvUpJQLZg1u4xmC7K79Q1YlwA==
X-Google-Smtp-Source: ABdhPJyYa/w96O+Ak4a61aIHt64eyFUmchWUpqZxkxlYx488YgmuEOzACzR+8R/1ZDfppjNgGUo3oDXwxTlM42rmPAw=
X-Received: by 2002:a25:2682:: with SMTP id
 m124mr14104584ybm.410.1617910958923; 
 Thu, 08 Apr 2021 12:42:38 -0700 (PDT)
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
In-Reply-To: <CAEsQvcurb3s_W47f3N1h1=+oW4rX8tUSfQKv+_zyMMXXqJCBVw@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Thu, 8 Apr 2021 12:42:29 -0700
Message-ID: <CAHXb3bf4estasrkRhyME9w2hO6UmwUPAY+Vg6e4kvCnZh=R2zA@mail.gmail.com>
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

Hi Geraldo - yes. In fact, that is how I've been operating for the past
year or so before the recent implicit feedback changes. I use the GT-1 most
every day as a guitar interface and it works perfectly.

The GT-1 (and I suspect many of the other Roland/BOSS devices) doesn't seem
to be quirky at all with regard to implicit feedback setup - it works
exactly as the endpoint definitions say it should.

Where the GT-1 *does* seem to be quirky is that is doesn't seem to want to
send capture data until it receives some playback data - hence my
endpoint.c patch. Although whether this behavior is quirky or typical I
don't know. I do know that the GT-1 does not claim to be USB class
compliant. It requires custom drivers on Windows and macOS and does not
work at all with iOS, so it definitely seems to be somewhat non-standard.

Mike

On Thu, Apr 8, 2021 at 12:13 PM Geraldo Nascimento <geraldogabriel@gmail.com>
wrote:

> Hey Mike, got another question for you, sorry about that.
>
> If you comment out your GT-1 IMPLICIT_FB_GENERIC_DEV() entry and instead
> let audioformat_implicit_fb_quirk() call add_roland_implicit_fb() with
> everything else customized your way, your custom endpoint.c etc., does it
> still work? And does it work crystal clear?
>
> I'm sorry about this test this, test that, provide the dyndbg logs
> attitude but I'm honestly just trying to help you write the best patch
> possible.
>
> Thank you,
> Geraldo
>
> Em Qui, 8 de abr de 2021 02:05, Geraldo Nascimento <
> geraldogabriel@gmail.com> escreveu:
>
>> Mike, I just realize I missed reply-to-all once again.
>>
>> In case you were wondering, I was looking for a sync_ep event right in
>> the start of the loading of snd-usb-audio. It happens inside pcm.c. If you
>> see one of those specifically let me know.
>>
>> With my Pioneer device, the DDJ-SR2, snd-usb-audio recognized the
>> device's implicit feedback EP as sync_ep and that prevented JACK from
>> starting.
>>
>> Em Qua, 7 de abr de 2021 23:47, Mike Oliphant <oliphant@nostatic.org>
>>> escreveu:
>>>
>>>> Hi Geraldo - I had the same thought and I have tried enabling playback
>>>> feedback while turning off capture feedback without my endpoint patch. It
>>>> doesn't work - at least not on the GT-1. Playback/capture fails to start.
>>>>
>>>
>>> Would you mind sharing the dyndbg logs for the failure case from the
>>> point you connect the device, and trying to start JACK?
>>>
>>> Sometimes failures elucidate more than success cases.
>>>
>>>
>>>> Speaking of testing, if you (or anyone else following this discussion)
>>>> have one of these Roland/BOSS devices, it would be great if you could try
>>>> testing with playback feedback enabled and my endpoint.c workaround.
>>>>
>>>
>>> I don't have the hardware, but I'm sure it works. The problem is that
>>> endpoint.c code really shouldn't be disabled unless all the other options
>>> fail, and even then, I'm not so sure the maintainers will be so willing to
>>> disable it. So let's keep some other options on the table by debugging a
>>> little further.
>>>
>>> Thank you,
>>> Geraldo
>>>
>>>
>>>> Mike
>>>>
>>>> On Wed, Apr 7, 2021 at 7:21 PM Geraldo Nascimento <
>>>> geraldogabriel@gmail.com> wrote:
>>>>
>>>>> Thanks, Mike, one thing I can tell you right off the bat is that if
>>>>> you turn implicit feedback sync on for both endpoints at the same time like
>>>>> you mentioned, without your workaround inside endpoint.c, they most likely
>>>>> will stall because they would both be waiting for each other to start.
>>>>>
>>>>> Have you tried engaging the generic implicit feedback sync just for
>>>>> the playback, thereby commenting out the capture implicit feedback entries,
>>>>> and re-enabling snd_usb_endpoint_implicit_feedback_sink(ep) inside
>>>>> endpoint.c? Does playback still fail to start?
>>>>>
>>>>> If you choose to perform this simple test please share with us the
>>>>> test's dyndbg logs right from the moment you turn on the device, not just
>>>>> after you start jackd.
>>>>>
>>>>> Sorry for the endless do-this, do-that. Such is the pace of
>>>>> teledebugging
>>>>>
>>>>>
>>>>> Em Qua, 7 de abr de 2021 21:38, Mike Oliphant <oliphant@nostatic.org>
>>>>> escreveu:
>>>>>
>>>>>> Geraldo - here is the dmesg output when starting up jackd for
>>>>>> capture/playback:
>>>>>>
>>>>>> With my patch:
>>>>>>
>>>>>> [  136.734081] usb 3-1.2: Open EP 0x8e, iface=2:1, idx=0
>>>>>> [  136.734088] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>>>>>> period_bytes=256, periods=2, implicit_fb=0
>>>>>> [  136.734092] usb 3-1.2: Setting usb interface 2:0 for EP 0x8e
>>>>>> [  136.734233] usb 3-1.2: Setting usb interface 2:1 for EP 0x8e
>>>>>> [  136.734381] usb 3-1.2: 2:1 Set sample rate 44100, clock 0
>>>>>> [  136.734388] usb 3-1.2: Setting params for data EP 0x8e, pipe
>>>>>> 0x70480
>>>>>> [  136.734394] usb 3-1.2: Set up 12 URBS, ret=0
>>>>>> [  136.734466] usb 3-1.2: Open EP 0xd, iface=1:1, idx=0
>>>>>> [  136.734468] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>>>>>> period_bytes=256, periods=2, implicit_fb=1
>>>>>> [  136.734471] usb 3-1.2: Reopened EP 0x8e (count 1)
>>>>>> [  136.734473] usb 3-1.2: Setting usb interface 1:0 for EP 0xd
>>>>>> [  136.734605] usb 3-1.2: Setting usb interface 1:1 for EP 0xd
>>>>>> [  136.734762] usb 3-1.2: 1:1 Set sample rate 44100, clock 0
>>>>>> [  136.734774] usb 3-1.2: Setting params for data EP 0xd, pipe 0x68400
>>>>>> [  136.734781] usb 3-1.2: Set up 12 URBS, ret=0
>>>>>> [  136.734830] usb 3-1.2: Starting data EP 0xd (running 0)
>>>>>> [  136.734873] usb 3-1.2: 12 URBs submitted for EP 0xd
>>>>>> [  136.734876] usb 3-1.2: Starting data EP 0x8e (running 0)
>>>>>> [  136.734906] usb 3-1.2: 12 URBs submitted for EP 0x8e
>>>>>> [  136.740627] usb 3-1.2: Starting data EP 0x8e (running 1)
>>>>>> [  136.740634] usb 3-1.2: 2:1 Start Capture PCM
>>>>>> [  136.740635] usb 3-1.2: 1:1 Start Playback PCM
>>>>>>
>>>>>>
>>>>>> With the unpatched kernel:
>>>>>>
>>>>>> [  344.813203] usb 3-1.2: Open EP 0x8e, iface=2:1, idx=0
>>>>>> [  344.813210] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>>>>>> period_bytes=256, periods=2, implicit_fb=1
>>>>>> [  344.813213] usb 3-1.2: Open EP 0xd, iface=1:1, idx=0
>>>>>> [  344.813215] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>>>>>> period_bytes=256, periods=2, implicit_fb=0
>>>>>> [  344.813217] usb 3-1.2: Setting usb interface 2:0 for EP 0x8e
>>>>>> [  344.813367] usb 3-1.2: Setting usb interface 2:1 for EP 0x8e
>>>>>> [  344.813494] usb 3-1.2: 2:1 Set sample rate 44100, clock 0
>>>>>> [  344.813503] usb 3-1.2: Setting params for data EP 0x8e, pipe
>>>>>> 0x70580
>>>>>> [  344.813509] usb 3-1.2: Set up 12 URBS, ret=0
>>>>>> [  344.813513] usb 3-1.2: Setting usb interface 1:0 for EP 0xd
>>>>>> [  344.813587] usb 3-1.2: Setting usb interface 1:1 for EP 0xd
>>>>>> [  344.813758] usb 3-1.2: 1:1 Set sample rate 44100, clock 0
>>>>>> [  344.813765] usb 3-1.2: Setting params for data EP 0xd, pipe 0x68500
>>>>>> [  344.813770] usb 3-1.2: Set up 2 URBS, ret=0
>>>>>> [  344.813858] usb 3-1.2: Reopened EP 0xd (count 1)
>>>>>> [  344.813883] usb 3-1.2: Starting data EP 0xd (running 0)
>>>>>> [  344.813899] usb 3-1.2: 2 URBs submitted for EP 0xd
>>>>>> [  344.819499] usb 3-1.2: Starting data EP 0x8e (running 0)
>>>>>> [  344.819532] usb 3-1.2: 12 URBs submitted for EP 0x8e
>>>>>> [  344.819535] usb 3-1.2: Starting data EP 0xd (running 1)
>>>>>> [  344.819538] usb 3-1.2: 2:1 Start Capture PCM
>>>>>> [  344.819540] usb 3-1.2: 1:1 Start Playback PCM
>>>>>> [  344.820663] usb 3-1.2: Stopping data EP 0xd (running 2)
>>>>>> [  344.820688] usb 3-1.2: Stopping data EP 0x8e (running 1)
>>>>>> [  344.820693] usb 3-1.2: 2:1 Stop Capture PCM
>>>>>> [  344.820695] usb 3-1.2: Stopping data EP 0xd (running 1)
>>>>>> [  344.820697] usb 3-1.2: 1:1 Stop Playback PCM
>>>>>> [  344.833799] usb 3-1.2: Starting data EP 0xd (running 0)
>>>>>> [  344.833852] usb 3-1.2: 2 URBs submitted for EP 0xd
>>>>>> [  344.833867] usb 3-1.2: Starting data EP 0x8e (running 0)
>>>>>> [  344.833888] usb 3-1.2: 12 URBs submitted for EP 0x8e
>>>>>> [  344.833890] usb 3-1.2: Starting data EP 0xd (running 1)
>>>>>> [  344.833891] usb 3-1.2: 2:1 Start Capture PCM
>>>>>> [  344.833893] usb 3-1.2: 1:1 Start Playback PCM
>>>>>>
>>>>>> On Wed, Apr 7, 2021 at 1:30 PM Geraldo Nascimento <
>>>>>> geraldogabriel@gmail.com> wrote:
>>>>>>
>>>>>>> Em Qua, 7 de abr de 2021 17:16, Mike Oliphant <oliphant@nostatic.org>
>>>>>>> escreveu:
>>>>>>>
>>>>>>>> Hi Geraldo - I don't have that patch applied, but it shouldn't make
>>>>>>>> any behavioral difference - it just seems to be simplifying the code.
>>>>>>>>
>>>>>>>
>>>>>>> Point taken.
>>>>>>>
>>>>>>>
>>>>>>>> The issue is that the BOSS GT-1 *does* need implicit feedback on
>>>>>>>> playback to avoid clock timing issues, and the current behavior is
>>>>>>>> disabling that feedback.
>>>>>>>>
>>>>>>>
>>>>>>> Mike, would you mind posting some dyndbg logs for both the stock
>>>>>>> behaviour and your endpoint.c/generic quirk modified behaviour?
>>>>>>>
>>>>>>> Just add snd_usb_audio.dyndbg=+p to your kernel options and please
>>>>>>> share the logs.
>>>>>>>
>>>>>>>
>>>>>>>> Mike
>>>>>>>>
>>>>>>>> On Wed, Apr 7, 2021 at 1:04 PM Geraldo Nascimento <
>>>>>>>> geraldogabriel@gmail.com> wrote:
>>>>>>>>
>>>>>>>>> Hey Mike, did you catch the latest patch by Takashi Iwai for
>>>>>>>>> capture quirky devices?
>>>>>>>>>
>>>>>>>>> You can find it here:
>>>>>>>>> https://patchwork.kernel.org/project/alsa-devel/patch/20210406113837.32041-1-tiwai@suse.de/
>>>>>>>>>
>>>>>>>>> Em Qua, 7 de abr de 2021 16:55, Mike Oliphant <
>>>>>>>>> oliphant@nostatic.org> escreveu:
>>>>>>>>>
>>>>>>>>>> I had thought that the recent implicit feedback changes were
>>>>>>>>>> fully working
>>>>>>>>>> on the BOSS GT-1, but it turns out that I just hadn't tested well
>>>>>>>>>> enough.
>>>>>>>>>>
>>>>>>>>>> Audio playback and capture works, but with periodic dropouts. I
>>>>>>>>>> get the
>>>>>>>>>> exact same behavior as I did with the quirk to completely disable
>>>>>>>>>> implicit
>>>>>>>>>> feedback. Without the implicit feedback, you get dropouts from
>>>>>>>>>> clock drift
>>>>>>>>>> - how bad probably varies from card to card. On mine it is every
>>>>>>>>>> second or
>>>>>>>>>> so.
>>>>>>>>>>
>>>>>>>>>> If I switch playback feedback for the GT-1 to generic by doing
>>>>>>>>>> "IMPLICIT_FB_GENERIC_DEV(0x0582, 0x01d6)", I get the previous old
>>>>>>>>>> behavior,
>>>>>>>>>> which is that playback completely fails to start.
>>>>>>>>>>
>>>>>>>>>> With generic playback feedback, and using my previous patch to
>>>>>>>>>> endpoint.c
>>>>>>>>>> to avoid playback waiting on capture mentioned here:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-January/161951.html
>>>>>>>>>>
>>>>>>>>>> playback and capture work perfectly for me.
>>>>>>>>>>
>>>>>>>>>
