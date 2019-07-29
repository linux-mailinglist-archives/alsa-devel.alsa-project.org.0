Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9F579CE8
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 01:39:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9E91809;
	Tue, 30 Jul 2019 01:38:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9E91809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564443586;
	bh=yYYn6od+V7nWlaEwl8XGQwj7U27lNblIkpmJXSk1Bs0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pnVKOpkuDm5T6HMi5TdcPc/FstN0QspALBMIhdc8LNTroV9ooFruYaEQgu6AK77+/
	 Ji/ytTTDtTOFWK7DaC5FoZEjB6Jvn9XXbWlyIj0g6viYT26q7ZpVYn2/CpfIgFNqiX
	 2F9Bch66UsieiIek46d4MlGbzLtBs4ehLwdklE54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76A79F80483;
	Tue, 30 Jul 2019 01:38:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D155F8048D; Tue, 30 Jul 2019 01:37:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODYSUB_10, SPF_HELO_NONE, 
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24115F800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 01:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24115F800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 16:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,324,1559545200"; d="scan'208";a="165650561"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO [10.251.134.69])
 ([10.251.134.69])
 by orsmga008.jf.intel.com with ESMTP; 29 Jul 2019 16:37:51 -0700
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-18-pierre-louis.bossart@linux.intel.com>
 <45a912c5-134b-8642-70ef-8c1060389300@linux.intel.com>
 <20190726190823.GD9224@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5a16d9e6-0a9c-a0a8-3b11-d046247f3879@linux.intel.com>
Date: Mon, 29 Jul 2019 17:07:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726190823.GD9224@smile.fi.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-pm@vger.kernel.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 17/40] soundwire: bus: use
 runtime_pm_get_sync/pm when enabled
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



On 7/26/19 2:08 PM, Andy Shevchenko wrote:
> On Fri, Jul 26, 2019 at 01:08:57PM -0500, Pierre-Louis Bossart wrote:
>> This thread became unreadable with interleaved top-posting, allow me restate
>> the options and ask PM folks what they think
>>
>> On 7/25/19 6:40 PM, Pierre-Louis Bossart wrote:
>>> Not all platforms support runtime_pm for now, let's use runtime_pm
>>> only when enabled.
> 
> Just a side note below...
> 
>>> -	ret = pm_runtime_get_sync(slave->bus->dev);
>>> -	if (ret < 0)
> 
> Here...
> 
>>> -		return ret;
>>> +	if (pm_runtime_enabled(slave->bus->dev)) {
>>> +		ret = pm_runtime_get_sync(slave->bus->dev);
>>> +		if (ret < 0)
> 
> ...and thus here...
> 
>>> +			return ret;
>>> +	}
>>>    	ret = sdw_transfer(slave->bus, &msg);
>>> -	pm_runtime_put(slave->bus->dev);
>>> +
>>> +	if (pm_runtime_enabled(slave->bus->dev))
>>> +		pm_runtime_put(slave->bus->dev);
>>
>> This is option1: we explicitly test if pm_runtime is enabled before calling
>> _get_sync() and _put()
>>
>> option2 (suggested by Jan Kotas): catch the -EACCESS error code
>>
>>   	ret = pm_runtime_get_sync(slave->bus->dev);
>> -	if (ret < 0)
>> +	if (ret < 0 && ret != -EACCES)
> 
> ...and here, the pm_runtime_put_noidle() call is missed.

yes but in the example you provided, they actually do more work than 
just decrement the device usage counter:

static int
radeonfb_open(struct fb_info *info, int user)
{
	struct radeon_fbdev *rfbdev = info->par;
	struct radeon_device *rdev = rfbdev->rdev;
	int ret = pm_runtime_get_sync(rdev->ddev->dev);
	if (ret < 0 && ret != -EACCES) {
		pm_runtime_mark_last_busy(rdev->ddev->dev);
		pm_runtime_put_autosuspend(rdev->ddev->dev);
		return ret;
	}
	return 0;
}

unless I am missing something pm_runtime_put_noidle() and 
_put_autosuspend() are not equivalent, are they?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
