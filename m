Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F167FF78
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 19:22:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE85016D7;
	Fri,  2 Aug 2019 19:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE85016D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564766575;
	bh=P540Ft5m03fxIXhgXl/O+XdkpdD5MVyjBKJsffV2BQY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ul12dIHPcGGq8giCC7xl873cQ+IlqKVpN5fovc8L/juUDvYBYFBPniLNT5isOPkP5
	 5Ol4Fk91LYiJKRbQZXpp8GbpagvSjHESzgl38/tSO8OW3q+QstbPLZT+xsNVbNunmF
	 YBamR64x2KM4fehWHpger2ESGbjnJvHZQCz6CcNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4B27F804CF;
	Fri,  2 Aug 2019 19:21:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1560F804CB; Fri,  2 Aug 2019 19:20:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 148DAF80214
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 19:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 148DAF80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 10:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="191888588"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2019 10:20:54 -0700
Received: from cwhanson-mobl.amr.corp.intel.com (unknown [10.252.133.191])
 by linux.intel.com (Postfix) with ESMTP id EC81358046F;
 Fri,  2 Aug 2019 10:20:52 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-20-pierre-louis.bossart@linux.intel.com>
 <20190802170041.GW12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <db5b56ff-c6e1-32a8-628c-13b42379c4cb@linux.intel.com>
Date: Fri, 2 Aug 2019 12:20:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802170041.GW12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 19/40] soundwire: bus: improve dynamic
 debug comments for enumeration
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

On 8/2/19 12:00 PM, Vinod Koul wrote:
> On 25-07-19, 18:40, Pierre-Louis Bossart wrote:
>> update comments to provide better understanding of enumeration flows.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/bus.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index bca378806d00..2354675ef104 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -483,7 +483,8 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
>>   
>>   	ret = sdw_write(slave, SDW_SCP_DEVNUMBER, dev_num);
>>   	if (ret < 0) {
>> -		dev_err(&slave->dev, "Program device_num failed: %d\n", ret);
>> +		dev_err(&slave->dev, "Program device_num %d failed: %d\n",
>> +			dev_num, ret);
>>   		return ret;
>>   	}
>>   
>> @@ -540,6 +541,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
>>   	do {
>>   		ret = sdw_transfer(bus, &msg);
>>   		if (ret == -ENODATA) { /* end of device id reads */
>> +			dev_dbg(bus->dev, "No more devices to enumerate\n");
>>   			ret = 0;
>>   			break;
>>   		}
>> @@ -982,6 +984,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>>   	int i, ret = 0;
>>   
>>   	if (status[0] == SDW_SLAVE_ATTACHED) {
>> +		dev_err(bus->dev, "Slave attached, programming device number\n");
> 
> This should be debug level

yes, good catch, will fix.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
