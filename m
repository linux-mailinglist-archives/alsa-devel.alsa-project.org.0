Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5593468BB
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 20:15:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBE831674;
	Tue, 23 Mar 2021 20:15:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBE831674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616526957;
	bh=WAE7yCVWty48+8GEPn0cF4r2dUhb45XiXoiZhP7rUNk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mj8koshvEDG4aaVeX3D5LPo0RJHZM/FUpd6wJLSglrTDwX772aFlJaFx1uLFF6uBp
	 5BByVAJMlEWzNkFXgs48dGvKZ40+1oiT4HRWdjEUw6lrje813HVKO+yAzt9TgX2E4i
	 +h2cpjMqnIlA+L/UV6KQlqnckuzffLx8cfOubN/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20912F80104;
	Tue, 23 Mar 2021 20:14:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9631F8025F; Tue, 23 Mar 2021 20:14:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C3EAF80155
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 20:14:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C3EAF80155
IronPort-SDR: Hsvh7H/hYmUI1id0fmjIap3OFTVg4yJcgFFISDgEEZihgsRvgY0oAcTHQnDGrJQt9kqvdTG3er
 bJ0uCF5F1jbg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="177671201"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="177671201"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 12:14:21 -0700
IronPort-SDR: LrlxJMmlWHeXpmw4l3JwHxWZYy2E6m+cwtx6PxY3N63PBQoecCG22sZ8zTZW0otLKrYbc7VVWu
 YtY0ZYP+JNAg==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="452277659"
Received: from laguitie-mobl.amr.corp.intel.com (HELO [10.252.129.185])
 ([10.252.129.185])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 12:14:20 -0700
Subject: Re: [PATCH] soundwire: intel: move to auxiliary bus
To: Greg KH <gregkh@linuxfoundation.org>
References: <20210323004325.19727-1-yung-chuan.liao@linux.intel.com>
 <YFmatyAoMZmBmkuZ@kroah.com>
 <777b4ca6-0d51-285d-549f-6ef768f2a523@linux.intel.com>
 <YFo0WW8hOsHesSFC@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <35cc8d35-a778-d8b2-bee3-bb53f8a6c51e@linux.intel.com>
Date: Tue, 23 Mar 2021 14:14:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFo0WW8hOsHesSFC@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com, vkoul@kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
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



On 3/23/21 1:32 PM, Greg KH wrote:
> On Tue, Mar 23, 2021 at 01:04:49PM -0500, Pierre-Louis Bossart wrote:
>>
>>>> Note that the auxiliary bus API has separate init and add steps, which
>>>> requires more attention in the error unwinding paths. The main loop
>>>> needs to deal with kfree() and auxiliary_device_uninit() for the
>>>> current iteration before jumping to the common label which releases
>>>> everything allocated in prior iterations.
>>>
>>> The init/add steps can be moved together in the aux bus code if that
>>> makes this usage simpler.  Please do that instead.
>>
>> IIRC the two steps were separated during the auxbus reviews to allow the
>> parent to call kfree() on an init failure, and auxiliary_device_uninit()
>> afterwards.
>>
>> https://www.kernel.org/doc/html/latest/driver-api/auxiliary_bus.html#auxiliary-device
>>
>> With a single auxbus_register(), the parent wouldn't know whether to use
>> kfree() or auxiliary_device_uinit() when an error is returned, would it?
>>
> 
> It should, you know the difference when you call device_register() vs.
> device_initialize()/device_add(), for what to do, right?
> 
> Should be no difference here either :)

sorry, not following.

with the regular devices, the errors can only happen on the second "add" 
stage.

int device_register(struct device *dev)
{
	device_initialize(dev);
	return device_add(dev);
}

that's not what is currently implemented for the auxiliary bus

the current flow is

ldev = kzalloc(..)
some inits
ret = auxiliary_device_init(&ldev->auxdev)
if (ret < 0) {
     kfree(ldev);
     goto err1;
}

ret = auxiliary_device_add(&ldev->auxdev)
if (ret < 0)
     auxiliary_device_uninit(&ldev->auxdev)
     goto err2;
}
...
err2:
err1:

How would I convert this to

ldev = kzalloc(..)
some inits
ret = auxiliary_device_register()
if (ret) {
    kfree(ldev) or not?
    unit or not?
}

IIRC during reviews there was an ask that the parent and name be 
checked, and that's why the code added the two checks below:

int auxiliary_device_init(struct auxiliary_device *auxdev)
{
	struct device *dev = &auxdev->dev;

	if (!dev->parent) {
		pr_err("auxiliary_device has a NULL dev->parent\n");
		return -EINVAL;
	}

	if (!auxdev->name) {
		pr_err("auxiliary_device has a NULL name\n");
		return -EINVAL;
	}

	dev->bus = &auxiliary_bus_type;
	device_initialize(&auxdev->dev);
	return 0;
}

does this clarify the sequence?







