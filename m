Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F864631D0
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 12:08:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F9011FDB;
	Tue, 30 Nov 2021 12:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F9011FDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638270523;
	bh=c8Wxgu23DKSEXcYAvTvKMGsCZSyqMZ+052qpeXRQvWo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nYbMEhlqvrQ+okkB8V8ILUQ3w6p1nwD5huoP7v5zMv4SmW4SYd84x7BHhTMOJO9XF
	 FGOKsPW/nX07hyi3hF9BVWKV2P4J9OSbV49uNJnYOHGCzharmGC7oWDSxGLGeZ5c9x
	 j8B3HjGI7WyVOzjB+xJEgZiR+TzUM4Kn1j0IozpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1A8CF80113;
	Tue, 30 Nov 2021 12:07:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACC5CF80290; Tue, 30 Nov 2021 12:07:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAA0BF80113
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 12:07:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAA0BF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="dqExCMfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638270429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WVnG9m6B/ECdmcayHtrKNy39uVH3fzYYfIQYl9odBi4=;
 b=dqExCMfKjRB1Cw0qXheQct47ngCpVWu8KY6D9PgJSW5V6RFzm6INaNQMaN1xRxAvVjuVHz
 q/y0nmWEc4aHu9uBq7UTPGC+SUEsPesilVlOULuFXq/uXriEtJhmZC+mxC/QOv+LQw5qXB
 jPvx1BcA5jJSQ0wgFe2TJneBK3KtudA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461--OA6E65vN4GwL99qlHr8hw-1; Tue, 30 Nov 2021 06:07:07 -0500
X-MC-Unique: -OA6E65vN4GwL99qlHr8hw-1
Received: by mail-ed1-f72.google.com with SMTP id
 m17-20020aa7d351000000b003e7c0bc8523so16595224edr.1
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 03:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WVnG9m6B/ECdmcayHtrKNy39uVH3fzYYfIQYl9odBi4=;
 b=Zic973g1e9lVAUwe5a0gClEQNwbBS6C0VGqXWLBJbttNLypK23yQ2QWTpLe4GI8390
 zG0j+f22e3z8qB49EdxpVkHXtUoZRrn70HL/90s572/gF3VKghtHEZpJ9s8CBxAcS7D7
 FSzKAdQLpoI/93DbCTy4jAaSn25hZbkdMpSBGW3TqfRIYW3vdecFx/KRT4LWYE2pmmNz
 QY8nPL0B5q1KIQkms4T+nHnv1Dm8ie+zsNsxw5A8Fxwv6zIvf1TSNPga+X+fueFOJToh
 TaEB6vBiPw0ezOaz2qX/o9Vc2Cxn44rUQ8zRqvq9GmCVJ1Hz9osXpRs3H0n8Q3ylpxfV
 +Qsw==
X-Gm-Message-State: AOAM530ZMipFPIkZTeJL8nD6mig44/yBpwIRXasYOnQqYNg0Lpxs/wI7
 pRBOQmCfZ6AOE4fBzvD2BXuTLxchGuXFtAzwJYv5+tgoejmm4MqC6vfnCLpM9Uc0rZbQTgGMh56
 zS8gOh5Ttugzk+LVm+XqawsM=
X-Received: by 2002:a17:906:90da:: with SMTP id
 v26mr67771674ejw.442.1638270426028; 
 Tue, 30 Nov 2021 03:07:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz94cdPcjlkfUdJyMXPhz8MYYHZfk4NK8bvbWONHpupmBU7rnW0MgWSQ+No2uFZPzngWEvpPw==
X-Received: by 2002:a17:906:90da:: with SMTP id
 v26mr67771651ejw.442.1638270425797; 
 Tue, 30 Nov 2021 03:07:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id r3sm8920564ejr.79.2021.11.30.03.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 03:07:05 -0800 (PST)
Message-ID: <c1deb0b9-b0f1-3ea5-43ea-ac96b29e93f5@redhat.com>
Date: Tue, 30 Nov 2021 12:07:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Logitech Z10 USB speakers need a volume change before audio works
To: Takashi Iwai <tiwai@suse.de>
References: <cf7dd2f0-512c-1b8c-efb1-53f79ddfb41e@redhat.com>
 <s5ho8689zl3.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <s5ho8689zl3.wl-tiwai@suse.de>
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

