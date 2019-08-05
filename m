Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5F6820AE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 17:47:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC97D167E;
	Mon,  5 Aug 2019 17:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC97D167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565020070;
	bh=D5beSO1wIbioP34OZF286hXtsaxA22sw/QLMiQWJFXw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c5nexFEeIh4j8WkCifj80txajb3tBrOnW6EQTX4G4WEwARJBCtdDeI36HqcqYimTJ
	 hNoQ/8GebaqJ04IWuVgaMQ8zPVtmlzdqzXTBrupeigj/7AuYfly2iSMCdyvCrsThpC
	 7xReivDAcgblrd1ZhcwU/TR/r+Psb8y3bQRJK+6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A24FF8053A;
	Mon,  5 Aug 2019 17:46:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41C03F8053B; Mon,  5 Aug 2019 17:46:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AE38F8011B
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 17:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE38F8011B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 08:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="164686112"
Received: from nupurjai-mobl.amr.corp.intel.com (HELO [10.251.149.179])
 ([10.251.149.179])
 by orsmga007.jf.intel.com with ESMTP; 05 Aug 2019 08:40:13 -0700
To: Sanyog Kale <sanyog.r.kale@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-26-pierre-louis.bossart@linux.intel.com>
 <20190805102828.GF22437@buildpc-HP-Z230>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dc04e596-a16e-257c-ee53-3bc820b7eea0@linux.intel.com>
Date: Mon, 5 Aug 2019 10:40:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805102828.GF22437@buildpc-HP-Z230>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [RFC PATCH 25/40] soundwire: intel: use BIOS
 information to set clock dividers
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



On 8/5/19 5:28 AM, Sanyog Kale wrote:
> On Thu, Jul 25, 2019 at 06:40:17PM -0500, Pierre-Louis Bossart wrote:
>> The BIOS provides an Intel-specific property, let's use it to avoid
>> hard-coded clock dividers.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/cadence_master.c | 26 ++++++++++++++++++++++----
>>   drivers/soundwire/intel.c          | 26 ++++++++++++++++++++++++++
>>   include/linux/soundwire/sdw.h      |  2 ++
>>   3 files changed, 50 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
>> index d84344e29f71..10ebcef2e84e 100644
>> --- a/drivers/soundwire/cadence_master.c
>> +++ b/drivers/soundwire/cadence_master.c
>> @@ -173,8 +173,6 @@
>>   #define CDNS_PDI_CONFIG_PORT			GENMASK(4, 0)
>>   
>>   /* Driver defaults */
>> -
>> -#define CDNS_DEFAULT_CLK_DIVIDER		0
>>   #define CDNS_DEFAULT_SSP_INTERVAL		0x18
>>   #define CDNS_TX_TIMEOUT				2000
>>   
>> @@ -973,7 +971,10 @@ static u32 cdns_set_default_frame_shape(int n_rows, int n_cols)
>>    */
>>   int sdw_cdns_init(struct sdw_cdns *cdns)
>>   {
>> +	struct sdw_bus *bus = &cdns->bus;
>> +	struct sdw_master_prop *prop = &bus->prop;
>>   	u32 val;
>> +	int divider;
>>   	int ret;
>>   
>>   	/* Exit clock stop */
>> @@ -985,9 +986,17 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
>>   	}
>>   
>>   	/* Set clock divider */
>> +	divider	= (prop->mclk_freq / prop->max_clk_freq) - 1;
> 
> Do you expect mclk_freq and max_clk_freq to be same?

Nope. For Icelake the MCLK is 38.4 MHz and is, but the max_clk needs to 
be 9.6 max (can't be higher per the SoundWire spec).

The max_clk_freq may even be lower thank 9.6 MHz due to specific 
topologies where the higher frequencies are problematic if the trace 
lengths are too long.

For CNL/CML the MCLK is 24 MHz but ironically we run the bus at 12 MHz, 
so the divider is smaller.

> 
>>   	val = cdns_readl(cdns, CDNS_MCP_CLK_CTRL0);
>> -	val |= CDNS_DEFAULT_CLK_DIVIDER;
>> +	val |= divider;
>>   	cdns_writel(cdns, CDNS_MCP_CLK_CTRL0, val);
>> +	cdns_writel(cdns, CDNS_MCP_CLK_CTRL1, val);
>> +
>> +	pr_err("plb: mclk %d max_freq %d divider %d register %x\n",
>> +	       prop->mclk_freq,
>> +	       prop->max_clk_freq,
>> +	       divider,
>> +	       val);
> 
> This can be removed.

yes, done already.

> 
>>   
>>   	/* Set the default frame shape */
>>   	val = cdns_set_default_frame_shape(prop->default_row,
>> @@ -1035,6 +1044,7 @@ EXPORT_SYMBOL(sdw_cdns_init);
>>   
>>   int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params)
>>   {
>> +	struct sdw_master_prop *prop = &bus->prop;
>>   	struct sdw_cdns *cdns = bus_to_cdns(bus);
>>   	int mcp_clkctrl_off, mcp_clkctrl;
>>   	int divider;
>> @@ -1044,7 +1054,9 @@ int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params)
>>   		return -EINVAL;
>>   	}
>>   
>> -	divider	= (params->max_dr_freq / params->curr_dr_freq) - 1;
>> +	divider	= prop->mclk_freq * SDW_DOUBLE_RATE_FACTOR /
> 
> What is the reason for not using max_dr_freq? Its precomputed as
> prop->max_clk_freq * SDW_DOUBLE_RATE_FACTOR;

no, as explained above the divider needs to start from the clock 
provided to the IP, which is different from the max frequency clock the 
bus operates at. the MCLK is a fixed value for all platforms using the 
same SOC/PCH, the max_clk is platform-dependent and its value is 
provided by the firmware (BIOS/DT).
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
