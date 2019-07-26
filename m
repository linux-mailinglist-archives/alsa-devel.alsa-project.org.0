Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D79076FB9
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 19:24:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D47F320BE;
	Fri, 26 Jul 2019 19:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D47F320BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564161853;
	bh=W4uCi3VUM5kmtZS2VxD+FLZIHjuvmzUeG1xlOE057qA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UB1XaZeVrJDjKEPWDtQakRdEnC8kKpAboaPtZAcaR3tBCu16QcgEzUWJ3j3V4yZCW
	 u593pdUsByLhMdH6hPSAFYB6jDnGsSun1F2Q674HJnjKhh1KoYbTKZbiaAnEsga925
	 2sEuMt7CYOzsz4pKuxRLV7AhX2cLuniG/1iQiICA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4669F80393;
	Fri, 26 Jul 2019 19:22:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A01CF80393; Fri, 26 Jul 2019 19:22:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AE75F801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 19:22:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AE75F801A4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 10:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="198460217"
Received: from andawes-mobl.amr.corp.intel.com (HELO [10.251.145.66])
 ([10.251.145.66])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2019 10:22:15 -0700
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-36-pierre-louis.bossart@linux.intel.com>
 <20190726155213.GK16003@ubuntu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4b1f657c-e75f-d817-aa86-4224ce459a01@linux.intel.com>
Date: Fri, 26 Jul 2019 12:22:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726155213.GK16003@ubuntu>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
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
> 
> This isn't something, that this patch changes, but if the return value above is
> ignored, maybe no need to assign it at all?

The return of these two functions was used with in some logs at some 
point but they obviously vanished.
I'll re-check if we care about the status, could be that it never fails
Thanks!


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
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
