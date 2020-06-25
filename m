Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE3720A243
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 17:45:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB8C91913;
	Thu, 25 Jun 2020 17:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB8C91913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593099924;
	bh=p0VDAq0BFb++9QbZb0xdHxtJ0RoYJPvFC/7E55DF3vc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MDq2gTRFEp3YmhlB/Ig/6PsNfvQ05nmvLdQ0vCx5UtEevjLD5h0rZ81kHKQHdckBq
	 O5v2wPS0kMk5Eihz3fmQBoS4XbvHo+wMBzuAPzZ76bBwlGekoWczmTfC8DiptMmMYR
	 SRpCI5nAJNWuthKiMEy6kThtZ0uUhiAuNvTxF5ss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF3C3F80137;
	Thu, 25 Jun 2020 17:43:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 075EBF80234; Thu, 25 Jun 2020 17:43:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 579F5F800B2
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 17:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 579F5F800B2
IronPort-SDR: MScneAJ1IadSlyj2VndVg4vfpqurvO+aKIvhXRY0AJXIRVi9uPa6xW9furPPMUJPcMUYCCDIU1
 FNmtESwPoazw==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="133366949"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="133366949"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 08:43:34 -0700
IronPort-SDR: T4O0cvXHx4mZdxghItxFxv/QVed+T4GLze5AMYXCWq67vYtBn+mNYjNOAe/1rB40B/yo/KCTmn
 IDdk4onmoBaw==
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="279846332"
Received: from jmgutiex-mobl.amr.corp.intel.com (HELO [10.251.16.15])
 ([10.251.16.15])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 08:43:33 -0700
Subject: Re: [PATCH] ALSA: hda/hdmi: Add Intel silent stream support
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>,
 Arun Raghavan <arun@arunraghavan.net>
References: <1592954796-12449-1-git-send-email-harshapriya.n@intel.com>
 <s5hr1u4lxee.wl-tiwai@suse.de>
 <f2da25c0-c740-4d44-ab66-6017622f7dde@perex.cz>
 <7dd38f98-e74a-94c0-6888-523e6189c00b@linux.intel.com>
 <s5ho8p8ifcn.wl-tiwai@suse.de>
 <2404f45d-832d-69a0-fb3b-1981ae455f50@linux.intel.com>
 <s5hftakid2e.wl-tiwai@suse.de>
 <3bfd1d2f-a2f0-4321-8f9d-2b9f265dcebd@www.fastmail.com>
 <s5h7dvviq4q.wl-tiwai@suse.de>
 <f50829b8-0910-fa0e-d94a-215d9f3ccb10@linux.intel.com>
 <efd9b671-c751-c8bf-f5c3-56584682934e@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d9b40986-7003-d6e1-659c-1d6eaa05da35@linux.intel.com>
Date: Thu, 25 Jun 2020 10:43:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <efd9b671-c751-c8bf-f5c3-56584682934e@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Harsha Priya <harshapriya.n@intel.com>, kai.vehmanen@intel.com,
 alsa-devel@alsa-project.org, Emmanuel Jillela <emmanuel.jillela@intel.com>,
 PulseAudio Discussion <pulseaudio-discuss@lists.freedesktop.org>
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



On 6/25/20 10:30 AM, Jaroslav Kysela wrote:
> Dne 25. 06. 20 v 16:46 Pierre-Louis Bossart napsal(a):
>>
>>
>>
>>>>>>> So, rather the question is how we should provide the setup of such
>>>>>>> parameter.  It's supposed to be a part of power management stuff 
>>>>>>> that
>>>>>>> should be touched by either a smart PM tool or a manual override 
>>>>>>> such
>>>>>>> as runtime PM setup?  Or can it be seen as a more casual tuning?
>>>>>>
>>>>>> I am not aware of such tools. The only thing I know is that some of
>>>>>> the HDaudio power settings are already controlled by kernel
>>>>>> parameters, e.g.
>>>>>>
>>>>>> /etc/modprobe.d/audio_powersave.conf
>>>>>> options snd_hda_intel power_save=1
>>>>>
>>>>> Yes, it's been the primary knob for years to turn on/off the runtime
>>>>> PM for HD-audio and other legacy drivers.  This was used by powertop
>>>>> or some other power-aware daemons and tools, to be toggled dynamically
>>>>> per the power cable state or such.
>>>>>
>>>>> And, how the silent stream feature should be seen?
>>>>> Should it be a system-wide root-only setup or adjustable per user?
>>>>> Would it be changed often?  Such questions and answers will lead us to
>>>>> the right direction, I hope.
>>>>
>>>> For audio, would UCM not be the appropriate point for a system 
>>>> integrator to decide how the audio device should be set up?
>>>>
>>>> This would allow for a choice based on the situation in which the 
>>>> device is actually being deployed without users having to muck 
>>>> around with module parameters -- maybe someone wants want this 
>>>> enabled for an HTPC setup, but not on a desktop connected to a monitor.
>>>
>>> Right, that's my concern.  Many users with HDMI monitor that is
>>> capable of audio don't use HDMI audio because they don't need it
>>> and/or the output sucks.  For them, this feature is superfluous and
>>> harmful from the runtime PM POV. >
>>> If it were provided via UCM, would it be yet another UCM profile like
>>> HDMI+silentstream?  This can be confusing, too, I'm afraid.
>>
>> Unless I am mistaken, this silent stream would be applicable to the
>> legacy HDaudio driver, as well as SOF.
>>
>> UCM is not used for the legacy HDaudio case, so that would close the
>> door on UCM-based configurations, no?
> 
> UCM can be used for legacy HDA, too (and it is used for some legacy HDA 
> models - dual codecs). It seems that it's better to describe the 
> "abstract" device layout for users on the one place.

Did you mean represent the form-factor in UCM?

Currently we use e.g. the same bytcr-rt5640 UCM file for tablets, 
notebooks and headless devices (mini desktops). UCM would need to get 
the information from somewhere else, I don't think it'd be practical to 
hard-code form-factors in UCM proper.

> My plan is to migrate to UCM completely at some day when the major 
> issues are resolved. It may be a bit challenge for the legacy HDA driver 
> and USB devices but doable.

For USB I don't know how this would work. USB report descriptors, if you 
wanted to represent all possible cases with UCM you'd need to build the 
union of all possible cases and make parts conditional.
