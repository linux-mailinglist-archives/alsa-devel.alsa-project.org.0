Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D54C14BD6F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 17:04:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 759FC1670;
	Tue, 28 Jan 2020 17:03:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 759FC1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580227456;
	bh=QohGskfLWGc5F2sVNf8xuJ2M+EW92tbMPxKEqeiixLM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RaQxZbxArk3u38NpkYFXarnNPC5cDgIlnThKcYqSk3tlx/dy0VZBOMX8+WXR/vTvl
	 TiKPzJA3jjLH2uY2Cc8ASkZJQYC+0b0WL0+48w9042kn2283k5qpi9iiBagEVsbV1B
	 xWF7fWOAek7xvmMOMrPXr7V3u/vaLnhUn3j+xokA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86AF5F8014B;
	Tue, 28 Jan 2020 17:02:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AE0EF80150; Tue, 28 Jan 2020 17:02:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54127F800FF
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 17:02:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54127F800FF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 08:02:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="231991359"
Received: from cauduong-mobl1.amr.corp.intel.com (HELO [10.254.184.245])
 ([10.254.184.245])
 by orsmga006.jf.intel.com with ESMTP; 28 Jan 2020 08:02:20 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20200114060959.GA2818@vkoul-mobl>
 <6635bf0b-c20a-7561-bcbf-4a480a077ae4@linux.intel.com>
 <20200118071257.GY2818@vkoul-mobl>
 <73907607-0763-576d-b24e-4773dfb15f0b@linux.intel.com>
 <20200128105036.GO2841@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d9478d9b-68a9-3d2c-338e-ca02e81e218e@linux.intel.com>
Date: Tue, 28 Jan 2020 10:02:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128105036.GO2841@vkoul-mobl>
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



On 1/28/20 4:50 AM, Vinod Koul wrote:
> Hi Pierre,
> 
> I took some time to look into the overall code and how this is fitting
> into big picture and help recommend way forward.

Thanks Vinod, I appreciate the time you've taken to review this code.
This is constructive feedback.

> On 21-01-20, 11:31, Pierre-Louis Bossart wrote:
>>
>>
>>> A rename away from probe will certainly be very helpful as
>>> you would also agree that terms 'probe' and 'remove' have a very
>>> special meaning in kernel, so let us avoid these
>>
>> ok, so would the following be ok with you?
>>
>> /**
>>   * struct sdw_md_driver - SoundWire 'Master Device' driver
>>   *
>>   * @init: allocations and initializations (hardware may not be enabled yet)
>>   * @startup: initialization handled after the hardware is enabled, all
>>   * clock/power dependencies are available
>>   * @shutdown: cleanups before hardware is disabled (optional)
>>   * @exit: free all remaining resources
>>   * @autonomous_clock_stop_enable: enable/disable driver control while
>>   * in clock-stop mode, typically in always-on/D0ix modes. When the driver
>>   * yields control, another entity in the system (typically firmware
>>   * running on an always-on microprocessor) is responsible to tracking
>>   * Slave-initiated wakes
>>   */
>> struct sdw_md_driver {
>> 	int (*init)(struct sdw_master_device *md, void *link_ctx);
>> 	int (*startup)(struct sdw_master_device *md);
>> 	int (*shutdown)(struct sdw_master_device *md);
>> 	int (*exit)(struct sdw_master_device *md);
>> 	int (*autonomous_clock_stop_enable)(struct sdw_master_device *md,
>> 					    bool state);
>> };
> 
> So this is a soundwire core driver structure, but the modelling and
> explanation provided here suggests the reasoning to be based on hardware
> sequencing. I am not sure if we should follow this approach. Solving
> hardware sequencing is fine but that should IMO be restricted to intel
> code as that is intel issue which may or may not be present on other
> controllers.

I agree the directions are Intel-specific, there was no intention of 
requiring anyone to implement all these callbacks.

> If I look at the calling sequence of the code (looked up the sof code on
> github, topic/sof-dev-rebase), the sof code sound/soc/sof/intel/hda.c
> invokes the sdw_intel_startup() and sdw_intel_probe() based on hardware
> sequencing and further you call .init and .probe/startup of sdw_md_driver.
> 
> I really do not see why we need a sdw_md_driver object to do that. You can
> easily have a another function exported by sdw_intel driver and you call
> these and do same functionality without having a sdw_md_driver in
> between.

I must admit I am beyond my comfort zone: I introduced this 
sdw_master_driver only based on Greg's recommendation to look at GreyBus.

All I care about are the three steps of
a. creating a device (needed because the ACPI description does not model 
the master hardware)
b. doing the required initializations and allocations
c. exposing a startup callback, and provide room for expansion for 
future evolutions.

