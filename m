Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA3615FAB1
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Feb 2020 00:36:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6D0A1673;
	Sat, 15 Feb 2020 00:35:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6D0A1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581723395;
	bh=etGO/qCSLmY5RpUEDrG8PprU89xprGGs8ss+vDVvPh0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rhpoKI/w1QUOwYRpKDyBFzI0ufZ5NzrJ0rb5K4NvQfXW6mEJbruylmYfKejlPb32R
	 czAZFm0hB2j21KbPEmGYlaKdWlUKbqLa+46eEJ3mNfH093ZYgKTeO+hcdpWGTVRRvO
	 MVKzIN9/RoiehdOYziq/YnWJX/WwVXApqQLqgpkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C693AF80157;
	Sat, 15 Feb 2020 00:34:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A39AAF8014F; Sat, 15 Feb 2020 00:34:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF885F80086
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 00:34:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF885F80086
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 15:34:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,442,1574150400"; d="scan'208";a="227772276"
Received: from edgarher-mobl.amr.corp.intel.com (HELO [10.255.228.112])
 ([10.255.228.112])
 by orsmga008.jf.intel.com with ESMTP; 14 Feb 2020 15:34:41 -0800
To: Greg KH <gregkh@linuxfoundation.org>
References: <20200201042011.5781-1-pierre-louis.bossart@linux.intel.com>
 <20200214164919.GB4016987@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0ec41a5b-6132-6940-f1b3-bac1724b70a4@linux.intel.com>
Date: Fri, 14 Feb 2020 17:34:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214164919.GB4016987@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 0/2] soundwire: add
 master_device/driver support
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



On 2/14/20 10:49 AM, Greg KH wrote:
> On Fri, Jan 31, 2020 at 10:20:09PM -0600, Pierre-Louis Bossart wrote:
>> The SoundWire master representation needs to evolve to take into account:
>>
>> a) a May 2019 recommendation from Greg KH to remove platform devices
>>
>> b) the need on Intel platforms to support hardware startup only once
>> the power rail dependencies are settled. The SoundWire master is not
>> an independent IP at all.
>>
>> c) the need to deal with external wakes handled by the PCI subsystem
>> in specific low-power modes
>>
>> In case it wasn't clear, the SoundWire subsystem is currently unusable
>> with v5.5 on devices hitting the shelves very soon (race conditions,
>> power management, suspend/resume, etc). v5.6 will only provide
>> interface changes and no functional improvement. We've circled on the
>> same concepts since September 2019, and I hope this direction is now
>> aligned with the suggestions from Vinod Koul and that we can target
>> v5.7 as the 'SoundWire just works(tm)' version.
>>
>> This series is provided as an RFC since it depends on patches already
>> for review.
> 
> Both of these look sane to me, nice work!
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


Thanks Greg, I really appreciate the review and educational guidance on 
the use of platform devices!

If that's alright with Vinod and you, I'd like to defer the integration 
of these patches a bit so that we can improve them a bit e.g.

- I realized earlier this week there's a potential issue with the 
'shutdown' callback, what I did looks duplicated with 'shutdown' called 
from the device core and by the parent.

- it would make sense to add support for this 'master device' in the 
Qualcomm drivers as well, so that we are aligned with a similar device 
hierarchy (PCI -> sdw_master_device and DT/plaforms ->sdw_master_device).

- we probably want to add the sysfs patches that started this discussion 
on the platform devices. This would be very useful to debug new 
platforms, we depend on BIOS/firmware and we can't always know the 
actual settings just by looking at the DSDT static contents (multiple 
tests and overridden values).

My preference in terms of integration in drivers/soundwire would be

1. Intel DAI cleanup (only one kfree missing, will resubmit v3 today)

2. [PATCH 00/10] soundwire: bus: fix race conditions, add suspend-resume
this series solves a lot of issues and should go first.

3. ASoC/SOF integration (still with platform devices)
I narrowed this down to 6 patches, that would help me submit the rest of 
the ASoC/SOF patches in Mark Brown's tree. That would be Intel specific. 
This step would be the first where everything SoundWire-related can be 
enabled in a build, and while we've caught a lot of cross-compilation 
issues it's likely some bots will find corner cases to keep us busy.

4. master_device/driver transition: these updated patches removing 
platform devices + sysfs support + Qualcomm support (the last point 
would depend on the workload/support of Qualcomm/Linaro folks, I don't 
want to commit on their behalf).

5. New SoundWire functionality for Intel platforms (clock-stop/restart 
and synchronized links). The code would be only located in 
drivers/soundwire and be easier to handle. For the synchronized links we 
still have a bit of validation work to do so it should really come last.

Would this work for everyone?

Thanks,
-Pierre



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
