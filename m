Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAF5177AA9
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 16:39:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B6EA1660;
	Tue,  3 Mar 2020 16:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B6EA1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583249957;
	bh=/UZer4y7FzuEtgMknFavye/RHnzX6epJ+Nqq9NFkEt4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HOXi+eKY3oO6YQUL/Tdc94M1/Zf0rP4oqf+gPvBHvQA7PnLhqG9iSXB3ypnSGYv8I
	 McG6+jiuwYIO546Qiqbb/oNF6pI3d6P6DXiwjrqzjrXD6x/j6Swq5Lx0I2T8nm0krF
	 y7ElOTBaIaq+YnkHRecyCoCxiH3cA1xv4rAwG8c0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EDACF8027C;
	Tue,  3 Mar 2020 16:37:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B158F8027C; Tue,  3 Mar 2020 16:37:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03090F8011C
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 16:37:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03090F8011C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 07:37:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="412777795"
Received: from jinzhiti-mobl2.amr.corp.intel.com (HELO [10.255.230.140])
 ([10.255.230.140])
 by orsmga005.jf.intel.com with ESMTP; 03 Mar 2020 07:37:45 -0800
Subject: Re: [PATCH 1/8] soundwire: bus_type: add master_device/driver support
To: Vinod Koul <vkoul@kernel.org>
References: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
 <20200227223206.5020-2-pierre-louis.bossart@linux.intel.com>
 <20200303054136.GP4148@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8a04eda6-cbcf-582f-c229-5d6e4557344b@linux.intel.com>
Date: Tue, 3 Mar 2020 09:23:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303054136.GP4148@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 3/2/20 11:41 PM, Vinod Koul wrote:
> On 27-02-20, 16:31, Pierre-Louis Bossart wrote:
>> In the existing SoundWire code, Master Devices are not explicitly
>> represented - only SoundWire Slave Devices are exposed (the use of
>> capital letters follows the SoundWire specification conventions).
>>
>> The SoundWire Master Device provides the clock, synchronization
>> information and command/control channels. When multiple links are
>> supported, a Controller may expose more than one Master Device; they
>> are typically embedded inside a larger audio cluster (be it in an
>> SOC/chipset or an external audio codec), and we need to describe it
>> using the Linux device and driver model.  This will allow for
>> configuration functions to account for external dependencies such as
>> power rails, clock sources or wake-up mechanisms. This transition will
> 
> I dont not see that as a soundwire issue. The external dependencies
> should be handled as any device would do in Linux kernel with subsystem
> specific things for soundwire mechanisms like wake-up

There is nothing in the SoundWire specification that tells how a 
controller/master should interface with the rest of the SoC.

There are two ways of handling wake-ups
a. 'normal' wakes handled internally by the master - that's what the 
regular clock stop does.
b. PCI-based wakes. In that case, the wake is not detected at the 
SoundWire level - the IP is power-gated -, but comes from the PCI 
subsystem based on a level detector and needs to be notified to the 
SoundWire master. That's what I did.

Now you can claim that this case b) doesn't belong in the 
drivers/soundwire code, in which case my answer will be to move all the 
Intel controller code in sound/soc/sof/intel. I have no choice but to 
implement what's needed on the hardware I have.

> 
> 
> Intel has a big controller with HDA, DSP and Soundwire clubbed together,
> I dont think we should burden the susbstem due to hw design
> 
>> also allow for better sysfs support without the reference count issues
>> mentioned in the initial reviews.
>>
>> In this patch, we convert the existing code to use an explicit
>> sdw_slave_type, then define new objects (sdw_master_device and
>> sdw_master_driver).
> 
> Thanks for sdw_master_device, that is required and fully agreed upon.
> What is not agreed is the sdw_master_driver. We do not need that.

I will respectfully ask that you have a conversation with Greg on this 
one. These patches were reviewed as 'sane', I am not going to go back on 
this without an agreement on directions.

