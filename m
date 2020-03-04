Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5CF178DD9
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 10:55:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ADD61667;
	Wed,  4 Mar 2020 10:54:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ADD61667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583315707;
	bh=al6ROfmc4GWY+WB4UFw/s4ysGd66Yfi3xwHfut8/AoQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aTmsbxkGQ3oDi135I8+S1dPn1ar+sWAxPdjzIGwvGyG6mHdqWaovqg+0Bw7TRXLXM
	 NCiUNVywFQBojua3Lw0aZnDtS1+wa2vTCaJAfoB8Y6GwxIui+HeLMEE+t8Yh3PcF3V
	 jOwxyu1dxRjMnL3n7rp8ZNPPDooifIAdUyTsfXdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1375F800D8;
	Wed,  4 Mar 2020 10:53:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3AF9F801ED; Wed,  4 Mar 2020 10:53:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F74AF800D8
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 10:53:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F74AF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0nX0oHLL"
Received: from localhost (unknown [122.181.220.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1749E2166E;
 Wed,  4 Mar 2020 09:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583315598;
 bh=al6ROfmc4GWY+WB4UFw/s4ysGd66Yfi3xwHfut8/AoQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0nX0oHLLKmQHLTABLL0cJ65yuRPNIwIPC8GYlo0CSQMhJNDKSHUNcpnq0VOPZBmi5
 5EzMdiDZWIWMmHT3wHRFz2daRDrenKTfZY/xGoc5TYSYYumjU7ygF918L57BJ1zfTm
 xjPSntdDQl3BnnlL/xAZSi8FLrQ+8aLH5bXDgtBs=
Date: Wed, 4 Mar 2020 15:23:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/8] soundwire: bus_type: add master_device/driver support
Message-ID: <20200304095312.GT4148@vkoul-mobl>
References: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
 <20200227223206.5020-2-pierre-louis.bossart@linux.intel.com>
 <20200303054136.GP4148@vkoul-mobl>
 <8a04eda6-cbcf-582f-c229-5d6e4557344b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a04eda6-cbcf-582f-c229-5d6e4557344b@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 03-03-20, 09:23, Pierre-Louis Bossart wrote:
> On 3/2/20 11:41 PM, Vinod Koul wrote:
> > On 27-02-20, 16:31, Pierre-Louis Bossart wrote:
> > > In the existing SoundWire code, Master Devices are not explicitly
> > > represented - only SoundWire Slave Devices are exposed (the use of
> > > capital letters follows the SoundWire specification conventions).
> > > 
> > > The SoundWire Master Device provides the clock, synchronization
> > > information and command/control channels. When multiple links are
> > > supported, a Controller may expose more than one Master Device; they
> > > are typically embedded inside a larger audio cluster (be it in an
> > > SOC/chipset or an external audio codec), and we need to describe it
> > > using the Linux device and driver model.  This will allow for
> > > configuration functions to account for external dependencies such as
> > > power rails, clock sources or wake-up mechanisms. This transition will
> > 
> > I dont not see that as a soundwire issue. The external dependencies
> > should be handled as any device would do in Linux kernel with subsystem
> > specific things for soundwire mechanisms like wake-up
> 
> There is nothing in the SoundWire specification that tells how a
> controller/master should interface with the rest of the SoC.
> 
> There are two ways of handling wake-ups
> a. 'normal' wakes handled internally by the master - that's what the regular
> clock stop does.
> b. PCI-based wakes. In that case, the wake is not detected at the SoundWire
> level - the IP is power-gated -, but comes from the PCI subsystem based on a
> level detector and needs to be notified to the SoundWire master. That's what
> I did.
> 
> Now you can claim that this case b) doesn't belong in the drivers/soundwire
> code, in which case my answer will be to move all the Intel controller code
> in sound/soc/sof/intel. I have no choice but to implement what's needed on
> the hardware I have.

Did you read the full para I replied? Let me quote that again..

> > I dont not see that as a soundwire issue. The external dependencies
> > should be handled as any device would do in Linux kernel 

So things which have external dependencies is first part like you said
clock, etc.. They are generic ones and should be handled with typical
kernel mechanisms available..

> > with subsystem
> > specific things for soundwire mechanisms like wake-up

And you didn't even read this where i have said subsystem specific
things for soundwire mechanisms like **wake-up**

So that means I am okay with have wakeup mechanisms for sdw within
subsystem.

And you want to move code, feel free to do that with my NAK!

Please read emails completely before screaming away! Not a
great way to start the conversation

