Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 675451A89B0
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 20:36:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED31E886;
	Tue, 14 Apr 2020 20:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED31E886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586889386;
	bh=pZT7sdPRHAtjA5kJwMKVtCF0GCqVwbJhujPN15VkZ1E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lnWXdupZ8JZVAcjESJtDozdSpGwt6SFc2cXHxcbeEOQ8n+1UutHpS8LX1SaCjYaMk
	 LxNeNPhR/DE7Lj4A9GvODhlwM37cqtUlAySc8BRJH1Zr2Zx/RKa1v2mroHNqHU1nox
	 N5ec06Cdyp0Z4YXvSU8b3jWzlQ5kmnBeUjgIKLKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4845F80115;
	Tue, 14 Apr 2020 20:34:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B188F8013D; Tue, 14 Apr 2020 20:34:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ob3.cityemail.com (mail-ob3.cityemail.com [104.128.152.20])
 by alsa1.perex.cz (Postfix) with ESMTP id 16BE6F80115
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 20:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16BE6F80115
Received: (qmail 11149 invoked from network); 14 Apr 2020 18:34:30 -0000
Received: from riddle.wizard.ca (HELO [192.168.1.55])
 (michael@wizard.ca@104.128.144.8)
 by fe3.cityemail.com with (AES128-SHA encrypted) SMTP
 (941d7aae-7e7e-11ea-a9a8-1f0fc13ba39f); Tue, 14 Apr 2020 11:34:30 -0700
Subject: Re: [FRUSTRATED] Missing Sound Codecs for Lenovo ThinkCentre M710e
To: Takashi Iwai <tiwai@suse.de>
References: <7046b5fa-af79-5221-f54f-3d4be22e879e@wizard.ca>
 <34cfffec-39f7-d0e5-bab6-c4b0eb47943b@spliet.org>
 <8ab4b52c-5397-0fed-97ff-c8be7d4ae168@wizard.ca>
 <s5h5ze2hsv6.wl-tiwai@suse.de>
From: Michael <michael@wizard.ca>
Message-ID: <642bd0cb-cf11-cf17-0285-12ad948f43b3@wizard.ca>
Date: Tue, 14 Apr 2020 11:34:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <s5h5ze2hsv6.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-MagicMail-OS: Linux 2.2.x-3.x
X-MagicMail-UUID: 941d7aae-7e7e-11ea-a9a8-1f0fc13ba39f
X-MagicMail-Authenticated: michael@wizard.ca
X-MagicMail-SourceIP: 104.128.144.8
X-MagicMail-RegexMatch: 0
X-MagicMail-EnvelopeFrom: <michael@wizard.ca>
X-Archive: Yes
Cc: alsa-devel@alsa-project.org, Roy Spliet <nouveau@spliet.org>
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

It isn't that I can't install a new kernel, just easier to keep packaged 
versions on machines, so I don't have to track any security updates in 
the kernels..

But figured there SHOULD be some way to debug how codecs are detected, 
wanted to understand HOW the internals work better, and hopefully 
without crawling through kernel sources..

Thinking there should be some user land tools to replicate how the 
kernel internals identify codec related things, rather than just 
randomly trying alsa module configuration items.



