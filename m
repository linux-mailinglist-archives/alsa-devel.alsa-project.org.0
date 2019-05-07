Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7316536
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 15:56:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FC2017C5;
	Tue,  7 May 2019 15:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FC2017C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557237382;
	bh=ZsRUURU5LABow+IfP4AL0SqC2vHmVVqqL4IxXvRWEfU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JqWjCRYyEPJw58hrgyY+BIm44tNdhPf2ezqt3ubTueoNmnaXZkMXur3miS3FNNuMA
	 hvKKY5eR32dDvBPFg5kt6/KLugPm9FQC5130nbv1RWyqpBDRjFGZzHaxyoOBtLQoyO
	 YZz3mg1WdMf0WoFvYPsC051QJ8yUfTwvki8KIXHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C98B8F89673;
	Tue,  7 May 2019 15:54:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDDA1F89674; Tue,  7 May 2019 15:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BD25F89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 15:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BD25F89671
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 06:54:30 -0700
X-ExtLoop1: 1
Received: from asakoono-mobl.gar.corp.intel.com (HELO [10.251.159.132])
 ([10.251.159.132])
 by fmsmga005.fm.intel.com with ESMTP; 07 May 2019 06:54:27 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-3-pierre-louis.bossart@linux.intel.com>
 <20190504065444.GC9770@kroah.com>
 <c675ea60-5bfa-2475-8878-c589b8d20b32@linux.intel.com>
 <20190506151953.GA13178@kroah.com> <20190506162208.GI3845@vkoul-mobl.Dlink>
 <be72bbb1-b51f-8201-fdff-958836ed94d1@linux.intel.com>
 <20190507051959.GC16052@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fde9c4cd-518b-cb67-5b05-1608c9d029e4@linux.intel.com>
Date: Tue, 7 May 2019 08:54:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507051959.GC16052@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 2/7] soundwire: add Slave sysfs support
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



On 5/7/19 12:19 AM, Vinod Koul wrote:
> On 06-05-19, 11:46, Pierre-Louis Bossart wrote:
>> On 5/6/19 11:22 AM, Vinod Koul wrote:
>>> On 06-05-19, 17:19, Greg KH wrote:
>>>> On Mon, May 06, 2019 at 09:42:35AM -0500, Pierre-Louis Bossart wrote:
>>>>>>> +
>>>>>>> +int sdw_sysfs_slave_init(struct sdw_slave *slave)
>>>>>>> +{
>>>>>>> +	struct sdw_slave_sysfs *sysfs;
>>>>>>> +	unsigned int src_dpns, sink_dpns, i, j;
>>>>>>> +	int err;
>>>>>>> +
>>>>>>> +	if (slave->sysfs) {
>>>>>>> +		dev_err(&slave->dev, "SDW Slave sysfs is already initialized\n");
>>>>>>> +		err = -EIO;
>>>>>>> +		goto err_ret;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	sysfs = kzalloc(sizeof(*sysfs), GFP_KERNEL);
>>>>>>
>>>>>> Same question as patch 1, why a new device?
>>>>>
>>>>> yes it's the same open. In this case, the slave devices are defined at a
>>>>> different level so it's also confusing to create a device to represent the
>>>>> slave properties. The code works but I am not sure the initial directions
>>>>> are correct.
>>>>
>>>> You can just make a subdir for your attributes by using the attribute
>>>> group name, if a subdirectory is needed just to keep things a bit more
>>>> organized.
>>>
>>> The key here is 'a subdir' which is not the case here. We did discuss
>>> this in the initial patches for SoundWire which had sysfs :)
>>>
>>> The way MIPI disco spec organized properties, we have dp0 and dpN
>>> properties each of them requires to have a subdir of their own and that
>>> was the reason why I coded it to be creating a device.
>>
>> Vinod, the question was not for dp0 and dpN, it's fine to have
>> subdirectories there, but rather why we need separate devices for the master
>> and slave properties.
> 
> Slave does not have a separate device. IIRC the properties for Slave are
> in /sys/bus/soundwire/device/<slave>/...

I am not sure this is correct

ACPI defines the slaves devices under
/sys/bus/acpi/PRP0001, e.g.

/sys/bus/acpi/devices/PRP00001:00/device:17# ls
adr                                 mipi-sdw-dp-5-sink-subproperties
intel-endpoint-descriptor-0         mipi-sdw-dp-6-source-subproperties
intel-endpoint-descriptor-1         mipi-sdw-dp-7-sink-subproperties
mipi-sdw-dp-0-subproperties         mipi-sdw-dp-8-source-subproperties
mipi-sdw-dp-1-sink-subproperties    path
mipi-sdw-dp-1-source-subproperties  physical_node
mipi-sdw-dp-2-sink-subproperties    power
mipi-sdw-dp-2-source-subproperties  subsystem
mipi-sdw-dp-3-sink-subproperties    uevent
mipi-sdw-dp-4-source-subproperties

but the sysfs for slaves is shown as
/sys/bus/acpi/devices/PRP00001:00/int-sdw.0/sdw:0:25d:700:0:0# ls
bank_delay_support  master_count             sink_ports
ch_prep_timeout     mipi_revision            source_ports
clk_stop_mode1      modalias                 src-dp2
clk_stop_timeout    p15_behave               src-dp4
dp0                 paging_support           subsystem
driver              power                    test_mode_capable
firmware_node       reset_behave             uevent
hda_reg             simple_clk_stop_capable  wake_capable
high_PHY_capable    sink-dp1
index_reg           sink-dp3

and in sys/bus/soundwire/devices/sdw:0:25d:700:0:0# ls
bank_delay_support  master_count             sink_ports
ch_prep_timeout     mipi_revision            source_ports
clk_stop_mode1      modalias                 src-dp2
clk_stop_timeout    p15_behave               src-dp4
dp0                 paging_support           subsystem
driver              power                    test_mode_capable
firmware_node       reset_behave             uevent
hda_reg             simple_clk_stop_capable  wake_capable
high_PHY_capable    sink-dp1
index_reg           sink-dp3

So I would think we *do* create a new device for each slave instead of 
using the one that's already exposed by ACPI.

> 
> For master yes we can skip the device creation, it was done for
> consistency sake of having these properties ties into sys/bus/soundwire/
> 
> I don't mind if they are shown up in respective device node (PCI/platform
> etc) /sys/bus/foo/device/<>
> 
> But for creating subdirectories you would need the new dpX devices.

yes, that's agreed.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
