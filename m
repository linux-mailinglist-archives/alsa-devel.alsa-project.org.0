Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1940B13AAED
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:26:42 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73C972B57;
	Tue, 14 Jan 2020 07:11:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73C972B57
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97D53F80121;
	Tue, 14 Jan 2020 07:10:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E13D4F8014E; Tue, 14 Jan 2020 07:10:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 000B8F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 07:10:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 000B8F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="usgoa2+z"
Received: from localhost (unknown [49.207.51.160])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CAE4A207FF;
 Tue, 14 Jan 2020 06:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578982208;
 bh=A1+Xq60D1AEWHSM5xvY2OEdGgPGMug5LZyF0ZdYiV6w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=usgoa2+zDuSilIJYa7lQJKTzlh9XOEPD0S+UYNLGPs6lcZaOinvdJIq7zUF9qpRDt
 FaGlNJcTR8ywlONqcGr04DKlzXBcV2WIhBTFiUDWhvGMKGwSB9fO2yiIIC6ugCgWRr
 Uaw/94rVMfdMdDcOb7j+WcAEM+GT7pi6PJ92Jw7A=
Date: Tue, 14 Jan 2020 11:39:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200114060959.GA2818@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d77dcdfd-2b33-d533-e0b2-564c12223eec@linux.intel.com>
 <20191217210314.20410-10-pierre-louis.bossart@linux.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13-01-20, 09:22, Pierre-Louis Bossart wrote:
