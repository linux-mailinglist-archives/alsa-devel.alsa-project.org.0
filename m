Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B998A76888
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 15:45:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44F442061;
	Fri, 26 Jul 2019 15:44:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44F442061
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564148720;
	bh=z40cO7Cusc40iNM5NntdZLP42D5gzLZPuTwMHwHLRgg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RnJx1EFjhBOFtJ0mEs2UxJCEhmvxMZj59JrbTq3RqkyibtJ5AcgKA2qR+vrYVVGa+
	 FBMnExQ2J8kFnDbo9e08EoTyXvTSovOfkbAspSJPdGhQUAwjq/d6B7aqrICmtUe6AM
	 T0hN1RJ1T2+1o5OlM5PYSRmiqfZK+cHzoWdNMkHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A26CF803D5;
	Fri, 26 Jul 2019 15:43:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BE8FF80393; Fri, 26 Jul 2019 15:43:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FF6FF801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 15:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FF6FF801A4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 06:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322042154"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 06:43:26 -0700
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-2-pierre-louis.bossart@linux.intel.com>
 <20190725221554.GA16003@ubuntu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3a45625f-72a8-cb0c-1467-460000d1d8f7@linux.intel.com>
Date: Fri, 26 Jul 2019 08:43:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725221554.GA16003@ubuntu>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 01/40] soundwire: add debugfs support
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



On 7/25/19 5:15 PM, Guennadi Liakhovetski wrote:
> Hi Pierre,
> 
> A couple of nitpicks:

Thanks for the feedback!

>>   create mode 100644 drivers/soundwire/debugfs.c
> 
> [snip]
> 
>> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
>> index 3048ca153f22..06ac4adb0074 100644
>> --- a/drivers/soundwire/bus.h
>> +++ b/drivers/soundwire/bus.h
>> @@ -18,6 +18,30 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
>>   void sdw_extract_slave_id(struct sdw_bus *bus,
>>   			  u64 addr, struct sdw_slave_id *id);
>>   
>> +#ifdef CONFIG_DEBUG_FS
>> +struct dentry *sdw_bus_debugfs_init(struct sdw_bus *bus);
>> +void sdw_bus_debugfs_exit(struct dentry *d);
>> +struct dentry *sdw_slave_debugfs_init(struct sdw_slave *slave);
>> +void sdw_slave_debugfs_exit(struct dentry *d);
>> +void sdw_debugfs_init(void);
>> +void sdw_debugfs_exit(void);
>> +#else
>> +struct dentry *sdw_bus_debugfs_init(struct sdw_bus *bus)
>> +{ return NULL; }
> 
> static?
> 
>> +
>> +void sdw_bus_debugfs_exit(struct dentry *d) {}
>> +
>> +struct dentry *sdw_slave_debugfs_init(struct sdw_slave *slave)
>> +{ return NULL; }
>> +
>> +void sdw_slave_debugfs_exit(struct dentry *d) {}
>> +
>> +void sdw_debugfs_init(void) {}
>> +
>> +void sdw_debugfs_exit(void) {}
> 
> Same for all the above. You could also declare them inline, but I really hope
> the compiler will be smart enough to do that itself.

yes, I'll add static inline for all this.

>> +struct dentry *sdw_bus_debugfs_init(struct sdw_bus *bus)
>> +{
>> +	struct dentry *d;
> 
> I would remove the above
> 
>> +	char name[16];
>> +
>> +	if (!sdw_debugfs_root)
>> +		return NULL;
>> +
>> +	/* create the debugfs master-N */
>> +	snprintf(name, sizeof(name), "master-%d", bus->link_id);
>> +	d = debugfs_create_dir(name, sdw_debugfs_root);
>> +
>> +	return d;
> 
> And just do
> 
> +	return debugfs_create_dir(name, sdw_debugfs_root);

yep, will do.

>> +static ssize_t sdw_sprintf(struct sdw_slave *slave,
>> +			   char *buf, size_t pos, unsigned int reg)
>> +{
>> +	int value;
>> +
>> +	value = sdw_read(slave, reg);
> 
> I personally would join the two lines above, but that's just a personal
> preference.

I prefer splitting variables and code, I just can't mentally split the two.

> 
>> +
>> +	if (value < 0)
>> +		return scnprintf(buf + pos, RD_BUF - pos, "%3x\tXX\n", reg);
>> +	else
> 
> I think it's advised to not use an else in such cases.
> 
> Thanks
> Guennadi
> 
>> +		return scnprintf(buf + pos, RD_BUF - pos,
>> +				"%3x\t%2x\n", reg, value);
>> +}

The intent was to provide a visual cue that the register is not 
implemented, which is quite useful. Not all registers are mandatory and 
not all vendors document the entire set of registers, so it's a good way 
to figure things out. The value is not used for any functional purpose, 
it's just a register dump for the integrator to look at. I'll add a note 
to explain the idea.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
