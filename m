Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E029B7C6
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 22:41:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E56921681;
	Fri, 23 Aug 2019 22:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E56921681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566592882;
	bh=w3d79ZT8oLg8bbhSdVfmBjsmM9BkSGBA11uCzFRoBjE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BiqkWY7fL3rU66mBCmCLaEumjwUYNxz2PsgLvQ560/qB5K77NsBo9LQyJ95dNGhcb
	 lQQRdBur2vWHqeqVQEsl8+ikgcHrAmhI/X63Zco45rTbcxoMXR0wxfcwCsNTZvAQeh
	 4JrAy43nK0/411+dfeP0z+o7x31sYGlU/aCBna70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC70EF80735;
	Fri, 23 Aug 2019 22:29:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDDEAF8065D; Fri, 23 Aug 2019 22:29:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AB54F80141
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 22:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AB54F80141
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:28:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354718243"
Received: from tlchoatx-mobl1.amr.corp.intel.com (HELO [10.254.187.90])
 ([10.254.187.90])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 13:28:20 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-29-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <91852fc6-6bef-9a1d-f380-da7a3985b637@linux.intel.com>
Date: Fri, 23 Aug 2019 15:15:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822190425.23001-29-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 28/35] ASoC: Intel: Skylake: Update skl_ids
 table
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
> With platform descriptors defined, update PCI ID table together with
> skl_probe to retrieve supported boards from saved sst_pdata objects
> instead.

I don't get what you are trying to do here. the only 'benefit' seems to 
duplicate the firmware name, which as I mentioned earlier isn't such a 
good idea.

> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/skylake/skl.c | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
> index d6d099aba834..53a6befd5d68 100644
> --- a/sound/soc/intel/skylake/skl.c
> +++ b/sound/soc/intel/skylake/skl.c
> @@ -985,6 +985,7 @@ static int skl_probe(struct pci_dev *pci,
>   {
>   	struct skl_dev *skl;
>   	struct hdac_bus *bus = NULL;
> +	struct sst_pdata *desc;
>   	int err;
>   
>   	switch (skl_pci_binding) {
> @@ -1064,7 +1065,8 @@ static int skl_probe(struct pci_dev *pci,
>   
>   	pci_set_drvdata(skl->pci, bus);
>   
> -	err = skl_find_machine(skl, (void *)pci_id->driver_data);
> +	desc = (struct sst_pdata *)pci_id->driver_data;
> +	err = skl_find_machine(skl, desc->boards);
>   	if (err < 0) {
>   		dev_err(bus->dev, "skl_find_machine failed with err: %d\n", err);
>   		goto out_nhlt_free;
> @@ -1194,42 +1196,42 @@ static const struct pci_device_id skl_ids[] = {
>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
>   	/* Sunrise Point-LP */
>   	{ PCI_DEVICE(0x8086, 0x9d70),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_skl_machines},
> +		.driver_data = (unsigned long)&skl_desc },
>   #endif
>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
>   	/* BXT-P */
>   	{ PCI_DEVICE(0x8086, 0x5a98),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_bxt_machines},
> +		.driver_data = (unsigned long)&apl_desc },
>   #endif
>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
>   	/* KBL */
>   	{ PCI_DEVICE(0x8086, 0x9D71),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_kbl_machines},
> +		.driver_data = (unsigned long)&kbl_desc },
>   #endif
>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_GLK)
>   	/* GLK */
>   	{ PCI_DEVICE(0x8086, 0x3198),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_glk_machines},
> +		.driver_data = (unsigned long)&glk_desc },
>   #endif
>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CNL)
>   	/* CNL */
>   	{ PCI_DEVICE(0x8086, 0x9dc8),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
> +		.driver_data = (unsigned long)&cnl_desc },
>   #endif
>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CFL)
>   	/* CFL */
>   	{ PCI_DEVICE(0x8086, 0xa348),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
> +		.driver_data = (unsigned long)&cnl_desc },
>   #endif
>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_LP)
>   	/* CML-LP */
>   	{ PCI_DEVICE(0x8086, 0x02c8),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
> +		.driver_data = (unsigned long)&cnl_desc },
>   #endif
>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_H)
>   	/* CML-H */
>   	{ PCI_DEVICE(0x8086, 0x06c8),
> -		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
> +		.driver_data = (unsigned long)&cnl_desc },
>   #endif
>   	{ 0, }
>   };
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
