Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7EC262F8E
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 16:11:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3B4816E9;
	Wed,  9 Sep 2020 16:11:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3B4816E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599660715;
	bh=sewkFFQPmxCkksXhk5jb+plwGW1ezWRKd9/+cZFFR84=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m6GuO0AyaAZZdNEifehthJ6n4BK/jiyxv45+EFg+9AWctLyvxh1QkoLZrtCIhrnvV
	 SPN5E7N7N0HFIz+TYdMtVaXkbdJawn+WCBxZKqe0U7qsH6EXJbZ9vH17rG4CDRIa9v
	 2bJdRbSuRRJtpqj18b3i1r6k9F4r/Jcfrznodor0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E35B2F80240;
	Wed,  9 Sep 2020 16:10:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40889F80227; Wed,  9 Sep 2020 16:10:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ED6AF800E9
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 16:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ED6AF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="azMdh4tc"
Received: by mail-wr1-x442.google.com with SMTP id o5so3078936wrn.13
 for <alsa-devel@alsa-project.org>; Wed, 09 Sep 2020 07:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AqdCvXthY64M0/BgH+IgO4cFQky1yop2f9gBjmeTzIo=;
 b=azMdh4tcatk3h2bNwuMv8KW2hiBxo01r6sZN+Y96c4MLNjFQfR0t+Wl3xOHJVaYwnp
 fG7zz7yRlCMKv+SvjUWBHEoiP99bK5xI2/ACJzcsue6LVeXzuHXzZ9yVWh8JIGS+L70Q
 dpBwgWa3h9E27uF5zzzhK9uo9F59usK2vq3oLEWU3TAHeu0c8nYQHXHFE1AhirII4j72
 J1VaGxv5vKWkZTKzRFNAS0NcaisGUEno0XdInD1Ed3FBJ37KG/JaCxS9RkU+mbBV14iu
 hLPId/z8KKiZAqmhZ2U+g91+oS/W9WD5kL+aXMG1NqcB6aNSYGEWO6isiK9LPkvM+SqS
 ZUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AqdCvXthY64M0/BgH+IgO4cFQky1yop2f9gBjmeTzIo=;
 b=PA1xpdSCquRKLgVEEpsL8AO+UiE4PRZfnFhbv+1sNMS5mGGLKxwb9gMX0bJm+X0Hqn
 K2+mjwn8ssknFbyinqL4IqV+PDx804rhK6IhRMjyva5gTz3qOTZFauh5VjMsCMfQoL5t
 jkcASuhwWuNiKWZhUOFO3MHJE9u35dthxGWI1mEJnrSQNGTuvS/G4B8ByF7hVQtEmya0
 R01RmnuOattocefoZ9iZRQ7Es1Aw9v90QoH3UOYmiQAYklpUMb8dV1N4f81pz5wMAVeO
 qdKVTrtBQZM0L2AscWplv0CiqOA4J4ioNoFY8okQOxF+pS58kzGvUk0QC/miShtw+Iv3
 Fj/w==
X-Gm-Message-State: AOAM531veXDXaNmgUujmhSiVW0/ZriYNC8FXAIxKoFoVsW/OIJKntRry
 XP7PtSMRGrcWE5xa/vFvY3sZlqEx+N1EWQ==
X-Google-Smtp-Source: ABdhPJxJQB3ifjMaYxPOuJSRUQxdrttYTOXb6TsYOI5JQTv4Nv/vhFgnCG76XhgUp0LkxT1Hn+WFNw==
X-Received: by 2002:adf:e7ce:: with SMTP id e14mr3965390wrn.43.1599660598943; 
 Wed, 09 Sep 2020 07:09:58 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id n14sm2894195wmi.33.2020.09.09.07.09.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Sep 2020 07:09:58 -0700 (PDT)
Subject: Re: [PATCH] soundwire: bus: add enumerated slave to device list
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20200909082711.11670-1-srinivas.kandagatla@linaro.org>
 <80081c70-9137-c9f0-9813-8166275ef7af@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ab107351-dbde-7f6d-c588-11572aed5d2d@linaro.org>
Date: Wed, 9 Sep 2020 15:09:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <80081c70-9137-c9f0-9813-8166275ef7af@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
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



