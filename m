Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D56C582094
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 17:43:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 454CD1674;
	Mon,  5 Aug 2019 17:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 454CD1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565019792;
	bh=xvbJXoTD+0a32mgde1Ol++oEsuXmLqngSgXeCtcwiLY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DdPKhRWIsf+M7zjt0DxhuuIPPsNtRfSlDYI9Z01tU4S/VuenTGH7fCLOeuxAMMFOB
	 6qTyHXs/qPVK/9nAyiBsMQQ62FjElM8ajF/EyXrHSypFb7hvv/5EHj6HWHW2yoFXvE
	 0n9jQwEiXTqrgjJ5eWIInE9fRVM+iJuKjiWbA5oc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 776C2F80533;
	Mon,  5 Aug 2019 17:41:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE79CF80533; Mon,  5 Aug 2019 17:41:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E1B6F800F4
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 17:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E1B6F800F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 08:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="164686579"
Received: from nupurjai-mobl.amr.corp.intel.com (HELO [10.251.149.179])
 ([10.251.149.179])
 by orsmga007.jf.intel.com with ESMTP; 05 Aug 2019 08:41:20 -0700
To: Sanyog Kale <sanyog.r.kale@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-27-pierre-louis.bossart@linux.intel.com>
 <20190805104047.GG22437@buildpc-HP-Z230>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <acad7ddf-4b83-0019-2f6f-8fd7c80a0fcc@linux.intel.com>
Date: Mon, 5 Aug 2019 10:41:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805104047.GG22437@buildpc-HP-Z230>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 26/40] soundwire: cadence_master: fix
 divider setting in clock register
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


>> @@ -988,9 +989,11 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
>>   	/* Set clock divider */
>>   	divider	= (prop->mclk_freq / prop->max_clk_freq) - 1;
>>   	val = cdns_readl(cdns, CDNS_MCP_CLK_CTRL0);
> 
> reg read of CLK_CTRL0 can be removed.

yes for both comments. Thanks for the review Sanyog, appreciate it.

> 
>> -	val |= divider;
>> -	cdns_writel(cdns, CDNS_MCP_CLK_CTRL0, val);
>> -	cdns_writel(cdns, CDNS_MCP_CLK_CTRL1, val);
>> +
>> +	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL0,
>> +		     CDNS_MCP_CLK_MCLKD_MASK, divider);
>> +	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL1,
>> +		     CDNS_MCP_CLK_MCLKD_MASK, divider);
>>   
>>   	pr_err("plb: mclk %d max_freq %d divider %d register %x\n",
>>   	       prop->mclk_freq,
>> @@ -1064,8 +1067,7 @@ int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params)
>>   		mcp_clkctrl_off = CDNS_MCP_CLK_CTRL0;
>>   
>>   	mcp_clkctrl = cdns_readl(cdns, mcp_clkctrl_off);
> 
> same as above.
> 
>> -	mcp_clkctrl |= divider;
>> -	cdns_writel(cdns, mcp_clkctrl_off, mcp_clkctrl);
>> +	cdns_updatel(cdns, mcp_clkctrl_off, CDNS_MCP_CLK_MCLKD_MASK, divider);
>>   
>>   	pr_err("plb: mclk * 2 %d curr_dr_freq %d divider %d register %x\n",
>>   	       prop->mclk_freq * SDW_DOUBLE_RATE_FACTOR,
>> -- 
>> 2.20.1
>>
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
