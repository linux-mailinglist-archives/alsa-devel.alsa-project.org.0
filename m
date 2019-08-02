Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B537FD0F
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 17:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED57C175A;
	Fri,  2 Aug 2019 17:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED57C175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564758623;
	bh=014Xy3rIVuvAfyK9BrZsV1D1YP/zE/kRb7ZY/4NeFsM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TXEPddcBh/guQ7WTAU2lyL9F4sm09cYsgJTxyc8q0GxwAj6zPMJc0FCbdBWbDoZlt
	 f9ayGeDfGk3/K86F4Ek/+JAiHq0XdjOZzvS1m57XcHjI71iQ/qcUcm7ogEkze/hEYw
	 6pnSGeFsKA9PCQFyj4/qhIH764ttxZweuwFXkKWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F202F8048E;
	Fri,  2 Aug 2019 17:08:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F8F0F8048F; Fri,  2 Aug 2019 17:08:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7454F80214
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 17:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7454F80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 08:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="175607546"
Received: from vivekcha-mobl1.amr.corp.intel.com (HELO [10.251.131.115])
 ([10.251.131.115])
 by orsmga003.jf.intel.com with ESMTP; 02 Aug 2019 08:08:29 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-6-pierre-louis.bossart@linux.intel.com>
 <20190802115359.GH12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c4cca5ba-0ef9-9f31-148a-5aa94baddd85@linux.intel.com>
Date: Fri, 2 Aug 2019 10:08:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802115359.GH12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 05/40] soundwire: intel: move interrupt
 enable after interrupt handler registration
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



On 8/2/19 6:53 AM, Vinod Koul wrote:
> On 25-07-19, 18:39, Pierre-Louis Bossart wrote:
>> Not sure why the existing code would enable interrupts without the
>> ability to deal with them.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/intel.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>> index aeadc341c0a3..68832e613b1e 100644
>> --- a/drivers/soundwire/intel.c
>> +++ b/drivers/soundwire/intel.c
>> @@ -981,8 +981,6 @@ static int intel_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_init;
>>   
>> -	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
>> -
>>   	/* Read the PDI config and initialize cadence PDI */
>>   	intel_pdi_init(sdw, &config);
>>   	ret = sdw_cdns_pdi_init(&sdw->cdns, config);
>> @@ -1000,6 +998,8 @@ static int intel_probe(struct platform_device *pdev)
>>   		goto err_init;
>>   	}
>>   
>> +	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
> 
> we should also handle the return

yes, fixed already
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
