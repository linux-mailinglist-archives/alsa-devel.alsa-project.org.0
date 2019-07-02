Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3CB5CBFB
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 10:24:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2B3F1680;
	Tue,  2 Jul 2019 10:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2B3F1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562055872;
	bh=YToN9hTXgOMsGps/+fw2vSrRcsUFOcIWXw09t0e7o7Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XmGQ5AzzwNH9cLhMtjmW0mIHnrHIgzGp3Pui3d7B/TjE2Xxw2+ncPHQ4oQfvQNTcu
	 8CjZgn2JBpYvAhQwUYVFAZxqJO6F1C+V1tleFnDKmCV5ykIlQHnvmvLiF7P+5r9n9K
	 hPYgNKs4XXQgWIBhVdzsLDtgVjl1hWD9Vo9AS7Jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6599F800E4;
	Tue,  2 Jul 2019 10:22:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60683F800DF; Tue,  2 Jul 2019 10:22:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E400DF800D3
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 10:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E400DF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="K9B4oL9O"
Received: by mail-wr1-x441.google.com with SMTP id c27so8986689wrb.2
 for <alsa-devel@alsa-project.org>; Tue, 02 Jul 2019 01:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vYWQ+sDhyFlw91XFV9mAOBrhaIXwN0ArOngCGYdsiF0=;
 b=K9B4oL9Oqg9tS3O+ZwDqRZczqzQ8Dq4j9opnmwMvQHH8+EEQx4PfZmYQVm9j6NQHRQ
 E6xn52+0bQd8Mhy4KJjeVngvi7HJz1Xo3AEIgBbaT8L9ZyBWC9ZGZOU4LFrF3xrLvRVH
 Vt21OyshHLRtEvoql3xpZB0vUa4tDVbg/gB38a3YqTBDUps4GrdtQ64FFfZD0QEaoHms
 yMHMSYuNg/nuC6oOTdHJVh0UcweLbC3bVzRY7vH+xwQO7Mr91XvEi8RF8FZc1IKFW2De
 pF1GfXDE5qsi8EFM+WqqICGZDrqnphvgTbxxHU5AYrURUeh3i5Vd9PiUe3BzMqkZmEI5
 hGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vYWQ+sDhyFlw91XFV9mAOBrhaIXwN0ArOngCGYdsiF0=;
 b=NkTiYIlBYBE7+RsXqKZSXzCz936sg4phjhZOXIW19tNmvIzE6pDVrOgklKQ397RxdW
 8eoWIsGja53wH3yZig7RdiEmpVDxGhIVcAim3mJL/Vr3NFGs/varmSdYMH4abxaVREl1
 ZV0EhdUX2XEolO9aBNcEVswsPSquNTP68WZBQE+bV+/41LFwDVacgzqD66ID5ak8yMxE
 GWIRv849ch5hWJHXFW4Vlj9eebaOyGFcF7laY8D2YRHWSfsd89t3srb9c756otPayDYC
 dz8iUDp6Oeoc1y3bYoI7qd2FASfWf7dRiL23+i5bWGb2BeMONb5REQGjLGw0iEdegRam
 xDFQ==
X-Gm-Message-State: APjAAAVWURCj7oOKgFsxWclGqAAfdNcOFjVsr6eM26LwnR15Cwn1HAI3
 vHUUehyg5twPjA1TTik+a/zlhg==
X-Google-Smtp-Source: APXvYqxTrHwbXeG/opRoDSVdOC0GcAMdxzTCfEDJ7BTZaFAkzF5llutiJIwJgPjO6trI78e7j1/6AQ==
X-Received: by 2002:adf:e705:: with SMTP id c5mr23345395wrm.270.1562055730054; 
 Tue, 02 Jul 2019 01:22:10 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id o185sm1582323wmo.45.2019.07.02.01.22.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 01:22:09 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
 <20190611104043.22181-3-srinivas.kandagatla@linaro.org>
 <20190701061745.GK2911@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c2b74c2c-0491-fdd1-3967-b3332645d8df@linaro.org>
