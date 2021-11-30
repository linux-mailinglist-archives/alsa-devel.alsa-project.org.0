Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E15C64636D6
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 15:35:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721F92030;
	Tue, 30 Nov 2021 15:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721F92030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638282941;
	bh=UJPvImIhh/XpYJRWNF9ECtkblRQFdrsiK+ev5IrRmq0=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gdsuH1rneuC6JlRZTDE7EQBN3NoFDvlO3hkY8qNrSXWyerWryHCqjJaqeAJcnncSH
	 Cz6yPNBzPKVpAM/UEZR+BuUS0q8WI9ajKjUgwgHOCH56S4H47xD4qWw4RYRjYjl254
	 nE6iDB0UCuquQKQCuRzucl4vpll4uZfuUusCEynk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7F30F80290;
	Tue, 30 Nov 2021 15:34:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23A00F8028D; Tue, 30 Nov 2021 15:34:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1498F80113
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 15:34:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1498F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="MaTKQ2hk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638282856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QumN7518azXlUlhpYnRURLxXoUoJOQO2uyMBeBGMFjY=;
 b=MaTKQ2hkWp4A3MH4F2+iHxizKym/IG/hmEKIVmsPAi8pNp9PpSqq0zwJrm3nSZdGAVdips
 Rn04YPKgWxqGvFxdlnU+4wg/zl+B0cwNhr/5kfFcS6V3Njy/elDkpsEJP7GTccjO2Qxok5
 iktmiNJCEBkRkDuLsSTT1g7XekqVyzs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-pOfFdMIDMzu5pHxTQJ4FCA-1; Tue, 30 Nov 2021 09:33:39 -0500
X-MC-Unique: pOfFdMIDMzu5pHxTQJ4FCA-1
Received: by mail-ed1-f69.google.com with SMTP id
 w4-20020aa7cb44000000b003e7c0f7cfffso17134770edt.2
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 06:33:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=QumN7518azXlUlhpYnRURLxXoUoJOQO2uyMBeBGMFjY=;
 b=imzdNzlV0lGxZ/YPPU7h2PCjTxLNEAWsQzt/HudCwPkpk/BYygzLK4j0jvR8mrnvxE
 z5/UDdmKefeIKRQHnPNXHMbvHtwmcKb4aSc+EDwmKE/eYdS0s+NXqNqVAOR7gmH5r2av
 ILSydVpOp71V5lRacQoJiWiTt27bcsYipaEuRC8gFYSCkrljxMXBfb8LRF3Uml4zEkQd
 RXLwTXSr25eWqxU7XvThKuAvwBb3ZLUJkxwXqaihcRZ4or7pJrx0YwaZ6JEWn+2CDPWf
 ZE8OkbEZxbuH0aMHqNhg/i0kg6bKhoiwibkvAAmpic9KoW5q7Z7dsVMlgoGOT+CKUjor
 9yBA==
X-Gm-Message-State: AOAM530K/uTDJ9jrGbezunjPDAv+6psBp5eFIYzqpg0sFSSvQEE8VW5j
 77lVRhHDODFOa6yiTsOQhxUHv9M7bK9P3Z/pFKaS3oU2+j93/kmysKiGNjBe7ocagkTRuB1ajYF
 3b28VskWXLHNyjrDoylekJ6k=
X-Received: by 2002:a17:906:d54e:: with SMTP id
 cr14mr67663072ejc.458.1638282817717; 
 Tue, 30 Nov 2021 06:33:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyh/DTsSN7D6jxhxD2bRoFoQ54dec3a3/EQpXOyEvWf9IcnQPcIO155oUCoT2kjmOTH4QYSNQ==
X-Received: by 2002:a17:906:d54e:: with SMTP id
 cr14mr67663040ejc.458.1638282817464; 
 Tue, 30 Nov 2021 06:33:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id qk40sm7070728ejc.2.2021.11.30.06.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 06:33:37 -0800 (PST)
Message-ID: <7f36906e-fd4b-c14e-4189-0d8b7de271ac@redhat.com>
Date: Tue, 30 Nov 2021 15:33:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Logitech Z10 USB speakers need a volume change before audio works
From: Hans de Goede <hdegoede@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
References: <cf7dd2f0-512c-1b8c-efb1-53f79ddfb41e@redhat.com>
 <s5ho8689zl3.wl-tiwai@suse.de>
 <c1deb0b9-b0f1-3ea5-43ea-ac96b29e93f5@redhat.com>
In-Reply-To: <c1deb0b9-b0f1-3ea5-43ea-ac96b29e93f5@redhat.com>
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

