Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F015A158E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 17:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E1F015F2;
	Thu, 25 Aug 2022 17:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E1F015F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661441174;
	bh=ZFV1e1wtp2wEDS1Rw97TKrGpVwu0CoG6sYuTlU3GzZc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pxkbwkmeDEJPwCgBEiotH3+5q5qJ9mqsfA5QsTK7AiEupWcFtid+2BKuFZMQ08D50
	 vn54J+Fu95psLda+z8jVgueKSOVaL/pqmnv2wzEB2JBF+GnzbyheMXRMhsCFPxiMAI
	 eqD9K3dASsw4cp9P+Ems72xoZoNBqoC6gmeJ544c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1F2EF8014B;
	Thu, 25 Aug 2022 17:25:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BED3BF8025A; Thu, 25 Aug 2022 17:25:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1AEFF800BD
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 17:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1AEFF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PUFf+YNw"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27PAHggl026685;
 Thu, 25 Aug 2022 10:25:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=tKiCoJ67xUttB+IGWUVM9rJS+KfuMB4HZ6UOTZ5AzQY=;
 b=PUFf+YNwOC7sND1AHVDm7fTrp/Rkwc9svZ9f+lwC/8OL4D8rWnN/TjjzHCiDSED4t6nW
 wAPTmCLEunzbUhmtgfxhk6Rbe3MtF3AHIlXfe8dV5NUKDSxHytAI4IEClgX7ssiwmtol
 IFRMKC6EuoIsO0gC0IHyijGNRWWDugTIZVWFuA1cuh4CRW0RkcTvFQaptMtqelhAngVM
 G2/FyFwAxz3doPFMukdHpy6UB/RkvFHXdnPgAuGsI2ffH2h+MavP3Yn5GnDmNa3NzJwb
 GsJ5CVsjRYMrb41OWiQ+UUk61SgSsCde2Xj1gy0T+jF+ekyfyokcIwsE99iH4/rIEyXF DA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3j5a3ra7sb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Aug 2022 10:25:03 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Thu, 25 Aug
 2022 10:25:01 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Thu, 25 Aug 2022 10:25:01 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B5AE2B0E;
 Thu, 25 Aug 2022 15:25:01 +0000 (UTC)
Message-ID: <e9deb2fb-458a-8136-5ba7-a9e2b0f2d174@opensource.cirrus.com>
Date: Thu, 25 Aug 2022 16:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] soundwire: bus: Fix lost UNATTACH when re-enumerating
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <sanyog.r.kale@intel.com>
References: <20220825122241.273090-1-rf@opensource.cirrus.com>
 <20220825122241.273090-4-rf@opensource.cirrus.com>
 <adfdf06a-e1a3-e47c-a71f-5e5dccef6fd0@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <adfdf06a-e1a3-e47c-a71f-5e5dccef6fd0@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rpxpx_basEX7B8SO8lkow73whaxwYJ-T
X-Proofpoint-ORIG-GUID: Rpxpx_basEX7B8SO8lkow73whaxwYJ-T
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

On 25/08/2022 15:24, Pierre-Louis Bossart wrote:
> Humm, I am struggling a bit more on this patch.
> 
> On 8/25/22 14:22, Richard Fitzgerald wrote:
>> Rearrange sdw_handle_slave_status() so that any peripherals
>> on device #0 that are given a device ID are reported as
>> unattached. The ensures that UNATTACH status is not lost.
>>
>> Handle unenumerated devices first and update the
>> sdw_slave_status array to indicate IDs that must have become
>> UNATTACHED.
>>
>> Look for UNATTACHED devices after this so we can pick up
>> peripherals that were UNATTACHED in the original PING status
>> and those that were still ATTACHED at the time of the PING but
>> then reverted to unenumerated and were found by
>> sdw_program_device_num().
> 
> Are those two cases really lost completely? It's a bit surprising, I do
> recall that we added a recheck on the status, see the 'update_status'
> label in cdns_update_slave_status_work
> 

Yes they are. We see this happen extremely frequently (like, almost
every time) when we reset out peripherals after a firmware change.

I saw that "try again" stuff in cdns_update_slave_status_work() but
it's not fixing the problem. Maybe because it's looking for devices
still on #0 but that isn't the problem.

The cdns_update_slave_status_work() is running in one workqueue thread,
child drivers in other threads. So for example:

1. Child driver #1 resets #1
2. PING: #1 has reverted to #0, #2 still ATTACHED
3. cdns_update_slave_status() snapshots the status. #2 is ATTACHED
4. #1 has gone so mark it UNATTACHED
5. Child driver #2 gets some CPU time and reset #2
5. PING: #2 has reset, both now on #0 but we are handling the previous
PING
6. sdw_handle_slave_status() - snapshot PING (from step 3) says #2 is
attached
7. Device on #0 so call sdw_program_device_num()
8. sdw_program_device_num() loops until no devices on #0, #1 and #2
are both reprogrammed, return from sdw_handle_slave_status()
10. PING: #1 and #2 both attached
11. cdns_update_slave_status() -> sdw_handle_slave_status()
12. #1 has changed UNATTACHED->ATTACHED, but we never got a PING with
     #2 unattached so its slave->status==ATTACHED, "it hasn't changed"
     (wrong!)

