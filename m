Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5459A32A458
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 16:40:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D188C1762;
	Tue,  2 Mar 2021 16:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D188C1762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614699606;
	bh=i5avD5SL3QIC3fNQ1K/iA1gy4tiGidJc+XGbqGKanFI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OxGbfAp80AxPe5qeM9W0Cl4d19ogUyIhAuEysYdZlVJb4oneP6883CeV+FaJQip1D
	 0wRZcF4YBZd7gDdbyPLRy9/xFIDzI3oRabn7Eloom7o5cSmB0DgpzQ/NQj2SxYe41r
	 D1T3owbiB2bIuidx37QKb66qm2Dv283AAL4ieho0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8080AF80227;
	Tue,  2 Mar 2021 16:38:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11E7AF80277; Tue,  2 Mar 2021 16:38:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2157F80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 16:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2157F80227
IronPort-SDR: DnSCmIaM8xge7sOAff1Z6/3BQWT+nDpnhGBhjD9DQdw+3in7L7H+3qlFJ3IRkdDbnWx1PvqgwA
 x0xDj/Q/jvRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="166091273"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="166091273"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 07:38:16 -0800
IronPort-SDR: t42/PZ4jrGz5dxXWIJGpDdOBP7Y3nto3jy/t28rx/oVdcVQ+CnqbmheaJGiVU7FM0MDBb/mG1R
 vFwLjBHQaxIw==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="406768964"
Received: from bgrewell-mobl3.amr.corp.intel.com (HELO [10.212.242.206])
 ([10.212.242.206])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 07:38:15 -0800
Subject: Re: [PATCH 2/3] soundwire: qcom: add auto enumeration support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20210226170250.9067-1-srinivas.kandagatla@linaro.org>
 <20210226170250.9067-3-srinivas.kandagatla@linaro.org>
 <0c551b23-7ed4-59d7-72c2-284bdf8584f1@linux.intel.com>
 <4721dd27-c8ce-f988-3c10-794841390656@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <01e5ea33-1813-069a-1674-042141947323@linux.intel.com>
Date: Tue, 2 Mar 2021 08:34:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4721dd27-c8ce-f988-3c10-794841390656@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
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



>>> +        if (!val1 && !val2)
>>> +            break;
>>> +
>>> +        addr = buf2[1] | (buf2[0] << 8) | (buf1[3] << 16) |
>>> +            ((u64)buf1[2] << 24) | ((u64)buf1[1] << 32) |
>>> +            ((u64)buf1[0] << 40);
>>> +
>>> +        sdw_extract_slave_id(bus, addr, &id);
>>> +        /* Now compare with entries */
>>> +        list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
>>> +            if (sdw_compare_devid(slave, id) == 0) {
>>> +                u32 status = qcom_swrm_get_n_device_status(ctrl, i);
>>> +                if (status == SDW_SLAVE_ATTACHED) {
>>> +                    slave->dev_num = i;
>>> +                    mutex_lock(&bus->bus_lock);
>>> +                    set_bit(i, bus->assigned);
>>> +                    mutex_unlock(&bus->bus_lock);
>>> +
>>> +                }
>>
>> And that part is strange as well. The bus->assigned bit should be set 
>> even if the Slave is not in the list provided by platform firmware. 
>> It's really tracking the state of the hardware, and it should not be 
>> influenced by what software knows to manage.
> 
> Am not 100% sure If I understand the concern here, but In normal (non 
> auto enum) cases this bit is set by the bus code while its doing 
> enumeration to assign a dev number from the assigned bitmap!
> 
> However in this case where auto enumeration happens it makes sense to 
> set this here with matching dev number!
> 
> AFAIU from code, each bit in this bitmap corresponds to slave dev number!

Yes, but the point was "why do you compare with information coming from 
platform firmware"? if the hardware reports the presence of devices on 
the link, why not use the information as is?

You recently added code that helps us deal with devices that are not 
listed in DT or ACPI tables, so why would we filter in this specific loop?

>>> +    complete(&ctrl->enumeration);
>>
>> you have init_completion() and complete() in this patch, but no 
>> wait_for_completion(), so that should be added in a later patch, no?
> 
> make sense, will move that to other patch!

Actually on this one comment that I missed last time is that you are 
using a completion only for the resume() case, and I think it should 
also be used for the regular probe() case, no?

