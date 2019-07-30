Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5BC79EA4
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 04:25:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EDF717F4;
	Tue, 30 Jul 2019 04:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EDF717F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564453530;
	bh=tq2O/sLm01gckwl2BLUyQhcvSLnEGlDcYGyUKeq9wzM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t2RMH5DHXiq+9mG30TGCYV13QNkowLFuwTOjEIv9Q6g9tNkER1JIs+n/0KSCoh7VP
	 Qcs/TM21NSL8xQF+VK4SXXqT9nUauiqasb/wXjISqHO3F23tCUGEB0qpnjxWlw98xw
	 dSZmUq5vTOyLGwjEQtZNDI78unCcN1025h/Z0pIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 927B2F80482;
	Tue, 30 Jul 2019 04:23:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BA2FF804CA; Tue, 30 Jul 2019 04:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C152F800AB
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 04:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C152F800AB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 19:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,325,1559545200"; d="scan'208";a="371365852"
Received: from jebreyfo-mobl.amr.corp.intel.com (HELO [10.251.25.157])
 ([10.251.25.157])
 by fmsmga006.fm.intel.com with ESMTP; 29 Jul 2019 19:23:37 -0700
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jon Flatley <jflat@chromium.org>, alsa-devel@alsa-project.org
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
 <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <37ede7ea-e760-eac9-a1d5-0eb8e3bff3cb@linux.intel.com>
Date: Mon, 29 Jul 2019 21:23:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
Content-Language: en-US
Cc: benzh@chromium.org
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



On 7/29/19 7:53 PM, Ranjani Sridharan wrote:
> On Mon, 2019-07-29 at 18:02 -0500, Pierre-Louis Bossart wrote:
>>
>> On 7/29/19 4:53 PM, Jon Flatley wrote:
>>> I've been working on upstreaming the bdw-rt5650 machine driver for
>>> the
>>> Acer Chromebase 24 (buddy). There seems to be an issue when first
>>> setting the hardware controls that appears to be crashing the DSP:
>>>
>>> [   51.424554] haswell-pcm-audio haswell-pcm-audio: FW loaded,
>>> mailbox
>>> readback FW info: type 01, - version: 00.00, build 77, source
>>> commit
>>> id: 876ac6906f31a43b6772b23c7c983ce9dcb18a19
>>> ...
>>> [   84.924666] haswell-pcm-audio haswell-pcm-audio: error: audio
>>> DSP
>>> boot timeout IPCD 0x0 IPCX 0x0
>>> [   85.260655] haswell-pcm-audio haswell-pcm-audio: ipc: --message
>>> timeout-- ipcx 0x83000000 isr 0x00000000 ipcd 0x00000000 imrx
>>> 0x7fff0000
>>> [   85.273609] haswell-pcm-audio haswell-pcm-audio: error: stream
>>> commit failed
>>> [   85.279746]  System PCM: error: failed to commit stream -110
>>> [   85.285388] haswell-pcm-audio haswell-pcm-audio: ASoC:
>>> haswell-pcm-audio hw params failed: -110
>>> [   85.293963]  System PCM: ASoC: hw_params FE failed -110
>>>
>>> This happens roughly 50% of the time when first setting hardware
>>> controls after a reboot. The other 50% of the time the DSP comes up
>>> just fine and audio works fine thereafter. Adding "#define DEBUG 1"
>>> to
>>> sound/soc/intel/haswell/sst-haswell-ipc.c makes the issue occur
>>> much
>>> less frequently in my testing. Seems like a subtle timing issue.
>>>
>>> There were timing issues encountered during the bringup of the 2015
>>> chromebook pixel (samus) which uses the bdw-rt5677 machine driver.
>>> Those were slightly different, and manifested during repeated
>>> arecords. Both devices use the same revision of the sst2 firmware.
>>>
>>> Any ideas for how to debug this?
>>
>> this could be trying to send an IPC while you are already waiting
>> for
>> one to complete. we've seen this before with SOF, if the IPCs are
>> not
>> strictly serialized then things go in the weeds and timeout.
> Pierre/Jon
> 
> In this case it looks like the DSP boot failed leading to the IPC
> timeout? WOndering if increasing the boot timeout would help?

Yes, that too. The boot timeout is typically experimentally defined, and 
never decreasing due to platform variations...
I am still leaning more on the side of an side effect between two IPCs, 
the added DEBUG points to the printk which solves timing issues. The 
boot timeout would typically not be impacted by such changes.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