> 
> As we have discussed your proposal with Greg and aligned (quoting that
> here) on following device model for Intel and ARM:
> 
>>   - For DT cases we will have:
>>          -> soundwire DT device (soundwire DT driver)
>>             -> soundwire master device
>>                -> soundwire slave device (slave drivers)
>>   - For Intel case, you would have:
>>          -> HDA PCI device (SOF driver + soundwire module)
>>             -> soundwire master device
>>                -> soundwire slave device (slave drivers)
> 
> But you have gone ahead and kept the sdw_master_driver which does not fit
> into rest of the world except Intel.

I followed Greg's guidance. There was nothing in the thread with Greg 
that hinted as a required change.
If you don't agree with Greg, please talk with him.

> 
> I think I am okay with rest of proposal, except this one, so can you
> remove this and we can make progress. This issue is lingering since Oct!

Yes indeed, and we just circled once more.

>> A parent (such as the Intel audio controller or its equivalent on
>> Qualcomm devices) would use sdw_master_device_add() to create the
>> device, passing a driver name as a parameter. The master device would
>> be released when device_unregister() is invoked by the parent.
> 
> We already have a DT driver for soundwire master! We dont need another
> layer which does not add value!

Talk with Greg please.

> 
>> Note that since there is no standard for the Master host-facing
>> interface, so the bus matching relies on a simple string matching (as
>> previously done with platform devices).
>>
>> The 'Master Device' driver exposes callbacks for
>> probe/startup/shutdown/remove/process_wake. The startup and process
>> wake need to be called by the parent directly (using wrappers), while
>> the probe/shutdown/remove are handled by the SoundWire bus core upon
>> device creation and release.
> 
> these are added to handle intel DSP and sequencing issue, rest of the
> world does not have these issues and does not needs them!

They are not required, don't use them if you don't need them?
What's wrong with this approach?

>> Additional callbacks will be added in the future for e.g. autonomous
>> clock stop modes.
> 
> Yes these would be required, these can be added in sdw_master_device
> too, I dont see them requiring a dummy driver layer..

Again talk with Greg.

