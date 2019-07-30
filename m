Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A60657B2D9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 21:05:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 075E81775;
	Tue, 30 Jul 2019 21:05:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 075E81775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564513551;
	bh=j28T6d2kG58uCtD1/e994pkHBpwvf6FzWArE/93jln8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hK2OLEdcXxEX15M8FaQEtSYiVeJ4/rmWeh1ol9SQQ+d2e2HiWVZsmhU6nuvlNTp/b
	 +bFdGgSQUa6AmQgGatG1DyNejFQL1VAFNuGL00zQjZe98U+7vHtjcF1mV2Bfl4Rf7l
	 vG05D0fCCS2qgKly8zhcnURIghYZ6C19r1jUVFQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44255F804CA;
	Tue, 30 Jul 2019 21:04:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6E61F804CA; Tue, 30 Jul 2019 21:04:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A8F0F800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 21:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A8F0F800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 12:03:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; d="scan'208";a="176934628"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 30 Jul 2019 12:03:58 -0700
Received: from htsang-mobl1.amr.corp.intel.com (unknown [10.252.134.143])
 by linux.intel.com (Postfix) with ESMTP id 16E3A5805B9;
 Tue, 30 Jul 2019 12:03:58 -0700 (PDT)
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jon Flatley <jflat@chromium.org>
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
 <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
 <37ede7ea-e760-eac9-a1d5-0eb8e3bff3cb@linux.intel.com>
 <CACJJ=pyb==xWqKMB-gAzW7-FCFgEU7Rm+b-CL-ANO-eorDKy=A@mail.gmail.com>
 <356b3f4eacb43f23c40c4cd8e3c54ae9514a34c6.camel@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7e08e45d-7cec-9fdd-36c5-5e82632968f8@linux.intel.com>
Date: Tue, 30 Jul 2019 14:04:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <356b3f4eacb43f23c40c4cd8e3c54ae9514a34c6.camel@linux.intel.com>
Content-Language: en-US
Cc: benzh@chromium.org, alsa-devel@alsa-project.org
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

On 7/30/19 1:47 PM, Ranjani Sridharan wrote:
> On Tue, 2019-07-30 at 10:45 -0700, Jon Flatley wrote:
>> On Mon, Jul 29, 2019 at 7:23 PM Pierre-Louis Bossart
>> <pierre-louis.bossart@linux.intel.com> wrote:
>>>
>>>
>>>
>>> On 7/29/19 7:53 PM, Ranjani Sridharan wrote:
>>>> On Mon, 2019-07-29 at 18:02 -0500, Pierre-Louis Bossart wrote:
>>>>>
>>>>> On 7/29/19 4:53 PM, Jon Flatley wrote:
>>>>>> I've been working on upstreaming the bdw-rt5650 machine
>>>>>> driver for
>>>>>> the
>>>>>> Acer Chromebase 24 (buddy). There seems to be an issue when
>>>>>> first
>>>>>> setting the hardware controls that appears to be crashing the
>>>>>> DSP:
>>>>>>
>>>>>> [   51.424554] haswell-pcm-audio haswell-pcm-audio: FW
>>>>>> loaded,
>>>>>> mailbox
>>>>>> readback FW info: type 01, - version: 00.00, build 77, source
>>>>>> commit
>>>>>> id: 876ac6906f31a43b6772b23c7c983ce9dcb18a19
>>>>>> ...
>>>>>> [   84.924666] haswell-pcm-audio haswell-pcm-audio: error:
>>>>>> audio
>>>>>> DSP
>>>>>> boot timeout IPCD 0x0 IPCX 0x0
>>>>>> [   85.260655] haswell-pcm-audio haswell-pcm-audio: ipc: --
>>>>>> message
>>>>>> timeout-- ipcx 0x83000000 isr 0x00000000 ipcd 0x00000000 imrx
>>>>>> 0x7fff0000
>>>>>> [   85.273609] haswell-pcm-audio haswell-pcm-audio: error:
>>>>>> stream
>>>>>> commit failed
>>>>>> [   85.279746]  System PCM: error: failed to commit stream
>>>>>> -110
>>>>>> [   85.285388] haswell-pcm-audio haswell-pcm-audio: ASoC:
>>>>>> haswell-pcm-audio hw params failed: -110
>>>>>> [   85.293963]  System PCM: ASoC: hw_params FE failed -110
>>>>>>
>>>>>> This happens roughly 50% of the time when first setting
>>>>>> hardware
>>>>>> controls after a reboot. The other 50% of the time the DSP
>>>>>> comes up
>>>>>> just fine and audio works fine thereafter. Adding "#define
>>>>>> DEBUG 1"
>>>>>> to
>>>>>> sound/soc/intel/haswell/sst-haswell-ipc.c makes the issue
>>>>>> occur
>>>>>> much
>>>>>> less frequently in my testing. Seems like a subtle timing
>>>>>> issue.
>>>>>>
>>>>>> There were timing issues encountered during the bringup of
>>>>>> the 2015
>>>>>> chromebook pixel (samus) which uses the bdw-rt5677 machine
>>>>>> driver.
>>>>>> Those were slightly different, and manifested during repeated
>>>>>> arecords. Both devices use the same revision of the sst2
>>>>>> firmware.
>>>>>>
>>>>>> Any ideas for how to debug this?
>>>>>
>>>>> this could be trying to send an IPC while you are already
>>>>> waiting
>>>>> for
>>>>> one to complete. we've seen this before with SOF, if the IPCs
>>>>> are
>>>>> not
>>>>> strictly serialized then things go in the weeds and timeout.
>>>>
>>>> Pierre/Jon
>>>>
>>>> In this case it looks like the DSP boot failed leading to the IPC
>>>> timeout? WOndering if increasing the boot timeout would help?
>>
>> I did actually try this without success.
>>
>>>
>>> Yes, that too. The boot timeout is typically experimentally
>>> defined, and
>>> never decreasing due to platform variations...
>>> I am still leaning more on the side of an side effect between two
>>> IPCs,
>>> the added DEBUG points to the printk which solves timing issues.
>>> The
>>> boot timeout would typically not be impacted by such changes.
>>
>> I think the real struggle I'm having is finding a good debugging
>> method that doesn't impact the timing of the IPCs significantly (as
>> adding DEBUG seems to). This could maybe be overcome with using a
>> stress test to reproduce. The crash only seems to occur when first
>> booting the DSP, and so far I've been testing this by completely
>> power
>> cycling the machine on every test, which is very slow and tedious. So
>> maybe the issue with DEBUG defined occurs 1 in 20 reboots rather than
>> 1 in 2, I wouldn't know. If there's a way to reboot the DSP and
>> reproduce this crash without rebooting the entire device that would
>> be
>> very helpful to me.
> Maybe you've already tried this. But, how about blacklisting the audio
> driver and then trying a modprobe/rmmod to insert and remove themodule. This should attempt to boot the DSP upon every modprobe.
> But what I am not sure about is whether the rmmod would succeed if the
> IPC times out because the DSP has crashed.

I don't think we can really reduce the 'Heisenbug' nature of code 
instrumentations.
But as Ranjani suggested it increasing the test frequency would make 
things more observable. I would go for suspend-resume tests, that would 
also force a DSP reboot without requiring a full reboot.

rtcwake -s 3 -m mem

I suspect modprobe/rmmod isn't likely to work, those legacy drivers were 
not exactly written with stress-test in mind. Suspend-resume is likely 
more reliable - been used in real products but tested with older kernels 
so your mileage may vary.

We should really have completed SOF support for Broadwell instead of 
supporting zombie drivers. Gah.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
