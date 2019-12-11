Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EC911AD55
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 15:24:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B3331657;
	Wed, 11 Dec 2019 15:23:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B3331657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576074261;
	bh=D9KmE1ChN5jUj4FnWROAIpXb7sK/IqICjsUpKMhncaU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=loywwL6RkcmwlTitKWEJ2yIHge+2vOb+lGT1l/Zi7Az3y8aFh+b830zIPW12cOCI8
	 pBtHdFdey53+RfdEgekH0aBT09Xrg2cukbfQm0azH7l1+uT/k3ESd0CIdgpZGNkSMw
	 jrO/eNY0pGQdZgjE1fDkCrUiwuc4pw+DQETL3oqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 405BDF80234;
	Wed, 11 Dec 2019 15:22:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16FAFF801F4; Wed, 11 Dec 2019 15:22:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3D14F800F3
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 15:22:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3D14F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 06:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="215796782"
Received: from unknown (HELO pbossart-mac02.local) ([10.254.97.107])
 by orsmga006.jf.intel.com with ESMTP; 11 Dec 2019 06:22:27 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191209235520.18727-1-pierre-louis.bossart@linux.intel.com>
 <20191209235520.18727-6-pierre-louis.bossart@linux.intel.com>
 <20191211114247.GI2536@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <13e24f85-bf48-cf63-d738-dfb62b28a814@linux.intel.com>
Date: Wed, 11 Dec 2019 08:22:26 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191211114247.GI2536@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 05/11] soundwire: intel: update
 interfaces between ASoC and SoundWire
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

On 12/11/19 5:42 AM, Vinod Koul wrote:
> On 09-12-19, 17:55, Pierre-Louis Bossart wrote:
> 
>> @@ -138,8 +126,6 @@ static struct sdw_intel_ctx
>>   		pdevinfo.name = "int-sdw";
>>   		pdevinfo.id = i;
>>   		pdevinfo.fwnode = acpi_fwnode_handle(adev);
>> -		pdevinfo.data = &link->res;
>> -		pdevinfo.size_data = sizeof(link->res);
>>   
>>   		pdev = platform_device_register_full(&pdevinfo);
>>   		if (IS_ERR(pdev)) {
>> @@ -224,10 +210,8 @@ EXPORT_SYMBOL(sdw_intel_init);
> 
> This is still exported
> 
>>   struct sdw_intel_res {
>> +	int count;
>>   	void __iomem *mmio_base;
>>   	int irq;
>>   	acpi_handle handle;
>>   	struct device *parent;
>>   	const struct sdw_intel_ops *ops;
>> -	void *arg;
>> +	struct device *dev;
>> +	u32 link_mask;
>>   };
>>   
>> -void *sdw_intel_init(acpi_handle *parent_handle, struct sdw_intel_res *res);
> 
> But prototype removed, so i think this is a miss in the series, can you
> fix that up

This is updated in a later patch that implements the new interfaces

-EXPORT_SYMBOL(sdw_intel_init);
+EXPORT_SYMBOL(sdw_intel_acpi_scan);

I will fix this but since there is no user for that function there will 
be no impact.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
