Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE2B11E727
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 16:57:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1298F16A1;
	Fri, 13 Dec 2019 16:56:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1298F16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576252662;
	bh=DMV8yC+QAya1zjwpXl1VYckKydUWojzKQIYDRqg4Yb4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bxmWa6o4Eqswuu4VcHHLMRAFy2jAM3eLpdxHVSphHmp9dXfZ/PHZYaTO9iyiCNPS5
	 GvHaP2/0CPjFitDNLjFq2VumSWTl/10EuTNWBT0/Q0p58zLI3/krjkxVuirlcvFdHs
	 TJsOOoMIWRpCaFnn1rF4+QlpRstvkEz3iGr83m0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3697CF80259;
	Fri, 13 Dec 2019 16:54:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DA60F8023F; Fri, 13 Dec 2019 16:54:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1555F801F4
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 16:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1555F801F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 07:54:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="246170765"
Received: from dbmoens-mobl1.amr.corp.intel.com ([10.255.228.102])
 by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2019 07:54:19 -0800
To: Greg KH <gregkh@linuxfoundation.org>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
 <20191213050409.12776-9-pierre-louis.bossart@linux.intel.com>
 <20191213072844.GF1750354@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7431d8cf-4a09-42af-14f5-01ab3b15b47b@linux.intel.com>
Date: Fri, 13 Dec 2019 09:49:57 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191213072844.GF1750354@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 08/15] soundwire: add initial
 definitions for sdw_master_device
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

On 12/13/19 1:28 AM, Greg KH wrote:
> On Thu, Dec 12, 2019 at 11:04:02PM -0600, Pierre-Louis Bossart wrote:
>> Since we want an explicit support for the SoundWire Master device, add
>> the definitions, following the Grey Bus example.
> 
> "Greybus"  All one word please.

Ack, will fix.

>> @@ -59,9 +59,12 @@ int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>>   
>>   		if (add_uevent_var(env, "MODALIAS=%s", modalias))
>>   			return -ENOMEM;
>> +	} else if (is_sdw_md(dev)) {
> 
> Ok, "is_sdw_md()" is a horrid function name.  Spell it out please, this
> ends up in the global namespace.

ok, will use is_sdw_master_device.

> 
> Actually, why are you not using module namespaces here for this new
> code?  That would help you out a lot.

I must admit I don't understand the question. This is literally modeled 
after is_gb_host_device(), did I miss something in the Greybus 
implementation?

> 
>> +		/* this should not happen but throw an error */
>> +		dev_warn(dev, "uevent for Master device, unsupported\n");
> 
> Um, what?  This is supported as it will happen when you create such a
> device.  It's an issue of "I didn't write the code yet", not that it is
> not "supported".

I will remove, it cannot happen.

>> diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
>> new file mode 100644
>> index 000000000000..6210098c892b
>> --- /dev/null
>> +++ b/drivers/soundwire/master.c
>> @@ -0,0 +1,62 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> 
> Still with the crazy dual license?  I thought we went over this all
> before.
> 
> You can not do this for code that touches driver core stuff, like this.
> Please stop and just make all of this GPLv2 like we discussed months
> ago.

I don't recall this was the guidance but fine.

> 
>> +// Copyright(c) 2019 Intel Corporation.
>> +
>> +#include <linux/device.h>
>> +#include <linux/acpi.h>
>> +#include <linux/soundwire/sdw.h>
>> +#include <linux/soundwire/sdw_type.h>
>> +#include "bus.h"
>> +
>> +static void sdw_md_release(struct device *dev)
>> +{
>> +	struct sdw_master_device *md = to_sdw_master_device(dev);
>> +
>> +	kfree(md);
>> +}
>> +
>> +struct device_type sdw_md_type = {
>> +	.name =		"soundwire_master",
>> +	.release =	sdw_md_release,
>> +};
>> +
>> +struct sdw_master_device *sdw_md_add(struct sdw_md_driver *driver,
> 
> Bad function names, please spell things out, you have plenty of
> characters to go around.

This was modeled after gb_hd_create ;-)

sdw_master_device_add starts to be on the long side, no?


>> +				     struct device *parent,
>> +				     struct fwnode_handle *fwnode,
>> +				     int link_id)
>> +{
>> +	struct sdw_master_device *md;
>> +	int ret;
>> +
>> +	if (!driver->probe) {
>> +		dev_err(parent, "mandatory probe callback missing\n");
> 
> The callback is missing for the driver you passed in, not for the
> parent, right?

yes, this function is called as part of the parent probe.

>> +	ret = device_register(&md->dev);
>> +	if (ret) {
>> +		dev_err(parent, "Failed to add master: ret %d\n", ret);
>> +		/*
>> +		 * On err, don't free but drop ref as this will be freed
>> +		 * when release method is invoked.
>> +		 */
>> +		put_device(&md->dev);
> 
> But you still return a valid pointer?  Why????

Ah, yes, this is clearly wrong, thanks for pointing this out.

What's the recommended error code for this? Greybus uses:

return ERR_PTR(-ENOMEM);

>> +EXPORT_SYMBOL(sdw_md_add);
> 
> EXPORT_SYMBOL_GPL()?

yes, will fix

> 
> 
>> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
>> index 5b1180f1e6b5..af0a72e7afdf 100644
>> --- a/include/linux/soundwire/sdw.h
>> +++ b/include/linux/soundwire/sdw.h
>> @@ -585,6 +585,16 @@ struct sdw_slave {
>>   #define to_sdw_slave_device(d) \
>>   	container_of(d, struct sdw_slave, dev)
>>   
>> +struct sdw_master_device {
>> +	struct device dev;
>> +	int link_id;
>> +	struct sdw_md_driver *driver;
>> +	void *pdata; /* core does not touch */
> 
> Core of what?

SoundWire bus driver. This is a copy/paste from the SOF code I am 
afraid, will fix.

> 
>> +};
>> +
>> +#define to_sdw_master_device(d)	\
>> +	container_of(d, struct sdw_master_device, dev)
>> +
>>   struct sdw_driver {
>>   	const char *name;
>>   
>> @@ -599,6 +609,26 @@ struct sdw_driver {
>>   	struct device_driver driver;
>>   };
>>   
>> +struct sdw_md_driver {
>> +	/* initializations and allocations */
>> +	int (*probe)(struct sdw_master_device *md, void *link_ctx);
>> +	/* hardware enablement, all clock/power dependencies are available */
>> +	int (*startup)(struct sdw_master_device *md);
>> +	/* hardware disabled */
>> +	int (*shutdown)(struct sdw_master_device *md);
>> +	/* free all resources */
>> +	int (*remove)(struct sdw_master_device *md);
>> +	/*
>> +	 * enable/disable driver control while in clock-stop mode,
>> +	 * typically in always-on/D0ix modes. When the driver yields
>> +	 * control, another entity in the system (typically firmware
>> +	 * running on an always-on microprocessor) is responsible to
>> +	 * tracking Slave-initiated wakes
>> +	 */
>> +	int (*autonomous_clock_stop_enable)(struct sdw_master_device *md,
>> +					    bool state);
>> +};
> 
> Use kerneldoc comments for this to make it easier to understand and for
> others to read?

yes, I used kerneldoc everywhere except here, will fix.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
