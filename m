Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 782A0160526
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Feb 2020 18:40:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3CF0167A;
	Sun, 16 Feb 2020 18:39:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3CF0167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581874841;
	bh=n/hyPavNFeEv20Vfitm8Y04BE922QI31jfc2gFDYp3I=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jboKQRtjpK95MDWwaMeqYnfk0OPl6G1y5lrBNOvGCyGNKbs7VM3OEyQdIGBmZtFov
	 S+hdDBiNpE/WPFI4jS9HEgb8jciis/coEtJWg+CbbDxn2xVTdcsN/leT4VyRqPdvSi
	 fmt7bV+tm1jNDVKCH8aaQVWPlb8tHRq48cq6b7ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD0FEF80142;
	Sun, 16 Feb 2020 18:38:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 617C6F80148; Sun, 16 Feb 2020 18:38:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0756FF80096
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 18:38:53 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id EE0B8A003F;
 Sun, 16 Feb 2020 18:38:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz EE0B8A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1581874733; bh=WAeDeYvCc6YweiiF5ZjLIMSCiZKlj1T2YHH1b1oCXL4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=W0YsAq/jzgfvijuNexRbkPIm0xLshjH9RKxTcA4ojokwE78Ha+G69qUWjm0fAeMKV
 2r+9dMSIi3rXagJPJwGHrG04PByHQ758H5cIH48EfC0X5z1pkL79P9u4KPWg2I+Nti
 kWwFj5QAb0eo92m/1zCXUvb+76OaJ+9jKkPKdZl8=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 16 Feb 2020 18:38:49 +0100 (CET)
To: Tanu Kaskinen <tanuk@iki.fi>,
 General PulseAudio Discussion <pulseaudio-discuss@lists.freedesktop.org>,
 alsa-devel <alsa-devel@alsa-project.org>
References: <50ae39498982ba2fc3fc8df1b9f0eac15a2b98c8.camel@iki.fi>
 <cb58008e-e9cc-8390-cfc8-c5c93d31c862@perex.cz>
 <ae7b6d8a745ef718d8a6f3f2d7e4aeabe4f7d2b6.camel@iki.fi>
 <99522cac281eb998981ef2552c7e06846171b25f.camel@iki.fi>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <fc493e83-3eaa-3580-483b-4bb7754245ef@perex.cz>
Date: Sun, 16 Feb 2020 18:38:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <99522cac281eb998981ef2552c7e06846171b25f.camel@iki.fi>
Content-Language: en-US
Subject: Re: [alsa-devel] [pulseaudio-discuss] Question about the various
 mixer options in UCM
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 16. 02. 20 v 11:06 Tanu Kaskinen napsal(a):
> On Sun, 2020-02-16 at 11:42 +0200, Tanu Kaskinen wrote:
>> + pulseaudio-discuss@lists.freedesktop.org
>>
>> On Sat, 2020-02-15 at 17:25 +0100, Jaroslav Kysela wrote:
>>> Dne 15. 02. 20 v 7:29 Tanu Kaskinen napsal(a):
>>>> What's the difference between PlaybackVolume, PlaybackMixerElem and
>>>> PlaybackMasterElem? Other than the obvious difference that
>>>> PlaybackVolume is used only to configure the volume control, whereas
>>>> PlaybackMixerElem and PlaybackMasterElem are used also to configure the
>>>> mute control.
>>>
>>> At first, I don't really know if someone uses PlaybackVolume/PlaybackSwitch.
>>> It was defined for the direct control interface (not the mixer interface). I
>>> do not think that we should support this.
>>
>> PlaybackVolume/Switch is currently defined for PandaBoard,
>> PandaBoardES, SDP4430 and sof-hda-dsp. Do you mean those definitions
>> should be removed and replaced with PlaybackMixerElem? It seems that
>> PlaybackVolume and PlaybackSwitch don't always match the same simple
>> mixer element (e.g. PandaBoard), so I'm not sure if it's possible to
>> use PlaybackMixerElem with those platforms.
>>
>> As you know, PulseAudio added support for PlaybackVolume recently.
>> Should we remove the support? I'm not against that, if
>> PlaybackMixerElem is the canonical way to control volume.
>>
>> AFAIK CRAS is a major user of UCM, are there others? I think the CRAS
>> developers' opinion would be very useful here.
>>
>>> I defined new PlaybackMixerElem to select the simple mixer element which
>>> controls both volume and switch (mute) in the ALSA API. The master volume
>>> might be also in the chain (thus PlaybackMasterElem) was introduced.
>>>
>>> It seems that it might be not enough and I play with an idea to build custom
>>> mixer description to handle the special cases (like several speakers with the
>>> different volume controls connected to the single stereo stream etc.).
>>>
>>> To keep things simple, I would probably hide all functionality to
>>> PlaybackMixer/PlaybackMixerElem and CaptureMixer/CaptureMixerElem . The
>>> special mixer name will create the abstract mixer for the applications and
>>> only one simple mixer element control will set the appropriate volume for
>>> the stream (like pulseaudio actually does for the legacy ALSA support - volume
>>> synthetizer). So UCM will describe the mixer for alsa-lib and application will
>>> use only abstract interface to set / get the volume and mute state.
>>
>> Hiding everything behind an abstract mixer element sounds VERY good,
>> but how to handle a situation where the application uses two devices at
>> the same time and the devices share a volume control? For example, a
>> phone playing a ringtone to both headphones and speakers. If the
>> headphone output has its own abstract mixer element and the speaker
>> output has its own abstract mixer element, the application may imagine
>> that it can change the volumes independently, but if the outputs share
>> a master volume control that is used by both abstract volume elements,
>> the volumes aren't really independent, and the resulting volumes may
>> not be what the application intended.

