Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 957929B7BE
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 22:38:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29A871667;
	Fri, 23 Aug 2019 22:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29A871667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566592682;
	bh=3rE7CjfyTIm0RwhervcUpw8PCE/6h/T1rBmDqkYh3Xs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GyyujJkvp2YJSCG3IItk3bBKvxOB62CxlPeh+/ozqt37SOAd64D0Aj0lOhYx/JYni
	 /i04cSuA0AZqEke6irZiZWANSAHtytaWa59+LKytOO7W+0dkglGcyfl53bzedgKsr1
	 I9e670BX/XutW/zafz1Lr+p9yuEHZYMt/6rKB16Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5E8BF806ED;
	Fri, 23 Aug 2019 22:29:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2A2BF805F7; Fri, 23 Aug 2019 22:28:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50228F805F5
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 22:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50228F805F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354718224"
Received: from tlchoatx-mobl1.amr.corp.intel.com (HELO [10.254.187.90])
 ([10.254.187.90])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 13:28:13 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-23-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <95210ce9-3834-9c83-a2dc-26df5acb02a7@linux.intel.com>
Date: Fri, 23 Aug 2019 14:35:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822190425.23001-23-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 22/35] ASoC: Intel: Haswell: Define
 separate ACPI loader
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



On 8/22/19 2:04 PM, Cezary Rojewski wrote:
> With common acpi code exposed, separate Haswell specific code from other
> legacy platforms. To reduce diff delta, it's still loaded with separate
> module called: hsw-acpi. This may be address later, once heavy hitters
> are gone.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/Kconfig           |  6 ++-
>   sound/soc/intel/common/sst-acpi.c | 32 ----------------
>   sound/soc/intel/haswell/Makefile  |  2 +
>   sound/soc/intel/haswell/acpi.c    | 63 +++++++++++++++++++++++++++++++
>   4 files changed, 70 insertions(+), 33 deletions(-)
>   create mode 100644 sound/soc/intel/haswell/acpi.c
> 
> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index a3ec17fd63cd..9191773d203c 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -31,6 +31,10 @@ config SND_SST_IPC_ACPI
>   	# This option controls the ACPI-based IPC for HiFi2 platforms
>   	# (Baytrail, Cherrytrail)
>   
> +config SND_SOC_INTEL_HASWELL_ACPI
> +	tristate
> +	# This option controls the ACPI-based on HSW/BDW platforms

missing noun.
ACPI-based probe?