Date: Tue, 2 Jul 2019 09:22:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701061745.GK2911@vkoul-mobl>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 bgoswami@quicinc.com
Subject: Re: [alsa-devel] [RFC PATCH 2/5] soundwire: core: add device tree
 support for slave devices
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

Thanks for review,

On 01/07/2019 07:17, Vinod Koul wrote:
> On 11-06-19, 11:40, Srinivas Kandagatla wrote:
>> This patch adds support to parsing device tree based
>> SoundWire slave devices.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/bus.c   |  2 +-
>>   drivers/soundwire/bus.h   |  1 +
>>   drivers/soundwire/slave.c | 54 ++++++++++++++++++++++++++++++++++++++-
>>   3 files changed, 55 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index fe745830a261..20f26cf4ba74 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -78,7 +78,7 @@ int sdw_add_bus_master(struct sdw_bus *bus)
>>   	if (IS_ENABLED(CONFIG_ACPI) && ACPI_HANDLE(bus->dev))
>>   		ret = sdw_acpi_find_slaves(bus);
>>   	else
>> -		ret = -ENOTSUPP; /* No ACPI/DT so error out */
>> +		ret = sdw_of_find_slaves(bus);
>>   
>>   	if (ret) {
>>   		dev_err(bus->dev, "Finding slaves failed:%d\n", ret);
>> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
>> index 3048ca153f22..ee46befedbd1 100644
>> --- a/drivers/soundwire/bus.h
>> +++ b/drivers/soundwire/bus.h
>> @@ -15,6 +15,7 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
>>   }
>>   #endif
>>   
>> +int sdw_of_find_slaves(struct sdw_bus *bus);
>>   void sdw_extract_slave_id(struct sdw_bus *bus,
>>   			  u64 addr, struct sdw_slave_id *id);
>>   
>> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
>> index f39a5815e25d..6e7f5cfeb854 100644
>> --- a/drivers/soundwire/slave.c
>> +++ b/drivers/soundwire/slave.c
>> @@ -2,6 +2,7 @@
>>   // Copyright(c) 2015-17 Intel Corporation.
>>   
>>   #include <linux/acpi.h>
>> +#include <linux/of.h>
>>   #include <linux/soundwire/sdw.h>
>>   #include <linux/soundwire/sdw_type.h>
>>   #include "bus.h"
>> @@ -28,13 +29,14 @@ static int sdw_slave_add(struct sdw_bus *bus,
>>   	slave->dev.parent = bus->dev;
>>   	slave->dev.fwnode = fwnode;
>>   
>> -	/* name shall be sdw:link:mfg:part:class:unique */
>> +	/* name shall be sdw:link:mfg:part:class */
> 
> nope we are not changing dev_set_name below so this comment should not
> be modified

Am not sure why this change was here, I will remove this!
> 
>>   	dev_set_name(&slave->dev, "sdw:%x:%x:%x:%x:%x",
>>   		     bus->link_id, id->mfg_id, id->part_id,
>>   		     id->class_id, id->unique_id);
>>   
>>   	slave->dev.release = sdw_slave_release;
>>   	slave->dev.bus = &sdw_bus_type;
>> +	slave->dev.of_node = of_node_get(to_of_node(fwnode));
>>   	slave->bus = bus;
>>   	slave->status = SDW_SLAVE_UNATTACHED;
>>   	slave->dev_num = 0;
>> @@ -112,3 +114,53 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
>>   }
>>   
>>   #endif
>> +
>> +#if IS_ENABLED(CONFIG_OF)
>> +/*
>> + * sdw_of_find_slaves() - Find Slave devices in master device tree node
>> + * @bus: SDW bus instance
>> + *
>> + * Scans Master DT node for SDW child Slave devices and registers it.
>> + */
>> +int sdw_of_find_slaves(struct sdw_bus *bus)
>> +{
>> +	struct device *dev = bus->dev;
>> +	struct device_node *node;
>> +
>> +	if (!bus->dev->of_node)
>> +		return 0;
> 
> this should be error, otherwise next condition of checking slaves wont
> be triggered..
> 
I agree! will fix this in next version.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