> 
> 
> On 1/12/20 11:18 PM, Vinod Koul wrote:
> > On 10-01-20, 10:08, Pierre-Louis Bossart wrote:
> > > 
> > > > > > The "big" difference is that probe is called by core (asoc) and not by
> > > > > > driver onto themselves.. IMO that needs to go away.
> > > > > 
> > > > > What I did is not different from what existed already with platform devices.
> > > > > They were manually created, weren't they?
> > > > 
> > > > Manual creation of device based on a requirement is different, did I ask
> > > > you why you are creating device :)
> > > > 
> > > > I am simple asking you not to call probe in the driver. If you need
> > > > that, move it to core! We do not want these kind of things in the
> > > > drivers...
> > > 
> > > What core are you talking about?
> > 
> > soundwire core ofcourse! IMO All that which goes into soundwire-bus-objs is
> > considered as soundwire core part and rest are drivers intel, qc, so on!
> This master code was added to the bus:   v
>                                          v
> soundwire-bus-objs := bus_type.o bus.o master.o slave.o mipi_disco.o
> stream.o
> obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
> 
> and the API is also part of the sdw.h include file. That seems to meet
> exactly what you describe above, no?
> 
> git grep sdw_master_device_add (reformatted output)
> 
> drivers/soundwire/intel_init.c:
> md = sdw_master_device_add(&intel_sdw_driver,
> 
> drivers/soundwire/master.c:
> *sdw_master_device_add(struct sdw_master_driver *driver,
> 
> drivers/soundwire/master.c:
> EXPORT_SYMBOL_GPL(sdw_master_device_add);
> 
> include/linux/soundwire/sdw.h:
> *sdw_master_device_add(struct sdw_master_driver *driver,
> 
> So, what exactly is the issue?
> 
> We are not 'calling the probe in the [Intel] driver' as you state it, we use
> a SoundWire core API which in turn will create a device. The device core
> takes care of calling the probe, see the master.c code which is NOT
> Intel-specific.
> 
> > > 
> > > The SOF intel driver needs to create a device, which will then be bound with
> > > a SoundWire master driver.
> > > 
> > > What I am doing is no different from what your team did with
> > > platform_register_device, I am really lost on what you are asking.
> > 
> > Again repeating myself, you call an API to do that is absolutely fine,
> > but we don't do that in drivers or open code these things
> That is still quite unclear, what 'open-coding' are you referring to?
> 
> I am starting to wonder if you missed the addition of the master
> functionality in the previous patch:
> 
> [PATCH v5 08/17] soundwire: add initial definitions for sdw_master_device
> 
> What this patch 9 does is call the core-defined API and implement the
> intel-specific master driver.

Yes and no, it does call things introduced in patch 8, I questioned calling probe!
See below!

> > > > > > > FWIW, the implementation here follows what was suggested for Greybus 'Host
> > > > > > > Devices' [1] [2], so it's not like I am creating any sort of dangerous
> > > > > > > precedent.
> > > > > > > 
> > > > > > > [1]
> > > > > > > https://elixir.bootlin.com/linux/latest/source/drivers/greybus/es2.c#L1275
> > > > > > > [2] https://elixir.bootlin.com/linux/latest/source/drivers/greybus/hd.c#L124
> > > > > > 
> > > > > > And if you look closely all this work is done by core not by drivers!
> > > > > > Drivers _should_ never do all this, it is the job of core to do that for
> > > > > > you.
> > > > > 
> > > > > Please look at the code again, you have a USB probe that will manually call
> > > > > the GreyBus device creation.
> > > > > 
> > > > > static int ap_probe(struct usb_interface *interface,
> > > > > 		    const struct usb_device_id *id)
> > > > > {
> > > > > 	hd = gb_hd_create(&es2_driver, &udev->dev, 	
> > > > > 
> > > > > 
> > > > > static struct usb_driver es2_ap_driver = {
> > > > > 	.name =		"es2_ap_driver",
> > > > > 	.probe =	ap_probe, <<< code above
> > > > > 	.disconnect =	ap_disconnect,
> > > > > 	.id_table =	id_table,
> > > > > 	.soft_unbind =	1,
> > > > > };
> > > > 
> > > > Look closely the driver es2 calls into greybus core hd.c and gets the
> > > > work done, subtle but a big differances in the approaches..
> > > 
> > > I am sorry, I have absolutely no idea what you are referring to.
> > > 
> > > The code I copy/pasted here makes no call to the greybus core, it's ap_probe
> > > -> gb_hd_create. No core involved. If I am mistaken, please show me what I
> > > got wrong.
> > 
> > 1. es2_ap_driver is host controller driver
> > 
> > 2. gb_hd_create() is an API provided by greybus core!
> 
> same in my code...
> 
> > 
> > es2 driver doesn't open code creation like you are doing in intel driver,
> > it doesn't call probe on its own, greybus does that
> > 
> > This is very common pattern in linux kernel subsytems, drivers dont do
> > these things, the respective subsystem core does that... see about es2
> > driver and implementation of gb_hd_create(). See callers of
> > platform_register_device() and its implementation.
> > 
> > I don't know how else I can explain this to you, is something wrong in
> > how I conveyed this info or you... or something else, I dont know!!!
> the new 'master' functionality is part of the bus code, so please clarify
> what you see as problematic for the partition.

I am quoting the code in patch, which i pointed in my first reply!

On 17-12-19, 15:03, Pierre-Louis Bossart wrote:

> diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
> index 4b769409f6f8..42f7ae034bea 100644
> --- a/drivers/soundwire/intel_init.c

This is intel specific file...

> +++ b/drivers/soundwire/intel_init.c

snip ...

> +static struct sdw_intel_ctx
> +*sdw_intel_probe_controller(struct sdw_intel_res *res)

this is intel driver, intel function!

> -
> -		link->pdev = pdev;
> -		link++;
> +		/* let the SoundWire master driver to its probe */
> +		md->driver->probe(md, link);
                            ^^^^^^
which does this... calls a probe()!

And my first reply was:

> > +             /* let the SoundWire master driver to its probe */
> > +             md->driver->probe(md, link);
> 
> So you are invoking driver probe here.. That is typically role of driver
> core to do that.. If we need that, make driver core do that for you!

I rest my case!

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
