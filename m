Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A45F9544E
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 04:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC7F3165F;
	Tue, 20 Aug 2019 04:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC7F3165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566267836;
	bh=8IxDD7ScgIN+Gcq4+CzSnYa6FhcrJhj/R26wASPQrNI=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=caB//rfeFPEcrgj1XMqrcXVcOKA4c0hjwPIl8tOuvDCNh8REL561nPAnPM6QwSRk1
	 Qvdd1Rx7U9t9h3lLNI6o00thIEZqpxNDngxV1GPEBh5XoaViXvsnTOENcwQvKZkkJh
	 Fp+YSbIjnJ4FRtXKD+F6e1AR3B39Fk7Pbu2zllTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05F49F805E0;
	Tue, 20 Aug 2019 04:21:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A990F80539; Tue, 20 Aug 2019 04:21:51 +0200 (CEST)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E30EBF8036D
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 04:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E30EBF8036D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 19:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,407,1559545200"; d="scan'208";a="183045141"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 19 Aug 2019 19:11:46 -0700
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 19 Aug 2019 19:11:46 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX126.amr.corp.intel.com (10.18.125.43) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 19 Aug 2019 19:11:46 -0700
Received: from shsmsx106.ccr.corp.intel.com ([169.254.10.204]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.249]) with mapi id 14.03.0439.000;
 Tue, 20 Aug 2019 10:11:44 +0800
From: "Jie, Yang" <yang.jie@intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>, Jon Flatley
 <jflat@chromium.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Thread-Topic: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
Thread-Index: AQHVRlhay0hHC8a4PkG/cLhEnYjIt6bhsKqAgAAe1oCAABlIAIABAYiAgAARVgCAAASkAIAXn1yAgAARk4CAAAmAgIAHHYQQgACHTQCAAQibkA==
Date: Tue, 20 Aug 2019 02:11:44 +0000
Message-ID: <E7B1D079BA13FB44A978CC8F69C7D6A9606FC9AE@SHSMSX106.ccr.corp.intel.com>
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
In-Reply-To: <d0131c02-3477-8390-e0c6-b37b142169e8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjBmZDdjZGYtMjc1Zi00YWJmLWE2NmQtM2ZkYzkyYTNlNmQyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibjNGXC9wTWZJWHZZTHpCT3FGSWliRzR6M0xJUUZ0U2RyaDhXU2VRa3c5YXlBWk1QT3QzR1RrVEFCcWU2UXhRc3YifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "benzh@chromium.org" <benzh@chromium.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>-----Original Message-----
>From: Rojewski, Cezary
>Sent: Tuesday, August 20, 2019 2:09 AM
>To: Jie, Yang <yang.jie@intel.com>; Jon Flatley <jflat@chromium.org>; Pierre-
>Louis Bossart <pierre-louis.bossart@linux.intel.com>
>Cc: benzh@chromium.org; alsa-devel@alsa-project.org; Jie Yang
><yang.jie@linux.intel.com>; Ranjani Sridharan
><ranjani.sridharan@linux.intel.com>; cujomalainey@chromium.org
>Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
>
>On 2019-08-19 04:33, Jie, Yang wrote:
>>
>>> -----Original Message-----
>>> From: Jon Flatley [mailto:jflat@chromium.org]
>>> Sent: Thursday, August 15, 2019 5:25 AM
>>> To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>> Cc: Jon Flatley <jflat@chromium.org>; Jie, Yang <yang.jie@intel.com>;
>>> benzh@chromium.org; alsa-devel@alsa-project.org; Ranjani Sridharan
>>> <ranjani.sridharan@linux.intel.com>; cujomalainey@chromium.org; Jie
>>> Yang <yang.jie@linux.intel.com>
>>> Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
>>>
>>> On Wed, Aug 14, 2019 at 1:51 PM Pierre-Louis Bossart <pierre-
>>> louis.bossart@linux.intel.com> wrote:
>>>>
>>>>
>>>>> There seems to be an issue when suspending the ALC5650. I think the
>>>>> nondeterministic behavior I was seeing just had to do with whether
>>>>> or not the DSP had yet suspended.
>>>>>
>>>>> I reverted commit 0d2135ecadb0 ("ASoC: Intel: Work around to fix HW
>>>>> D3 potential crash issue") and things started working, including
>>>>> suspend/resume of the DSP. Any ideas for why this may be? I would
>>>>> like to resolve this so I can finish upstreaming the bdw-rt5650
>>>>> machine driver.
>>>>
>>>> Copying Keyon in case he remembers the context.
>>>>
>>>> Reverting a 5yr-old commit with all sorts of clock/power-related
>>>> fixes looks brave, and it's not clear why this would work with the
>>>> rt5677 and not with 5650.
>>>
>>> No idea, I was just diffing the register writes looking for sources of
>discrepancy.
>>> The Chromium OS 3.14 kernel tree that Buddy uses doesn't have this
>>> patch, so I figured what's the worst that could happen?
>>
>> Hi Jon, sorry about just noticing this thread.
>>  From the dmesg log, the issue happens at runtime suspend/resume but not
>in boot, am I right(you can disable runtime PM for the device to confirm that)?
>>
>> My points here are:
>> 1. the commit 0d2135ecadb0 was suggested by FW team to W/A D3
>potential crash issue.
>> 2. it was verified with rt286(Broadwell.c, e.g. Dell XPS) from our side
>only(and may have been checked with rt5677 by Chrome team).
>> 3. please follow sequence in broadwell.c if issue happen at boot time.
>> If happened at runtime PM from DSP side, we should see it with all kinds of
>machine driver.
>> Could you performing more test and debugging to see what it real happen
>there?
>> 4. we have no reason to remove the commit directly, except correcting if
>some lines are proved wrong. And, as Pierre mentioned, SOF driver is
>preferred, as there is no new development effort to support SST
>haswell/Broadwell driver here(no platform, no developer, :-( ).
>>
>> Thanks,
>> ~Keyon>
>
>Got to disagree with the last one - no platform, no developer.
>We are setting up some BDW/ HSW here to join our happy SKL+ family in CI.
>This is because of /common cleanups which will engulf aDSP project
>(hsw/byt) obviously.

Yes, that's true, good to hear that you will add it to CI.

>
>These will be tested against the exact same BAT scope as other ADSP devices.
>Code here looks much better, at least compared to /skylake - ain't a high
>threshold though.. Given how outdated all SKL+ fw binaries are (on upstream
>repo) it might even come down simply to fw upgrade.
>Most of FW peps who took part in that project are already out. Although,
>found one or two who are willing to help : )

I remember Pawel Piskorski and Marcin Barlik helped me from the FW side(including explaining about the S0<->S3 sequence), please contact me offline if needed, I will try to drag for some mails which I got 5 years back.

Thanks,
~Keyon

>
>And yes, I'm setting them up with rt286 too. There are some rt56XX but I'm
>unsure if rt5650 is amount them.
>Still got some problems with ACPI, but soon two new faces should be greeting
>audio CI bonfire..
>
>Czarek
>
>>>>
>>>> Are you using the latest upstream firmware btw? Or the one which
>>>> shipped with the initial device (which could be an issue if the
>>>> protocol
>>> changed).
>>>
>>> The firmware I'm loading is: `FW info: type 01, - version: 00.00,
>>> build 77, source commit id: 876ac6906f31a43b6772b23c7c983ce9dcb18a1`.
>>> Hashes the same as the upstream binary.
>> _______________________________________________
>> Alsa-devel mailing list
>> Alsa-devel@alsa-project.org
>> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
