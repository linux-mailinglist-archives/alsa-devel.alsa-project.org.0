Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 107299B7BD
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 22:37:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A07981671;
	Fri, 23 Aug 2019 22:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A07981671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566592649;
	bh=95EgeoyMUTM00DkaCFcHZY6obWFrqNWqZ10VuMo2P4s=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JhgOKQXE4X/PQSaL2wyM/awhsVjR5P24cxkpWDtnI046kLCM2YyZOFyOE8AylCvRb
	 /lW4don31uK6L1R5T9E2qo77UuvgPzPI6MklXYj15IRh45YzSv9DgKiHbeQ44ffOuO
	 9ZQ3cmeZmMTFIk+kY6xkqx88rxWCQGTByG5SedAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14107F8067A;
	Fri, 23 Aug 2019 22:29:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BF43F80649; Fri, 23 Aug 2019 22:28:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AC63F805F7
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 22:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AC63F805F7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354718228"
Received: from tlchoatx-mobl1.amr.corp.intel.com (HELO [10.254.187.90])
 ([10.254.187.90])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 13:28:15 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-24-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dfae2f58-b955-ae2f-ff66-fd83c9121855@linux.intel.com>
Date: Fri, 23 Aug 2019 14:36:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822190425.23001-24-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 23/35] ASoC: Intel: Baytrail: Define
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
> With common acpi code exposed, separate Baytrail specific code from
> other legacy platforms. To reduce diff delta, it's still loaded with
> separate module called: byt-acpi. This may be address later, once
> heavy hitters are gone. Since this is the second of two, separation
> carries removal of common sst-acpi module with it.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/Kconfig                     |  8 ++--
>   sound/soc/intel/baytrail/Makefile           |  2 +
>   sound/soc/intel/baytrail/acpi.c             | 43 +++++++++++++++++++++
>   sound/soc/intel/baytrail/sst-baytrail-dsp.c |  1 -
>   sound/soc/intel/common/Makefile             |  4 +-
>   sound/soc/intel/common/sst-acpi.c           | 36 -----------------
>   6 files changed, 49 insertions(+), 45 deletions(-)
>   create mode 100644 sound/soc/intel/baytrail/acpi.c
> 
> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index 9191773d203c..baab845ea0ef 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -35,11 +35,9 @@ config SND_SOC_INTEL_HASWELL_ACPI
>   	tristate
>   	# This option controls the ACPI-based on HSW/BDW platforms
>   
> -config SND_SOC_INTEL_SST_ACPI
> +config SND_SOC_INTEL_BAYTRAIL_ACPI
>   	tristate
> -	# This option controls ACPI-based probing on
> -	# Haswell/Broadwell/Baytrail legacy and will be set
> -	# when these platforms are enabled
> +	# This option controls the ACPI-based on BYT platforms

ACPI-based probe?

