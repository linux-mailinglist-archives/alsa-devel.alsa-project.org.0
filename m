Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6863AC971
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 13:06:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31E2D171A;
	Fri, 18 Jun 2021 13:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31E2D171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624014417;
	bh=8Fy5AchcNF0kTNIXoaD2h+20xt0oPSG1DFu2cQw4RKs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m/cNfdK3FLbnUiloZ4s2Zba7WsohZWWg5dBIUqmZPZ0gSgbkIAueQalhoLmqAIWPG
	 aKcPM2Fr+JiBFK0o7//8POXwyxiTWfB/VFxnbWSOkqPChxY5qT54wigwO0l5a7usEW
	 ajsP4ncS1bG/w66Jg68ev2SWG1d5GLdASemEDdq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9201BF800E1;
	Fri, 18 Jun 2021 13:05:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BCDCF8032D; Fri, 18 Jun 2021 13:05:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67CD0F80148
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 13:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67CD0F80148
IronPort-SDR: 9bP1F5sOyy1vUqvR61idmnfJVdcIwRYshKxcOGEGmMHjVOD0x1fCiyh3SjMJkyxcDGcfUxJl30
 jyiHwOrD4bWw==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="228062806"
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="228062806"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 04:05:16 -0700
IronPort-SDR: BD6ASffoGorhy4qJAFHh+vKx8Nm1dVxy/70EFJ3sQZVgLtVksI3IGB/7oIYTxisTtfrHh8gd3K
 dhsa/pz12LOg==
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="472727065"
Received: from pkumar-mobl.amr.corp.intel.com (HELO [10.213.177.44])
 ([10.213.177.44])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 04:05:15 -0700
Subject: Re: [PATCH] soundwire: stream: Use polling for DP Prepare completion
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20210617153410.27922-1-rf@opensource.cirrus.com>
 <1d340be7-2f21-73a5-bcc3-91372976dfb9@linux.intel.com>
 <a8115cc6-8e4e-575f-9e63-f640854b7018@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f1f90f42-de78-28f3-c4f0-2dcd88465899@linux.intel.com>
Date: Fri, 18 Jun 2021 06:05:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a8115cc6-8e4e-575f-9e63-f640854b7018@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>




>>> sdw_prep_deprep_slave_ports() cannot use the port interrupt to signal
>>> CP_SM completion because it is called while holding the bus lock, which
>>> blocks the alert handler from running.
>>>
>>> Change to polling the PREPARESTATUS register and remove the
>>> infrastructure that was implemented for the previous interrupt waiting.
>>
>> I am afraid the entire PORT_READY support is completely untested at the moment: all the existing codecs use the simpler state machine, e.g.        
>>
>> dpn[i].simple_ch_prep_sm = true;
>>
>> So my main question is: how did you test this change? Is this on a platform already supported upstream? yes/no answer is fine, no details necessary.
>>
> 
> No, it isn't upstream yet, but it doesn't support Simplified_CP_SM.

ok, good to know.

>> I am also not fully clear on the locking issue.
>>
>> Is the problem that sdw_handle_slave_status() uses a mutex_lock(&bus->bus_lock), which is already held in sdw_prepare_stream
>>
> 
> Yes
> 
>> so dealing with an ALERT status while doing pre-deprep would cause a self-inflicted deadlock?
>>
> 
> Not strictly a deadlock, but the ALERT handling will be delayed until
> the sdw_prepare_stream() has released the bus lock. Of course, by then
> the wait_for_completion() has timed out.

ok.
 
> There is another bug in the original code. After wait_for_completion()
> times out, there is a read of the PREPARESTATUS register. But the test
> 
>     if (!time_left || val)
> 
> will always treat a timeout as a failure even if the port is now
> reporting successful prepare.
> 
> I can do a fix for that bug so that full CP_SM devices will prepare
> successfully after the wait_for_completion() times out.

What you are describing seems to be a case of the device completing the preparation just after the timeout expires but just before double-checking the register value?

Doesn't this indicate that the timeout value is just wrong? 

Or did you mean that a possible work-around would be to essentially ignore the timeout due to the locking? That might help you make progress and in a second step we could attempt to remove the locking issue.
 
>> If yes, that's a more general problem that would need to be fixed. this lock is taken in ALL stream operations, not just prepare/deprepare.
>>
>> If e.g. a jack detection was signaled during any stream reconfiguration, we would also not be able to deal with the information, would we?
>>
> 
> The ALERT would be delayed until after the stream reconfig has ended.
> 
>> the purpose of the lock in sdw_handle_slave_status() was to check if devices attach or fall-off the bus before handling their status. The command/control protocol is always operational so nothing prevents the interrupt from being handled.
>>
>> There's also something odd about directly polling on the status bits. The status bits will be used to signal the ALERT condition which is transmitted to the host during PING frames. This solution would result in the host noticing an interrupt: host controllers typically have a sticky status where all changes in PING frames are detected and used as a trigger for interrupt processing. In this case the interrupt would still be handled, but the sdw_handle_slave_status() would be deferred until the stream prepare is complete, and at that point the interrupt processing would not see any sources. It's not illegal but it's a bit odd to cause empty interrupts to be handled.
>>
>> It might be a better solution to fix conflicts between stream reconfiguration and interrupts. I don't have a turn-key proposal but the suggested patch feels like a work-around.
>> maybe using mutex_is_locked()?
>>
> 
> Possibly but I am very reluctant to rewrite bus locking, as I don't have
> the ability to test a wide range of hardware configurations.

I wasn't referring to a complete rewrite of the bus locking, only for a check of the interaction between alerts and stream handling.

>> If we can't figure something out, then at least the PORT_READY mask should not be set, i.e. this code would need to be removed:
>>
>> ...
>>> A new configuration field 'ch_prep_poll_us' is added to struct
>>> sdw_dpn_prop so that the peripheral driver may select a polling interval.
>>> If this is left at zero a default interval of 500 usec is used.
>>
>> we already have a 'ch_prep_timeout' that's defined, do you need to redefine a new field?
> 
> The new field is how often to poll, so the driver can select a slower
> poll rate if it knows its CP_SM takes longer.

You missed my point: if you think this property is needed, we'd want to add it to the MIPI DisCo list of properties so that it can be optionally provided by platform firmware.

>> why not just read once at the end of that timeout? It's a prepare operation, there's no requirement to be fast, is there?
> 
> That is broken in the current code, as noted above. But I could make a
> patch only to fix that bug.

that might indeed be less invasive for an initial fix, and we can deal with the locking problem later.
