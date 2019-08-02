Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDD97FD92
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 17:31:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123991789;
	Fri,  2 Aug 2019 17:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123991789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564759882;
	bh=lNFRZLyGawlNjuoYayV+AVIAuccdeQEE4q82q7y8ciA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LyHmLve6drm2lHrdp+eGa0y2JgNWanUJ2Bt9jNjv8vNdQcya5YZiLR4sSdHlwUFs+
	 iYzI9YDIh5EadY1c1HXi+JQs5zQ8zLATdUB3qesm5NfsLp9fe574cGs5b99cD+eGEG
	 6WHnImA1QnSmPhYATgee1Hx/Y41MJtpBTuS5DUsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53693F8048E;
	Fri,  2 Aug 2019 17:29:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E1C4F8048F; Fri,  2 Aug 2019 17:29:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 923E3F800F3
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 17:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 923E3F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 08:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="175612955"
Received: from vivekcha-mobl1.amr.corp.intel.com (HELO [10.251.131.115])
 ([10.251.131.115])
 by orsmga003.jf.intel.com with ESMTP; 02 Aug 2019 08:29:27 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-16-pierre-louis.bossart@linux.intel.com>
 <20190802122003.GQ12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c4d31804-48af-30e3-4b4f-4b03dac6addd@linux.intel.com>
Date: Fri, 2 Aug 2019 10:29:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802122003.GQ12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 15/40] soundwire: cadence_master:
 handle multiple status reports per Slave
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



On 8/2/19 7:20 AM, Vinod Koul wrote:
> On 25-07-19, 18:40, Pierre-Louis Bossart wrote:
>> When a Slave reports multiple status in the sticky bits, find the
>> latest configuration from the mirror of the PING frame status and
>> update the status directly.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/cadence_master.c | 34 ++++++++++++++++++++++++------
>>   1 file changed, 28 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
>> index 889fa2cd49ae..25d5c7267c15 100644
>> --- a/drivers/soundwire/cadence_master.c
>> +++ b/drivers/soundwire/cadence_master.c
>> @@ -643,13 +643,35 @@ static int cdns_update_slave_status(struct sdw_cdns *cdns,
>>   
>>   		/* first check if Slave reported multiple status */
>>   		if (set_status > 1) {
>> +			u32 val;
>> +
>>   			dev_warn_ratelimited(cdns->dev,
>> -					     "Slave reported multiple Status: %d\n",
>> -					     mask);
>> -			/*
>> -			 * TODO: we need to reread the status here by
>> -			 * issuing a PING cmd
>> -			 */
>> +					     "Slave %d reported multiple Status: %d\n",
>> +					     i, mask);
>> +
>> +			/* re-check latest status extracted from PING commands */
>> +			val = cdns_readl(cdns, CDNS_MCP_SLAVE_STAT);
>> +			val >>= (i * 2);
>> +
>> +			switch (val & 0x3) {
>> +			case 0:
> 
> why not case CDNS_MCP_SLAVE_INTSTAT_NPRESENT:

ok

> 
>> +				status[i] = SDW_SLAVE_UNATTACHED;
>> +				break;
>> +			case 1:
>> +				status[i] = SDW_SLAVE_ATTACHED;
>> +				break;
>> +			case 2:
>> +				status[i] = SDW_SLAVE_ALERT;
>> +				break;
>> +			default:
>> +				status[i] = SDW_SLAVE_RESERVED;
>> +				break;
>> +			}
> 
> we have same logic in the code block preceding this, maybe good idea to
> write a helper and use for both

Yes, I am thinking about this. There are multiple cases where we want to 
re-check the status and clear some bits, so helpers would be good.

> 
> Also IIRC we can have multiple status set right?

Yes, the status bits are sticky and mirror all values reported in PING 
frames. I am still working on how to clear those bits, there are cases 
where we clear bits and end-up never hearing from that device ever 
again. classic edge/level issue I suppose.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
