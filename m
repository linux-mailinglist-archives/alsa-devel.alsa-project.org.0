Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C69E9BBF03
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 01:36:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DF2016B0;
	Tue, 24 Sep 2019 01:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DF2016B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569281802;
	bh=nAFWq4kdp+hbmqzsju5pJeHKHOX0eWikdU6QYyvCFUc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tGNRDm+FXIkxSAZmqN5C0ouca/8o7JoumirhVSJL7qpmurj9yP7/cGS18sXzkoVwF
	 BrBlEp9RbcYSUtAHMxjMed9c+NLvTDR4ObXzAEBOGcrv/7hUtCIqlEocCPUjQUsY4C
	 0c5AjhEyV1najRyQb0WYYwzyGHVIJbQk2aPPm+88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4A50F8044C;
	Tue, 24 Sep 2019 01:34:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 167F8F8044C; Tue, 24 Sep 2019 01:34:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1139FF80213
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 01:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1139FF80213
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 16:34:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,542,1559545200"; d="scan'208";a="272449640"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 23 Sep 2019 16:34:48 -0700
Received: from aabousam-mobl1.amr.corp.intel.com (unknown [10.251.27.167])
 by linux.intel.com (Postfix) with ESMTP id D93445803E4;
 Mon, 23 Sep 2019 16:34:47 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
References: <20190923165739.3975-1-perex@perex.cz>
 <cf20bc02-adb1-0207-5fb2-7b9f0479885e@linux.intel.com>
 <b657b630-c209-b927-6ea3-d72a6ce75639@perex.cz>
 <s5htv92k8tb.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d963eeed-723a-2d88-866c-cf16ac6cf6fc@linux.intel.com>
Date: Mon, 23 Sep 2019 18:34:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <s5htv92k8tb.wl-tiwai@suse.de>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 9/23/19 4:21 PM, Takashi Iwai wrote:
> On Mon, 23 Sep 2019 22:35:14 +0200,
> Jaroslav Kysela wrote:
>>
>> Dne 23. 09. 19 v 20:24 Pierre-Louis Bossart napsal(a):
>>> On 9/23/19 11:57 AM, Jaroslav Kysela wrote:
>>>> There are basically three drivers for the PCI devices for
>>>> the recent Intel hardware with the build-in DSPs. The legacy HDA
>>>> driver has dmic_detect module option for the auto detection
>>>> of the platforms with the digital microphone. Because the SOF
>>>> driver is preferred, just skip PCI probe in the Skylake SST
>>>> driver when the PCI device ID clashes by default. The user
>>>> can override the auto behaviour with the pci_binding
>>>> module parameter.
>>>
>>> Thanks Jaroslav for re-opening this mutual-exclusion issue.
>>>
>>> I think we want to deal with this in two alternate ways
>>> 1. static built-time exclusion based on Kconfigs
>>
>> Unfortunately, that's really an issue for the universal distros.
> 
> Right.  The Kconfig of Intel audio is already too messy even for now.
> We don't want more complexity just for covering some very corner
> case.
> 
> Practically seen, if SOF Kconfig is enabled, we may assume that SOF is
> preferred in general.  I don't think of any big need of yet another
> static configuration.
> 
>>> 2. probe-time exclusion based on quirks (CPU ID + DMI)
>>>
>>> For example with a SKL/KBL/APL chromebook w/ DMIC we'd want to use the
>>> SST driver and for GLK+ we want to use SOF. For any device with
>>> HDAudio+DMIC we'd want SOF, same for any device with SoundWire when it's
>>> fully supported.
>>>
>>> I can't recall if I shared the patches I worked on a couple of months
>>> ago, but they are still at https://github.com/thesofproject/linux/pull/927
>>
>> Thanks for pointing me to this. It does not address the legacy HDA, but it's a
>> step forward.
> 
> The legacy HD-audio stuff is resolved with the recent DMIC detection
> on 5.4, I suppose?
> 
>>> the first part essentially does the same thing as this patch, the second
>>> relies on quirks. I've been busy with other things but indeed it's high
>>> time we closed this for distributions.
>>
>> Yes, and I have to say, it's too late for the hardware vendors right now. I
>> will probably apply my patch to our distribution (I don't care too much about
>> chromebooks - the user can change the module/driver behaviour manually) until
>> we have a better code.
>>
>>>> Boot log from Lenovo Carbon X1 (7th gen) with the default settings:
>>>>
>>>>     snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, aborting probe
>>>>     snd_soc_skl 0000:00:1f.3: SOF driver is preferred on this platform, aborting probe
>>>>     sof-audio-pci 0000:00:1f.3: warning: No matching ASoC machine driver found
>>>>     sof-audio-pci 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040380
>>>>     ....
>>>>
>>>> Perhaps, it may be more wise to create one shared module and all
>>>> three drivers should call the driver detection routine(s) from one
>>>> place.
>>>
>>> We did look into this and it's a bit complicated in terms of plumbing.
>>
>> Could you elaborate more here? I believe that for the runtime environment
>> where all drivers are compiled in the kernel, it might make sense to have this
>> code at one place and installed only once for all three (or may be four in the
>> soundwire future) drivers.
>>
>> We should have one straight way which driver/module is used. The separate
>> conditions in the mentioned drivers will cause problems. Also, it will
>> simplify things for the end user. One module parameter (in the driver selector
>> library) is better than three or four to make things working (if the DMI /
>> whatever table is not preset correctly for the new hardware).
> 
> Well, one question is where to put this option.  I thought of HD-audio
> core in the past, but it's not always the common place any longer.
> We may introduce yet another common module just for an option, but it
> sounds little appealing to me in comparison with the needed
> resources.
> 
> Basically the deployment of SST is only for the already existing
> devices, and all newer should go for SOF.  And, the pattern Pierre
> mentioned should cover almost all use cases.  This made me believing
> that a simple switch is no mandatory request.
> 
> In anyway, Jaroslav's patch looks like a good starting point.  We can
> build up a few more exceptions (SKl/KBl/APL Chromebooks with DMIC) on
> top of it, then we've done mostly, right?

Yes, there are only a handful of quirks really.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