On 09/09/2020 14:37, Pierre-Louis Bossart wrote:
> 
> 
> On 9/9/20 3:27 AM, Srinivas Kandagatla wrote:
>> Currently slave devices are only added either from device tree or acpi
>> entries. However lets say, there is wrong or no entry of a slave device
>> in DT that is enumerated, then there is no way for user to know all
>> the enumerated devices on the bus.
> 
> Sorry Srinivas, I don't understand your point.
> 
> The sysfs entries will include all devices that are described in 
> platform firmware (be it DT or ACPI).

yes that is true, but it will not include all the enumerated devices on 
the bus!

In my case on a new board I was trying to figure out what devices are on 
the bus even before even adding any device tree entries!

In second case I had a typo in the device tree entry and sysfs displayed 
devices with that typo rather than actual enumerated device id.

> 
> If you add to sysfs entries unknown devices which happen to be present 
> on the bus, then what? How would you identify them from the devices that 
> are described in firmware?

Both of them should be displayed in sysfs, core should be able to 
differentiate this based on the presence of fw_node or of_node and not bind!

> 
> Also the sysfs entries describe properties, but if you haven't bound a 
> driver then how would this work?

This is would be informative, atleast in cases like me!

All I want to know is the list of enumerated devices on the bus, If 
doing this way is not the right thing, then am happy to try any suggestion!

For now I have managed to figure out enumerated device ids on the bus 
with this patch, I was hoping that other people would also hit such 
issue, so I sent this patch!


thanks,
srini
> 
> I really feel this deserves more explanations on the problem statement 
> and what you are hoping to achieve in this case.
> 
> Thanks!
> 
>>
>> To fix this add slave device by default if there is no matching dt or
>> acpi entry, so that we can see this in sysfs entry.
>>
>> In my case I had a wrong address entry in DT, However I had no way to
>> know what devices are actually enumerated on the bus!
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/bus.c      | 1 +
>>   drivers/soundwire/bus.h      | 2 ++
>>   drivers/soundwire/bus_type.c | 6 ++++++
>>   drivers/soundwire/slave.c    | 4 ++--
>>   4 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index e6e0fb9a81b4..55d9c22c4ec5 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -699,6 +699,7 @@ static int sdw_program_device_num(struct sdw_bus 
>> *bus)
>>           if (!found) {
>>               /* TODO: Park this device in Group 13 */
>> +            sdw_slave_add(bus, &id, NULL);
>>               dev_err(bus->dev, "Slave Entry not found\n");
>>           }
>> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
>> index 82484f741168..1517d6789dff 100644
>> --- a/drivers/soundwire/bus.h
>> +++ b/drivers/soundwire/bus.h
>> @@ -19,6 +19,8 @@ static inline int sdw_acpi_find_slaves(struct 
>> sdw_bus *bus)
>>   int sdw_of_find_slaves(struct sdw_bus *bus);
>>   void sdw_extract_slave_id(struct sdw_bus *bus,
>>                 u64 addr, struct sdw_slave_id *id);
>> +int sdw_slave_add(struct sdw_bus *bus, struct sdw_slave_id *id,
>> +          struct fwnode_handle *fwnode);
>>   int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
>>                 struct fwnode_handle *fwnode);
>>   int sdw_master_device_del(struct sdw_bus *bus);
>> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
>> index 6fba55898cf0..ac036223046f 100644
>> --- a/drivers/soundwire/bus_type.c
>> +++ b/drivers/soundwire/bus_type.c
>> @@ -84,6 +84,12 @@ static int sdw_drv_probe(struct device *dev)
>>       const struct sdw_device_id *id;
>>       int ret;
>> +    /*
>> +     * fw description is mandatory to bind
>> +     */
>> +    if (!dev->fwnode || !dev->of_node)
>> +        return -ENODEV;
>> +
>>       id = sdw_get_device_id(slave, drv);
>>       if (!id)
>>           return -ENODEV;
>> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
>> index 0839445ee07b..24a16ebf9ae2 100644
>> --- a/drivers/soundwire/slave.c
>> +++ b/drivers/soundwire/slave.c
>> @@ -20,8 +20,8 @@ struct device_type sdw_slave_type = {
>>       .uevent =    sdw_slave_uevent,
>>   };
>> -static int sdw_slave_add(struct sdw_bus *bus,
>> -             struct sdw_slave_id *id, struct fwnode_handle *fwnode)
>> +int sdw_slave_add(struct sdw_bus *bus,
>> +          struct sdw_slave_id *id, struct fwnode_handle *fwnode)
>>   {
>>       struct sdw_slave *slave;
>>       int ret;
>>
