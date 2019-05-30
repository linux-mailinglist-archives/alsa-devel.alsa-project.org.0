Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7BF2FAD0
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 13:23:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5909C15F2;
	Thu, 30 May 2019 13:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5909C15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559215413;
	bh=NSgOwOuqTnRRq1zj75g7iPOkuo8UmVN5NnyzPNsbEGg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R0UAafpS6m/Zqgk/9NhanMtjnXW4huyL6Y2zYfRJ3R+3eQc9gFVHDOMP6mB1P5B1Y
	 T5vWdCS62rHrhLnJiLLO26Jw4OOegagPBPYk2WGTFUHZyFKZRtdYU5ZKwA3UMj+tJ2
	 oWCfs/8TVdJim3ZAcFzmfDwTZFBCBWlc+nMrVzzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1734F896F8;
	Thu, 30 May 2019 13:21:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A10DFF896F8; Thu, 30 May 2019 13:21:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A34F7F8065A
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 13:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A34F7F8065A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 04:21:39 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 30 May 2019 04:21:39 -0700
Received: from msakib-mobl2.amr.corp.intel.com (unknown [10.254.189.121])
 by linux.intel.com (Postfix) with ESMTP id 0C89D5804BA;
 Thu, 30 May 2019 04:21:38 -0700 (PDT)
To: Jaroslav Kysela <perex@perex.cz>
References: <s5hblzmvdcq.wl-tiwai@suse.de>
 <9668d632-c5c9-5114-39cb-0e8a105a547c@perex.cz>
 <9d5ef75c-9b28-3998-865d-a958b7aaaa75@linux.intel.com>
 <b11570d9-6b46-e162-eb91-22e81bfa17bd@perex.cz>
 <9e1dc0e5-dd6a-1f4a-b141-152e61fdbc03@linux.intel.com>
 <83fbde51-e6ad-9254-31c1-1ce6a343cb2c@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ee93ea27-1dd4-57ff-3b91-ac0576525b65@linux.intel.com>
Date: Thu, 30 May 2019 06:21:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <83fbde51-e6ad-9254-31c1-1ce6a343cb2c@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] SOF firmware/ucm/topology packaging
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


>>>>> The same situation is for the SoC SOF firmware files (drivers are
>>>>> in kernel, firmware files are missing). Perhaps, we can release those files
>>>>> quickly in alsa-firmware and then migrate them slowly to linux-firmware.
>>>>
>>>> for SOF there are 4 cases
>>>>
>>>> 1. developers/integrators build from scratch themselves from the public
>>>> tree.
>>>> 2. integrators build from scratch with their own secret sauce added.
>>>> 3. distros want a binary since they don't want to build from source
>>>> and/or don't have access to all the DSP tools
>>>> 4. distros needs a binary signed with the Intel production key (e.g. to
>>>> run on devices initially designed for Windows).
>>>
>>> Do you mean that the firmware should be signed because the hardware is doing a
>>> check, if the hardware vendor enables it and rejects the unsigned binaries?
>>
>> It depends on the platforms.
>> Baytrail/Cherrytrail/Broadwell don't need any signature.
>> Starting with Skylake, the firmware is authenticated and the DSP will
>> not boot unless it's signed with the relevant key, but different
>> platforms chose different protections. Most of the Windows platforms use
>> a strong authentication based on a non-public 'production key', which
>> prevents people from installing their own firmware. Other solutions such
>> as Up Squared boards or 2019 Chromebooks use a public key that is
>> already part of the SOF tree.
>> Unfortunately I didn't find a way to detect which key is used, and it's
>> not wise to try multiple keys since it adds a lot of latency on startup,
>> so we are leaning to use DMI-based quirks to detect which key is used by
>> what.
> 
> Any ETA when then signed firmware will be available?

it's being productized as we speak and it's my understanding that SOF 
1.3 will provide a signed firmware for recent chipsets.

