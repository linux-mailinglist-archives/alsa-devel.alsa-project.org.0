Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F48B77026
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 19:28:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C20A820BC;
	Fri, 26 Jul 2019 19:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C20A820BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564162087;
	bh=/pZ06uK6nkMSY74RxChRkabFuA7n7meFPnAazDG3E7Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OUiJkmYqDfx6knVPUlPSKzqLQUDk/qL3B8ETVlTQQWlBhnJseHbXMaaM3hgmBNuUq
	 5YAWZYLvdmBuHIEfKliORkp56QVUfI/TeycQCHYsn4DGKME8WomrnDKcDUrSqCPamG
	 LuTKwmfW2IYb9xUKu0q04TbxZtOOKSMyFrg1j+ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12FA3F803D5;
	Fri, 26 Jul 2019 19:26:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9385CF80393; Fri, 26 Jul 2019 19:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02991F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 19:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02991F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 10:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="198461381"
Received: from andawes-mobl.amr.corp.intel.com (HELO [10.251.145.66])
 ([10.251.145.66])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2019 10:26:14 -0700
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-37-pierre-louis.bossart@linux.intel.com>
 <20190726155520.GL16003@ubuntu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e456112b-27a4-d897-6690-3177dd5a8b56@linux.intel.com>
Date: Fri, 26 Jul 2019 12:26:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726155520.GL16003@ubuntu>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 36/40] soundwire: intel: disable
 interrupts on suspend
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


>> -int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>> +int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state)
>>   {
>>   	u32 mask;
>>   
>> -	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0,
>> -		    CDNS_MCP_SLAVE_INTMASK0_MASK);
>> -	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1,
>> -		    CDNS_MCP_SLAVE_INTMASK1_MASK);
>> +	if (state) {
>> +		cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0,
>> +			    CDNS_MCP_SLAVE_INTMASK0_MASK);
>> +		cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1,
>> +			    CDNS_MCP_SLAVE_INTMASK1_MASK);
>>   
>> -	/* enable detection of slave state changes */
>> -	mask = CDNS_MCP_INT_SLAVE_RSVD | CDNS_MCP_INT_SLAVE_ALERT |
>> -		CDNS_MCP_INT_SLAVE_ATTACH | CDNS_MCP_INT_SLAVE_NATTACH;
>> +		/* enable detection of slave state changes */
>> +		mask = CDNS_MCP_INT_SLAVE_RSVD | CDNS_MCP_INT_SLAVE_ALERT |
>> +			CDNS_MCP_INT_SLAVE_ATTACH | CDNS_MCP_INT_SLAVE_NATTACH;
>>   
>> -	/* enable detection of bus issues */
>> -	mask |= CDNS_MCP_INT_CTRL_CLASH | CDNS_MCP_INT_DATA_CLASH |
>> -		CDNS_MCP_INT_PARITY;
>> +		/* enable detection of bus issues */
>> +		mask |= CDNS_MCP_INT_CTRL_CLASH | CDNS_MCP_INT_DATA_CLASH |
>> +			CDNS_MCP_INT_PARITY;
>>   
>> -	/* no detection of port interrupts for now */
>> +		/* no detection of port interrupts for now */
>>   
>> -	/* enable detection of RX fifo level */
>> -	mask |= CDNS_MCP_INT_RX_WL;
>> +		/* enable detection of RX fifo level */
>> +		mask |= CDNS_MCP_INT_RX_WL;
>>   
>> -	/* now enable all of the above */
>> -	mask |= CDNS_MCP_INT_IRQ;
>> +		/* now enable all of the above */
>> +		mask |= CDNS_MCP_INT_IRQ;
>>   
>> -	if (interrupt_mask) /* parameter override */
>> -		mask = interrupt_mask;
>> +		if (interrupt_mask) /* parameter override */
>> +			mask = interrupt_mask;
>> +	} else {
>> +		cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0, 0);
>> +		cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1, 0);
>> +		mask = 0;
>> +	}
> 
> Looks like this should be two functions? Especially since "state" is always a constant
> when it is called. If there is still a lot of common code below, maybe make it a helper
> function.

Yes, the code is a bit ugly. I could initialize all the masks to zero, 
have the if(state) block and write the masks.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
