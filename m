Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E234B74F19A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:17:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04BA4EAC;
	Tue, 11 Jul 2023 16:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04BA4EAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689085063;
	bh=GydZ/1lpJ/AnE3XIEbDEpzC1D7bZ7OxWRWr9gYhGDh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LLbCSYN5dZqpsXX9L7byoX3NHn8RRFs/33RXokQOCNdjHIFmaos79lsV1vwdYZaXS
	 FlDRSmcRZjpEfdIqFluE+MBTBFwjb+axK6dtozqacknfqNyW8i+p8VNfLgb6QrGp0j
	 wJn3hzEA0eW6wgydDmFX2EdG6jKztNc7XouJh5VA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64442F800E4; Tue, 11 Jul 2023 16:16:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE8D9F80236;
	Tue, 11 Jul 2023 16:16:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39356F80249; Tue, 11 Jul 2023 16:16:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A617F80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 16:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A617F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NEbrVMn4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689085004; x=1720621004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GydZ/1lpJ/AnE3XIEbDEpzC1D7bZ7OxWRWr9gYhGDh8=;
  b=NEbrVMn4G49xkmUMZREhdKdjqzUueGrm1GjXoipeIgyUJuqaY8ENcxp1
   fjblgpDjcMdA1HZaXtZHfoc0asd2p9iMn9iZSvFbXVm3sVY7dhhOpsRgQ
   j018o/IwBjzOX+CJzAeVOWDOoa3b8+sg3DwGabSgKqF19z/F/icqm6IV4
   QlNz6zz2LFR0U7mUziF5A/+LkPKOKTtuHf4Xi1ciZzOSeRCRyCWn7F9Ac
   h26ABGQmKcKvN+IzFMRVz100VMRXjT4sfg5n3AQ6eKVLI0gaLfnk6T1Ll
   OJp1CPQ+QKy6LlhfmuaIj4FYYL0Z9l7bCcexIoVrjItxANgy6gFR+jF0s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="450989637"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="450989637"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 07:16:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715173555"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="715173555"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 07:16:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJEAI-001s37-0N;
	Tue, 11 Jul 2023 17:16:30 +0300
Date: Tue, 11 Jul 2023 17:16:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 12/13] ASoC: SOF: Intel: Convert to PCI device IDs defines
Message-ID: <ZK1kPXm+FieJ+vya@smile.fi.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-13-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711125726.3509391-13-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: SKCJXZZTOHDUXKM26IB7GJR4QCC7OMEV
X-Message-ID-Hash: SKCJXZZTOHDUXKM26IB7GJR4QCC7OMEV
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SKCJXZZTOHDUXKM26IB7GJR4QCC7OMEV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 02:57:25PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header and while at it change to using
> PCI_DEVICE_DATA() macro, to simplify declarations.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Oh, additional remark below.

> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/soc/sof/intel/pci-apl.c |  9 +++----
>  sound/soc/sof/intel/pci-cnl.c | 15 ++++--------
>  sound/soc/sof/intel/pci-icl.c | 12 ++++------
>  sound/soc/sof/intel/pci-mtl.c |  3 +--
>  sound/soc/sof/intel/pci-skl.c |  6 ++---
>  sound/soc/sof/intel/pci-tgl.c | 45 ++++++++++++-----------------------
>  sound/soc/sof/intel/pci-tng.c |  3 +--
>  7 files changed, 31 insertions(+), 62 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
> index 69cad5a6bc72..083659ddfe6b 100644
> --- a/sound/soc/sof/intel/pci-apl.c
> +++ b/sound/soc/sof/intel/pci-apl.c
> @@ -85,12 +85,9 @@ static const struct sof_dev_desc glk_desc = {
>  
>  /* PCI IDs */
>  static const struct pci_device_id sof_pci_ids[] = {
> -	{ PCI_DEVICE(0x8086, 0x5a98), /* BXT-P (ApolloLake) */
> -		.driver_data = (unsigned long)&bxt_desc},
> -	{ PCI_DEVICE(0x8086, 0x1a98),/* BXT-T */
> -		.driver_data = (unsigned long)&bxt_desc},
> -	{ PCI_DEVICE(0x8086, 0x3198), /* GeminiLake */
> -		.driver_data = (unsigned long)&glk_desc},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_APL, &bxt_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_APL_T, &bxt_desc) },