If there's a better way to do this I don't mind at all. The value-added 
of these patches is not in how the device/driver model is used but 
rather the hardware sequencing and power management.

That said, I have two key points that I should explain further.

When we started this work, we initially did not have a notion of 'master 
driver' coupled with the 'master_device'. But we faced a number of 
issues with ASoC registrations, which seemed to required a driver to be 
registered and associated with the device. We kept this part as a 
separate commit to make sure this requirement wasn't lost:

https://github.com/thesofproject/linux/commit/28b934ce9c165e095dac5cf71da5685768831337

Looking back at my notes, this came from this piece of code:

static char *fmt_single_name(struct device *dev, int *id)
{
	char *found, name[NAME_SIZE];
	int id1, id2;

	if (dev_name(dev) == NULL)
		return NULL;

	strlcpy(name, dev_name(dev), NAME_SIZE);

	/* are we a "%s.%d" name (platform and SPI components) */
	found = strstr(name, dev->driver->name); <<< oops

so for ASoC, there is an expectation that each device does have a driver 
associated with it. Just for fun I reverted the commit above and that 
immediately trigger an kernel oops.

The other point that we came across is that PM support is only enabled 
thanks to a hook in the driver structure:

static const struct dev_pm_ops intel_pm = {
	SET_SYSTEM_SLEEP_PM_OPS(intel_suspend, intel_resume)
	SET_RUNTIME_PM_OPS(intel_suspend_runtime, intel_resume_runtime, NULL)
};

struct sdw_master_driver intel_sdw_driver = {
	.driver = {
		.name = "intel-sdw",
		.owner = THIS_MODULE,
		.bus = &sdw_bus_type,
		.pm = &intel_pm, <<<<
	},
	.probe = intel_master_probe,
	.startup = intel_master_startup,
	.process_wake_event = intel_master_process_wakeen_event,
	.remove = intel_master_remove,
};

I am not aware of any other way to do this.

In short, I have two technical reasons we came across that made us rely 
on this 'master driver' object. I agree that the solution I suggested 
may not be very elegant or can be seen as overkill, but it does provide 
support for two integration requirements.

> Now, I am going to step back one more step and ask you why should we
> have a sdw_md_driver? I am not seeing the driver object achieving
> anything here expect adding wrappers which we can avoid. But we still
> need to add the sdw_master_device() as a new device object and use that
> for both sysfs representation as well as representing the master device
> and do all the things we want, but it *can* come without having
> accompanying sdw_md_driver.
> 
> This way you can retain you calling sequence and add the master device.
> 
> Stretching this one more step I would ask that maybe it is even better
> idea that we should hide sdw_master_device_add() calling for soundwire
> drivers and move that internal to bus as part of bus registration as
> well, I don't see sdw_master_device calling back into the driver so it
> should not impact your sequences as well.
> 
> Do you see a reason for sdw_md_driver which is must have? I couldn't
> find that by looking at the code, let me know if I have missed anything
> here.

Yes, the two reasons explained above.

That said, one possible compromize would be to remove those callbacks 
and indirections, such md->driver->remove(md);

we could perfectly export something like

intel_device_remove(md)

which would directly call the relevant functions. that would essentially 
remove the notion of 'sdw_master_driver' but keep the bare minimal 
driver structure that's needed.

Note that the removal of platform devices is not something I wanted to 
enforce across the board. If Qualcomm are happy with the platform 
devices, that's fine with me. I only want to work around the two 
limitations I mentioned (ACPI does not support masters, only 
controllers, and power rail dependencies).

> So to summarize, my recommendation would be to drop sdw_md_driver, keep
> sdw_master_device object and make sdw_master_device_add() hidden to
> driver and call it from sdw_add_bus_master() and keep intel specific
> startup/init routine which do same steps as they have now.

I am afraid the sequence you suggest is not technically possible: 
sdw_add_bus_master() requires a device to be created already, see e.g. 
how it's used by Qualcomm:

https://github.com/thesofproject/linux/blob/4026efd12ac983d363fb43c37a8af741a2c90dc8/drivers/soundwire/qcom.c#L811

sdw_add_bus_master() is called from the platform device probe.
I cannot insert a device creation in this code.

It'd actually be counter productive to add device management at the bus 
level, since we'd soon have incompatibilities between Intel, Qualcomm 
and others. What is platform-specific should be handled outside of the 
bus layer.

I hope this email clarifies some of my points?

I'll try to nooddle with the notion of bare minimum driver, that looks 
like a possible alternative that solves my problems and would address 
your concerns.

Thanks
-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
