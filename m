Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FB4BD0A8
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 19:31:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A86516AF;
	Tue, 24 Sep 2019 19:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A86516AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569346269;
	bh=Tk1FvucUIXIbx6W0pYhjz05TAQs0IBXgyPmbQx3Shrc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JOPDqnrmfNh8MXjHip6LyiOXh6c36zDcDQAFG+IAYJDM68Ku8jfrdyRUwrtoGLsjd
	 m3NQ47Q5/b7QE9lVMRBfbwHnb4QayiKA9CtJeRcugTvwgt9fRmeJ4Ipj3VJ1l5VpBm
	 yQC+joBNelg/brJrpZavPyyws6uqs4v99R4FL3YM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9E17F800B4;
	Tue, 24 Sep 2019 19:29:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73A05F8045F; Tue, 24 Sep 2019 19:29:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_29,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1005F800B4
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 19:29:18 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 72D4CA003F;
 Tue, 24 Sep 2019 19:29:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 72D4CA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1569346157; bh=31KARJ8I+ZTu/FXfP47CCzo7QfPL8kcW8E6lovfyDGA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Vy6SC9XbkUnelUkmliZo75nuqYbuRz2pSl3zoSDBmk18phBZbOZobULLjMjypTkwe
 VUbF2NQ25bPnQshbALJu/1Q+FixGMCS9NPSHBda0k1mRmwn4KvcRd/5S/FnlzoVxz/
 6+lb8uo8dwQ+ygBUhNh78rI2PPbxaYCb65Ua/ywo=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 24 Sep 2019 19:29:14 +0200 (CEST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>
References: <20190923165739.3975-1-perex@perex.cz>
 <cf20bc02-adb1-0207-5fb2-7b9f0479885e@linux.intel.com>
 <b657b630-c209-b927-6ea3-d72a6ce75639@perex.cz>
 <s5htv92k8tb.wl-tiwai@suse.de>
 <d963eeed-723a-2d88-866c-cf16ac6cf6fc@linux.intel.com>
 <19cfb65e-e539-2225-82a5-813ab9be9f2b@perex.cz>
 <f0bf450a-441f-8f38-45c7-6580bea4a754@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <eee59fb7-aa13-9c49-4ee5-152836e5c559@perex.cz>
Date: Tue, 24 Sep 2019 19:29:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f0bf450a-441f-8f38-45c7-6580bea4a754@linux.intel.com>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Skylake SST driver - blacklist the
 PCI device IDs for the auto probe
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 24. 09. 19 v 15:41 Pierre-Louis Bossart napsal(a):
> 
> 
> On 9/24/19 1:46 AM, Jaroslav Kysela wrote:
>> Dne 24. 09. 19 v 1:34 Pierre-Louis Bossart napsal(a):
>>> On 9/23/19 4:21 PM, Takashi Iwai wrote:
>>>> On Mon, 23 Sep 2019 22:35:14 +0200,
>>>> Jaroslav Kysela wrote:
>>>>>
>>>>> Dne 23. 09. 19 v 20:24 Pierre-Louis Bossart napsal(a):
>>>>>> On 9/23/19 11:57 AM, Jaroslav Kysela wrote:
>>>>>>> There are basically three drivers for the PCI devices for
>>>>>>> the recent Intel hardware with the build-in DSPs. The legacy HDA
>>>>>>> driver has dmic_detect module option for the auto detection
>>>>>>> of the platforms with the digital microphone. Because the SOF
>>>>>>> driver is preferred, just skip PCI probe in the Skylake SST
>>>>>>> driver when the PCI device ID clashes by default. The user
>>>>>>> can override the auto behaviour with the pci_binding
>>>>>>> module parameter.
>>>>>>
>>>>>> Thanks Jaroslav for re-opening this mutual-exclusion issue.
>>>>>>
>>>>>> I think we want to deal with this in two alternate ways
>>>>>> 1. static built-time exclusion based on Kconfigs
>>>>>
>>>>> Unfortunately, that's really an issue for the universal distros.
>>>>
>>>> Right.  The Kconfig of Intel audio is already too messy even for now.
>>>> We don't want more complexity just for covering some very corner
>>>> case.
>>>>
>>>> Practically seen, if SOF Kconfig is enabled, we may assume that SOF is
>>>> preferred in general.  I don't think of any big need of yet another
>>>> static configuration.
>>>>
>>>>>> 2. probe-time exclusion based on quirks (CPU ID + DMI)
>>>>>>
>>>>>> For example with a SKL/KBL/APL chromebook w/ DMIC we'd want to use the
>>>>>> SST driver and for GLK+ we want to use SOF. For any device with
>>>>>> HDAudio+DMIC we'd want SOF, same for any device with SoundWire when it's
>>>>>> fully supported.
>>>>>>
>>>>>> I can't recall if I shared the patches I worked on a couple of months
>>>>>> ago, but they are still at https://github.com/thesofproject/linux/pull/927
>>>>>
>>>>> Thanks for pointing me to this. It does not address the legacy HDA, but it's a
>>>>> step forward.
>>>>
>>>> The legacy HD-audio stuff is resolved with the recent DMIC detection
>>>> on 5.4, I suppose?
>>
>> Unfortunately not completely. The Broxton and Coffelake PCI IDs are also
>> shared by the SST / Legacy HDA drivers, so the universal kernel will be
>> confused (at least snd_hda_intel will be loaded as first).
> 
> I don't see any issues with this. The use of the DSP is only required 
> when DMICs/I2S/SoundWire are used, or the firmware contains processing. 
> Using the firmware is passthrough mode brings no added value.
> 
> If the only thing that's done is manage an HDaudio link, the legacy is 
> just fine.

Yes, but the dependancy on the PCI probe order specified just by the module
name is not really nice at all. We are just lucky that the legacy
snd_hda_intel is first.

>>>>>> the first part essentially does the same thing as this patch, the second
>>>>>> relies on quirks. I've been busy with other things but indeed it's high
>>>>>> time we closed this for distributions.
>>>>>
>>>>> Yes, and I have to say, it's too late for the hardware vendors right now. I
>>>>> will probably apply my patch to our distribution (I don't care too much about
>>>>> chromebooks - the user can change the module/driver behaviour manually) until
>>>>> we have a better code.
>>>>>
>>>>>>> Boot log from Lenovo Carbon X1 (7th gen) with the default settings:
>>>>>>>
>>>>>>>      snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, aborting probe
>>>>>>>      snd_soc_skl 0000:00:1f.3: SOF driver is preferred on this platform, aborting probe
>>>>>>>      sof-audio-pci 0000:00:1f.3: warning: No matching ASoC machine driver found
>>>>>>>      sof-audio-pci 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040380
>>>>>>>      ....
>>>>>>>
>>>>>>> Perhaps, it may be more wise to create one shared module and all
>>>>>>> three drivers should call the driver detection routine(s) from one
>>>>>>> place.
>>>>>>
>>>>>> We did look into this and it's a bit complicated in terms of plumbing.
>>>>>
>>>>> Could you elaborate more here? I believe that for the runtime environment
>>>>> where all drivers are compiled in the kernel, it might make sense to have this
>>>>> code at one place and installed only once for all three (or may be four in the
>>>>> soundwire future) drivers.
>>>>>
>>>>> We should have one straight way which driver/module is used. The separate
>>>>> conditions in the mentioned drivers will cause problems. Also, it will
>>>>> simplify things for the end user. One module parameter (in the driver selector
>>>>> library) is better than three or four to make things working (if the DMI /
>>>>> whatever table is not preset correctly for the new hardware).
>>>>
>>>> Well, one question is where to put this option.  I thought of HD-audio
>>>> core in the past, but it's not always the common place any longer.
>>>> We may introduce yet another common module just for an option, but it
>>>> sounds little appealing to me in comparison with the needed
>>>> resources.
>>>>
>>>> Basically the deployment of SST is only for the already existing
>>>> devices, and all newer should go for SOF.  And, the pattern Pierre
>>>> mentioned should cover almost all use cases.  This made me believing
>>>> that a simple switch is no mandatory request.
>>>>
>>>> In anyway, Jaroslav's patch looks like a good starting point.  We can
>>>> build up a few more exceptions (SKl/KBl/APL Chromebooks with DMIC) on
>>>> top of it, then we've done mostly, right?
>>>
>>> Yes, there are only a handful of quirks really.
>>
>> It seems like a not very rubust solution for me. If you don't like to have
>> a standalone module, the code might be included to all drivers, but we losethe
>> possibility to control the auto detection behaviour from the one place
>> (one module parameter).
>>
>> Perhaps, we can rename snd_intel_nhlt() module and put the auto-detection code
>> there. It's required by all mentioned drivers, so the extra resources required
>> for this new code are minimal.
> 
> it's kinda what my patches were about, there was a central set of quirks 
> in sound/soc/intel/common called by SOF/SST drivers.

Yes, but no legacy HDA... I can expect that we want to use DSP to enable some
effects or decoders on hardware which has this co-processor in the near future.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
