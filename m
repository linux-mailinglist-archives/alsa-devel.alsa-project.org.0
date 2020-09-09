Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF43326335F
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 19:02:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7906C169B;
	Wed,  9 Sep 2020 19:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7906C169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599670976;
	bh=iYzd59h9NzoXAgGKbr9XvO+GHJCh+RhpD/d+u7A0ODU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NO2xGjfcnmdvrZMuWmIF9qbpeB4MyUwslNbVbhxr479smxhDAsfyeMoHRbsGcQ/7+
	 hFGie/moEtpxIHU/a2vCqIBiVue5FmeKVQXJINB8ueEtqn4GJC6nkNbPIih7C4MFRh
	 hYB6bjviwJ6e/j7ooM8GIxmbHKRoE4EPjZ0wWUn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B9FBF80240;
	Wed,  9 Sep 2020 19:01:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC439F80227; Wed,  9 Sep 2020 19:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C32AF8015F
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 19:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C32AF8015F
IronPort-SDR: 5H3uUYr+1FMgSOjhmptsUL1OaY687dZHj3tQXufUgRdDOKeDXa9jc2fpANKwUNBTtI1hXnbhWD
 U8MRSDDDe39A==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="137893014"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="137893014"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 10:01:01 -0700
IronPort-SDR: /N/heFDKxKb2HFDk4yR30nCvJc4feNSfGOv8JktzCfqUo5uUbej66lwTOSnK38lIgTO2iLeICJ
 sITk8ooDxFwQ==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="505516346"
Received: from rsetyawa-mobl1.amr.corp.intel.com (HELO [10.212.20.145])
 ([10.212.20.145])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 10:01:00 -0700
Subject: Re: [PATCH] soundwire: bus: add enumerated slave to device list
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20200909082711.11670-1-srinivas.kandagatla@linaro.org>
 <80081c70-9137-c9f0-9813-8166275ef7af@linux.intel.com>
 <ab107351-dbde-7f6d-c588-11572aed5d2d@linaro.org>
 <4cdcda10-bdc6-211f-d279-e74f57684b79@linux.intel.com>
 <d0c71a83-9dc1-83c3-5cb1-d8fb7dc7f809@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ed88432c-e21c-b5fc-3abc-5f574769b722@linux.intel.com>
Date: Wed, 9 Sep 2020 12:00:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d0c71a83-9dc1-83c3-5cb1-d8fb7dc7f809@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
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



On 9/9/20 10:54 AM, Srinivas Kandagatla wrote:
> 
> 
> On 09/09/2020 15:39, Pierre-Louis Bossart wrote:
>>
>>>>> Currently slave devices are only added either from device tree or acpi
>>>>> entries. However lets say, there is wrong or no entry of a slave 
>>>>> device
>>>>> in DT that is enumerated, then there is no way for user to know all
>>>>> the enumerated devices on the bus.
>>>>
>>>> Sorry Srinivas, I don't understand your point.
>>>>
>>>> The sysfs entries will include all devices that are described in 
>>>> platform firmware (be it DT or ACPI).
>>>
>>> yes that is true, but it will not include all the enumerated devices 
>>> on the bus!
>>>
>>> In my case on a new board I was trying to figure out what devices are 
>>> on the bus even before even adding any device tree entries!
>>
>> We've seen this before but dynamic debug provides all the information 
>> you need. see e.g. the logs from 
>> https://sof-ci.01.org/linuxpr/PR2425/build4447/devicetest/
>>
>> jf-cml-rvp-sdw-1 kernel: [  289.751974] soundwire sdw-master-0: Slave 
>> attached, programming device number
>> jf-cml-rvp-sdw-1 kernel: [  289.752121] soundwire sdw-master-0: SDW 
>> Slave Addr: 10025d070000 <<< HERE
> 
> Yes, I have noticed this too! This will be printed for every call to 
> sdw_extract_slave_id()!
> 
> ...
>>
>> Now I get your point but
>> a) you already have a dynamic debug trace to list all devices
>> b) adding 'undeclared' devices would make things quite murky and is 
>> only half of the solution. We already struggle because we already have 
>> 'ghost' devices in sysfs that are not physically present, and no way 
>> to differentiate between the two. If we did add those entries, then 
>> we'd need two new sysfs attributes such as
>> 'declared' and 'enumerated'.
> 
> I totally agree with you on dealing with the undeclared devices, which 
> is unnecessary mess!

It's not necessarily that bad.
- if the intent is to have a single platform firmware that can deal with 
different boards, it's a good thing.
- but if it's just sloppy platform firmware that just does copy-paste 
from platform to platform then indeed it becomes a mess.

> May be we could make the enumerated devices discovery bit more verbose!

Maybe adding a device number sysfs entry would help, e.g. reporting
NotAttched or a value in [0,11] would tell you if the device is actually 
present.


