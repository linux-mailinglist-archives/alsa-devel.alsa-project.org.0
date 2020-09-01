Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA61A258F2C
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 15:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 832F517A9;
	Tue,  1 Sep 2020 15:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 832F517A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598967240;
	bh=6tQbHRR9bLamLurnf3LOHx8v+Qb2/cRD7jbULCJyqZo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lSg9hidbywnUQB1k0OkiXF+3vdZxiIFsOFTaqIUO/+cVnj2gBPaKDHgw5m1Mxxvdw
	 maVQUQzljzfOcSwUfJ+5FA7AktebfYbIdEnN4rmTpnyL0LgjDaySMYhIi4dF+c84U1
	 OP+XniaSCQ91UyHKI08fnjQkt4vmi6DNrwd3eYI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3A8CF801DA;
	Tue,  1 Sep 2020 15:31:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77384F80217; Tue,  1 Sep 2020 15:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0990EF801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 15:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0990EF801DA
IronPort-SDR: TEULPbtZ513z0nQgwphMXvR9vOOk6G2v0L8fMUHNVcsQqq4ctf0ktScU3+kBhbEZib5NqhF5ka
 8sVjjCmFgj4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="241974542"
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="241974542"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 06:31:22 -0700
IronPort-SDR: AGXl7TqFyYMzY+0nDQFWipcPsAWD9PripkK5s9uET5CINDhTMhqK+2b+R0jdg2W+iA9o5DbvLv
 ExDHSdugl+QA==
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="446127414"
Received: from dlabricc-mobl.amr.corp.intel.com (HELO [10.212.239.51])
 ([10.212.239.51])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 06:31:21 -0700
Subject: Re: [PATCH 09/11] soundwire: intel: add dynamic debug trace for
 clock-stop invalid configs
To: Vinod Koul <vkoul@kernel.org>
References: <20200829110047.GC2639@vkoul-mobl>
 <051afb2d-dd2e-0ea4-d8a9-980f5df136b7@linux.intel.com>
 <20200901110716.GA2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <101ce54e-a368-d25f-c849-48aeb2bc14c0@linux.intel.com>
Date: Tue, 1 Sep 2020 08:31:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901110716.GA2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
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



On 9/1/20 6:07 AM, Vinod Koul wrote:
> On 31-08-20, 10:15, Pierre-Louis Bossart wrote:
>>
>>>>>>>> Detect cases where the clock is assumed to be stopped but the IP is
>>>>>>>> not in the relevant state, and add a dynamic debug trace.
>>>>>>>
>>>>>>> you meant a debug print..and it looks like error print below (also in title).
>>>>>>
>>>>>> I don't understand the comment. Is the 'trace' confusing and are you asking
>>>>>> to e.g. change the commit message to 'add dynamic debug log'?
>>>>>
>>>>> Question is what is dynamic about this?
>>>> dev_dbg() is part of the kernel dynamic debug capability...
>>>>
>>>> https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html
>>>>
>>>> Not sure what you are asking here?
>>>
>>> :-| where is dev_dbg() ?
>>>
>>> See [1]
>>
>>>
>>> [1]
>>>
>>>> +			dev_err(dev, "%s invalid configuration, clock was not stopped", __func__);
>>>
>>>                           ^^^^^^^
>>
>> it's still a log using the "dynamic debug" framework.
>>
>> Again, what are you asking us to fix?
> 
> Ah you are really testing my patience!

I was asking a question, not making a statement.

There is no need to blow a fuse or yell via exclamation marks at people 
who provide 90% of the patches for the subsystem you maintain, or 
provide fixes for your own patches.

> The title says "dynamic debug" and then you use a dev_err which is *not*
> part of dynamic debug as it is printed always and cannot be dynamically
> enabled and disabled!

I accept the argument, I just didn't understand what the issue was.

> See Documentation/admin-guide/dynamic-debug-howto.rst:
> 
> "Dynamic debug is designed to allow you to dynamically enable/disable
> kernel code to obtain additional kernel information.  Currently, if
> ``CONFIG_DYNAMIC_DEBUG`` is set, then all ``pr_debug()``/``dev_dbg()`` and
> ``print_hex_dump_debug()``/``print_hex_dump_bytes()`` calls can be dynamically
> enabled per-callsite."
> 
> No dev_err here!

ok, so we will change the title to 'soundwire: intel: add error log for 
clock-stop invalid config'.

Thanks
-Pierre