Have we ever had APL-T? What is that? I remember that we have had two or
three BXTs inside, and then products become for Broxton and Apollo Lake
SoC codenames. I never have heard about -T...

> +	{ PCI_DEVICE_DATA(INTEL, HDA_GML, &glk_desc) },
>  	{ 0, }
>  };
>  MODULE_DEVICE_TABLE(pci, sof_pci_ids);
> diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
> index 8895508a0be6..e2c50e7b0aa7 100644
> --- a/sound/soc/sof/intel/pci-cnl.c
> +++ b/sound/soc/sof/intel/pci-cnl.c
> @@ -120,16 +120,11 @@ static const struct sof_dev_desc cml_desc = {
>  
>  /* PCI IDs */
>  static const struct pci_device_id sof_pci_ids[] = {
> -	{ PCI_DEVICE(0x8086, 0x9dc8), /* CNL-LP */
> -		.driver_data = (unsigned long)&cnl_desc},
> -	{ PCI_DEVICE(0x8086, 0xa348), /* CNL-H */
> -		.driver_data = (unsigned long)&cfl_desc},
> -	{ PCI_DEVICE(0x8086, 0x02c8), /* CML-LP */
> -		.driver_data = (unsigned long)&cml_desc},
> -	{ PCI_DEVICE(0x8086, 0x06c8), /* CML-H */
> -		.driver_data = (unsigned long)&cml_desc},
> -	{ PCI_DEVICE(0x8086, 0xa3f0), /* CML-S */
> -		.driver_data = (unsigned long)&cml_desc},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_CNL_LP, &cnl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_CNL_H, &cfl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_CML_LP, &cml_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_CML_H, &cml_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_CML_S, &cml_desc) },
>  	{ 0, }
>  };
>  MODULE_DEVICE_TABLE(pci, sof_pci_ids);
> diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
> index 5fb5a820693e..0a65df3ed9e2 100644
> --- a/sound/soc/sof/intel/pci-icl.c
> +++ b/sound/soc/sof/intel/pci-icl.c
> @@ -86,14 +86,10 @@ static const struct sof_dev_desc jsl_desc = {
>  
>  /* PCI IDs */
>  static const struct pci_device_id sof_pci_ids[] = {
> -	{ PCI_DEVICE(0x8086, 0x34C8), /* ICL-LP */
> -		.driver_data = (unsigned long)&icl_desc},
> -	{ PCI_DEVICE(0x8086, 0x3dc8), /* ICL-H */
> -		.driver_data = (unsigned long)&icl_desc},
> -	{ PCI_DEVICE(0x8086, 0x38c8), /* ICL-N */
> -		.driver_data = (unsigned long)&jsl_desc},
> -	{ PCI_DEVICE(0x8086, 0x4dc8), /* JSL-N */
> -		.driver_data = (unsigned long)&jsl_desc},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_ICL_LP, &icl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_ICL_H, &icl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_ICL_N, &jsl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_JSL_N, &jsl_desc) },
>  	{ 0, }
>  };
>  MODULE_DEVICE_TABLE(pci, sof_pci_ids);
> diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
> index e276e1e37fed..7868b0827e84 100644
> --- a/sound/soc/sof/intel/pci-mtl.c
> +++ b/sound/soc/sof/intel/pci-mtl.c
> @@ -52,8 +52,7 @@ static const struct sof_dev_desc mtl_desc = {
>  
>  /* PCI IDs */
>  static const struct pci_device_id sof_pci_ids[] = {
> -	{ PCI_DEVICE(0x8086, 0x7E28), /* MTL */
> -		.driver_data = (unsigned long)&mtl_desc},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_MTL, &mtl_desc) },
>  	{ 0, }
>  };
>  MODULE_DEVICE_TABLE(pci, sof_pci_ids);
> diff --git a/sound/soc/sof/intel/pci-skl.c b/sound/soc/sof/intel/pci-skl.c
> index 5e69af6eed34..a6588b138a8c 100644
> --- a/sound/soc/sof/intel/pci-skl.c
> +++ b/sound/soc/sof/intel/pci-skl.c
> @@ -69,10 +69,8 @@ static struct sof_dev_desc kbl_desc = {
>  
>  /* PCI IDs */
>  static const struct pci_device_id sof_pci_ids[] = {
> -	/* Sunrise Point-LP */
> -	{ PCI_DEVICE(0x8086, 0x9d70), .driver_data = (unsigned long)&skl_desc},
> -	/* KBL */
> -	{ PCI_DEVICE(0x8086, 0x9d71), .driver_data = (unsigned long)&kbl_desc},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP, &skl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_KBL_LP, &kbl_desc) },
>  	{ 0, }
>  };
>  MODULE_DEVICE_TABLE(pci, sof_pci_ids);
> diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
> index ca37ff1bbd2a..d688f9373fb2 100644
> --- a/sound/soc/sof/intel/pci-tgl.c
> +++ b/sound/soc/sof/intel/pci-tgl.c
> @@ -284,36 +284,21 @@ static const struct sof_dev_desc rpl_desc = {
>  
>  /* PCI IDs */
>  static const struct pci_device_id sof_pci_ids[] = {
> -	{ PCI_DEVICE(0x8086, 0xa0c8), /* TGL-LP */
> -		.driver_data = (unsigned long)&tgl_desc},
> -	{ PCI_DEVICE(0x8086, 0x43c8), /* TGL-H */
> -		.driver_data = (unsigned long)&tglh_desc},
> -	{ PCI_DEVICE(0x8086, 0x4b55), /* EHL */
> -		.driver_data = (unsigned long)&ehl_desc},
> -	{ PCI_DEVICE(0x8086, 0x4b58), /* EHL */
> -		.driver_data = (unsigned long)&ehl_desc},
> -	{ PCI_DEVICE(0x8086, 0x7ad0), /* ADL-S */
> -		.driver_data = (unsigned long)&adls_desc},
> -	{ PCI_DEVICE(0x8086, 0x7a50), /* RPL-S */
> -		.driver_data = (unsigned long)&rpls_desc},
> -	{ PCI_DEVICE(0x8086, 0x51c8), /* ADL-P */
> -		.driver_data = (unsigned long)&adl_desc},
> -	{ PCI_DEVICE(0x8086, 0x51c9), /* ADL-PS */
> -		.driver_data = (unsigned long)&adl_desc},
> -	{ PCI_DEVICE(0x8086, 0x51ca), /* RPL-P */
> -		.driver_data = (unsigned long)&rpl_desc},
> -	{ PCI_DEVICE(0x8086, 0x51cb), /* RPL-P */
> -		.driver_data = (unsigned long)&rpl_desc},
> -	{ PCI_DEVICE(0x8086, 0x51cc), /* ADL-M */
> -		.driver_data = (unsigned long)&adl_desc},
> -	{ PCI_DEVICE(0x8086, 0x51cd), /* ADL-P */
> -		.driver_data = (unsigned long)&adl_desc},
> -	{ PCI_DEVICE(0x8086, 0x51ce), /* RPL-M */
> -		.driver_data = (unsigned long)&rpl_desc},
> -	{ PCI_DEVICE(0x8086, 0x51cf), /* RPL-PX */
> -		.driver_data = (unsigned long)&rpl_desc},
> -	{ PCI_DEVICE(0x8086, 0x54c8), /* ADL-N */
> -		.driver_data = (unsigned long)&adl_n_desc},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_TGL_LP, &tgl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_TGL_H, &tglh_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_EHL_0, &ehl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_EHL_3, &ehl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_S, &adls_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_S, &rpls_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_P, &adl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_PS, &adl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_P_0, &rpl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_P_1, &rpl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_M, &adl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_PX, &adl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_M, &rpl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_PX, &rpl_desc) },
> +	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_N, &adl_n_desc) },
>  	{ 0, }
>  };
>  MODULE_DEVICE_TABLE(pci, sof_pci_ids);
> diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
> index 8c22a00266c0..12e81456a80c 100644
> --- a/sound/soc/sof/intel/pci-tng.c
> +++ b/sound/soc/sof/intel/pci-tng.c
> @@ -225,8 +225,7 @@ static const struct sof_dev_desc tng_desc = {
>  
>  /* PCI IDs */
>  static const struct pci_device_id sof_pci_ids[] = {
> -	{ PCI_DEVICE(0x8086, 0x119a),
> -		.driver_data = (unsigned long)&tng_desc},
> +	{ PCI_DEVICE_DATA(INTEL, ADSP_TNG, &tng_desc) },
>  	{ 0, }
>  };
>  MODULE_DEVICE_TABLE(pci, sof_pci_ids);
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


