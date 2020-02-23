Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4021697FC
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Feb 2020 14:56:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FB1616B1;
	Sun, 23 Feb 2020 14:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FB1616B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582466210;
	bh=SvGsjNeyKsYIJIMHZypFG9LnWuDn9ryThIY0Lr8dP10=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hd2clB+XXQMwbWjq1WrRbByZjvcsb5YddoFC+/uLgQ/aks/DfIVjAXXN4ZTwzGZDK
	 3jPnWGB0QbGSsBn3dd8JZK+lad7uWUo5gcOMIRfjpTaYIAt9qN1ejZBxx7hIwzR0j5
	 7/+DH/pr9mFUTUKCgsFVPJOm9H5CEtZOV4Ks6OUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51A9CF80136;
	Sun, 23 Feb 2020 14:55:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A693F80142; Sun, 23 Feb 2020 14:55:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A99E4F80136
 for <alsa-devel@alsa-project.org>; Sun, 23 Feb 2020 14:55:04 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9A315A0040;
 Sun, 23 Feb 2020 14:55:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9A315A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1582466103; bh=NuILzpxHG8usJhpQd8MQ8BJheQYBUyKPvYDjIgFhPsU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=cUFEGkP7PUPJU9zOxnFYrdLfaVhgrpeqvm4/J/Ni0cqVSzH1yKgK6nSGKKEWlQ+t7
 xcWhDONEo7cNse9TIE5q6GTV7IGgBRKDYueLizrk6XpqIaSoumBg3nU0R6w17LSt2T
 PBq+fOKMsCwj6J0xD0FEildfFpfW7BzGVCr7ytVs=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 23 Feb 2020 14:55:00 +0100 (CET)
Subject: Re: [pulseaudio-discuss] [alsa-devel] Question about the various
 mixer options in UCM
To: Tanu Kaskinen <tanuk@iki.fi>,
 General PulseAudio Discussion <pulseaudio-discuss@lists.freedesktop.org>,
 alsa-devel <alsa-devel@alsa-project.org>
References: <50ae39498982ba2fc3fc8df1b9f0eac15a2b98c8.camel@iki.fi>
 <cb58008e-e9cc-8390-cfc8-c5c93d31c862@perex.cz>
 <ae7b6d8a745ef718d8a6f3f2d7e4aeabe4f7d2b6.camel@iki.fi>
 <99522cac281eb998981ef2552c7e06846171b25f.camel@iki.fi>
 <fc493e83-3eaa-3580-483b-4bb7754245ef@perex.cz>
 <9c35a20952f53624c8cd082a5e7de33d2d34adca.camel@iki.fi>
 <084fc279e86e5fdf7439161aede4a75c85be69a0.camel@iki.fi>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <06be7c66-ef8e-f7ee-ae1c-69db8fa59f24@perex.cz>
