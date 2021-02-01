Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D99C830AED1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 19:15:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 401481741;
	Mon,  1 Feb 2021 19:14:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 401481741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612203311;
	bh=JMZA5fszWYDEz2nenLMbDL3ZRFCpSmv0v3qBMv1laYg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kOa/yMXG5weOtN7e3N/zodJviipRcRJlsmKKuHbkDF2IrCHa2QkI2Xfc61xH5YHWD
	 wxTAp4PKe0SDGOrmC7KVPxGrUF5QXiNaiA/y/CpYIuAMYxXKwpCw8oQWIVShDqVOdB
	 GznPrVn2jQAzk0RHu52MjoG3v5pyhH2gNDUbGA7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D05F80154;
	Mon,  1 Feb 2021 19:13:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7479F800E9; Mon,  1 Feb 2021 19:13:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC130F800E9
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 19:13:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC130F800E9
IronPort-SDR: Yc5UcL8Fq+YFbTVbg9YRyLR8VpAF3NN8DfatYknlyG5I8YGdD6371uakd7fx79L/OxVQpaEj6e
 r0xV1MWz3ntw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="167833495"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="167833495"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 10:13:21 -0800
IronPort-SDR: GhejXAFevh58ldyZmFLRdCBJ1GI5sKz2A0q9xIOWgmDmIhM+m5E1DC1qWm+ecEpW5SWFb1q3/q
 nryH6bHsZecQ==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="412516898"
Received: from dkhaldi-mobl1.amr.corp.intel.com (HELO [10.212.126.61])
 ([10.212.126.61])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 10:13:20 -0800
Subject: Re: [PATCH 1/3] soundwire: bus: clear bus clash interrupt before the
 mask is enabled
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20210126083746.3238-1-yung-chuan.liao@linux.intel.com>
 <20210126083746.3238-2-yung-chuan.liao@linux.intel.com>
 <20210201102844.GU2771@vkoul-mobl> <20210201103825.GV2771@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7c4e1163-a6b3-2886-1963-7e2847dc2836@linux.intel.com>
Date: Mon, 1 Feb 2021 10:18:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210201103825.GV2771@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, jank@cadence.com,
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



On 2/1/21 4:38 AM, Vinod Koul wrote:
> On 01-02-21, 15:58, Vinod Koul wrote:
>> On 26-01-21, 16:37, Bard Liao wrote:
> 
>>>   struct sdw_master_prop {
>>>   	u32 revision;
>>> @@ -421,8 +422,11 @@ struct sdw_master_prop {
>>>   	u32 err_threshold;
>>>   	u32 mclk_freq;
>>>   	bool hw_disabled;
>>> +	u32 quirks;
>>
>> Can we do u64 here please.. I dont know where we would end up.. but
>> would hate if we start running out of space ..
No objection.

> Also, is the sdw_master_prop right place for a 'quirk' property. I think
> we can use sdw_master_device or sdw_bus as this seems like a bus
> quirk..?

It's already part of sdw_bus

struct sdw_bus {
	struct device *dev;
	struct sdw_master_device *md;
	unsigned int link_id;
	int id;
	struct list_head slaves;
	DECLARE_BITMAP(assigned, SDW_MAX_DEVICES);
	struct mutex bus_lock;
	struct mutex msg_lock;
	int (*compute_params)(struct sdw_bus *bus);
	const struct sdw_master_ops *ops;
	const struct sdw_master_port_ops *port_ops;
	struct sdw_bus_params params;
	struct sdw_master_prop prop;

The quirks could be set by a firmware property, and it seems logical to 
add them at the same place where we already have properties defined in 
firmware, no? That way all the standard, vendor-specific and quirks are 
read or added in the same place.

the sdw_master_device isn't a good place for quirks IMHO, it's a very 
shallow software-only layer without any existing ties to the hardware 
definition.

