Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB5974F14B
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:12:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 939FFE87;
	Tue, 11 Jul 2023 16:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 939FFE87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689084737;
	bh=xj/NaD7rJVegzRnQWSku6xyrxDMtYG0ROyHoK88TJTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cfGo/vHAEbcvT9P8Azrs3x3r+sRpfJKHdDu4NM+X4gVqwYxYhIliYvTwTSCYyF57S
	 LAnGGwrln5NTiabjIjHl7YSbATkx8raaCpyGxR98IKpXGqukU0OsgNXY672O/kOrfF
	 XMY+8srEtPQ2v9xapWktAdcBYkxWu7PR2xCAeWqU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C52EDF80290; Tue, 11 Jul 2023 16:10:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81700F80548;
	Tue, 11 Jul 2023 16:10:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84A07F80549; Tue, 11 Jul 2023 16:10:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36B66F80290
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 16:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36B66F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iKLklHok
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689084647; x=1720620647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xj/NaD7rJVegzRnQWSku6xyrxDMtYG0ROyHoK88TJTI=;
  b=iKLklHokCPwTzd1NfqTTV3L75al0IQyMz214B4Gmu1iagz+7c75Le8Px
   /efZxxnoYiWRENLw/X/1RtZazKa77MilYhiK7xf/O461jHk0XSaDYtY1k
   QboA199o4clq/wdY51tzdaFbbCMUJJEYsHH6roWodvqHES7F0dm7Gk8KF
   Vy/YegbeOfeZuNKMpdRXMaO7kBn4E4jK6x7Gj13MsXsxGiw0Ml0x49j+A
   dzlfnGqxr/BE7T3wxYLhkC9tOiUf2HELqi1XA1xMPjkLfyBGnCr8RsEFv
   iWxZWroxk6xAy+NBH7Mft2gXWZk0FESfHh2GgjpzuxWYmpSMBGkFmyyrh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="364664851"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="364664851"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 07:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="791219489"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="791219489"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2023 07:10:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJE4c-001ryG-3C;
	Tue, 11 Jul 2023 17:10:38 +0300
Date: Tue, 11 Jul 2023 17:10:38 +0300
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
Subject: Re: [PATCH 11/13] ASoC: Intel: Skylake: Convert to PCI device IDs
 defines
Message-ID: <ZK1i3pvgtuka8nJW@smile.fi.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-12-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711125726.3509391-12-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: DUKIJZUWCE2BVGGWXWNHC46Q6NRE45AF
X-Message-ID-Hash: DUKIJZUWCE2BVGGWXWNHC46Q6NRE45AF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUKIJZUWCE2BVGGWXWNHC46Q6NRE45AF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 02:57:24PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header and while at it change to using
> PCI_DEVICE_DATA() macro, to simplify declarations.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

BXT --> APL ?

> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/soc/intel/skylake/skl-messages.c | 16 ++++++------
>  sound/soc/intel/skylake/skl.c          | 36 +++++++-------------------
>  2 files changed, 18 insertions(+), 34 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
> index d31509298a0a..fc2eb04da172 100644
> --- a/sound/soc/intel/skylake/skl-messages.c
> +++ b/sound/soc/intel/skylake/skl-messages.c
> @@ -169,7 +169,7 @@ static struct skl_dsp_loader_ops bxt_get_loader_ops(void)
>  
>  static const struct skl_dsp_ops dsp_ops[] = {
>  	{
> -		.id = 0x9d70,
> +		.id = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
>  		.num_cores = 2,
>  		.loader_ops = skl_get_loader_ops,
>  		.init = skl_sst_dsp_init,
> @@ -177,7 +177,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
>  		.cleanup = skl_sst_dsp_cleanup
>  	},
>  	{
> -		.id = 0x9d71,
> +		.id = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
>  		.num_cores = 2,
>  		.loader_ops = skl_get_loader_ops,
>  		.init = skl_sst_dsp_init,
> @@ -185,7 +185,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
>  		.cleanup = skl_sst_dsp_cleanup
>  	},
>  	{
> -		.id = 0x5a98,
> +		.id = PCI_DEVICE_ID_INTEL_HDA_APL,
>  		.num_cores = 2,
>  		.loader_ops = bxt_get_loader_ops,
>  		.init = bxt_sst_dsp_init,
> @@ -193,7 +193,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
>  		.cleanup = bxt_sst_dsp_cleanup
>  	},
>  	{
> -		.id = 0x3198,
> +		.id = PCI_DEVICE_ID_INTEL_HDA_GML,
>  		.num_cores = 2,
>  		.loader_ops = bxt_get_loader_ops,
>  		.init = bxt_sst_dsp_init,
> @@ -201,7 +201,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
>  		.cleanup = bxt_sst_dsp_cleanup
>  	},
>  	{
> -		.id = 0x9dc8,
> +		.id = PCI_DEVICE_ID_INTEL_HDA_CNL_LP,
>  		.num_cores = 4,
>  		.loader_ops = bxt_get_loader_ops,
>  		.init = cnl_sst_dsp_init,
> @@ -209,7 +209,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
>  		.cleanup = cnl_sst_dsp_cleanup
>  	},
>  	{
> -		.id = 0xa348,
> +		.id = PCI_DEVICE_ID_INTEL_HDA_CNL_H,
>  		.num_cores = 4,
>  		.loader_ops = bxt_get_loader_ops,
>  		.init = cnl_sst_dsp_init,
> @@ -217,7 +217,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
>  		.cleanup = cnl_sst_dsp_cleanup
>  	},
>  	{
> -		.id = 0x02c8,
> +		.id = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
>  		.num_cores = 4,
>  		.loader_ops = bxt_get_loader_ops,
>  		.init = cnl_sst_dsp_init,
> @@ -225,7 +225,7 @@ static const struct skl_dsp_ops dsp_ops[] = {
>  		.cleanup = cnl_sst_dsp_cleanup
>  	},
>  	{
> -		.id = 0x06c8,
> +		.id = PCI_DEVICE_ID_INTEL_HDA_CML_H,
>  		.num_cores = 4,
>  		.loader_ops = bxt_get_loader_ops,
>  		.init = cnl_sst_dsp_init,
> diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
> index 998bd0232cf1..77408a981b97 100644
> --- a/sound/soc/intel/skylake/skl.c
> +++ b/sound/soc/intel/skylake/skl.c
> @@ -608,8 +608,8 @@ struct skl_clk_parent_src *skl_get_parent_clk(u8 clk_id)
>  static void init_skl_xtal_rate(int pci_id)
>  {
>  	switch (pci_id) {
> -	case 0x9d70:
> -	case 0x9d71:
> +	case PCI_DEVICE_ID_INTEL_HDA_SKL_LP:
> +	case PCI_DEVICE_ID_INTEL_HDA_KBL_LP:
>  		skl_clk_src[0].rate = 24000000;
>  		return;
>  
> @@ -1145,44 +1145,28 @@ static void skl_remove(struct pci_dev *pci)
>  /* PCI IDs */
>  static const struct pci_device_id skl_ids[] = {
>  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
> -	/* Sunrise Point-LP */
> -	{ PCI_DEVICE(0x8086, 0x9d70),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_skl_machines},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP, &snd_soc_acpi_intel_skl_machines) },
>  #endif
>  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
> -	/* BXT-P */
> -	{ PCI_DEVICE(0x8086, 0x5a98),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_bxt_machines},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_APL, &snd_soc_acpi_intel_bxt_machines) },
>  #endif
>  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
> -	/* KBL */
> -	{ PCI_DEVICE(0x8086, 0x9D71),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_kbl_machines},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_KBL_LP, &snd_soc_acpi_intel_kbl_machines) },
>  #endif
>  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_GLK)
> -	/* GLK */
> -	{ PCI_DEVICE(0x8086, 0x3198),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_glk_machines},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_GML, &snd_soc_acpi_intel_glk_machines) },
>  #endif
>  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CNL)
> -	/* CNL */
> -	{ PCI_DEVICE(0x8086, 0x9dc8),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_CNL_LP, &snd_soc_acpi_intel_cnl_machines) },
>  #endif
>  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CFL)
> -	/* CFL */
> -	{ PCI_DEVICE(0x8086, 0xa348),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_CNL_H, &snd_soc_acpi_intel_cnl_machines) },
>  #endif
>  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_LP)
> -	/* CML-LP */
> -	{ PCI_DEVICE(0x8086, 0x02c8),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_CML_LP, &snd_soc_acpi_intel_cnl_machines) },
>  #endif
>  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_H)
> -	/* CML-H */
> -	{ PCI_DEVICE(0x8086, 0x06c8),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_CML_H, &snd_soc_acpi_intel_cnl_machines) },
>  #endif
>  	{ 0, }
>  };
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


