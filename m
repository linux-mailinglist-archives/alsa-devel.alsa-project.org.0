Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7E98255E
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 21:13:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64B331664;
	Mon,  5 Aug 2019 21:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64B331664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565032439;
	bh=AYOaOQP5jQQxHCj9LmQkio5wM2vShUdIKhfJn7yTymA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hzT7VFmleoWEdDs96rqkE0KwE6ymaUIR4jgNbXK4s507HykroOgyMxSstFeaEWPTz
	 P1PWRDkW5bw+QVH1ILE2KFyzzW5GIjsr/+sgCm2yQ2QJfeRgcvfR0JZU+oWmdM/EmE
	 lC9JvSFXLpB3DKMAFaH1WjWPQR4Spp11qyxMCUlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF808F80533;
	Mon,  5 Aug 2019 21:12:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF2A8F80533; Mon,  5 Aug 2019 21:12:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC112F8011B
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 21:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC112F8011B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 12:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="373177998"
Received: from amerhebi-mobl1.amr.corp.intel.com (HELO [10.251.154.70])
 ([10.251.154.70])
 by fmsmga005.fm.intel.com with ESMTP; 05 Aug 2019 12:12:07 -0700
To: Sanyog Kale <sanyog.r.kale@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-24-pierre-louis.bossart@linux.intel.com>
 <20190805095620.GD22437@buildpc-HP-Z230>
 <12799e97-d6e3-5027-a409-0fe37dba86fd@linux.intel.com>
 <20190805163233.GA24889@buildpc-HP-Z230>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <078f19d4-5a2f-91bf-43a3-7c92eacd8fc1@linux.intel.com>
Date: Mon, 5 Aug 2019 14:12:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805163233.GA24889@buildpc-HP-Z230>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [RFC PATCH 23/40] soundwire: stream: fix disable
 sequence
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



On 8/5/19 11:32 AM, Sanyog Kale wrote:
> On Mon, Aug 05, 2019 at 10:33:25AM -0500, Pierre-Louis Bossart wrote:
>>
>>
>> On 8/5/19 4:56 AM, Sanyog Kale wrote:
>>> On Thu, Jul 25, 2019 at 06:40:15PM -0500, Pierre-Louis Bossart wrote:
>>>> When we disable the stream and then call hw_free, two bank switches
>>>> will be handled and as a result we re-enable the stream on hw_free.
>>>>
>>>
>>> I didnt quite get why there will be two bank switches as part of disable flow
>>> which leads to enabling of stream?
>>
>> You have two bank switches, one to stop streaming and on in de-prepare. It's
>> symmetrical with the start sequence, where we do a bank switch to prepare
>> and another to enable.
> 
> Got it. I misunderstood it that two bank switches are performed as part of
> disable_stream.
> 
>>
>> Let's assume we are using bank0 when streaming.
>>
>> Before the first bank switch, the channel_enable is set to false in the
>> alternate bank1. When the bank switch happens, bank1 become active and the
>> streaming stops. But bank0 registers have not been modified so when we do
>> the second bank switch in de-prepare we make bank0 active, and the ch_enable
>> bits are still set so streaming will restart... When we stop streaming, we
>> need to make sure the ch_enable bits are cleared in the two banks.
> 
> This is clear. Even though the channels remains enabled, i believe there
> won't be any data pushed on lines as stream will be closed.

Actually the link remains active. We tested this by setting the PRBS 
data mode and the Slave device detects when we artificially inject errors.

There is however no data consumption on the DMA side of the Master IP 
since the DMA is indeed stopped.

> 
> Regarding mirroring approach, I assume after bank switch we will take
> snapshot of active bank and program same in inactive bank.

That should be the approach yes.

> 
>>
>>
>>>
>>>> Make sure the stream is disabled on both banks.
>>>>
>>>> TODO: we need to completely revisit all this and make sure we have a
>>>> mirroring mechanism between current and alternate banks.
>>>>
>>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>> ---
>>>>    drivers/soundwire/stream.c | 19 ++++++++++++++++++-
>>>>    1 file changed, 18 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
>>>> index 53f5e790fcd7..75b9ad1fb1a6 100644
>>>> --- a/drivers/soundwire/stream.c
>>>> +++ b/drivers/soundwire/stream.c
>>>> @@ -1637,7 +1637,24 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
>>>>    		}
>>>>    	}
>>>> -	return do_bank_switch(stream);
>>>> +	ret = do_bank_switch(stream);
>>>> +	if (ret < 0) {
>>>> +		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	/* make sure alternate bank (previous current) is also disabled */
>>>> +	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
>>>> +		bus = m_rt->bus;
>>>> +		/* Disable port(s) */
>>>> +		ret = sdw_enable_disable_ports(m_rt, false);
>>>> +		if (ret < 0) {
>>>> +			dev_err(bus->dev, "Disable port(s) failed: %d\n", ret);
>>>> +			return ret;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return 0;
>>>>    }
>>>>    /**
>>>> -- 
>>>> 2.20.1
>>>>
>>>
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
