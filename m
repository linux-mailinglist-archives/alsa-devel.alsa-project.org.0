Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE2B357A46
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 04:23:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 696D31662;
	Thu,  8 Apr 2021 04:22:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 696D31662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617848592;
	bh=tlu8E6KMKVAoQlDnJWveT2ALKyDiPKfk3Iio08o//lI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SzBqag6P3GYtmFwUQxhbL4u6H2VTLkMbEHeDDRNcUzVg54Y5K/vNtwJvuTbA7/7z8
	 LheRgki+/m8ELH3f6gKpDisy+Q+BiATPwUyZLCkWaP0oIav5ujc10o5oJAcenJAN0H
	 mNS1I8EKy2r14uFdhlkGxutjz3KBKaIG+dpKg29s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6F40F80162;
	Thu,  8 Apr 2021 04:21:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B38CDF8020B; Thu,  8 Apr 2021 04:21:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EFADF8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 04:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EFADF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P/j1Hzmo"
Received: by mail-qk1-x72e.google.com with SMTP id z10so723287qkz.13
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 19:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o8JdvbTErxWFhwJbgjIW7r+Q5a/2OK6n6lm+PYARV0s=;
 b=P/j1Hzmo3RcxWO+7rNgnIahou4soh5bJ/lYNqCGHjv4/Mygcogir1WS+oPtwy6Dz8X
 zrUDoZwIgpcU0Jn99U5Sbt/h4B++q2CZeCZKymnQK4WroYEuj7dvfxLqPTR/KmCTuBvP
 WZqof+DjhUIjIHz45Rj8SihpgfhdqYHAQkxs7AQUeEBw8RtXKGqP42QT6qOejEzTV9Gs
 ZPtpZhh4fknp5nDgVOR6WRZUw7JmDKoe89XCFqTwf7t2xoEq4dVhoAZX+L25ulvrsQmA
 CYgmIpbEZiRw2YSrVG0ltPkL09f/Jc6NL7UeHp1fiXEu+iSiNJeNR24S6mxUhcI0o1tQ
 TXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o8JdvbTErxWFhwJbgjIW7r+Q5a/2OK6n6lm+PYARV0s=;
 b=dfiW4YG91yRooJsq7l+d5UCh3OBQ36qRuhFjz2aBxkpg5KH8k0MzSLkVf3VL49f0pJ
 +lekygT1kBFquah/NCtWAhyM+msgVRSUELkC5lGF4hqAdaowqJpiURpL9zPygfp7SVyJ
 vwGHtnOoeG9nC8WmBsxcdTsHQnUmoEUVQyrMAy8I+ou94IDYN2pol0GekFcMm/w1NtdZ
 3aM+K6j9j6f+e5S6YdcWWMksfFkgzBRo2bHd/x+L1nrck7qxkCuAK8KUFszbz4g9N3Kp
 JVgKlARa64/fTmM6kHH1v2VQxVh2Rd0ybYcAzjDE4isSZRdBt60H6y2z3HXSxjbTozKX
 OtoQ==
X-Gm-Message-State: AOAM530AODTbl/HYt8qBnRELi4Os+BqT6kkAjeSOh40mBYADzQEJi42G
 RaknMI7Poy6lS2uGIUyCpKP6dU/564iEV0VvgyA=
X-Google-Smtp-Source: ABdhPJy9BFI6yLRT/AbXqxkJ9mYG/CVgu4mBx99YkZ6Uhsrr46D2SM9hyTQ8t/YfLhpqfRzTJ2UR9lhx7tBfM5w8QJM=
X-Received: by 2002:ae9:f444:: with SMTP id z4mr6331429qkl.226.1617848492811; 
 Wed, 07 Apr 2021 19:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
In-Reply-To: <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Wed, 7 Apr 2021 23:26:14 -0300
Message-ID: <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Mike Oliphant <oliphant@nostatic.org>
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

Thanks, Mike, one thing I can tell you right off the bat is that if you
turn implicit feedback sync on for both endpoints at the same time like you
mentioned, without your workaround inside endpoint.c, they most likely will
stall because they would both be waiting for each other to start.

