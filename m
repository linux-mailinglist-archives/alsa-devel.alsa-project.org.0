Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC254651F6
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 16:45:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C29A3260B;
	Wed,  1 Dec 2021 16:44:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C29A3260B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638373544;
	bh=pH8FzeKSOsENSVORWxm9dNDjm5CqCcoXbDmPIJxww90=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vUjpcv1Md8NeUd0oiOZ3x5cudztYw9a7Y81nznS9CBf5HNx6gBISqXwfeUq9nALLt
	 Mhzupxub6lWNyJ36ksjacfRtVwGeSzOtG4VkZxfpQcUmq63kxdexUi7DUP6tTU50Jr
	 hbFIHNpVSr9RhpbkTKgPYWeaGuRq2DiAH0PCfAR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17BB9F80249;
	Wed,  1 Dec 2021 16:44:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBC74F80246; Wed,  1 Dec 2021 16:44:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B457DF80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 16:44:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B457DF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Nhk7Iicp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638373457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wZQNlmUM/34qXDkw8WpqxcXUM1CWOVaK61UmBc+l2cM=;
 b=Nhk7Iicp9AVIvV5gK+ChSbvMR3crXz72sdHBWHXLt0+z4g5uoCs5ZBm7/HUU0hm3c90Tgh
 8Nh9+SD+YlRcrnzcgaIT4aCGYvC1880LPYp3Le0Esg9NpOY9OdIC1AuNJJuNNxHbTfsi22
 zxHv8g0lU2uAz8dul4RggMZ+VBtzklc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-SRHPhNWLPMyNK6DG3YxHwA-1; Wed, 01 Dec 2021 10:44:14 -0500
X-MC-Unique: SRHPhNWLPMyNK6DG3YxHwA-1
Received: by mail-ed1-f70.google.com with SMTP id
 m12-20020a056402430c00b003e9f10bbb7dso20650073edc.18
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 07:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wZQNlmUM/34qXDkw8WpqxcXUM1CWOVaK61UmBc+l2cM=;
 b=bPKHfsb7/DXNmCKc7p17VD1AZqFwfFpDR5GluxVlVTNWxCJFNrZrJs8zvAQWXb82hw
 4saY3cSF4qwsn6JID5vqtySZhrm6KakSXYEhAGNVVviYvgwAFNwKyRwABlGSoTiFqj4z
 KNowh8Pett6oq9Y0wijAMsztZgsLW7uS+mgOgpLq5ZOGm+RGt9pjxOmxYymQIuuTIFay
 aJTkGM5wNTypvbMaD3q1RJSFnc3RFdUxIMqiNf4y+Ky+/6tFP5iD0kzan4KlZYdkNeU+
 +eBKS5Zrmjk9R+JxOksKHHmaS8dfwJM7JI8J1PMSjk/mmzYT3qnhhdBjFoRQltzukUwq
 LjhA==
X-Gm-Message-State: AOAM530dacMaQBUcGBwlETeu29h7ELU+XurjVu6mcgEHDyJYZID9mnny
 nfLk+oTBmVoHZ2qDyA+ORnoFLLSW5hZCTF7NCimwBWGj3tWWMo/Am7f6QIHkuYa9x2SjwFLxxgl
 SgsJTu5nzPjCsxC2GCJW4WDw=
X-Received: by 2002:a05:6402:5c9:: with SMTP id
 n9mr9406051edx.306.1638373453263; 
 Wed, 01 Dec 2021 07:44:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAt9Go/YyzsNQwU84wcJ1kBh+9RsP7vXQZ1kTC7pr9y0oObRFUVmK2mD5aDL8apjyRE9RQcg==
X-Received: by 2002:a05:6402:5c9:: with SMTP id
 n9mr9406014edx.306.1638373452960; 
 Wed, 01 Dec 2021 07:44:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id n8sm94978edy.4.2021.12.01.07.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 07:44:12 -0800 (PST)
Message-ID: <2af48c9f-60d7-ed63-845d-9adb8cb7b037@redhat.com>
Date: Wed, 1 Dec 2021 16:44:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Logitech Z10 USB speakers need a volume change before audio works
To: Takashi Iwai <tiwai@suse.de>
References: <cf7dd2f0-512c-1b8c-efb1-53f79ddfb41e@redhat.com>
 <s5ho8689zl3.wl-tiwai@suse.de>
 <c1deb0b9-b0f1-3ea5-43ea-ac96b29e93f5@redhat.com>
 <7f36906e-fd4b-c14e-4189-0d8b7de271ac@redhat.com>
 <s5hfsrd1vt3.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <s5hfsrd1vt3.wl-tiwai@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 11/30/21 16:56, Takashi Iwai wrote:
