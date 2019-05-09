Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64A18489
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 06:28:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 889C31688;
	Thu,  9 May 2019 06:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 889C31688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557376118;
	bh=RFSPnqKGWftIJGBXUIduQ0hYGE2gqBrInSKVjBqY1FE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+9h6VFTNacYzpYIP6WNEHOAhOy2sw4RWs/eWuVEB8yON51hxqF/zJU+9E7xH4WCk
	 jsen2Q0kcd2LXuPUBzEwiZsDuNLYGTDU7HrpUXZGgaW792ZBrDambqgLfBwuWDVZbt
	 tnuy4+pP72StzPEhPcD1lkkL2quZmmOu1vDKC5tI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8F0FF89674;
	Thu,  9 May 2019 06:26:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A121F89674; Thu,  9 May 2019 06:26:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8CC5F80796
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 06:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8CC5F80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YNz/u8qq"
Received: from localhost (unknown [106.200.210.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CBC34216C4;
 Thu,  9 May 2019 04:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557376001;
 bh=BTFLcMlAore+8BPqJnH+mQxkkDWN3gE2tXUgHZgQ4vM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YNz/u8qqH3SBUlmOJtHHegFvP57qUsdB4GleSRyfOjH1Nm8YuxaRXU8yFHPpYbJ4U
 p7KovupqvTuIB5w5DN6Il6iHBsbb6fcYTONbC/JhSPD1GlBGp/17XZJ4fxD3yQ7SmO
 uUzJPV4fD/Hp6zKxok8X3OoABBdk9pZTWSXIKm9E=
Date: Thu, 9 May 2019 09:56:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190509042636.GY16052@vkoul-mobl>
References: <20190507052732.GD16052@vkoul-mobl>
 <20190507055432.GB17986@kroah.com>
 <20190507110331.GL16052@vkoul-mobl>
 <20190507111956.GB1092@kroah.com>
 <10fef156-7b01-7a08-77b4-ae3153eaaabc@linux.intel.com>
 <20190508074606.GV16052@vkoul-mobl>
 <20190508091628.GB1858@kroah.com>
 <c0161db3-69d7-0a76-f4bd-d5feb3529128@linux.intel.com>
 <20190508165945.GC6157@kroah.com>
 <0b8d5238-6894-e2b4-5522-28636e40dd63@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b8d5238-6894-e2b4-5522-28636e40dd63@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 08-05-19, 15:57, Pierre-Louis Bossart wrote:
> 
> 
> On 5/8/19 11:59 AM, Greg KH wrote:
> > On Wed, May 08, 2019 at 11:42:15AM -0500, Pierre-Louis Bossart wrote:
> > > 
> > > 
> > > On 5/8/19 4:16 AM, Greg KH wrote:
> > > > On Wed, May 08, 2019 at 01:16:06PM +0530, Vinod Koul wrote:
> > > > > On 07-05-19, 17:49, Pierre-Louis Bossart wrote:
> > > > > > 
> > > > > > > > The model here is that Master device is PCI or Platform device and then
> > > > > > > > creates a bus instance which has soundwire slave devices.
> > > > > > > > 
> > > > > > > > So for any attribute on Master device (which has properties as well and
> > > > > > > > representation in sysfs), device specfic struct (PCI/platfrom doesn't
> > > > > > > > help). For slave that is not a problem as sdw_slave structure takes care
> > > > > > > > if that.
> > > > > > > > 
> > > > > > > > So, the solution was to create the psedo sdw_master device for the
> > > > > > > > representation and have device-specific structure.
> > > > > > > 
> > > > > > > Ok, much like the "USB host controller" type device.  That's fine, make
> > > > > > > such a device, add it to your bus, and set the type correctly.  And keep
> > > > > > > a pointer to that structure in your device-specific structure if you
> > > > > > > really need to get to anything in it.
> > > > > > 
> > > > > > humm, you lost me on the last sentence. Did you mean using
> > > > > > set_drv/platform_data during the init and retrieving the bus information
> > > > > > with get_drv/platform_data as needed later? Or something else I badly need
> > > > > > to learn?
> > > > > 
> > > > > IIUC Greg meant we should represent a soundwire master device type and
> > > > > use that here. Just like we have soundwire slave device type. Something
> > > > > like:
> > > > > 
> > > > > struct sdw_master {
> > > > >           struct device dev;
> > > > >           struct sdw_master_prop *prop;
> > > > >           ...
> > > > > };
> > > > > 
> > > > > In show function you get master from dev (container of) and then use
> > > > > that to access the master properties. So int.sdw.0 can be of this type.
> > > > 
> > > > Yes, you need to represent the master device type if you are going to be
> > > > having an internal representation of it.
> > > 
> > > Humm, confused...In the existing code bus and master are synonyms, see e.g.
> > > following code excerpts:
> > > 
> > >   * sdw_add_bus_master() - add a bus Master instance
> > >   * @bus: bus instance
> > >   *
> > >   * Initializes the bus instance, read properties and create child
> > >   * devices.
> > > 
> > > struct sdw_bus {
> > > 	struct device *dev; <<< pointer here
> > 
> > That's the pointer to what?  The device that the bus is "attached to"
> > (i.e. parent, like a platform device or a pci device)?
> > 
> > Why isn't this a "real" device in itself?

Correct, I am revisiting this and I think I have a fair idea of
expectations here (looking at usb and greybus model), will hack
something up

> Allow me to provide a bit of background. I am not trying to be pedantic but
> make sure we are on the same page.
> 
> The SoundWire spec only defines a Master and Slaves attached to that Master.
> 
> In real applications, there is a need to have multiple links, which can
> possibly operate in synchronized ways, so Intel came up with the concept of
> Controller, which expose multiple Master interfaces that are in sync (two
> streams can start at exactly the same clock edge of different links).
> 
> The Controller is exposed in ACPI as a child of the HDAudio controller (ACPI
> companion of a PCI device). The controller exposes a 'master-count' and a
> set of link-specific properties needed for bandwidth/clock scaling.
> 
> For some reason, our Windows friends did not want to have a device for each
> Master interface, likely because they did not want to load a driver per
> Master interface or have 'yellow bangs'.
> 
> So the net result is that we have the following hierarchy in ACPI
> 
> Device(HDAS) // HDaudio controller
>   Device(SNDW) // SoundWire Controller
>     Device(SDW0) { // Slave0
> 	_ADR(link0, vendorX, partY...)
>     }
>     Device(SDW1) { // Slave0
> 	_ADR(link0, vendorX, partY...)
>     }
>     Device(SDW2) { // Slave0
> 	_ADR(link1, vendorX, partY...)
>     }
>     Device(SDWM) { // Slave0
> 	_ADR(linkM, vendorX, partY...)
>     }
> 
> There is no master device represented in ACPI and the only way by which we
> know to which Master a Slave device is attached by looking up the _ADR which
> contains the link information.
> 
> So, coming back to the plot, when we parse the Controller properties, we
> find out how many Master interfaces we have, create a platform_device for
> each of them, then initialize all the bus stuff.

So the idea here would be to go back and create a sdw_master device and
use that in the bus instance. I think it should be doable..

> > I thought I asked that a long time ago when first reviewing these
> > patches...

Sorry my fault, I should have fixed it back then.

> > 
> > > 	unsigned int link_id;
> > > 	struct list_head slaves;
> > > 	DECLARE_BITMAP(assigned, SDW_MAX_DEVICES);
> > > 	struct mutex bus_lock;
> > > 	struct mutex msg_lock;
> > > 	const struct sdw_master_ops *ops;
> > > 	const struct sdw_master_port_ops *port_ops;
> > > 	struct sdw_bus_params params;
> > > 	struct sdw_master_prop prop;
> > > 
> > > The existing code creates a platform_device in
> > > drivers/soundwire/intel_init.c, and it's assigned by the following code:
> > 
> > The core creates a platform device, don't assume you can "take it over"
> > :)
> > 
> > That platform device lives on the platform bus, you need a "master"
> > device that lives on your soundbus bus.
> > 
> > Again, look at how USB does this.  Or better yet, greybus, as that code
> > is a lot smaller and simpler.
> 
> The learning curve is not small here...
> 
> > > 
> > > static int intel_probe(struct platform_device *pdev)
> > > {
> > > 	struct sdw_cdns_stream_config config;
> > > 	struct sdw_intel *sdw;
> > > 	int ret;
> > > 
> > > 	sdw = devm_kzalloc(&pdev->dev, sizeof(*sdw), GFP_KERNEL);
> > > [snip]
> > > 	sdw->cdns.dev = &pdev->dev;
> > > 	sdw->cdns.bus.dev = &pdev->dev;
> > 
> > Gotta love the lack of reference counting :(
> > 
> > > I really don't see what you are hinting at, sorry, unless we are talking
> > > about major surgery in the code.

Not really we have object here which should contain a real device for
master and need plumbing for it..

> > It sounds like you need a device on your bus that represents the master,
> > as you have attributes associated with it, and other things.  You can't
> > put attributes on a random pci or platform device, as you do not "own"
> > that device.
> > 
> > does that help?
> 
> Looks like we are doing things wrong at multiple levels.
> 
> It might be better to have a more 'self-contained' solution where the bus
> initialization creates/registers a master device instead of having this
> proxy platform_device. That would avoid all these refcount issues and make
> the translation from device to bus straightforward.

yes that is my thinking as well. We still need to link to
platform/pci/whatever device you have and grab a refcount to that one.

> Am I on the right track or still in the weeds?


-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
