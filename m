Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0355A838B
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 15:18:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D73016C5;
	Wed,  4 Sep 2019 15:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D73016C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567603108;
	bh=65LGLPa6SBjF836JWPQ5yr1eVNohhTjPROnroOSwlTA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fv4+Savw4F06+xJ+7ftX9LZ99zFTaH8N/HKSOIU8htGuf6NcRArWg8stny1PlIvpS
	 WlzeMAevnhk7vFDHXSlRx+q9MoucJVSwAEdgYtpK8nmE4Lzhnm1igR3Owlyn9SkdaV
	 8uLnfiPdNIQ0PR85raBJHaiW0+CTiY795khoeVO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF3B2F803D6;
	Wed,  4 Sep 2019 15:16:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A2AFF803A6; Wed,  4 Sep 2019 15:16:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBD60F80228
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 15:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBD60F80228
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 06:16:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,467,1559545200"; d="scan'208";a="207475102"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 04 Sep 2019 06:16:35 -0700
Received: from ravisha1-mobl1.amr.corp.intel.com (unknown [10.255.36.89])
 by linux.intel.com (Postfix) with ESMTP id 7846A580105;
 Wed,  4 Sep 2019 06:16:33 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190813213227.5163-1-pierre-louis.bossart@linux.intel.com>
 <20190813213227.5163-2-pierre-louis.bossart@linux.intel.com>
 <20190904071108.GI2672@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dc16e4d8-1d95-542c-869e-bdefc37d059b@linux.intel.com>
Date: Wed, 4 Sep 2019 08:16:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904071108.GI2672@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 1/6] soundwire: fix startup sequence for
 Intel/Cadence
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

