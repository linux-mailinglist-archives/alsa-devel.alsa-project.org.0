Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F77F87401
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 10:27:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0869D4E;
	Fri,  9 Aug 2019 10:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0869D4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565339228;
	bh=VfuHIGm1dXUqYDFFGBSGu4zHOBlNIXpgZhuvWFidchA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZctoDWprqUCV+lfk7lO1F7wmqrwJ4Chy9lCTcbhct2YmQbONAkHGuaqINtOtp0z5i
	 hDE2dhGeesUEvOg8ch9scMo3KpgJ7FNtEFP85BSkt6WY9b1epupytb5ZjgDFUqucbf
	 ghx0kYnrrPTMC28Mkc9P9apMOyY47TDoQD/i/euY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C01DAF804CB;
	Fri,  9 Aug 2019 10:25:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADA30F805A8; Fri,  9 Aug 2019 10:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43FC5F804CB
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 10:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43FC5F804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Zyjh9gtT"
Received: by mail-wr1-x441.google.com with SMTP id c2so94187975wrm.8
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 01:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4bwjEP95txtOHDBD1+R4OTFyaoeJz+djJoj+dbpesf4=;
 b=Zyjh9gtTAr16g2yoj8tRqk04Iay5zdgGDnNjW9pLwgel/w6CeNCK+0InEkuDLEMbwF
 MV6+iJjXPrTRKrXnzWsOME5uyxVd1lxPFPSKxACRop+JiT+ggi/me0HVfcRGFsVZ8Xqr
 242ekKzkU52aGgbJh8OSZObZS7N8ReHni4sGfVU7Ql7XAOJKGaShvf3pY+NBGEwXmfYi
 Wlv6dNLZFZZhPU8WxjuacEhMokuIc8bW9Mx0O1u+Z2yYldrOi0is53XXUx5PSk60otWU
 ra/zABdvWkIvBShv6oHCti1wImLM2C+kdctLpKf8SoAdCet9lCYU4s7vYjMG4XrCF94w
 BtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4bwjEP95txtOHDBD1+R4OTFyaoeJz+djJoj+dbpesf4=;
 b=fLvBssMxBQ1x4Od01EfrO9mo2HHqPtqlUOA4YOmF6mKyqt3KELlhrwBSVt5QZF0jfn
 SMPHagVHvytQY1oCrFLK9vLneaKSRwE1yQqDD2elqqjP07NhIkyCoDodG4UGd0adb+da
 pgzRYPmmLl061lckOMpKb4zB1F9YYSPDxx6KUA95OrMrEPflDLmB8AhinwPZNhQ+y/5R
 y6ycC5+Fo2/vUfyHDHZjtA9ueicP69vn6h2Y+oPcrZZrV/PJbj9sf7eACQ/MNLrfnTsT
 Cll8N06xHb8iz9uwOH9EtjqJXX8VWAlA6jrNkttKBTKQ75vwfQte+MqTDMjVnPZk6nPi
 vBFQ==
X-Gm-Message-State: APjAAAXZm/njrrCsAE1iX2FNgcLBQ+aon3FIuL/WQeWg28yfnRgC7OKz
 V0Dr1cCwddoNs7mAiNLBzT+91Q==
X-Google-Smtp-Source: APXvYqywuWZdqEZBSw9gBZGf07b6clQaELk5FU3PHGD3jRRmL/QvZ/Dob6AhlQsD4ctm1JCz/DPkPQ==
X-Received: by 2002:adf:dbcd:: with SMTP id e13mr7368769wrj.314.1565339095173; 
 Fri, 09 Aug 2019 01:24:55 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id
 f134sm11069391wmg.20.2019.08.09.01.24.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 01:24:54 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-3-srinivas.kandagatla@linaro.org>
 <20190809050700.GJ12733@vkoul-mobl.Dlink>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5deac3ae-87b3-c9ce-72ac-bf605db35231@linaro.org>
Date: Fri, 9 Aug 2019 09:24:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190809050700.GJ12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 2/4] soundwire: core: add device tree
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



On 09/08/2019 06:07, Vinod Koul wrote:
> On 08-08-19, 15:45, Srinivas Kandagatla wrote:
>> This patch adds support to parsing device tree based
>> SoundWire slave devices.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/bus.c   |  2 ++
>>   drivers/soundwire/bus.h   |  1 +
>>   drivers/soundwire/slave.c | 47 +++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 50 insertions(+)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index fe745830a261..324c54dc52fb 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -77,6 +77,8 @@ int sdw_add_bus_master(struct sdw_bus *bus)
>>   	 */
>>   	if (IS_ENABLED(CONFIG_ACPI) && ACPI_HANDLE(bus->dev))
>>   		ret = sdw_acpi_find_slaves(bus);
>> +	else if (IS_ENABLED(CONFIG_OF) && bus->dev->of_node)
>> +		ret = sdw_of_find_slaves(bus);
>>   	else
>>   		ret = -ENOTSUPP; /* No ACPI/DT so error out */
>>   
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
>> index f39a5815e25d..8ab76f5d5a56 100644
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
>> @@ -35,6 +36,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
>>   
>>   	slave->dev.release = sdw_slave_release;
>>   	slave->dev.bus = &sdw_bus_type;
>> +	slave->dev.of_node = of_node_get(to_of_node(fwnode));
>>   	slave->bus = bus;
>>   	slave->status = SDW_SLAVE_UNATTACHED;
>>   	slave->dev_num = 0;
>> @@ -112,3 +114,48 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
>>   }
>>   
>>   #endif
>> +
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
>> +	for_each_child_of_node(bus->dev->of_node, node) {
>> +		struct sdw_slave_id id;
>> +		const char *compat = NULL;
>> +		int unique_id, ret;
>> +		int ver, mfg_id, part_id, class_id;
>> +
>> +		compat = of_get_property(node, "compatible", NULL);
>> +		if (!compat)
>> +			continue;
> 
> Why not use of_find_compatible_node() that will return the node which is
> sdw* and we dont need to checks on that..

Am not sure if wild characters are really supported in this api.
Also AFIU, it would not very optimal to use this api and it would 
complicate the code without much gain.


> 
>> +
>> +		ret = sscanf(compat, "sdw%x,%x,%x,%x",
>> +			     &ver, &mfg_id, &part_id, &class_id);
>> +		if (ret != 4) {
>> +			dev_err(dev, "Manf ID & Product code not found %s\n",
>> +				compat);
>> +			continue;
>> +		}
>> +
>> +		ret = of_property_read_u32(node, "sdw-instance-id", &unique_id);
>> +		if (ret) {
>> +			dev_err(dev, "Instance id not found:%d\n", ret);
>> +			continue;
>> +		}
>> +
>> +		id.sdw_version = ver - 0xF;
>> +		id.unique_id = unique_id;
>> +		id.mfg_id = mfg_id;
>> +		id.part_id = part_id;
>> +		id.class_id = class_id;
> 
> empty line here please
yep, will add that.

thanks,
srini
> 
>> +		sdw_slave_add(bus, &id, of_fwnode_handle(node));
>> +	}
> 
> and here as well
> 
>> +	return 0;
>> +}
>> -- 
>> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
