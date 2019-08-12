Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B81B89FCA
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 15:36:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6B981704;
	Mon, 12 Aug 2019 15:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6B981704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565616998;
	bh=8TbtWYfLPd8vw1V3mBwzBRk3ClVTNG7u/+e2gPfKAGQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YUsxsH+FE04dDslA+kdGVC0SL5yKITJFNrt7++KTMsMc2qeuvEUcyKnlNndYhhANQ
	 w5XUn6Kujq6g3tAd/EgdqvAQQWXlXFHfBeeKabldPqLiZHkPOBIKdRsUv0H/4ld/ot
	 YcSvg5qP12nClSDmpRjD8ZszaSoMGEQK7+ZF/67g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE69FF805A9;
	Mon, 12 Aug 2019 15:28:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A888EF8058C; Mon, 12 Aug 2019 15:28:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E041F80675
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 15:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E041F80675
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Aug 2019 06:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,377,1559545200"; d="scan'208";a="375946636"
Received: from aferozpu-mobl2.amr.corp.intel.com (HELO [10.254.109.160])
 ([10.254.109.160])
 by fmsmga006.fm.intel.com with ESMTP; 12 Aug 2019 06:24:57 -0700
To: Greg KH <gregkh@linuxfoundation.org>
References: <20190809224341.15726-1-pierre-louis.bossart@linux.intel.com>
 <20190809224341.15726-2-pierre-louis.bossart@linux.intel.com>
 <20190810070139.GA6896@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <89e456e7-35a6-c7e9-64bd-1b30f0f019cc@linux.intel.com>
Date: Mon, 12 Aug 2019 08:24:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190810070139.GA6896@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 1/3] soundwire: add debugfs support
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


>>   #Cadence Objs
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index 49f64b2115b9..89d5f1537d9b 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -49,6 +49,8 @@ int sdw_add_bus_master(struct sdw_bus *bus)
>>   		}
>>   	}
>>   
>> +	bus->debugfs = sdw_bus_debugfs_init(bus);
>> +
> 
> It's "nicer" to just put that assignment into sdw_bus_debugfs_init().
> 
> That way you just call the function, no need to return anything.

ok, thanks for the suggestion.

> 
>>   	/*
>>   	 * Device numbers in SoundWire are 0 through 15. Enumeration device
>>   	 * number (0), Broadcast device number (15), Group numbers (12 and
>> @@ -109,6 +111,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
>>   	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>>   	struct sdw_bus *bus = slave->bus;
>>   
>> +	sdw_slave_debugfs_exit(slave->debugfs);
> 
> Same here, just pass in slave:
> 	sdw_slave_debugfs_exit(slave);
> and have that function remove the debugfs entry in the structure.  That
> way, if you are really paranoid about size, you could even drop the
> debugfs structure member from non-debugfs builds without any changes to
> bus.c or other non-debugfs files.

ok makes sense. will fix in v2.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
