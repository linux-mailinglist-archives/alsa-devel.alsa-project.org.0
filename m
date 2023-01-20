Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC0B675DCD
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 20:18:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B5413495;
	Fri, 20 Jan 2023 20:17:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B5413495
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674242300;
	bh=8RxJmJCTilGnrtWWSCiuVo11UCJbpns4JVnRmQGbTTw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PmIKNrfC18uBo2dvQpj7lTUE8Bngx25gQJFXHHtRrixRm3SjG4kAJl4wVd3jT1acW
	 H8FpCvY44XI39/60/KwxsXRnIjw6WAnRa0zBs/nAFkgNEgWlwUbQ+DyR6nvkhCCMOd
	 jvB/KCN8si+AkqMXX/xomo0/KCm8PNe8zm8uTWvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6AC4F800F0;
	Fri, 20 Jan 2023 20:16:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1275FF804A9; Fri, 20 Jan 2023 20:16:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AB4FF800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 20:16:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AB4FF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lAIbavBf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674242209; x=1705778209;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8RxJmJCTilGnrtWWSCiuVo11UCJbpns4JVnRmQGbTTw=;
 b=lAIbavBf7TYHi04ovhDUoDFdVpzvASOieqbQFaQY9rcKVGf55+BX/Fn9
 SlxxCCwX92/1LBmNrUsqmEjWgW6LT+k3TJsPwZKLIMuUs1sWRer64AMcG
 AC7X+7V6fxrsNpZOjbUd/QPB1N3fP6PBiEm0rfNNYpdot08XIFxr1fuUa
 MwB1HnYpNyZLW9iO7Y4bSgsfjSELJjcAxbp4pG3/akaBxmo2M8VxHDFm3
 cvDyw5NFQLckPz7JSU9lkjWkf1/xZiz4NWLjDULKaG+PQl1wmxpDHWHmk
 LZex9MnNdoZhYkotF2ogJILvE/bU8DGGwYbSTzNd/cUMCFsJCx13HOulR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="388026932"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="388026932"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:16:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="691156080"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="691156080"
Received: from gallegos-mobl1.amr.corp.intel.com (HELO [10.212.24.2])
 ([10.212.24.2])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:16:41 -0800
Message-ID: <881088ad-95d7-2462-20d2-72a6a9d3ba68@linux.intel.com>
Date: Fri, 20 Jan 2023 10:20:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] soundwire: bus: Allow SoundWire peripherals to
 register IRQ handlers
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20230119165104.3433290-1-ckeepax@opensource.cirrus.com>
 <20230119165104.3433290-2-ckeepax@opensource.cirrus.com>
 <c05a6791-96a7-2b10-d353-eb7b316aefc8@linux.intel.com>
 <20230120095941.GL36097@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230120095941.GL36097@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/20/23 03:59, Charles Keepax wrote:
> On Thu, Jan 19, 2023 at 11:12:04AM -0600, Pierre-Louis Bossart wrote:
>> No objection on this addition, just a couple of comments to improve it:
>>
>>>  EXPORT_SYMBOL(sdw_bus_master_add);
>>> @@ -158,6 +183,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
>>>  	mutex_lock(&bus->bus_lock);
>>>  
>>>  	if (slave->dev_num) { /* clear dev_num if assigned */
>>> +		irq_dispose_mapping(irq_find_mapping(bus->domain, slave->dev_num));
>>> +
>>
>> could this be done conditionally. e.g.
>>
>> if (slave->prop.irq)
>>     irq_dispose_mapping(irq_find_mapping(bus->domain, slave->dev_num));
>>
>>> +			slave->irq = irq_create_mapping(bus->domain, dev_num);
>>> +			if (!slave->irq) {
>>> +				dev_err(bus->dev, "Failed to map IRQ\n");
>>> +				return -EINVAL;
>>> +			}
>>
>> ...and here....
>>
>> if (slave->prop.irq) {
>> 	slave->irq = irq_create_mapping(bus->domain, dev_num);
>> 	if (!slave->irq) {
>> 		dev_err(bus->dev, "Failed to map IRQ\n");
>> 		return -EINVAL;
>> 	}
>> }
>>
> 
> Yeah I am happy to make those conditional, I guess it is cleaner
> to not map IRQs if they wont be used.

ok

> 
>>> @@ -369,6 +371,7 @@ struct sdw_dpn_prop {
>>>   * @clock_reg_supported: the Peripheral implements the clock base and scale
>>>   * registers introduced with the SoundWire 1.2 specification. SDCA devices
>>>   * do not need to set this boolean property as the registers are required.
>>> + * @irq: call actual IRQ handler on slave, as well as callback
>>>   */
>>>  struct sdw_slave_prop {
>>>  	u32 mipi_revision;
>>> @@ -393,6 +396,7 @@ struct sdw_slave_prop {
>>>  	u8 scp_int1_mask;
>>>  	u32 quirks;
>>>  	bool clock_reg_supported;
>>> +	bool irq;
>>
>> this can be confused with the 'wake_capable' property.
>>
>> maybe 'out_of_band_irq' ?
>>
> 
> Yes I struggle on the name a bit and then just gave up and
> went with plain "irq", hard to know what to call it. Not sure
> out_of_band is quite right since it not really out of band,
> handle_nested_irq pretty much basically boils down to a function
> call really. Maybe something like "map_irq", or "use_domain_irq"?

Naming is hard. I use 'in-band wake' for SoundWire-based notifications,
so I used 'out-of-band' for non-SoundWire stuff.

use_domain_irq sounds goods to me, it's different enough that confusions
are not possible.

>> There should be an explanation and something checking that both are not
>> used concurrently.
> 
> I will try to expand the explanation a litte, but I dont see any
> reason to block calling both handlers, no ill effects would come
> for a driver having both and it is useful if any soundwire
> specific steps are needed that arn't on other control buses.

I think it's problematic if the peripheral tries to wake-up the manager
from clock-stop with both an in-band wake (i.e. drive the data line
high) and a separate GPIO-based interrupt. It's asking for trouble IMHO.
We spent hours in the MIPI team to make sure there were no races between
the manager-initiated restarts and peripheral-initiated restarts, adding
a 3rd mechanism in the mix gives me a migraine already.
