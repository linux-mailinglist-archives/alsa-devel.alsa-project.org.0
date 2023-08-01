Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1196276B436
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 13:59:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95DF982B;
	Tue,  1 Aug 2023 13:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95DF982B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690891184;
	bh=IBWvEDWTmp2CXJ6e/mqUYh+qWYu6IwSKNiJifnnPx+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f1IlMhaBRFyNFia8nj4p5VXRGuIZSEoMZ2jZ4j0OgFL2qZ8wtYJzZksQflObC3bmR
	 2fjG/dxFBlk3KTTnRAkFiPbO8Dh02mNkion8RXgwmKIBY0hr5TXNEDCAD2d5Zb2ROk
	 vWQqZa9y/nomMYke/Ca6r962apPbi2+ZduoezAfE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 458BFF80548; Tue,  1 Aug 2023 13:58:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89F68F80548;
	Tue,  1 Aug 2023 13:58:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B378F801D5; Tue,  1 Aug 2023 13:58:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 359E1F80149
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 13:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 359E1F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=lZPfClti
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 12F4486C0F;
	Tue,  1 Aug 2023 13:57:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1690891071;
	bh=kobzxbfj/seQdqQDyV8pMsW0mMO5C8/xv+OxkkJT0ls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lZPfClti0OlXE1PnPFw7/9rnD0T4t3EKg1GwFq/aIGd6RRnJcbwJdL5ap8zhbyoH9
	 nthsYPxztox4QXFR+PMSqYtpRwJauaS4hxOAXO0kyKFXMMqAcunl0jEaUOP2t7FLjt
	 48yzKH4qkUQEVcha/9kBw1Kxn3NvTvRF1Vq0KJdtiVE51vDevQraPgCROkJrW8ZOex
	 a/d+tMEcbZScYjYKdPnF6dLtK6r1x6hTIuUVavtha2qbiHNAUsRQeO5oS7kIhnH8f5
	 mQm501nR8lWour4bpF5A1JKwFGj7CFNSWMLenEm7e8WBYsfDSXPQ7QMRDwc7HxFYRl
	 syq+9fOGgBx7A==
Message-ID: <d0f284d5-6922-ea3b-3447-c089b0d24587@denx.de>
Date: Tue, 1 Aug 2023 13:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] Input: pwm-beeper - Support volume setting via sysfs
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jeff LaBundy <jeff@labundy.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Manuel Traut <manuel.traut@mt.com>, Thierry Reding
 <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <ZMdIZiC453onyeHh@google.com> <873514d2ju.wl-tiwai@suse.de>
 <63adce9a-df65-b462-9055-0ece5216d680@denx.de> <87tttkjmyu.wl-tiwai@suse.de>
 <0cffe366-75af-d8a8-8920-6fb94c321a89@denx.de> <87h6pkjh7q.wl-tiwai@suse.de>
 <618add56-3675-4efe-5b20-665c10040e03@denx.de> <ZMfgJ3o00nApkXGp@google.com>
 <f4612dc5-a7d4-74ba-2ed8-ea70314625b6@denx.de> <ZMh0Sa9s25JHhWw5@nixie71>
 <ZMi0HT/yaTo9uTyi@google.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ZMi0HT/yaTo9uTyi@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Message-ID-Hash: VVKZHFCQA6PF2HHQ2OFY7XEO6MWWGMPW
