Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC936660BB
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 17:39:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 046BE7663;
	Wed, 11 Jan 2023 17:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 046BE7663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673455151;
	bh=XHUr/CORx1SuyvuYcSDmm9Qfy38H53He+lyFrfgcJxM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mYG4YCY710ADy+AcZUQVI5d6tRCceN2u4uVILHuItEQIynHoZZVkQ6etNrfYG4iug
	 xFdE2XWZBJvmFXD34lyHgvCbBIxQIYJmQ1HZ1eO/zbeS0Jt72Jgx1plhfVF9J3axrg
	 aeTzQhn/dsELpst0G2HaYurC/cr2zjxcJ5DNnAYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2162BF80588;
	Wed, 11 Jan 2023 17:36:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2439EF80579; Wed, 11 Jan 2023 17:36:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CD8DF803DC
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 17:36:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CD8DF803DC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=de/lmgoN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673454963; x=1704990963;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XHUr/CORx1SuyvuYcSDmm9Qfy38H53He+lyFrfgcJxM=;
 b=de/lmgoN8UIVEyRdPTUdEieLy7+C86m6aXVECq5n7fG1kkzWB9aYMuip
 Ru95Ri0XOx5me8XYWQyPoupM+hdSZmd8GD4BBe5QcN+DzGeNVQ7S2wzeg
 vr2p+vT+6vzxgYNnVotBd9YbopAVbdDcxSTRuVf0We761//njwL+xpYD4
 wNLHGgBdp9Q3lS4eVSiB0L+kV6dVxkaWMt+TWPBl6Db51ER6IGgtUoTL1
 0e2EUOB7zKELRc+8/Buw1AcYsyLBxZxlHgym/A/ioYiSzInUod0nga4e9
 Kd4MSW/3aXSDXtpLOlEdn6teNGLtijl38iNObVqBl4/e9Em6psunI1RhV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="324704077"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="324704077"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607408443"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="607408443"
Received: from flobatol-mobl1.amr.corp.intel.com (HELO [10.212.110.208])
 ([10.212.110.208])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:20 -0800
Message-ID: <6a0fa6bd-efb0-9363-4c8d-0e919992557f@linux.intel.com>
Date: Wed, 11 Jan 2023 09:22:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 07/19] ASoC: amd: ps: add soundwire dma driver for pink
 sardine platform
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-8-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230111090222.2016499-8-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/11/23 03:02, Vijendar Mukunda wrote:
> Soundwire DMA platform driver binds to the platform device created by
> ACP PCI device. Soundwire DMA driver registers ALSA DMA component
> with ASoC framework.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/ps/acp63.h      |  5 +++
>  sound/soc/amd/ps/ps-sdw-dma.c | 72 +++++++++++++++++++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c
> 
> diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
> index 0bd9dc363461..b462320fdf2a 100644
> --- a/sound/soc/amd/ps/acp63.h
> +++ b/sound/soc/amd/ps/acp63.h
> @@ -135,3 +135,8 @@ struct acp63_dev_data {
>  	bool is_sdw_dev;
>  	bool acp_sdw_power_off;
>  };
> +
> +struct sdw_dma_dev_data {
> +	void __iomem *acp_base;
> +	struct mutex *acp_lock;
> +};
> diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
> new file mode 100644
> index 000000000000..388a4b7df715
> --- /dev/null
> +++ b/sound/soc/amd/ps/ps-sdw-dma.c
> @@ -0,0 +1,72 @@
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
> +		dev_err(&pdev->dev, "Fail to register acp pdm dai\n");

not sure what this means? Are you registering a PDM component or a DMA one?

> +
> +		return -ENODEV;
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
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" DRV_NAME);
