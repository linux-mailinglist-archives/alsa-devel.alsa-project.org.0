Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FAB7FD77
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 17:25:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 952D21775;
	Fri,  2 Aug 2019 17:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 952D21775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564759545;
	bh=P5dzxeXdJum1GOGtczmgBz4zt9JPdDhqNwFhuQq3yNI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VtACysEZyeW6Wfsk+G/J4p5qaCDW0HmWagXX/vg10tfl3lCplSnMVG034Qelbq0jS
	 CwxJ1NKUpZKlGwrIJt3cXsCLHgYHhM0ITuGluk2SyF3ubLS53AeXOw4uRDhB5IFlS0
	 LSPYloDMRwYeNshRKovI2dWYS88w0+2TdgQSDQGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65ACAF80214;
	Fri,  2 Aug 2019 17:24:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BB2EF8048F; Fri,  2 Aug 2019 17:23:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D529EF80214
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 17:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D529EF80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 08:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="175611575"
Received: from vivekcha-mobl1.amr.corp.intel.com (HELO [10.251.131.115])
 ([10.251.131.115])
 by orsmga003.jf.intel.com with ESMTP; 02 Aug 2019 08:23:53 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-13-pierre-louis.bossart@linux.intel.com>
 <20190802121016.GN12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a46474c5-8f6b-fa03-8d5e-704c028667aa@linux.intel.com>
Date: Fri, 2 Aug 2019 10:23:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802121016.GN12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 12/40] soundwire: cadence_master:
 revisit interrupt settings
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


>> @@ -761,10 +769,21 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>>   	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1,
>>   		    CDNS_MCP_SLAVE_INTMASK1_MASK);
>>   
>> +	/* enable detection of slave state changes */
>>   	mask = CDNS_MCP_INT_SLAVE_RSVD | CDNS_MCP_INT_SLAVE_ALERT |
>> -		CDNS_MCP_INT_SLAVE_ATTACH | CDNS_MCP_INT_SLAVE_NATTACH |
>> -		CDNS_MCP_INT_CTRL_CLASH | CDNS_MCP_INT_DATA_CLASH |
>> -		CDNS_MCP_INT_RX_WL | CDNS_MCP_INT_IRQ | CDNS_MCP_INT_DPINT;
>> +		CDNS_MCP_INT_SLAVE_ATTACH | CDNS_MCP_INT_SLAVE_NATTACH;
>> +
>> +	/* enable detection of bus issues */
>> +	mask |= CDNS_MCP_INT_CTRL_CLASH | CDNS_MCP_INT_DATA_CLASH |
>> +		CDNS_MCP_INT_PARITY;
>> +
>> +	/* no detection of port interrupts for now */
>> +
>> +	/* enable detection of RX fifo level */
>> +	mask |= CDNS_MCP_INT_RX_WL;
>> +
>> +	/* now enable all of the above */
> 
> I think this comment seems is at wrong line..?
> 
>> +	mask |= CDNS_MCP_INT_IRQ;
>>   
>>   	cdns_writel(cdns, CDNS_MCP_INTMASK, mask);

No it's at the right place.

This flag gates all others, if its value is zero then the value of all 
other bits is irrelevant.

that's what I meant by 'all of the above'.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
