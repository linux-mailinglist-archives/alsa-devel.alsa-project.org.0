Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8EA99831
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 17:31:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03793166A;
	Thu, 22 Aug 2019 17:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03793166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566487894;
	bh=Qt/6AgBReKKHPcTk8qlA70ofJ6+DKcNsdVHm7vstkwU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d1/JXtQLZNGOKZUjjecoVfN7O4ZmSMP/9F9iLsWuPutv8+BneigvAoHGiSjk67PkZ
	 lJxuim9R3ayeGF3G/4gqgksVpmW9RvWwu2GMDOyWg+25pt9kt2hZHTtBP9xgkbPk4b
	 qSCLsQTrOgBALkdDmy3nQ7yb/cVFYdWcHjVnKfNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BCD6F8036E;
	Thu, 22 Aug 2019 17:29:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91322F8036E; Thu, 22 Aug 2019 17:29:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D5E9F800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 17:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D5E9F800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 08:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="180416012"
Received: from rdonovan-mobl1.ger.corp.intel.com (HELO [10.252.2.209])
 ([10.252.2.209])
 by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2019 08:29:34 -0700
To: "Jie, Yang" <yang.jie@intel.com>
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
 <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
 <37ede7ea-e760-eac9-a1d5-0eb8e3bff3cb@linux.intel.com>
 <CACJJ=pyb==xWqKMB-gAzW7-FCFgEU7Rm+b-CL-ANO-eorDKy=A@mail.gmail.com>
 <356b3f4eacb43f23c40c4cd8e3c54ae9514a34c6.camel@linux.intel.com>
 <7e08e45d-7cec-9fdd-36c5-5e82632968f8@linux.intel.com>
 <CACJJ=pzcMCaOvHMVhmYKKL2Z45-XdrBB9FT8VjSzX_obVtKzyw@mail.gmail.com>
 <d80c2f4d-b5f4-5bbe-9529-36b9859ab8be@linux.intel.com>
 <CACJJ=pxokT5z+U=nM9QcUVxCk84998ugM5J89U28k=CVGMjG=w@mail.gmail.com>
 <E7B1D079BA13FB44A978CC8F69C7D6A9606FC567@SHSMSX106.ccr.corp.intel.com>
 <d0131c02-3477-8390-e0c6-b37b142169e8@intel.com>
 <E7B1D079BA13FB44A978CC8F69C7D6A9606FC9AE@SHSMSX106.ccr.corp.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <fe0d4511-aecd-bee5-c491-4a093a14110e@intel.com>
Date: Thu, 22 Aug 2019 17:29:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <E7B1D079BA13FB44A978CC8F69C7D6A9606FC9AE@SHSMSX106.ccr.corp.intel.com>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "benzh@chromium.org" <benzh@chromium.org>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>,
 Jon Flatley <jflat@chromium.org>
Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
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