This is something which should UCM take in the account. In this case, the 
"common" parts should be probably set to a maximum value (or the safe maximum 
value) in UCM. Another way is to mark those devices as "conflicting", thus the 
I/O won't be used simultaneously.

>>> Actually, I am also trying to resolve the description of the speaker
>>> configuration. It may not be only enough to give the PCM device, because we
>>> don't know, if user connected the stereo or surround speakers to the sound
>>> card output for example. I play with an idea to add device variants to UCM,
>>> but the question is, how we can map this to pulseaudio profile/port schematics.
>>>
>>> My quick idea is to export those variants via the verbs, so the exported verb
>>> names might look like:
>>>
>>> HiFi:Speaker-Stereo
>>> HiFi:Speaker-5.1
>>>
>>> Where 'HiFi' is the verb name, 'Speaker' is the device name and 'Stereo' is
>>> the variant name.
>>>
>>> If we need to define multiple variants, all may be exported like:
>>>
>>> HiFi:Speaker-5.1,Mic-4.0
>>>
>>> Also, we can enhance this and store the configuration to a file, thus 'HiFi'
>>> can refer to 'HiFi@Speaker-5.1,Mic-4.0' by default.
>>
>> Verb + list-of-device-variants sounds like a good way to map UCM
>> devices to pulseaudio profiles (and if there's just one verb, which I
>> expect to be the common case, don't show it in the profile name). I
>> don't know how the variants should be configured in UCM, but I know
>> that device variants should be able to declare conflicts with other
>> devices (or device variants). For example, 5.1 speaker output may make
>> recording impossible, while stereo speaker output can be used toghether
>> with a mic. If this information is not provided by UCM, pulseaudio will
>> have to probe all variant combinations (like it currently does with the
>> legacy mixer system).
> 
> Sorry, now I realized that the Verb + list-of-device-variants scheme
> doesn't really work after all as the profile scheme. Or maybe it does,
> but it's significantly different from what we do currently. Switching
> between Headphones and Speaker-Stereo often doesn't require reopening
> the PCM device, so there's no need for separate Headphones and Speaker-
> Stereo profiles. I guess we could still create separate profiles, it
> just means that the profile list will get much longer.
> 
> We could add a separate optimization step to the profile creation
> process. That is, first create all possible device-variant combinations
> as the initial profile list, and then inspect which profiles can be
> merged. Naming the merged profiles becomes a problem, but I imagine
> it's solvable with static rules (e.g. merging Speakers-Stereo and
> Headphones becomes Analog-Stereo), and if necessary the merging can be
> improved gradually over time.
> 
>>From profile creation perspective the ideal scheme would be not based
> on UCM devices but on PCM devices and their configuration variants, but
> I imagine naming would be an even bigger problem with this scheme (how
> to map PCM device names to sensible user friendly names?).

I think that I didn't explain my idea in detail. The variant verbs may be 
almost identical (thus all devices will be defined) like the "master" one. But 
the specific variant configuration will be returned to the application. So it 
will differ only in the channel count value for the Speaker device or so. The 
PCM device name + PCM parameters check will be fine. I don't think that we 
should modify something on the PA side. PA activates only one verb per 
soundcard now.

Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