X-Message-ID-Hash: VVKZHFCQA6PF2HHQ2OFY7XEO6MWWGMPW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVKZHFCQA6PF2HHQ2OFY7XEO6MWWGMPW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/1/23 09:28, Dmitry Torokhov wrote:
> On Mon, Jul 31, 2023 at 09:56:09PM -0500, Jeff LaBundy wrote:
>> Hi all,
>>
>> On Mon, Jul 31, 2023 at 07:49:50PM +0200, Marek Vasut wrote:
>>> On 7/31/23 18:24, Dmitry Torokhov wrote:
>>>> On Mon, Jul 31, 2023 at 04:36:01PM +0200, Marek Vasut wrote:
>>>>> On 7/31/23 16:20, Takashi Iwai wrote:
>>>>>
>>>>> [...]
>>>>>
>>>>>>>>> Uh, I don't need a full sound device to emit beeps, that's not even
>>>>>>>>> possible with this hardware.
>>>>>>>>
>>>>>>>> Heh, I also don't recommend that route, either :)
>>>>>>>> (Though, it must be possible to create a sound device with that beep
>>>>>>>> control in theory)
>>>>>>>
>>>>>>> I mean, I can imagine one could possibly use PCM DMA to cook samples
>>>>>>> to feed some of the PWM devices so they could possibly be used to
>>>>>>> generate low quality audio, as a weird limited DAC, but ... that's not
>>>>>>> really generic, and not what I want.
>>>>>>
>>>>>> Oh I see how the misunderstanding came; I didn't mean the PCM
>>>>>> implementation like pcsp driver.  The pcsp driver is a real hack and
>>>>>> it's there just for fun, not for any real practical use.
>>>>>
>>>>> Ah :)
>>>>>
>>>>>> What I meant was rather that you can create a sound device containing
>>>>>> a mixer volume control that serves exactly like the sysfs or whatever
>>>>>> other interface, without any PCM stream or other interface.
>>>>>
>>>>> Ahhh, hum, I still feel like this might be a bit overkill here.
>>>>>
>>>>>>>>> I only need to control loudness of the
>>>>>>>>> beeper that is controlled by PWM output. That's why I am trying to
>>>>>>>>> extend the pwm-beeper driver, which seems the best fit for such a
>>>>>>>>> device, it is only missing this one feature (loudness control).
>>>>>>>>
>>>>>>>> So the question is what's expected from user-space POV.  If a more
>>>>>>>> generic control of beep volume is required, e.g. for desktop-like
>>>>>>>> usages, an implementation of sound driver wouldn't be too bad.
>>>>>>>> OTOH, for other specific use-cases, it doesn't matter much in which
>>>>>>>> interface it's implemented, and sysfs could be an easy choice.
>>>>>>>
>>>>>>> The whole discussion above has been exactly about this. Basically the
>>>>>>> thing is, we can either have:
>>>>>>> - SND_TONE (via some /dev/input/eventX) + sysfs volume control
>>>>>>>      -> This is simple, but sounds racy between input and sysfs accesses
>>>>>>
>>>>>> Hmm, how can it be racy if you do proper locking?
>>>>>
>>>>> I can imagine two applications can each grab one of the controls and that
>>>>> makes the interface a bit not nice. That would require extra synchronization
>>>>> in userspace and so on.
>>>>>
>>>>>>> - SND_TONE + SND_TONE_SET_VOLUME
>>>>>>>      -> User needs to do two ioctls, hum
>>>>>>> - some new SND_TONE_WITH_VOLUME
>>>>>>>      -> Probably the best option, user sets both tone frequency and volume
>>>>>>>         in one go, and it also only extends the IOCTL interface, so older
>>>>>>>         userspace won't have issues
>>>>>>
>>>>>> Those are "extensions" I have mentioned, and I'm not a big fan for
>>>>>> that, honestly speaking.
>>>>>>
>>>>>> The fact that the beep *output* stuff is provided by the *input*
>>>>>> device is already confusing
>>>>>
>>>>> I agree, this confused me as well.
>>>>
>>>> This comes from the times when keyboards themselves were capable of
>>>> emitting bells (SUN, DEC, etc). In hindsight it was not the best way of
>>>> structuring things, same with the keyboard LEDs (that are now plugged
>>>> into the LED subsystem, but still allow be driven through input).
>>>>
>>>> And in the same vein I wonder if we should bite the bullet and pay with
>>>> a bit of complexity but move sound-related things to sound subsystem.
>>>
>>> I am not sure that's the right approach here, since the device cannot do PCM
>>> playback, just bleeps.
>>>
>>>>>> (it was so just because of historical
>>>>>> reason), and yet you start implementing more full-featured mixer
>>>>>> control.  I'd rather keep fingers away.
>>>>>>
>>>>>> Again, if user-space requires the compatible behavior like the
>>>>>> existing desktop usages
>>>>>
>>>>> It does not. These pwm-beeper devices keep showing up in various embedded
>>>>> devices these days.
>>>>>
>>>>>> , it can be implemented in a similar way like
>>>>>> the existing ones; i.e. provide a mixer control with a proper sound
>>>>>> device.  The sound device doesn't need to provide a PCM interface but
>>>>>> just with a mixer interface.
>>>>>>
>>>>>> Or, if the purpose of your target device is a special usage, you don't
>>>>>> need to consider too much about the existing interface, and try to
>>>>>> keep the change as minimal as possible without too intrusive API
>>>>>> changes.
>>>>>
>>>>> My use case is almost perfectly matched by the current input pwm-beeper
>>>>> driver, the only missing bit is the ability to control the loudness at
>>>>> runtime. I think adding the SND_TONE_WITH_VOLUME parameter would cover it,
>>>>> with least intrusive API changes.
>>>>>
>>>>> The SND_TONE already supports configuring tone frequency in Hz as its
>>>>> parameter. Since anything above 64 kHz is certainly not hearable by humans,
>>>>> I would say the SND_TONE_WITH_VOLUME could use 16 LSbits for frequency (so
>>>>> up to 65535 Hz , 0 is OFF), and 16 MSbits for volume .
>>>>>
>>>>> I'm hesitant to overcomplicate something which can currently be controlled
>>>>> via single ioctl by pulling in sound subsystem into the picture.
>>>>
>>>> Can you tell a bit more about your use case? What needs to control the
>>>> volume of beeps? Is this the only source of sounds on the system?
>>>
>>> Custom user space application. The entire userspace is custom built in this
>>> case.
>>>
>>> In this case, it is a single-use device (think e.g. the kind of thermometer
>>> you stick in your ear when you're ill, to find out how warm you are).
>>>
>>> The beeper there is used to do just that, bleep (with different frequencies
>>> to indicate different stuff), and that works. What I need in addition to
>>> that is control the volume of the bleeps from the application, so it isn't
>>> too noisy. And that needs to be user-controllable at runtime, so not
>>> something that goes in DT.
>>>
>>> Right now there is just the bleeper , yes.
>>
>> It sounds like we essentially need an option within pcsp to drive PWM
>> instead of PCM, but input already has pwm-beeper; it seems harmless to
>> gently extend the latter for this use-case as opposed to reworking the
>> former.
>>
>> I agree that we should not invest too heavily in a legacy ABI, however
>> something like SND_BELL_VOL seems like a low-cost addition that doesn't
>> work against extending pcsp in the future. In fact, input already has
>> precedent for this exact same thing by way of FF rumble effects, which
>> are often PWM-based themselves.
>>
>> If SND_BELL_VOL or similar is not acceptable, then the original sysfs
>> approach seems like the next-best compromise. My only issue with it was
>> that I felt the range was not abstracted enough.
> 
> If we want to extend the API we will need to define exactly how it will
> all work. I.e. what happens if userspace mixes the old SND_TONE and
> SND_BELL with the new SND_BELL_VOL or whatever. Does it play with
> previously set volume? The default one?

Default one, to preserve current behavior, yes.

> How to set the default one?

We do not, we can call pwm_get_duty_cycle() to get the current duty 
cycle of the PWM to figure out the default.

> How
> to figure out what the current volume is if we decide to make volume
> "sticky"?

The patch stores the current volume configured via sysfs into 
beeper->duty_cycle .

> As far as userspace I expect it is more common to have one program (or
> component of a program) to set volume and then something else requests
> sound, so having one-shot API is of dubious value to me.

Currently the use case I have for this is a single user facing 
application which configures both.

> I hope we can go with Takashi's proposal downthread, but if not I wonder
> if the sysfs approach is not the simplest one. Do we expect more beepers
> that can control volume besides pwm-beeper?

It seems to me pulling in dependency on the entire sound subsystem only 
to set beeper volume is overkill. I currently don't even have sound 
subsystem compiled in.
