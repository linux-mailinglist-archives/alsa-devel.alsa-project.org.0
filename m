Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89564347CBC
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 16:33:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DB9A16A2;
	Wed, 24 Mar 2021 16:32:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DB9A16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616600020;
	bh=ymR+Z1PMbaqcW5BkuKKBSWBEthwd6TzAxY7ie0c+X94=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RagB9kGtZ/WXwi+aPZ4dhkUBF9c435VZnMAr0kgNFwW60r7Xd/AMjfi7eGUrrOzXA
	 jJgCTNcnMuuqBk1arRFljNbTjAvaXuSONZbdTA5hcvIjrcbOetBs3ps6h1vxVvYP4u
	 RKLUPaNXHmlVhFzV4u41sA4gFy4E026ziVW3Pw20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB15F801D5;
	Wed, 24 Mar 2021 16:32:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B836F801D5; Wed, 24 Mar 2021 16:32:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21B01F80156
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 16:32:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21B01F80156
IronPort-SDR: n2M7Oc6OTSfVME5z+UkNA64emZsj7pEC21i7NIcwFfFiOf0naEne0vbE4vuipa0TG938uxmzLs
 jkfZXnHEqWpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="188427872"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="188427872"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 08:32:01 -0700
IronPort-SDR: AxDddmw+YCYh7g59uN05Wg4w8oePcVqXDwKx1lEhT5IyOtWrqMeutIvUjD66w96loCyKAr3uVl
 SkldLBgMij2A==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="608143696"
Received: from mailunda-mobl.amr.corp.intel.com (HELO [10.209.33.48])
 ([10.209.33.48])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 08:32:00 -0700
Subject: Re: [PATCH] soundwire: intel: move to auxiliary bus
To: Vinod Koul <vkoul@kernel.org>
References: <20210323004325.19727-1-yung-chuan.liao@linux.intel.com>
 <YFmPTkNkX6QPWiCa@vkoul-mobl.Dlink> <YFma1ClahDe2bZhR@kroah.com>
 <aa9cfc49-913e-b3ba-1d92-2fab55bf4fa7@linux.intel.com>
 <YFsZdiVQpLfsWmv2@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c3534676-f8df-b9ce-582d-3cf02db4d02c@linux.intel.com>
Date: Wed, 24 Mar 2021 10:03:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFsZdiVQpLfsWmv2@vkoul-mobl.Dlink>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com,
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



On 3/24/21 5:50 AM, Vinod Koul wrote:
> On 23-03-21, 12:29, Pierre-Louis Bossart wrote:
>> Thanks Greg and Vinod for the reviews
>>
>>>>> -static int intel_master_probe(struct platform_device *pdev)
>>>>> +static int intel_link_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
>>>>>    {
>>>>> -	struct device *dev = &pdev->dev;
>>>>> +	struct device *dev = &auxdev->dev;
>>>>> +	struct sdw_intel_link_dev *ldev = auxiliary_dev_to_sdw_intel_link_dev(auxdev);
>>>>
>>>> Do we need another abstractions for resources here, why not aux dev
>>>> creation set the resources required and we skip this step...
>>
>> Not sure what resources you are referring to?
> 
> Resources in the sdw_intel_link_dev which are sdw_intel_link_res. They
> should be resources for auxdev and if you do that lets you get rid of
> this abstraction.

Sorry Vinod, I am not following your line of thought. We must be talking 
of different things or having a different understanding of what the 
auxiliary device is.

The auxiliary device is deliberately minimal by design and does not 
contain domain-specific information/resources/pointers/pdata as the 
platform_device does. You extend it by defining a larger structure that 
contains an auxiliary device and whatever domain-specific 
fields/structures/domains are needed, then use container_of to access it.

It's not just Intel doing this, the first example from Mellanox uses the 
same pattern, albeit with a single pointer instead of the structure we used.

see e.g. 
https://elixir.bootlin.com/linux/latest/source/include/linux/mlx5/driver.h#L545

So I am not sure what you mean by 'rid of this abstraction' when this 
abstraction is pretty much the way things were designed?

Maybe an example of what sort of structure you had in mind would help?


>> this is just a container_of() and the documented way of extending the auxbus
>> (see https://www.kernel.org/doc/html/latest/driver-api/auxiliary_bus.html#example-usage)
>>
>>
>> struct sdw_intel_link_dev {
>> 	struct auxiliary_device auxdev;
>> 	struct sdw_intel_link_res link_res;
>> };
>>
>> #define auxiliary_dev_to_sdw_intel_link_dev(auxiliary_dev) \
>> 	container_of(auxiliary_dev, struct sdw_intel_link_dev, auxdev)
>>
>>>>>    	struct sdw_intel *sdw;
>>>>>    	struct sdw_cdns *cdns;
>>>>>    	struct sdw_bus *bus;
>>>>> @@ -1346,14 +1347,14 @@ static int intel_master_probe(struct platform_device *pdev)
>>>>>    	cdns = &sdw->cdns;
>>>>>    	bus = &cdns->bus;
>>>>> -	sdw->instance = pdev->id;
>>>>> -	sdw->link_res = dev_get_platdata(dev);
>>>>> +	sdw->instance = auxdev->id;
>>>>
>>>> so auxdev has id and still we pass id as argument :( Not sure if folks
>>>> can fix this now
>>>
>>> That's odd, yeah, it should be fixed.
>>
>> I think we are talking about different things?
>>
>> this is defined in mod_devicetable.h:
>>
>> struct auxiliary_device_id {
>> 	char name[AUXILIARY_NAME_SIZE];
>> 	kernel_ulong_t driver_data;
>> };
>>
>> and used for the driver probe:
>>
>> 	ret = auxdrv->probe(auxdev, auxiliary_match_id(auxdrv->id_table, auxdev));
>>
>> but there is a separate id:
>>
>> struct auxiliary_device {
>> 	struct device dev;
>> 	const char *name;
>> 	u32 id;
>> };
>>
>> which is set during the device initialization in intel_init.c
>>
>> 	/* we don't use an IDA since we already have a link ID */
>> 	auxdev->id = link_id;
>>
>> In the auxiliary bus design, the parent has to take care of managing this
>> id, be it with an IDA or as we do here with a physical link ID that is
>> unique.
> 
> Aha, maybe both of them should not be 'id' to avoid this confusion!

the function definition follows the expected prototype

struct auxiliary_driver {
         int (*probe)(struct auxiliary_device *,
                      const struct auxiliary_device_id *id);

we can rename the argument to e.g. dev_id if that helps. Suggestions 
welcome.

> That also reminds me that we have duplicate info:
> 
> +       sdw->instance = auxdev->id;
> +       bus->link_id = auxdev->id;
> 
> drop the local driver instance and use bus->link_id please

if you are referring to sdw->instance, it could probably be removed, but 
that would need to be a separate cleanup changing cadence_master.c as 
well. this patch only changes pdev->id with auxdev->id and provides only 
the transition from platform device to auxiliary device.

