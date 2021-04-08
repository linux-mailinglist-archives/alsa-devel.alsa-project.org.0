Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD24935791D
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 02:40:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48E331666;
	Thu,  8 Apr 2021 02:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48E331666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617842424;
	bh=+B0wHB1hQm50dkB2c2HB4HbTUikoUpXqGNjJJ3kwW3c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J/mCgr9kPW2nl1oxFCTEZV3Tp93REkD7J5t5U2S/aNyW8Be4HIBFs+mtcVPFXZ57W
	 rBVxJX5gvRgMAosUhkZ6yhcyo2feWqtqlh0LiPd10I7MRw5bx03/uMX4n6CBbt20cX
	 fALMjHS/YUZ3VDHn2K3uqqLzm6VQbqbcYXDf8i10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91804F8016D;
	Thu,  8 Apr 2021 02:38:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C138EF8016A; Thu,  8 Apr 2021 02:38:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4AD2F80124
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 02:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4AD2F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="ZCY/II6G"
Received: by mail-yb1-xb2d.google.com with SMTP id 65so722346ybc.4
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 17:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uUEuRsXqXTAZPBehOznG7y9PZZhtcnD7Oq+GLU4z1IM=;
 b=ZCY/II6GkGhIok49nvZZ/Y4oTxhLPGzBkKBvcZ0hTlc43PtBMID2rGRNi4qBAnECDx
 vFCMcHZD+u6OQpafe1ix91a8PNK4Hd/Px3khCL9z6XSScjXMrFILQTXrKLAhCy285XZd
 uzOifBCGGN+O5cJcaFYQOSMCzPHmnl4Y8kvI3fMsFQpJuqnjDmvfHe4zlo989bBMj0CP
 OzS4SKYga8GtgwHfYgS/kMncHhoGaXf/caZi4QO6kcvuFxJ+TyVLw4JKdwPFCWazGRny
 sGEjTuHij3kTLfR5q5ya4G186d4YfuQIJWgsplNGLx7z4+oCGU2pz5AWyVcmcDF0Guvr
 0Trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uUEuRsXqXTAZPBehOznG7y9PZZhtcnD7Oq+GLU4z1IM=;
 b=Xxd8Kz0vUiXY5LQVI1yKP8BRvbw416yutqRyuWadmgQny1Nfw0t0WWvcrIEo6R8vf2
 ZMOiyfJN2uy/RoimpZ0uUtXY8sjBlOzWNnN9cDHi8pHdV0+GwkImhCnFUGhZcmeR5csd
 FXbgXqjm1Z9X6ZEgUjGrLHFBt0IourHyNJCUG0vQWqh1jkZZf/Rtcb/iotpIQdbfm4a3
 LV3mAW+5TVVfAVEVO7hx33YbuV8b/yE3XLJOfdFzjuVNoYyxtq4r9FlOEUHpMXxicQyQ
 8OmuTWBY6bEy/bioU5+bklMW2ZwmZhmPoyKZCpkBpy9mOLLGbWHtNfg/BPvHNmuhfzHq
 /pQA==
X-Gm-Message-State: AOAM532qmgpJTtYVJHxge/6grLMKi52aWfDdASMkeuK5C4/pDzx0aGcz
 zsl2ERoxVK+lZo4gOGMO9E+nBDUGSoDxbQrIkcg+Sg==
X-Google-Smtp-Source: ABdhPJwGKIXql9HZ1aU2C0o5f3VmwUa0ZSwzOyuRCWu0isf21cS4WcGSeN2/xmUSv4MsZSCtow3AUdx/9SERQwkJ49k=
X-Received: by 2002:a25:3f07:: with SMTP id m7mr6310867yba.314.1617842325381; 
 Wed, 07 Apr 2021 17:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
In-Reply-To: <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Wed, 7 Apr 2021 17:38:34 -0700
Message-ID: <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
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

Geraldo - here is the dmesg output when starting up jackd for
capture/playback:

With my patch:

[  136.734081] usb 3-1.2: Open EP 0x8e, iface=2:1, idx=0
[  136.734088] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
period_bytes=256, periods=2, implicit_fb=0
[  136.734092] usb 3-1.2: Setting usb interface 2:0 for EP 0x8e
[  136.734233] usb 3-1.2: Setting usb interface 2:1 for EP 0x8e
[  136.734381] usb 3-1.2: 2:1 Set sample rate 44100, clock 0
[  136.734388] usb 3-1.2: Setting params for data EP 0x8e, pipe 0x70480
[  136.734394] usb 3-1.2: Set up 12 URBS, ret=0
[  136.734466] usb 3-1.2: Open EP 0xd, iface=1:1, idx=0
[  136.734468] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
period_bytes=256, periods=2, implicit_fb=1
[  136.734471] usb 3-1.2: Reopened EP 0x8e (count 1)
[  136.734473] usb 3-1.2: Setting usb interface 1:0 for EP 0xd
[  136.734605] usb 3-1.2: Setting usb interface 1:1 for EP 0xd
[  136.734762] usb 3-1.2: 1:1 Set sample rate 44100, clock 0
[  136.734774] usb 3-1.2: Setting params for data EP 0xd, pipe 0x68400
[  136.734781] usb 3-1.2: Set up 12 URBS, ret=0
[  136.734830] usb 3-1.2: Starting data EP 0xd (running 0)
[  136.734873] usb 3-1.2: 12 URBs submitted for EP 0xd
[  136.734876] usb 3-1.2: Starting data EP 0x8e (running 0)
[  136.734906] usb 3-1.2: 12 URBs submitted for EP 0x8e
[  136.740627] usb 3-1.2: Starting data EP 0x8e (running 1)
[  136.740634] usb 3-1.2: 2:1 Start Capture PCM
[  136.740635] usb 3-1.2: 1:1 Start Playback PCM


