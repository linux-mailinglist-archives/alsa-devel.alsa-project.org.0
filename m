Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D2B13AA80
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:17:44 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8011F2131;
	Mon, 13 Jan 2020 16:28:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8011F2131
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72AF6F8025A;
	Mon, 13 Jan 2020 16:22:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 777DFF80227; Mon, 13 Jan 2020 16:22:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1928F800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 16:22:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1928F800B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 07:22:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; d="scan'208";a="304865985"
Received: from bcoogan-mobl1.amr.corp.intel.com (HELO [10.252.137.69])
 ([10.252.137.69])
 by orsmga001.jf.intel.com with ESMTP; 13 Jan 2020 07:22:15 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-10-pierre-louis.bossart@linux.intel.com>
 <20191227090826.GM3006@vkoul-mobl>
 <5be4d9df-0f46-d36f-471c-aae9e1f55cc0@linux.intel.com>
 <20200106054221.GN2818@vkoul-mobl>
 <32ae46a7-59ee-4815-270a-a519ff462345@linux.intel.com>
 <20200110064303.GX2818@vkoul-mobl>
 <39000dd7-3f77-bc33-0ad3-aa47ba2360f7@linux.intel.com>
 <20200113051800.GP2818@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d77dcdfd-2b33-d533-e0b2-564c12223eec@linux.intel.com>
Date: Mon, 13 Jan 2020 09:22:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200113051800.GP2818@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 09/17] soundwire: intel: remove platform
 devices and use 'Master Devices' instead
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



On 1/12/20 11:18 PM, Vinod Koul wrote:
> On 10-01-20, 10:08, Pierre-Louis Bossart wrote:
>>
>>>>> The "big" difference is that probe is called by core (asoc) and not by
>>>>> driver onto themselves.. IMO that needs to go away.
>>>>
>>>> What I did is not different from what existed already with platform devices.
>>>> They were manually created, weren't they?
>>>
>>> Manual creation of device based on a requirement is different, did I ask
>>> you why you are creating device :)
>>>
>>> I am simple asking you not to call probe in the driver. If you need
>>> that, move it to core! We do not want these kind of things in the
>>> drivers...
>>
>> What core are you talking about?
> 
> soundwire core ofcourse! IMO All that which goes into soundwire-bus-objs is
> considered as soundwire core part and rest are drivers intel, qc, so on!
This master code was added to the bus:   v
                                          v
soundwire-bus-objs := bus_type.o bus.o master.o slave.o mipi_disco.o 
stream.o
obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o

and the API is also part of the sdw.h include file. That seems to meet 
exactly what you describe above, no?

git grep sdw_master_device_add (reformatted output)

drivers/soundwire/intel_init.c:
md = sdw_master_device_add(&intel_sdw_driver,

drivers/soundwire/master.c:
*sdw_master_device_add(struct sdw_master_driver *driver,

drivers/soundwire/master.c:
EXPORT_SYMBOL_GPL(sdw_master_device_add);

include/linux/soundwire/sdw.h:
*sdw_master_device_add(struct sdw_master_driver *driver,

So, what exactly is the issue?

We are not 'calling the probe in the [Intel] driver' as you state it, we 
use a SoundWire core API which in turn will create a device. The device 
core takes care of calling the probe, see the master.c code which is NOT 
Intel-specific.

>>
>> The SOF intel driver needs to create a device, which will then be bound with
>> a SoundWire master driver.
>>
>> What I am doing is no different from what your team did with
>> platform_register_device, I am really lost on what you are asking.
> 
> Again repeating myself, you call an API to do that is absolutely fine,
> but we don't do that in drivers or open code these things
That is still quite unclear, what 'open-coding' are you referring to?

I am starting to wonder if you missed the addition of the master 
functionality in the previous patch:

[PATCH v5 08/17] soundwire: add initial definitions for sdw_master_device

What this patch 9 does is call the core-defined API and implement the 
intel-specific master driver.

> 
>>>>>> FWIW, the implementation here follows what was suggested for Greybus 'Host
>>>>>> Devices' [1] [2], so it's not like I am creating any sort of dangerous
>>>>>> precedent.
>>>>>>
>>>>>> [1]
>>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/greybus/es2.c#L1275
>>>>>> [2] https://elixir.bootlin.com/linux/latest/source/drivers/greybus/hd.c#L124
>>>>>
>>>>> And if you look closely all this work is done by core not by drivers!
>>>>> Drivers _should_ never do all this, it is the job of core to do that for
>>>>> you.
>>>>
>>>> Please look at the code again, you have a USB probe that will manually call
>>>> the GreyBus device creation.
>>>>
>>>> static int ap_probe(struct usb_interface *interface,
>>>> 		    const struct usb_device_id *id)
>>>> {
>>>> 	hd = gb_hd_create(&es2_driver, &udev->dev, 	
>>>>
>>>>
>>>> static struct usb_driver es2_ap_driver = {
>>>> 	.name =		"es2_ap_driver",
>>>> 	.probe =	ap_probe, <<< code above
>>>> 	.disconnect =	ap_disconnect,
>>>> 	.id_table =	id_table,
>>>> 	.soft_unbind =	1,
>>>> };
>>>
>>> Look closely the driver es2 calls into greybus core hd.c and gets the
>>> work done, subtle but a big differances in the approaches..
>>
>> I am sorry, I have absolutely no idea what you are referring to.
>>
>> The code I copy/pasted here makes no call to the greybus core, it's ap_probe
>> -> gb_hd_create. No core involved. If I am mistaken, please show me what I
>> got wrong.
> 
> 1. es2_ap_driver is host controller driver
> 
> 2. gb_hd_create() is an API provided by greybus core!

same in my code...

> 
> es2 driver doesn't open code creation like you are doing in intel driver,
> it doesn't call probe on its own, greybus does that
> 
> This is very common pattern in linux kernel subsytems, drivers dont do
> these things, the respective subsystem core does that... see about es2
> driver and implementation of gb_hd_create(). See callers of
> platform_register_device() and its implementation.
> 
> I don't know how else I can explain this to you, is something wrong in
> how I conveyed this info or you... or something else, I dont know!!!
the new 'master' functionality is part of the bus code, so please 
clarify what you see as problematic for the partition.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
