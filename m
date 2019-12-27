Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A076A12BBE5
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Dec 2019 01:19:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CD09177C;
	Sat, 28 Dec 2019 01:18:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CD09177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577492386;
	bh=tK/B5GgtwA4PvsA748+zxqJXQ6Uq4N1c3BNoFUnYYu8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FMFGa6o5eyW53cMv7+7/osIUb2T19PhnUSpiHboQidWul3ADwFpq1lOLNibfHx4wa
	 ReiSuwf+T08oluleJZgo7MmUitZ5JEYZo2AlTBo1k01VWKBSJTPyaRff+gsxCRQaen
	 ClZzaDwonciWmopQC8pGX+mrROb19Q13tl5BkaZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45838F80274;
	Sat, 28 Dec 2019 01:16:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDB70F801F4; Sat, 28 Dec 2019 01:16:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99B00F80145
 for <alsa-devel@alsa-project.org>; Sat, 28 Dec 2019 01:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99B00F80145
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Dec 2019 16:16:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,364,1571727600"; d="scan'208";a="243364217"
Received: from vdoan2-mobl.ccr.corp.intel.com (HELO [10.251.152.151])
 ([10.251.152.151])
 by fmsmga004.fm.intel.com with ESMTP; 27 Dec 2019 16:16:08 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-7-pierre-louis.bossart@linux.intel.com>
 <20191227070301.GK3006@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2913a70d-f1e1-7d91-eb3c-33005c5c4007@linux.intel.com>
Date: Fri, 27 Dec 2019 17:26:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191227070301.GK3006@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 06/17] soundwire: add support for
 sdw_slave_type
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


>>   static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>>   {
>> -	struct sdw_slave *slave = to_sdw_slave_device(dev);
>> +	struct sdw_slave *slave;
>>   	char modalias[32];
>>   
>> -	sdw_slave_modalias(slave, modalias, sizeof(modalias));
>> -
>> -	if (add_uevent_var(env, "MODALIAS=%s", modalias))
>> -		return -ENOMEM;
>> +	if (is_sdw_slave(dev)) {
>> +		slave = to_sdw_slave_device(dev);
>> +
>> +		sdw_slave_modalias(slave, modalias, sizeof(modalias));
>> +
>> +		if (add_uevent_var(env, "MODALIAS=%s", modalias))
>> +			return -ENOMEM;
>> +	} else {
>> +		/*
>> +		 * We only need to handle uevents for the Slave device
>> +		 * type. This error cannot happen unless the .uevent
>> +		 * callback is set to use this function for a
>> +		 * different device type (e.g. Master or Monitor)
>> +		 */
>> +		dev_err(dev, "uevent for unknown Soundwire type\n");
>> +		return -EINVAL;
> 
> At this point and after next patch, the above code would be a no-op, do
> we want this here, if so why?

to be future proof if someone wants to add support for a monitor, as 
explained above.
I can remove this if you don't want it.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
