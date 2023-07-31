Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 846B7769FC6
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 19:51:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7638A7F4;
	Mon, 31 Jul 2023 19:50:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7638A7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690825861;
	bh=m83DG/zNcEzrNDecx1TCx6lXCgLpdVIOXsYtYNhCSoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nu9mdX4mXb2FYl7Ss2j12/X1dkh4WHYNSbkA7gfqQC0SZ/7jJh96ASpffAAwuGxy+
	 0/ekvX3kRKW+HcPC2tn1U5OEFZlBkuSHA6KHPJJfqR9CCh4xP+xe1lrMmi9VPH3eKK
	 Narx+ZIBUzklSyCTzGN+jYBF+OA2JNnW0un1Amdw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFF84F80153; Mon, 31 Jul 2023 19:50:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B12DF80163;
	Mon, 31 Jul 2023 19:50:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C8C0F8016D; Mon, 31 Jul 2023 19:50:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4981F80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 19:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4981F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=j3F+c8kw
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 632C78690D;
	Mon, 31 Jul 2023 19:49:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1690825792;
	bh=NuwWYIg1h7HtOlXVmUdLg8Btx9A1MuA7769cYTsFfzU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j3F+c8kwDw0GCNfqteeIAuk/jTao4Zy/3aF0e3XtnwlHFRJEmZ0DGTYA9Ly8jRufa
	 IY8EzJkoj4Gj9oVcKPkf79m8FgvBskyV6KbAdtbzByTcyrPdeipsd6tCuaxKmaSDiF
	 LsRWADH4WxnOHUVOsWx3fAdUFpL2CeAO3nuzHpV87qO15zH6uV3/xOPaf3rlPFNE+R
	 nGDMROFNZzs0WPJk3P4YmAkkO36BnvMoUukBCF4JFTCWL/xabRPDPp+4hyLeyxYTFJ
	 VWbJCcMkExLpYXBEzT+7w4m1etwuKDNaO4OZ4e4CWkFUTyr9xrXMuR/J8NRsYJWLQD
	 /l9UuodPhsEiA==
Message-ID: <f4612dc5-a7d4-74ba-2ed8-ea70314625b6@denx.de>
Date: Mon, 31 Jul 2023 19:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] Input: pwm-beeper - Support volume setting via sysfs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, Jeff LaBundy <jeff@labundy.com>,
 linux-input@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Manuel Traut <manuel.traut@mt.com>, Thierry Reding
 <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <ZF7kCjKGVjsxK8ec@nixie71>
 <0ef98ec1-6191-c72e-2362-310db7f09b84@denx.de>
 <06379f26-ab24-85f9-783f-0c49d4291b23@denx.de> <ZMdIZiC453onyeHh@google.com>
 <873514d2ju.wl-tiwai@suse.de> <63adce9a-df65-b462-9055-0ece5216d680@denx.de>
 <87tttkjmyu.wl-tiwai@suse.de> <0cffe366-75af-d8a8-8920-6fb94c321a89@denx.de>
 <87h6pkjh7q.wl-tiwai@suse.de> <618add56-3675-4efe-5b20-665c10040e03@denx.de>
 <ZMfgJ3o00nApkXGp@google.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ZMfgJ3o00nApkXGp@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Message-ID-Hash: UP5DWSTF6QFNTOAQ5XBLZLL3AFWBXPYR
