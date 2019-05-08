Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C441117E5A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 18:44:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47FB91AB4;
	Wed,  8 May 2019 18:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47FB91AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557333851;
	bh=adO+6tdL5byDq4mvRJQZCawwZubAzVGFbNKO0+Bszhc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ICdL+S7dWQoAzezP8qxe5kMEv3hQp2rT6AT4Nk8IMwvkbDIP65LLgiOalP2KFe8bD
	 vkXQkX+5IxrfIvJDOv7HetgolXOmWcbb37vxGra+8rzJJ0XE0227oQdZKz8IunLEXC
	 4pTMgynKzewQHrkwnoVOJZ6qeIE4YM8hhMsZZoM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE18FF896FF;
	Wed,  8 May 2019 18:42:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 522E6F896F0; Wed,  8 May 2019 18:42:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04DE5F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 18:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04DE5F8075E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 09:42:17 -0700
X-ExtLoop1: 1
Received: from mayalewx-mobl1.amr.corp.intel.com (HELO [10.255.230.159])
 ([10.255.230.159])
 by fmsmga006.fm.intel.com with ESMTP; 08 May 2019 09:42:15 -0700
To: Greg KH <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-2-pierre-louis.bossart@linux.intel.com>
 <20190504065242.GA9770@kroah.com>
 <b0059709-027e-26c4-25a1-bd55df7c507f@linux.intel.com>
 <20190507052732.GD16052@vkoul-mobl> <20190507055432.GB17986@kroah.com>
 <20190507110331.GL16052@vkoul-mobl> <20190507111956.GB1092@kroah.com>
 <10fef156-7b01-7a08-77b4-ae3153eaaabc@linux.intel.com>
 <20190508074606.GV16052@vkoul-mobl> <20190508091628.GB1858@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c0161db3-69d7-0a76-f4bd-d5feb3529128@linux.intel.com>
Date: Wed, 8 May 2019 11:42:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508091628.GB1858@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 1/7] soundwire: Add sysfs support for
 master(s)
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



On 5/8/19 4:16 AM, Greg KH wrote:
> On Wed, May 08, 2019 at 01:16:06PM +0530, Vinod Koul wrote:
>> On 07-05-19, 17:49, Pierre-Louis Bossart wrote:
>>>
>>>>> The model here is that Master device is PCI or Platform device and then
>>>>> creates a bus instance which has soundwire slave devices.
>>>>>
>>>>> So for any attribute on Master device (which has properties as well and
>>>>> representation in sysfs), device specfic struct (PCI/platfrom doesn't
>>>>> help). For slave that is not a problem as sdw_slave structure takes care
>>>>> if that.
>>>>>
>>>>> So, the solution was to create the psedo sdw_master device for the
>>>>> representation and have device-specific structure.
>>>>
>>>> Ok, much like the "USB host controller" type device.  That's fine, make
>>>> such a device, add it to your bus, and set the type correctly.  And keep
>>>> a pointer to that structure in your device-specific structure if you
>>>> really need to get to anything in it.
>>>
>>> humm, you lost me on the last sentence. Did you mean using
>>> set_drv/platform_data during the init and retrieving the bus information
>>> with get_drv/platform_data as needed later? Or something else I badly need
>>> to learn?
>>
>> IIUC Greg meant we should represent a soundwire master device type and
>> use that here. Just like we have soundwire slave device type. Something
>> like:
>>
>> struct sdw_master {
>>          struct device dev;
>>          struct sdw_master_prop *prop;
>>          ...
>> };
>>
>> In show function you get master from dev (container of) and then use
>> that to access the master properties. So int.sdw.0 can be of this type.
> 
> Yes, you need to represent the master device type if you are going to be
> having an internal representation of it.

Humm, confused...In the existing code bus and master are synonyms, see 
e.g. following code excerpts:

  * sdw_add_bus_master() - add a bus Master instance
  * @bus: bus instance
  *
  * Initializes the bus instance, read properties and create child
  * devices.

struct sdw_bus {
	struct device *dev; <<< pointer here
	unsigned int link_id;
	struct list_head slaves;
	DECLARE_BITMAP(assigned, SDW_MAX_DEVICES);
	struct mutex bus_lock;
	struct mutex msg_lock;
	const struct sdw_master_ops *ops;
	const struct sdw_master_port_ops *port_ops;
	struct sdw_bus_params params;
	struct sdw_master_prop prop;

The existing code creates a platform_device in 
drivers/soundwire/intel_init.c, and it's assigned by the following code:

static int intel_probe(struct platform_device *pdev)
{
	struct sdw_cdns_stream_config config;
	struct sdw_intel *sdw;
	int ret;

	sdw = devm_kzalloc(&pdev->dev, sizeof(*sdw), GFP_KERNEL);
[snip]
	sdw->cdns.dev = &pdev->dev;
	sdw->cdns.bus.dev = &pdev->dev;

I really don't see what you are hinting at, sorry, unless we are talking 
about major surgery in the code.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
