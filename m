Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1135418FCB2
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 19:32:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B0415F8;
	Mon, 23 Mar 2020 19:31:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B0415F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584988357;
	bh=dOjpDn726xgR0cONyVatGfiNiDYlOWhqzW5wcY5U6Ts=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dkX1eYA3QR2BovmIex/Miau5aws331u9KV/GDV7EWj5wjgwEIDd188x/4UWmwZVnD
	 8jtepVurtEPMiQlIzVO/vSQM6llkpkLsXZrJiw2/iGhACpQfQV/znvPF+TAnMp1YFJ
	 SZSOjla8I4w6iwWzUsCwqmIjZMwRZrQ3JDGJkqLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73CE4F8015A;
	Mon, 23 Mar 2020 19:30:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7B09F80158; Mon, 23 Mar 2020 19:30:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9670CF800B9
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 19:30:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9670CF800B9
IronPort-SDR: ZCyxKyJ4gXQ6I+jm0suWVcafm01Fuz8GmGFUQMlqTzWAvmhPaT6KwJ3S16X8YLMhaVBh2S8Ubs
 T2dItt7cSekQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 11:30:29 -0700
IronPort-SDR: TGM+UOWgJ4V0hEKOf34wAUbD/cLyrKqstnapFzP5f1Kvw2nP03KIePRcrGhgspwqqyapm405jl
 Q47evsnANV0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,297,1580803200"; d="scan'208";a="235302613"
Received: from jkamleka-mobl.amr.corp.intel.com (HELO [10.255.38.234])
 ([10.255.38.234])
 by orsmga007.jf.intel.com with ESMTP; 23 Mar 2020 11:30:28 -0700
Subject: Re: UCM ConflictingDevice/Priority concepts
To: Tanu Kaskinen <tanuk@iki.fi>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org
References: <c67a5e0d-c5dc-9ce6-73e5-e7fe602177d8@intel.com>
 <576f09dc-7968-3555-2aa4-e99c8ac5acbe@perex.cz>
 <885ad95f-3a98-92a5-5539-41779e783e75@linux.intel.com>
 <5435543d-ef49-f9df-7d1a-e1b69bfaeb4e@perex.cz>
 <75799302-0f0a-1a9a-369e-36b3eef2080a@linux.intel.com>
 <cb2473421b72960cda83488a7bdc4629469131d6.camel@iki.fi>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9235311d-4a77-fbf4-ba99-a1a6e03cfe95@linux.intel.com>
Date: Mon, 23 Mar 2020 13:28:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cb2473421b72960cda83488a7bdc4629469131d6.camel@iki.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
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



On 3/22/20 11:37 PM, Tanu Kaskinen wrote:
> On Thu, 2020-03-19 at 14:27 -0500, Pierre-Louis Bossart wrote:
>>>>> Also, we need to consider this to have the whole picture:
>>>>>
>>>>> Tanu (the pulseaudio maintainer) has also good question how to ensure,
>>>>> that the stream can be re-used for the multiple devices. Actually, PA
>>>>> does not re-open PCM device when the PCM device name and parameters
>>>>> are similar for the switched devices. I also think that this is also
>>>>> missing in the UCM specification to resolve this requirement. Usually,
>>>>> the stream transfer mechanism is separate from the routing control.
>>>>> But I can assume, that we may have the hardware which will need extra
>>>>> setup for the streaming (not routing) when the devices are switched.
>>>>>
>>>>> I think that adding something like "PlaybackStream" to "PlaybackPCM"
>>>>> for the stream identification might be sufficient to cover those
>>>>> cases. So, keep "PlaybackPCM" usage and if "PlaybackStream" exists,
>>>>> use this value to determine the stream identification. Similar
>>>>> situation is for the capture direction, of course.
>>>>
>>>> I am not sure I understand the notion of stream and stream transfer. Is
>>>> there a pointer to this so that I could understand the problem statement?
>>>
>>> Example:
>>>
>>> Device1:
>>>     ... some enable sequence ...
>>>     PlaybackPCM "hw:0"
>>>     PlaybackStream "DAC1"
>>>
>>> Device2:
>>>     ... another enable sequence ...
>>>     PlaybackPCM "hw:0"
>>>     PlaybackStream "DAC2"
>>>
>>> In this case, PCM names for alsa-lib are same, but there's a different
>>> setup to route signal to different DAC which cannot be executed without
>>> the PCM re-open task (when the PCM "hw:0" is active).
>>
>> I see, thanks for the explanations.
>>
>> Indeed in the past we had similar routing issues that required
>> re-configuration and possibly stopping the stream or changing clock
>> settings/ownership.
>>
>> However I would argue that the solution is more to define additional
>> steps than add additional qualifiers in the enable/disable steps.
>>
>> FWIW in the Android solutions from Intel, we had 5 steps for each
>> routing change:
>> - mute old paths
>> - disable streaming on old paths
>> - configure new paths
>> - enable streaming on new paths
>> - unmute new paths
>>
>> At each step we could describe what actions were necessary or if the
>> step could be skipped. That allowed us to deal nicely with transitions,
>> I don't think we encountered any case that these steps couldn't handle.
> 
> It seems that Pierre understood the idea behind the PlaybackStream
> proposal, but I still don't understand what problem it's solving. Is
> the problem that PulseAudio doesn't reopen the stream when it should?
> So in the example, there are two DACs, and selecting the DAC is done
> via the mixer, but the switch can't be done while the stream is open? I
> haven't seen such devices, so this is a new problem to me.

It's not very common but does happen. I had a laptop where one mixer 
control would only take effect if the PCM was already open. In phones 
the clock ownership may change during a voice call, and handling of 
alert streams could involve different PCMs or had to be held while the 
clocks were changed.


> The "problem" that I brought up earlier in the device variant
> discussion was different: the PulseAudio profile scheme that Jaroslav
> proposed would mean that PulseAudio would always reopen the stream even
> when it would be sufficient to just change a setting in the mixer. I
> don't think this is a significant problem. When changing routing, it's
> not important to keep the stream running without any interruption.

Can you stop/restart the PCM device without impacting apps though?

> The 5-step process that Pierre described is good, in particular it
> allows setting the volume at the right time (currently PulseAudio
> doesn't follow that process, and as a result there can be volume
> glitches when changing routing). To me it seems that following this
> process is already possible without changes to UCM, so I don't know
> what Pierre meant by defining additional steps.

I meant instead of having just an 'enable' and 'disable' step in UCM, 
have additional ones done prior to streaming and after streaming. The 
'Enable' handles too many things at the moment IMHO, it's both routing, 
streaming and mute.
