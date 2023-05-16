Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1373705290
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 17:45:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BBAB1E3;
	Tue, 16 May 2023 17:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BBAB1E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684251956;
	bh=FTnmhbzvHNs6LvKEIpBUOQXPObXKmLKsrl6rnqnEWkY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=khE423KkxvuZz5q9x4WPWVSVDwuavsg7/FqgpLckjDE09s5QEiRzJ3KzFPVF8ItCX
	 jQSNKPXNX/n3vlxCAUyPwrEhtqe7tswaHRYfCYRwPKDgRHkt+T2A1wFZXxTA190xZQ
	 k0ervgFOOaxCX4YzE84ipoYktii8oQyrXkqkEp3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20E15F80579; Tue, 16 May 2023 17:44:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7412DF80563;
	Tue, 16 May 2023 17:44:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 337A2F802E8; Tue, 16 May 2023 17:44:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE5D6F80272
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 17:43:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE5D6F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VGREghk1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684251838; x=1715787838;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FTnmhbzvHNs6LvKEIpBUOQXPObXKmLKsrl6rnqnEWkY=;
  b=VGREghk1LK1w1WqztrdZ5L3m/envvf/rA2LanrKGqHG1oT6+BBHmNJJF
   xS0bU5JCIUhHjgiFRiTlBSw45HwHCa57BZKIfdQszTLJwr/K99MGH6Z+t
   DRTWy+yVBTwPhHKH8YhQGzNOYUK9xRyXCeGlbs5j2wiPdnSmXJbWHywlE
   JdIyau7aZlAW9WY8z0flN4anSHMu3GU4+WJEySWn8pNu+7nC128TjtKCR
   p48IAZ42WUEe3imx9E9bklyOoVsPbDbZSVnUjsS8ppEv1IB3odWv4fCIL
   0TGWPFyhQHR6xI2rnZw/10ZmWxRCl/q1WNK/dLBsWMi1YEAhWP/kRhnSV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="379694342"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200";
   d="scan'208";a="379694342"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 08:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="701391902"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200";
   d="scan'208";a="701391902"
Received: from aboonloe-mobl.amr.corp.intel.com (HELO [10.212.186.99])
 ([10.212.186.99])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 08:43:42 -0700
Message-ID: <b8ad1f03-686a-7f2f-baea-b63b12c19df9@linux.intel.com>
Date: Tue, 16 May 2023 09:40:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 3/9] ASoC: amd: ps: add soundwire dma driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, --to=broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230516103543.2515097-1-Vijendar.Mukunda@amd.com>
 <20230516103543.2515097-4-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230516103543.2515097-4-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GP6OZ37IULUZEQOLWNCDF7FQ3QLXSIDB
X-Message-ID-Hash: GP6OZ37IULUZEQOLWNCDF7FQ3QLXSIDB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GP6OZ37IULUZEQOLWNCDF7FQ3QLXSIDB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/16/23 05:35, Vijendar Mukunda wrote:
> Soundwire DMA platform driver binds to the platform device created by
> ACP PCI device. Soundwire DMA driver registers ALSA DMA component
> with ASoC framework.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/ps/acp63.h      |  5 +++
>  sound/soc/amd/ps/ps-sdw-dma.c | 71 +++++++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c
> 
> diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
> index faf7be4d77c2..f86c60cd1565 100644
> --- a/sound/soc/amd/ps/acp63.h
> +++ b/sound/soc/amd/ps/acp63.h
> @@ -111,6 +111,11 @@ struct pdm_dev_data {
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
> index 000000000000..0d0889842413
> --- /dev/null
> +++ b/sound/soc/amd/ps/ps-sdw-dma.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * AMD ALSA SoC Pink Sardine Soundwire DMA Driver
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
> +	dev_set_drvdata(&pdev->dev, sdw_data);
> +	status = devm_snd_soc_register_component(&pdev->dev,
> +						 &acp63_sdw_component,
> +						 NULL, 0);
> +	if (status) {
> +		dev_err(&pdev->dev, "Fail to register sdw dma component\n");
> +		return -ENODEV;

return status;

> +	}
> +	return 0;
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
