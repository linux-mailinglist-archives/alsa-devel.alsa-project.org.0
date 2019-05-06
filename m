Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9163F151D8
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 18:45:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00D611889;
	Mon,  6 May 2019 18:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00D611889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557161147;
	bh=atVIBsIvp4c7osuqmxkuAKHw9S63mt2BTzgFj7zxGXY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gtuQO6Pg32YatEBByVL9tmIYpzcclR5BUP2EVqq0sUXySlkm3syN6z8O62lNRPfhs
	 ct71eqzVkLPhMT2M3pFx1wYppvzi1xYxNJ8+lvzvWRUEeHCDYwJIQU1NOJWQpqWAkw
	 PrpFXVl2H22KO8M57P7u+scyS0gAyUD7hHQUuU9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40599F896F0;
	Mon,  6 May 2019 18:44:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6077F896F0; Mon,  6 May 2019 18:43:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6EB0F89673
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 18:43:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6EB0F89673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 09:43:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="230000844"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 06 May 2019 09:43:53 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 08F6258010A;
 Mon,  6 May 2019 09:43:51 -0700 (PDT)
To: Greg KH <gregkh@linuxfoundation.org>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-2-pierre-louis.bossart@linux.intel.com>
 <20190504065242.GA9770@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b36e5b42-6069-0a73-8cab-7fcfc999f3a8@linux.intel.com>
Date: Mon, 6 May 2019 11:43:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504065242.GA9770@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 1/7] soundwire: Add sysfs support for
 master(s)
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

Thanks for the quick feedback Greg!

>> +static const struct attribute_group sdw_master_node_group = {
>> +	.attrs = master_node_attrs,
>> +};
>> +
>> +static const struct attribute_group *sdw_master_node_groups[] = {
>> +	&sdw_master_node_group,
>> +	NULL
>> +};
> 
> Minor nit, you can use the ATTRIBUTE_GROUPS() macro here to save you a
> few lines.

will do.

>> +
>> +static void sdw_device_release(struct device *dev)
>> +{
>> +	struct sdw_master_sysfs *master = to_sdw_device(dev);
>> +
>> +	kfree(master);
>> +}
>> +
>> +static struct device_type sdw_device_type = {
>> +	.name =	"sdw_device",
>> +	.release = sdw_device_release,
>> +};
>> +
>> +int sdw_sysfs_bus_init(struct sdw_bus *bus)
>> +{
>> +	struct sdw_master_sysfs *master;
>> +	int err;
>> +
>> +	if (bus->sysfs) {
>> +		dev_err(bus->dev, "SDW sysfs is already initialized\n");
>> +		return -EIO;
>> +	}
>> +
>> +	master = kzalloc(sizeof(*master), GFP_KERNEL);
>> +	if (!master)
>> +		return -ENOMEM;
> 
> Why are you creating a whole new device to put all of this under?  Is
> this needed?  What will the sysfs tree look like when you do this?  Why
> can't the "bus" device just get all of these attributes and no second
> device be created?

This is indeed my main question on this code (see cover letter) and why 
I tagged the series as RFC. I find it odd to create an int-sdw.0 
platform device to model the SoundWire master, and a sdw-master:0 device 
whose purpose is only to expose the properties of that master. it'd be 
simpler if all the properties were exposed one level up.

Vinod and Sanyog might be able to shed some light on this?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
