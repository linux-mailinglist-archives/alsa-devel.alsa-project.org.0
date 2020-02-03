Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAD51505D3
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 13:04:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 572BA169E;
	Mon,  3 Feb 2020 13:03:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 572BA169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580731468;
	bh=6+DBSELUfD6Siqq6BaVQy+zTfgSM4jHGHPRXRAosJBE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mROCB8h43+hHOx2Oks5noSdK6jZHSVb3Zy3gIKRGrefLygPvMXnBEHC0q/IFrTD5D
	 rzItlOfPOlddFOzaCqjFdcO304aTDcPLG/Ip2wLereDfPUAbjKQw2gM3VZVWu6bOE6
	 I0Dm/T/7BPz1CvcqDnq/pPgPTKxBZP4tZGu6tCWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21C0DF8014C;
	Mon,  3 Feb 2020 13:02:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 218E7F80148; Mon,  3 Feb 2020 13:02:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BD1DF80051
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 13:02:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BD1DF80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ziu9ELIK"
Received: from localhost (unknown [223.226.103.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A40A20721;
 Mon,  3 Feb 2020 12:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580731355;
 bh=PPDsukE45fQxVX6fT70rED7RcfcSV9PORLLlbTFcosA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ziu9ELIK1IsVcjb6FRavjkNa73OCw5i8NUBbDZWg6BCG6+azoS1nR7J2zuAqfaoXi
 TyS2gS8EBUmCzmmT/4NkGv3ieoN+Lg02Ix/PE+ZlZWlBT0tfp/XguHt4hwS8TriGYw
 XOHsQVB/PG3xujML8V7UNSiLU8e5y4B+ndz8A4M8=
Date: Mon, 3 Feb 2020 17:32:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200203120229.GO2841@vkoul-mobl>
References: <20200114060959.GA2818@vkoul-mobl>
 <6635bf0b-c20a-7561-bcbf-4a480a077ae4@linux.intel.com>
 <20200118071257.GY2818@vkoul-mobl>
 <73907607-0763-576d-b24e-4773dfb15f0b@linux.intel.com>
 <20200128105036.GO2841@vkoul-mobl>
 <d9478d9b-68a9-3d2c-338e-ca02e81e218e@linux.intel.com>
 <20200129050817.GW2841@vkoul-mobl>
 <4c49c9d0-e7b7-6c9b-03b8-90a94bfd1407@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c49c9d0-e7b7-6c9b-03b8-90a94bfd1407@linux.intel.com>
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

On 29-01-20, 08:59, Pierre-Louis Bossart wrote:
> Hi Vinod,
> 
> > > > If I look at the calling sequence of the code (looked up the sof code on
> > > > github, topic/sof-dev-rebase), the sof code sound/soc/sof/intel/hda.c
> > > > invokes the sdw_intel_startup() and sdw_intel_probe() based on hardware
> > > > sequencing and further you call .init and .probe/startup of sdw_md_driver.
> > > > 
> > > > I really do not see why we need a sdw_md_driver object to do that. You can
> > > > easily have a another function exported by sdw_intel driver and you call
> > > > these and do same functionality without having a sdw_md_driver in
> > > > between.
> > > 
> > > I must admit I am beyond my comfort zone: I introduced this
> > > sdw_master_driver only based on Greg's recommendation to look at GreyBus.
> > 
> > Well the recommendation was to add a device, so adding sdw_master_device
> > was the right approach. But we don't need to add driver as well.
> 
> I provided two reasons below why we need one
> [1] ASoC use of dev->driver
> [2] PM hooks.
> 
> I would kindly ask that you re-check these points and reply on each, thank
> you. I did not remove them from my reply so that you don't have to go back
> to the previous emails.
> 
> > > That said, I have two key points that I should explain further.
> > > 
> > > When we started this work, we initially did not have a notion of 'master
> > > driver' coupled with the 'master_device'. But we faced a number of issues
> > > with ASoC registrations, which seemed to required a driver to be registered
> > > and associated with the device. We kept this part as a separate commit to
> > > make sure this requirement wasn't lost:
> > 
> > Yes ASoC does require the DAI driver as it holds a reference to it. That
> > was the reason we have a platform device and a platform driver for
> > "int-sdw".
> 
> no, it's not related to references, it's using the name, see [1]. And it's
> not related to the 'dai driver' which is a separate entity unrelated to
> devices.
> 
> > Would it make sense to keep this as is and then export the init and
> > startup APIs which can be invoked by SOF part for hardware
> > initialization. So driver loading is a separate step from hardware
> > initialization and sequencing.
> > 
> > Also you continue with the benefit of parent-child relations for this
> > device :) and pm should be simpler.
> 
> the parent-child relationship was used in all cases, I don't understand why
> things would be different, you still need to add hooks in the 'driver' for
> the pm of the 'master' child device, be it a platform device or not.
> 
> > Btw this helps if ever in future you have a separate instance of sdw
> > controller that can be just hooked to acpi/pci/whatever device part and
> > driver works without big plumbing
> > 
> > > https://github.com/thesofproject/linux/commit/28b934ce9c165e095dac5cf71da5685768831337
> > > 
> 
> [1]
> 
> > > Looking back at my notes, this came from this piece of code:
> > > 
> > > static char *fmt_single_name(struct device *dev, int *id)
> > > {
> > > 	char *found, name[NAME_SIZE];
> > > 	int id1, id2;
> > > 
> > > 	if (dev_name(dev) == NULL)
> > > 		return NULL;
> > > 
> > > 	strlcpy(name, dev_name(dev), NAME_SIZE);
> > > 
> > > 	/* are we a "%s.%d" name (platform and SPI components) */
> > > 	found = strstr(name, dev->driver->name); <<< oops
> > > 
> > > so for ASoC, there is an expectation that each device does have a driver
> > > associated with it. Just for fun I reverted the commit above and that
> > > immediately trigger an kernel oops.

in the existing driver (the one on upstream atm), you have:

static struct platform_driver sdw_intel_drv = {
        .probe = intel_probe,
        .remove = intel_remove,
        .driver = {
                .name = "int-sdw",

        },
};

This is the DAI driver which registers the DAIs and and you pass on this
device, so for platform driver and above it should just work. That is
why my recommendation is to continue with this.

> 
> [2]
> 
> > > The other point that we came across is that PM support is only enabled
> > > thanks to a hook in the driver structure:
> > > 
> > > static const struct dev_pm_ops intel_pm = {
> > > 	SET_SYSTEM_SLEEP_PM_OPS(intel_suspend, intel_resume)
> > > 	SET_RUNTIME_PM_OPS(intel_suspend_runtime, intel_resume_runtime, NULL)
> > > };
> > > 
> > > struct sdw_master_driver intel_sdw_driver = {
> > > 	.driver = {
> > > 		.name = "intel-sdw",
> > > 		.owner = THIS_MODULE,
> > > 		.bus = &sdw_bus_type,
> > > 		.pm = &intel_pm, <<<<
> > > 	},
> > > 	.probe = intel_master_probe,
> > > 	.startup = intel_master_startup,
> > > 	.process_wake_event = intel_master_process_wakeen_event,
> > > 	.remove = intel_master_remove,
> > > };
> > > 
> > > I am not aware of any other way to do this.

Again, you can add this to platform_driver sdw_intel_drv.

> 
> I suggested a minimal way of using the 'device_driver' directly in
> https://github.com/thesofproject/linux/pull/1755
> 
> > > > So to summarize, my recommendation would be to drop sdw_md_driver, keep
> > > > sdw_master_device object and make sdw_master_device_add() hidden to
> > > > driver and call it from sdw_add_bus_master() and keep intel specific
> > > > startup/init routine which do same steps as they have now.
> > > 
> > > I am afraid the sequence you suggest is not technically possible:
> > > sdw_add_bus_master() requires a device to be created already, see e.g. how
> > > it's used by Qualcomm:
> > > 
> > > https://github.com/thesofproject/linux/blob/4026efd12ac983d363fb43c37a8af741a2c90dc8/drivers/soundwire/qcom.c#L811
> > > 
> > > sdw_add_bus_master() is called from the platform device probe.
> > > I cannot insert a device creation in this code.
> > 
> > So there are two things, lets discuss them independently. One is the
> > device behind the controller object. I think I have given a
> > recommendation above to keep the existing platform device for "int-sdw".
> > This device can be PCI/ACPI/OF/Platform, we typically should not worry
> > about it.
> 
> I don't understand how a platform device can be PCI/ACPI/OF? what did you
> mean here?

What I meant is that keep the existing platform device for "int-sdw".

And

a master device for everyone across x86/arm/etc spectrum would be
PCI/ACPI/OF/Platform and we should be agnostic and let these drivers add
a bus and register that

> > Second is we create the bus instance and that also create the
> > sdw_master_device to represent the soundwire master device in sysfs,
> > since this would be done by soundwire core (as I suggested), it would be
> > independent of which type of driver is invoking this. In fact this needs
> > to be completely independent of the driver calling this.
> > 
> > Intel code will call sdw_add_bus_master() and we would create a
> > sdw_master_device for it and add the representation. So would the qcom
> > code (btw with this, we wont need to do anything on qc code and it
> > 'should just work (tm)'.
> > 
> > > It'd actually be counter productive to add device management at the bus
> > > level, since we'd soon have incompatibilities between Intel, Qualcomm and
> > > others. What is platform-specific should be handled outside of the bus
> > > layer.
> > 
> > The vision I am thinking is that sdw_master_device is a representation
> > of master for everyone independent of the platform it is being used.
> > 
> > Let me know if this helps
> 
> Sorry no, your reply just confused me completely.
> 
> The recommendation from Greg was "remove platform devices". Here's the quote
> from his May 9, 2019 reply:
> 
> "So soundwire is creating platform devices?  Ick, no!  Don't do that,
> create a "real" device that is the root of your bus and attach that to
> the platform/pci/whatever device that is the parent of that device's
> resources."

Is soundwire subsystem creating platform devices, answer is no.

The problem is we were using the master device (platform/of/pci/etc) for
our own sysfs attributes, which was a mistake and I want to rectify
that.

The device behind the soundwire controller can be anything. If hardware
creates a device for soundwire we should continue using that

> If your suggestion is to keep platform devices as currently done, then I
> will kindly ask that you speak with Greg and let me know what the agreement
> is.
> 
> The second part of your reply gets more confusing, you are suggesting that
> "Intel code will call sdw_add_bus_master() and we would create a
> sdw_master_device for it and add the representation". That is in direct
> contradiction with the notion of using platform devices. And it would by
> construction break the Qualcomm controller code just merged weeks ago. Are
> you suggesting I start changing Qualcomm code? Or that we add a new function
> that does device creation+bus addition in one shot?
> 
> And last you didn't acknowledge my two technical points as to why a driver
> is needed for this sdw_master_device.
> 
> So I am back to scratching my head on what the direction is? I just do not
> understand your line of thought.

Sorry to confuse you, I guess somewhere I missed to communicate that
1. keep existing platform device for master (that solves your pm and
asoc issue)
2. add a sdw_master device, but we dont need driver, use that device for
sdw sysfs attributes
3. If possible, have one api, rather than 2 for bus and master device
creation.

> Maybe we need to stop the long sentences and use this decision flow:
> 
> a) is the master device a platform device (Yes/No)?

For your case, yes. For QC case it will be of device

> b) if No for a) then
> b.1) is the master device created within sdw_add_bus_master()

If possible that would be great. All I am trying here is to avoid having
two APIs for registration and use a single APIs for drivers to call.

> b.2) is the master device created before calling sdw_add_bus_master()

IIUC, it should be called after, right?

> 
> Can you please clarify what your desired choices are on this last paragraph?

Let me know if this helped.

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
