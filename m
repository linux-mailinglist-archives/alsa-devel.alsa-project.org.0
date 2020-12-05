Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4432CFBA6
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 16:02:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 642671911;
	Sat,  5 Dec 2020 16:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 642671911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607180546;
	bh=CbUbYFXxq7Z9BtRWpeR3Kpkooa9tNRsj40xyE9azA5k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IoUe3uFtpU5hdRlYMPIuhiFdDJe8hud3P3WRw51TFiBLrNrYu/K9BoA04P2zho+Yo
	 9fbnmt5J+JH9gwMZCSPzfk86FYWPwqNFDyo4luYSr348eRZ7SsnenRMZxEHfJkFUoH
	 5lab44RexFDyQ3osn7739Yc+gnATeZMgvMN7pMvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 733FDF8016C;
	Sat,  5 Dec 2020 16:00:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E3F8F804BC; Sat,  5 Dec 2020 16:00:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96AC7F8025F
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 15:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96AC7F8025F
IronPort-SDR: JOwgChd/iQNexmmrShSQfRqRUHOUJxkYwqZ+kQmuBCYgn7BAmVg/qZ35g6rh8MvO87uECkdX+G
 XtLtbwxYzUOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="237628585"
X-IronPort-AV: E=Sophos;i="5.78,395,1599548400"; d="scan'208";a="237628585"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2020 06:59:56 -0800
IronPort-SDR: RYoMDGFFTE6jxc6pGLX2RQcbEpvcChRMU2DhisSbvvl+p0aMw7PNIZxacFcm8U16RJ6X5brham
 vKsXrkEViP1Q==
X-IronPort-AV: E=Sophos;i="5.78,395,1599548400"; d="scan'208";a="436104270"
Received: from schamb2-mobl2.amr.corp.intel.com (HELO [10.212.89.161])
 ([10.212.89.161])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2020 06:59:55 -0800
Subject: Re: [PATCH 1/7] soundwire: bus: use sdw_update_no_pm when
 initializing a device
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20201202204645.23891-1-yung-chuan.liao@linux.intel.com>
 <20201202204645.23891-2-yung-chuan.liao@linux.intel.com>
 <20201205074508.GQ8403@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1db93c2e-3c87-bc5e-ddeb-56424870b897@linux.intel.com>
Date: Sat, 5 Dec 2020 08:59:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201205074508.GQ8403@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

Thanks for the review Vinod.

On 12/5/20 1:45 AM, Vinod Koul wrote:
> On 03-12-20, 04:46, Bard Liao wrote:
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> When a Slave device is resumed, it may resume the bus and restart the
>> enumeration. During that process, we absolutely don't want to call
>> regular read/write routines which will wait for the resume to
>> complete, otherwise a deadlock occurs.
>>
>> Fixes: 60ee9be25571 ('soundwire: bus: add PM/no-PM versions of read/write functions')
> 
> Change looks okay, but not sure why this is a fix for adding no pm
> version?

when we added the no_pm version, we missed the two cases below where 
sdw_update() was used and that creates a deadlock. To me that's a 
conceptual bug, we didn't fully use the no_pm versions, hence the Fixes tag.

It's ok to remove the tag if you don't think it's useful/relevant, what 
matters is that we agree on the content.

>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> ---
>>   drivers/soundwire/bus.c | 16 ++++++++++++++--
>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index d1e8c3a54976..60c42508c6c6 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -489,6 +489,18 @@ sdw_read_no_pm(struct sdw_slave *slave, u32 addr)
>>   		return buf;
>>   }
>>   
>> +static int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
>> +{
>> +	int tmp;
>> +
>> +	tmp = sdw_read_no_pm(slave, addr);
>> +	if (tmp < 0)
>> +		return tmp;
>> +
>> +	tmp = (tmp & ~mask) | val;
>> +	return sdw_write_no_pm(slave, addr, tmp);
>> +}
>> +
>>   /**
>>    * sdw_nread() - Read "n" contiguous SDW Slave registers
>>    * @slave: SDW Slave
>> @@ -1256,7 +1268,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
>>   	val = slave->prop.scp_int1_mask;
>>   
>>   	/* Enable SCP interrupts */
>> -	ret = sdw_update(slave, SDW_SCP_INTMASK1, val, val);
>> +	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1, val, val);
>>   	if (ret < 0) {
>>   		dev_err(slave->bus->dev,
>>   			"SDW_SCP_INTMASK1 write failed:%d\n", ret);
>> @@ -1271,7 +1283,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
>>   	val = prop->dp0_prop->imp_def_interrupts;
>>   	val |= SDW_DP0_INT_PORT_READY | SDW_DP0_INT_BRA_FAILURE;
>>   
>> -	ret = sdw_update(slave, SDW_DP0_INTMASK, val, val);
>> +	ret = sdw_update_no_pm(slave, SDW_DP0_INTMASK, val, val);
>>   	if (ret < 0)
>>   		dev_err(slave->bus->dev,
>>   			"SDW_DP0_INTMASK read failed:%d\n", ret);
>> -- 
>> 2.17.1
> 
