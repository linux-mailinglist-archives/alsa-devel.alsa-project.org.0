Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0B8501D4A
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 23:18:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DA7018FA;
	Thu, 14 Apr 2022 23:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DA7018FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649971121;
	bh=IZNk1fEO1NbBk7VsiYeU2J+mN9nHk2VbHVYA4HQoOJY=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iz/zftbP/1Caa8HEjSj5L+d95vp9CsRrwGe8rgjrKPIFrg+N5xROTKNaeW4NfkjDh
	 JKRKksDrn3JQpT75s7jXx+7ipytuv1EnszhQEQU9IevXYI0cULFEPT+rBuntA+1HLt
	 gXhvDmysamSPpAT74XSoGULo6GljXgZ2ujzx0scg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFA3EF80162;
	Thu, 14 Apr 2022 23:17:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 137B5F80162; Thu, 14 Apr 2022 23:17:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 665FFF80124
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 23:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 665FFF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="exuT+tI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649971058; x=1681507058;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=IZNk1fEO1NbBk7VsiYeU2J+mN9nHk2VbHVYA4HQoOJY=;
 b=exuT+tI9nHPfQ267SPR2PK4skINzxN7Ku0BRUSwoGns4He+YFX0vQLHB
 JW7AoX1+5B9oJRcqHbZSTIRJip9LeBq7XKpN2UeQqTGrhrosjXrO75Ej+
 L8ioEzuHloyRXd0AnCj0jXthtgZh4KuRub0+O4Ft56whcGvDPvbYQLMkq
 3s/Ssph72jhIANVP3kBrL0SCKZPrh7Bls48isSQ8Dqf1zBmyDKeTlYHYv
 ug86Om4Th7zThQceJ6B4lJDH7lNnGjDi1Wid/GfCmDhzbjsPFQ0FzF8iQ
 DePe2wt5RvEi8G911N9BpRzzoZL0hnqE1O39+JnKMsmVluNUP+aIzH2Fc A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="262785708"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="262785708"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 14:17:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="591331304"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO [10.252.130.212])
 ([10.252.130.212])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 14:17:32 -0700
Message-ID: <1b043f6e-e1d6-08a4-8a9d-54477d88973f@linux.intel.com>
Date: Thu, 14 Apr 2022 16:17:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] soundwire: use driver callbacks directly with proper
 locking
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
References: <20220407223932.84526-1-pierre-louis.bossart@linux.intel.com>
 <YlVaJ+stdbRUX5TM@matsya>
 <3759eab0-6f1e-e6cb-2528-e0d5f79d6ec1@linux.intel.com>
In-Reply-To: <3759eab0-6f1e-e6cb-2528-e0d5f79d6ec1@linux.intel.com>
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


>>> @@ -846,12 +847,18 @@ static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
>>>  				       enum sdw_clk_stop_mode mode,
>>>  				       enum sdw_clk_stop_type type)
>>>  {
>>> -	int ret;
>>> +	struct device *dev = &slave->dev;
>>> +	struct sdw_driver *drv;
>>>  
>>> -	if (slave->ops && slave->ops->clk_stop) {
>>> -		ret = slave->ops->clk_stop(slave, mode, type);
>>> -		if (ret < 0)
>>> -			return ret;
>>> +	/*
>>> +	 * this function can only be called from a pm_runtime
>>> +	 * sequence where the device is already locked
>>> +	 */
>>
>> If this is guaranteed..
>>
>>> +
>>> +	if (dev->driver) {
>>
>> do we need to check this? Did you find a case where this was not valid
>> while device is locked, maybe do this while holding the lock (kind of
>> moot to process the calls if driver is gone)
> 
> Humm, good feedback. I will re-check for cases where the driver is 'blacklisted' and also cases there there's no power management supported.

I rechecked all this and it turns out I was mistaken. This function is part of a pm_runtime sequence indeed, but at the parent bus/manager device level. I confused levels and adding a deplock_assert showed very quickly that the peripheral device was never locked.

Thanks for pushing back on this!

In all other cases, I think it's valid and safe to take the lock and test dev->driver. It can happen that there is no driver enabled in the build, or that the driver is 'blacklisted', and in theory the user could muck with sysfs to trigger a peripheral driver binding sequence that would happen smack while the bus is suspended or resume.

I'll do more validation and send an update next week.

-Pierre

