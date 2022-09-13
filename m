Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 753E25B78EF
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 20:01:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5DDA17B4;
	Tue, 13 Sep 2022 20:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5DDA17B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663092066;
	bh=AUXPDv29W42VkuJbWr48okBTaBr9FqXtDuLVoVld2Ss=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BKUhjtwuzaZaaz8WD9joYmom72lrdeN/YcsOui0wC8rwoEIf9rK478j6Ym/JK7Zvs
	 8vNqucDBA2wQIt2wn6nkAJ/1BtpSKg2WNnCDY6MueM7tvjRTKgK44KPdYcmjQXcf4w
	 nhzpeGIrtzxrbfE1lzd3ZttqvunXs2Jz5gUkIgmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2237FF8025D;
	Tue, 13 Sep 2022 20:00:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26D52F80224; Tue, 13 Sep 2022 20:00:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F32DF80154
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 20:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F32DF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aobxpIyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663092002; x=1694628002;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AUXPDv29W42VkuJbWr48okBTaBr9FqXtDuLVoVld2Ss=;
 b=aobxpIyr2lmbimRgWHr6Aax+AobWBDT3goIbN7kTrlu/bQbQyOyCHX4p
 rHKsNnhk+ErCpRx0jhTN95b5oTJDT0SX2gIV5Ss9Wv32cGbCvrS/efqMs
 3waylFiLi6tYwA77JErMkMw+jhXZVIIYnYiGYkgeEN6mOBSZX128g4c/+
 Nzhmc/mURetRN3G9UHTiqjCswc+1cwIqVYHUrQVmhtVkRAxI8nBXBqe+d
 Qs24cxgvp7xdU6O8e6K0815VFfa5a0nnWvNn5JXCeHmaIVN0z1ktzxStV
 q/ZVMoIZC9V6c+GGeNBKHl5B+pCyPLS5FOtffr7MagGFhhuSVft9FSb25 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="295800179"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="295800179"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 10:59:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="758887310"
Received: from tleistix-mobl2.ger.corp.intel.com (HELO [10.251.208.174])
 ([10.251.208.174])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 10:59:46 -0700
Message-ID: <8fb87d38-d417-a9ce-eb95-98a9b213f3b6@linux.intel.com>
Date: Tue, 13 Sep 2022 19:59:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/5] soundwire: bus: Don't exit early if no device IDs
 were programmed
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20220907085259.3602-1-rf@opensource.cirrus.com>
 <20220907085259.3602-6-rf@opensource.cirrus.com>
 <fa14881d-0eb8-f652-aea7-00d8c3f2a6bb@linux.intel.com>
 <49ee34ef-7d64-aeb6-eb1b-6cdbfd9e36ae@opensource.cirrus.com>
 <c68e5f78-51cc-6b16-dc7d-4540b78e4d2f@linux.intel.com>
 <11e57078-78c7-6f99-8633-e5e945330550@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <11e57078-78c7-6f99-8633-e5e945330550@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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




>>>>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>>>>> index 6e569a875a9b..0bcc2d161eb9 100644
>>>>> --- a/drivers/soundwire/bus.c
>>>>> +++ b/drivers/soundwire/bus.c
>>>>> @@ -736,20 +736,19 @@ static int sdw_program_device_num(struct
>>>>> sdw_bus *bus)
>>>>>        struct sdw_slave_id id;
>>>>>        struct sdw_msg msg;
>>>>>        bool found;
>>>>> -    int count = 0, ret;
>>>>> +    int count = 0, num_programmed = 0, ret;
>>>>>        u64 addr;
>>>>>          /* No Slave, so use raw xfer api */
>>>>>        ret = sdw_fill_msg(&msg, NULL, SDW_SCP_DEVID_0,
>>>>>                   SDW_NUM_DEV_ID_REGISTERS, 0, SDW_MSG_FLAG_READ,
>>>>> buf);
>>>>>        if (ret < 0)
>>>>> -        return ret;
>>>>> +        return 0;
>>>>
>>>> this doesn't seem quite right to me, there are multiple -EINVAL cases
>>>> handled in sdw_fill_msg().
>>>>
>>>> I didn't check if all these error cases are irrelevant in that specific
>>>> enumeration case, if that was the case maybe we need to break that
>>>> function in two helpers so that all the checks can be skipped.
>>>>
>>>
>>> I don't think that there's anything useful that
>>> sdw_modify_slave_status() could do to recover from an error.
>>>
>>> If any device IDs were programmed then, according to the statement in
>>> sdw_modify_slave_status()
>>>
>>>      * programming a device number will have side effects,
>>>      * so we deal with other devices at a later time
>>>
>>> if this is true, then we need to exit to deal with what _was_
>>> programmed, even if one of them failed.
>>>
>>> If nothing was programmed, and there was an error, we can't bail out of
>>> sdw_modify_slave_status(). We have status for other devices which
>>> we can't simply ignore.
>>>
>>> Ultimately I can't see how pushing the error code up is useful.
>>> sdw_modify_slave_status() can't really do any effective recovery action,
>>> and the original behavior of giving up and returning means that
>>> an error in programming dev ID potentially causes collateral damage to
>>> the status of other peripherals.
>>
>> I was suggesting something like
>>
>>
>> void sdw_fill_msg_data(...)
>> {
>>    copy data in the msg structure
>> }
>>
>> int sdw_fill_msg(...)
>> {
>>      sdw_fill_msg_data();
>>      handle_error_cases
>> }
>>
>> and in sdw sdw_program_device_num() we call directly sdw_fill_msg_data()
>>
>> So no change in functionality beyond explicit skip of error checks that
>> are not relevant and cannot be handled even if they were.
>>
> 
> sdw_fill_msg() will never report an error during
> sdw_program_device_num() because the first check is to return if
> the address doesn't need paging, and sdw_program_device_num() only
> accesses SCP registers.
> 
> I don't want to mix coding improvements with bugfixes. Splitting
> sdw_fill_msg() isn't needed to fix this bug.

It's not required but it helps remove a useless always-false condition.
We have way too many error cases in the bus code, most of which have
never been tested. Agree it can be done later, it's just that reviewing
this code changes exposes things that were not noticed before.
