Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B2F7FED5
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 18:43:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A93A16C8;
	Fri,  2 Aug 2019 18:42:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A93A16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564764181;
	bh=352W4DOaaQ8Ha1peelDak+TtizVJ+bBJ1s2NTuTqhFs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YvkCvRsDs1UvwHIWmAwM2q5fmZmjvR2DW7ToovAnCR0PvmWIBomCCSlXMf5CdALVK
	 F/+dQDF4iIzArcz762DFFaOQDtNReS9ii9gwpQRWigV9cvQY/20vsGl25I9Jq6wK/B
	 uBbSUErAzv3Qq43cchME42qjuBxHu1ekS4I9HJto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CBA3F8048F;
	Fri,  2 Aug 2019 18:41:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79D69F8048F; Fri,  2 Aug 2019 18:41:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A73D4F80114
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 18:41:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A73D4F80114
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 09:41:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="175637656"
Received: from vivekcha-mobl1.amr.corp.intel.com (HELO [10.251.131.115])
 ([10.251.131.115])
 by orsmga003.jf.intel.com with ESMTP; 02 Aug 2019 09:41:06 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-16-pierre-louis.bossart@linux.intel.com>
 <20190802122003.GQ12733@vkoul-mobl.Dlink>
 <c4d31804-48af-30e3-4b4f-4b03dac6addd@linux.intel.com>
 <20190802160115.GS12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1326bf1d-8289-2838-e2bd-48dba78b4a6c@linux.intel.com>
Date: Fri, 2 Aug 2019 11:41:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802160115.GS12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 15/40] soundwire: cadence_master:
 handle multiple status reports per Slave
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



On 8/2/19 11:01 AM, Vinod Koul wrote:
> On 02-08-19, 10:29, Pierre-Louis Bossart wrote:
>> On 8/2/19 7:20 AM, Vinod Koul wrote:
>>> On 25-07-19, 18:40, Pierre-Louis Bossart wrote:
> 
>>>> +				status[i] = SDW_SLAVE_UNATTACHED;
>>>> +				break;
>>>> +			case 1:
>>>> +				status[i] = SDW_SLAVE_ATTACHED;
>>>> +				break;
>>>> +			case 2:
>>>> +				status[i] = SDW_SLAVE_ALERT;
>>>> +				break;
>>>> +			default:
>>>> +				status[i] = SDW_SLAVE_RESERVED;
>>>> +				break;
>>>> +			}
>>>
>>> we have same logic in the code block preceding this, maybe good idea to
>>> write a helper and use for both
>>
>> Yes, I am thinking about this. There are multiple cases where we want to
>> re-check the status and clear some bits, so helpers would be good.
>>
>>>
>>> Also IIRC we can have multiple status set right?
>>
>> Yes, the status bits are sticky and mirror all values reported in PING
>> frames. I am still working on how to clear those bits, there are cases where
>> we clear bits and end-up never hearing from that device ever again. classic
>> edge/level issue I suppose.
> 
> Then the case logic above doesn't work, it should be like the code block
> preceding this..

what I was referring to already is a problem even in single status mode.

Let's say for example that a device shows up as Device0, then we try to 
enumerate it and program a non-zero device number. If that fails, we 
currently clear the Attached status for Device0, so will never have an 
interrupt ever again. The device is there, attached as Device0, but 
we've lost the single opportunity to make it usable. The link is in most 
cases going to be extremely reliable, but if we know of state machines 
that lead to a terminal state then we should proactively have a recovery 
mechanism to avoid complicated debug down the road for cases where the 
hardware has transient issues.

For the multiple status case, we will have to look at the details and 
figure out which of the flags get cleared and which ones don't.

One certainty is that we absolutely have to track IO errors in interrupt 
context. They are recoverable in regular context but not quite in 
interrupt context if we clear the status bits unconditionally.

Maybe a tangent here but to be transparent there are really multiple 
topics we are tracking at the moment:

1. error handling in interrupts. I found a leak where if a device goes 
in the weeds while we program its device number and resynchronizes then 
we allocate a new device number instead of reusing the initial one. The 
bit clearing is also to be checked as explained above.

2. module dependencies: there is a race condition leading to a kernel 
oops if the Slave probe is not complete before the .update_status is 
invoked.

3. jack detection. The jack detection routine is called as a result of 
an imp-def Slave interrupt. We never documented the assumption that if 
this jack detection takes time then it needs to be done offline, e.g. in 
a work queue. Or if we still want it to be done in a the interrupt 
thread then we need to re-enable interrupts earlier, otherwise one 
device can stop interrupt handling for a fairly long duration.

4. streaming stop on link errors. We've seen in tests that if you reset 
the link or a Slave device with debugfs while audio is playing then 
streaming continues. This condition could happen if a device loses sync, 
and the spec says the Slave needs to reset its channel enable bits. At 
the command level, we handle this situation and will recover, but there 
is no notification to the ALSA layers to try and recover on the PCM side 
of things (as if it were an underflow condition). We also try to disable 
a stream but get all kinds of errors since it's lost state.

All of those points are corner cases but they are important to solve for 
actual products.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
