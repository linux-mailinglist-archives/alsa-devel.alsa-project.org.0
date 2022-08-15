Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9535951D0
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 07:17:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 039BE15C1;
	Tue, 16 Aug 2022 07:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 039BE15C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660627066;
	bh=ySf94eO1UDWePfbKlRGmowTvkm3GhgAZk6bfaQoz9Ps=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JINmcEa7fRwY8uXfOkZDkbfRd4awS9YuqUE+TY2CyjSrdPnxp5mxoLM+cUiLZmemx
	 MRjORrLB3aLOnh6uet+2DkmpKn8KSqGfHTiBjlPNeUtaCpaxHPbFQaeiw1wdZA2BRD
	 lV2CSWxcR+PvXzXqZhcXBkbj81TtIUL9Ta6DIe3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D535DF80431;
	Tue, 16 Aug 2022 07:16:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 695E8F8025A; Mon, 15 Aug 2022 06:08:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C5A7F80082
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 06:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C5A7F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K0mPaT+N"
Received: by mail-pl1-x62d.google.com with SMTP id 13so5437196plo.12
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 21:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=8hntQHoZ9Gf9EapoG7OUHkjCCy7RUxfP8D6OFpiBLZE=;
 b=K0mPaT+Ne0sR56DQhZkB0bHdsZxqQQgYPtaXecGLmhyy89OMj07hkhf4ZjiHNxgMih
 2C/aj9sPPTJorIJmhN1KFwrfHO5IAmGLlaliYGD3OfwydJNc38oVL+il+TN/iNm4hevE
 3IrbI6fl4h05tlE9Vx0chJLS9IN9D5gltv/UZNERo4qsG8aj+WHDc+1fGZzthdBjoCFg
 X2b09EmknfCM4ejvoFzWn2GNl+540olVVmkE4dF1tnr16UHKVxHKgzGIDjl34Jq20g0u
 W1nsW9/EVC04ga9kSESpbx1j/9AhuFGYU+p7xsydnmJbiQ1CInBphFmwslnQX51zWBKR
 kPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8hntQHoZ9Gf9EapoG7OUHkjCCy7RUxfP8D6OFpiBLZE=;
 b=o1BbMmQ4VMRdiApypI38JgRIR3LcfysloMynzYhXCWQgkER6k6+nU3W/VesxXJvXHt
 FhTI3lQj13c5vDc1i4VJQ5J9wneVR42VhfeqOZRG+aeUOhWZigv0skTnVDIaG9doGI6i
 OTQbL/CI+MArkn3KCQ7QKEe14mXJ+Dmf12DX3bCj4Z92jd8NEawVLF8ajQPEEXFB79kF
 czv9SqVoY2O/he4t6m0gtPo0zqdHRVYvfU4AwJvcHHYl8xq2laecPRF47/EwTZUOsjC7
 yG/8qUHmbXLiCCFc/djQvzvErvWgHWfXoLAavWx30moHSU4QEbk1WhkG1E3RCKd5sW9c
 pmCg==
X-Gm-Message-State: ACgBeo2LpeEeZTVv2Pk5XaDZKx0mirkUHMrdRvxhhbe8JzIx6F/l0qW+
 jb5Bi5hACCxl0scgTck+0l0=
X-Google-Smtp-Source: AA6agR5ZjWehLH23fBf8T62x3uR4J1jayTxfMTMd8U2E8rJ59TUX5AIiemdUO1NZSKljU005g3Z6GA==
X-Received: by 2002:a17:902:e811:b0:170:8af3:824d with SMTP id
 u17-20020a170902e81100b001708af3824dmr14932403plg.26.1660536496248; 
 Sun, 14 Aug 2022 21:08:16 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.148])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a170902ce8200b0015e8d4eb1d7sm6152838plg.33.2022.08.14.21.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Aug 2022 21:08:15 -0700 (PDT)
Message-ID: <cc6560c3-98c2-bdb5-cfc3-b39d3675382e@gmail.com>
Date: Mon, 15 Aug 2022 10:08:07 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
Content-Language: en-US
To: Greg KH <greg@kroah.com>
References: <20220814080416.7531-1-khalid.masum.92@gmail.com>
 <YvjEIjXg7KxtTT/0@kroah.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <YvjEIjXg7KxtTT/0@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 16 Aug 2022 07:16:15 +0200
Cc: alsa-devel@alsa-project.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>
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

On 8/14/22 15:45, Greg KH wrote:
> On Sun, Aug 14, 2022 at 02:04:15PM +0600, Khalid Masum wrote:
>> According to the TODO, In sw_bus_master_add, bus->multi_link is to be
>> populated with properties from FW node props. Make this happen by
>> creating a new fwnode_handle flag FWNODE_FLAG_MULTI_LINKED and use
>> the flag to store the multi_link value from intel_link_startup. Use
>> this flag to initialize bus->multi_link.
>>
>> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
>> ---
>> I do not think adding a new flag for fwnode_handle is a good idea.
>> So, what would be the best way to initialize bus->multilink with
>> fwnode props?
>>
>>    -- Khalid Masum
>>
>>   drivers/soundwire/bus.c   | 4 ++--
>>   drivers/soundwire/intel.c | 1 +
>>   include/linux/fwnode.h    | 1 +
>>   3 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index a2bfb0434a67..80df1672c60b 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -74,9 +74,9 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
>>   
>>   	/*
>>   	 * Initialize multi_link flag
>> -	 * TODO: populate this flag by reading property from FW node
>>   	 */
>> -	bus->multi_link = false;
>> +	bus->multi_link = (fwnode->flags & FWNODE_FLAG_MULTI_LINKED)
>> +		== FWNODE_FLAG_MULTI_LINKED;
>>   	if (bus->ops->read_prop) {
>>   		ret = bus->ops->read_prop(bus);
>>   		if (ret < 0) {
>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>> index 505c5ef061e3..034d1c523ddf 100644
>> --- a/drivers/soundwire/intel.c
>> +++ b/drivers/soundwire/intel.c
>> @@ -1347,6 +1347,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
>>   		 */
>>   		bus->multi_link = true;
>>   		bus->hw_sync_min_links = 1;
>> +		dev->fwnode->flags |= FWNODE_FLAG_MULTI_LINKED;
>>   	}
>>   
>>   	/* Initialize shim, controller */
>> diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
>> index 9a81c4410b9f..446a52744953 100644
>> --- a/include/linux/fwnode.h
>> +++ b/include/linux/fwnode.h
>> @@ -32,6 +32,7 @@ struct device;
>>   #define FWNODE_FLAG_NOT_DEVICE			BIT(1)
>>   #define FWNODE_FLAG_INITIALIZED			BIT(2)
>>   #define FWNODE_FLAG_NEEDS_CHILD_BOUND_ON_ADD	BIT(3)
>> +#define FWNODE_FLAG_MULTI_LINKED		BIT(4)
> 
> What does this commit actually change?

The new flag will lets us save if the device has multilink in 
fwnode_handle whenever needed.
Then for soundwire/intel, save the multi_link flag into fwnode during 
startup.
Later at master_add, as written in todo, initialize the multilink flag 
with fwnode's flag property.

> 
> Did you test this on real hardware?

I did not test this on real hardware.
> 
> thanks,
> 
> greg k-h

thanks,
  -- Khalid Masum