> > Intel has a big controller with HDA, DSP and Soundwire clubbed together,
> > I dont think we should burden the susbstem due to hw design
> > 
> > > also allow for better sysfs support without the reference count issues
> > > mentioned in the initial reviews.
> > > 
> > > In this patch, we convert the existing code to use an explicit
> > > sdw_slave_type, then define new objects (sdw_master_device and
> > > sdw_master_driver).
> > 
> > Thanks for sdw_master_device, that is required and fully agreed upon.
> > What is not agreed is the sdw_master_driver. We do not need that.
> 
> I will respectfully ask that you have a conversation with Greg on this one.
> These patches were reviewed as 'sane', I am not going to go back on this
> without an agreement on directions.
> 
> > 
> > As we have discussed your proposal with Greg and aligned (quoting that
> > here) on following device model for Intel and ARM:
> > 
> > >   - For DT cases we will have:
> > >          -> soundwire DT device (soundwire DT driver)
> > >             -> soundwire master device
> > >                -> soundwire slave device (slave drivers)
> > >   - For Intel case, you would have:
> > >          -> HDA PCI device (SOF driver + soundwire module)
> > >             -> soundwire master device
> > >                -> soundwire slave device (slave drivers)
> > 
> > But you have gone ahead and kept the sdw_master_driver which does not fit
> > into rest of the world except Intel.
> 
> I followed Greg's guidance. There was nothing in the thread with Greg that
> hinted as a required change.
> If you don't agree with Greg, please talk with him.

Were the above lines agreed or not? Do you see driver for master devices
or not? Greg was okay with as well as these patches but I am not okay
with the driver part for master, so I would like to see that removed.

Different reviewers can have different reasons.. I have given bunch of
reasons here, BUT I have not seen a single technical reason why this
cannot be done.

> > I think I am okay with rest of proposal, except this one, so can you
> > remove this and we can make progress. This issue is lingering since Oct!
> 
> Yes indeed, and we just circled once more.
> 
> > > A parent (such as the Intel audio controller or its equivalent on
> > > Qualcomm devices) would use sdw_master_device_add() to create the
> > > device, passing a driver name as a parameter. The master device would
> > > be released when device_unregister() is invoked by the parent.
> > 
> > We already have a DT driver for soundwire master! We dont need another
> > layer which does not add value!
> 
> Talk with Greg please.
> 
> > 
> > > Note that since there is no standard for the Master host-facing
> > > interface, so the bus matching relies on a simple string matching (as
> > > previously done with platform devices).
> > > 
> > > The 'Master Device' driver exposes callbacks for
> > > probe/startup/shutdown/remove/process_wake. The startup and process
> > > wake need to be called by the parent directly (using wrappers), while
> > > the probe/shutdown/remove are handled by the SoundWire bus core upon
> > > device creation and release.
> > 
> > these are added to handle intel DSP and sequencing issue, rest of the
> > world does not have these issues and does not needs them!
> 
> They are not required, don't use them if you don't need them?
> What's wrong with this approach?

I would like to see everyone use similar mechanism, Can you give me
reasons why you absolutely need master_driver? I don't want to see vendor
specific mechanisms in subsystem unless it is an absolute must have.
This case doesn't fall into that category.

As I have told you couple of times earlier, you can remove the
sdw_master_driver and call the functions directly, that solves your
problem but somehow i see reluctance on that. Can you tell me technical
reason for not doing that

> > > Additional callbacks will be added in the future for e.g. autonomous
> > > clock stop modes.
> > 
> > Yes these would be required, these can be added in sdw_master_device
> > too, I dont see them requiring a dummy driver layer..
> 
> Again talk with Greg.
> 
> > > @@ -113,8 +152,6 @@ static int sdw_drv_probe(struct device *dev)
> > >   	slave->probed = true;
> > >   	complete(&slave->probe_complete);
> > > -	dev_dbg(dev, "probe complete\n");
> > > -
> > 
> > This does not seem to belong to this patch.

This was not answered

