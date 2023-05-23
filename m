Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6696B70E4A4
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 20:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C21841E7;
	Tue, 23 May 2023 20:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C21841E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684866453;
	bh=ix13VAl7dfaEjHEjOpNS6mBHoH/Qpd2+FxMGVb01JO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RH8xqOLYPYvj9ML/aJ275TXus+6kUqcafs//vnt4b1f2VP5Qtk85K2bDoPgYUdHLb
	 p5qLa0i10zM9KatMFOZwM6/7JIOt9ug/Eb8nmCaHsA5Hd/GrfBbU/5BzbZY7ubMSdg
	 +hf2w8xxy3h52wnwKbIiMtkgqjjB3xg5uwjMXao0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78B73F8059F; Tue, 23 May 2023 20:25:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C5FEF8059F;
	Tue, 23 May 2023 20:25:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73ECDF80567; Tue, 23 May 2023 20:25:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AB76F8026A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 20:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AB76F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TXAAWCJ/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684866297; x=1716402297;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ix13VAl7dfaEjHEjOpNS6mBHoH/Qpd2+FxMGVb01JO4=;
  b=TXAAWCJ/+3F3KQjxmshNc7vIuIe+OQFV3giSvygWuf6RRMWCy03QHdp5
   +1zACqqdgmuTuVCWDGWckZpen4JfIusiFQI+wK2EubhSFFJC4cKL/LUd4
   p67Uk1e4ppZW5L10sB0qdKK5l7MLdck3fbuhoYqgbiMb/jlayI6pZ12Z8
   1H8qzN7hU10HtQH/cpLLM9X3Rv4IilnRZZlizgg4DiAGz6RTNRmOPfxyU
   QlzEhCRBuhTmwPN0VnFQVLm4iDlZIN387JqXqQ8YyMGA7/HjtepB+1aSG
   YM7hNzG5YmWH/Re7STMCrRsDMEbZz2OhHAvm/dDTtfU9P0F9E49XS+dEH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="342786242"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="342786242"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 11:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="736974294"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="736974294"
Received: from srusakov-mobl.amr.corp.intel.com (HELO [10.209.35.87])
 ([10.209.35.87])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 11:24:36 -0700
Message-ID: <904f47b6-46f4-039c-2019-4ee60ac6d9da@linux.intel.com>
Date: Tue, 23 May 2023 09:48:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V2 3/9] ASoC: amd: ps: add SoundWire dma driver
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
 <20230522133122.166841-4-Vijendar.Mukunda@amd.com>
 <0bf45d6e-72bc-d31a-fec5-b52859b8dcae@linux.intel.com>
 <129df804-a05e-47a6-cfa3-cc36282955d1@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <129df804-a05e-47a6-cfa3-cc36282955d1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NOO4JTGQQPBB43GKK2F7YNC6ARBDFETX
X-Message-ID-Hash: NOO4JTGQQPBB43GKK2F7YNC6ARBDFETX
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NOO4JTGQQPBB43GKK2F7YNC6ARBDFETX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




>>> +struct sdw_dma_dev_data {
>>> +	void __iomem *acp_base;
>>> +	struct mutex *acp_lock; /* used to protect acp common register access */
>>> +};
>>> +
>>>  /**
>>>   * struct acp63_dev_data - acp pci driver context
>>>   * @acp63_base: acp mmio base
>>> diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
>>> new file mode 100644
>>> index 000000000000..f41849fd035c
>>> --- /dev/null
>>> +++ b/sound/soc/amd/ps/ps-sdw-dma.c
>>> @@ -0,0 +1,70 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * AMD ALSA SoC Pink Sardine SoundWire DMA Driver
>>> + *
>>> + * Copyright 2023 Advanced Micro Devices, Inc.
>>> + */
>>> +
>>> +#include <linux/err.h>
>>> +#include <linux/io.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <sound/pcm_params.h>
>>> +#include <sound/soc.h>
>>> +#include <sound/soc-dai.h>
>>> +#include "acp63.h"
>>> +
>>> +#define DRV_NAME "amd_ps_sdw_dma"
>>> +
>>> +static const struct snd_soc_component_driver acp63_sdw_component = {
>>> +	.name		= DRV_NAME,
>>> +};
>>> +
>>> +static int acp63_sdw_platform_probe(struct platform_device *pdev)
>>> +{
>>> +	struct resource *res;
>>> +	struct sdw_dma_dev_data *sdw_data;
>>> +	int status;
>>> +
>>> +	if (!pdev->dev.platform_data) {
>>> +		dev_err(&pdev->dev, "platform_data not retrieved\n");
>>> +		return -ENODEV;
>>> +	}
>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	if (!res) {
>>> +		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	sdw_data = devm_kzalloc(&pdev->dev, sizeof(*sdw_data), GFP_KERNEL);
>>> +	if (!sdw_data)
>>> +		return -ENOMEM;
>>> +
>>> +	sdw_data->acp_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
>>> +	if (!sdw_data->acp_base)
>>> +		return -ENOMEM;
>>> +
>>> +	sdw_data->acp_lock = pdev->dev.platform_data;
>> so you are sharing the same lock between parent and child platform device?
> Initially, we thought of sharing the same lock between parent and child
> platform devices. Later we have observed, mutex hang issues observed.

If the goal is a global lock, then the platform data should contain a
pointer to the lock. We used this for Intel, see .e.g. the shim_mask in
drivers/soundwire/intel_init.c, where the same pointer is used by all
children.

> 
> We have avoided critical section code and removed acp_lock from
> ACP SoundWire DMA driver while accessing ACP common registers.
> We will remove mutex lock from ACP SoundWire DMA driver code.
>> Does this work? IIRC the platform_data is copied, you do not point
>> directly to the initial data provided by the parent. We had issues with
>> SoundWire when we used platform devices, with the 'wrong' pointer used.
> Till now, we haven't observed mutex hang issues due to
> ACP PDM driver mutex lock changes.
> Agreed. We will remove the mutex code from ACP PDM driver as
> well and we will refactor code.
> In SoundWire manager driver, we are sharing the same copy for two
> manager instances. We haven't observed any issue.

What's the benefit of passing this lock as platform_data, if the goal is
to perform mutual exclusion between the two manager instances? Why not
just create the lock as part of the SoundWire probe?

If there was no need for a lock, then please remove it :-)

If it's needed, please describe what it protects, which agents rely on
it and how the lock is shared.

>>
>> The documentation does make mention of a copy....
>>
>> /**
>>  * platform_device_add_data - add platform-specific data to a platform
>> device
>>  * @pdev: platform device allocated by platform_device_alloc to add
>> resources to
>>  * @data: platform specific data for this platform device
>>  * @size: size of platform specific data
>>  *
>>  * Add a copy of platform specific data to the platform device's
>>  * platform_data pointer.  The memory associated with the platform data
>>  * will be freed when the platform device is released.
>>  */
>>> +	dev_set_drvdata(&pdev->dev, sdw_data);
>>> +	status = devm_snd_soc_register_component(&pdev->dev,
>>> +						 &acp63_sdw_component,
>>> +						 NULL, 0);
>>> +	if (status)
>>> +		dev_err(&pdev->dev, "Fail to register sdw dma component\n");
>>> +
>>> +	return status;
>>> +}

