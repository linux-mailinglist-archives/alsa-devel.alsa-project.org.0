Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DDC18BF84
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 19:41:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1DFE179C;
	Thu, 19 Mar 2020 19:41:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1DFE179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584643319;
	bh=vd8zSP+JcGUwt/4YyzRS75QuTCsHwJXjrQeYyXovV6k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E1oK0GIub+N/0EgHCpkoP4GX0botJg2hAfoIYRSi2I5zKRjPLjyn/mbhLoPXf6LqM
	 qmMj335NqvatLYq7EzDBs3x4wMDPUcDbl1vp//fJ4vdHWsIrv0m8I3xBE0kjkF9Bbg
	 iwrxG37feWgFlZjlZ997TTcRgsyaoTwu3BMuaTO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE90EF800C0;
	Thu, 19 Mar 2020 19:40:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06043F8022B; Thu, 19 Mar 2020 19:40:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B74BF800C0
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 19:40:12 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A3EACA003F;
 Thu, 19 Mar 2020 19:40:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A3EACA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1584643209; bh=Uqv0WgAlDYRcTDHVT4HZJvRo9s1cXwRElJg0YK+EIbQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UC8ZRev9THBc6LiLVzmzLlmBxPdxAi5tILxcUlBDJpeqagAoHU0RUXEvBq+c4VxaD
 85Fi7/DzgxIPgHxa3VaVUnVW8ylZleiXJ7DC9AJIzq9iI/5CSczstumjhITkWcJw9w
 cR3oZdL/s9GJPUobg1i50IDqNS57eJouxj7SRYGU=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 19 Mar 2020 19:40:02 +0100 (CET)
Subject: Re: UCM ConflictingDevice/Priority concepts
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <c67a5e0d-c5dc-9ce6-73e5-e7fe602177d8@intel.com>
 <576f09dc-7968-3555-2aa4-e99c8ac5acbe@perex.cz>
 <885ad95f-3a98-92a5-5539-41779e783e75@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <5435543d-ef49-f9df-7d1a-e1b69bfaeb4e@perex.cz>
Date: Thu, 19 Mar 2020 19:40:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <885ad95f-3a98-92a5-5539-41779e783e75@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, Tanu Kaskinen <tanuk@iki.fi>
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

Dne 19. 03. 20 v 15:25 Pierre-Louis Bossart napsal(a):
> [fixing alsa-devel email and rejoining threads]
> 
> On 3/19/20 4:06 AM, Jaroslav Kysela wrote:
>> Dne 18. 03. 20 v 22:46 Pierre-Louis Bossart napsal(a):
>>> Hi,
>>>
>>> Traditionally on most PC or mobile platforms, we have one audio output
>>> that can be routed to either speakers or headphone, and likewise we can
>>> record from either internal mics or headset mic. We signal with UCM that
>>> the headphone/speakers and internal mic/headset conflict so hopefully
>>> PulseAudio/CRAS switch auto-magically.
>>>
>>> For SoundWire-based platforms, we typically have a headphone/headset
>>> codec on one link, and one or more amplifiers on the other. Functionally
>>> it's supported to capture from local mics and headset mic at the same
>>> time, or play different streams on speakers and headphones. Recent
>>> Intel-based Chromebooks have in theory the same capabilities at the
>>> hardware level even with I2S/TDM + DMIC connections.
>>>
>>> So for UCM, should we use the notion of 'ConflictingDevice' to fall-back
>>> to a more traditional single-endpoint user experience, or is this
>>> concept only indented to model hardware restrictions? I just checked
>>> that Chrome/adhd does not seem to use this concept at all, while it's
>>> prevalent in alsa-ucm-conf
>>>
>>> Or should we instead only use the concept of Playback/CapturePriority,
>>> which is also used in a lot of alsa-ucm-conf files, but again not at all
>>> in Chrome/adhd?
>>>
>>> I did find some UCM files relying both on the concept of
>>> ConflictingDevices and PlaybackPriorities, which seems rather
>>> odd/overkill to me.
>>
>> ConflictingDevices/SupportedDevices should be used only if there's a
>> hardware restriction which prevents the simultaneous usage of devices.
>> The application can decide how to use those devices.
>>
>> The priority describes the preference. Usually, headphones has higher
>> priority than build-in speakers etc.
> 
> I may be thick on this one, but how would an application use both types
> of information?
> 
> Does it e.g.
> 
> a) revisit the list all devices currently available when an event occurs
> (uevent card creation, jack detection, etc)

The jack detection / hw mute just handle the device (I/O) availability.

> b) pick the device with the highest priority for the 'default' stream

Yes, but the priority is just a hint for the application. The user may be 
override this. It's another layer.

> c) allow for simultaneous use of devices not marked at 'Conflicting',
> e.g. use the internal microphone for assistant while using the headset
> mic for a call as suggested by Dylan.

Yes.

> In other words the priority is the first key, and additional devices are
> filtered with the ConflictingDevice information.
> 
> Did I get this right?

Basically, yes.

> 
>>
>> In my opinion, it's not part of UCM if the application will use one or
>> multiple devices. The application must decide. It's another upper
>> usage / abstraction layer.
> 
> I tend to agree, but I wanted to make sure the use of
> 'ConflictingDevices' was not expected outside of true hardware limitations.
> 
>>
>> Also, we need to consider this to have the whole picture:
>>
>> Tanu (the pulseaudio maintainer) has also good question how to ensure,
>> that the stream can be re-used for the multiple devices. Actually, PA
>> does not re-open PCM device when the PCM device name and parameters
>> are similar for the switched devices. I also think that this is also
>> missing in the UCM specification to resolve this requirement. Usually,
>> the stream transfer mechanism is separate from the routing control.
>> But I can assume, that we may have the hardware which will need extra
>> setup for the streaming (not routing) when the devices are switched.
>>
>> I think that adding something like "PlaybackStream" to "PlaybackPCM"
>> for the stream identification might be sufficient to cover those
>> cases. So, keep "PlaybackPCM" usage and if "PlaybackStream" exists,
>> use this value to determine the stream identification. Similar
>> situation is for the capture direction, of course.
> 
> I am not sure I understand the notion of stream and stream transfer. Is
> there a pointer to this so that I could understand the problem statement?

Example:

Device1:
   ... some enable sequence ...
   PlaybackPCM "hw:0"
   PlaybackStream "DAC1"

Device2:
   ... another enable sequence ...
   PlaybackPCM "hw:0"
   PlaybackStream "DAC2"

In this case, PCM names for alsa-lib are same, but there's a different setup 
to route signal to different DAC which cannot be executed without the PCM 
re-open task (when the PCM "hw:0" is active).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