>>>> So far we were mostly dealing with case 1. Case 2 is allowed by the SOF
>>>> permissive license and there's no need to look into this. We are
>>>> planning releases for the last two cases, with a cadence aligned with
>>>> kernel updates. It's not fully clear to me if the linux-firmware tree is
>>>> the 'right' solution since ideally we'd want to have firmware, topology
>>>> and UCM files released at the same time.
>>>
>>> Do you plan to create a new package for this? I can eventually offer the space
>>> / docker build system on the ALSA server, if you like. The github releases
>>> work fine, too. The question is, if it's the right way. It seems that the
>>> firmware/topology files are read-only chunks used by the driver (standard
>>> usage) and the UCM config is for alsa-lib (the user space). It might make
>>> probably sense to add compatibility IDs to link/check the correct parts
>>> together at runtime and keep the standard (binary) code distribution for the
>>> most of users (linux-firmware / alsa-lib).
>>
>> There is a connection mostly between topology and UCM: the device
>> numbers used for the PCM streams have to match. If you add/remove a
>> stream in the topology, then UCM will use numbers that aren't quite
>> right. Same if you have a volume control used in UCM, you need to make
>> sure that volume control is actually part of the topology.
>>
>> In the past, we discussed about moving UCM files and topology out of the
>> alsa-lib umbrella (and clarify what the license is for these
>> configuration files), it's probably a good time to revisit this.
> 
> It is also the packaging issue. This situation complicates the package
> dependency tree. Basically, it might not be ideal to force users to install
> extra package to support the specific hardware platform with fw/ucm/tplg
> files. On the other side, there is no reason to have those bits installed on
> system where the hardware does not exist. There should be an automatic way to
> install the required bits on demand in the distribution in my opinion. I know,
> it's not your issue.
> 
> I see those ways:
> 
> 1) package everything hw specific to one package (fw/ucm/tplg), let distros to
> handle the automatic installation when the hardware is detected or the
> integration to the current alsa-lib/linux-firmware packages to avoid on-demand
> installation
> 
> 2) use some versioning / linking IDs for the firmware/topology/ucm, so we can
> have more topology/ucm files for one hardware; the driver can use the
> component field in the ALSA's control interface to notify the user space which
> firmware / topology was loaded, so the correct UCM files can be used

Unfortunately that would not work. The UCM file needs to be aligned with 
the topology but also with the hardware peripherals used. The topology 
file only describes the DSP graph, all the way from PCM streams to DAIs. 
The platform hardware can be very different even when you use the same 
topology file. A simple example is that some platforms have a single 
speaker or others two. The mics may be analog or digital. That 
hardware-level information that UCM needs to know is not discoverable 
and we have to rely on DMI-based quirks to set a long name. Knowing 
which topology file was used will not help.
Even finding out which topology file is needed is not obvious. We 
currently use the codec ACPI ID as a key to look-up a set of static 
tables to figure out which firmware and topology files need to be used, 
but it's likely we will have multiple platforms which will end-up using 
the same generic topology even though they'd need a different one to 
account for form-factor or acoustics. Again we will have to use quirks here.

> 
>>> Speaking for distributions, we need to correctly identify the driver which
>>> will load the proper firmware files. From notes posted to the alsa-devel ML,
>>> it seems that there are three drivers for similar hardware (sound bridges) now
>>> and it is not easy to identify the proper driver, because the similar PCI ID
>>> is registered in all of them:
>>>
>>> 1) legacy HDA
>>> 2) sound/soc/intel
>>> 3) sound/soc/sof/intel
>>>
>>> Do not forget that the distributions include all driver modules in their
>>> universal kernels. It seems like a problem for the Intel hardware at the
>>> moment. Perhaps, you may give us some recommendations / hints.
>>
>> Yes, I've started working on this, it's part of the same "distro
>> enabling" discussion.
>> In most of the cases, the legacy HDaudio driver can be used, unless
>> there are DMICs attached. I submitted an RFC to try to add an
>> auto-detection.
>> I also added a build-time exclusion between SOF and SST drivers, and a
>> smarter run-time detection I am still working on.
> 
> Great. Thanks. It seems that the DMIC support is sensitive for the hardware
> vendors now.

Indeed, the combination of HDAudio codecs+ DMIC keeps most of the SOF 
team busy at the moment.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