On 11/30/21 12:07, Hans de Goede wrote:
> Hi,
> 
> On 11/25/21 13:42, Takashi Iwai wrote:
>> On Thu, 25 Nov 2021 12:04:41 +0100,
>> Hans de Goede wrote:
>>>
>>> Hi,
>>>
>>> I've a set of Logitech Z10 USB speakers, which act as a USB soundcard.
>>>
>>> They have this weird glitch where after turning off my PC (and their
>>> power-supply as well) and then turning things back on, they are silent
>>> until I change the PCM volume control for the speakers inside
>>> alsa-mixer.
>>>
>>> It seems like they need some "set-volume" command to be send over the
>>> USB bus to unmute them when initially powered-up / turned on.
>>>
>>> Is their some existing usb-audio quirk which I can try to work around this?
>>
>> No such quirk is present for now.
>>
>> Was it tested with 5.16-rc?  There was a change in USB-audio driver
>> initialization (commit b96681bd5827) and it might have some effect in
>> your case.
> 
> Yes I'm at 5.16-rc3 atm but I've been seeing this for quite some time.
> I just never got around to reporting it. Mainly because I also never
> got around to getting a bit clearer picture of the problem.
> 
> I've spend some time this morning to get that clearer picture,
> which was insightful.
> 
>> Also, it's interesting to know whether it happens also once after
>> suspend-resume, too.
> 
> suspend-resume makes no difference, not even rebooting or
> powering off the machine makes a difference.
> 
> Once the speakers are in working order they stay in working order
> until I turn off my machine; and then flick the power-switch on
> the 240V AC power-bar which I use to power my laptop + dock +
> monitors + the speakers and turn things back on the next morning.
> 
> To be clear these speakers get their audio-data over USB
> (as an usb-audio device) but they have their own power-supply
> they are not USB powered. They also have a "soft" on/off button
> which turns on/off the amplifier and LCD screen parts but leaves
> the USB audio interface active.
> 
> So I've been experimenting with reproducing the issue and I
> need to do the following minimal steps to reproduce:
> 
>  1. Unplug USB
>  2. Unplug power
>  3. Re-plug power
>  4. Re-plug USB
>  5. speaker-test -Dfront:CARD=Speaker,DEV=0 -S1
>  6. Turn speakers on (with the on/off button on the speakers), no audio
> 
>  5 and 6 may be swapped, same result
> 
> And now that I have a reliable reproducer I've also been
> playing with a reliable workaround which looks like this:
> 
> 1. Start playing audio to the speakers
> 2. Turn speakers on (with the on/off button on the speakers)
> 3. Make a change to the 'PCM Playback Volume' ctrl
> 
> Where 1. and 2. may be swapped. But the
> 'PCM Playback Volume' ctrl change must be made while the
> speakers are on and playing audio !
> 
> Although I have found that this also works:
> 
> 1. Start playing audio to the speakers
> 2. Turn speakers on (with the on/off button on the speakers)
> 3. Stop playing audio
> 4. Make a change to the 'PCM Playback Volume' ctrl
> 5. Start playing audio to the speakers again
> 
> I then even here a brief "power-up buzz" coming from the
> speakers at 4.
> 
> And this sequence also works:
> 
> 1. Start playing audio to the speakers
> 2. Stop playing audio
> 3. Turn speakers on (with the on/off button on the speakers)
> 4. Make a change to the 'PCM Playback Volume' ctrl
> 5. Start playing audio to the speakers again
> 
> So it seems that to work (after having been unplugged
> form the mains) these speakers need to:
> 
> 1. Have had some audio send to them at least once
> 2. After this have their 'PCM Playback Volume' ctrl poked
>    at once while they are on (and if they are on cannot
>    be seen from the PC side AFAICT).
> 
> Note instead of changing the 'PCM Playback Volume' ctrl
> toggling the associated mute ctrl works too.
> 
> TL;DR: Since getting the speakers to work involves
> setting a ctrl while they are on, which is something
> which we cannot tell from the kernel side I don't believe
> that there is anything we can do about this from within
> the kernel.

So thinking more about this I guess we could do something
where we resend the last PCM volume to the device every
5 seconds *when the device is playing audio*, assuming that
the resending of the same PCM volume is sufficient to fix
things.

These are pretty nice speakers so getting them to work without
this glitch would be nice. But it would require a significant
bit of (quirk enabled) code just for this 1 model speakers.

Takashi, what do you think. Should I give the resend volume
once every 5 seconds idea a try, or is it likely going to
end up being too ugly to merge ?

Regards,

Hans

