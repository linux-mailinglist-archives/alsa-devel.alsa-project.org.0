Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE3712BBE2
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Dec 2019 01:18:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5A761762;
	Sat, 28 Dec 2019 01:17:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5A761762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577492281;
	bh=YNHnNyztT7YnJKBNcIH4DfTmLDcAMzVayb4Lw1quyn0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JFAAtcKIQ/0y/FYLqzd2De9PCmhFJdOVcraPUKrUv1j3AemUSrE8V864AkX4qx/Eb
	 VU6jJLargBHcRNYdKOc69VXM5YITJCU7ktrXkKgextIXtiKrd3Z48v4e1v1obPomg9
	 XyLl788YasZYeJ4UP5t6MdMgneNaBW4hnYLahCNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28933F800AE;
	Sat, 28 Dec 2019 01:16:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8944F8013D; Sat, 28 Dec 2019 01:16:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DF0FF800CD
 for <alsa-devel@alsa-project.org>; Sat, 28 Dec 2019 01:16:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DF0FF800CD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Dec 2019 16:16:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,364,1571727600"; d="scan'208";a="243364207"
Received: from vdoan2-mobl.ccr.corp.intel.com (HELO [10.251.152.151])
 ([10.251.152.151])
 by fmsmga004.fm.intel.com with ESMTP; 27 Dec 2019 16:16:06 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-4-pierre-louis.bossart@linux.intel.com>
 <20191227070011.GJ3006@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e5b45832-6a7e-1538-8069-ef366b87a8b7@linux.intel.com>
Date: Fri, 27 Dec 2019 17:23:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191227070011.GJ3006@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 03/17] soundwire: rename
 drv_to_sdw_slave_driver macro
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



On 12/27/19 1:00 AM, Vinod Koul wrote:
> On 17-12-19, 15:03, Pierre-Louis Bossart wrote:
>> Align with previous renames and shorten macro
>>
>> No functionality change
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/bus_type.c       | 9 ++++-----
>>   include/linux/soundwire/sdw_type.h | 3 ++-
>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
>> index c0585bcc8a41..2b2830b622fa 100644
>> --- a/drivers/soundwire/bus_type.c
>> +++ b/drivers/soundwire/bus_type.c
>> @@ -34,7 +34,7 @@ sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
>>   static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
>>   {
>>   	struct sdw_slave *slave = to_sdw_slave_device(dev);
>> -	struct sdw_driver *drv = drv_to_sdw_slave_driver(ddrv);
>> +	struct sdw_driver *drv = to_sdw_slave_driver(ddrv);
> 
> so patch 1 does:
> 
> -       struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
> +       struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
> 
> and here we move drv_to_sdw_slave_driver to to_sdw_slave_driver... why
> not do this in first patch and save step1... or did i miss something??

because patch1 introduces replaces 'sdw_' by 'sdw_slave_' in several 
places, not just for drv_to_sdw_driver()

I can squash all these patches if you want to but then you'll tell me 
one step at a time...
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
