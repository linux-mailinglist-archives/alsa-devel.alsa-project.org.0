Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB4A7705C
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 19:37:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2112B20C5;
	Fri, 26 Jul 2019 19:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2112B20C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564162661;
	bh=tTX7g1Eq4A2NgmB24DkSDliksxP8CxguetlYO2IpF1U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=od7aZd2tYEux4rZylPBZZ/QMh7TgR1FAIIM7bMwFVwAqc5JWwvfSfbGkTEVMoz7bz
	 vBATkg7DXFO95D8NsKwTo+LLn7BlgliAOttFTFPQw+SgizGw051gQpY+hu+u5B+30h
	 aZDBxs3bzoKJ6PAa4ZARiTPCTLQbmWeeeGXOS9ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55389F803D1;
	Fri, 26 Jul 2019 19:35:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A086F80393; Fri, 26 Jul 2019 19:35:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD444F801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 19:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD444F801A4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 10:35:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="198464400"
Received: from andawes-mobl.amr.corp.intel.com (HELO [10.251.145.66])
 ([10.251.145.66])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2019 10:35:48 -0700
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-39-pierre-louis.bossart@linux.intel.com>
 <20190726160258.GN16003@ubuntu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c6ecaa08-9fdc-d228-8016-9a22241fb689@linux.intel.com>
Date: Fri, 26 Jul 2019 12:35:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726160258.GN16003@ubuntu>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 38/40] soundwire: cadence_master: make
 clock stop exit configurable on init
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


>> -int sdw_cdns_init(struct sdw_cdns *cdns);
>> +int sdw_cdns_init(struct sdw_cdns *cdns, bool clock_stop_exit);
>>   int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
>>   		      struct sdw_cdns_stream_config config);
>>   int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>> index 1192d5775484..db7bf2912767 100644
>> --- a/drivers/soundwire/intel.c
>> +++ b/drivers/soundwire/intel.c
>> @@ -1043,7 +1043,7 @@ static int intel_init(struct sdw_intel *sdw)
>>   	intel_link_power_up(sdw);
>>   	intel_shim_init(sdw);
>>   
>> -	return sdw_cdns_init(&sdw->cdns);
>> +	return sdw_cdns_init(&sdw->cdns, false);
> 
> This is the only caller of this function so far, so, it looks like
> the second argument ATM is always "false." I assume you foresee other
> uses with "true" in the future, otherwise maybe just fix it to false
> in the function?

Since we are at RFC level things are not set in stone, it's not fully 
clear if this test is required or not. I added it since Rander reported 
an error on one of the target platforms that I didn't see personally. 
We'll double-check if it's needed. And if indeed it's needed, yes it'll 
be set to true when we add clock stop.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
