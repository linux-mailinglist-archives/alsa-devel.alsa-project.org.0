Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7EE333C
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 15:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C990816E0;
	Thu, 24 Oct 2019 14:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C990816E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571922041;
	bh=cMruDkNDNfarLI+b27kC2NT8RqNNjEtgzmYz1H1VFoc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/RE7023IMn3zI8+5xngkpZm3TBPUJshnuyHDz2g+TatpMYLMrN8n1bKJhoVXd4+E
	 gLAbjmCnTuf5C2g6V8+xJ0zqPsNlCwSyN18293vkUh785ZIpMgU3+YM+NFdOaIoRlv
	 uOR6XFVD2t8hhTV0/98i7AQiO+AA/yppF0dDK1cs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AF18F80377;
	Thu, 24 Oct 2019 14:58:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B187F8036B; Thu, 24 Oct 2019 14:58:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 693AAF80137
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 14:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 693AAF80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 05:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; d="scan'208";a="210373133"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 24 Oct 2019 05:58:48 -0700
Received: from atirumal-mobl1.amr.corp.intel.com (unknown [10.251.26.228])
 by linux.intel.com (Postfix) with ESMTP id 9D0D158049A;
 Thu, 24 Oct 2019 05:58:47 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20191022234808.17432-1-pierre-louis.bossart@linux.intel.com>
 <20191022234808.17432-4-pierre-louis.bossart@linux.intel.com>
 <20191024113911.GD2620@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cd8637df-a400-a683-13b9-fd98231d0134@linux.intel.com>
Date: Thu, 24 Oct 2019 07:59:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024113911.GD2620@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 3/3] soundwire: ignore uniqueID when
 irrelevant
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

On 10/24/19 6:39 AM, Vinod Koul wrote:
> On 22-10-19, 18:48, Pierre-Louis Bossart wrote:
>> The uniqueID is useful when there are two or more devices of the same
>> type (identical manufacturer ID, part ID) on the same link.
> 
> Right!

the key part is "two or more". When it's "one" then the uniqueID has no 
defined meaning.

> 
>> When there is a single device of a given type on a link, its uniqueID
>> is irrelevant. It's not uncommon on actual platforms to see variations
>> of the uniqueID, or differences between devID registers and ACPI _ADR
>> fields.
> 
> Ideally this should be fixed in firmware, I do not like the fact the we are
> poking in core for firmware issues!

I will be the first to complain about BIOS issues, and the need for 
workarounds in the kernel, but here the BIOS vendors rely on permissions 
defined in the standard, see lines 3320..31 in the MIPI SoundWire 1.2 
document. You will see that there is no requirement to use the full set 
of devID registers to identify a Slave device. The only requirement is 
to read devID0 first to force a state machine transition and enable 
arbitration.

In other words, it's a nice case of BIOS folks telling the kernel folks 
we are too strict in our interpretation of the standard, and what they 
do is a feature and not a bug.

> 
>> This patch suggests a filter on startup to identify 'single' devices
>> and tag them accordingly.
> 
> So you try to see if the board has a single device and mark them so that
> you can skip the unique id, did I get that right?
> 
> What about the boards which have multiple devices? How doing solve
> these?

The uniqueID is used when multiple devices of the same type are detected 
in ACPI tables. No change, see [1] below