X-Message-ID-Hash: UP5DWSTF6QFNTOAQ5XBLZLL3AFWBXPYR
X-MailFrom: marex@denx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UP5DWSTF6QFNTOAQ5XBLZLL3AFWBXPYR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/31/23 18:24, Dmitry Torokhov wrote:
> On Mon, Jul 31, 2023 at 04:36:01PM +0200, Marek Vasut wrote:
>> On 7/31/23 16:20, Takashi Iwai wrote:
>>
>> [...]
>>
>>>>>> Uh, I don't need a full sound device to emit beeps, that's not even
>>>>>> possible with this hardware.
>>>>>
>>>>> Heh, I also don't recommend that route, either :)
>>>>> (Though, it must be possible to create a sound device with that beep
>>>>> control in theory)
>>>>
>>>> I mean, I can imagine one could possibly use PCM DMA to cook samples
>>>> to feed some of the PWM devices so they could possibly be used to
>>>> generate low quality audio, as a weird limited DAC, but ... that's not
>>>> really generic, and not what I want.
>>>
>>> Oh I see how the misunderstanding came; I didn't mean the PCM
>>> implementation like pcsp driver.  The pcsp driver is a real hack and
>>> it's there just for fun, not for any real practical use.
>>
>> Ah :)
>>
>>> What I meant was rather that you can create a sound device containing
>>> a mixer volume control that serves exactly like the sysfs or whatever
>>> other interface, without any PCM stream or other interface.
>>
>> Ahhh, hum, I still feel like this might be a bit overkill here.
>>
>>>>>> I only need to control loudness of the
>>>>>> beeper that is controlled by PWM output. That's why I am trying to
>>>>>> extend the pwm-beeper driver, which seems the best fit for such a
>>>>>> device, it is only missing this one feature (loudness control).
>>>>>
>>>>> So the question is what's expected from user-space POV.  If a more
>>>>> generic control of beep volume is required, e.g. for desktop-like
>>>>> usages, an implementation of sound driver wouldn't be too bad.
>>>>> OTOH, for other specific use-cases, it doesn't matter much in which
>>>>> interface it's implemented, and sysfs could be an easy choice.
>>>>
>>>> The whole discussion above has been exactly about this. Basically the
>>>> thing is, we can either have:
>>>> - SND_TONE (via some /dev/input/eventX) + sysfs volume control
>>>>     -> This is simple, but sounds racy between input and sysfs accesses
>>>
>>> Hmm, how can it be racy if you do proper locking?
>>
>> I can imagine two applications can each grab one of the controls and that
>> makes the interface a bit not nice. That would require extra synchronization
>> in userspace and so on.
>>
>>>> - SND_TONE + SND_TONE_SET_VOLUME
>>>>     -> User needs to do two ioctls, hum
>>>> - some new SND_TONE_WITH_VOLUME
>>>>     -> Probably the best option, user sets both tone frequency and volume
>>>>        in one go, and it also only extends the IOCTL interface, so older
>>>>        userspace won't have issues
>>>
>>> Those are "extensions" I have mentioned, and I'm not a big fan for
>>> that, honestly speaking.
>>>
>>> The fact that the beep *output* stuff is provided by the *input*
>>> device is already confusing
>>
>> I agree, this confused me as well.
> 
> This comes from the times when keyboards themselves were capable of
> emitting bells (SUN, DEC, etc). In hindsight it was not the best way of
> structuring things, same with the keyboard LEDs (that are now plugged
> into the LED subsystem, but still allow be driven through input).
> 
> And in the same vein I wonder if we should bite the bullet and pay with
> a bit of complexity but move sound-related things to sound subsystem.

I am not sure that's the right approach here, since the device cannot do 
PCM playback, just bleeps.

>>> (it was so just because of historical
>>> reason), and yet you start implementing more full-featured mixer
>>> control.  I'd rather keep fingers away.
>>>
>>> Again, if user-space requires the compatible behavior like the
>>> existing desktop usages
>>
>> It does not. These pwm-beeper devices keep showing up in various embedded
>> devices these days.
>>
>>> , it can be implemented in a similar way like
>>> the existing ones; i.e. provide a mixer control with a proper sound
>>> device.  The sound device doesn't need to provide a PCM interface but
>>> just with a mixer interface.
>>>
>>> Or, if the purpose of your target device is a special usage, you don't
>>> need to consider too much about the existing interface, and try to
>>> keep the change as minimal as possible without too intrusive API
>>> changes.
>>
>> My use case is almost perfectly matched by the current input pwm-beeper
>> driver, the only missing bit is the ability to control the loudness at
>> runtime. I think adding the SND_TONE_WITH_VOLUME parameter would cover it,
>> with least intrusive API changes.
>>
>> The SND_TONE already supports configuring tone frequency in Hz as its
>> parameter. Since anything above 64 kHz is certainly not hearable by humans,
>> I would say the SND_TONE_WITH_VOLUME could use 16 LSbits for frequency (so
>> up to 65535 Hz , 0 is OFF), and 16 MSbits for volume .
>>
>> I'm hesitant to overcomplicate something which can currently be controlled
>> via single ioctl by pulling in sound subsystem into the picture.
> 
> Can you tell a bit more about your use case? What needs to control the
> volume of beeps? Is this the only source of sounds on the system?

Custom user space application. The entire userspace is custom built in 
this case.

In this case, it is a single-use device (think e.g. the kind of 
thermometer you stick in your ear when you're ill, to find out how warm 
you are).

The beeper there is used to do just that, bleep (with different 
frequencies to indicate different stuff), and that works. What I need in 
addition to that is control the volume of the bleeps from the 
application, so it isn't too noisy. And that needs to be 
user-controllable at runtime, so not something that goes in DT.

Right now there is just the bleeper , yes.
