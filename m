Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2584FBBD0C
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Sep 2019 22:37:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9745F16AA;
	Mon, 23 Sep 2019 22:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9745F16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569271027;
	bh=ZqwLKQnSiSyepoR6gqGMnbd8rmEdqoZiP6U0eyoXFG4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FUYkHAbtZhKBluu0rcP1i7G1yZ4TL+CfPBElZt9KmDOtUSD9cv+Vn2nNC8viAAFva
	 eU/WB7lNVNhE0iEhDzcEeVkIUUdcXLh7TZQLpwD8Kb5ELuqHOcvKDLMgQ65BBL5HvB
	 me7waWqgNx+MI9xIJGVdJpnjmEvA7Pxy9UXqPc5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8717F8044C;
	Mon, 23 Sep 2019 22:35:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52598F8044C; Mon, 23 Sep 2019 22:35:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFC3BF802BD
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 22:35:18 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D729DA003F;
 Mon, 23 Sep 2019 22:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D729DA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1569270917; bh=K+zJDuRcw8pxqfYvSiGA/ljAcD9a3tZCMeRQDmCnPrc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=R7ThhIH/H/UgGRENsfMQEmT0fXq6UYEI4gIeECCJt0heF2etBaFn2b7Sn/xr6veEG
 VC7pfeiOz+9bScmkgD/Iiq9EDUacMjs1CruGqoHZtaO23UuAfMtXto11mPPDWyPDoQ
 LddNMWMxYPg58UTW1WYzX5CnRTa7nhQh9Ds8rW9U=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 23 Sep 2019 22:35:14 +0200 (CEST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20190923165739.3975-1-perex@perex.cz>
 <cf20bc02-adb1-0207-5fb2-7b9f0479885e@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <b657b630-c209-b927-6ea3-d72a6ce75639@perex.cz>
Date: Mon, 23 Sep 2019 22:35:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cf20bc02-adb1-0207-5fb2-7b9f0479885e@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>
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

Dne 23. 09. 19 v 20:24 Pierre-Louis Bossart napsal(a):
> On 9/23/19 11:57 AM, Jaroslav Kysela wrote:
>> There are basically three drivers for the PCI devices for
>> the recent Intel hardware with the build-in DSPs. The legacy HDA
>> driver has dmic_detect module option for the auto detection
>> of the platforms with the digital microphone. Because the SOF
>> driver is preferred, just skip PCI probe in the Skylake SST
>> driver when the PCI device ID clashes by default. The user
>> can override the auto behaviour with the pci_binding
>> module parameter.
> 
> Thanks Jaroslav for re-opening this mutual-exclusion issue.
> 
> I think we want to deal with this in two alternate ways
> 1. static built-time exclusion based on Kconfigs

Unfortunately, that's really an issue for the universal distros.

> 2. probe-time exclusion based on quirks (CPU ID + DMI)
> 
> For example with a SKL/KBL/APL chromebook w/ DMIC we'd want to use the 
> SST driver and for GLK+ we want to use SOF. For any device with 
> HDAudio+DMIC we'd want SOF, same for any device with SoundWire when it's 
> fully supported.
> 
> I can't recall if I shared the patches I worked on a couple of months 
> ago, but they are still at https://github.com/thesofproject/linux/pull/927

Thanks for pointing me to this. It does not address the legacy HDA, but it's a
step forward.

> the first part essentially does the same thing as this patch, the second 
> relies on quirks. I've been busy with other things but indeed it's high 
> time we closed this for distributions.

Yes, and I have to say, it's too late for the hardware vendors right now. I
will probably apply my patch to our distribution (I don't care too much about
chromebooks - the user can change the module/driver behaviour manually) until
we have a better code.

>> Boot log from Lenovo Carbon X1 (7th gen) with the default settings:
>>
>>    snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, aborting probe
>>    snd_soc_skl 0000:00:1f.3: SOF driver is preferred on this platform, aborting probe
>>    sof-audio-pci 0000:00:1f.3: warning: No matching ASoC machine driver found
>>    sof-audio-pci 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040380
>>    ....
>>
>> Perhaps, it may be more wise to create one shared module and all
>> three drivers should call the driver detection routine(s) from one
>> place.
> 
> We did look into this and it's a bit complicated in terms of plumbing.

Could you elaborate more here? I believe that for the runtime environment
where all drivers are compiled in the kernel, it might make sense to have this
code at one place and installed only once for all three (or may be four in the
soundwire future) drivers.

We should have one straight way which driver/module is used. The separate
conditions in the mentioned drivers will cause problems. Also, it will
simplify things for the end user. One module parameter (in the driver selector
library) is better than three or four to make things working (if the DMI /
whatever table is not preset correctly for the new hardware).

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
