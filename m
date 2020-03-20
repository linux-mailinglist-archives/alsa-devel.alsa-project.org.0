Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A47B718D6BC
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 19:22:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271AD846;
	Fri, 20 Mar 2020 19:21:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271AD846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584728528;
	bh=/wNWb87SiuYJ84qvAaYHMYtGHJkY8+jFmFMyAKQGfjw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=saPqxZG8oOen6caCoYMzLEvz5O1VWal0T49qSAs0y249Df9Nswj8DqYs6hMKlSSUJ
	 ohCO8fywv2lhUnmYfhYYfjoolKM4L7lJrPWnvdbAIpbqEcfF6q8tkGODQrQ2TTkP6U
	 HgSqDfM1iEd1NChciXT50tQFKCbk/PuOhDkgbiyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35F26F8029A;
	Fri, 20 Mar 2020 19:18:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96410F8028E; Fri, 20 Mar 2020 19:18:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEEB2F80227
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 19:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEEB2F80227
IronPort-SDR: TTNRCUZ6zhY8jV07TlfY4Qkk7BQistotp9Q/ORHazJHAGGpGwhZNMVsWIXZgAmfDwgbUodRCkX
 RY5F1rqnc+BA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 11:18:00 -0700
IronPort-SDR: 60736Tivxkr00AO1Q8sv87clYrGQ565iZ/n1qn3PCCOTxxkhk/5j16AJsFYlz18g1uiouX9+8j
 b9NRogoM4O5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; d="scan'208";a="392230378"
Received: from manallet-mobl.amr.corp.intel.com (HELO [10.255.34.12])
 ([10.255.34.12])
 by orsmga004.jf.intel.com with ESMTP; 20 Mar 2020 11:17:58 -0700
Subject: Re: [PATCH 5/7] soundwire: intel: follow documentation sequences for
 SHIM registers
To: Vinod Koul <vkoul@kernel.org>
References: <20200311221026.18174-1-pierre-louis.bossart@linux.intel.com>
 <20200311221026.18174-6-pierre-louis.bossart@linux.intel.com>
 <20200320135145.GE4885@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9e280e1b-178a-0ce8-be5b-03532c5507fe@linux.intel.com>
Date: Fri, 20 Mar 2020 09:20:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200320135145.GE4885@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>, Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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



On 3/20/20 8:51 AM, Vinod Koul wrote:
> On 11-03-20, 17:10, Pierre-Louis Bossart wrote:
>> From: Rander Wang <rander.wang@intel.com>
>>
>> Somehow the existing code is not aligned with the steps described in
>> the documentation, refactor code and make sure the register
> 
> Is the documentation available public space so that we can correct

No, so you'll have to trust us blindly on this one.


>> @@ -283,11 +284,48 @@ static int intel_link_power_up(struct sdw_intel *sdw)
>>   {
>>   	unsigned int link_id = sdw->instance;
>>   	void __iomem *shim = sdw->link_res->shim;
>> +	u32 *shim_mask = sdw->link_res->shim_mask;
> 
> this is a local pointer, so the one defined previously is not used.

No idea what you are saying, it's the same address so changes to 
*shim_mask will be the same as in *sdw->link_res->shim_mask.

> 
>> +	struct sdw_bus *bus = &sdw->cdns.bus;
>> +	struct sdw_master_prop *prop = &bus->prop;
>>   	int spa_mask, cpa_mask;
>> -	int link_control, ret;
>> +	int link_control;
>> +	int ret = 0;
>> +	u32 syncprd;
>> +	u32 sync_reg;
>>   
>>   	mutex_lock(sdw->link_res->shim_lock);
>>   
>> +	/*
>> +	 * The hardware relies on an internal counter,
>> +	 * typically 4kHz, to generate the SoundWire SSP -
>> +	 * which defines a 'safe' synchronization point
>> +	 * between commands and audio transport and allows for
>> +	 * multi link synchronization. The SYNCPRD value is
>> +	 * only dependent on the oscillator clock provided to
>> +	 * the IP, so adjust based on _DSD properties reported
>> +	 * in DSDT tables. The values reported are based on
>> +	 * either 24MHz (CNL/CML) or 38.4 MHz (ICL/TGL+).
> 
> Sorry this looks quite bad to read, we have 80 chars, so please use
> like below:
> 
> 	/*
>           * The hardware relies on an internal counter, typically 4kHz,
>           * to generate the SoundWire SSP - which defines a 'safe'
>           * synchronization point between commands and audio transport
>           * and allows for multi link synchronization. The SYNCPRD value
>           * is only dependent on the oscillator clock provided to
>           * the IP, so adjust based on _DSD properties reported in DSDT
>           * tables. The values reported are based on either 24MHz
>           * (CNL/CML) or 38.4 MHz (ICL/TGL+).
> 	 */

Are we really going to have an emacs vs vi discussion here?
