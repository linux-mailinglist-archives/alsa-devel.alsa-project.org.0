Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7CC31C102
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 18:50:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50D551693;
	Mon, 15 Feb 2021 18:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50D551693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613411456;
	bh=kuPcSLnmE4ljnOFK4gAlpiYu08myN4vkRJ1dOxl26n4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JOiBauAEKhD1MlMpwrlyyRlSq5pmZojoa90VEU9ywTytjhGSHxfRIzu1K7669ZNUU
	 +noC4E6Ye6ftzWLGQedRqEQrWnxTBrHgP7MJ11V8ZQswdTVJmxcRvxyo5AQrtKhDSa
	 mgn/iY81cN5QX+QQ9u6LaS1j5QXnGzAFHFpL0JLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DE0FF8025B;
	Mon, 15 Feb 2021 18:49:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06D2EF80258; Mon, 15 Feb 2021 18:49:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9A12F80089
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 18:49:13 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 580CDA003F;
 Mon, 15 Feb 2021 18:49:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 580CDA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1613411353; bh=pFYMdYMJHEMOTF8Axru5+u8fGodcbGmuOsqJu7vMcq4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=0zEvo/8qpFI9ySGXcgnbyGWzxWLm9ZbwCTMGspN2KKrK2Ow1N0vHsGYfFeHR6BGaY
 ribu7EzIEBICLGsGsAzSiEm+dyIcM0unGmwIPcKqr7XW/w83YwDiWslBpDjleZlmM/
 jUQ7n5FrC1OJiykrvQDJ59SUs2qaBjZLc4UnO2r8=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 15 Feb 2021 18:49:09 +0100 (CET)
Subject: Re: [PATCH 0/5] ALSA: control - add generic LED trigger code
To: Takashi Iwai <tiwai@suse.de>
References: <20210211111400.1131020-1-perex@perex.cz>
 <s5h1rdmfrvo.wl-tiwai@suse.de>
 <3c84c275-0c62-d2f4-38ad-be6accb3b159@perex.cz>
 <s5hblcpej13.wl-tiwai@suse.de>
 <b1bc4135-25b9-26aa-323d-23bea15e164c@perex.cz>
 <s5hwnvdcvwf.wl-tiwai@suse.de>
 <15cd340d-6359-b0fd-d4b1-8aa8c3563bf8@perex.cz>
 <s5him6tbwhf.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <11a778dd-2ce3-0fbd-557a-c0dd5f35ce27@perex.cz>
Date: Mon, 15 Feb 2021 18:49:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5him6tbwhf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Hans de Goede <hdegoede@redhat.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Perry Yuan <Perry.Yuan@dell.com>
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

Dne 15. 02. 21 v 8:50 Takashi Iwai napsal(a):
> On Sun, 14 Feb 2021 19:55:21 +0100,
> Jaroslav Kysela wrote:
>>
>> Dne 12. 02. 21 v 13:28 Takashi Iwai napsal(a):
>>> On Fri, 12 Feb 2021 11:32:38 +0100,
>>> Jaroslav Kysela wrote:
>>>>
>>>> Dne 12. 02. 21 v 10:23 Takashi Iwai napsal(a):
>>>>> On Thu, 11 Feb 2021 18:53:20 +0100,
>>>>> Jaroslav Kysela wrote:
>>>>>>
>>>>>> Dne 11. 02. 21 v 18:15 Takashi Iwai napsal(a):
>>>>>>
>>>>>>>> Jaroslav Kysela (5):
>>>>>>>>   ALSA: control - introduce snd_ctl_notify_one() helper
>>>>>>>>   ALSA: control - add layer registration routines
>>>>>>>>   ALSA: control - add generic LED trigger module as the new control
>>>>>>>>     layer
>>>>>>>>   ALSA: HDA - remove the custom implementation for the audio LED trigger
>>>>>>>>   ALSA: control - add sysfs support to the LED trigger module
>>>>>>
>>>>>>> One thing I still miss from the picture is how to deal with the case
>>>>>>> like AMD ACP.  It has no mixer control to bundle with the LED trigger.
>>>>>>> Your idea is to make a (dummy) user element and tie the LED trigger
>>>>>>> with it?
>>>>>>
>>>>>> Yes, the user-space code which guarantee the silence stream should create an
>>>>>> user space control with the appropriate LED group access bits. The alsa-lib's
>>>>>> softvol PCM plugin can do this silencing for example.
>>>>>
>>>>> What control would it create?  In the case of softvol, it's a volume
>>>>> control that really changes the volume.  For the mute LED, it's a
>>>>> control turn on/off the mute?  If so, I wonder what makes better than
>>>>> creating it from the kernel driver.  (Of course, we can list up like
>>>>> "flexibility", etc, but it has a flip side of "complexity" and
>>>>> "fragility"...)
>>>>
>>>> The current code handles both switch / volume for the marked control (assuming
>>>> that the minimal value - usually zero - is full mute). And actually, there are
>>>> snd_pcm_areas_silence() calls in the softvol plugin, so we know that the PCM
>>>> stream is not passed to the application at this point.
>>>>
>>>> Condition:
>>>>
>>>>       if (info.type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
>>>>           info.type == SNDRV_CTL_ELEM_TYPE_INTEGER)
>>>>           ... value.value.integer.value[i] != info.value.integer.min
>>>>
>>>> The softvol plugin may be extended to add the mute switch control, of course.
>>>
>>> Well, my question was what kind of mixer control will be added at all,
>>> although the chip does neither volume nor mute function.  Would we add
>>> a fake volume/switch like softvol, or would we add rather a control
>>> that is directly tied with the LED state?
>>
>> I don't understand your question. If the user space marks the own vol/sw
>> control with the LED group, then it's tied with the LED state. I believe that
>> the control should be created in the code which make sure that the PCM stream
>> is silenced (like alsa-lib's softvol plugin).
> 
> The softvol (or similar effect) is to be ignored by PA, as it's not
> suitable with the timer-scheduled type of PCM streaming.  So the
> control shouldn't have any actual effect of PCM stream itself but
> merely for controlling the LED state.  If that's the case, it
> shouldn't be named like "XXX Switch" or "XXX Volume", but it's a
> control like "Mic Mute LED Status" -- and ironically, that's a kind of
> thing we didn't want to take in the kernel side implementation...

I see your point now. We can force softvol switch (not volume) for this kind
of hardware (AMD ACP) even for PA, so we know, that there's a code which
modifies the PCM stream in the chain.

Regarding time-scheduled I/O - for the capture, we're fine, because we can
silence the samples before they're processed in the user space. We also even
know, that the standard use for the microphone input is real-time, so the
buffering is really short. For playback, yes, the driver queued samples cannot
be altered, but it's usually no big security problem. The latency may be
seconds (or a bit more) in the corner case. If we need a proper solution, the
kernel PCM driver should be improved to take care (software based silence) or
the buffering must be reduced. I don't think that we need to change something
for ACP right now.

Also note that PA does the own stream silencing when the mixer path is muted,
so it's double win here (alsa-lib + PA) and the latency should be identical.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
