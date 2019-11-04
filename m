Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E36EEE2CC
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 15:46:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D08B174D;
	Mon,  4 Nov 2019 15:45:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D08B174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572878786;
	bh=QvZPM711OAG6EiT686avdxCxHKI5xXH0zXfXeIXXVAs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DkzrYUUe0qVByU2Xu3ARZhZD1FUkUWbOZ36//yI1//p9YL+hPbSg9Vw1YkZW1KI09
	 NfzN4o4eRM7gYOQtjXYLnG237xRNe/8Y6WzWwRSHZZmkUDM7adejUkATx+6OOkpySp
	 UGoOf0XX9sl9SSdh0KK1LVw/CdRiYo5utFxBabOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2DB2F8048D;
	Mon,  4 Nov 2019 15:44:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A85EF803F4; Mon,  4 Nov 2019 15:44:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6524F8019B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 15:44:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6524F8019B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 06:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; d="scan'208";a="402993333"
Received: from cckuo1-mobl2.amr.corp.intel.com (HELO [10.251.130.8])
 ([10.251.130.8])
 by fmsmga006.fm.intel.com with ESMTP; 04 Nov 2019 06:44:09 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-7-pierre-louis.bossart@linux.intel.com>
 <20191103053243.GI2695@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d0f4cf88-7799-6176-2336-7bdacbd2b621@linux.intel.com>
Date: Mon, 4 Nov 2019 08:35:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191103053243.GI2695@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 06/14] soundwire: add support for
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



On 11/3/19 12:32 AM, Vinod Koul wrote:
> On 23-10-19, 16:28, Pierre-Louis Bossart wrote:
>> Currently the bus does not have any explicit support for master
>> devices.  Add explicit support for sdw_slave_type, so that in
>> follow-up patches we can add support for the sdw_md_type (md==Master
>> Device), following the Grey Bus example.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/bus_type.c       | 9 ++++++++-
>>   drivers/soundwire/slave.c          | 7 ++++++-
>>   include/linux/soundwire/sdw_type.h | 6 ++++++
>>   3 files changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
>> index 9a0fd3ee1014..5df095f4e12f 100644
>> --- a/drivers/soundwire/bus_type.c
>> +++ b/drivers/soundwire/bus_type.c
>> @@ -49,9 +49,16 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
>>   
>>   static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>>   {
>> -	struct sdw_slave *slave = to_sdw_slave_device(dev);
>> +	struct sdw_slave *slave;
>>   	char modalias[32];
>>   
>> +	if (is_sdw_slave(dev)) {
>> +		slave = to_sdw_slave_device(dev);
>> +	} else {
>> +		dev_warn(dev, "uevent for unknown Soundwire type\n");
>> +		return -EINVAL;
> 
> when is the case where this would be triggered?

this is in preparation for the master case, where you will have 2 types 
of devices, so need to check if the type is correct.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
