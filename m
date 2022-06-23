Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F98E557E56
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 16:57:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C34D31B21;
	Thu, 23 Jun 2022 16:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C34D31B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655996225;
	bh=AT8JAPkS8YJRYuTDNqpAngPAp17BB/bvcfqew+27oho=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aZhGYLjR18RmpREXdyrfmnud1vmqT5hY1sQTQjNKzZT6nZjg4orQuUSfRqMuQ23oA
	 P6saMM/Jp8xN+rcNUvI3OhdsqFQVjYMxpOZgaNqFjXTe4V0QJnseLUsljBquvRcUNI
	 c2of81jLwsfnnIfTnX5AYAJiu3sKntY7MqiLMrNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CBBFF804CC;
	Thu, 23 Jun 2022 16:56:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C6ADF804C1; Thu, 23 Jun 2022 16:56:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4ED6F800BD
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 16:55:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4ED6F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="S5rdYhpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655996161; x=1687532161;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AT8JAPkS8YJRYuTDNqpAngPAp17BB/bvcfqew+27oho=;
 b=S5rdYhpcfDVXATojm134aaVTItF9u7231P43vTaVDG/l8qKYC7luUoKu
 BTBVlyKTaddAkqpqTFS5aRZlmf2S74YdMbawV8RXPf9Mg4tjtqHi1vOji
 HhTaa/QE3YbUr1cyW/KTrHqjUcQd9aK9yOokSR6Cs17DzDzjBLQuGzZjo
 tMSgDfehnbncfXUP11/CYxA/peT0iQQujAqJBW0w4UyiX9A/d+UzBQuOz
 2IQwFfjZGQndw2jpID16YiCxrmwK636evq3aiVomEnL6vDDC2O227y1pA
 /9T/ZyWTUOZ4hADE3o+zHlzhCtRJ9yM86xUuE3nuVVwB+iy8BIAAI9lyZ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="260556654"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="260556654"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 07:55:54 -0700
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="691055713"
Received: from rames2-mobl.amr.corp.intel.com (HELO [10.213.181.118])
 ([10.213.181.118])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 07:55:53 -0700
Message-ID: <a861f3b2-dec4-982d-0939-1dfc18dd2f53@linux.intel.com>
Date: Thu, 23 Jun 2022 09:54:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH] soundwire: bus_type: fix remove and shutdown support
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20220610015105.25987-1-yung-chuan.liao@linux.intel.com>
 <YrQca7YH8v6XCl02@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YrQca7YH8v6XCl02@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, bard.liao@intel.com
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



On 6/23/22 02:55, Vinod Koul wrote:
> On 10-06-22, 09:51, Bard Liao wrote:
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> The bus sdw_drv_remove() and sdw_drv_shutdown() helpers are used
>> conditionally, if the driver provides these routines.
>>
>> These helpers already test if the driver provides a .remove or
>> .shutdown callback, so there's no harm in invoking the
>> sdw_drv_remove() and sdw_drv_shutdown() unconditionally.
> 
> Okay sounds good
> 
>> In addition, the current code is imbalanced with
>> dev_pm_domain_attach() called from sdw_drv_probe(), but
>> dev_pm_domain_detach() called from sdw_drv_remove() only if the driver
>> provides a .remove callback.
> 
> Am not sure I follow what is imbalance, pm_domain_attach/detach?

Yes, the dev_pm_domain_detach() is done conditionally, depending on the
presence of a driver .remove callback, that's not so good.

>> Fixes: 9251345dca24b ("soundwire: Add SoundWire bus type")
> 
> How is this a fix is still unclear to me. At best I think this is code
> optimization and removing checks which maybe redundant.

I think the Fixes tag is appropriate for the dev_pm_domain_detach()
problem, but if you want to drop it that's fine with me.


>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Rander Wang <rander.wang@intel.com>
>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> ---
>>  drivers/soundwire/bus_type.c | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
>> index 893296f3fe39..b81e04dd3a9f 100644
>> --- a/drivers/soundwire/bus_type.c
>> +++ b/drivers/soundwire/bus_type.c
>> @@ -193,12 +193,8 @@ int __sdw_register_driver(struct sdw_driver *drv, struct module *owner)
>>  
>>  	drv->driver.owner = owner;
>>  	drv->driver.probe = sdw_drv_probe;
>> -
>> -	if (drv->remove)
>> -		drv->driver.remove = sdw_drv_remove;
>> -
>> -	if (drv->shutdown)
>> -		drv->driver.shutdown = sdw_drv_shutdown;
>> +	drv->driver.remove = sdw_drv_remove;
>> +	drv->driver.shutdown = sdw_drv_shutdown;
>>  
>>  	return driver_register(&drv->driver);
>>  }
>> -- 
>> 2.17.1
> 