Now, at step 10 the Cadence IP may have accumlated both UNATTACH and
ATTACH flags, and perhaps it should be smarter about deciding what
to report if there are multiple states. HOWEVER.... that's the behaviour
of Cadence IP, other IP may be different so it's probably unwise to
assume that the IP has "remembered" the UNATTACH state before it was 
reprogrammed.

If we reprogrammed it, it was definitely UNATTACHED so let's say that.

>> As sdw_update_slave_status() is always processing a snapshot of
>> a PING from some time in the past, it is possible that the status
>> is changing while sdw_update_slave_status() is running.
>>
>> A peripheral could report attached in the PING, but detach and
>> revert to device #0 and then be found in the loop in
>> sdw_program_device_num(). Previously the code would not have
>> updated slave->status to UNATTACHED because there was never a
>> PING with that status. If the slave->status is not updated to
>> UNATTACHED the next PING will report it as ATTACHED, but its
>> slave->status is already ATTACHED so the re-attach will not be
>> properly handled.
> The idea of detecting first devices that become unattached - and later
> deal with device0 when they re-attach - was based on the fact that
> synchronization takes time. The absolute minimum is 16 frames per the
> SoundWire spec.
> 
> I don't see how testing for the status[0] first in
> sdw_handle_slave_status() helps, the value is taken at the same time as
> status[1..11]. If you really want to take the last information, we
> should re-read the status from a new PING frame.
> 
> 

The point is to deal with unattached devices second, not first.
If we do it first we might find some more that are unattached since
the ping. Moving the unattach check second means we don't have to
do it twice.

>> This situations happens fairly frequently with multiple
>> peripherals on a bus that are intentionally reset (for example
>> after downloading firmware).
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
>>   drivers/soundwire/bus.c | 39 ++++++++++++++++++++++++++-------------
>>   1 file changed, 26 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index bb8ce26c68b3..1212148ac251 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -718,7 +718,8 @@ void sdw_extract_slave_id(struct sdw_bus *bus,
>>   }
>>   EXPORT_SYMBOL(sdw_extract_slave_id);
>>   
>> -static int sdw_program_device_num(struct sdw_bus *bus)
>> +static int sdw_program_device_num(struct sdw_bus *bus,
>> +				  enum sdw_slave_status status[])
>>   {
>>   	u8 buf[SDW_NUM_DEV_ID_REGISTERS] = {0};
>>   	struct sdw_slave *slave, *_s;
>> @@ -776,6 +777,12 @@ static int sdw_program_device_num(struct sdw_bus *bus)
>>   					return ret;
>>   				}
>>   
>> +				/*
>> +				 * It could have dropped off the bus since the
>> +				 * PING response so update the status array.
>> +				 */
>> +				status[slave->dev_num] = SDW_SLAVE_UNATTACHED;
>> +
>>   				break;
>>   			}
>>   		}
>> @@ -1735,10 +1742,21 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>>   {
>>   	enum sdw_slave_status prev_status;
>>   	struct sdw_slave *slave;
>> +	bool programmed_dev_num = false;
>>   	bool attached_initializing;
>>   	int i, ret = 0;
>>   
>> -	/* first check if any Slaves fell off the bus */
>> +	/* Handle any unenumerated peripherals */
>> +	if (status[0] == SDW_SLAVE_ATTACHED) {
>> +		dev_dbg(bus->dev, "Slave attached, programming device number\n");
>> +		ret = sdw_program_device_num(bus, status);
>> +		if (ret < 0)
>> +			dev_warn(bus->dev, "Slave attach failed: %d\n", ret);
>> +
>> +		programmed_dev_num = true;
>> +	}
>> +
>> +	/* Check if any fell off the bus */
>>   	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
>>   		mutex_lock(&bus->bus_lock);
>>   		if (test_bit(i, bus->assigned) == false) {
>> @@ -1764,17 +1782,12 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>>   		}
>>   	}
>>   
>> -	if (status[0] == SDW_SLAVE_ATTACHED) {
>> -		dev_dbg(bus->dev, "Slave attached, programming device number\n");
>> -		ret = sdw_program_device_num(bus);
>> -		if (ret < 0)
>> -			dev_err(bus->dev, "Slave attach failed: %d\n", ret);
>> -		/*
>> -		 * programming a device number will have side effects,
>> -		 * so we deal with other devices at a later time
>> -		 */
>> -		return ret;
>> -	}
>> +	/*
>> +	 * programming a device number will have side effects,
>> +	 * so we deal with other devices at a later time
>> +	 */
>> +	if (programmed_dev_num)
>> +		return 0;
>>   
>>   	/* Continue to check other slave statuses */
>>   	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
