Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41447EE2CE
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 15:47:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7BF91753;
	Mon,  4 Nov 2019 15:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7BF91753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572878830;
	bh=VENndnOvXQuECgBc9B94DiH9Njg5BtB9P6tK+IiFi7k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J123GyR1Qbu9PbLwrCfGKl8MdXY8EbBVbULH8ILdVXsEN+CSTqP29rKlSVoIqPD70
	 DmugBVpPEPrE2rglaPbsgH8h8guQVejOXMoawim88I7j433GHtolmIfZ68YTdcRuIl
	 jRFLdAT6Dy5nhC2a3ofp8NLdOWkiJD5k4hectxfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DF76F805FB;
	Mon,  4 Nov 2019 15:44:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 295D2F805FB; Mon,  4 Nov 2019 15:44:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4C99F8015B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 15:44:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4C99F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 06:44:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; d="scan'208";a="402993324"
Received: from cckuo1-mobl2.amr.corp.intel.com (HELO [10.251.130.8])
 ([10.251.130.8])
 by fmsmga006.fm.intel.com with ESMTP; 04 Nov 2019 06:44:07 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-5-pierre-louis.bossart@linux.intel.com>
 <20191103053003.GH2695@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <27887179-cdf7-bd66-2870-a58017921108@linux.intel.com>
Date: Mon, 4 Nov 2019 08:34:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191103053003.GH2695@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 04/14] soundwire: bus_type: rename sdw_drv_
 to sdw_slave_drv
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



On 11/3/19 12:30 AM, Vinod Koul wrote:
> On 23-10-19, 16:28, Pierre-Louis Bossart wrote:
>> Before we add master driver support, make sure there is no ambiguity
>> and no occirrences of sdw_drv_ functions.
>          ^^^^^^^^^^^
> typo

Ack, will fix.

> 
>>
>> No functionality change.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/bus_type.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
>> index 2b2830b622fa..9a0fd3ee1014 100644
>> --- a/drivers/soundwire/bus_type.c
>> +++ b/drivers/soundwire/bus_type.c
>> @@ -67,7 +67,7 @@ struct bus_type sdw_bus_type = {
>>   };
>>   EXPORT_SYMBOL_GPL(sdw_bus_type);
>>   
>> -static int sdw_drv_probe(struct device *dev)
>> +static int sdw_slave_drv_probe(struct device *dev)
>>   {
>>   	struct sdw_slave *slave = to_sdw_slave_device(dev);
>>   	struct sdw_driver *drv = to_sdw_slave_driver(dev->driver);
>> @@ -113,7 +113,7 @@ static int sdw_drv_probe(struct device *dev)
>>   	return 0;
>>   }
>>   
>> -static int sdw_drv_remove(struct device *dev)
>> +static int sdw_slave_drv_remove(struct device *dev)
>>   {
>>   	struct sdw_slave *slave = to_sdw_slave_device(dev);
>>   	struct sdw_driver *drv = to_sdw_slave_driver(dev->driver);
>> @@ -127,7 +127,7 @@ static int sdw_drv_remove(struct device *dev)
>>   	return ret;
>>   }
>>   
>> -static void sdw_drv_shutdown(struct device *dev)
>> +static void sdw_slave_drv_shutdown(struct device *dev)
>>   {
>>   	struct sdw_slave *slave = to_sdw_slave_device(dev);
>>   	struct sdw_driver *drv = to_sdw_slave_driver(dev->driver);
>> @@ -155,13 +155,13 @@ int __sdw_register_slave_driver(struct sdw_driver *drv,
>>   	}
>>   
>>   	drv->driver.owner = owner;
>> -	drv->driver.probe = sdw_drv_probe;
>> +	drv->driver.probe = sdw_slave_drv_probe;
>>   
>>   	if (drv->remove)
>> -		drv->driver.remove = sdw_drv_remove;
>> +		drv->driver.remove = sdw_slave_drv_remove;
>>   
>>   	if (drv->shutdown)
>> -		drv->driver.shutdown = sdw_drv_shutdown;
>> +		drv->driver.shutdown = sdw_slave_drv_shutdown;
>>   
>>   	return driver_register(&drv->driver);
>>   }
>> -- 
>> 2.20.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
