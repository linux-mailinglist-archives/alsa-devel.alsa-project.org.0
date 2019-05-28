Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EB92D108
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 23:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A88D15E0;
	Tue, 28 May 2019 23:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A88D15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559079240;
	bh=DSlHbB7hPtL80mueDJ7nWlg0ccrNbJfCHXT1xXSkwIs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOO4Bt/Fe2qayXgv7uI4XPky5Ar+HrT9RNcmAaVbiC/rMgl4WpUrph8wmkwYE4aRB
	 rGDKYrs4baRVl1zuC+3rVPETVFWwfrrTjxlmXcYMoRaAAqc/jPxCpvMSVd+fcMh9yT
	 Abfd2196DCSSSGGt1d73dDhQBASH/7O7T73IEbUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87794F8065A;
	Tue, 28 May 2019 23:32:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AD9CF89706; Tue, 28 May 2019 23:32:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E642F8065A
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 23:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E642F8065A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 14:32:06 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 28 May 2019 14:32:05 -0700
Received: from msakib-mobl2.amr.corp.intel.com (unknown [10.254.189.121])
 by linux.intel.com (Postfix) with ESMTP id 221FD5802C9;
 Tue, 28 May 2019 14:32:05 -0700 (PDT)
To: Jaroslav Kysela <perex@perex.cz>
References: <s5hblzmvdcq.wl-tiwai@suse.de>
 <9668d632-c5c9-5114-39cb-0e8a105a547c@perex.cz>
 <9d5ef75c-9b28-3998-865d-a958b7aaaa75@linux.intel.com>
 <b11570d9-6b46-e162-eb91-22e81bfa17bd@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9e1dc0e5-dd6a-1f4a-b141-152e61fdbc03@linux.intel.com>
Date: Tue, 28 May 2019 16:32:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b11570d9-6b46-e162-eb91-22e81bfa17bd@perex.cz>
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

On 5/28/19 2:15 PM, Jaroslav Kysela wrote:
> I believe that we need to discuss this more.

Yep, absolutely!

> Dne 28. 05. 19 v 18:59 Pierre-Louis Bossart napsal(a):
>>
>>
>> On 5/28/19 11:38 AM, Jaroslav Kysela wrote:
>>
>>> The same situation is for the SoC SOF firmware files (drivers are
>>> in kernel, firmware files are missing). Perhaps, we can release those files
>>> quickly in alsa-firmware and then migrate them slowly to linux-firmware.
>>
>> for SOF there are 4 cases
>>
>> 1. developers/integrators build from scratch themselves from the public
>> tree.
>> 2. integrators build from scratch with their own secret sauce added.
>> 3. distros want a binary since they don't want to build from source
>> and/or don't have access to all the DSP tools
>> 4. distros needs a binary signed with the Intel production key (e.g. to
>> run on devices initially designed for Windows).
> 
> Do you mean that the firmware should be signed because the hardware is doing a
> check, if the hardware vendor enables it and rejects the unsigned binaries?

It depends on the platforms.
Baytrail/Cherrytrail/Broadwell don't need any signature.
Starting with Skylake, the firmware is authenticated and the DSP will 
not boot unless it's signed with the relevant key, but different 
platforms chose different protections. Most of the Windows platforms use 
a strong authentication based on a non-public 'production key', which 
prevents people from installing their own firmware. Other solutions such 
as Up Squared boards or 2019 Chromebooks use a public key that is 
already part of the SOF tree.
Unfortunately I didn't find a way to detect which key is used, and it's 
not wise to try multiple keys since it adds a lot of latency on startup, 
so we are leaning to use DMI-based quirks to detect which key is used by 
what.

> 
>> So far we were mostly dealing with case 1. Case 2 is allowed by the SOF
>> permissive license and there's no need to look into this. We are
>> planning releases for the last two cases, with a cadence aligned with
>> kernel updates. It's not fully clear to me if the linux-firmware tree is
>> the 'right' solution since ideally we'd want to have firmware, topology
>> and UCM files released at the same time.
> 
> Do you plan to create a new package for this? I can eventually offer the space
> / docker build system on the ALSA server, if you like. The github releases
> work fine, too. The question is, if it's the right way. It seems that the
> firmware/topology files are read-only chunks used by the driver (standard
> usage) and the UCM config is for alsa-lib (the user space). It might make
> probably sense to add compatibility IDs to link/check the correct parts
> together at runtime and keep the standard (binary) code distribution for the
> most of users (linux-firmware / alsa-lib).

There is a connection mostly between topology and UCM: the device 
numbers used for the PCM streams have to match. If you add/remove a 
stream in the topology, then UCM will use numbers that aren't quite 
right. Same if you have a volume control used in UCM, you need to make 
sure that volume control is actually part of the topology.

In the past, we discussed about moving UCM files and topology out of the 
alsa-lib umbrella (and clarify what the license is for these 
configuration files), it's probably a good time to revisit this.

> 
> Speaking for distributions, we need to correctly identify the driver which
> will load the proper firmware files. From notes posted to the alsa-devel ML,
> it seems that there are three drivers for similar hardware (sound bridges) now
> and it is not easy to identify the proper driver, because the similar PCI ID
> is registered in all of them:
> 
> 1) legacy HDA
> 2) sound/soc/intel
> 3) sound/soc/sof/intel
> 
> Do not forget that the distributions include all driver modules in their
> universal kernels. It seems like a problem for the Intel hardware at the
> moment. Perhaps, you may give us some recommendations / hints.

Yes, I've started working on this, it's part of the same "distro 
enabling" discussion.
In most of the cases, the legacy HDaudio driver can be used, unless 
there are DMICs attached. I submitted an RFC to try to add an 
auto-detection.
I also added a build-time exclusion between SOF and SST drivers, and a 
smarter run-time detection I am still working on.

> 
> Totaly another topic is the on-demand installation of firmware files (and
> eventually ALSA configuration files). The linux-firmware package has over
> 180MB now and it's growing. It makes sense to install only useable firmware
> files - ommit the files for hardware / drivers which are not detected and
> used. It's probably a topic for linux-firmware rather then the ALSA project.

Indeed, for SOF we already have 6 or 7 firmwares for different SOCs and 
all the possible topologies.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
