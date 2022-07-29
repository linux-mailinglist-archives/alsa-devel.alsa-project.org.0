Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B8558531D
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 17:53:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 614DE1FC;
	Fri, 29 Jul 2022 17:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 614DE1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659110035;
	bh=UAUPEMcuCVe8VZDe3qyzrxa6b7jqOvbpuUOTVLjcXf4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CuKmvv0fbRrd8zDtSnhHLv7OY7Um9YS8WvEI24/GGtEQkzigbpvb4jDogbdG+bwWW
	 weo7Cq41Myfh0I1pCwEtRV3fMusV0rV5hr2WE/3c2HGRxKagdXW4bj3b+Le6DVDu5B
	 UfqOycUt25KW63dXALMqVSe6IR6uKmtzpOtzbo/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5E74F804B1;
	Fri, 29 Jul 2022 17:52:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBC2CF8049C; Fri, 29 Jul 2022 17:52:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6137F80224
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 17:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6137F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DynvFOY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659109972; x=1690645972;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UAUPEMcuCVe8VZDe3qyzrxa6b7jqOvbpuUOTVLjcXf4=;
 b=DynvFOY/XnKC7OSK3LILN8XCsOX0ry9L1lquX5L/j5ZzWDZiDlfqvEHg
 /R7BZDFKgvnzCQl7kUHkTatwmeso0mMw7vuBBuikgqwLjzc6NyqwyafMO
 Xu043f4drQN8IcJHnnarHWSMJcxv3svBW9y4qI76GmnXwgbyZEO3gU1xc
 lzwx69xeKLk0LbY6QciYadvxJbo80LsWul/bNoBwkWdmzt76K7bYcI70u
 UZ03C75ge3kAbfhWB6MtAKCXThBW/6VsY1SfyJZZsETpf4vrx5YhPv0EZ
 FuZIRjoKeIWeAyigQyQ+e86qpXGsVhX7XQTnPzxDt6tAY88FqZ8k70xXM Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="375095269"
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; d="scan'208";a="375095269"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 08:52:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; d="scan'208";a="605001231"
Received: from kaholo-mobl.amr.corp.intel.com (HELO [10.212.97.86])
 ([10.212.97.86])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 08:52:28 -0700
Message-ID: <5caffe2a-f5a6-e312-a564-5fe29c4e2323@linux.intel.com>
Date: Fri, 29 Jul 2022 10:52:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] soundwire: sysfs: cleanup the logic for creating the
 dp0 sysfs attributes
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
 <20220729135041.2285908-2-gregkh@linuxfoundation.org>
 <9365e038-2146-98f8-f989-02827f221c34@linux.intel.com>
 <YuP0Ffs3G7ZBR0AC@kroah.com>
 <cfacb124-a9ff-0a93-8f92-93d164b15966@linux.intel.com>
 <YuP2pjhyKTTfpXQq@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YuP2pjhyKTTfpXQq@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Sanyog Kale <sanyog.r.kale@intel.com>
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


>>>>> diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
>>>>> index 83e3f6cc3250..3723333a5c2b 100644
>>>>> --- a/drivers/soundwire/sysfs_slave.c
>>>>> +++ b/drivers/soundwire/sysfs_slave.c
>>>>> @@ -174,6 +174,16 @@ static ssize_t words_show(struct device *dev,
>>>>>  }
>>>>>  static DEVICE_ATTR_RO(words);
>>>>>  
>>>>> +static umode_t dp0_is_visible(struct kobject *kobj, struct attribute *attr,
>>>>> +			      int n)
>>>>> +{
>>>>> +	struct sdw_slave *slave = dev_to_sdw_dev(kobj_to_dev(kobj));
>>>>> +
>>>>> +	if (slave->prop.dp0_prop)
>>>>> +		return attr->mode;
>>>>> +	return 0;
>>>>> +}
>>>>
>>>> This changes the results slightly by creating an empty 'dp0' directory
>>>> with no attributes inside.
>>>>
>>>> Before:
>>>>
>>>> [root@fedora ~]# cd /sys/bus/soundwire/devices/sdw:3:025d:0714:01
>>>> [root@fedora sdw:3:025d:0714:01]# ls dp0
>>>> ls: cannot access 'dp0': No such file or directory
>>>>
>>>> After:
>>>> [root@fedora sdw:3:025d:0714:01]# ls dp0
>>>
>>> That should be fine, tools should just be looking for the attributes,
>>> not the existance of a directory, right?
>>
>> The idea what that we would only expose ports that actually exist.
>> That's helpful information anyone with a basic knowledge of the
>> SoundWire specification would understand.
> 
> Is "dp0" a port?  If so, why isn't it a real device?

The SoundWire spec defines the concept of 'data port'. The valid ranges
are 1..14, but in all existing devices the number of data ports is way
smaller, typically 2 to 4. Data ports (DPn) are source or sink, and
there's no firm rule that data ports needs to be contiguous.

DP0 is a 'special case' where the data transport is used for control
information, e.g. programming large set of registers or firmware
download. DP0 is completely optional in hardware, and not handled in
Linux for now.

DP0 and DPn expose low-level transport registers, which define how the
contents of a FIFO will be written or read from the bus. Think of it as
a generalization of the concept of TDM slots, where instead of having a
fixed slot per frame the slot position/repetition/runlength can be
programmed.

The data ports could be as simple as 1-bit PDM, or support 8ch PCM
24-bits. That's the sort of information reported in attributes.

>> The attributes are really details that few people/applications would
>> understand, and unfortunately the information reported in DSDT is more
>> often than not complete garbage.
> 
> I don't understand what DSDT is, or how it is relevant here :(

Platform firmware typically exposes the presence of ports and the
details since there are no descriptors in hardware. The DSDT in ACPI
exposes _DSD properties under the SoundWire device scope, which are
compatible with DT properties. In other words, what the driver exposes
in sysfs is just a mirror of what was reported by platform firmware -
unless it was overridden by a driver.