> 
>> The uniqueID is then not used for the probe,
>> and the device name omits the uniqueID as well.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/bus.c   |  7 +++---
>>   drivers/soundwire/slave.c | 52 ++++++++++++++++++++++++++++++++++++---
>>   2 files changed, 52 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index fc53dbe57f85..be5d437058ed 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -422,10 +422,11 @@ static struct sdw_slave *sdw_get_slave(struct sdw_bus *bus, int i)
>>   
>>   static int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id)
>>   {
>> -	if (slave->id.unique_id != id.unique_id ||
>> -	    slave->id.mfg_id != id.mfg_id ||
>> +	if (slave->id.mfg_id != id.mfg_id ||
>>   	    slave->id.part_id != id.part_id ||
>> -	    slave->id.class_id != id.class_id)
>> +	    slave->id.class_id != id.class_id ||
>> +	    (slave->id.unique_id != SDW_IGNORED_UNIQUE_ID &&
>> +	     slave->id.unique_id != id.unique_id))

[1] this is where the unique_id is ignored if it was tagged as 
irrelevant while scanning ACPI tables. If it is not ignored, then the 
same comparison applied

>>   		return -ENODEV;
>>   
>>   	return 0;
>> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
>> index 5dbc76772d21..19919975bb6d 100644
>> --- a/drivers/soundwire/slave.c
>> +++ b/drivers/soundwire/slave.c
>> @@ -29,10 +29,17 @@ static int sdw_slave_add(struct sdw_bus *bus,
>>   	slave->dev.parent = bus->dev;
>>   	slave->dev.fwnode = fwnode;
>>   
>> -	/* name shall be sdw:link:mfg:part:class:unique */
>> -	dev_set_name(&slave->dev, "sdw:%x:%x:%x:%x:%x",
>> -		     bus->link_id, id->mfg_id, id->part_id,
>> -		     id->class_id, id->unique_id);
>> +	if (id->unique_id == SDW_IGNORED_UNIQUE_ID) {
>> +		/* name shall be sdw:link:mfg:part:class */
>> +		dev_set_name(&slave->dev, "sdw:%x:%x:%x:%x",
>> +			     bus->link_id, id->mfg_id, id->part_id,
>> +			     id->class_id);
>> +	} else {
>> +		/* name shall be sdw:link:mfg:part:class:unique */
>> +		dev_set_name(&slave->dev, "sdw:%x:%x:%x:%x:%x",
>> +			     bus->link_id, id->mfg_id, id->part_id,
>> +			     id->class_id, id->unique_id);
>> +	}
>>   
>>   	slave->dev.release = sdw_slave_release;
>>   	slave->dev.bus = &sdw_bus_type;
>> @@ -103,6 +110,7 @@ static bool find_slave(struct sdw_bus *bus,
>>   int sdw_acpi_find_slaves(struct sdw_bus *bus)
>>   {
>>   	struct acpi_device *adev, *parent;
>> +	struct acpi_device *adev2, *parent2;
>>   
>>   	parent = ACPI_COMPANION(bus->dev);
>>   	if (!parent) {
>> @@ -112,10 +120,46 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
>>   
>>   	list_for_each_entry(adev, &parent->children, node) {
>>   		struct sdw_slave_id id;
>> +		struct sdw_slave_id id2;
>> +		bool ignore_unique_id = true;
>>   
>>   		if (!find_slave(bus, adev, &id))
>>   			continue;
>>   
>> +		/* brute-force O(N^2) search for duplicates */
>> +		parent2 = parent;
>> +		list_for_each_entry(adev2, &parent2->children, node) {
>> +
>> +			if (adev == adev2)
>> +				continue;
>> +
>> +			if (!find_slave(bus, adev2, &id2))
>> +				continue;
>> +
>> +			if (id.sdw_version != id2.sdw_version ||
>> +			    id.mfg_id != id2.mfg_id ||
>> +			    id.part_id != id2.part_id ||
>> +			    id.class_id != id2.class_id)
>> +				continue;
>> +
>> +			if (id.unique_id != id2.unique_id) {
>> +				dev_dbg(bus->dev,
>> +					"Valid unique IDs %x %x for Slave mfg %x part %d\n",
>> +					id.unique_id, id2.unique_id,
>> +					id.mfg_id, id.part_id);
>> +				ignore_unique_id = false;
>> +			} else {
>> +				dev_err(bus->dev,
>> +					"Invalid unique IDs %x %x for Slave mfg %x part %d\n",
>> +					id.unique_id, id2.unique_id,
>> +					id.mfg_id, id.part_id);
>> +				return -ENODEV;
>> +			}
>> +		}
>> +
>> +		if (ignore_unique_id)
>> +			id.unique_id = SDW_IGNORED_UNIQUE_ID;
>> +
>>   		/*
>>   		 * don't error check for sdw_slave_add as we want to continue
>>   		 * adding Slaves
>> -- 
>> 2.20.1
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
