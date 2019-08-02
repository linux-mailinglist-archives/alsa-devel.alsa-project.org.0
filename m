Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D84BB7FFD7
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 19:46:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ACA71705;
	Fri,  2 Aug 2019 19:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ACA71705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564767961;
	bh=uubB88LP3BsEZJQThNWlZNz0AEOt0iGFKioEByC2R+4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KP5ixv7Paw2cPJsauhdHhpvGwDgAGGnTYPg/OtqBHLWN7oQnnWN/4d/mGhWUU3Fzf
	 oTBxOCTjE47oeU+iltVvff1efnQr9CMpFyk+6g4PnYBXXnU+/g1c6k41WkiG+groF8
	 AtaxqdkLNypXJ/aiOr/agHDjoWmhuy97v3QcxtkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ACD8F804CF;
	Fri,  2 Aug 2019 19:45:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21159F804CA; Fri,  2 Aug 2019 19:44:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01226F80214
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 19:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01226F80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 10:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,339,1559545200"; d="scan'208";a="191893041"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2019 10:44:53 -0700
Received: from cwhanson-mobl.amr.corp.intel.com (unknown [10.252.133.191])
 by linux.intel.com (Postfix) with ESMTP id 3CE915800BD;
 Fri,  2 Aug 2019 10:44:52 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-36-pierre-louis.bossart@linux.intel.com>
 <20190802173115.GE12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0d76e6ed-1ab3-6a9d-b33c-deb248d5cb9d@linux.intel.com>
Date: Fri, 2 Aug 2019 12:44:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802173115.GE12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 35/40] soundwire: intel: export helper
	to exit reset
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

On 8/2/19 12:31 PM, Vinod Koul wrote:
> On 25-07-19, 18:40, Pierre-Louis Bossart wrote:
> 
> Here as well

I squashed this with earlier patches to fix the init sequence in one shot

> 
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/cadence_master.c | 9 +++++++--
>>   drivers/soundwire/cadence_master.h | 1 +
>>   drivers/soundwire/intel.c          | 4 ++++
>>   3 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
>> index 4a189e487830..f486fe15fb46 100644
>> --- a/drivers/soundwire/cadence_master.c
>> +++ b/drivers/soundwire/cadence_master.c
>> @@ -780,7 +780,11 @@ EXPORT_SYMBOL(sdw_cdns_thread);
>>    * init routines
>>    */
>>   
>> -static int do_reset(struct sdw_cdns *cdns)
>> +/**
>> + * sdw_cdns_exit_reset() - Program reset parameters and start bus operations
>> + * @cdns: Cadence instance
>> + */
>> +int sdw_cdns_exit_reset(struct sdw_cdns *cdns)
>>   {
>>   	int ret;
>>   
>> @@ -804,6 +808,7 @@ static int do_reset(struct sdw_cdns *cdns)
>>   
>>   	return ret;
>>   }
>> +EXPORT_SYMBOL(sdw_cdns_exit_reset);
>>   
>>   /**
>>    * sdw_cdns_enable_interrupt() - Enable SDW interrupts and update config
>> @@ -839,7 +844,7 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>>   
>>   	cdns_writel(cdns, CDNS_MCP_INTMASK, mask);
>>   
>> -	return do_reset(cdns);
>> +	return 0;
>>   }
>>   EXPORT_SYMBOL(sdw_cdns_enable_interrupt);
>>   
>> diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
>> index de97bc22acb7..2b551f9226f3 100644
>> --- a/drivers/soundwire/cadence_master.h
>> +++ b/drivers/soundwire/cadence_master.h
>> @@ -161,6 +161,7 @@ irqreturn_t sdw_cdns_thread(int irq, void *dev_id);
>>   int sdw_cdns_init(struct sdw_cdns *cdns);
>>   int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
>>   		      struct sdw_cdns_stream_config config);
>> +int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
>>   int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns);
>>   
>>   void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root);
>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>> index a976480d6f36..9ebe38e4d979 100644
>> --- a/drivers/soundwire/intel.c
>> +++ b/drivers/soundwire/intel.c
>> @@ -1112,6 +1112,8 @@ static int intel_probe(struct platform_device *pdev)
>>   
>>   	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
>>   
>> +	ret = sdw_cdns_exit_reset(&sdw->cdns);
>> +
>>   	/* Register DAIs */
>>   	ret = intel_register_dai(sdw);
>>   	if (ret) {
>> @@ -1199,6 +1201,8 @@ static int intel_resume(struct device *dev)
>>   
>>   	sdw_cdns_enable_interrupt(&sdw->cdns);
>>   
>> +	ret = sdw_cdns_exit_reset(&sdw->cdns);
>> +
>>   	return ret;
>>   }
>>   
>> -- 
>> 2.20.1
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
