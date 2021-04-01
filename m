Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0470535169F
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 18:06:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9113A16C0;
	Thu,  1 Apr 2021 18:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9113A16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617293172;
	bh=zyu8MakoYv/0jLYp50i/ZkHbrbZcnGNU15+5sU70psw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GiCXDeZRPfsyQSKDAVbUTIhGJHzLoVpCX1hvhSJGG27wEU5SJQ0sbGouGpWObfMxg
	 Lxakd468XmvzCeJ3+Um81T9mV05DXQjHJHzGlJAcn8A05W66hceUQQNab5OEkRumvl
	 TC5D38LytLsOIjCjJvWMJpGBmY/F/D4Aut5a3dsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2DB8F8032D;
	Thu,  1 Apr 2021 18:03:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13B0FF8026F; Thu,  1 Apr 2021 18:03:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08B25F80117
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 18:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08B25F80117
IronPort-SDR: llGqRWbYKaKaxtlDxgOffFFHlLnOcumbw7r2MMgTuA0ulBt5qLMT8ZpGWgLp+8BrcM6H1nMZAm
 LQaNpn39Nh9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="171692958"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="171692958"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 09:03:16 -0700
IronPort-SDR: cAR40v7d018XsTBUAdMQukLsb5kSh2+85FiTEUz4GVp+oAEcO4KTJuhBah1nX5eXJAzrL1GdHx
 Ve/OjK3d+C0w==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="439265744"
Received: from mooreale-mobl.amr.corp.intel.com (HELO [10.255.229.43])
 ([10.255.229.43])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 09:03:14 -0700
Subject: Re: [PATCH 1/2] soundwire: add macro to selectively change error
 levels
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20210331011355.14313-1-yung-chuan.liao@linux.intel.com>
 <20210331011355.14313-2-yung-chuan.liao@linux.intel.com>
 <YGV1HYL+XcVmxfQG@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0834b9fc-9b3a-1184-fed2-6f9c7e66c6fb@linux.intel.com>
Date: Thu, 1 Apr 2021 09:30:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YGV1HYL+XcVmxfQG@vkoul-mobl.Dlink>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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



On 4/1/21 2:24 AM, Vinod Koul wrote:
> On 31-03-21, 09:13, Bard Liao wrote:
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> We sometimes discard -ENODATA when reporting errors and lose all
>> traces of issues in the console log, add a macro to add use dev_dbg()
>> in such cases.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Rander Wang <rander.wang@intel.com>
>> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> ---
>>   drivers/soundwire/bus.h | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
>> index 40354469860a..8370216f95d4 100644
>> --- a/drivers/soundwire/bus.h
>> +++ b/drivers/soundwire/bus.h
>> @@ -227,4 +227,12 @@ int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 val
>>   void sdw_clear_slave_status(struct sdw_bus *bus, u32 request);
>>   int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
>>   
>> +#define sdw_dev_dbg_or_err(dev, is_err, fmt, ...)			\
>> +	do {								\
>> +		if (is_err)						\
>> +			dev_err(dev, fmt, __VA_ARGS__);			\
>> +		else							\
>> +			dev_dbg(dev, fmt, __VA_ARGS__);			\
>> +	} while (0)
> 
> I see a variant in sof code and now here, why not add in a
> dev_dbg_or_err() and use everywhere?

Good point, I hesitated back and forth on specific v. generic macro.

The main reason why I added this macro for SoundWire is that quite a few 
subsystems have their own debug functions (DRM, ACPI, etc), and I wasn't 
sure if there was any appetite to add more options in 
include/linux/dev_printk.h. SOF also uses a different format due to history.

If at the end of the day SoundWire and SOF are the only users the value 
of a common macro is limited.

But it's true that the macro could be used by others.

I really have no opinion here and will follow the consensus.
