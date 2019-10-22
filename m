Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B4EE2238
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 19:59:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51151165F;
	Wed, 23 Oct 2019 19:58:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51151165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571853588;
	bh=DA1hqzMVWNksRoCkcITe/TJlcYfdw4x0jyKToKmxWoI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AfzSHD4KM2Ev2aim8rA/EjPcy4bLqWSgXeFu9nYmCMsr21JTG3oIt848xbq8BrDPH
	 YmEtAdEbCtNGKdoAIXutcaFYkQem1EIbahhLhnJfzQVO2lJCeXGj5RHPXgCj3R9qCt
	 NymOH0weT+d9fJs+x1eftwwsy3l1dWhZvh1mUt38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE9D5F80368;
	Wed, 23 Oct 2019 19:58:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3AF5F80368; Wed, 23 Oct 2019 19:58:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DATE_IN_PAST_12_24,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1456F80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 19:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1456F80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 10:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; d="scan'208";a="196854544"
Received: from kmaklai-mobl2.amr.corp.intel.com (HELO [10.252.137.221])
 ([10.252.137.221])
 by fmsmga008.fm.intel.com with ESMTP; 23 Oct 2019 10:57:52 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190916190952.32388-1-pierre-louis.bossart@linux.intel.com>
 <20190916190952.32388-5-pierre-louis.bossart@linux.intel.com>
 <20191021041404.GY2654@vkoul-mobl>
 <8ba388e7-e344-068b-b233-8d96903abf6b@linux.intel.com>
 <20191022045518.GJ2654@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c6aeb19f-8646-6396-10a7-47acac540106@linux.intel.com>
Date: Tue, 22 Oct 2019 15:41:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191022045518.GJ2654@vkoul-mobl>
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



On 10/21/19 11:55 PM, Vinod Koul wrote:
> On 21-10-19, 05:26, Pierre-Louis Bossart wrote:
>> On 10/20/19 11:14 PM, Vinod Koul wrote:
>>> On 16-09-19, 14:09, Pierre-Louis Bossart wrote:
>>>> Prepare for future PM support and fix error handling by disabling
>>>> interrupts as needed.
>>>>
>>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>> ---
>>>>    drivers/soundwire/cadence_master.c | 18 ++++++++++++------
>>>>    drivers/soundwire/cadence_master.h |  2 +-
>>>>    drivers/soundwire/intel.c          | 12 +++++++-----
>>>>    3 files changed, 20 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
>>>> index 5f900cf2acb9..a71df99ca18f 100644
>>>> --- a/drivers/soundwire/cadence_master.c
>>>> +++ b/drivers/soundwire/cadence_master.c
>>>> @@ -819,14 +819,17 @@ EXPORT_SYMBOL(sdw_cdns_exit_reset);
>>>>     * sdw_cdns_enable_interrupt() - Enable SDW interrupts and update config
>>>>     * @cdns: Cadence instance
>>>>     */
>>>> -int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>>>> +int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state)
>>>>    {
>>>> -	u32 mask;
>>>> +	u32 slave_intmask0 = 0;
>>>> +	u32 slave_intmask1 = 0;
>>>> +	u32 mask = 0;
>>>> +
>>>> +	if (!state)
>>>> +		goto update_masks;
>>>> -	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0,
>>>> -		    CDNS_MCP_SLAVE_INTMASK0_MASK);
>>>> -	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1,
>>>> -		    CDNS_MCP_SLAVE_INTMASK1_MASK);
>>>> +	slave_intmask0 = CDNS_MCP_SLAVE_INTMASK0_MASK;
>>>> +	slave_intmask1 = CDNS_MCP_SLAVE_INTMASK1_MASK;
>>>>    	/* enable detection of all slave state changes */
>>>>    	mask = CDNS_MCP_INT_SLAVE_MASK;
>>>> @@ -849,6 +852,9 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>>>>    	if (interrupt_mask) /* parameter override */
>>>>    		mask = interrupt_mask;
>>>> +update_masks:
>>>> +	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0, slave_intmask0);
>>>> +	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1, slave_intmask1);
>>>>    	cdns_writel(cdns, CDNS_MCP_INTMASK, mask);
>>>>    	/* commit changes */
>>>> diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
>>>> index 1a67728c5000..302351808098 100644
>>>> --- a/drivers/soundwire/cadence_master.h
>>>> +++ b/drivers/soundwire/cadence_master.h
>>>> @@ -162,7 +162,7 @@ int sdw_cdns_init(struct sdw_cdns *cdns);
>>>>    int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
>>>>    		      struct sdw_cdns_stream_config config);
>>>>    int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
>>>> -int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns);
>>>> +int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state);
>>>>    #ifdef CONFIG_DEBUG_FS
>>>>    void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root);
>>>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>>>> index cdb3243e8823..08530c136c5f 100644
>>>> --- a/drivers/soundwire/intel.c
>>>> +++ b/drivers/soundwire/intel.c
>>>> @@ -1036,7 +1036,7 @@ static int intel_probe(struct platform_device *pdev)
>>>>    	ret = sdw_add_bus_master(&sdw->cdns.bus);
>>>>    	if (ret) {
>>>>    		dev_err(&pdev->dev, "sdw_add_bus_master fail: %d\n", ret);
>>>> -		goto err_master_reg;
>>>> +		return ret;
>>>
>>> I am not sure I like this line change, before this IIRC the function and
>>> single place of return, so changing this doesn't seem to improve
>>> anything here..?
>>
>> Doing a goto to do a return is not very nice either.
> 
> Hrmm, isn't that what you are doing few lines below. The point here is
> that this line of change here doesnt change anything, doesnt improve
> anything so why change :)

