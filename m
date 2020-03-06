Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0155117C792
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 22:07:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5798415E5;
	Fri,  6 Mar 2020 22:06:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5798415E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583528858;
	bh=2wbGoctd7FFtuFuqP2CK76ZFnUjIFRR/EhnvOCUi0MA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ETYx5jVffGrMomBtxF9QOjiDliUh3or/eUdJzX3xPMzF7rxH6//JJMcwPnJckzQv8
	 A+SveNOxftvyEz9CT99SBW2quzYWTd6FUodNPCfHgSP4dNZKuhvi7kCYOa221HjNeF
	 G9uc8ou8KnwZsSdlfiuQipGD7gpi7eMLYP4C8N84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79AF3F80126;
	Fri,  6 Mar 2020 22:05:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9600F80126; Fri,  6 Mar 2020 22:05:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6B61F80126
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 22:05:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6B61F80126
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2020 13:05:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,523,1574150400"; d="scan'208";a="275688904"
Received: from jrbond-mobl.amr.corp.intel.com (HELO [10.254.11.58])
 ([10.254.11.58])
 by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2020 13:05:43 -0800
Subject: Re: [PATCH 1/8] soundwire: bus_type: add master_device/driver support
To: Vinod Koul <vkoul@kernel.org>
References: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
 <20200227223206.5020-2-pierre-louis.bossart@linux.intel.com>
 <20200303054136.GP4148@vkoul-mobl>
 <8a04eda6-cbcf-582f-c229-5d6e4557344b@linux.intel.com>
 <20200304095312.GT4148@vkoul-mobl>
 <05dbe43c-abf8-9d5a-d808-35bf4defe4ba@linux.intel.com>
 <20200305063646.GW4148@vkoul-mobl>
 <eb30ac49-788f-b856-6fcf-84ae580eb3c8@linux.intel.com>
 <20200306050115.GC4148@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4fabb135-6fbb-106f-44fd-8155ea716c00@linux.intel.com>
Date: Fri, 6 Mar 2020 09:40:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200306050115.GC4148@vkoul-mobl>
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



>>> Why do you need a extra driver for this. Do you have another set of
>>> device object and driver for DSP code? But you do manage that, right?
>>> I am proposing to simplify the device model here and have only one
>>> device (SOF PCI) and driver (SOF PCI driver), which is created by actual
>>> bus (PCI here) as you have in rest of the driver like HDA, DSP etc.
>>>
>>> I have already recommended is to make the int-sdw a module which is
>>> invoked by SOF PCI driver code (thereby all code uses SOF PCI device and
>>> SOF PCI driver) directly. The DSP in my time for skl was a separate
>>> module but used the parent objects.
>>>
>>> The SOF sdw init (the place where sdw routines are invoked after DSP
>>> load) can call sdw_probe and startup. Based on DSP sequencing you can
>>> call these functions directly without waiting for extra device to be
>>> probed etc.
>>>
>>> I feel your flows will be greatly simplified as a result of this.
>>
>> Not at all, no. This is not a simplification but an extremely invasive
>> proposal.
>>
>> The parent-child relationship is extremely useful for power management, and
>> guarantees that the PCI device remains on while one or more of the masters
>> are used, and conversely can suspend when all links are idle. I currently
>> don't need to do anything, it's all taken care of by the framework.
>>
>> If I have to do all the power management at the PCI device level, then I
>> will need to keep track of which links are currently active. All these links
>> are used independently, so it's racy as hell to keep track of the usage when
>> the pm framework already does so quite elegantly. You really want to use the
>> pm_runtime_get/put refcount for each master device, not manage them from the
>> PCI level.
> 
> Not at all, you still can call pm_runtime_get/put() calls in sdw module
> for PCI device. That doesn't change at all.
> 
> Only change is for suspend/resume you have callbacks from PCI driver
> rather than pm core.
There are two other related issues that you didn't mention.

the ASoC layer does require a driver with a 'name' for the components 
registered with the master device. So if you don't have a driver for the 
master device, the DAIs will be associated with the PCI device.

But the ASoC core does make pm_runtime calls on its own,

soc_pcm_open(struct snd_pcm_substream *substream)
{
...
	for_each_rtd_components(rtd, i, component)
		pm_runtime_get_sync(component->dev);

and if the device that's associated with the DAI is the PCI device, then 
that will not result in the relevant master IP being activated, only the 
PCI device refcount will be increased - meaning there is no hook that 
would tell the PCI layer to turn on a specific link.

What you are recommending would be an all-or-nothing solution with all 
links on or all links off, which beats the purpose of having independent 
link-level power management.

Given these limitations, I am not willing to change directions on power 
management. We have a tried-and-tested solution, backed by months of 
validation, and you are sending down an unproven path with your suggestion.

So what are the options?

a) stay with the current approach and platform devices. Greg's vetoed 
this so we can move to the next one.

b) use a solution similar to what we suggested back in October, and very 
similar to the GreyBus host device, which creates a master device but 
did not require a full-blown master_driver, it only uses the name and 
pm_ops fields of the raw driver structure, which is all we really need.

the basic usage from the PCI layer was

struct driver {
    .name = "my-driver",
    .pm_ops = &my_ops,
} my_driver;

md = sdw_master_device_add(&my_driver, parent, fw_node, link_id)

and all the rest is platform-specific/optional.

sdw_intel_master_device_init(md);
      allocations and call to sdw_bus_master_add()
sdw_intel_master_device_startup(md);
      hardware enablement
sdw_intel_master_device_wake_process(md).
      deal with wake information coming from PCI layer.

We liked this solution since it was as simple as can be, but you 
rejected it on the grounds that the probe/init should be handled "by the 
core" to quote your own words, but looking back it may be the best 
solution for all. There is no additional overhead, and it deals with 
both the ALSA name requirement and lets us us power management. If you 
don't have power management at the link level you don't have to use the 
pm_ops.

c) use the proposal in this patch with a more elaborate driver handling. 
Yes it requires a full-blown driver with callbacks but it addresses your 
prior feedback that the core handles the probe/remove operations.

All these solutions are proven to work. Pick one.

If you want to suggest another, then please provide a pseudo API and 
address the non-negotiable requirement of independent link-level power 
management.

Thanks
-Pierre








