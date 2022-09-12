Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 260045B5A3E
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 14:37:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5457715DC;
	Mon, 12 Sep 2022 14:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5457715DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662986246;
	bh=qQAdLLNDD582WL8CTgMLJ6SaxChFfMkNy+oND2HyVCU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=heHa+x1LjamE1ImZHYJ3Jc8LlJkTLvLyfHFbdo4KRta8W5lDf8Pi/BcwqHpKD5nvj
	 kcCeDd/+BL0t6gk6J+knOYDITJNbkngFshsJ9m0s72u26hbRtihbQvFShTxB/Na7DU
	 qm7uf1yO+eJ2T3Bgq7VvoEb/73JLEHgEbmGHi1/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C04B4F8030F;
	Mon, 12 Sep 2022 14:36:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73DB3F8027B; Mon, 12 Sep 2022 14:36:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAAB5F800FE
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 14:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAAB5F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TGOA4hgw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C9lqcE007834;
 Mon, 12 Sep 2022 07:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=2djx8mrHj4k//KMZY57GsC6AkyV/iKwmgpZBlmtMih8=;
 b=TGOA4hgwrJXyW023aKgeCjmw4QxnqCKcaDymJge/UmXQ97Xp6u8TrAMnORnpB10lXYFT
 sSIL+avr6oV9ELE4mqpgwayhkryycwyF/J56KSouZKP9tbSf9w8zCS3/SfIfBqtec/eL
 KGXd0SMhZMNh4ICIapyBNwSdgCXciY7jj+qDN5dTkKCEsMU3t1GR8R7zf71nxGHiVZH6
 +T+TIZqI422d8zVoLUESrbMof5EflWl4+F/NIf1HHztoym6Ia7MKJm2G3TuTh2nDE62q
 cz9IR2PEXrSbinpiv9m9xp+FqHkUc+qWv0Y/TZMiaBz1IODhKExMG8qF94bPiKoUC4zS OQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jgr01tabb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 07:36:16 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 12 Sep
 2022 07:36:14 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Mon, 12 Sep 2022 07:36:14 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 593262C5;
 Mon, 12 Sep 2022 12:36:14 +0000 (UTC)
Message-ID: <91b18b16-c3c5-554b-2875-93857521cf4c@opensource.cirrus.com>
Date: Mon, 12 Sep 2022 13:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 4/5] soundwire: cadence: Fix lost ATTACHED interrupts
 when enumerating
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <sanyog.r.kale@intel.com>
References: <20220907085259.3602-1-rf@opensource.cirrus.com>
 <20220907085259.3602-5-rf@opensource.cirrus.com>
 <35122b05-4d2f-8c9c-eb5e-c0f96ef585a4@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <35122b05-4d2f-8c9c-eb5e-c0f96ef585a4@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _yTDrlhy4JN1yrrmLrJ0iLajx7Rm3Rm_
X-Proofpoint-ORIG-GUID: _yTDrlhy4JN1yrrmLrJ0iLajx7Rm3Rm_
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 12/09/2022 12:05, Pierre-Louis Bossart wrote:
> 
> 
> On 9/7/22 10:52, Richard Fitzgerald wrote:
>> The correct way to handle interrupts is to clear the bits we
>> are about to handle _before_ handling them. Thus if the condition
>> then re-asserts during the handling we won't lose it.
>>
>> This patch changes cdns_update_slave_status_work() to do this.
>>
>> The previous code cleared the interrupts after handling them.
>> The problem with this is that when handling enumeration of devices
>> the ATTACH statuses can be accidentally cleared and so some or all
>> of the devices never complete their enumeration.
>>
>> Thus we can have a situation like this:
>> - one or more devices are reverting to ID #0
>>
>> - accumulated status bits indicate some devices attached and some
>>    on ID #0. (Remember: status bits are sticky until they are handled)
>>
>> - Because of device on #0 sdw_handle_slave_status() programs the
>>    device ID and exits without handling the other status, expecting
>>    to get an ATTACHED from this reprogrammed device.
>>
>> - The device immediately starts reporting ATTACHED in PINGs, which
>>    will assert its CDNS_MCP_SLAVE_INTSTAT_ATTACHED bit.
>>
>> - cdns_update_slave_status_work() clears INTSTAT0/1. If the initial
>>    status had CDNS_MCP_SLAVE_INTSTAT_ATTACHED bit set it will be
>>    cleared.
>>
>> - The ATTACHED change for the device has now been lost.
>>
>> - cdns_update_slave_status_work() clears CDNS_MCP_INT_SLAVE_MASK so
>>    if the new ATTACHED state had set it, it will be cleared without
>>    ever having been handled.
>>
>> Unless there is some other state change from another device to cause
>> a new interrupt, the ATTACHED state of the reprogrammed device will
>> never cause an interrupt so its enumeration will not be completed.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
>>   drivers/soundwire/cadence_master.c | 18 ++++++++++++++----
>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
>> index 245191d22ccd..3acd7b89c940 100644
>> --- a/drivers/soundwire/cadence_master.c
>> +++ b/drivers/soundwire/cadence_master.c
>> @@ -954,9 +954,22 @@ static void cdns_update_slave_status_work(struct work_struct *work)
>>   	u32 device0_status;
>>   	int retry_count = 0;
>>   
>> +	/*
>> +	 * Clear main interrupt first so we don't lose any assertions
>> +	 * the happen during this function.
>> +	 */
>> +	cdns_writel(cdns, CDNS_MCP_INTSTAT, CDNS_MCP_INT_SLAVE_MASK);
>> +
>>   	slave0 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT0);
>>   	slave1 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT1);
>>   
>> +	/*
>> +	 * Clear the bits before handling so we don't lose any
>> +	 * bits that re-assert.
>> +	 */
>> +	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT0, slave0);
>> +	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT1, slave1);
>> +
>>   	/* combine the two status */
>>   	slave_intstat = ((u64)slave1 << 32) | slave0;
>>   
>> @@ -964,8 +977,6 @@ static void cdns_update_slave_status_work(struct work_struct *work)
>>   
>>   update_status:
>>   	cdns_update_slave_status(cdns, slave_intstat);
>> -	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT0, slave0);
>> -	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT1, slave1);
> 
> this one is hard to review, if you don't clear the status here, then how
> does the retry work if there is a new event?

The retry loop doesn't work off the interrupt status bits. Precisely
because the #0 ATTACH bit probably doesn't re-assert if the PING status
for #0 doesn't change, the retry checks the most recent PING response
instead.

> 
> Put differently, do we need to retry and the 'goto update_status' any more?
> 

Yes, I believe you do still need it. The Cadence interrupts appear to
assert when there is a change of status. If there are multiple devices
reporting on dev ID #0 then the PING status of #0 will not change until
they have all been reprogrammed, so it will not automatically re-assert.

Anyway, I don't want to mix bugfixes with code improvements. If the loop
_could_ be removed that should be done separately from fixing the
interrupt handling bug.

>>   
>>   	/*
>>   	 * When there is more than one peripheral per link, it's
>> @@ -1001,8 +1012,7 @@ static void cdns_update_slave_status_work(struct work_struct *work)
>>   		}
>>   	}
>>   
>> -	/* clear and unmask Slave interrupt now */
>> -	cdns_writel(cdns, CDNS_MCP_INTSTAT, CDNS_MCP_INT_SLAVE_MASK);
>> +	/* unmask Slave interrupt now */
>>   	cdns_updatel(cdns, CDNS_MCP_INTMASK,
>>   		     CDNS_MCP_INT_SLAVE_MASK, CDNS_MCP_INT_SLAVE_MASK);
>>   
