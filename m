Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE01315C5
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jan 2020 17:09:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 709381812;
	Mon,  6 Jan 2020 17:08:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 709381812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578326956;
	bh=a+/Rumkk3gDcRK+MNCoW8jOJ8R26vLYHogT4lPiE8Mw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fAdQiBRp13QYL/46b0BUh64vnD3tdldMr0nC+UiUgqQw0oSp5g2QK+2m+T4JNPraD
	 TqteV3iEHohzjQtE0ESHLHkNnBUNtPPaqB9z9Tt97nOCAN/iAOWZwRvAe7tMgCLR7v
	 GOBDvalxkgo3x+oky0Y29VGJmxawU+jNbepQeP+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B16A1F8021D;
	Mon,  6 Jan 2020 17:06:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3638AF80159; Mon,  6 Jan 2020 17:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DAFEF80149
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 17:06:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DAFEF80149
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 08:06:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,403,1571727600"; d="scan'208";a="216866407"
Received: from cwpinto-mobl.amr.corp.intel.com (HELO [10.252.199.187])
 ([10.252.199.187])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jan 2020 08:06:41 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-10-pierre-louis.bossart@linux.intel.com>
 <20191227090826.GM3006@vkoul-mobl>
 <5be4d9df-0f46-d36f-471c-aae9e1f55cc0@linux.intel.com>
 <20200106054221.GN2818@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <32ae46a7-59ee-4815-270a-a519ff462345@linux.intel.com>
Date: Mon, 6 Jan 2020 08:51:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106054221.GN2818@vkoul-mobl>
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


>>>> +		/* let the SoundWire master driver to its probe */
>>>> +		md->driver->probe(md, link);
>>>
>>> So you are invoking driver probe here.. That is typically role of driver
>>> core to do that.. If we need that, make driver core do that for you!
>>>
>>> That reminds me I am missing match code for master driver...
>>
>> There is no match for the master because it doesn't have an existence in
>> ACPI. There are no _ADR or HID that can be used, the only thing that exists
>> is the Controller which has 4 sublinks. Each master must be added  by hand.
>>
>> Also the SoundWire master cannot be enumerated or matched against a
>> SoundWire bus, since it controls the bus itself (that would be a chicken and
>> egg problem). The SoundWire master would need to be matched on a parent bus
>> (which does not exist for Intel) since the hardware is embedded in a larger
>> audio cluster that's visible on PCI only.
>>
>> Currently for Intel platforms, the SoundWire master device is created by the
>> SOF driver (via the abstraction in intel_init.c).
> 
> That is okay for me, the thing that is bit confusing is having a probe
> etc and no match.. (more below)..
> 
>>> So we seem to be somewhere is middle wrt driver probing here! IIUC this
>>> is not a full master driver, thats okay, but then it is not
>>> completely transparent either...
>>>
>>> I was somehow thinking that the driver will continue to be
>>> 'platform/acpi/of' driver and master device abstraction will be
>>> handled in the core (for example see how the busses like i2c handle
>>> this). The master device is created and used to represent but driver
>>> probing etc is not done
>>
>> I2C controllers are typically PCI devices or have some sort of ACPI
>> description. This is not the case for SoundWire masters on Intel platforms,
> 
> Well the world is not PCI/ACPI... We have controllers which are DT
> described and work in same manner as a PCI device.
Both DT and PCI would use a DIFFERENT matching on the parent bus, not a 
matching provided by the SoundWire subsystem itself.

> 
>> so even if I wanted to I would have no ability to implement any matching or
>> parent bus registration.
>>
>> Also the notion of 'probe' does not necessarily mean that the device is
>> attached to a bus, we use DAI 'drivers' in ASoC and still have probe/remove
>> callbacks.
> 
> The "big" difference is that probe is called by core (asoc) and not by
> driver onto themselves.. IMO that needs to go away.

What I did is not different from what existed already with platform 
devices. They were manually created, weren't they?

> 
>> And if you look at the definitions, we added additional callbacks since
>> probe/remove are not enough to deal with hardware restrictions:
>>
>> For Intel platforms, we have a startup() callback which is only invoked once
>> the DSP is powered and the rails stable. Likewise we added an
>> 'autonomous_clock_stop()' callback which will be needed when the Linux
>> driver hands-over control of the hardware to the DSP firmware, e.g. to deal
>> with in-band wakes in D0i3.
>>
>> FWIW, the implementation here follows what was suggested for Greybus 'Host
>> Devices' [1] [2], so it's not like I am creating any sort of dangerous
>> precedent.
>>
>> [1]
>> https://elixir.bootlin.com/linux/latest/source/drivers/greybus/es2.c#L1275
>> [2] https://elixir.bootlin.com/linux/latest/source/drivers/greybus/hd.c#L124
> 
> And if you look closely all this work is done by core not by drivers!
> Drivers _should_ never do all this, it is the job of core to do that for
> you.

Please look at the code again, you have a USB probe that will manually 
call the GreyBus device creation.

static int ap_probe(struct usb_interface *interface,
		    const struct usb_device_id *id)
{
	hd = gb_hd_create(&es2_driver, &udev->dev, 	


static struct usb_driver es2_ap_driver = {
	.name =		"es2_ap_driver",
	.probe =	ap_probe, <<< code above
	.disconnect =	ap_disconnect,
	.id_table =	id_table,
	.soft_unbind =	1,
};

The master device probe suggested here is also called as part of the 
parent SOF PCI device probe, same as this USB example. I really don't 
see what your objection is, given that there is no way to deal with the 
SoundWire controller as a independent entity for Intel platforms.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
