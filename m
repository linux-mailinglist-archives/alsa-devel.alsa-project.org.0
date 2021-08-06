Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E8C3E2E1C
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 18:07:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33E7D16D7;
	Fri,  6 Aug 2021 18:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33E7D16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628266020;
	bh=j/EUqqoXp3hLjtrDITBhx7StqHXVYurg1ZFyajz8a0Y=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=baeauvIxxfyBu3Dh0/4xOTrTgP5IEhSjN2GZfzds0r0XGCzt52FagiRJGTEd8dtbU
	 774dv/jyv/SZMGZZ+UYKTx1rZO52+Ak3zHvgfw2SZv8JQ/vwMaFwD8sm63DdEk50Q0
	 bX7Aygbx10em1gsuCzHWwj2QxGtxm8JBgekEMBBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A61E4F8025F;
	Fri,  6 Aug 2021 18:05:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B2A5F8025F; Fri,  6 Aug 2021 18:05:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04E72F80169
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 18:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04E72F80169
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="299984281"
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="299984281"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 09:03:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="523548012"
Received: from asobi-mobl1.amr.corp.intel.com (HELO [10.213.162.7])
 ([10.213.162.7])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 09:03:27 -0700
Subject: Re: [PATCH 3/4] soundwire: intel: exit clock stop mode on system
 suspend
To: Vinod Koul <vkoul@kernel.org>
References: <20210727055608.30247-1-yung-chuan.liao@linux.intel.com>
 <20210727055608.30247-4-yung-chuan.liao@linux.intel.com>
 <YQd1C0QQMDNtzfAq@matsya>
 <792f70bd-b4ae-e3a1-c37e-ba2913018d0b@linux.intel.com>
 <2b7f632d-e8b2-7a14-54c6-86d19ca4ba01@linux.intel.com>
 <YQ05yYz1UR9Du92R@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7dd06fbe-2ba1-7d25-b620-c34c93e2582c@linux.intel.com>
Date: Fri, 6 Aug 2021 11:03:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQ05yYz1UR9Du92R@matsya>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 tiwai@suse.de, broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com
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



On 8/6/21 8:31 AM, Vinod Koul wrote:
> On 02-08-21, 11:28, Pierre-Louis Bossart wrote:
>>
>>
>>
>>>> 1. In above you are calling resume of child devices first and then intel
>>>> device, which sounds reverse, should you not resume intel device first
>>>> and then child (codec devices) ?
>>>>
>>>> 2. What about when resume is invoked by the core for the child devices.
>>>> That would be called in the PM resume flow, so why do it here?
>>>
>>> I realize it's a complicated sequence, it took us multiple phases to get
>>> it right. There are multiple layers between power domain, bus and driver.
>>>
>>> The .prepare phase happens before the system suspend phase. Unlike
>>> suspend, which progresses from children to parents, the .prepare is
>>> handled parent first.
>>>
>>> When we do a request_resume of the child device, by construction that
>>> also resumes the parent. In other words, if we have multiple codecs on a
>>> link, the first iteration of device_for_each_child() will already resume
>>> the parent and the first device, and the second iteration will only
>>> resume the second device.
>>>
>>> What this step does is make sure than when the codec .suspend routine is
>>> invoked, the entire bus is already back to full power. I did check
>>> privately with Rafael (CC:ed) if this sequence was legit.
>>>
>>> We did consider modifying the system suspend callback in codec drivers,
>>> so that we would do a pm_runtime resume(). This is functionally
>>> equivalent to what we are suggesting here, but we decided not to do so
>>> for two main reasons
>>>
>>> a) lots of code changes across all codecs for an Intel-specific issue
>>>
>>> b) we would need to add a flag so that codec drivers would know in which
>>> Intel-specific clock-stop mode the bus was configured. That's not so
>>> good either.
>>>
>>> It seemed simpler to use to add this .prepare step and test on the Intel
>>> clock stop mode before doing a pm_runtime_resume for all codecs.
> 
> Ack, the code looks neat. But glancing at it, reader might get confused
> about the sequencing done here.. It is not very obvious, so consider
> adding this to changelog or driver comments. It will be helpful

Yep, even in internal reviews this was far from straightforward to
explain. I added comments but I can certainly try to explain more.

>>
>> Note that we could invert the two parts and do a parent resume first,
>> and a loop for all children second. It's completely equivalent, but
>> might be less convoluted to understand without any implicit behavior
>> assumed.
> 
> Agree, it would be redundant as PM core would take care of it. maybe
> add a comment so that it is explicit

Will add comments as well.

Note that I have another lead to further improve suspend-resume, running
stress tests on thousands of cycles atm. I'll wait until we have more
results to resubmit this series.

Thanks for the reviews!
