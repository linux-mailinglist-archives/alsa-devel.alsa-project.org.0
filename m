Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 007D72D4189
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 12:58:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1B21612;
	Wed,  9 Dec 2020 12:57:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1B21612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607515121;
	bh=XBFd5zzs06Ng8ewbH8HTrnYmGBuGVcb/ChawbS32uzQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IOhFbjQrBsBka6fOrdg2T4niKqCIa9n0bLsvNNLYocn5l3gX0CdUD1fJD4RAVz0rZ
	 groPk9Ss8+/QQJTJsZZXnhUycawanrDiqrKZXpkxlFcCC8gwJ3o3tDAx61LuBI4QmF
	 Usc8pxdW+OK1kzpNHzAJ8POFu0L9DGTOj5WXlqoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 830B5F80217;
	Wed,  9 Dec 2020 12:57:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7604F8020D; Wed,  9 Dec 2020 12:57:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E70E1F800E1
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 12:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E70E1F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de
 header.b="Akn5TK6c"
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 35D682400FB
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 12:56:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1607515016; bh=XBFd5zzs06Ng8ewbH8HTrnYmGBuGVcb/ChawbS32uzQ=;
 h=Date:From:To:Cc:Subject:From;
 b=Akn5TK6cZJbdxHdn1sxJ9DjP688et0fK4PTPF5r/SvnRy96XaVjb50UOoNpszF7hS
 qBIQLOmlk0F7Ehis5i7maB5nX5xdhlBqeLlq9DYk2ucwRIyvo2ZHBEFEIeGA4u8qq8
 JCIJBeJflmDxb96Ygaxb7SwhLe/gUtJ0kJ/6hA5VRV3VbF5UHpjPxF4ojdpP6wSkaV
 vQBTQlSXIvAtKm2u8smGDhiH0taHuUtsHS8QcBzha7RAqqKKeM9p1Zaosngx+ksFrz
 fU87pzXcHqT8l/VrCh1o0z/bCJvlcsBQuwYn13a+XeQhvGy3UaGL+5YbvppcYAAhJI
 PBRLzxLOv/+Vw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4CrbBH5P9mz9rxB;
 Wed,  9 Dec 2020 12:56:55 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 09 Dec 2020 12:56:55 +0100
From: meschi@posteo.de
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Steinberg UR22 Crackling and Clicks
In-Reply-To: <s5ha6unv52k.wl-tiwai@suse.de>
References: <ce03244f4699ffc9574ecc2dae41a417@posteo.de>
 <s5hft4gy4ar.wl-tiwai@suse.de> <61da73624ff3855867b8e65936fc2e1c@posteo.de>
 <s5hft4gwdji.wl-tiwai@suse.de> <eb1baf202fa4cd74a502661bb0ce5279@posteo.de>
 <s5ho8j4ujwx.wl-tiwai@suse.de> <987d1956f52ba49dc3b587c33e08bfb2@posteo.de>
 <s5heek0ugtk.wl-tiwai@suse.de> <4188489e2967b44e57653193cab9d1cb@posteo.de>
 <s5ha6unv52k.wl-tiwai@suse.de>
Message-ID: <5811c5724e831c38395d3e5b57439b4d@posteo.de>
X-Sender: meschi@posteo.de
User-Agent: Posteo Webmail
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