Have you tried engaging the generic implicit feedback sync just for the
playback, thereby commenting out the capture implicit feedback entries, and
re-enabling snd_usb_endpoint_implicit_feedback_sink(ep) inside endpoint.c?
Does playback still fail to start?

If you choose to perform this simple test please share with us the test's
dyndbg logs right from the moment you turn on the device, not just after
you start jackd.

Sorry for the endless do-this, do-that. Such is the pace of teledebugging


Em Qua, 7 de abr de 2021 21:38, Mike Oliphant <oliphant@nostatic.org>
escreveu:

> Geraldo - here is the dmesg output when starting up jackd for
> capture/playback:
>
> With my patch:
>
> [  136.734081] usb 3-1.2: Open EP 0x8e, iface=2:1, idx=0
> [  136.734088] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
> period_bytes=256, periods=2, implicit_fb=0
> [  136.734092] usb 3-1.2: Setting usb interface 2:0 for EP 0x8e
> [  136.734233] usb 3-1.2: Setting usb interface 2:1 for EP 0x8e
> [  136.734381] usb 3-1.2: 2:1 Set sample rate 44100, clock 0
> [  136.734388] usb 3-1.2: Setting params for data EP 0x8e, pipe 0x70480
> [  136.734394] usb 3-1.2: Set up 12 URBS, ret=0
> [  136.734466] usb 3-1.2: Open EP 0xd, iface=1:1, idx=0
> [  136.734468] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
> period_bytes=256, periods=2, implicit_fb=1
> [  136.734471] usb 3-1.2: Reopened EP 0x8e (count 1)
> [  136.734473] usb 3-1.2: Setting usb interface 1:0 for EP 0xd
> [  136.734605] usb 3-1.2: Setting usb interface 1:1 for EP 0xd
> [  136.734762] usb 3-1.2: 1:1 Set sample rate 44100, clock 0
> [  136.734774] usb 3-1.2: Setting params for data EP 0xd, pipe 0x68400
> [  136.734781] usb 3-1.2: Set up 12 URBS, ret=0
> [  136.734830] usb 3-1.2: Starting data EP 0xd (running 0)
> [  136.734873] usb 3-1.2: 12 URBs submitted for EP 0xd
> [  136.734876] usb 3-1.2: Starting data EP 0x8e (running 0)
> [  136.734906] usb 3-1.2: 12 URBs submitted for EP 0x8e
> [  136.740627] usb 3-1.2: Starting data EP 0x8e (running 1)
> [  136.740634] usb 3-1.2: 2:1 Start Capture PCM
> [  136.740635] usb 3-1.2: 1:1 Start Playback PCM
>
>
> With the unpatched kernel:
>
> [  344.813203] usb 3-1.2: Open EP 0x8e, iface=2:1, idx=0
> [  344.813210] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
> period_bytes=256, periods=2, implicit_fb=1
> [  344.813213] usb 3-1.2: Open EP 0xd, iface=1:1, idx=0
> [  344.813215] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
> period_bytes=256, periods=2, implicit_fb=0
> [  344.813217] usb 3-1.2: Setting usb interface 2:0 for EP 0x8e
> [  344.813367] usb 3-1.2: Setting usb interface 2:1 for EP 0x8e
> [  344.813494] usb 3-1.2: 2:1 Set sample rate 44100, clock 0
> [  344.813503] usb 3-1.2: Setting params for data EP 0x8e, pipe 0x70580
> [  344.813509] usb 3-1.2: Set up 12 URBS, ret=0
> [  344.813513] usb 3-1.2: Setting usb interface 1:0 for EP 0xd
> [  344.813587] usb 3-1.2: Setting usb interface 1:1 for EP 0xd
> [  344.813758] usb 3-1.2: 1:1 Set sample rate 44100, clock 0
> [  344.813765] usb 3-1.2: Setting params for data EP 0xd, pipe 0x68500
> [  344.813770] usb 3-1.2: Set up 2 URBS, ret=0
> [  344.813858] usb 3-1.2: Reopened EP 0xd (count 1)
> [  344.813883] usb 3-1.2: Starting data EP 0xd (running 0)
> [  344.813899] usb 3-1.2: 2 URBs submitted for EP 0xd
> [  344.819499] usb 3-1.2: Starting data EP 0x8e (running 0)
> [  344.819532] usb 3-1.2: 12 URBs submitted for EP 0x8e
> [  344.819535] usb 3-1.2: Starting data EP 0xd (running 1)
> [  344.819538] usb 3-1.2: 2:1 Start Capture PCM
> [  344.819540] usb 3-1.2: 1:1 Start Playback PCM
> [  344.820663] usb 3-1.2: Stopping data EP 0xd (running 2)
> [  344.820688] usb 3-1.2: Stopping data EP 0x8e (running 1)
> [  344.820693] usb 3-1.2: 2:1 Stop Capture PCM
> [  344.820695] usb 3-1.2: Stopping data EP 0xd (running 1)
> [  344.820697] usb 3-1.2: 1:1 Stop Playback PCM
> [  344.833799] usb 3-1.2: Starting data EP 0xd (running 0)
> [  344.833852] usb 3-1.2: 2 URBs submitted for EP 0xd
> [  344.833867] usb 3-1.2: Starting data EP 0x8e (running 0)
> [  344.833888] usb 3-1.2: 12 URBs submitted for EP 0x8e
> [  344.833890] usb 3-1.2: Starting data EP 0xd (running 1)
> [  344.833891] usb 3-1.2: 2:1 Start Capture PCM
> [  344.833893] usb 3-1.2: 1:1 Start Playback PCM
>
> On Wed, Apr 7, 2021 at 1:30 PM Geraldo Nascimento <
> geraldogabriel@gmail.com> wrote:
>
>> Em Qua, 7 de abr de 2021 17:16, Mike Oliphant <oliphant@nostatic.org>
>> escreveu:
>>
>>> Hi Geraldo - I don't have that patch applied, but it shouldn't make any
>>> behavioral difference - it just seems to be simplifying the code.
>>>
>>
>> Point taken.
>>
>>
>>> The issue is that the BOSS GT-1 *does* need implicit feedback on
>>> playback to avoid clock timing issues, and the current behavior is
>>> disabling that feedback.
>>>
>>
>> Mike, would you mind posting some dyndbg logs for both the stock
>> behaviour and your endpoint.c/generic quirk modified behaviour?
>>
>> Just add snd_usb_audio.dyndbg=+p to your kernel options and please share
>> the logs.
>>
>>
>>> Mike
>>>
>>> On Wed, Apr 7, 2021 at 1:04 PM Geraldo Nascimento <
>>> geraldogabriel@gmail.com> wrote:
>>>
>>>> Hey Mike, did you catch the latest patch by Takashi Iwai for capture
>>>> quirky devices?
>>>>
>>>> You can find it here:
>>>> https://patchwork.kernel.org/project/alsa-devel/patch/20210406113837.32041-1-tiwai@suse.de/
>>>>
>>>> Em Qua, 7 de abr de 2021 16:55, Mike Oliphant <oliphant@nostatic.org>
>>>> escreveu:
>>>>
>>>>> I had thought that the recent implicit feedback changes were fully
>>>>> working
>>>>> on the BOSS GT-1, but it turns out that I just hadn't tested well
>>>>> enough.
>>>>>
>>>>> Audio playback and capture works, but with periodic dropouts. I get the
>>>>> exact same behavior as I did with the quirk to completely disable
>>>>> implicit
>>>>> feedback. Without the implicit feedback, you get dropouts from clock
>>>>> drift
>>>>> - how bad probably varies from card to card. On mine it is every
>>>>> second or
>>>>> so.
>>>>>
>>>>> If I switch playback feedback for the GT-1 to generic by doing
>>>>> "IMPLICIT_FB_GENERIC_DEV(0x0582, 0x01d6)", I get the previous old
>>>>> behavior,
>>>>> which is that playback completely fails to start.
>>>>>
>>>>> With generic playback feedback, and using my previous patch to
>>>>> endpoint.c
>>>>> to avoid playback waiting on capture mentioned here:
>>>>>
>>>>>
>>>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-January/161951.html
>>>>>
>>>>> playback and capture work perfectly for me.
>>>>>
>>>>