> +
>   config SND_SOC_INTEL_SST_ACPI
>   	tristate
>   	# This option controls ACPI-based probing on
> @@ -52,7 +56,7 @@ config SND_SOC_INTEL_HASWELL
>   	depends on SND_DMA_SGBUF
>   	depends on DMADEVICES && ACPI
>   	select SND_SOC_INTEL_SST
> -	select SND_SOC_INTEL_SST_ACPI
> +	select SND_SOC_INTEL_HASWELL_ACPI
>   	select SND_SOC_INTEL_SST_FIRMWARE
>   	select SND_SOC_ACPI_INTEL_MATCH
>   	help
> diff --git a/sound/soc/intel/common/sst-acpi.c b/sound/soc/intel/common/sst-acpi.c
> index 42f9b02f2ea3..7d2f04ff0479 100644
> --- a/sound/soc/intel/common/sst-acpi.c
> +++ b/sound/soc/intel/common/sst-acpi.c
> @@ -15,10 +15,6 @@
>   #include <sound/soc-acpi.h>
>   #include <sound/soc-acpi-intel-match.h>
>   
> -#define SST_LPT_DSP_DMA_ADDR_OFFSET	0x0F0000
> -#define SST_WPT_DSP_DMA_ADDR_OFFSET	0x0FE000
> -#define SST_LPT_DSP_DMA_SIZE		(1024 - 1)
> -
>   struct sst_acpi_priv {
>   	struct platform_device *pdev_mach;
>   	struct platform_device *pdev_pcm;
> @@ -156,32 +152,6 @@ int sst_acpi_remove(struct platform_device *pdev)
>   }
>   EXPORT_SYMBOL_GPL(sst_acpi_remove);
>   
> -static struct sst_acpi_desc sst_acpi_haswell_desc = {
> -	.drv_name = "haswell-pcm-audio",
> -	.machines = snd_soc_acpi_intel_haswell_machines,
> -	.resindex_lpe_base = 0,
> -	.resindex_pcicfg_base = 1,
> -	.resindex_fw_base = -1,
> -	.irqindex_host_ipc = 0,
> -	.sst_id = SST_DEV_ID_LYNX_POINT,
> -	.dma_engine = SST_DMA_TYPE_DW,
> -	.resindex_dma_base = SST_LPT_DSP_DMA_ADDR_OFFSET,
> -	.dma_size = SST_LPT_DSP_DMA_SIZE,
> -};
> -
> -static struct sst_acpi_desc sst_acpi_broadwell_desc = {
> -	.drv_name = "haswell-pcm-audio",
> -	.machines = snd_soc_acpi_intel_broadwell_machines,
> -	.resindex_lpe_base = 0,
> -	.resindex_pcicfg_base = 1,
> -	.resindex_fw_base = -1,
> -	.irqindex_host_ipc = 0,
> -	.sst_id = SST_DEV_ID_WILDCAT_POINT,
> -	.dma_engine = SST_DMA_TYPE_DW,
> -	.resindex_dma_base = SST_WPT_DSP_DMA_ADDR_OFFSET,
> -	.dma_size = SST_LPT_DSP_DMA_SIZE,
> -};
> -
>   #if !IS_ENABLED(CONFIG_SND_SST_IPC_ACPI)
>   static struct sst_acpi_desc sst_acpi_baytrail_desc = {
>   	.drv_name = "baytrail-pcm-audio",
> @@ -196,8 +166,6 @@ static struct sst_acpi_desc sst_acpi_baytrail_desc = {
>   #endif
>   
>   static const struct acpi_device_id sst_acpi_match[] = {
> -	{ "INT33C8", (unsigned long)&sst_acpi_haswell_desc },
> -	{ "INT3438", (unsigned long)&sst_acpi_broadwell_desc },
>   #if !IS_ENABLED(CONFIG_SND_SST_IPC_ACPI)
>   	{ "80860F28", (unsigned long)&sst_acpi_baytrail_desc },
>   #endif
> diff --git a/sound/soc/intel/haswell/Makefile b/sound/soc/intel/haswell/Makefile
> index ad2341aea8ae..0af852d0577b 100644
> --- a/sound/soc/intel/haswell/Makefile
> +++ b/sound/soc/intel/haswell/Makefile
> @@ -1,5 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   snd-soc-sst-haswell-pcm-objs := \
>   	        sst-haswell-ipc.o sst-haswell-pcm.o sst-haswell-dsp.o
> +snd-soc-hsw-acpi-objs := acpi.o
>   
>   obj-$(CONFIG_SND_SOC_INTEL_HASWELL) += snd-soc-sst-haswell-pcm.o
> +obj-$(CONFIG_SND_SOC_INTEL_HASWELL_ACPI) += snd-soc-hsw-acpi.o
> diff --git a/sound/soc/intel/haswell/acpi.c b/sound/soc/intel/haswell/acpi.c
> new file mode 100644
> index 000000000000..7bd8b03851c4
> --- /dev/null
> +++ b/sound/soc/intel/haswell/acpi.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Intel HSW loader on ACPI systems
> + *
> + * Copyright (C) 2019, Intel Corporation. All rights reserved.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/platform_device.h>
> +#include <sound/soc-acpi.h>
> +#include <sound/soc-acpi-intel-match.h>
> +#include "../common/sst-dsp.h"
> +
> +#define SST_LPT_DSP_DMA_ADDR_OFFSET	0x0F0000
> +#define SST_WPT_DSP_DMA_ADDR_OFFSET	0x0FE000
> +#define SST_LPT_DSP_DMA_SIZE		(1024 - 1)
> +
> +static struct sst_acpi_desc hsw_acpi_desc = {
> +	.drv_name = "haswell-pcm-audio",
> +	.machines = snd_soc_acpi_intel_haswell_machines,
> +	.resindex_lpe_base = 0,
> +	.resindex_pcicfg_base = 1,
> +	.resindex_fw_base = -1,
> +	.irqindex_host_ipc = 0,
> +	.sst_id = SST_DEV_ID_LYNX_POINT,
> +	.dma_engine = SST_DMA_TYPE_DW,
> +	.resindex_dma_base = SST_LPT_DSP_DMA_ADDR_OFFSET,
> +	.dma_size = SST_LPT_DSP_DMA_SIZE,
> +};
> +
> +static struct sst_acpi_desc bdw_acpi_desc = {
> +	.drv_name = "haswell-pcm-audio",
> +	.machines = snd_soc_acpi_intel_broadwell_machines,
> +	.resindex_lpe_base = 0,
> +	.resindex_pcicfg_base = 1,
> +	.resindex_fw_base = -1,
> +	.irqindex_host_ipc = 0,
> +	.sst_id = SST_DEV_ID_WILDCAT_POINT,
> +	.dma_engine = SST_DMA_TYPE_DW,
> +	.resindex_dma_base = SST_WPT_DSP_DMA_ADDR_OFFSET,
> +	.dma_size = SST_LPT_DSP_DMA_SIZE,
> +};
> +
> +static const struct acpi_device_id hsw_acpi_ids[] = {
> +	{ "INT33C8", (unsigned long)&hsw_acpi_desc },
> +	{ "INT3438", (unsigned long)&bdw_acpi_desc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, hsw_acpi_ids);
> +
> +static struct platform_driver hsw_acpi_driver = {
> +	.probe = sst_acpi_probe,
> +	.remove = sst_acpi_remove,
> +	.driver = {
> +		.name = "hsw-acpi",
> +		.acpi_match_table = ACPI_PTR(hsw_acpi_ids),
> +	},
> +};
> +module_platform_driver(hsw_acpi_driver);
> +
> +MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
> +MODULE_DESCRIPTION("Intel HSW loader on ACPI systems");
> +MODULE_LICENSE("GPL v2");
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
