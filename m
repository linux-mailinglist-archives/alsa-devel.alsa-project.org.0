Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3726A20A1FC
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 17:32:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B346B18FE;
	Thu, 25 Jun 2020 17:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B346B18FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593099165;
	bh=Xv1ZTwoBRTYxIdiusyFhNdjBN5Rv72pVZy4PMVEoFls=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dctzlIKpzGrzpfqtEj/tBEBzgcic+i0gAJSEFNRFczSNHbMgDwr+5wlhsBbbk6hga
	 FGAYaTtDiweHsxJPWClOaGjvSjlISoixYK7Sk/QnP/cUuwZIlqiaqsND3Jp3El2Mv3
	 JuqE/SMoxEYaZqTZM3NcbjA9H8W1GBoE8TzaITEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D094BF8023E;
	Thu, 25 Jun 2020 17:31:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56F4CF80234; Thu, 25 Jun 2020 17:31:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CEDCF80158
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 17:30:55 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BA4B3A003F;
 Thu, 25 Jun 2020 17:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BA4B3A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1593099054; bh=o9Kivi540+rPpG8m2CeZhcRaVbrAOm3HpFoPLy0aVSs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qa9kbKTakUcMO5/ZmUEoNvAjvPeBpTY5lpCfTgqc9nvEHKKCCfdXahM9dFtDYfq9+
 4/cQllH2sJPDG0hdIgeVfvljxuMjpliIAAtmKpRdBwOwS219TZ5PFSaSalRNfPnNK4
 QsYIh+rVOZadcCeqEhr8IVk6L6vwwEZFZM6QU4TY=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 25 Jun 2020 17:30:46 +0200 (CEST)
Subject: Re: [PATCH] ALSA: hda/hdmi: Add Intel silent stream support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Arun Raghavan <arun@arunraghavan.net>
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
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <efd9b671-c751-c8bf-f5c3-56584682934e@perex.cz>
Date: Thu, 25 Jun 2020 17:30:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f50829b8-0910-fa0e-d94a-215d9f3ccb10@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 25. 06. 20 v 16:46 Pierre-Louis Bossart napsal(a):
> 
> 
> 
>>>>>> So, rather the question is how we should provide the setup of such
>>>>>> parameter.  It's supposed to be a part of power management stuff that
>>>>>> should be touched by either a smart PM tool or a manual override such
>>>>>> as runtime PM setup?  Or can it be seen as a more casual tuning?
>>>>>
>>>>> I am not aware of such tools. The only thing I know is that some of
>>>>> the HDaudio power settings are already controlled by kernel
>>>>> parameters, e.g.
>>>>>
>>>>> /etc/modprobe.d/audio_powersave.conf
>>>>> options snd_hda_intel power_save=1
>>>>
>>>> Yes, it's been the primary knob for years to turn on/off the runtime
>>>> PM for HD-audio and other legacy drivers.  This was used by powertop
>>>> or some other power-aware daemons and tools, to be toggled dynamically
>>>> per the power cable state or such.
>>>>
>>>> And, how the silent stream feature should be seen?
>>>> Should it be a system-wide root-only setup or adjustable per user?
>>>> Would it be changed often?  Such questions and answers will lead us to
>>>> the right direction, I hope.
>>>
>>> For audio, would UCM not be the appropriate point for a system integrator to decide how the audio device should be set up?
>>>
>>> This would allow for a choice based on the situation in which the device is actually being deployed without users having to muck around with module parameters -- maybe someone wants want this enabled for an HTPC setup, but not on a desktop connected to a monitor.
>>
>> Right, that's my concern.  Many users with HDMI monitor that is
>> capable of audio don't use HDMI audio because they don't need it
>> and/or the output sucks.  For them, this feature is superfluous and
>> harmful from the runtime PM POV. >
>> If it were provided via UCM, would it be yet another UCM profile like
>> HDMI+silentstream?  This can be confusing, too, I'm afraid.
> 
> Unless I am mistaken, this silent stream would be applicable to the
> legacy HDaudio driver, as well as SOF.
> 
> UCM is not used for the legacy HDaudio case, so that would close the
> door on UCM-based configurations, no?

UCM can be used for legacy HDA, too (and it is used for some legacy HDA models 
- dual codecs). It seems that it's better to describe the "abstract" device 
layout for users on the one place.

My plan is to migrate to UCM completely at some day when the major issues are 
resolved. It may be a bit challenge for the legacy HDA driver and USB devices 
but doable.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
