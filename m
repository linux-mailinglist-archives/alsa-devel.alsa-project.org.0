Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AEA5B5D51
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 17:37:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F821657;
	Mon, 12 Sep 2022 17:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F821657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662997049;
	bh=VKzAzaofuhnxWMiYIamOp9Az9jD8L5E1WWc+WKHuLEs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ct6Efn99nE3xivEHpJxif9Jd3GZM7G30pFddJImPkK1Pqh5NXAvaDc30liIUop9/S
	 iIhNbyT45kkxAie3v28JqH3OkJ5ttT6BNe0D6JbEaiSjpn0oQvxjOv4FqkMq50numL
	 MfYX82k11Hqc8CretmBplDCOzslJ2g/ThVhmOVuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AEFDF804E7;
	Mon, 12 Sep 2022 17:36:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ADB8F8027B; Mon, 12 Sep 2022 17:36:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3A19F800FE;
 Mon, 12 Sep 2022 17:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3A19F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="q2c6sSzR"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CDO0TH025384;
 Mon, 12 Sep 2022 10:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=eU9Fp7PfOHjpPPUa8134+maR0Y9k1aTyalwtsLMt2K8=;
 b=q2c6sSzRHIrNLvYTa7A9EGYxMQS4TgAqBTKam16Iyyrzbct2oyyo4QZas0der/NpX8rq
 a5w1hBCNzUALjob70bKv7n63tvWhNxkgKfXirJjeyTdz3V+51Um00CSf5tKnkSSLRyPk
 gQE2IKHOR3k14oPGaI7KUzLYhADVEDu+AQckjAmlPm4oHnztWfZM6UjZkaBMRo8i9ITp
 aHr8icBR0FvuVOfkpJauZxDF4NhXrb62l7ifFB9jd/uStKbNbm0Po436n0jWVqZcAEAi
 aQD6UST+W/bcVw+kowNP+D1IhsK+zbJ4N3MHqsbM5bYrJ7OuKPbCzKCj/XWCKtEvxhGs xg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jgq0ntfuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 10:36:11 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 12 Sep
 2022 10:36:09 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Mon, 12 Sep 2022 10:36:09 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 518DD2C5;
 Mon, 12 Sep 2022 15:36:09 +0000 (UTC)
Message-ID: <9de21235-c77d-f53f-3426-4a5927f484c9@opensource.cirrus.com>
Date: Mon, 12 Sep 2022 16:36:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/7] soundwire: intel: Don't disable interrupt until
 children are removed
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <lgirdwood@gmail.com>, <peter.ujfalusi@linux.intel.com>,
 <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
 <daniel.baluta@nxp.com>, <sanyog.r.kale@intel.com>, <broonie@kernel.org>
References: <20220907101402.4685-1-rf@opensource.cirrus.com>
 <20220907101402.4685-6-rf@opensource.cirrus.com>
 <c83fb25e-ef59-63e1-4223-648dab9885ea@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <c83fb25e-ef59-63e1-4223-648dab9885ea@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5l9_s5s92997QXhoL8gsk2eY4s0OPr1T
X-Proofpoint-ORIG-GUID: 5l9_s5s92997QXhoL8gsk2eY4s0OPr1T
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

On 12/09/2022 11:53, Pierre-Louis Bossart wrote:
> 
> 
> On 9/7/22 12:14, Richard Fitzgerald wrote:
>> The cadence_master code needs the interrupt to complete message transfers.
>> When the bus driver is being removed child drivers are removed, and their
>> remove actions might need bus transactions.
>>
>> Use the sdw_master_ops.remove callback to disable the interrupt handling
>> only after the child drivers have been removed.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
>>   drivers/soundwire/intel.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>> index 01be62fa6c83..d5e723a9c80b 100644
>> --- a/drivers/soundwire/intel.c
>> +++ b/drivers/soundwire/intel.c
>> @@ -1255,6 +1255,13 @@ static int intel_prop_read(struct sdw_bus *bus)
>>   	return 0;
>>   }
>>   
>> +static void intel_bus_remove(struct sdw_bus *bus)
>> +{
>> +	struct sdw_cdns *cdns = bus_to_cdns(bus);
>> +
>> +	sdw_cdns_enable_interrupt(cdns, false);
> 
> don't you need to check for any on-going transactions on the bus?
>

As all the child drivers have removed, I think the only other place that
can generate bus transactions is the PING handler but
sdw_cdns_enable_interrupt(false) calls cancel_work_sync() to
cancel the cdns->work and it sets a flag so that it will not be
re-queued.

> I wonder if there could be a corner case where there are no child
> devices but still a device physically attached to the bus. I am not sure
> if the 'no devices left' is a good-enough indication of no activity on
> the bus.
>

As above - yes there could, but sdw_cdns_enable_interrupt(false) will
cancel the work and stop it being re-queued.

>> +}
>> +
>>   static struct sdw_master_ops sdw_intel_ops = {
>>   	.read_prop = sdw_master_read_prop,
>>   	.override_adr = sdw_dmi_override_adr,
>> @@ -1264,6 +1271,7 @@ static struct sdw_master_ops sdw_intel_ops = {
>>   	.set_bus_conf = cdns_bus_conf,
>>   	.pre_bank_switch = intel_pre_bank_switch,
>>   	.post_bank_switch = intel_post_bank_switch,
>> +	.remove = intel_bus_remove,
>>   };
>>   
>>   static int intel_init(struct sdw_intel *sdw)
>> @@ -1502,7 +1510,6 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
>>   	 */
>>   	if (!bus->prop.hw_disabled) {
>>   		intel_debugfs_exit(sdw);
>> -		sdw_cdns_enable_interrupt(cdns, false);
>>   		snd_soc_unregister_component(dev);
>>   	}
>>   	sdw_bus_master_delete(bus);