Date: Sun, 23 Feb 2020 14:55:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <084fc279e86e5fdf7439161aede4a75c85be69a0.camel@iki.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 23. 02. 20 v 10:00 Tanu Kaskinen napsal(a):
> On Sat, 2020-02-22 at 08:53 +0200, Tanu Kaskinen wrote:
>> On Sun, 2020-02-16 at 18:38 +0100, Jaroslav Kysela wrote:
>>> Dne 16. 02. 20 v 11:06 Tanu Kaskinen napsal(a):
>>>> On Sun, 2020-02-16 at 11:42 +0200, Tanu Kaskinen wrote:
>>>>> + pulseaudio-discuss@lists.freedesktop.org
>>>>>
>>>>> On Sat, 2020-02-15 at 17:25 +0100, Jaroslav Kysela wrote:
>>>>>> Actually, I am also trying to resolve the description of the speaker
>>>>>> configuration. It may not be only enough to give the PCM device, because we
>>>>>> don't know, if user connected the stereo or surround speakers to the sound
>>>>>> card output for example. I play with an idea to add device variants to UCM,
>>>>>> but the question is, how we can map this to pulseaudio profile/port schematics.
>>>>>>
>>>>>> My quick idea is to export those variants via the verbs, so the exported verb
>>>>>> names might look like:
>>>>>>
>>>>>> HiFi:Speaker-Stereo
>>>>>> HiFi:Speaker-5.1
>>>>>>
>>>>>> Where 'HiFi' is the verb name, 'Speaker' is the device name and 'Stereo' is
>>>>>> the variant name.
>>>>>>
>>>>>> If we need to define multiple variants, all may be exported like:
>>>>>>
>>>>>> HiFi:Speaker-5.1,Mic-4.0
>>>>>>
>>>>>> Also, we can enhance this and store the configuration to a file, thus 'HiFi'
>>>>>> can refer to 'HiFi@Speaker-5.1,Mic-4.0' by default.
>>>>>
>>>>> Verb + list-of-device-variants sounds like a good way to map UCM
>>>>> devices to pulseaudio profiles (and if there's just one verb, which I
>>>>> expect to be the common case, don't show it in the profile name). I
>>>>> don't know how the variants should be configured in UCM, but I know
>>>>> that device variants should be able to declare conflicts with other
>>>>> devices (or device variants). For example, 5.1 speaker output may make
>>>>> recording impossible, while stereo speaker output can be used toghether
>>>>> with a mic. If this information is not provided by UCM, pulseaudio will
>>>>> have to probe all variant combinations (like it currently does with the
>>>>> legacy mixer system).
>>>>
>>>> Sorry, now I realized that the Verb + list-of-device-variants scheme
>>>> doesn't really work after all as the profile scheme. Or maybe it does,
>>>> but it's significantly different from what we do currently. Switching
>>>> between Headphones and Speaker-Stereo often doesn't require reopening
>>>> the PCM device, so there's no need for separate Headphones and Speaker-
>>>> Stereo profiles. I guess we could still create separate profiles, it
>>>> just means that the profile list will get much longer.
>>>>
>>>> We could add a separate optimization step to the profile creation
>>>> process. That is, first create all possible device-variant combinations
>>>> as the initial profile list, and then inspect which profiles can be
>>>> merged. Naming the merged profiles becomes a problem, but I imagine
>>>> it's solvable with static rules (e.g. merging Speakers-Stereo and
>>>> Headphones becomes Analog-Stereo), and if necessary the merging can be
>>>> improved gradually over time.
>>>>
>>>>>  From profile creation perspective the ideal scheme would be not based
>>>> on UCM devices but on PCM devices and their configuration variants, but
>>>> I imagine naming would be an even bigger problem with this scheme (how
>>>> to map PCM device names to sensible user friendly names?).
>>>
>>> I think that I didn't explain my idea in detail. The variant verbs may be
>>> almost identical (thus all devices will be defined) like the "master" one. But
>>> the specific variant configuration will be returned to the application. So it
>>> will differ only in the channel count value for the Speaker device or so. The
>>> PCM device name + PCM parameters check will be fine. I don't think that we
>>> should modify something on the PA side. PA activates only one verb per
>>> soundcard now.
>>
>> Oh, you want to create variant verbs? Is the idea that all possible
>> device combinations will be made separate verbs? That would make life
>> easier for PulseAudio, but wouldn't it mean a lot more work for UCM
>> configuration writers? Rather than generating the device combinations
>> automatically in PulseAudio, the combinations would have to be manually
>> listed in every UCM configuration.
>>
>> I think it would be better to define only one verb per sound card and
>> declare the conflicts between the devices or device variants, and let
>> PulseAudio automatically generate the device combinations as profiles.
>>
>> I may be misunderstanding something, I didn't for example understand
>> what you meant by "the PCM device name + PCM parameters check will be
>> fine". Some examples could be useful. Let's say that there's a sound
>> card that has stereo output (either headphones or line-out), 4.0
>> output, 5.1 output, SPDIF output and stereo input. If input is used,
>> 5.1 output can't be used at the same time. Would UCM define the
>> following verbs?:
>>
>> HiFi:Headphones,SPDIF,Mic
>> HiFi:Line-Stereo,SPDIF,Mic
>> HiFi:Line-4.0,SPDIF,Mic
>> HiFi:Line-5.1,SPDIF
> 
> I'm currently writing UCM configuration for Audigy2, because
> PulseAudio's default configuration doesn't work with that card
> properly. I'm creating verbs for each possible device combination, and

Note that variants are not supported in UCM yet. I expect to add the 
VariantSection to the DeviceSection like this:

SectionDevice."Speaker" {
   SectionVariant."4.0" {
     Value {
       PlaybackChannels 4
       ... channel mapping (todo) ...
     }
   }
}

etc.. The alsa-lib will compose the verbs variants. I believe that we should 
not duplicate all verb configs just because one line requires a change.

> I ran into a naming issue. How should "bidirectional" devices be listed
> in the verb name?

If there is a difference between playback/capture parameters or mixer 
settings, you cannot define the bidirectional device. But you can use indexes:

SectionDevice."Line1" {
   comment "Rear line output"
   ...  configuration for line-out ...
}

SectionDevice."Line2" {
   comment "Rear line input"
   ... configuration for line-in ...
}

plus variants.

> If there's both line-out and line-in and SPDIF
> supports both input and output, maybe the verb name could be for
> example this:
> 
> HiFi:Line-4.0-Out,SPDIF-Out,Line-Stereo-In,SPDIF-In
> 
> The device name in SectionDevice would be just "Line" or "SPDIF".
> 
> I don't really like bidirectional devices, i.e. I'd prefer have
> separate SectionDevice names for Line-In and Line-Out, but I guess
> merging them into one device can work.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
