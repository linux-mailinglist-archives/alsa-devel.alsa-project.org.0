Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CFE4FE463
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 17:13:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33E4D17A2;
	Tue, 12 Apr 2022 17:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33E4D17A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649776419;
	bh=D/7uXVQQJqcjVO5VqFBaDYYJRNFnb5+cG95Rv/bhEjw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=icL8vhFAiGRDlQf0vtAtO6xsqVKusnI8Zuq97KpAUSw/+GrBLaAThOHREaOytKLMe
	 0nWf8zAyV9V1VRta93p8HoUmG38Z+uzMYH6EN/7D6bsYvCEGxJlMDG9ZcUGNHjaJZP
	 mOydIX7avI1rlaO8hhZUg7BNQ60Wa+DR/qLANHq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5AF2F80095;
	Tue, 12 Apr 2022 17:12:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FCEBF80095; Tue, 12 Apr 2022 17:12:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08526F80095
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 17:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08526F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XvKQtgXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649776355; x=1681312355;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=D/7uXVQQJqcjVO5VqFBaDYYJRNFnb5+cG95Rv/bhEjw=;
 b=XvKQtgXNs+XnInZ17Qpyw9IwU2o8wOPSJKKYIH9129ALfebfFQ83J2NA
 n1FddcDQ2VnfdFe4hyShDzkG21bV0Z9BvBkxrpfty/9Qz4o5pesiZ56KU
 tgubQ3oD9PT7Urgxw74litq7c1kdWf80vbRwym3GZ8zx9RgLsACKYM2i4
 2IIpHsLj53/dlqJydVKHpuCAskMCJxHQIz9guMQEwUWyIdAB7uAizvR4j
 yj1IlHPSvUUowDnHJhQPJ/9iU4P5XJbJVJD+NLBzv1oPqfpwrQU/0N/cc
 n2oo9896+kwgccUoenEfUxd2fGoAyobMah2LonC8RtEaLsJhPgPoAgann A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="287416037"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="287416037"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 08:12:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="507578395"
Received: from aschultz-mobl2.amr.corp.intel.com (HELO [10.251.2.233])
 ([10.251.2.233])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 08:12:20 -0700
Message-ID: <3759eab0-6f1e-e6cb-2528-e0d5f79d6ec1@linux.intel.com>
Date: Tue, 12 Apr 2022 10:03:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] soundwire: use driver callbacks directly with proper
 locking
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
References: <20220407223932.84526-1-pierre-louis.bossart@linux.intel.com>
 <YlVaJ+stdbRUX5TM@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YlVaJ+stdbRUX5TM@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Thanks Vinod for the review.