> On Tue, 30 Nov 2021 15:33:35 +0100,
> Hans de Goede wrote:
>>
>> Hi,
>>
>> On 11/30/21 12:07, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 11/25/21 13:42, Takashi Iwai wrote:
>>>> On Thu, 25 Nov 2021 12:04:41 +0100,
>>>> Hans de Goede wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> I've a set of Logitech Z10 USB speakers, which act as a USB soundcard.
>>>>>
>>>>> They have this weird glitch where after turning off my PC (and their
>>>>> power-supply as well) and then turning things back on, they are silent
>>>>> until I change the PCM volume control for the speakers inside
>>>>> alsa-mixer.
>>>>>
>>>>> It seems like they need some "set-volume" command to be send over the
>>>>> USB bus to unmute them when initially powered-up / turned on.
>>>>>
>>>>> Is their some existing usb-audio quirk which I can try to work around this?
>>>>
>>>> No such quirk is present for now.
>>>>
>>>> Was it tested with 5.16-rc?  There was a change in USB-audio driver
>>>> initialization (commit b96681bd5827) and it might have some effect in
>>>> your case.
>>>
>>> Yes I'm at 5.16-rc3 atm but I've been seeing this for quite some time.
>>> I just never got around to reporting it. Mainly because I also never
>>> got around to getting a bit clearer picture of the problem.
>>>
>>> I've spend some time this morning to get that clearer picture,
>>> which was insightful.
>>>
>>>> Also, it's interesting to know whether it happens also once after
>>>> suspend-resume, too.
>>>
>>> suspend-resume makes no difference, not even rebooting or
>>> powering off the machine makes a difference.
>>>
>>> Once the speakers are in working order they stay in working order
>>> until I turn off my machine; and then flick the power-switch on
>>> the 240V AC power-bar which I use to power my laptop + dock +
>>> monitors + the speakers and turn things back on the next morning.
>>>
>>> To be clear these speakers get their audio-data over USB
>>> (as an usb-audio device) but they have their own power-supply
>>> they are not USB powered. They also have a "soft" on/off button
>>> which turns on/off the amplifier and LCD screen parts but leaves
>>> the USB audio interface active.
>>>
>>> So I've been experimenting with reproducing the issue and I
>>> need to do the following minimal steps to reproduce:
>>>
>>>  1. Unplug USB
>>>  2. Unplug power
>>>  3. Re-plug power
>>>  4. Re-plug USB
>>>  5. speaker-test -Dfront:CARD=Speaker,DEV=0 -S1
>>>  6. Turn speakers on (with the on/off button on the speakers), no audio
>>>
>>>  5 and 6 may be swapped, same result
>>>
>>> And now that I have a reliable reproducer I've also been
>>> playing with a reliable workaround which looks like this:
>>>
>>> 1. Start playing audio to the speakers
>>> 2. Turn speakers on (with the on/off button on the speakers)
>>> 3. Make a change to the 'PCM Playback Volume' ctrl
>>>
>>> Where 1. and 2. may be swapped. But the
>>> 'PCM Playback Volume' ctrl change must be made while the
>>> speakers are on and playing audio !
>>>
>>> Although I have found that this also works:
>>>
>>> 1. Start playing audio to the speakers
>>> 2. Turn speakers on (with the on/off button on the speakers)
>>> 3. Stop playing audio
>>> 4. Make a change to the 'PCM Playback Volume' ctrl
>>> 5. Start playing audio to the speakers again
>>>
>>> I then even here a brief "power-up buzz" coming from the
>>> speakers at 4.
>>>
>>> And this sequence also works:
>>>
>>> 1. Start playing audio to the speakers
>>> 2. Stop playing audio
>>> 3. Turn speakers on (with the on/off button on the speakers)
>>> 4. Make a change to the 'PCM Playback Volume' ctrl
>>> 5. Start playing audio to the speakers again
>>>
>>> So it seems that to work (after having been unplugged
>>> form the mains) these speakers need to:
>>>
>>> 1. Have had some audio send to them at least once
>>> 2. After this have their 'PCM Playback Volume' ctrl poked
>>>    at once while they are on (and if they are on cannot
>>>    be seen from the PC side AFAICT).
>>>
>>> Note instead of changing the 'PCM Playback Volume' ctrl
>>> toggling the associated mute ctrl works too.
>>>
>>> TL;DR: Since getting the speakers to work involves
>>> setting a ctrl while they are on, which is something
>>> which we cannot tell from the kernel side I don't believe
>>> that there is anything we can do about this from within
>>> the kernel.
>>
>> So thinking more about this I guess we could do something
>> where we resend the last PCM volume to the device every
>> 5 seconds *when the device is playing audio*, assuming that
>> the resending of the same PCM volume is sufficient to fix
>> things.
>>
>> These are pretty nice speakers so getting them to work without
>> this glitch would be nice. But it would require a significant
>> bit of (quirk enabled) code just for this 1 model speakers.
>>
>> Takashi, what do you think. Should I give the resend volume
>> once every 5 seconds idea a try, or is it likely going to
>> end up being too ugly to merge ?
> 
> It sounds too hackish and fragile to me...

Yes, I agree,

> Do we need to repeat each
> 5 seconds?  Wouldn't it suffice to touch only once at setting up the
> stream (or need before or after the stream start), instead?

The problem is that at least with my testing with alsamixer + speaker-test
I need to make the PCM ctl change when the speakers are on.

And I often find myself doing the following:

1. Start something which requires working audio
2. Oh wait, the speakers are off, turn them on

At which point if we do this at stream-start this would require
a pause + unpause. At which point just hitting volume up + down
hotkeys is just as easy (easier even when in say a video-conf-call).

So I believe my time is better spend to track down the pipewire
regression where newer pipewire versions no longer use hw-volume-ctrl
on these speakers for some reason. Fixing that will restore my old
workaround and will hopefully also help other users.

I guess this is mostly an issue for me because I turn of the
mains power to the speakers every evening, other users just
need to fiddle with the volume once and then things will work
until the speakers get unplugged from the mains.

> In anyway, alsa-info.sh output would be helpful.

Sure here you go:
http://alsa-project.org/db/?f=8b93e72b6fb4be5c426eade5f78ed58137bdf0ef'

Note there are quite a few audio devices in my setup:

1. My X1 carbon laptop's builtin sound
2. The Thunderbolt docks' USB audio (unused)
3. A TI USB audio codec going to the receiver connected to
my proper/real speakers for listening music
4. The Logitech Z-10 speakers which we are discussing here

Anyway, not sure if this is worth spending much (more) time on
but if you have some idea for me to test, let me know.

Regards,

Hans


