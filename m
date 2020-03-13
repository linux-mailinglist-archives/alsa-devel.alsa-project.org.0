Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3969184DB0
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 18:33:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48C5C184A;
	Fri, 13 Mar 2020 18:32:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48C5C184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584120808;
	bh=bp27oxQxkXeM44xRp8ljFtkNva7cM79h7+f+R5mEULM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DHuFN9u6r8mYAmS1lmhzohTE+YxIWJjNtVHpktOY8svZw4w1NnRQI2RikJeD+OI0c
	 IL0qDN7rKkT5JMQT/YvlbdUO9GkS6n4mXoepAcCQa79/4ybONWTXwHxgqtqOrE7kAR
	 EZ3biphFNK1ZxPaqa2k6IZvEriNcwe2r1mkMbDYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05A10F802C3;
	Fri, 13 Mar 2020 18:29:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3EA0F802C3; Fri, 13 Mar 2020 18:29:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63206F802BD
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 18:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63206F802BD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 10:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; d="scan'208";a="237017311"
Received: from sblancoa-mobl.amr.corp.intel.com (HELO [10.251.232.239])
 ([10.251.232.239])
 by fmsmga008.fm.intel.com with ESMTP; 13 Mar 2020 10:29:02 -0700
Subject: Re: [PATCH 05/16] soundwire: cadence: add clock_stop/restart routines
To: Vinod Koul <vkoul@kernel.org>
References: <20200311184128.4212-1-pierre-louis.bossart@linux.intel.com>
 <20200311184128.4212-6-pierre-louis.bossart@linux.intel.com>
 <20200313122156.GG4885@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6d38a58a-a840-169a-1078-e10c278c11fd@linux.intel.com>
Date: Fri, 13 Mar 2020 12:07:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313122156.GG4885@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>, Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 3/13/20 7:21 AM, Vinod Koul wrote:
> On 11-03-20, 13:41, Pierre-Louis Bossart wrote:
> 
>> @@ -225,12 +225,30 @@ static int cdns_clear_bit(struct sdw_cdns *cdns, int offset, u32 value)
>>   			return 0;
>>   
>>   		timeout--;
>> -		udelay(50);
>> +		usleep_range(50, 100);
> 
> this seems okay change, but unrelated to this patch

ok. It doesn't really matter anyway, this function is removed in Patch 8

>> +int sdw_cdns_clock_stop(struct sdw_cdns *cdns, bool block_wake)
>> +{
>> +	bool slave_present = false;
>> +	struct sdw_slave *slave;
>> +	u32 status;
>> +	int ret;
>> +
>> +	/* Check suspend status */
>> +	status = cdns_readl(cdns, CDNS_MCP_STAT);
>> +	if (status & CDNS_MCP_STAT_CLK_STOP) {
>> +		dev_dbg(cdns->dev, "Clock is already stopped\n");
>> +		return 1;
> 
> return of 1..? Does that indicate success/fail..?

success. I guess it could be moved as 0.

		ret = sdw_cdns_clock_stop(cdns, true);
		if (ret < 0) {
			dev_err(dev, "cannot enable clock stop on suspend\n");
			return ret;
		}

