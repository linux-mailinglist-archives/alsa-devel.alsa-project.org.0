Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F2B20FA9A
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 19:30:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDF391663;
	Tue, 30 Jun 2020 19:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDF391663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593538230;
	bh=0E6+B2i1sF19iKIULXbiwWrThnH8UkXhUWE6ms81ZAA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vdsx4I12ZC1b74dtKfIn/0KATjMRFjeGSJCNSdDahQOiI81+ma0uwvaZnLsCu3pBX
	 UnTG9e9ijzE6Ky7MdOhR/YCGPimXveO36S0kPgYUf66P46Kat6VYkkMl6NA3xwfMtv
	 KBGDTTg19FWGg7Oj2ulf95wb+XEcIENjZN7E+ixc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5F6EF801D8;
	Tue, 30 Jun 2020 19:27:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38363F802BD; Tue, 30 Jun 2020 19:27:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33FEAF801D8
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 19:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33FEAF801D8
IronPort-SDR: BqPlXt2S2kqITdZL2FbWL6Ov2mwqMZStn9Isebf111g7J6TzLN9JSghoE12QV5c1LRhFdXgtgd
 ygJgHPsZQJgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="231190533"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="231190533"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 10:27:00 -0700
IronPort-SDR: Z7x4fpl5QBPCt0yGQhLxehb9wwa3icsJnhTonGBQYdcWh4ESmn32vMryMjX4d1BR7rQyQsa5TY
 7XQYwNFkx4CA==
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="281307477"
Received: from dnoeunx-mobl.amr.corp.intel.com (HELO [10.254.77.113])
 ([10.254.77.113])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 10:26:59 -0700
Subject: Re: [PATCH 8/9] soundwire: intel: add wake interrupt support
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
 <20200623173546.21870-9-yung-chuan.liao@linux.intel.com>
 <20200630165126.GT2599@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a69aa5d0-613a-6ef6-9263-378b1e99770a@linux.intel.com>
Date: Tue, 30 Jun 2020 12:18:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200630165126.GT2599@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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



On 6/30/20 11:51 AM, Vinod Koul wrote:
> On 24-06-20, 01:35, Bard Liao wrote:
>> From: Rander Wang <rander.wang@intel.com>
>>
>> When system is suspended in clock stop mode on intel platforms, both
>> master and slave are in clock stop mode and soundwire bus is taken
>> over by a glue hardware. The bus message for jack event is processed
>> by this glue hardware, which will trigger an interrupt to resume audio
>> pci device. Then audio pci driver will resume soundwire master and slave,
>> transfer bus ownership to master, finally slave will report jack event
>> to master and codec driver is triggered to check jack status.
>>
>> if a slave has been attached to a bus, the slave->dev_num_sticky
>> should be non-zero, so we can check this value to skip the
>> ghost devices defined in ACPI table but not populated in hardware.
>>
>> Signed-off-by: Rander Wang <rander.wang@intel.com>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> ---
>>   drivers/soundwire/intel.c      | 48 +++++++++++++++++++++++++++++++++-
>>   drivers/soundwire/intel.h      |  1 +
>>   drivers/soundwire/intel_init.c | 22 ++++++++++++++++
>>   3 files changed, 70 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>> index 06c553d94890..22d9fd3e34fa 100644
>> --- a/drivers/soundwire/intel.c
>> +++ b/drivers/soundwire/intel.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/io.h>
>>   #include <linux/platform_device.h>
>>   #include <sound/pcm_params.h>
>> +#include <linux/pm_runtime.h>
>>   #include <sound/soc.h>
>>   #include <linux/soundwire/sdw_registers.h>
>>   #include <linux/soundwire/sdw.h>
>> @@ -436,7 +437,7 @@ static int intel_shim_init(struct sdw_intel *sdw, bool clock_stop)
>>   	return ret;
>>   }
>>   
>> -static void __maybe_unused intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
>> +static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
> 
> why drop __maybe?

the __maybe was used in previous patches to avoid throwing 'defined but 
not used' errors.

In this patch this function is actually used so there's no longer a 
reason to keep it.

>>   {
>>   	void __iomem *shim = sdw->link_res->shim;
>>   	unsigned int link_id = sdw->instance;
>> @@ -1337,6 +1338,51 @@ static int intel_master_remove(struct platform_device *pdev)
>>   	return 0;
>>   }
>>   
>> +int intel_master_process_wakeen_event(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct sdw_intel *sdw;
>> +	struct sdw_bus *bus;
>> +	struct sdw_slave *slave;
>> +	void __iomem *shim;
>> +	u16 wake_sts;
>> +
>> +	sdw = platform_get_drvdata(pdev);
>> +	bus = &sdw->cdns.bus;
>> +
>> +	if (bus->prop.hw_disabled) {
>> +		dev_dbg(dev,
>> +			"SoundWire master %d is disabled, ignoring\n",
>> +			bus->link_id);
> 
> single line pls

ok

>> +		return 0;
>> +	}
>> +
>> +	shim = sdw->link_res->shim;
>> +	wake_sts = intel_readw(shim, SDW_SHIM_WAKESTS);
>> +
>> +	if (!(wake_sts & BIT(sdw->instance)))
>> +		return 0;
>> +
>> +	/* disable WAKEEN interrupt ASAP to prevent interrupt flood */
>> +	intel_shim_wake(sdw, false);
> 
> when & where is this enabled?

in follow-up patches where the clock-stop mode is enabled.

	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET ||
		   !clock_stop_quirks) {

		ret = sdw_cdns_clock_stop(cdns, true);
		if (ret < 0) {
			dev_err(dev, "cannot enable clock stop on suspend\n");
			return ret;
		}

		ret = sdw_cdns_enable_interrupt(cdns, false);
		if (ret < 0) {
			dev_err(dev, "cannot disable interrupts on suspend\n");
			return ret;
		}

		ret = intel_link_power_down(sdw);
		if (ret) {
			dev_err(dev, "Link power down failed: %d", ret);
			return ret;
		}

		intel_shim_wake(sdw, true);

>> +
>> +	/*
>> +	 * wake up master and slave so that slave can notify master
>> +	 * the wakeen event and let codec driver check codec status
>> +	 */
>> +	list_for_each_entry(slave, &bus->slaves, node) {
>> +		/*
>> +		 * discard devices that are defined in ACPI tables but
>> +		 * not physically present and devices that cannot
>> +		 * generate wakes
>> +		 */
>> +		if (slave->dev_num_sticky && slave->prop.wake_capable)
>> +			pm_request_resume(&slave->dev);
> 
> Hmmm, shouldn't slave do this? would it not make sense to notify the
> slave thru callback and then slave decides to resume or not..?

In this mode, the bus is clock-stop mode, and events are detected with 
level detector tied to PCI events. The master and slave devices are all 
in pm_runtime suspended states. The codec cannot make any decisions on 
its own since the bus is stopped, it needs to first resume, which 
assumes that the master resumes first and the enumeration re-done before 
it can access any of its registers.

By looping through the list of devices that can generate events, you 
end-up first forcing the master to resume, and then each slave resumes 
and can check who generated the event and what happened while suspended. 
if the codec didn't generate the event it will go back to suspended mode 
after the usual timeout.

We can add a callback but that callback would only be used for Intel 
solutions, but internally it would only do a pm_request_resume() since 
the codec cannot make any decisions before first resuming. In other 
words, it would be an Intel-specific callback that is implemented using 
generic resume operations. It's probably better to keep this in 
Intel-specific code, no?



