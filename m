Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE771DEA78
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 13:10:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72E671673;
	Mon, 21 Oct 2019 13:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72E671673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571656238;
	bh=mmy4K9aTD7S5ZC/dHWUYhz8+DPU3qSwsU4nq9kaxzeE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eb9MZdxKbQVsPlq4j3cTrd6490y+lhw5evuvoMy20dFh5w3W9DKev80RtRuLc1WyR
	 3wBANqmD4Run7bR2SjT27+TJ6e++5AEywLe5fvc21+Xwl46lBPlAvJsi6pWIIjd0yo
	 ZN7dzooYreju10t0FYEw7FQ8f9ld2JjqHGmtlFnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8B60F805FA;
	Mon, 21 Oct 2019 13:08:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62980F803D7; Mon, 21 Oct 2019 13:08:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EDABF80321
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 13:08:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EDABF80321
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 04:08:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; d="scan'208";a="203306724"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Oct 2019 04:08:00 -0700
Received: from atirumal-mobl1.amr.corp.intel.com (unknown [10.251.26.228])
 by linux.intel.com (Postfix) with ESMTP id 6E55A58029D;
 Mon, 21 Oct 2019 04:07:59 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190916190952.32388-1-pierre-louis.bossart@linux.intel.com>
 <20190916190952.32388-5-pierre-louis.bossart@linux.intel.com>
 <20191021041404.GY2654@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8ba388e7-e344-068b-b233-8d96903abf6b@linux.intel.com>
Date: Mon, 21 Oct 2019 05:26:28 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021041404.GY2654@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 4/5] soundwire: intel/cadence: add flag
 for interrupt enable
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

On 10/20/19 11:14 PM, Vinod Koul wrote:
> On 16-09-19, 14:09, Pierre-Louis Bossart wrote:
>> Prepare for future PM support and fix error handling by disabling
>> interrupts as needed.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/cadence_master.c | 18 ++++++++++++------
>>   drivers/soundwire/cadence_master.h |  2 +-
>>   drivers/soundwire/intel.c          | 12 +++++++-----
>>   3 files changed, 20 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
>> index 5f900cf2acb9..a71df99ca18f 100644
>> --- a/drivers/soundwire/cadence_master.c
>> +++ b/drivers/soundwire/cadence_master.c
>> @@ -819,14 +819,17 @@ EXPORT_SYMBOL(sdw_cdns_exit_reset);
>>    * sdw_cdns_enable_interrupt() - Enable SDW interrupts and update config
>>    * @cdns: Cadence instance
>>    */
>> -int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>> +int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state)
>>   {
>> -	u32 mask;
>> +	u32 slave_intmask0 = 0;
>> +	u32 slave_intmask1 = 0;
>> +	u32 mask = 0;
>> +
>> +	if (!state)
>> +		goto update_masks;
>>   
>> -	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0,
>> -		    CDNS_MCP_SLAVE_INTMASK0_MASK);
>> -	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1,
>> -		    CDNS_MCP_SLAVE_INTMASK1_MASK);
>> +	slave_intmask0 = CDNS_MCP_SLAVE_INTMASK0_MASK;
>> +	slave_intmask1 = CDNS_MCP_SLAVE_INTMASK1_MASK;
>>   
>>   	/* enable detection of all slave state changes */
>>   	mask = CDNS_MCP_INT_SLAVE_MASK;
>> @@ -849,6 +852,9 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>>   	if (interrupt_mask) /* parameter override */
>>   		mask = interrupt_mask;
>>   
>> +update_masks:
>> +	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0, slave_intmask0);
>> +	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1, slave_intmask1);
>>   	cdns_writel(cdns, CDNS_MCP_INTMASK, mask);
>>   
>>   	/* commit changes */
>> diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
>> index 1a67728c5000..302351808098 100644
>> --- a/drivers/soundwire/cadence_master.h
>> +++ b/drivers/soundwire/cadence_master.h
>> @@ -162,7 +162,7 @@ int sdw_cdns_init(struct sdw_cdns *cdns);
>>   int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
>>   		      struct sdw_cdns_stream_config config);
>>   int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
>> -int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns);
>> +int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state);
>>   
>>   #ifdef CONFIG_DEBUG_FS
>>   void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root);
>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>> index cdb3243e8823..08530c136c5f 100644
>> --- a/drivers/soundwire/intel.c
>> +++ b/drivers/soundwire/intel.c
>> @@ -1036,7 +1036,7 @@ static int intel_probe(struct platform_device *pdev)
>>   	ret = sdw_add_bus_master(&sdw->cdns.bus);
>>   	if (ret) {
>>   		dev_err(&pdev->dev, "sdw_add_bus_master fail: %d\n", ret);
>> -		goto err_master_reg;
>> +		return ret;
> 
> I am not sure I like this line change, before this IIRC the function and
> single place of return, so changing this doesn't seem to improve
> anything here..?

Doing a goto to do a return is not very nice either.

I can change this, but it doesn't really matter: this entire code will 
be removed anyways to get rid of platform_devices and the probe itself 
will be split in two.

> 
>>   	}
>>   
>>   	if (sdw->cdns.bus.prop.hw_disabled) {
>> @@ -1067,7 +1067,7 @@ static int intel_probe(struct platform_device *pdev)
>>   		goto err_init;
>>   	}
>>   
>> -	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
>> +	ret = sdw_cdns_enable_interrupt(&sdw->cdns, true);
>>   	if (ret < 0) {
>>   		dev_err(sdw->cdns.dev, "cannot enable interrupts\n");
>>   		goto err_init;
>> @@ -1076,7 +1076,7 @@ static int intel_probe(struct platform_device *pdev)
>>   	ret = sdw_cdns_exit_reset(&sdw->cdns);
>>   	if (ret < 0) {
>>   		dev_err(sdw->cdns.dev, "unable to exit bus reset sequence\n");
>> -		goto err_init;
>> +		goto err_interrupt;
>>   	}
>>   
>>   	/* Register DAIs */
>> @@ -1084,18 +1084,19 @@ static int intel_probe(struct platform_device *pdev)
>>   	if (ret) {
>>   		dev_err(sdw->cdns.dev, "DAI registration failed: %d\n", ret);
>>   		snd_soc_unregister_component(sdw->cdns.dev);
>> -		goto err_dai;
>> +		goto err_interrupt;
>>   	}
>>   
>>   	intel_debugfs_init(sdw);
>>   
>>   	return 0;
>>   
>> +err_interrupt:
>> +	sdw_cdns_enable_interrupt(&sdw->cdns, false);
>>   err_dai:
> 
> Isn't this unused now?
> 
>>   	free_irq(sdw->res->irq, sdw);
>>   err_init:
>>   	sdw_delete_bus_master(&sdw->cdns.bus);
>> -err_master_reg:
>>   	return ret;
>>   }
>>   
>> @@ -1107,6 +1108,7 @@ static int intel_remove(struct platform_device *pdev)
>>   
>>   	if (!sdw->cdns.bus.prop.hw_disabled) {
>>   		intel_debugfs_exit(sdw);
>> +		sdw_cdns_enable_interrupt(&sdw->cdns, false);
>>   		free_irq(sdw->res->irq, sdw);
>>   		snd_soc_unregister_component(sdw->cdns.dev);
>>   	}
>> -- 
>> 2.20.1
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
