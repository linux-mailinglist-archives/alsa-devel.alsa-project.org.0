Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EED18C05A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 20:29:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C25F4179D;
	Thu, 19 Mar 2020 20:28:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C25F4179D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584646180;
	bh=1BSJy5G5O6ouA74ptN2eZEG0AhRVvpjEH1qpW6NaBE4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kc4Dy6JP+uHQNlXj6ZnMYb6/ceqmsHh9NtJS1jYXdKbVMSDe1QahmpHDG2YOgt3Fs
	 olblyJYONAmDEA2WYSVMJ9VWyjAwVp0V407t3DTIUbMSxbKbKobjH0zTedw5HOz5bX
	 SrnHNp/tASppyEbv6/ghwALvLVAJeZt4AAcubgYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96A75F80232;
	Thu, 19 Mar 2020 20:27:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7638F8022B; Thu, 19 Mar 2020 20:27:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54ECDF8012F
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 20:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54ECDF8012F
IronPort-SDR: KIxfNUHUlFVQTjjBXSYX73J5YZlXEwpqWTGzrF08ymQewAc7RlvOjhOCEp5acJ/g/pMhLjsYk4
 tbUnhCqdgArg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 12:27:48 -0700
IronPort-SDR: 9QmxcoPtvXY4oYyMOvRz05SBik/DScAe+3eUQTQ+VqD2UsV+SMjAbOPJ1IfbPDEa83gTWd0fYh
 wIZ6HMygOGBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; d="scan'208";a="391905067"
Received: from mallani-mobl.amr.corp.intel.com (HELO [10.255.35.49])
 ([10.255.35.49])
 by orsmga004.jf.intel.com with ESMTP; 19 Mar 2020 12:27:46 -0700
Subject: Re: UCM ConflictingDevice/Priority concepts
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <c67a5e0d-c5dc-9ce6-73e5-e7fe602177d8@intel.com>
 <576f09dc-7968-3555-2aa4-e99c8ac5acbe@perex.cz>
 <885ad95f-3a98-92a5-5539-41779e783e75@linux.intel.com>
 <5435543d-ef49-f9df-7d1a-e1b69bfaeb4e@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <75799302-0f0a-1a9a-369e-36b3eef2080a@linux.intel.com>
Date: Thu, 19 Mar 2020 14:27:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5435543d-ef49-f9df-7d1a-e1b69bfaeb4e@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



>>> Also, we need to consider this to have the whole picture:
>>>
>>> Tanu (the pulseaudio maintainer) has also good question how to ensure,
>>> that the stream can be re-used for the multiple devices. Actually, PA
>>> does not re-open PCM device when the PCM device name and parameters
>>> are similar for the switched devices. I also think that this is also
>>> missing in the UCM specification to resolve this requirement. Usually,
>>> the stream transfer mechanism is separate from the routing control.
>>> But I can assume, that we may have the hardware which will need extra
>>> setup for the streaming (not routing) when the devices are switched.
>>>
>>> I think that adding something like "PlaybackStream" to "PlaybackPCM"
>>> for the stream identification might be sufficient to cover those
>>> cases. So, keep "PlaybackPCM" usage and if "PlaybackStream" exists,
>>> use this value to determine the stream identification. Similar
>>> situation is for the capture direction, of course.
>>
>> I am not sure I understand the notion of stream and stream transfer. Is
>> there a pointer to this so that I could understand the problem statement?
> 
> Example:
> 
> Device1:
>    ... some enable sequence ...
>    PlaybackPCM "hw:0"
>    PlaybackStream "DAC1"
> 
> Device2:
>    ... another enable sequence ...
>    PlaybackPCM "hw:0"
>    PlaybackStream "DAC2"
> 
> In this case, PCM names for alsa-lib are same, but there's a different 
> setup to route signal to different DAC which cannot be executed without 
> the PCM re-open task (when the PCM "hw:0" is active).

I see, thanks for the explanations.

Indeed in the past we had similar routing issues that required 
re-configuration and possibly stopping the stream or changing clock 
settings/ownership.

However I would argue that the solution is more to define additional 
steps than add additional qualifiers in the enable/disable steps.

FWIW in the Android solutions from Intel, we had 5 steps for each 
routing change:
- mute old paths
- disable streaming on old paths
- configure new paths
- enable streaming on new paths
- unmute new paths

At each step we could describe what actions were necessary or if the 
step could be skipped. That allowed us to deal nicely with transitions, 
I don't think we encountered any case that these steps couldn't handle.
