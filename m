Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906E18BB7E
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 16:48:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A885176E;
	Thu, 19 Mar 2020 16:47:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A885176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584632902;
	bh=o3gD+uNiA+cQBOSvt0mrhqM+DWZgg/LjxwXHarz5l/M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pWiCwL8qNFjWIQentFoKYKfpqBj7Xq9kAcEDNFK4LirNvaPm/X7QdKFOocpnEaUx9
	 qaxLjLiLfSTZfEBH4dpJz3twQ7ZUGwBSXpI14fnwM8N+iP21KaZb3I/a3r68+WnTs4
	 Eeg3W2A9krQXUNiEpLIB4KKqXu4NGXKAyxBBSibo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6611F802D2;
	Thu, 19 Mar 2020 16:43:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A749BF802C4; Thu, 19 Mar 2020 16:43:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE0F0F802C2
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 16:43:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE0F0F802C2
IronPort-SDR: yLmXG1vdlsQEIj1ZRuGVfmMG92cjfJGuKONCoVPl9jXt3O3rtT410cojI+okWlZCWT2ivANBDE
 z6LwnOADLZQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 08:43:46 -0700
IronPort-SDR: ck1JtdCmuiqbibanbWNkbdsve7bq2W5F5AkgbbDyfbkkeMjMwGB5Sl2GI93cgNO6MjOKqAhyDG
 aXMyCTaGrFTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; d="scan'208";a="444610102"
Received: from tvanlang-mobl.ger.corp.intel.com (HELO [10.255.34.72])
 ([10.255.34.72])
 by fmsmga005.fm.intel.com with ESMTP; 19 Mar 2020 08:43:44 -0700
Subject: Re: UCM ConflictingDevice/Priority concepts
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <c67a5e0d-c5dc-9ce6-73e5-e7fe602177d8@intel.com>
 <576f09dc-7968-3555-2aa4-e99c8ac5acbe@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <885ad95f-3a98-92a5-5539-41779e783e75@linux.intel.com>
Date: Thu, 19 Mar 2020 09:25:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <576f09dc-7968-3555-2aa4-e99c8ac5acbe@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

[fixing alsa-devel email and rejoining threads]

On 3/19/20 4:06 AM, Jaroslav Kysela wrote:
> Dne 18. 03. 20 v 22:46 Pierre-Louis Bossart napsal(a):
>> Hi,
>>
>> Traditionally on most PC or mobile platforms, we have one audio output
>> that can be routed to either speakers or headphone, and likewise we can
>> record from either internal mics or headset mic. We signal with UCM that
>> the headphone/speakers and internal mic/headset conflict so hopefully
>> PulseAudio/CRAS switch auto-magically.
>>
>> For SoundWire-based platforms, we typically have a headphone/headset
>> codec on one link, and one or more amplifiers on the other. Functionally
>> it's supported to capture from local mics and headset mic at the same
>> time, or play different streams on speakers and headphones. Recent
>> Intel-based Chromebooks have in theory the same capabilities at the
>> hardware level even with I2S/TDM + DMIC connections.
>>
>> So for UCM, should we use the notion of 'ConflictingDevice' to fall-back
>> to a more traditional single-endpoint user experience, or is this
>> concept only indented to model hardware restrictions? I just checked
>> that Chrome/adhd does not seem to use this concept at all, while it's
>> prevalent in alsa-ucm-conf
>>
>> Or should we instead only use the concept of Playback/CapturePriority,
>> which is also used in a lot of alsa-ucm-conf files, but again not at all
>> in Chrome/adhd?
>>
>> I did find some UCM files relying both on the concept of
>> ConflictingDevices and PlaybackPriorities, which seems rather
>> odd/overkill to me.
>
> ConflictingDevices/SupportedDevices should be used only if there's a 
> hardware restriction which prevents the simultaneous usage of devices. 
> The application can decide how to use those devices.
>
> The priority describes the preference. Usually, headphones has higher 
> priority than build-in speakers etc.

I may be thick on this one, but how would an application use both types 
of information?

Does it e.g.

a) revisit the list all devices currently available when an event occurs 
(uevent card creation, jack detection, etc)

b) pick the device with the highest priority for the 'default' stream

c) allow for simultaneous use of devices not marked at 'Conflicting', 
e.g. use the internal microphone for assistant while using the headset 
mic for a call as suggested by Dylan.

In other words the priority is the first key, and additional devices are 
filtered with the ConflictingDevice information.

Did I get this right?

>
> In my opinion, it's not part of UCM if the application will use one or 
> multiple devices. The application must decide. It's another upper 
> usage / abstraction layer.

I tend to agree, but I wanted to make sure the use of 
'ConflictingDevices' was not expected outside of true hardware limitations.

>
> Also, we need to consider this to have the whole picture:
>
> Tanu (the pulseaudio maintainer) has also good question how to ensure, 
> that the stream can be re-used for the multiple devices. Actually, PA 
> does not re-open PCM device when the PCM device name and parameters 
> are similar for the switched devices. I also think that this is also 
> missing in the UCM specification to resolve this requirement. Usually, 
> the stream transfer mechanism is separate from the routing control. 
> But I can assume, that we may have the hardware which will need extra 
> setup for the streaming (not routing) when the devices are switched.
>
> I think that adding something like "PlaybackStream" to "PlaybackPCM" 
> for the stream identification might be sufficient to cover those 
> cases. So, keep "PlaybackPCM" usage and if "PlaybackStream" exists, 
> use this value to determine the stream identification. Similar 
> situation is for the capture direction, of course.

I am not sure I understand the notion of stream and stream transfer. Is 
there a pointer to this so that I could understand the problem statement?

Thanks,

-Pierre