On 2019-08-20 04:11, Jie, Yang wrote:
> 
>> -----Original Message-----
>> From: Rojewski, Cezary
>> Sent: Tuesday, August 20, 2019 2:09 AM
>> To: Jie, Yang <yang.jie@intel.com>; Jon Flatley <jflat@chromium.org>; Pierre-
>> Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Cc: benzh@chromium.org; alsa-devel@alsa-project.org; Jie Yang
>> <yang.jie@linux.intel.com>; Ranjani Sridharan
>> <ranjani.sridharan@linux.intel.com>; cujomalainey@chromium.org
>> Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
>>
>> On 2019-08-19 04:33, Jie, Yang wrote:
>>>
>>>> -----Original Message-----
>>>> From: Jon Flatley [mailto:jflat@chromium.org]
>>>> Sent: Thursday, August 15, 2019 5:25 AM
>>>> To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>> Cc: Jon Flatley <jflat@chromium.org>; Jie, Yang <yang.jie@intel.com>;
>>>> benzh@chromium.org; alsa-devel@alsa-project.org; Ranjani Sridharan
>>>> <ranjani.sridharan@linux.intel.com>; cujomalainey@chromium.org; Jie
>>>> Yang <yang.jie@linux.intel.com>
>>>> Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
>>>>
>>>> On Wed, Aug 14, 2019 at 1:51 PM Pierre-Louis Bossart <pierre-
>>>> louis.bossart@linux.intel.com> wrote:
>>>>>
>>>>>
>>>>>> There seems to be an issue when suspending the ALC5650. I think the
>>>>>> nondeterministic behavior I was seeing just had to do with whether
>>>>>> or not the DSP had yet suspended.
>>>>>>
>>>>>> I reverted commit 0d2135ecadb0 ("ASoC: Intel: Work around to fix HW
>>>>>> D3 potential crash issue") and things started working, including
>>>>>> suspend/resume of the DSP. Any ideas for why this may be? I would
>>>>>> like to resolve this so I can finish upstreaming the bdw-rt5650
>>>>>> machine driver.
>>>>>
>>>>> Copying Keyon in case he remembers the context.
>>>>>
>>>>> Reverting a 5yr-old commit with all sorts of clock/power-related
>>>>> fixes looks brave, and it's not clear why this would work with the
>>>>> rt5677 and not with 5650.
>>>>
>>>> No idea, I was just diffing the register writes looking for sources of
>> discrepancy.
>>>> The Chromium OS 3.14 kernel tree that Buddy uses doesn't have this
>>>> patch, so I figured what's the worst that could happen?
>>>
>>> Hi Jon, sorry about just noticing this thread.
>>>   From the dmesg log, the issue happens at runtime suspend/resume but not
>> in boot, am I right(you can disable runtime PM for the device to confirm that)?
>>>
>>> My points here are:
>>> 1. the commit 0d2135ecadb0 was suggested by FW team to W/A D3
>> potential crash issue.
>>> 2. it was verified with rt286(Broadwell.c, e.g. Dell XPS) from our side
>> only(and may have been checked with rt5677 by Chrome team).
>>> 3. please follow sequence in broadwell.c if issue happen at boot time.
>>> If happened at runtime PM from DSP side, we should see it with all kinds of
>> machine driver.
>>> Could you performing more test and debugging to see what it real happen
>> there?
>>> 4. we have no reason to remove the commit directly, except correcting if
>> some lines are proved wrong. And, as Pierre mentioned, SOF driver is
>> preferred, as there is no new development effort to support SST
>> haswell/Broadwell driver here(no platform, no developer, :-( ).
>>>
>>> Thanks,
>>> ~Keyon>
>>
>> Got to disagree with the last one - no platform, no developer.
>> We are setting up some BDW/ HSW here to join our happy SKL+ family in CI.
>> This is because of /common cleanups which will engulf aDSP project
>> (hsw/byt) obviously.
> 
> Yes, that's true, good to hear that you will add it to CI.
> 
>>
>> These will be tested against the exact same BAT scope as other ADSP devices.
>> Code here looks much better, at least compared to /skylake - ain't a high
>> threshold though.. Given how outdated all SKL+ fw binaries are (on upstream
>> repo) it might even come down simply to fw upgrade.
>> Most of FW peps who took part in that project are already out. Although,
>> found one or two who are willing to help : )
> 
> I remember Pawel Piskorski and Marcin Barlik helped me from the FW side(including explaining about the S0<->S3 sequence), please contact me offline if needed, I will try to drag for some mails which I got 5 years back.
> 
> Thanks,
> ~Keyon
> 

Please do not name people on official list unless you are 100% sure 
about their engagement in linux solutions, which for both individuals 
you have listed, is no longer the case. Any recommendations? - you can 
provide internally.

Anyway, I've contacted Marcin and once he is available, we will review 
the patch together. Note, that I'm a IGK dweller too, so it's highly 
probable whomever you had in mind I've either already met or drank a 
beer with.

Czarek

>>
>> And yes, I'm setting them up with rt286 too. There are some rt56XX but I'm
>> unsure if rt5650 is amount them.
>> Still got some problems with ACPI, but soon two new faces should be greeting
>> audio CI bonfire..
>>
>> Czarek
>>
>>>>>
>>>>> Are you using the latest upstream firmware btw? Or the one which
>>>>> shipped with the initial device (which could be an issue if the
>>>>> protocol
>>>> changed).
>>>>
>>>> The firmware I'm loading is: `FW info: type 01, - version: 00.00,
>>>> build 77, source commit id: 876ac6906f31a43b6772b23c7c983ce9dcb18a1`.
>>>> Hashes the same as the upstream binary.
>>> _______________________________________________
>>> Alsa-devel mailing list
>>> Alsa-devel@alsa-project.org
>>> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
