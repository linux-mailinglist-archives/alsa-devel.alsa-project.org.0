Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E9C4E807C
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Mar 2022 11:35:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAD9C1687;
	Sat, 26 Mar 2022 11:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAD9C1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648290948;
	bh=imMWupio8NBhHdxMI2pqTSG8ZujNrUp6/V441IKxLSk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oXk1UKyB0eKxRLWprtwxdO8SOLUQm6hPulTORCcfuZScd9Jiw0Gno8C6tKpKMI3NI
	 TYGM7RDrXBWFgf4z7Py5AMwR/zQdxjtwDOkcnRPaMUpDDed6gRvr/amDqcq36CV5Un
	 purl8tYs/LDK2lrvM+gJPZCD9n/hXAEYMz5XR/q8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B4C5F80115;
	Sat, 26 Mar 2022 11:34:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BC7FF8019D; Sat, 26 Mar 2022 11:34:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B960BF80115
 for <alsa-devel@alsa-project.org>; Sat, 26 Mar 2022 11:34:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B960BF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="lzoB6Rfk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A325F60A54;
 Sat, 26 Mar 2022 10:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77401C2BBE4;
 Sat, 26 Mar 2022 10:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648290873;
 bh=imMWupio8NBhHdxMI2pqTSG8ZujNrUp6/V441IKxLSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lzoB6RfkbGPswp+0OTmy0On43UQ93GWqqHh6zGu/0x710zTldhMVohWtkCd3suYUr
 ahuK3MKEny8q/9yK7arKl1ZLrBl37mVvtPtW48QbDyMtUXz2HEjbges9l0D4ogiO6J
 2L59rZuZ6poJiFJ3BCeA0vjCl5Zp+qrHc9ItWmmE=
Date: Sat, 26 Mar 2022 11:34:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: Conceptual bug on SoundWire probe/remove?
Message-ID: <Yj7sNpSezHWvhS9+@kroah.com>
References: <d0559e97-c4a0-b817-428c-d3e305390270@linux.intel.com>
 <YjxS3k2V9t1tJ8RD@kroah.com>
 <34c503b3-203c-11b5-fd96-ae45bf939970@linux.intel.com>
 <Yj3tKdX3TcmMn0kq@kroah.com>
 <03a97141-0bb9-5a10-b060-c541e6ed7eea@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03a97141-0bb9-5a10-b060-c541e6ed7eea@linux.intel.com>
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

On Fri, Mar 25, 2022 at 11:51:52AM -0500, Pierre-Louis Bossart wrote:
> 
> 
> On 3/25/22 11:26, Greg Kroah-Hartman wrote:
> > On Fri, Mar 25, 2022 at 10:51:51AM -0500, Pierre-Louis Bossart wrote:
> > > 
> > > 
> > > On 3/24/22 06:15, Greg Kroah-Hartman wrote:
> > > > On Wed, Mar 23, 2022 at 02:45:59PM -0500, Pierre-Louis Bossart wrote:
> > > > > Hi,
> > > > > I could use feedback/guidance on a possible conceptual bug in the SoundWire
> > > > > probe and bus handling.
> > > > > 
> > > > > When we probe a driver, the code does this:
> > > > > 
> > > > > static int sdw_drv_probe(struct device *dev)
> > > > > {
> > > > > 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> > > > > 	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
> > > > > 	const struct sdw_device_id *id;
> > > > > 	const char *name;
> > > > > 	int ret;
> > > > > 
> > > > > 	/*
> > > > > 	 * fw description is mandatory to bind
> > > > > 	 */
> > > > > 	if (!dev->fwnode)
> > > > > 		return -ENODEV;
> > > > > 
> > > > > 	if (!IS_ENABLED(CONFIG_ACPI) && !dev->of_node)
> > > > > 		return -ENODEV;
> > > > > 
> > > > > 	id = sdw_get_device_id(slave, drv);
> > > > > 	if (!id)
> > > > > 		return -ENODEV;
> > > > > 
> > > > > 	slave->ops = drv->ops;
> > > > 
> > > > That is wrong and should never happen as you lost all reference
> > > > counting.  Please don't do that.
> > > 
> > > ok, so I think we all agree on the issue. It's not new code, it's been there
> > > since December 2017 and 4.16
> > 
> > It's hard to notice that in code review :(
> > 
> > > > > The last line is the problematic one. If at some point, the user does an
> > > > > rmmod and unbinds the SoundWire codec driver, the .remove will be called and
> > > > > the 'drv' will no longer be valid, but we will still have a reference to
> > > > > drv->ops and use that pointer in the bus code, e.g.
> > > > > 
> > > > > 		/* Update the Slave driver */
> > > > > 		if (slave_notify && slave->ops &&
> > > > > 		    slave->ops->interrupt_callback) {
> > > > > 			slave_intr.sdca_cascade = sdca_cascade;
> > > > > 			slave_intr.control_port = clear;
> > > > > 			memcpy(slave_intr.port, &port_status,
> > > > > 			       sizeof(slave_intr.port));
> > > > > 
> > > > > 			slave->ops->interrupt_callback(slave,
> > > > > &slave_intr);
> > > > > 		}
> > > > > 
> > > > > I noodled with a potential fix in
> > > > > https://github.com/thesofproject/linux/pull/3534/commits/82d64fb0fd39b532263f060a8ec86e47e9ab305b
> > > > > 
> > > > > where I force-reset this slave->ops pointer, but it is likely to be very
> > > > > racy.
> > > > 
> > > > Just properly reference count things and this should be ok.  You can
> > > > NEVER just save off a pointer to a random thing that you do not own
> > > > without increasing the reference count, otherwise bad things will
> > > > happen.  It's always been this way.
> > > 
> > > but I am not following the reference count recommendation in that specific
> > > case. If we increase a reference count in the probe, wouldn't that prevent
> > > the unbind/remove?
> > 
> > Depends on what you are increasing the reference count of :)
> > 
> > bind/unbind has nothing to do with the reference count of objects, it
> > only prevents the devices/whatever from being removed from the system
> > (hopefully.)
> > 
> > When doing "give me the driver ops of that driver over there" you have
> > to be VERY careful.  It's a very uncommon pattern that I can't think of
> > anyone else doing outside of a bus logic.  I don't recommend it, instead
> > grab references to the devices themselves and go through the device and
> > what is bound/unbound to that.  Also keep things in sync when you grab
> > those other devices, that can also get messy.
> > 
> > How about just not doing this at all?
> 
> That's what I was exploring, I am not sure at all we need to use this
> pointer at all.
> 
> Maybe we should go back to the problem statement:
> 
> The SoundWire codec driver provides a set of callbacks that need to be
> invoked from bus layer when events are detected (bus reconfiguration, clock
> about to be stopped, attach/detach and interrupt).
> 
> The devices are created upfront, and if there's no driver things will work
> just fine. When we bind a driver, then these callbacks are detected as not
> null.

Not null from where?  And why is this different than any other bus?

> The part that I am not familiar with is how we can prevent a remove/unbind
> while invoking the callbacks.

Who is calling these callbacks?  From what path?  bind/unbind happens
through the driver core, into your bus code.  So you have a lock for
this, it should be serialized and should not be happening while some
other bus callback is happening from the driver core.

If not, what specific path are you worried about here?

> Maybe we can indeed increase the refcount on the device, follow the
> device->driver->ops pointers and reduce the refcount once the callback
> completes.

No, again, refcounts hold the device in place in memory, they have
NOTHING to do with the driver binding to the device.  Even if you have a
refcount on a device, the driver can be unbound.

thanks,

greg k-h
