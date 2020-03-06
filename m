Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 682A117B5F0
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 06:03:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAB2B9F6;
	Fri,  6 Mar 2020 06:02:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAB2B9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583470992;
	bh=6sr1GXeWcxh8uulsNZ+z96emjGkiXJiYD8JffXrajlY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sXPUrDU4OTv37gIhcfdHo5derf8OkE6RiWrwr/8lCxToPnsC4p90EPS3+9LhR4gI7
	 bYiEVCey/lSdt6JCcN7JoxymRGW5rc8D3VxbZiCXQF12riBzhzqpC133gYbHYjRcyF
	 UpATr5XW+652+S31zRrO1oKsnSC8ktG8hyWVQ/50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA7E7F801EC;
	Fri,  6 Mar 2020 06:01:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37FEFF801ED; Fri,  6 Mar 2020 06:01:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODYSUB_10,PRX_BODY_32,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFE8CF80126
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 06:01:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFE8CF80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W4/wgmwV"
Received: from localhost (unknown [122.178.250.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 68F302073D;
 Fri,  6 Mar 2020 05:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583470881;
 bh=6sr1GXeWcxh8uulsNZ+z96emjGkiXJiYD8JffXrajlY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W4/wgmwV9y81iRIqMj4cm8gQ1vsUUYeb9vsmJpGxmzfbObAhjTAwavNoQ/dimzvA5
 cZ99yGUvaSwndscqiYA+20ySjy+a5ob4axrjuo2gKcF2l5dn3AXpEuWtqJO0Q20oJF
 FlEaoykzgr/Mj1FcaLXsAaWX6m5yk0wJncmlSclU=
Date: Fri, 6 Mar 2020 10:31:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/8] soundwire: bus_type: add master_device/driver support
Message-ID: <20200306050115.GC4148@vkoul-mobl>
References: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
 <20200227223206.5020-2-pierre-louis.bossart@linux.intel.com>
 <20200303054136.GP4148@vkoul-mobl>
 <8a04eda6-cbcf-582f-c229-5d6e4557344b@linux.intel.com>
 <20200304095312.GT4148@vkoul-mobl>
 <05dbe43c-abf8-9d5a-d808-35bf4defe4ba@linux.intel.com>
 <20200305063646.GW4148@vkoul-mobl>
 <eb30ac49-788f-b856-6fcf-84ae580eb3c8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb30ac49-788f-b856-6fcf-84ae580eb3c8@linux.intel.com>
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

On 05-03-20, 06:46, Pierre-Louis Bossart wrote:
> 
> > > If you want a technical objection, let me restate what I already mentioned:
> > > 
> > > If you look at the hierarchy, we have
> > > 
> > > PCI device -> PCI driver
> > >    soundwire_master_device0
> > >       soundwire_slave(s) -> codec driver
> > >    ...
> > >    soundwire_master_deviceN
> > >       soundwire_slave(s) -> codec driver
> > > 
> > > You have not explained how I could possibly deal with power management
> > > without having a driver for the master_device(s). The pm_ops need to be
> > > inserted in a driver structure, which means we need a driver. And if we need
> > > a driver, then we might as well have a real driver with .probe .remove
> > > support, driver_register(), etc.
> > 
> > Please read the emails sent to you completely, including the reply on
> > 2nd patch of this series. I think i am repeating this 3rd or 4th time
> > now.  Am going to repeat this info here to help move things.
> > 
> > Why do you need a extra driver for this. Do you have another set of
> > device object and driver for DSP code? But you do manage that, right?
> > I am proposing to simplify the device model here and have only one
> > device (SOF PCI) and driver (SOF PCI driver), which is created by actual
> > bus (PCI here) as you have in rest of the driver like HDA, DSP etc.
> > 
> > I have already recommended is to make the int-sdw a module which is
> > invoked by SOF PCI driver code (thereby all code uses SOF PCI device and
> > SOF PCI driver) directly. The DSP in my time for skl was a separate
> > module but used the parent objects.
> >
> > The SOF sdw init (the place where sdw routines are invoked after DSP
> > load) can call sdw_probe and startup. Based on DSP sequencing you can
> > call these functions directly without waiting for extra device to be
> > probed etc.
> > 
> > I feel your flows will be greatly simplified as a result of this.
> 
> Not at all, no. This is not a simplification but an extremely invasive
> proposal.
> 
> The parent-child relationship is extremely useful for power management, and
> guarantees that the PCI device remains on while one or more of the masters
> are used, and conversely can suspend when all links are idle. I currently
> don't need to do anything, it's all taken care of by the framework.
> 
> If I have to do all the power management at the PCI device level, then I
> will need to keep track of which links are currently active. All these links
> are used independently, so it's racy as hell to keep track of the usage when
> the pm framework already does so quite elegantly. You really want to use the
> pm_runtime_get/put refcount for each master device, not manage them from the
> PCI level.

Not at all, you still can call pm_runtime_get/put() calls in sdw module
for PCI device. That doesn't change at all.

Only change is for suspend/resume you have callbacks from PCI driver
rather than pm core.

> I might add that I don't see the logic in having pm support at the Slave
> device level, but not at the master, and again at the PCI level. It's just
> simpler to handle pm at each level rather that fudge layers.
> 
> I would also remind you that the solution you developed while at Intel did
> in fact use the parent-child relationship for power management, and I
> remember very clearly having discussions with you on this. I don't see why
> replacing platform devices by master devices should change this design
> choice.

That was with the premise of a platform device, since that is no longer
the case, we have to adapt.

But you still have PCI->master dev->slave relation and actually not much
changes wrt that. You still need to enable pm for master device. Only
change in that master_dev will not have pm_ops. Again, it is same for
i2c/spi where we have pci|of dev -> adapter dev -> i2c dev.

> > Second issue of PM:
> >   You do manage the DSP PM right? Similar way.
> > So here I would expect you to add functions/callbacks from SOF driver to
> > this module and call PM routines from SOF PM routines allowing you to
> > suspend/resume. Similar way DSP used to be managed.  Something like:
> > .sdw_suspend .sdw_resume functions/callbacks which will do sdw specific
> > pm configurations. You do not need module specific pm_ops, you can do
> > the required steps in callbacks from SOF driver
> > 
> > Bonus, this can be tuned and called at the specific places in DSP
> > suspend/resume flow, which is something I suspect you would want.
> 
> No. The links can only be resumed when the DSP is fully powered. We've tried
> all sorts of optimizations already and worked with the hardware team on
> this.

And you can call links _exactly_ when DSP is up and additional
optimizations applied. You are not reliant on core sequencing.

> > For places which need dev/driver objects like sdw dai's please pass the
> > SOF PCI dev object.
> > 
> > Is there any other technical reason left unexplored/unexplained?
> > 
> > > I really don't see what's broken or unnecessary with these patches.
> > 
> > Adding a layer for Intel in common code is unnecessary IMO. As
> > demonstrated above you can use the intel specific callback to do the
> > same task in intel specific way. I would very much prefer that approach
> > to solve this
> > 
> > We definitely need a sdw_master_device for everyone, but I don't believe
> > we need a sdw_master_device for Intel or anyone else.
> 
> I will flip the argument: you can implement a lightweight master driver in
> no time. All you need is to move the code you currently have in the platform
> device .probe() to the master_device .probe(). Big deal, the overhead is
> negligible - and you don't need to add pm_ops if you don't need to.

And in that case will you have use for sdw_master_driver?

> I would add that you cannot possibly compare the two implementations.
> 
> Qualcomm has an extremely simple SoundWire link optimized for 2 PDM
> amplifiers connected to a SLIMbus codec, with a fixed bit allocation. There
> is currently no power management for this link.

Not upstream but planned to be implemented. And assumption above may not
be true always esp future chipsets. More support will come eventually
but none of that warrants the need of a sdw_master_driver.

> Intel has 4 links running in parallel and synchronized in hardware, with
> complicated power management, different flavors of clock-stop - some not
> controlled by the driver but by DSP firmware - , 5 hardware configurations
> (more coming) and 6 third-party devices (more coming).

Number of links are inconsequential to soundwire. For us it is just an
instance.

> You've got to give us some slack here, and leave us handle power management
> in the simplest possible way.

I still do not agree that it will cause additional complexities for you.

Thanks
-- 
~Vinod