> > 
> > > +struct device_type sdw_master_type = {
> > > +	.name =		"soundwire_master",
> > > +	.release =	sdw_master_device_release,
> > > +};
> > > +
> > > +struct sdw_master_device
> > > +*sdw_master_device_add(const char *master_name,
> > > +		       struct device *parent,
> > > +		       struct fwnode_handle *fwnode,
> > > +		       int link_id,
> > > +		       void *pdata)
> > > +{
> > > +	struct sdw_master_device *md;
> > > +	int ret;
> > > +
> > > +	md = kzalloc(sizeof(*md), GFP_KERNEL);
> > > +	if (!md)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	md->link_id = link_id;
> > > +	md->pdata = pdata;
> > > +	md->master_name = master_name;
> > 
> > should we not allocate the memory here for master_name?

And this wasn't either!

> > 
> > > +
> > > +	init_completion(&md->probe_complete);
> > > +
> > > +	md->dev.parent = parent;
> > > +	md->dev.fwnode = fwnode;
> > > +	md->dev.bus = &sdw_bus_type;
> > > +	md->dev.type = &sdw_master_type;
> > > +	md->dev.dma_mask = md->dev.parent->dma_mask;
> > > +	dev_set_name(&md->dev, "sdw-master-%d", md->link_id);
> > 
> > why do we need master_name if we are setting this here?
> 
> for the matching needed to find a driver.
> 
> > 
> > > +
> > > +	ret = device_register(&md->dev);
> > > +	if (ret) {
> > > +		dev_err(parent, "Failed to add master: ret %d\n", ret);
> > > +		/*
> > > +		 * On err, don't free but drop ref as this will be freed
> > > +		 * when release method is invoked.
> > > +		 */
> > > +		put_device(&md->dev);
> > > +		return ERR_PTR(-ENOMEM);
> > 
> > ENOMEM?
> 
> no, this function returns a pointer.

Yes but why should it be ENOMEM? That is incorrect and you are hiding
the actual reason..
It should be:
        return ERR_PTR(ret)

> > > +int sdw_master_device_startup(struct sdw_master_device *md)
> > > +{
> > > +	struct sdw_master_driver *mdrv;
> > > +	struct device *dev;
> > > +	int ret = 0;
> > > +
> > > +	if (IS_ERR_OR_NULL(md))
> > > +		return -EINVAL;
> > > +
> > > +	dev = &md->dev;
> > > +	mdrv = drv_to_sdw_master_driver(dev->driver);
> > > +
> > > +	if (mdrv && mdrv->startup)
> > > +		ret = mdrv->startup(md);
> > > +
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(sdw_master_device_startup);
> > 
> > who invokes this and when, can you add kernel-doc style documentation to
> > all APIs exported
> 
> ok
> 
> > 
> > > +int sdw_master_device_process_wake_event(struct sdw_master_device *md)
> > > +{
> > > +	struct sdw_master_driver *mdrv;
> > > +	struct device *dev;
> > > +	int ret = 0;
> > > +
> > > +	if (IS_ERR_OR_NULL(md))
> > > +		return -EINVAL;
> > > +
> > > +	dev = &md->dev;
> > > +	mdrv = drv_to_sdw_master_driver(dev->driver);
> > > +
> > > +	if (mdrv && mdrv->process_wake_event)
> > > +		ret = mdrv->process_wake_event(md);
> > > +
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(sdw_master_device_process_wake_event);
> > 
> > Documentation required
> 
> ok
> 
> > 
> > > +/**
> > > + * struct sdw_master_device - SoundWire 'Master Device' representation
> > > + *
> > > + * @dev: Linux device for this Master
> > > + * @master_name: Linux driver name
> > > + * @driver: Linux driver for this Master (set by SoundWire core during probe)
> > > + * @probe_complete: used by parent if synchronous probe behavior is needed
> > > + * @link_id: link index as defined by MIPI DisCo specification
> > > + * @pm_runtime_suspended: flag to restore pm_runtime state after system resume
> > > + * @pdata: private data typically provided with sdw_master_device_add()
> > > + */
> > > +
> > > +struct sdw_master_device {
> > > +	struct device dev;
> > > +	const char *master_name;
> > > +	struct sdw_master_driver *driver;
> > > +	struct completion probe_complete;
> > > +	int link_id;
> > > +	bool pm_runtime_suspended;
> > 
> > why not use runtime_pm apis like pm_runtime_suspended()
> 
> that's exactly what we do, we store the value on pm_runtime_suspended() and
> use it on resume.

Why store when you can query?

> > > +/**
> > > + * sdw_master_device_add() - create a Linux Master Device representation.
> > > + *
> > > + * @master_name: Linux driver name
> > > + * @parent: the parent Linux device (e.g. a PCI device)
> > > + * @fwnode: the parent fwnode (e.g. an ACPI companion device to the parent)
> > > + * @link_id: link index as defined by MIPI DisCo specification
> > > + * @pdata: private data (e.g. register base, offsets, platform quirks, etc).
> > > + */
> > > +struct sdw_master_device
> > > +*sdw_master_device_add(const char *master_name,
> > > +		       struct device *parent,
> > > +		       struct fwnode_handle *fwnode,
> > > +		       int link_id,
> > > +		       void *pdata);
> > > +
> > > +/**
> > > + * sdw_master_device_startup() - startup hardware
> > > + *
> > > + * @md: Linux Soundwire master device
> > 
> > Please add more useful comments like when this API would be invoked and
> > what shall be expected outcome
> 
> Huh, that's pretty much self-explanatory? device_add() adds a device and if
> there's a driver for it the probe will be called. Nothing fancy or
> earth-shattering.

As I have asked before, pls document when this API would be invoked, at
the time hw is ready or before.., before providing clock/power..,
before/after bus init..?

This cannot be called anyplace and needs to be called before/after
certain steps and that needs to be documented!
 
> > > + */
> > > +int sdw_master_device_startup(struct sdw_master_device *md);
> > > +
> > > +/**
> > > + * sdw_master_device_process_wake_event() - handle external wake
> > > + * event, e.g. handled at the PCI level
> > > + *
> > > + * @md: Linux Soundwire master device
> > > + */
> > > +int sdw_master_device_process_wake_event(struct sdw_master_device *md);
> > > +
> > 
> > If you look at existing headers the documentation is in C files for
> > APIs, so can you move them over.
> > 
> > When adding stuff please look at the rest of the code as an example.
> 
> isn't it more clear when the prototypes come with the documentation, rather
> than the kernel doc stuff be buried in pages of code?

Not to me, I want to see these in the code and compare! As I have said
when adding stuff please look at the rest of the code as an example,
everywhere else in the subsystem.

-- 
~Vinod
