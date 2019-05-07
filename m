Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABD315792
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 04:26:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6B991914;
	Tue,  7 May 2019 04:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6B991914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557195972;
	bh=iv+iBM5x+XbOAJs6J/wqOJbtDPb+/d7NYc3DhXfYb0M=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V9z6xkEKhTYh2OyPgPu6cNfdkyoXxkybgp4B6AuAGOFbkCh5iLHe2cKIBn5R+O6WO
	 DQD1oGx40NEi5xbDRkrvgHpQG+zy0n4GSzWvgDg1YdwP3GItGu5SnMC4XDEu1/fVb+
	 Ra5fqt75FWfKwJmEL52/yhFy+mGAxf61VYCirdFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 675B1F89678;
	Tue,  7 May 2019 04:24:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FE8EF89674; Tue,  7 May 2019 04:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1207AF89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 04:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1207AF89671
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 19:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,440,1549958400"; d="scan'208";a="149048898"
Received: from speesari-mobl.amr.corp.intel.com (HELO [10.251.22.59])
 ([10.251.22.59])
 by orsmga003.jf.intel.com with ESMTP; 06 May 2019 19:24:18 -0700
To: Greg KH <gregkh@linuxfoundation.org>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-2-pierre-louis.bossart@linux.intel.com>
 <20190504065242.GA9770@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b0059709-027e-26c4-25a1-bd55df7c507f@linux.intel.com>
Date: Mon, 6 May 2019 21:24:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
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

I tried a quick hack and indeed we could simplify the code with 
something as simple as:

[attributes omitted]

static const struct attribute_group sdw_master_node_group = {
	.attrs = master_node_attrs,
	.name = "mipi-disco"
};

int sdw_sysfs_bus_init(struct sdw_bus *bus)
{
	return sysfs_create_group(&bus->dev->kobj, &sdw_master_node_group);
}

void sdw_sysfs_bus_exit(struct sdw_bus *bus)
{
	sysfs_remove_group(&bus->dev->kobj, &sdw_master_node_group);	
}

which gives me a simpler structure and doesn't require additional 
pretend-devices:

/sys/bus/acpi/devices/PRP00001:00/int-sdw.0/mipi-disco# ls
clock_gears
/sys/bus/acpi/devices/PRP00001:00/int-sdw.0/mipi-disco# more clock_gears
8086

The issue I have is that for the _show() functions, I don't see a way to 
go from the device argument to bus. In the example above I forced the 
output but would need a helper.

static ssize_t clock_gears_show(struct device *dev,
				struct device_attribute *attr, char *buf)
{
	struct sdw_bus *bus; // this is what I need to find from dev
	ssize_t size = 0;
	int i;

	return sprintf(buf, "%d \n", 8086);
}

my brain is starting to fry, but I don't see how container_of() would 
work here since the bus structure contains a pointer to the device. I 
don't also see a way to check for all devices for the bus_type soundwire.
For the slaves we do have a macro based on container_of(), so wondering 
if we made a mistake in the bus definition? Vinod, any thoughts?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
