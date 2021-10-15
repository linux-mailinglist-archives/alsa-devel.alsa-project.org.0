Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D6F42F8A0
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 18:47:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B17BE184E;
	Fri, 15 Oct 2021 18:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B17BE184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634316454;
	bh=ng+b/NplERCdGhBf3wiauHYjyh/0guAL1+rOrT8yv14=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GEevzoDZaTyKRxSFhnE81DIXlM9BiLCJy1XvLAZA2tMAQG493D3tRHqsqUPVDKEsn
	 7Lc2K+WnPUlRCnoX/Kp/j4rqoYIwoke37bjB3JLWgyZ7yJpBtI4sT2QNzF2WQ1UUfk
	 Mm3EeRLD2VYnJskhgU+nbrxbNQp5wWSWzVXEZoD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53163F8016C;
	Fri, 15 Oct 2021 18:46:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E7E7F80269; Fri, 15 Oct 2021 18:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39EBAF80167
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 18:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39EBAF80167
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="214883531"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="214883531"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 09:46:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="492631281"
Received: from liminghu-mobl.ccr.corp.intel.com (HELO [10.212.23.213])
 ([10.212.23.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 09:46:05 -0700
Subject: Re: [PATCH 1/5] ALSA: hda: Drop device-argument in NHLT functions
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20211015164047.44492-1-cezary.rojewski@intel.com>
 <20211015164047.44492-2-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bb2b223e-6318-ed3c-bbe8-31ba4b8d02fe@linux.intel.com>
Date: Fri, 15 Oct 2021 11:42:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015164047.44492-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, broonie@kernel.org, tiwai@suse.com,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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



On 10/15/21 11:40 AM, Cezary Rojewski wrote:
> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> 
> ACPI is device independent, so printing warnings using device functions
> is misleading. Replace dev_xxx() with pr_xxx() and remove now
> unnecessary argument.

the routines in sound/hda/intel-nhtl.c are called from a specific PCI
device, why would you remove that information?

This makes no sense to me.

> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  include/sound/intel-nhlt.h    |  9 ++++-----
>  sound/hda/intel-dsp-config.c  |  4 ++--
>  sound/hda/intel-nhlt.c        | 24 +++++++++++++-----------
>  sound/soc/intel/skylake/skl.c |  5 ++---
>  sound/soc/sof/intel/hda.c     |  4 ++--
>  5 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
> index d0574805865f..4debab7c1996 100644
> --- a/include/sound/intel-nhlt.h
> +++ b/include/sound/intel-nhlt.h
> @@ -126,17 +126,17 @@ enum {
>  	NHLT_MIC_ARRAY_VENDOR_DEFINED = 0xf,
>  };
>  
> -struct nhlt_acpi_table *intel_nhlt_init(struct device *dev);
> +struct nhlt_acpi_table *intel_nhlt_init(void);
>  
>  void intel_nhlt_free(struct nhlt_acpi_table *addr);
>  
> -int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt);
> +int intel_nhlt_get_dmic_geo(struct nhlt_acpi_table *nhlt);
>  
>  #else
>  
>  struct nhlt_acpi_table;
>  
> -static inline struct nhlt_acpi_table *intel_nhlt_init(struct device *dev)
> +static inline struct nhlt_acpi_table *intel_nhlt_init(void)
>  {
>  	return NULL;
>  }
> @@ -145,8 +145,7 @@ static inline void intel_nhlt_free(struct nhlt_acpi_table *addr)
>  {
>  }
>  
> -static inline int intel_nhlt_get_dmic_geo(struct device *dev,
> -					  struct nhlt_acpi_table *nhlt)
> +static inline int intel_nhlt_get_dmic_geo(struct nhlt_acpi_table *nhlt)
>  {
>  	return 0;
>  }
> diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
> index b9ac9e9e45a4..60cc4735c6ec 100644
> --- a/sound/hda/intel-dsp-config.c
> +++ b/sound/hda/intel-dsp-config.c
> @@ -382,9 +382,9 @@ static int snd_intel_dsp_check_dmic(struct pci_dev *pci)
>  	struct nhlt_acpi_table *nhlt;
>  	int ret = 0;
>  
> -	nhlt = intel_nhlt_init(&pci->dev);
> +	nhlt = intel_nhlt_init();
>  	if (nhlt) {
> -		if (intel_nhlt_get_dmic_geo(&pci->dev, nhlt))
> +		if (intel_nhlt_get_dmic_geo(nhlt))
>  			ret = 1;
>  		intel_nhlt_free(nhlt);
>  	}
> diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
> index e2237239d922..195d9e193a6c 100644
> --- a/sound/hda/intel-nhlt.c
> +++ b/sound/hda/intel-nhlt.c
> @@ -1,10 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  // Copyright (c) 2015-2019 Intel Corporation
>  
> +#define pr_fmt(fmt)     "NHLT: " fmt
> +
>  #include <linux/acpi.h>
>  #include <sound/intel-nhlt.h>
>  
> -struct nhlt_acpi_table *intel_nhlt_init(struct device *dev)
> +struct nhlt_acpi_table *intel_nhlt_init(void)
>  {
>  	struct nhlt_acpi_table *nhlt;
>  	acpi_status status;
> @@ -12,7 +14,7 @@ struct nhlt_acpi_table *intel_nhlt_init(struct device *dev)
>  	status = acpi_get_table(ACPI_SIG_NHLT, 0,
>  				(struct acpi_table_header **)&nhlt);
>  	if (ACPI_FAILURE(status)) {
> -		dev_warn(dev, "NHLT table not found\n");
> +		pr_warn("NHLT table not found\n");
>  		return NULL;
>  	}
>  
> @@ -26,7 +28,7 @@ void intel_nhlt_free(struct nhlt_acpi_table *nhlt)
>  }
>  EXPORT_SYMBOL_GPL(intel_nhlt_free);
>  
> -int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
> +int intel_nhlt_get_dmic_geo(struct nhlt_acpi_table *nhlt)
>  {
>  	struct nhlt_endpoint *epnt;
>  	struct nhlt_dmic_array_config *cfg;
> @@ -40,7 +42,7 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
>  		return 0;
>  
>  	if (nhlt->header.length <= sizeof(struct acpi_table_header)) {
> -		dev_warn(dev, "Invalid DMIC description table\n");
> +		pr_warn("Invalid DMIC description table\n");
>  		return 0;
>  	}
>  
> @@ -55,7 +57,7 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
>  
>  		/* find max number of channels based on format_configuration */
>  		if (fmt_configs->fmt_count) {
> -			dev_dbg(dev, "%s: found %d format definitions\n",
> +			pr_debug("%s: found %d format definitions\n",
>  				__func__, fmt_configs->fmt_count);
>  
>  			for (i = 0; i < fmt_configs->fmt_count; i++) {
> @@ -66,9 +68,9 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
>  				if (fmt_ext->fmt.channels > max_ch)
>  					max_ch = fmt_ext->fmt.channels;
>  			}
> -			dev_dbg(dev, "%s: max channels found %d\n", __func__, max_ch);
> +			pr_debug("%s: max channels found %d\n", __func__, max_ch);
>  		} else {
> -			dev_dbg(dev, "%s: No format information found\n", __func__);
> +			pr_debug("%s: No format information found\n", __func__);
>  		}
>  
>  		if (cfg->device_config.config_type != NHLT_CONFIG_TYPE_MIC_ARRAY) {
> @@ -90,21 +92,21 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
>  				dmic_geo = cfg_vendor->nb_mics;
>  				break;
>  			default:
> -				dev_warn(dev, "%s: undefined DMIC array_type 0x%0x\n",
> +				pr_warn("%s: undefined DMIC array_type 0x%0x\n",
>  					 __func__, cfg->array_type);
>  			}
>  
>  			if (dmic_geo > 0) {
> -				dev_dbg(dev, "%s: Array with %d dmics\n", __func__, dmic_geo);
> +				pr_debug("%s: Array with %d dmics\n", __func__, dmic_geo);
>  			}
>  			if (max_ch > dmic_geo) {
> -				dev_dbg(dev, "%s: max channels %d exceed dmic number %d\n",
> +				pr_debug("%s: max channels %d exceed dmic number %d\n",
>  					__func__, max_ch, dmic_geo);
>  			}
>  		}
>  	}
>  
> -	dev_dbg(dev, "%s: dmic number %d max_ch %d\n",
> +	pr_debug("%s: dmic number %d max_ch %d\n",
>  		__func__, dmic_geo, max_ch);
>  
>  	return dmic_geo;
> diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
> index 5b1a15e39912..4f122616b636 100644
> --- a/sound/soc/intel/skylake/skl.c
> +++ b/sound/soc/intel/skylake/skl.c
> @@ -517,8 +517,7 @@ static int skl_find_machine(struct skl_dev *skl, void *driver_data)
>  	if (pdata) {
>  		skl->use_tplg_pcm = pdata->use_tplg_pcm;
>  		mach->mach_params.dmic_num =
> -			intel_nhlt_get_dmic_geo(&skl->pci->dev,
> -						skl->nhlt);
> +			intel_nhlt_get_dmic_geo(skl->nhlt);
>  	}
>  
>  	return 0;
> @@ -1009,7 +1008,7 @@ static int skl_probe(struct pci_dev *pci,
>  
>  	device_disable_async_suspend(bus->dev);
>  
> -	skl->nhlt = intel_nhlt_init(bus->dev);
> +	skl->nhlt = intel_nhlt_init();
>  
>  	if (skl->nhlt == NULL) {
>  #if !IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index 883d78dd01b5..75c2ee91bf13 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -651,9 +651,9 @@ static int check_nhlt_dmic(struct snd_sof_dev *sdev)
>  	struct nhlt_acpi_table *nhlt;
>  	int dmic_num;
>  
> -	nhlt = intel_nhlt_init(sdev->dev);
> +	nhlt = intel_nhlt_init();
>  	if (nhlt) {
> -		dmic_num = intel_nhlt_get_dmic_geo(sdev->dev, nhlt);
> +		dmic_num = intel_nhlt_get_dmic_geo(nhlt);
>  		intel_nhlt_free(nhlt);
>  		if (dmic_num >= 1 && dmic_num <= 4)
>  			return dmic_num;
> 
