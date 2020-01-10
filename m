Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3821367A3
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 07:45:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F7E617C2;
	Fri, 10 Jan 2020 07:44:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F7E617C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578638714;
	bh=EiI8O986qsZBXpYnHO9+QbEdFHW20Gyh21bFxAlWVO8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S0EdU1xzVhddCG+Xhm2e2Agn2EjPIZ47XuZaXB9GCddKrxIUUbUa/v6Y2qkux3uyZ
	 3sBfuP9CEfbrkLYIrzZvX+TSpZ0nrXXS6a9hHGG9tGps0tHcQCkQl2rZ59O6AD2BV5
	 FtB+sLuTIaoYAnZjtLLo+SECf37sCtdlzq48j5BY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73141F8011C;
	Fri, 10 Jan 2020 07:43:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 804BFF8011C; Fri, 10 Jan 2020 07:43:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3C39F800E4
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 07:43:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3C39F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="w48hFQyI"
Received: from localhost (unknown [223.226.110.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2351B2077B;
 Fri, 10 Jan 2020 06:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578638599;
 bh=Kl4yzwUKkHksUtldOAHDuwyfWatHloZS7w+En3d4hKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w48hFQyIYf2RgmNKB+xCORX3izC2oXJkQkbLEBLESQOXRU87+dlGPcKhUTT8qsU6H
 kez5cjxZ1A+Gwv3lvQnfppUH+Gz65mFDlXfSM2Iad6/jRUsBWURhpTkKUJm3/fIyBe
 Uutoswn8DjMYfY/RG24okYe/CRrpAscTvtqopyTw=
Date: Fri, 10 Jan 2020 12:13:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200110064303.GX2818@vkoul-mobl>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-10-pierre-louis.bossart@linux.intel.com>
 <20191227090826.GM3006@vkoul-mobl>
 <5be4d9df-0f46-d36f-471c-aae9e1f55cc0@linux.intel.com>
 <20200106054221.GN2818@vkoul-mobl>
 <32ae46a7-59ee-4815-270a-a519ff462345@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32ae46a7-59ee-4815-270a-a519ff462345@linux.intel.com>
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

On 06-01-20, 08:51, Pierre-Louis Bossart wrote:
> 
> > > > > +		/* let the SoundWire master driver to its probe */
> > > > > +		md->driver->probe(md, link);
> > > > 
> > > > So you are invoking driver probe here.. That is typically role of driver
> > > > core to do that.. If we need that, make driver core do that for you!
> > > > 
> > > > That reminds me I am missing match code for master driver...
> > > 
> > > There is no match for the master because it doesn't have an existence in
> > > ACPI. There are no _ADR or HID that can be used, the only thing that exists
> > > is the Controller which has 4 sublinks. Each master must be added  by hand.
> > > 
> > > Also the SoundWire master cannot be enumerated or matched against a
> > > SoundWire bus, since it controls the bus itself (that would be a chicken and
> > > egg problem). The SoundWire master would need to be matched on a parent bus
> > > (which does not exist for Intel) since the hardware is embedded in a larger
> > > audio cluster that's visible on PCI only.
> > > 
> > > Currently for Intel platforms, the SoundWire master device is created by the
> > > SOF driver (via the abstraction in intel_init.c).
> > 
> > That is okay for me, the thing that is bit confusing is having a probe
> > etc and no match.. (more below)..
> > 
> > > > So we seem to be somewhere is middle wrt driver probing here! IIUC this
> > > > is not a full master driver, thats okay, but then it is not
> > > > completely transparent either...
> > > > 
> > > > I was somehow thinking that the driver will continue to be
> > > > 'platform/acpi/of' driver and master device abstraction will be
> > > > handled in the core (for example see how the busses like i2c handle
> > > > this). The master device is created and used to represent but driver
> > > > probing etc is not done
> > > 
> > > I2C controllers are typically PCI devices or have some sort of ACPI
> > > description. This is not the case for SoundWire masters on Intel platforms,
> > 
> > Well the world is not PCI/ACPI... We have controllers which are DT
> > described and work in same manner as a PCI device.
> Both DT and PCI would use a DIFFERENT matching on the parent bus, not a
> matching provided by the SoundWire subsystem itself.
> 
> > 
> > > so even if I wanted to I would have no ability to implement any matching or
> > > parent bus registration.
> > > 
> > > Also the notion of 'probe' does not necessarily mean that the device is
> > > attached to a bus, we use DAI 'drivers' in ASoC and still have probe/remove
> > > callbacks.
> > 
> > The "big" difference is that probe is called by core (asoc) and not by
> > driver onto themselves.. IMO that needs to go away.
> 
> What I did is not different from what existed already with platform devices.
> They were manually created, weren't they?

Manual creation of device based on a requirement is different, did I ask
you why you are creating device :)

I am simple asking you not to call probe in the driver. If you need
that, move it to core! We do not want these kind of things in the
drivers...

> > > And if you look at the definitions, we added additional callbacks since
> > > probe/remove are not enough to deal with hardware restrictions:
> > > 
> > > For Intel platforms, we have a startup() callback which is only invoked once
> > > the DSP is powered and the rails stable. Likewise we added an
> > > 'autonomous_clock_stop()' callback which will be needed when the Linux
> > > driver hands-over control of the hardware to the DSP firmware, e.g. to deal
> > > with in-band wakes in D0i3.
> > > 
> > > FWIW, the implementation here follows what was suggested for Greybus 'Host
> > > Devices' [1] [2], so it's not like I am creating any sort of dangerous
> > > precedent.
> > > 
> > > [1]
> > > https://elixir.bootlin.com/linux/latest/source/drivers/greybus/es2.c#L1275
> > > [2] https://elixir.bootlin.com/linux/latest/source/drivers/greybus/hd.c#L124
> > 
> > And if you look closely all this work is done by core not by drivers!
> > Drivers _should_ never do all this, it is the job of core to do that for
> > you.
> 
> Please look at the code again, you have a USB probe that will manually call
> the GreyBus device creation.
> 
> static int ap_probe(struct usb_interface *interface,
> 		    const struct usb_device_id *id)
> {
> 	hd = gb_hd_create(&es2_driver, &udev->dev, 	
> 
> 
> static struct usb_driver es2_ap_driver = {
> 	.name =		"es2_ap_driver",
> 	.probe =	ap_probe, <<< code above
> 	.disconnect =	ap_disconnect,
> 	.id_table =	id_table,
> 	.soft_unbind =	1,
> };

Look closely the driver es2 calls into greybus core hd.c and gets the
work done, subtle but a big differances in the approaches..

> The master device probe suggested here is also called as part of the parent
> SOF PCI device probe, same as this USB example. I really don't see what your
> objection is, given that there is no way to deal with the SoundWire
> controller as a independent entity for Intel platforms.

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