>> >> >> >> > It's likely the issues with the implicit feedback.
>> >> >> >> >
>> >> >> >> > The latest development tree (either linux-next tree or
>> >> >> >> > topic/usb-audio-refactoring branch of my sound.git tree) contains the
>> >> >> >> > improvements of the implicit feedback mode.
>> >> >> >> >
>> >> >> >> >
>> >> >> >> > Takashi
>> >> >> When I try to play a file now this happens:
>> >> >> $ aplay -D plughw:CARD=UR22 ./file.wav
>> >> >> Playing WAVE './file.wav' : Signed 16 bit Little Endian, Rate 44100
>> >> >> Hz, Stereo
>> >> >> aplay: set_params:1407: Unable to install hw params:
>> >> >
>> >> > It's a known side-effect of the implicit feedback mode, and the latest
>> >> > patchset I mentioned earlier addresses the issue.
>> >> >
>> >> >
>> >> > Takashi
>> >>
>> >> I'm already running the kernel built from the linux-next tree...
>> >> I built next-20201208 from
>> >> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> >> Is there another patch set that I'm missing?
>> >
>> > Hm, strange.
>> >
>> > Please check the contents of /proc/asound/card*/stream* file.  With
>> > the latest patches and the implicit feedback mode, you should see the
>> > lines like "Sync Endpoint: 0x...." and "Implicit Feedback Mode: yes".
>> >
>> >
>> > Takashi
>> 
>> Yes, I see this:
>> 
>> Yamaha Corporation Steinberg UR22 at usb-0000:00:1a.7-3, high speed :
>> USB Audio
>> 
>> Playback:
>>   Status: Stop
>>   Interface 1
>>     Altset 1
>>     Format: S24_3LE
>>     Channels: 2
>>     Endpoint: 0x07 (7 OUT) (ASYNC)
>>     Rates: 44100, 48000
>>     Data packet interval: 125 us
>>     Bits: 24
>>     Channel map: FL FR
>>     Sync Endpoint: 0x81 (1 IN)
>>     Sync EP Interface: 2
>>     Sync EP Altset: 1
>>     Implicit Feedback Mode: Yes
>>   Interface 1
>>     Altset 2
>>     Format: S24_3LE
>>     Channels: 2
>>     Endpoint: 0x07 (7 OUT) (ASYNC)
>>     Rates: 88200, 96000
>>     Data packet interval: 125 us
>>     Bits: 24
>>     Channel map: FL FR
>>     Sync Endpoint: 0x81 (1 IN)
>>     Sync EP Interface: 2
>>     Sync EP Altset: 1
>>     Implicit Feedback Mode: Yes
>>   Interface 1
>>     Altset 3
>>     Format: S24_3LE
>>     Channels: 2
>>     Endpoint: 0x07 (7 OUT) (ASYNC)
>>     Rates: 176400, 192000
>>     Data packet interval: 125 us
>>     Bits: 24
>>     Channel map: FL FR
>>     Sync Endpoint: 0x81 (1 IN)
>>     Sync EP Interface: 2
>>     Sync EP Altset: 1
>>     Implicit Feedback Mode: Yes
>> 
>> Capture:
>>   Status: Stop
>>   Interface 2
>>     Altset 1
>>     Format: S24_3LE
>>     Channels: 2
>>     Endpoint: 0x86 (6 IN) (ASYNC)
>>     Rates: 44100, 48000
>>     Data packet interval: 125 us
>>     Bits: 24
>>     Channel map: FL FR
>>   Interface 2
>>     Altset 2
>>     Format: S24_3LE
>>     Channels: 2
>>     Endpoint: 0x86 (6 IN) (ASYNC)
>>     Rates: 88200, 96000
>>     Data packet interval: 125 us
>>     Bits: 24
>>     Channel map: FL FR
>>   Interface 2
>>     Altset 3
>>     Format: S24_3LE
>>     Channels: 2
>>     Endpoint: 0x86 (6 IN) (ASYNC)
>>     Rates: 176400, 192000
>>     Data packet interval: 125 us
>>     Bits: 24
>>     Channel map: FL FR
> 
> OK, then it means that your device isn't compatible with UR22C.
> It has a different endpoint assignment.
> 
> What happens if you run this kernel without quirk_alias option?
> Is the implicit feedback still set?
> 
> 
> Takashi

When running it without the quirk_alias option implicit feedback isn't 
set. I have appended the output at the end of this mail. Does this mean 
the card runs with explicit feedback, or with no feedback at all? I've 
tested this on other linux distros (Fedora 33, Kernel 5.8 and Ubuntu 
14.04.6 LTS Kernel 4.4 or 4.6, don't remember exactly), problem still 
exists, so this doesn't look like a regression to me.
Just to be sure: the last commits to pcm.c and implicit.h in my tree are 
from Nov. 23. Is that correct? I don't find the 
topic/usb-audio-refactoring branch on the public git mirrors of 
tiwai/sound, so not sure I'm running the latest changes.

Yamaha Corporation Steinberg UR22 at usb-0000:00:1a.7-3, high speed : 
USB Audio

Playback:
   Status: Stop
   Interface 1
     Altset 1
     Format: S24_3LE
     Channels: 2
     Endpoint: 0x07 (7 OUT) (ASYNC)
     Rates: 44100, 48000
     Data packet interval: 125 us
     Bits: 24
     Channel map: FL FR
   Interface 1
     Altset 2
     Format: S24_3LE
     Channels: 2
     Endpoint: 0x07 (7 OUT) (ASYNC)
     Rates: 88200, 96000
     Data packet interval: 125 us
     Bits: 24
     Channel map: FL FR
   Interface 1
     Altset 3
     Format: S24_3LE
     Channels: 2
     Endpoint: 0x07 (7 OUT) (ASYNC)
     Rates: 176400, 192000
     Data packet interval: 125 us
     Bits: 24
     Channel map: FL FR

Capture:
   Status: Stop
   Interface 2
     Altset 1
     Format: S24_3LE
     Channels: 2
     Endpoint: 0x86 (6 IN) (ASYNC)
     Rates: 44100, 48000
     Data packet interval: 125 us
     Bits: 24
     Channel map: FL FR
   Interface 2
     Altset 2
     Format: S24_3LE
     Channels: 2
     Endpoint: 0x86 (6 IN) (ASYNC)
     Rates: 88200, 96000
     Data packet interval: 125 us
     Bits: 24
     Channel map: FL FR
   Interface 2
     Altset 3
     Format: S24_3LE
     Channels: 2
     Endpoint: 0x86 (6 IN) (ASYNC)
     Rates: 176400, 192000
     Data packet interval: 125 us
     Bits: 24
     Channel map: FL FR