On 11/25/21 13:42, Takashi Iwai wrote:
> On Thu, 25 Nov 2021 12:04:41 +0100,
> Hans de Goede wrote:
>>
>> Hi,
>>
>> I've a set of Logitech Z10 USB speakers, which act as a USB soundcard.
>>
>> They have this weird glitch where after turning off my PC (and their
>> power-supply as well) and then turning things back on, they are silent
>> until I change the PCM volume control for the speakers inside
>> alsa-mixer.
>>
>> It seems like they need some "set-volume" command to be send over the
>> USB bus to unmute them when initially powered-up / turned on.
>>
>> Is their some existing usb-audio quirk which I can try to work around this?
> 
> No such quirk is present for now.
> 
> Was it tested with 5.16-rc?  There was a change in USB-audio driver
> initialization (commit b96681bd5827) and it might have some effect in
> your case.

Yes I'm at 5.16-rc3 atm but I've been seeing this for quite some time.
I just never got around to reporting it. Mainly because I also never
got around to getting a bit clearer picture of the problem.

I've spend some time this morning to get that clearer picture,
which was insightful.

> Also, it's interesting to know whether it happens also once after
> suspend-resume, too.

suspend-resume makes no difference, not even rebooting or
powering off the machine makes a difference.

Once the speakers are in working order they stay in working order
until I turn off my machine; and then flick the power-switch on
the 240V AC power-bar which I use to power my laptop + dock +
monitors + the speakers and turn things back on the next morning.

To be clear these speakers get their audio-data over USB
(as an usb-audio device) but they have their own power-supply
they are not USB powered. They also have a "soft" on/off button
which turns on/off the amplifier and LCD screen parts but leaves
the USB audio interface active.

So I've been experimenting with reproducing the issue and I
need to do the following minimal steps to reproduce:

 1. Unplug USB
 2. Unplug power
 3. Re-plug power
 4. Re-plug USB
 5. speaker-test -Dfront:CARD=Speaker,DEV=0 -S1
 6. Turn speakers on (with the on/off button on the speakers), no audio

 5 and 6 may be swapped, same result

And now that I have a reliable reproducer I've also been
playing with a reliable workaround which looks like this:

1. Start playing audio to the speakers
2. Turn speakers on (with the on/off button on the speakers)
3. Make a change to the 'PCM Playback Volume' ctrl

Where 1. and 2. may be swapped. But the
'PCM Playback Volume' ctrl change must be made while the
speakers are on and playing audio !

Although I have found that this also works:

1. Start playing audio to the speakers
2. Turn speakers on (with the on/off button on the speakers)
3. Stop playing audio
4. Make a change to the 'PCM Playback Volume' ctrl
5. Start playing audio to the speakers again

I then even here a brief "power-up buzz" coming from the
speakers at 4.

And this sequence also works:

1. Start playing audio to the speakers
2. Stop playing audio
3. Turn speakers on (with the on/off button on the speakers)
4. Make a change to the 'PCM Playback Volume' ctrl
5. Start playing audio to the speakers again

So it seems that to work (after having been unplugged
form the mains) these speakers need to:

1. Have had some audio send to them at least once
2. After this have their 'PCM Playback Volume' ctrl poked
   at once while they are on (and if they are on cannot
   be seen from the PC side AFAICT).

Note instead of changing the 'PCM Playback Volume' ctrl
toggling the associated mute ctrl works too.

TL;DR: Since getting the speakers to work involves
setting a ctrl while they are on, which is something
which we cannot tell from the kernel side I don't believe
that there is anything we can do about this from within
the kernel.

At least we now have a detailed description of the issue
in case other users hit this too.

Regards,

Hans


p.s.

One of the reasons why I started looking into this now
is because before I could just change the volume using
volume up/down hotkeys on my kbd and that would result
in a hw volume-ctrl change fixing things. But with the
latest pipewire that workaround no longer works. So I guess
I need to talk to the pipewire devs about bringing back
the old behavior.

