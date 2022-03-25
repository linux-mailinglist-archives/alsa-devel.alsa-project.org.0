Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1894E795A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 17:53:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C43A16D6;
	Fri, 25 Mar 2022 17:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C43A16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648227190;
	bh=jw0Rmru36Ism7omvqXhvfhnC7t+BkpBZp1qQ9Ae7YR0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fxxKPCTGXFH5V0qoFrq1GPyJIGtl2hGblQxmnkDkpvwL/YrFiXrdUTTDDOsqRL75e
	 KLl4/kckUpkfJ+FfbA9eZ5aYqDoh4a+IHZg/+HJP9OGpAPyiU5xsj/9NHKxqC/8V8q
	 n9Zw1oEdccABr7YspcNlMeA0Z+r+ssdUXzvN60q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA3B4F801F7;
	Fri, 25 Mar 2022 17:52:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A50F80162; Fri, 25 Mar 2022 17:52:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5563BF800AA
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 17:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5563BF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lJn2IiZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648227119; x=1679763119;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jw0Rmru36Ism7omvqXhvfhnC7t+BkpBZp1qQ9Ae7YR0=;
 b=lJn2IiZe6SlzFE1J1JCbOyv6yoYrsExOrgX1B2rliyhxGEtNfBLWmtEr
 XL11Tl5DCnpyJ1izQ/s12Wrq4L/wTU37eYpl6wGR2U/57nNatKwilVv+u
 bP3nFLa0sohv+rqD3ZNRKU5ni2Mte4zuazMP1b0jbk8MDU2ebqvcmYOGM
 Nd0UIaJWn2J6QJQ+NIAl8MHNvzwnYmV9wxWksd6hsKyXEx6+X85be524B
 sQUebiJSJR/ufstXP5ZqCgi62QpeFJ50Pz14EJts98SwNTyY59DkgDZI7
 kW5nqzQKDw3UubXVPMT5McrZBTSkwOU120bcCXTW9nBq7So8cqdyhYuYV g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="321865262"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="321865262"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 09:51:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="617178094"
Received: from jkbowlin-mobl1.amr.corp.intel.com (HELO [10.212.134.93])
 ([10.212.134.93])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 09:51:53 -0700
Message-ID: <03a97141-0bb9-5a10-b060-c541e6ed7eea@linux.intel.com>
Date: Fri, 25 Mar 2022 11:51:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: Conceptual bug on SoundWire probe/remove?
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <d0559e97-c4a0-b817-428c-d3e305390270@linux.intel.com>
 <YjxS3k2V9t1tJ8RD@kroah.com>
 <34c503b3-203c-11b5-fd96-ae45bf939970@linux.intel.com>
 <Yj3tKdX3TcmMn0kq@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Yj3tKdX3TcmMn0kq@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 3/25/22 11:26, Greg Kroah-Hartman wrote:
> On Fri, Mar 25, 2022 at 10:51:51AM -0500, Pierre-Louis Bossart wrote:
>>
>>
>> On 3/24/22 06:15, Greg Kroah-Hartman wrote:
>>> On Wed, Mar 23, 2022 at 02:45:59PM -0500, Pierre-Louis Bossart wrote:
>>>> Hi,
>>>> I could use feedback/guidance on a possible conceptual bug in the SoundWire
>>>> probe and bus handling.
>>>>
>>>> When we probe a driver, the code does this:
>>>>
>>>> static int sdw_drv_probe(struct device *dev)
>>>> {
>>>> 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>>>> 	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
>>>> 	const struct sdw_device_id *id;
>>>> 	const char *name;
>>>> 	int ret;
>>>>
>>>> 	/*
>>>> 	 * fw description is mandatory to bind
>>>> 	 */
>>>> 	if (!dev->fwnode)
>>>> 		return -ENODEV;
>>>>
>>>> 	if (!IS_ENABLED(CONFIG_ACPI) && !dev->of_node)
>>>> 		return -ENODEV;
>>>>
>>>> 	id = sdw_get_device_id(slave, drv);
>>>> 	if (!id)
>>>> 		return -ENODEV;
>>>>
>>>> 	slave->ops = drv->ops;
>>>
>>> That is wrong and should never happen as you lost all reference
>>> counting.  Please don't do that.
>>
>> ok, so I think we all agree on the issue. It's not new code, it's been there
>> since December 2017 and 4.16
> 
> It's hard to notice that in code review :(
> 
>>>> The last line is the problematic one. If at some point, the user does an
>>>> rmmod and unbinds the SoundWire codec driver, the .remove will be called and
>>>> the 'drv' will no longer be valid, but we will still have a reference to
>>>> drv->ops and use that pointer in the bus code, e.g.
>>>>
>>>> 		/* Update the Slave driver */
>>>> 		if (slave_notify && slave->ops &&
>>>> 		    slave->ops->interrupt_callback) {
>>>> 			slave_intr.sdca_cascade = sdca_cascade;
>>>> 			slave_intr.control_port = clear;
>>>> 			memcpy(slave_intr.port, &port_status,
>>>> 			       sizeof(slave_intr.port));
>>>>
>>>> 			slave->ops->interrupt_callback(slave,
>>>> &slave_intr);
>>>> 		}
>>>>
>>>> I noodled with a potential fix in
>>>> https://github.com/thesofproject/linux/pull/3534/commits/82d64fb0fd39b532263f060a8ec86e47e9ab305b
>>>>
>>>> where I force-reset this slave->ops pointer, but it is likely to be very
>>>> racy.
>>>
>>> Just properly reference count things and this should be ok.  You can
>>> NEVER just save off a pointer to a random thing that you do not own
>>> without increasing the reference count, otherwise bad things will
>>> happen.  It's always been this way.
>>
>> but I am not following the reference count recommendation in that specific
>> case. If we increase a reference count in the probe, wouldn't that prevent
>> the unbind/remove?
> 
> Depends on what you are increasing the reference count of :)
> 
> bind/unbind has nothing to do with the reference count of objects, it
> only prevents the devices/whatever from being removed from the system
> (hopefully.)
> 
> When doing "give me the driver ops of that driver over there" you have
> to be VERY careful.  It's a very uncommon pattern that I can't think of
> anyone else doing outside of a bus logic.  I don't recommend it, instead
> grab references to the devices themselves and go through the device and
> what is bound/unbound to that.  Also keep things in sync when you grab
> those other devices, that can also get messy.
> 
> How about just not doing this at all?

That's what I was exploring, I am not sure at all we need to use this 
pointer at all.

Maybe we should go back to the problem statement:

The SoundWire codec driver provides a set of callbacks that need to be 
invoked from bus layer when events are detected (bus reconfiguration, 
clock about to be stopped, attach/detach and interrupt).

The devices are created upfront, and if there's no driver things will 
work just fine. When we bind a driver, then these callbacks are detected 
as not null.

The part that I am not familiar with is how we can prevent a 
remove/unbind while invoking the callbacks.

Maybe we can indeed increase the refcount on the device, follow the 
device->driver->ops pointers and reduce the refcount once the callback 
completes.