>> @@ -113,8 +152,6 @@ static int sdw_drv_probe(struct device *dev)
>>   	slave->probed = true;
>>   	complete(&slave->probe_complete);
>>   
>> -	dev_dbg(dev, "probe complete\n");
>> -
> 
> This does not seem to belong to this patch.
> 
>> +struct device_type sdw_master_type = {
>> +	.name =		"soundwire_master",
>> +	.release =	sdw_master_device_release,
>> +};
>> +
>> +struct sdw_master_device
>> +*sdw_master_device_add(const char *master_name,
>> +		       struct device *parent,
>> +		       struct fwnode_handle *fwnode,
>> +		       int link_id,
>> +		       void *pdata)
>> +{
>> +	struct sdw_master_device *md;
>> +	int ret;
>> +
>> +	md = kzalloc(sizeof(*md), GFP_KERNEL);
>> +	if (!md)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	md->link_id = link_id;
>> +	md->pdata = pdata;
>> +	md->master_name = master_name;
> 
> should we not allocate the memory here for master_name?
> 
>> +
>> +	init_completion(&md->probe_complete);
>> +
>> +	md->dev.parent = parent;
>> +	md->dev.fwnode = fwnode;
>> +	md->dev.bus = &sdw_bus_type;
>> +	md->dev.type = &sdw_master_type;
>> +	md->dev.dma_mask = md->dev.parent->dma_mask;
>> +	dev_set_name(&md->dev, "sdw-master-%d", md->link_id);
> 
> why do we need master_name if we are setting this here?

for the matching needed to find a driver.

> 
>> +
>> +	ret = device_register(&md->dev);
>> +	if (ret) {
>> +		dev_err(parent, "Failed to add master: ret %d\n", ret);
>> +		/*
>> +		 * On err, don't free but drop ref as this will be freed
>> +		 * when release method is invoked.
>> +		 */
>> +		put_device(&md->dev);
>> +		return ERR_PTR(-ENOMEM);
> 
> ENOMEM?

no, this function returns a pointer.

> 
>> +int sdw_master_device_startup(struct sdw_master_device *md)
>> +{
>> +	struct sdw_master_driver *mdrv;
>> +	struct device *dev;
>> +	int ret = 0;
>> +
>> +	if (IS_ERR_OR_NULL(md))
>> +		return -EINVAL;
>> +
>> +	dev = &md->dev;
>> +	mdrv = drv_to_sdw_master_driver(dev->driver);
>> +
>> +	if (mdrv && mdrv->startup)
>> +		ret = mdrv->startup(md);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(sdw_master_device_startup);
> 
> who invokes this and when, can you add kernel-doc style documentation to
> all APIs exported

ok

> 
>> +int sdw_master_device_process_wake_event(struct sdw_master_device *md)
>> +{
>> +	struct sdw_master_driver *mdrv;
>> +	struct device *dev;
>> +	int ret = 0;
>> +
>> +	if (IS_ERR_OR_NULL(md))
>> +		return -EINVAL;
>> +
>> +	dev = &md->dev;
>> +	mdrv = drv_to_sdw_master_driver(dev->driver);
>> +
>> +	if (mdrv && mdrv->process_wake_event)
>> +		ret = mdrv->process_wake_event(md);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(sdw_master_device_process_wake_event);
> 
> Documentation required

ok

> 
>> +/**
>> + * struct sdw_master_device - SoundWire 'Master Device' representation
>> + *
>> + * @dev: Linux device for this Master
>> + * @master_name: Linux driver name
>> + * @driver: Linux driver for this Master (set by SoundWire core during probe)
>> + * @probe_complete: used by parent if synchronous probe behavior is needed
>> + * @link_id: link index as defined by MIPI DisCo specification
>> + * @pm_runtime_suspended: flag to restore pm_runtime state after system resume
>> + * @pdata: private data typically provided with sdw_master_device_add()
>> + */
>> +
>> +struct sdw_master_device {
>> +	struct device dev;
>> +	const char *master_name;
>> +	struct sdw_master_driver *driver;
>> +	struct completion probe_complete;
>> +	int link_id;
>> +	bool pm_runtime_suspended;
> 
> why not use runtime_pm apis like pm_runtime_suspended()

that's exactly what we do, we store the value on pm_runtime_suspended() 
and use it on resume.

> 
>> +/**
>> + * sdw_master_device_add() - create a Linux Master Device representation.
>> + *
>> + * @master_name: Linux driver name
>> + * @parent: the parent Linux device (e.g. a PCI device)
>> + * @fwnode: the parent fwnode (e.g. an ACPI companion device to the parent)
>> + * @link_id: link index as defined by MIPI DisCo specification
>> + * @pdata: private data (e.g. register base, offsets, platform quirks, etc).
>> + */
>> +struct sdw_master_device
>> +*sdw_master_device_add(const char *master_name,
>> +		       struct device *parent,
>> +		       struct fwnode_handle *fwnode,
>> +		       int link_id,
>> +		       void *pdata);
>> +
>> +/**
>> + * sdw_master_device_startup() - startup hardware
>> + *
>> + * @md: Linux Soundwire master device
> 
> Please add more useful comments like when this API would be invoked and
> what shall be expected outcome

Huh, that's pretty much self-explanatory? device_add() adds a device and 
if there's a driver for it the probe will be called. Nothing fancy or 
earth-shattering.

> 
>> + */
>> +int sdw_master_device_startup(struct sdw_master_device *md);
>> +
>> +/**
>> + * sdw_master_device_process_wake_event() - handle external wake
>> + * event, e.g. handled at the PCI level
>> + *
>> + * @md: Linux Soundwire master device
>> + */
>> +int sdw_master_device_process_wake_event(struct sdw_master_device *md);
>> +
> 
> If you look at existing headers the documentation is in C files for
> APIs, so can you move them over.
> 
> When adding stuff please look at the rest of the code as an example.

isn't it more clear when the prototypes come with the documentation, 
rather than the kernel doc stuff be buried in pages of code?