With the unpatched kernel:

[  344.813203] usb 3-1.2: Open EP 0x8e, iface=2:1, idx=0
[  344.813210] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
period_bytes=256, periods=2, implicit_fb=1
[  344.813213] usb 3-1.2: Open EP 0xd, iface=1:1, idx=0
[  344.813215] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
period_bytes=256, periods=2, implicit_fb=0
[  344.813217] usb 3-1.2: Setting usb interface 2:0 for EP 0x8e
[  344.813367] usb 3-1.2: Setting usb interface 2:1 for EP 0x8e
[  344.813494] usb 3-1.2: 2:1 Set sample rate 44100, clock 0
[  344.813503] usb 3-1.2: Setting params for data EP 0x8e, pipe 0x70580
[  344.813509] usb 3-1.2: Set up 12 URBS, ret=0
[  344.813513] usb 3-1.2: Setting usb interface 1:0 for EP 0xd
[  344.813587] usb 3-1.2: Setting usb interface 1:1 for EP 0xd
[  344.813758] usb 3-1.2: 1:1 Set sample rate 44100, clock 0
[  344.813765] usb 3-1.2: Setting params for data EP 0xd, pipe 0x68500
[  344.813770] usb 3-1.2: Set up 2 URBS, ret=0
[  344.813858] usb 3-1.2: Reopened EP 0xd (count 1)
[  344.813883] usb 3-1.2: Starting data EP 0xd (running 0)
[  344.813899] usb 3-1.2: 2 URBs submitted for EP 0xd
[  344.819499] usb 3-1.2: Starting data EP 0x8e (running 0)
[  344.819532] usb 3-1.2: 12 URBs submitted for EP 0x8e
[  344.819535] usb 3-1.2: Starting data EP 0xd (running 1)
[  344.819538] usb 3-1.2: 2:1 Start Capture PCM
[  344.819540] usb 3-1.2: 1:1 Start Playback PCM
[  344.820663] usb 3-1.2: Stopping data EP 0xd (running 2)
[  344.820688] usb 3-1.2: Stopping data EP 0x8e (running 1)
[  344.820693] usb 3-1.2: 2:1 Stop Capture PCM
[  344.820695] usb 3-1.2: Stopping data EP 0xd (running 1)
[  344.820697] usb 3-1.2: 1:1 Stop Playback PCM
[  344.833799] usb 3-1.2: Starting data EP 0xd (running 0)
[  344.833852] usb 3-1.2: 2 URBs submitted for EP 0xd
[  344.833867] usb 3-1.2: Starting data EP 0x8e (running 0)
[  344.833888] usb 3-1.2: 12 URBs submitted for EP 0x8e
[  344.833890] usb 3-1.2: Starting data EP 0xd (running 1)
[  344.833891] usb 3-1.2: 2:1 Start Capture PCM
[  344.833893] usb 3-1.2: 1:1 Start Playback PCM

On Wed, Apr 7, 2021 at 1:30 PM Geraldo Nascimento <geraldogabriel@gmail.com>
wrote:

> Em Qua, 7 de abr de 2021 17:16, Mike Oliphant <oliphant@nostatic.org>
> escreveu:
>
>> Hi Geraldo - I don't have that patch applied, but it shouldn't make any
>> behavioral difference - it just seems to be simplifying the code.
>>
>
> Point taken.
>
>
>> The issue is that the BOSS GT-1 *does* need implicit feedback on playback
>> to avoid clock timing issues, and the current behavior is disabling that
>> feedback.
>>
>
> Mike, would you mind posting some dyndbg logs for both the stock behaviour
> and your endpoint.c/generic quirk modified behaviour?
>
> Just add snd_usb_audio.dyndbg=+p to your kernel options and please share
> the logs.
>
>
>> Mike
>>
>> On Wed, Apr 7, 2021 at 1:04 PM Geraldo Nascimento <
>> geraldogabriel@gmail.com> wrote:
>>
>>> Hey Mike, did you catch the latest patch by Takashi Iwai for capture
>>> quirky devices?
>>>
>>> You can find it here:
>>> https://patchwork.kernel.org/project/alsa-devel/patch/20210406113837.32041-1-tiwai@suse.de/
>>>
>>> Em Qua, 7 de abr de 2021 16:55, Mike Oliphant <oliphant@nostatic.org>
>>> escreveu:
>>>
>>>> I had thought that the recent implicit feedback changes were fully
>>>> working
>>>> on the BOSS GT-1, but it turns out that I just hadn't tested well
>>>> enough.
>>>>
>>>> Audio playback and capture works, but with periodic dropouts. I get the
>>>> exact same behavior as I did with the quirk to completely disable
>>>> implicit
>>>> feedback. Without the implicit feedback, you get dropouts from clock
>>>> drift
>>>> - how bad probably varies from card to card. On mine it is every second
>>>> or
>>>> so.
>>>>
>>>> If I switch playback feedback for the GT-1 to generic by doing
>>>> "IMPLICIT_FB_GENERIC_DEV(0x0582, 0x01d6)", I get the previous old
>>>> behavior,
>>>> which is that playback completely fails to start.
>>>>
>>>> With generic playback feedback, and using my previous patch to
>>>> endpoint.c
>>>> to avoid playback waiting on capture mentioned here:
>>>>
>>>>
>>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-January/161951.html
>>>>
>>>> playback and capture work perfectly for me.
>>>>
>>>
