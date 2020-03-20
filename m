Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ABD18D6B9
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 19:21:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46B9B950;
	Fri, 20 Mar 2020 19:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46B9B950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584728484;
	bh=eq9YDpgqHVBPvg79kwaOuCyViph/AimVkjDcuUQaBS8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lh6jH/Zcr7lzeyjOl9mEbxsbRa9cc5LrgYVhK2QVNX2wpEWRb1r+hTO1Ip+yDayy/
	 6gdYFyZsSEF3MzeFCWJV2DDyzMqboLCe1A3GC9jLp4acfdY0+zYMMCBDq21lRaeOX7
	 7aZ7o/5atOOVqPPxO/FPeoSgYUZOVBMLZkx8/naY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5025F80290;
	Fri, 20 Mar 2020 19:18:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD045F8028E; Fri, 20 Mar 2020 19:18:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE4E6F80256
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 19:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE4E6F80256
IronPort-SDR: LteomdEjw7/+Uwoq0aorjuZKI6dEahXWHauOmTCDkZvP6ZjL9TXoTe00f9J3MjZnaLAsBbHvn4
 GVLtdQCwQnIw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 11:18:07 -0700
IronPort-SDR: VtCyRH7bjNAmArGFncj1B8AoQW96uMjhZVPrMEmv3GkjXZDFJReGQSZT0Z7J+YUtWfU0Ks9LNs
 4duYCbg0jIIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; d="scan'208";a="392230443"
Received: from manallet-mobl.amr.corp.intel.com (HELO [10.255.34.12])
 ([10.255.34.12])
 by orsmga004.jf.intel.com with ESMTP; 20 Mar 2020 11:18:05 -0700
Subject: Re: [PATCH 1/5] soundwire: bus_type: add master_device/driver support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org
References: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
 <20200320162947.17663-2-pierre-louis.bossart@linux.intel.com>
 <5d78f0f8-7418-e50e-6f0b-dd6988224744@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <626a074b-06a9-01a0-334f-3aaed1f7ed76@linux.intel.com>
Date: Fri, 20 Mar 2020 13:17:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5d78f0f8-7418-e50e-6f0b-dd6988224744@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
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

Thanks for the quick review Srinivas,

> This patch in general is missing device tree support for both matching 
> and uevent so this will not clearly work for Qualcomm controller unless 
> we do via platform bus, which does not sound right!

see other email, the platform bus is handled by a platform 
device/driver. There was no intention to change that, it's by design 
rather than an omission/error.
>> +
>> +/**
>> + * sdw_master_device_startup() - startup hardware
>> + * @md: Linux Soundwire master device
>> + *
>> + * This use of this function is optional. It is only needed if the
>> + * hardware cannot be started during a driver probe, e.g. due to power
>> + * rail dependencies. The implementation is platform-specific but the
>> + * bus will typically go through a hardware-reset sequence and devices
>> + * will be enumerated once they report as ATTACHED.
>> + */
>> +int sdw_master_device_startup(struct sdw_master_device *md)
>> +{
>> +    struct sdw_master_driver *mdrv;
>> +    struct device *dev;
>> +    int ret = 0;
>> +
>> +    if (IS_ERR_OR_NULL(md))
>> +        return -EINVAL;
>> +
>> +    dev = &md->dev;
>> +    mdrv = drv_to_sdw_master_driver(dev->driver);
>> +
>> +    if (mdrv && mdrv->startup)
>> +        ret = mdrv->startup(md);
>> +
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(sdw_master_device_startup);
> 
> Who would call this function? and How would it get hold of master device 
> instance ?

sdw_master_device_add() returns a struct_master_device *md, so the 
parent has a handle to that device. See the device creation here:

https://github.com/thesofproject/linux/blob/9c7487b33072040ab755d32ca173b75151c0160c/drivers/soundwire/intel_init.c#L238

This startup() would be called by the parent when all 
requirements/dependencies are met. Put differently, it allows the probe 
to run much earlier and check for platform firmware information (which 
links are enabled, what devices are exposed by platform firmware), while 
the startup is really when the bus clk/data lines will start toggling.

https://github.com/thesofproject/linux/blob/9c7487b33072040ab755d32ca173b75151c0160c/drivers/soundwire/intel_init.c#L341

and the call from the SOF layer is here:

https://github.com/thesofproject/linux/blob/9c7487b33072040ab755d32ca173b75151c0160c/sound/soc/sof/intel/hda-loader.c#L418

Again, if everything is ready at probe time there's no need to delay the 
actual bus startup. This is not needed for Qualcomm platforms where the 
Master device is part of a codec. It's actually irrelevant since there 
is no driver, so the startup callback does not even exist :-)

> How would soundwire core also ensure that we do not actively use this 
> master if it is not ready. Similar comment for shutdown callback.

That's a fair point, we could add a state variable and a check that the 
probe happened before.

In practice the two cases of device creation and startup are different 
phases so it'd more of a paranoia check.

Thanks,
-Pierre