>   
>   config SND_SOC_INTEL_SST
>   	tristate
> @@ -68,7 +66,7 @@ config SND_SOC_INTEL_BAYTRAIL
>   	tristate "Baytrail (legacy) Platforms"
>   	depends on DMADEVICES && ACPI && SND_SST_ATOM_HIFI2_PLATFORM=n
>   	select SND_SOC_INTEL_SST
> -	select SND_SOC_INTEL_SST_ACPI
> +	select SND_SOC_INTEL_BAYTRAIL_ACPI
>   	select SND_SOC_INTEL_SST_FIRMWARE
>   	select SND_SOC_ACPI_INTEL_MATCH
>   	help
> diff --git a/sound/soc/intel/baytrail/Makefile b/sound/soc/intel/baytrail/Makefile
> index 4d0806aac6bd..b59d4893b46b 100644
> --- a/sound/soc/intel/baytrail/Makefile
> +++ b/sound/soc/intel/baytrail/Makefile
> @@ -1,5 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   snd-soc-sst-baytrail-pcm-objs := \
>   	        sst-baytrail-ipc.o sst-baytrail-pcm.o sst-baytrail-dsp.o
> +snd-soc-byt-acpi-objs := acpi.o
>   
>   obj-$(CONFIG_SND_SOC_INTEL_BAYTRAIL) += snd-soc-sst-baytrail-pcm.o
> +obj-$(CONFIG_SND_SOC_INTEL_BAYTRAIL_ACPI) += snd-soc-byt-acpi.o
> diff --git a/sound/soc/intel/baytrail/acpi.c b/sound/soc/intel/baytrail/acpi.c
> new file mode 100644
> index 000000000000..57d10a6e3be2
> --- /dev/null
> +++ b/sound/soc/intel/baytrail/acpi.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Intel BYT loader on ACPI systems
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
> +static struct sst_acpi_desc byt_acpi_desc = {
> +	.drv_name = "baytrail-pcm-audio",
> +	.machines = snd_soc_acpi_intel_baytrail_legacy_machines,
> +	.resindex_lpe_base = 0,
> +	.resindex_pcicfg_base = 1,
> +	.resindex_fw_base = 2,
> +	.irqindex_host_ipc = 5,
> +	.sst_id = SST_DEV_ID_BYT,
> +	.resindex_dma_base = -1,
> +};
> +
> +static const struct acpi_device_id byt_acpi_ids[] = {
> +	{ "80860F28", (unsigned long)&byt_acpi_desc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, byt_acpi_ids);
> +
> +static struct platform_driver byt_acpi_driver = {
> +	.probe = sst_acpi_probe,
> +	.remove = sst_acpi_remove,
> +	.driver = {
> +		.name = "byt-acpi",
> +		.acpi_match_table = ACPI_PTR(byt_acpi_ids),
> +	},
> +};
> +module_platform_driver(byt_acpi_driver);
> +
> +MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
> +MODULE_DESCRIPTION("Intel BYT loader on ACPI systems");
> +MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/intel/baytrail/sst-baytrail-dsp.c b/sound/soc/intel/baytrail/sst-baytrail-dsp.c
> index 4869e18116eb..81bc05d62d5d 100644
> --- a/sound/soc/intel/baytrail/sst-baytrail-dsp.c
> +++ b/sound/soc/intel/baytrail/sst-baytrail-dsp.c
> @@ -13,7 +13,6 @@
>   #include <linux/dma-mapping.h>
>   #include <linux/platform_device.h>
>   #include <linux/firmware.h>
> -
>   #include "../common/sst-dsp.h"
>   #include "../common/sst-dsp-priv.h"
>   #include "sst-baytrail-ipc.h"
> diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
> index 56c81e20b5bf..65e0e66ab64f 100644
> --- a/sound/soc/intel/common/Makefile
> +++ b/sound/soc/intel/common/Makefile
> @@ -1,6 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> -snd-soc-sst-dsp-objs := sst-dsp.o
> -snd-soc-sst-acpi-objs := sst-acpi.o
> +snd-soc-sst-dsp-objs := sst-dsp.o sst-acpi.o
>   snd-soc-sst-ipc-objs := sst-ipc.o
>   snd-soc-sst-firmware-objs := sst-firmware.o
>   snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-match.o \
> @@ -11,6 +10,5 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
>   	soc-acpi-intel-hda-match.o
>   
>   obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
> -obj-$(CONFIG_SND_SOC_INTEL_SST_ACPI) += snd-soc-sst-acpi.o
>   obj-$(CONFIG_SND_SOC_INTEL_SST_FIRMWARE) += snd-soc-sst-firmware.o
>   obj-$(CONFIG_SND_SOC_ACPI_INTEL_MATCH) += snd-soc-acpi-intel-match.o
> diff --git a/sound/soc/intel/common/sst-acpi.c b/sound/soc/intel/common/sst-acpi.c
> index 7d2f04ff0479..8e75126106ea 100644
> --- a/sound/soc/intel/common/sst-acpi.c
> +++ b/sound/soc/intel/common/sst-acpi.c
> @@ -13,7 +13,6 @@
>   
>   #include "sst-dsp.h"
>   #include <sound/soc-acpi.h>
> -#include <sound/soc-acpi-intel-match.h>
>   
>   struct sst_acpi_priv {
>   	struct platform_device *pdev_mach;
> @@ -151,38 +150,3 @@ int sst_acpi_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(sst_acpi_remove);
> -
> -#if !IS_ENABLED(CONFIG_SND_SST_IPC_ACPI)
> -static struct sst_acpi_desc sst_acpi_baytrail_desc = {
> -	.drv_name = "baytrail-pcm-audio",
> -	.machines = snd_soc_acpi_intel_baytrail_legacy_machines,
> -	.resindex_lpe_base = 0,
> -	.resindex_pcicfg_base = 1,
> -	.resindex_fw_base = 2,
> -	.irqindex_host_ipc = 5,
> -	.sst_id = SST_DEV_ID_BYT,
> -	.resindex_dma_base = -1,
> -};
> -#endif
> -
> -static const struct acpi_device_id sst_acpi_match[] = {
> -#if !IS_ENABLED(CONFIG_SND_SST_IPC_ACPI)
> -	{ "80860F28", (unsigned long)&sst_acpi_baytrail_desc },
> -#endif
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(acpi, sst_acpi_match);
> -
> -static struct platform_driver sst_acpi_driver = {
> -	.probe = sst_acpi_probe,
> -	.remove = sst_acpi_remove,
> -	.driver = {
> -		.name = "sst-acpi",
> -		.acpi_match_table = ACPI_PTR(sst_acpi_match),
> -	},
> -};
> -module_platform_driver(sst_acpi_driver);
> -
> -MODULE_AUTHOR("Jarkko Nikula <jarkko.nikula@linux.intel.com>");
> -MODULE_DESCRIPTION("Intel SST loader on ACPI systems");
> -MODULE_LICENSE("GPL v2");
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