>> I could use feedback on whether using device_lock() is appropriate and
> 
> Looking at other uses of device_lock() it seems apt to me
> 
>> test results on non-Intel platforms. Thanks!
>> Pierre
>>
>>  drivers/soundwire/bus.c      | 78 ++++++++++++++++++++++++++++--------
>>  drivers/soundwire/bus_type.c |  6 +--
>>  drivers/soundwire/stream.c   | 57 +++++++++++++++++---------
>>  3 files changed, 102 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index 8b7a680f388e..545b379a119e 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -7,6 +7,7 @@
>>  #include <linux/pm_runtime.h>
>>  #include <linux/soundwire/sdw_registers.h>
>>  #include <linux/soundwire/sdw.h>
>> +#include <linux/soundwire/sdw_type.h>
>>  #include "bus.h"
>>  #include "sysfs_local.h"
>>  
>> @@ -846,12 +847,18 @@ static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
>>  				       enum sdw_clk_stop_mode mode,
>>  				       enum sdw_clk_stop_type type)
>>  {
>> -	int ret;
>> +	struct device *dev = &slave->dev;
>> +	struct sdw_driver *drv;
>>  
>> -	if (slave->ops && slave->ops->clk_stop) {
>> -		ret = slave->ops->clk_stop(slave, mode, type);
>> -		if (ret < 0)
>> -			return ret;
>> +	/*
>> +	 * this function can only be called from a pm_runtime
>> +	 * sequence where the device is already locked
>> +	 */
> 
> If this is guaranteed..
> 
>> +
>> +	if (dev->driver) {
> 
> do we need to check this? Did you find a case where this was not valid
> while device is locked, maybe do this while holding the lock (kind of
> moot to process the calls if driver is gone)

Humm, good feedback. I will re-check for cases where the driver is 'blacklisted' and also cases there there's no power management supported.

> 
>> +		drv = drv_to_sdw_driver(dev->driver);
>> +		if (drv && drv->ops && drv->ops->clk_stop)
>> +			return drv->ops->clk_stop(slave, mode, type);

In the last version I did remove the check for if (drv) above since it can't be NULL

>>  	}
>>  
>>  	return 0;
>> @@ -1616,14 +1623,25 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>>  		}
>>  
>>  		/* Update the Slave driver */
>> -		if (slave_notify && slave->ops &&
>> -		    slave->ops->interrupt_callback) {
>> -			slave_intr.sdca_cascade = sdca_cascade;
>> -			slave_intr.control_port = clear;
>> -			memcpy(slave_intr.port, &port_status,
>> -			       sizeof(slave_intr.port));
>> -
>> -			slave->ops->interrupt_callback(slave, &slave_intr);
>> +		if (slave_notify) {
>> +			struct device *dev = &slave->dev;
>> +			struct sdw_driver *drv;
>> +
>> +			device_lock(dev);
> 
> device is locked
> 
>> +
>> +			if (dev->driver) {
> 
> Same here as well

This is a different case. You can have a headset codec that detects a headset and changes it status to alert, even when there is no driver probed.
So that case is very real, and it's simpler to think of the sequence backwards.

We have to verify if there is indeed a driver bound before invoking the 'interrupt_callback', otherwise we might de-reference a NULL or dangling pointer.
And to prevent a race condition with the .probe/.remove/.shutdown which will modify dev->driver, we have to take the lock before testing dev->driver.
 
> 
>> +				drv = drv_to_sdw_driver(dev->driver);
>> +				if (drv && drv->ops && drv->ops->interrupt_callback) {
>> +					slave_intr.sdca_cascade = sdca_cascade;
>> +					slave_intr.control_port = clear;
>> +					memcpy(slave_intr.port, &port_status,
>> +					       sizeof(slave_intr.port));
>> +
>> +					drv->ops->interrupt_callback(slave, &slave_intr);
>> +				}
>> +			}
>> +
>> +			device_unlock(dev);

>>  	/* Check all non-zero devices */
>> @@ -1878,7 +1908,23 @@ void sdw_clear_slave_status(struct sdw_bus *bus, u32 request)
>>  		if (slave->status != SDW_SLAVE_UNATTACHED) {
>>  			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
>>  			slave->first_interrupt_done = false;
>> +
>> +			lock = device_trylock(&slave->dev);
> 
> should we proceed if we dont get a lock? also why the trylock variant.
> We can do the lock, this is wq context

I tried to explain this with the comment below. if we take the lock unconditionally here when it's already taken by the resume sequence, then we created a dead-lock. 

This 'sdw_update_slave_status' is invoked from two completely different contexts.

a) the first case is when a manager resumes. In that case, we want to take a lock to prevent .probe or .remove from updating the dev->driver pointer while we're using it.
b) the remove is already on-going and the lock was taken by the remove routine. In that case we don't need to take a lock.

So the idea of trylock was to detect which of the two cases we have to deal with.

> 
>> +
>> +			/*
>> +			 * this bus/manager-level function can only be called from
>> +			 * a resume sequence. If the peripheral device (child of the
>> +			 *  manager device) is locked, this indicates a resume operation
>> +			 * initiated by the device core to deal with .remove() or .shutdown()
>> +			 * at the peripheral level. With the parent-child order enforced
>> +			 * by PM frameworks on resume, the peripheral resume has not started
>> +			 * yet, so it's safe to assume the lock will not be released while
>> +			 * the update_status callback is invoked.
>> +			 */
>>  			sdw_update_slave_status(slave, SDW_SLAVE_UNATTACHED);
>> +
>> +			if (lock)
>> +				device_unlock(&slave->dev);
>>  		}