I knew there was a reason.. the existing code on your soundwire/next 
branch mixes goto and return, so I chose to use a return for the first 
case as well.

	ret = sdw_add_bus_master(&sdw->cdns.bus);
	if (ret) {
		dev_err(&pdev->dev, "sdw_add_bus_master fail: %d\n", ret);
		goto err_master_reg; >>> changed to return ret;
	}

	if (sdw->cdns.bus.prop.hw_disabled) {
		dev_info(&pdev->dev, "SoundWire master %d is disabled, ignoring\n",
			 sdw->cdns.bus.link_id);
		return 0;
	}



> 
>> I can change this, but it doesn't really matter: this entire code will be
>> removed anyways to get rid of platform_devices and the probe itself will be
>> split in two.
>>
>>>
>>>>    	}
>>>>    	if (sdw->cdns.bus.prop.hw_disabled) {
>>>> @@ -1067,7 +1067,7 @@ static int intel_probe(struct platform_device *pdev)
>>>>    		goto err_init;
>>>>    	}
>>>> -	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
>>>> +	ret = sdw_cdns_enable_interrupt(&sdw->cdns, true);
>>>>    	if (ret < 0) {
>>>>    		dev_err(sdw->cdns.dev, "cannot enable interrupts\n");
>>>>    		goto err_init;
>>>> @@ -1076,7 +1076,7 @@ static int intel_probe(struct platform_device *pdev)
>>>>    	ret = sdw_cdns_exit_reset(&sdw->cdns);
>>>>    	if (ret < 0) {
>>>>    		dev_err(sdw->cdns.dev, "unable to exit bus reset sequence\n");
>>>> -		goto err_init;
>>>> +		goto err_interrupt;
>>>>    	}
>>>>    	/* Register DAIs */
>>>> @@ -1084,18 +1084,19 @@ static int intel_probe(struct platform_device *pdev)
>>>>    	if (ret) {
>>>>    		dev_err(sdw->cdns.dev, "DAI registration failed: %d\n", ret);
>>>>    		snd_soc_unregister_component(sdw->cdns.dev);
>>>> -		goto err_dai;
>>>> +		goto err_interrupt;
>>>>    	}
>>>>    	intel_debugfs_init(sdw);
>>>>    	return 0;
>>>> +err_interrupt:
>>>> +	sdw_cdns_enable_interrupt(&sdw->cdns, false);
>>>>    err_dai:
>>>
>>> Isn't this unused now?
> 
> ??? you missed this.

fixed.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
