Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAE77FD5F
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 17:18:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BA55176F;
	Fri,  2 Aug 2019 17:17:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BA55176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564759081;
	bh=zMC7erAxUMdUPbzSQgwRR4yQURqY1Vi0Q2M65LItTIA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C0bSV22QH67DA5wFMtmkjVGNrAlUnMVlGrs9kZ5YGDKSV3UqT+AY52SMX7FXJe0HC
	 iPYSBS6NzdBc0BcSg6SILLlYQiwL1WrB5wwz7bF3Zwyj0R9mXFIVHR5y8/mCI4r7Hh
	 QaDv4FYAqPZJPdWutxAMNVuVDHspVEY8eIopUXdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3722F80214;
	Fri,  2 Aug 2019 17:16:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27F18F8048F; Fri,  2 Aug 2019 17:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CB4BF800F3
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 17:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CB4BF800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 08:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="175609709"
Received: from vivekcha-mobl1.amr.corp.intel.com (HELO [10.251.131.115])
 ([10.251.131.115])
 by orsmga003.jf.intel.com with ESMTP; 02 Aug 2019 08:16:09 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-7-pierre-louis.bossart@linux.intel.com>
 <20190802115537.GI12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6da5aeef-40bf-c9bb-fc18-4ac0b3961857@linux.intel.com>
Date: Fri, 2 Aug 2019 10:16:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802115537.GI12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 06/40] soundwire: intel: prevent
 possible dereference in hw_params
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



On 8/2/19 6:55 AM, Vinod Koul wrote:
> On 25-07-19, 18:39, Pierre-Louis Bossart wrote:
>> This should not happen in production systems but we should test for
>> all callback arguments before invoking the config_stream callback.
> 
> so you are saying callback arg is mandatory, if so please document that
> assumption

no, what this says is that if a config_stream is provided then it needs 
to have a valid argument.

I am not sure what you mean by "document that assumption", comment in 
the code (where?) or SoundWire documentation?

> 
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/intel.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>> index 68832e613b1e..497879dd9c0d 100644
>> --- a/drivers/soundwire/intel.c
>> +++ b/drivers/soundwire/intel.c
>> @@ -509,7 +509,7 @@ static int intel_config_stream(struct sdw_intel *sdw,
>>   			       struct snd_soc_dai *dai,
>>   			       struct snd_pcm_hw_params *hw_params, int link_id)
>>   {
>> -	if (sdw->res->ops && sdw->res->ops->config_stream)
>> +	if (sdw->res->ops && sdw->res->ops->config_stream && sdw->res->arg)
>>   		return sdw->res->ops->config_stream(sdw->res->arg,
>>   				substream, dai, hw_params, link_id);
>>   
>> -- 
>> 2.20.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