On 9/4/19 2:11 AM, Vinod Koul wrote:
> On 13-08-19, 16:32, Pierre-Louis Bossart wrote:
>> Multiple changes squashed in single patch to avoid tick-tock effect.
>>
>> 1. Per the hardware documentation, all changes to MCP_CONFIG,
>> MCP_CONTROL, MCP_CMDCTRL and MCP_PHYCTRL need to be validated with a
>> self-clearing write to MCP_CONFIG_UPDATE. Add a helper and do the
>> update when the CONFIG is changed.
>>
>> 2. Move interrupt enable after interrupt handler registration
>>
>> 3. Add a new helper to start the hardware bus reset with maximum duration
>> to make sure the Slave(s) correctly detect the reset pattern and to
>> ensure electrical conflicts can be resolved.
>>
>> 4. flush command FIFOs
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/cadence_master.c | 84 +++++++++++++++++++++---------
>>   drivers/soundwire/cadence_master.h |  1 +
>>   drivers/soundwire/intel.c          | 14 ++++-
>>   3 files changed, 73 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
>> index 502ed4ec8f07..046622e4b264 100644
>> --- a/drivers/soundwire/cadence_master.c
>> +++ b/drivers/soundwire/cadence_master.c
>> @@ -231,6 +231,22 @@ static int cdns_clear_bit(struct sdw_cdns *cdns, int offset, u32 value)
>>   	return -EAGAIN;
>>   }
>>   
>> +/*
>> + * all changes to the MCP_CONFIG, MCP_CONTROL, MCP_CMDCTRL and MCP_PHYCTRL
>> + * need to be confirmed with a write to MCP_CONFIG_UPDATE
>> + */
>> +static int cdns_update_config(struct sdw_cdns *cdns)
>> +{
>> +	int ret;
>> +
>> +	ret = cdns_clear_bit(cdns, CDNS_MCP_CONFIG_UPDATE,
>> +			     CDNS_MCP_CONFIG_UPDATE_BIT);
>> +	if (ret < 0)
>> +		dev_err(cdns->dev, "Config update timedout\n");
>> +
>> +	return ret;
>> +}
>> +
>>   /*
>>    * debugfs
>>    */
>> @@ -752,7 +768,42 @@ EXPORT_SYMBOL(sdw_cdns_thread);
>>   /*
>>    * init routines
>>    */
>> -static int _cdns_enable_interrupt(struct sdw_cdns *cdns)
>> +
>> +/**
>> + * sdw_cdns_exit_reset() - Program reset parameters and start bus operations
>> + * @cdns: Cadence instance
>> + */
>> +int sdw_cdns_exit_reset(struct sdw_cdns *cdns)
>> +{
>> +	int ret;
>> +
>> +	/* program maximum length reset to be safe */
>> +	cdns_updatel(cdns, CDNS_MCP_CONTROL,
>> +		     CDNS_MCP_CONTROL_RST_DELAY,
>> +		     CDNS_MCP_CONTROL_RST_DELAY);
>> +
>> +	/* use hardware generated reset */
>> +	cdns_updatel(cdns, CDNS_MCP_CONTROL,
>> +		     CDNS_MCP_CONTROL_HW_RST,
>> +		     CDNS_MCP_CONTROL_HW_RST);
>> +
>> +	/* enable bus operations with clock and data */
>> +	cdns_updatel(cdns, CDNS_MCP_CONFIG,
>> +		     CDNS_MCP_CONFIG_OP,
>> +		     CDNS_MCP_CONFIG_OP_NORMAL);
>> +
>> +	/* commit changes */
>> +	ret = cdns_update_config(cdns);
>> +
>> +	return ret;
> 
> return cdns_update_config() ?

ok

> 
> 
>> +}
>> +EXPORT_SYMBOL(sdw_cdns_exit_reset);
>> +
>> +/**
>> + * sdw_cdns_enable_interrupt() - Enable SDW interrupts and update config
>> + * @cdns: Cadence instance
>> + */
>> +int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>>   {
>>   	u32 mask;
>>   
>> @@ -784,24 +835,8 @@ static int _cdns_enable_interrupt(struct sdw_cdns *cdns)
>>   
>>   	cdns_writel(cdns, CDNS_MCP_INTMASK, mask);
>>   
>> -	return 0;
>> -}
>> -
>> -/**
>> - * sdw_cdns_enable_interrupt() - Enable SDW interrupts and update config
>> - * @cdns: Cadence instance
>> - */
>> -int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>> -{
>> -	int ret;
>> -
>> -	_cdns_enable_interrupt(cdns);
>> -	ret = cdns_clear_bit(cdns, CDNS_MCP_CONFIG_UPDATE,
>> -			     CDNS_MCP_CONFIG_UPDATE_BIT);
>> -	if (ret < 0)
>> -		dev_err(cdns->dev, "Config update timedout\n");
>> -
>> -	return ret;
>> +	/* commit changes */
>> +	return cdns_update_config(cdns);
>>   }
>>   EXPORT_SYMBOL(sdw_cdns_enable_interrupt);
>>   
>> @@ -975,6 +1010,10 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
>>   	cdns_writel(cdns, CDNS_MCP_SSP_CTRL0, CDNS_DEFAULT_SSP_INTERVAL);
>>   	cdns_writel(cdns, CDNS_MCP_SSP_CTRL1, CDNS_DEFAULT_SSP_INTERVAL);
>>   
>> +	/* flush command FIFOs */
>> +	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_RST,
>> +		     CDNS_MCP_CONTROL_CMD_RST);
>> +
>>   	/* Set cmd accept mode */
>>   	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_ACCEPT,
>>   		     CDNS_MCP_CONTROL_CMD_ACCEPT);
>> @@ -997,13 +1036,10 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
>>   	/* Set cmd mode for Tx and Rx cmds */
>>   	val &= ~CDNS_MCP_CONFIG_CMD;
>>   
>> -	/* Set operation to normal */
>> -	val &= ~CDNS_MCP_CONFIG_OP;
>> -	val |= CDNS_MCP_CONFIG_OP_NORMAL;
>> -
>>   	cdns_writel(cdns, CDNS_MCP_CONFIG, val);
>>   
>> -	return 0;
>> +	/* commit changes */
>> +	return cdns_update_config(cdns);
>>   }
>>   EXPORT_SYMBOL(sdw_cdns_init);
>>   
>> diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
>> index 0b72b7094735..1a67728c5000 100644
>> --- a/drivers/soundwire/cadence_master.h
>> +++ b/drivers/soundwire/cadence_master.h
>> @@ -161,6 +161,7 @@ irqreturn_t sdw_cdns_thread(int irq, void *dev_id);
>>   int sdw_cdns_init(struct sdw_cdns *cdns);
>>   int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
>>   		      struct sdw_cdns_stream_config config);
>> +int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
>>   int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns);
>>   
>>   #ifdef CONFIG_DEBUG_FS
>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>> index 13c54eac0cc3..5f14c6acce80 100644
>> --- a/drivers/soundwire/intel.c
>> +++ b/drivers/soundwire/intel.c
> 
> As I have said in the past it doesnt help having a patch touching two
> components. The patch is titled cadence!

no, it's called 'fix startup sequence for Intel/Cadence' and it's 
intentional to modify the two parts in a single patch.
I tried to split this but it's very difficult due to the dependencies. 
If you look at all the initial comments from early July people were lost 
when I did these changes in steps. I try to keep patches local and 
self-contained, but in this case it's nearly impossible or makes the 
review very hard for no good reason.

> 
>> @@ -1043,8 +1043,6 @@ static int intel_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_init;
>>   
>> -	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
>> -
>>   	/* Read the PDI config and initialize cadence PDI */
>>   	intel_pdi_init(sdw, &config);
>>   	ret = sdw_cdns_pdi_init(&sdw->cdns, config);
>> @@ -1062,6 +1060,18 @@ static int intel_probe(struct platform_device *pdev)
>>   		goto err_init;
>>   	}
>>   
>> +	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
>> +	if (ret < 0) {
>> +		dev_err(sdw->cdns.dev, "cannot enable interrupts\n");
>> +		goto err_init;
>> +	}
>> +
>> +	ret = sdw_cdns_exit_reset(&sdw->cdns);
>> +	if (ret < 0) {
>> +		dev_err(sdw->cdns.dev, "unable to exit bus reset sequence\n");
>> +		goto err_init;
> 
> Don't you want to disable interrupts at least... before you return
> error? err_init does bus cleanup and not controller one

yes good point, let me look at this.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
