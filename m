Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B13B30C7B4
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 18:29:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF66F1775;
	Tue,  2 Feb 2021 18:28:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF66F1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612286971;
	bh=Dw/AtpG8L6mSp24VrhZy7fYLPfVKcgopYAhD8LjmclI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h1Z5vJZaS2o2QdiADbeLUM2S7e66gi+nYzjfzMonuuML6d/+cCECcharJH64IDo+N
	 RwdQO+cvR1/M9som3A8TtVnfX/v3Mq4n66L1MMUpEJfCJyACq/LsRpimU3G943ZwyT
	 PmmI7FCVI91LyjCW3kNDLFg96N6crC+5dG0EpjKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2B4CF8023C;
	Tue,  2 Feb 2021 18:27:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04D29F800E1; Tue,  2 Feb 2021 18:27:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7E6BF800E1
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 18:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7E6BF800E1
IronPort-SDR: F7G00TRkXM2cr3AlYegzPiVJaQVZBy53AaMl7dW6l4WhT7rDOL+yenCSiJakLDx6ZjIq0gc7mf
 H/z1/VuJ2lmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="265726519"
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="265726519"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 09:27:45 -0800
IronPort-SDR: mNqUK6PtHH5g6VYtxaLXDQpljJFz5EpdFWbcv3vZhCzSoAVmLGLf/7QFeT1ATKeVCncVZkE/LL
 BnFYE1DoncAw==
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="370798466"
Received: from ncruzgar-mobl.amr.corp.intel.com (HELO [10.212.75.122])
 ([10.212.75.122])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 09:27:44 -0800
Subject: Re: [PATCH 1/3] soundwire: bus: clear bus clash interrupt before the
 mask is enabled
To: Vinod Koul <vkoul@kernel.org>
References: <20210126083746.3238-1-yung-chuan.liao@linux.intel.com>
 <20210126083746.3238-2-yung-chuan.liao@linux.intel.com>
 <20210201102844.GU2771@vkoul-mobl> <20210201103825.GV2771@vkoul-mobl>
 <7c4e1163-a6b3-2886-1963-7e2847dc2836@linux.intel.com>
 <20210202043909.GG2771@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4117cd57-1643-758f-b59c-ac507a6f5ed2@linux.intel.com>
Date: Tue, 2 Feb 2021 10:52:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210202043909.GG2771@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, jank@cadence.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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



On 2/1/21 10:39 PM, Vinod Koul wrote:
> On 01-02-21, 10:18, Pierre-Louis Bossart wrote:
>> On 2/1/21 4:38 AM, Vinod Koul wrote:
>>> On 01-02-21, 15:58, Vinod Koul wrote:
>>>> On 26-01-21, 16:37, Bard Liao wrote:
>>>
>>>>>    struct sdw_master_prop {
>>>>>    	u32 revision;
>>>>> @@ -421,8 +422,11 @@ struct sdw_master_prop {
>>>>>    	u32 err_threshold;
>>>>>    	u32 mclk_freq;
>>>>>    	bool hw_disabled;
>>>>> +	u32 quirks;
>>>>
>>>> Can we do u64 here please.. I dont know where we would end up.. but
>>>> would hate if we start running out of space ..
>> No objection.
>>
>>> Also, is the sdw_master_prop right place for a 'quirk' property. I think
>>> we can use sdw_master_device or sdw_bus as this seems like a bus
>>> quirk..?
>>
>> It's already part of sdw_bus
> 
> Right, but the point is that the properties were mostly derived from
> DiSco, so am bit skeptical about it adding it there..

Oh, I am planning to contribute such quirks as MIPI DisCo properties for 
the next revision of the document (along with a capability to disable a 
link). This was not intended to remain Linux- or Intel-specific.

>> struct sdw_bus {
>> 	struct device *dev;
>> 	struct sdw_master_device *md;
>> 	unsigned int link_id;
>> 	int id;
>> 	struct list_head slaves;
>> 	DECLARE_BITMAP(assigned, SDW_MAX_DEVICES);
>> 	struct mutex bus_lock;
>> 	struct mutex msg_lock;
>> 	int (*compute_params)(struct sdw_bus *bus);
>> 	const struct sdw_master_ops *ops;
>> 	const struct sdw_master_port_ops *port_ops;
>> 	struct sdw_bus_params params;
>> 	struct sdw_master_prop prop;
>>
>> The quirks could be set by a firmware property, and it seems logical to add
>> them at the same place where we already have properties defined in firmware,
>> no? That way all the standard, vendor-specific and quirks are read or added
>> in the same place.
> 
> Or they could be set by driver as well based on device id, compatible
> and so on.. It maybe fw property as well, so limiting to property may not
> be best idea IMO.

Not following, sorry. I didn't mean that only firmware can set them.

All of these sdw_master_prop can come from firmware or be hard-coded by 
a driver for a specific implementation. The point is that they need to 
be provided to the bus core so that it knows what to do.

If you look at DisCo today, we ignore the settings for the Slave 
(unfortunately all wrong in BIOS) so the Slave properties are hard-coded 
in drivers, but do use most of the firmware information for the Master, 
so it's really firmware and/or driver that can set these properties.

>> the sdw_master_device isn't a good place for quirks IMHO, it's a very
>> shallow software-only layer without any existing ties to the hardware
>> definition.
> 
> This one I would agree.
> 
