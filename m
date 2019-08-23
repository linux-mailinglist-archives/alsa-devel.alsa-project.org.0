Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 813D09A9D2
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 10:12:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05E1E1668;
	Fri, 23 Aug 2019 10:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05E1E1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566547963;
	bh=NEfIgBlR+jVzgZhoyFPUc/EpoeHuPCWTlgW8DYKxZ1Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FbKgdgBRTdwYZDkSQg5Xg3SJ+Te0Nb8RWqLbThIRZ1FzR08WUDvDxbFcYymMOsV3k
	 ThpDXgO05fTXc3uhxFKbL6aEU/q8ZsdjvwDieAW23v9Y+kxeS9FIrVGEsUeVNph79x
	 RvGBSr1j9SLqc3hUoGUYHEYWZKJ2bWD8pG54sqzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DB36F80322;
	Fri, 23 Aug 2019 10:11:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB9DEF80306; Fri, 23 Aug 2019 10:10:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B379EF80141
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 10:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B379EF80141
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F2834D33158D16DFF868;
 Fri, 23 Aug 2019 16:10:44 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0;
 Fri, 23 Aug 2019 16:10:43 +0800
To: Vinod Koul <vkoul@kernel.org>
References: <20190816141409.49940-1-yuehaibing@huawei.com>
 <20190822145408.76272-1-yuehaibing@huawei.com>
 <20190823064417.GC2672@vkoul-mobl>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <d4eb9dc5-ac74-2055-003a-7c15f258aaf5@huawei.com>
Date: Fri, 23 Aug 2019 16:10:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190823064417.GC2672@vkoul-mobl>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: sanyog.r.kale@intel.com, ladis@linux-mips.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 -next] soundwire: Fix -Wunused-function
	warning
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019/8/23 14:44, Vinod Koul wrote:
> On 22-08-19, 22:54, YueHaibing wrote:
>> If CONFIG_ACPI is not set, gcc warning this:
>>
>> drivers/soundwire/slave.c:16:12: warning:
>>  'sdw_slave_add' defined but not used [-Wunused-function]
>>
>> Now all code in slave.c is only used on ACPI enabled,
>> so compiles it while CONFIG_ACPI is set.
> 
> Sorry YueHaibing as I have said to other patch doing this, this slave.c
> is acpi specific but Srini has already send DT support for this so it
> doesn't become acpi only and this warn also goes away. We should get the
> DT support soon

Ok, thanks!

> 
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Suggested-by: Ladislav Michl <ladis@linux-mips.org>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>> v2: use obj-$(CONFIG_ACPI) += slave.o
>> ---
>>  drivers/soundwire/Makefile | 3 ++-
>>  drivers/soundwire/slave.c  | 3 ---
>>  2 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
>> index 45b7e50..a28bf3e 100644
>> --- a/drivers/soundwire/Makefile
>> +++ b/drivers/soundwire/Makefile
>> @@ -4,8 +4,9 @@
>>  #
>>  
>>  #Bus Objs
>> -soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
>> +soundwire-bus-objs := bus_type.o bus.o mipi_disco.o stream.o
>>  obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
>> +obj-$(CONFIG_ACPI) += slave.o
>>  
>>  #Cadence Objs
>>  soundwire-cadence-objs := cadence_master.o
>> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
>> index f39a581..0dc188e 100644
>> --- a/drivers/soundwire/slave.c
>> +++ b/drivers/soundwire/slave.c
>> @@ -60,7 +60,6 @@ static int sdw_slave_add(struct sdw_bus *bus,
>>  	return ret;
>>  }
>>  
>> -#if IS_ENABLED(CONFIG_ACPI)
>>  /*
>>   * sdw_acpi_find_slaves() - Find Slave devices in Master ACPI node
>>   * @bus: SDW bus instance
>> @@ -110,5 +109,3 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
>>  
>>  	return 0;
>>  }
>> -
>> -#endif
>> -- 
>> 2.7.4
>>
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