On 2020-04-14 10:36 a.m., Takashi Iwai wrote:
> On Tue, 14 Apr 2020 19:13:14 +0200,
> Michael wrote:
>>
>> Appreciate the response, but running the 16.04 LTE with the hwe
>> kernel, which should have updated support.  I would expect that at
>> least an older codec should be supported on the board, highly doubt a
>> completely new sound card shipset would be used.
>>
>> How do I try to resolve this WITHOUT going to a 5.6 kernel?
> 
> The best is to ask your distro.  It's a distro kernel, and we have no
> idea what's missing and what's fixed, after all.
> 
> But, if you can just test 5.6.y kernel while keeping the rest of your
> system, and it still shows the same problem, then it becomes more
> interesting to us.  Installing and testing a new kernel takes only a
> couple of minutes.  Any reason to hesitate to do it so much...?
> 
> 
> thanks,
> 
> Takashi
> 
>>
>> On 2020-04-14 8:55 a.m., Roy Spliet wrote:
>>> The 4.15.0 kernel was released in January 2018. Your computer was
>>> first sold around May 2018 (at least where I'm from). It's hardly
>>> surprising that some components in your computer aren't
>>> supported. First try upgrading to a newer kernel (ideally 5.6)
>>> before you try other steps to debug your issues.
>>>
>>> Roy
>>>
>>> Op 14-04-2020 om 15:16 schreef Michael:
>>>> Hi All,
>>>>
>>>> Technically this probably should go to a support channnel, and not
>>>> a development list, but at my wits end.
>>>>
>>>> Kernel:  4.15.0-91-generic #92~16.04.1-Ubuntu SMP
>>>>
>>>> dmesg | grep snd
>>>> [   12.656843] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops
>>>> i915_audio_component_bind_ops [i915])
>>>> [   12.807521] snd_hda_intel 0000:00:1f.3: CORB reset timeout#1,
>>>> CORBRP = 0
>>>> [   12.810429] snd_hda_intel 0000:00:1f.3: no codecs found!
>>>>
>>>> I have been playing with settings in the modprobe directory for
>>>> Also with no effect.. current settings are..
>>>>
>>>> options snd-hda-intel single_cmd=1
>>>> options snd-hda-intel probe_mask=1
>>>> options snd-hda-intel model=thinkpad
>>>> options snd-hda-intel position_fix=3
>>>>
>>>> Have tried model=generic, and various other suggestions from
>>>> online, but at a loss.  Don't see anything in:
>>>>
>>>> https://github.com/torvalds/linux/blob/master/Documentation/sound/hd-audio/models.rst
>>>>
>>>>
>>>> Your ALSA information is located at
>>>> http://alsa-project.org/db/?f=7898b30139e9a91fecec22f3ee46049f33248b85
>>>>
>>>> Can anyone point me to how to debug this further, or any way to
>>>> force detection of a proper codec for this model?
>>>>
>>>> 00:1f.3 Audio device [0403]: Intel Corporation 200 Series PCH HD
>>>> Audio [8086:a2f0]
>>>>       Subsystem: Lenovo Device [17aa:313c]
>>>>       Kernel driver in use: snd_hda_intel
>>>>
>>>>
>>>>          description: Motherboard
>>>>          product: 313C
>>>>          vendor: LENOVO
>>>>          physical id: 0
>>>>          version: SDK0J40697 WIN 3305181519567
>>>>          slot: Default string
>>>>
>>>> Booting in legacy OS mode, not EUFI..
>>>>
>>>>
>>>>
>>
>>
>> -- 
>> "Catch the Magic of Linux..."
>> ------------------------------------------------------------------------
>> Michael Peddemors, President/CEO LinuxMagic Inc.
>> Visit us at http://www.linuxmagic.com @linuxmagic
>> A Wizard IT Company - For More Info http://www.wizard.ca
>> "MagicSpam" is a Registered TradeMark of Wizard Tower TechnoServices Ltd.
>> ------------------------------------------------------------------------
>> 604-682-0300 Beautiful British Columbia, Canada
>>
>> This email and any electronic data contained are confidential and intended
>> solely for the use of the individual or entity to which they are addressed.
>> Please note that any views or opinions presented in this email are solely
>> those of the author and are not intended to represent those of the company.
>>


-- 
"Catch the Magic of Linux..."
------------------------------------------------------------------------
Michael Peddemors, President/CEO LinuxMagic Inc.
Visit us at http://www.linuxmagic.com @linuxmagic
A Wizard IT Company - For More Info http://www.wizard.ca
"MagicSpam" is a Registered TradeMark of Wizard Tower TechnoServices Ltd.
------------------------------------------------------------------------
604-682-0300 Beautiful British Columbia, Canada

This email and any electronic data contained are confidential and intended
solely for the use of the individual or entity to which they are addressed.
Please note that any views or opinions presented in this email are solely
those of the author and are not intended to represent those of the company.
