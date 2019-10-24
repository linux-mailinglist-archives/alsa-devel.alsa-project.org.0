Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D826E3281
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 14:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C3AA16C5;
	Thu, 24 Oct 2019 14:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C3AA16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571920729;
	bh=oplLp87l1+rSwmpWPKQppv8NUO/a87WU/7MA4neNIZM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gI2DprtkoLcRSgmwRqfwevmU+qKMoU1FjGEIXKX7LOaRcMmMOwCucz5HfKRDjUnkw
	 RIflK6AiEL5DWgVbjA8Mo2+WnPTUrcEy57XTAJusbxs0W4QMXqFcMIY98lJ+QpJ3iJ
	 XEghHEWBlCEnd78ixLIu/1IVVktbrWwGRHHF6/lo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBAFDF8036B;
	Thu, 24 Oct 2019 14:37:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1BC6F8036B; Thu, 24 Oct 2019 14:37:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E15B3F80274
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 14:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E15B3F80274
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 05:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; d="scan'208";a="373201097"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 24 Oct 2019 05:36:55 -0700
Received: from atirumal-mobl1.amr.corp.intel.com (unknown [10.251.26.228])
 by linux.intel.com (Postfix) with ESMTP id 1888258013F;
 Thu, 24 Oct 2019 05:36:54 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20191022232948.17156-1-pierre-louis.bossart@linux.intel.com>
 <20191024112356.GA2620@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6bcfe0bc-5b8e-fb23-f221-b82f2201feb9@linux.intel.com>
Date: Thu, 24 Oct 2019 07:37:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024112356.GA2620@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] soundwire: intel: fix PDI/stream mapping
 for Bulk
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

On 10/24/19 6:23 AM, Vinod Koul wrote:
> On 22-10-19, 18:29, Pierre-Louis Bossart wrote:
>> The previous formula is incorrect for PDI0/1, the mapping is not
>> linear but has a discontinuity between PDI1 and PDI2.
>>
>> This change has no effect on PCM PDIs (same mapping).
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/intel.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>> index b403ccc832b6..c984261fcc33 100644
>> --- a/drivers/soundwire/intel.c
>> +++ b/drivers/soundwire/intel.c
>> @@ -480,7 +480,10 @@ intel_pdi_shim_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
>>   	unsigned int link_id = sdw->instance;
>>   	int pdi_conf = 0;
>>   
>> -	pdi->intel_alh_id = (link_id * 16) + pdi->num + 5;
>> +	/* the Bulk and PCM streams are not contiguous */
>> +	pdi->intel_alh_id = (link_id * 16) + pdi->num + 3;
>> +	if (pdi->num >= 2)
>> +		pdi->intel_alh_id += 2;
>>   
>>   	/*
>>   	 * Program stream parameters to stream SHIM register
>> @@ -509,7 +512,10 @@ intel_pdi_alh_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
>>   	unsigned int link_id = sdw->instance;
>>   	unsigned int conf;
>>   
>> -	pdi->intel_alh_id = (link_id * 16) + pdi->num + 5;
>> +	/* the Bulk and PCM streams are not contiguous */
>> +	pdi->intel_alh_id = (link_id * 16) + pdi->num + 3;
>> +	if (pdi->num >= 2)
>> +		pdi->intel_alh_id += 2;
> 
> The change is repeated so how about:
> 
>          intel_pdi_update_alh() or similar which does this rather than
> repeat the pattern

The initial code was also repeated by the initial contributors, this 
patch does not refactor the code but corrects an invalid mapping. We 
will do this refactoring at a later point, when we add the clock-stop mode.

> 
>>   
>>   	/* Program Stream config ALH register */
>>   	conf = intel_readl(alh, SDW_ALH_STRMZCFG(pdi->intel_alh_id));
>> -- 
>> 2.20.1
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
