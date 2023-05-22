Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A4C70C53E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 20:34:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E16082B;
	Mon, 22 May 2023 20:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E16082B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684780444;
	bh=jzpM+84lYGuOxGL+MOpq8OzByxwYQNI9oyqWXqcupKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i/yzq7aYAzsT29knkOY0cgyZ5x8bfjGkAl9Ua5J2UNiqX3JV3QSfh3cb1bDYf5b7H
	 cSm5i4bfwLs33HSIEEKaLWnjKoUN1a1SOsS6OJrcQJgyNkFcJeob0l8SD18ccBZbeD
	 lHtnEbvugemVUYdlkJHEeXOFUYbT8Wrll4PbJS8Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40045F80567; Mon, 22 May 2023 20:32:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9F67F80557;
	Mon, 22 May 2023 20:32:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5AEBF80542; Mon, 22 May 2023 20:32:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E924F80086
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 20:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E924F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QuKTm3Zh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684780332; x=1716316332;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jzpM+84lYGuOxGL+MOpq8OzByxwYQNI9oyqWXqcupKU=;
  b=QuKTm3Zht8B42ekVFiYFUZueXuuvlqG7fh3kFhscExW/ih9qoCm809dD
   0VGQSPRvYFPt2HyS2wC0H2Q7G4Hw+tXgX2NlVNoSZSs68HiuJ7/TzcBwF
   BhSVSGIB5tJcqmMwRXYqoaKpadrhEh6BllEmD228AAZTveTSK1q+KDwfO
   BBYRwRkjSyBY4Gz7UStEIpob1rKQTtDdxsBBDfIxxZ4IaUTzzht958Vmq
   cU68YoTPpEZeJh3e7sKgSGkZ98XCw9l+Qb9GYWv4qQ3S1FgbOhfbTbTOz
   SDhMLhx8U5sCjyAWN4Ov+XNVGeO/oUNGktOna4EwOSyKBzJIkyvwrOhGk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="356235140"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="356235140"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 11:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="697740836"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="697740836"
Received: from ljgreene-mobl.amr.corp.intel.com (HELO [10.209.124.121])
 ([10.209.124.121])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 11:31:46 -0700
Message-ID: <0bf45d6e-72bc-d31a-fec5-b52859b8dcae@linux.intel.com>
Date: Mon, 22 May 2023 11:34:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V2 3/9] ASoC: amd: ps: add SoundWire dma driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
 <20230522133122.166841-4-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230522133122.166841-4-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MVV6MAHA7UOXAY73IP4CHD4HJ56GBCWZ
X-Message-ID-Hash: MVV6MAHA7UOXAY73IP4CHD4HJ56GBCWZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MVV6MAHA7UOXAY73IP4CHD4HJ56GBCWZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/22/23 08:31, Vijendar Mukunda wrote:
> SoundWire DMA platform driver binds to the platform device created by
> ACP PCI device. SoundWire DMA driver registers ALSA DMA component
> with ASoC framework.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/ps/acp63.h      |  5 +++
>  sound/soc/amd/ps/ps-sdw-dma.c | 70 +++++++++++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c
> 
> diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
> index d296059be4f0..eec58da7ec8b 100644
> --- a/sound/soc/amd/ps/acp63.h
> +++ b/sound/soc/amd/ps/acp63.h
> @@ -148,6 +148,11 @@ struct pdm_dev_data {
>  	struct snd_pcm_substream *capture_stream;
>  };
>  
> +struct sdw_dma_dev_data {
> +	void __iomem *acp_base;
> +	struct mutex *acp_lock; /* used to protect acp common register access */
> +};
> +
>  /**
>   * struct acp63_dev_data - acp pci driver context
>   * @acp63_base: acp mmio base
> diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
> new file mode 100644
> index 000000000000..f41849fd035c
> --- /dev/null
> +++ b/sound/soc/amd/ps/ps-sdw-dma.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * AMD ALSA SoC Pink Sardine SoundWire DMA Driver
> + *
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include "acp63.h"
> +
> +#define DRV_NAME "amd_ps_sdw_dma"
> +
> +static const struct snd_soc_component_driver acp63_sdw_component = {
> +	.name		= DRV_NAME,
> +};
> +
> +static int acp63_sdw_platform_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct sdw_dma_dev_data *sdw_data;
> +	int status;
> +
> +	if (!pdev->dev.platform_data) {
> +		dev_err(&pdev->dev, "platform_data not retrieved\n");
> +		return -ENODEV;
> +	}
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
> +		return -ENODEV;
> +	}
> +
> +	sdw_data = devm_kzalloc(&pdev->dev, sizeof(*sdw_data), GFP_KERNEL);
> +	if (!sdw_data)
> +		return -ENOMEM;
> +
> +	sdw_data->acp_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	if (!sdw_data->acp_base)
> +		return -ENOMEM;
> +
> +	sdw_data->acp_lock = pdev->dev.platform_data;

so you are sharing the same lock between parent and child platform device?

Does this work? IIRC the platform_data is copied, you do not point
directly to the initial data provided by the parent. We had issues with
SoundWire when we used platform devices, with the 'wrong' pointer used.

The documentation does make mention of a copy....

/**
 * platform_device_add_data - add platform-specific data to a platform
device
 * @pdev: platform device allocated by platform_device_alloc to add
resources to
 * @data: platform specific data for this platform device
 * @size: size of platform specific data
 *
 * Add a copy of platform specific data to the platform device's
 * platform_data pointer.  The memory associated with the platform data
 * will be freed when the platform device is released.
 */
> +	dev_set_drvdata(&pdev->dev, sdw_data);
> +	status = devm_snd_soc_register_component(&pdev->dev,
> +						 &acp63_sdw_component,
> +						 NULL, 0);
> +	if (status)
> +		dev_err(&pdev->dev, "Fail to register sdw dma component\n");
> +
> +	return status;
> +}
> +
> +static struct platform_driver acp63_sdw_dma_driver = {
> +	.probe = acp63_sdw_platform_probe,
> +	.driver = {
> +		.name = "amd_ps_sdw_dma",
> +	},
> +};
> +
> +module_platform_driver(acp63_sdw_dma_driver);
> +
> +MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
> +MODULE_DESCRIPTION("AMD ACP6.3 PS SDW DMA Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRV_NAME);
