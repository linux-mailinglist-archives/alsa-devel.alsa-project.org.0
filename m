Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC25750807
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 14:21:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 581C71F6;
	Wed, 12 Jul 2023 14:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 581C71F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689164471;
	bh=aHYcX/RpGX8NgxBuDMZyXS2bZgmbpwPq0YBcwOhVdKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EvJQLLKl4X27WXCIDkrI5uPZWCtGaQhHxjJIpGUJCK8wxzUwuCj38HfF6Ql5BeKi9
	 XjSajWJ6q+/IzQYjZkI7tFbGcvyIzubeG0qP9MS6v/crZy9yUF88jog26fQ/xJAJeD
	 4bLYvYcok1OMOxdcGSShFqNe4Nw8fX42dyITwrXA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7421F80236; Wed, 12 Jul 2023 14:20:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C762F80236;
	Wed, 12 Jul 2023 14:20:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5E41F80249; Wed, 12 Jul 2023 14:20:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DD64F800D2
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 14:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DD64F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Po6p7KNu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689164415; x=1720700415;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aHYcX/RpGX8NgxBuDMZyXS2bZgmbpwPq0YBcwOhVdKI=;
  b=Po6p7KNu0m8TPUd/uaOcBiuJ/ZigIQSYSH0Fp0Glu/YAxMxOWERnMFRV
   qtohaOBKTJfXUf7u43Q/Zdloxg8zpIb5x7fJxexLsKvyahUdn/YusQri8
   rsDLHo0qJeZAgxJ10oASN3c8V8Lyjf3acHeV1GZgOkxofWBFgFS0cnH8F
   zdi23FymUrLGnN3OwpB54sK8dMzWmK1sd2YF3DYdyGu0xy0+UUpCrsDoT
   8dENT57eg08eIMSHdmnWWcAxyWKWd22VuW3DuitOglYPi7gHy7vTsaaw0
   6O+rYg533JAU6taGd4VU8SZYGokFldy2Ku27o75DFh9FV+KjfsVrPRnBq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="431007172"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200";
   d="scan'208";a="431007172"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 05:19:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="1052168447"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200";
   d="scan'208";a="1052168447"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 05:19:50 -0700
Message-ID: <958f3638-f68a-ebec-29cc-816f823b017f@linux.intel.com>
Date: Wed, 12 Jul 2023 14:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 13/13] ASoC: Intel: sst: Convert to PCI device IDs defines
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-14-amadeuszx.slawinski@linux.intel.com>
 <ZK1oKYW0rro4FnNO@smile.fi.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ZK1oKYW0rro4FnNO@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UDKJJA6DCP6GAEABDY2SOUDV6AFV6PKH
X-Message-ID-Hash: UDKJJA6DCP6GAEABDY2SOUDV6AFV6PKH
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDKJJA6DCP6GAEABDY2SOUDV6AFV6PKH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/11/2023 4:33 PM, Andy Shevchenko wrote:
> On Tue, Jul 11, 2023 at 02:57:26PM +0200, Amadeusz Sławiński wrote:
>> Use PCI device IDs from pci_ids.h header.
> 
> ...
> 
>>   	switch (sst->dev_id) {
>> -	case SST_MRFLD_PCI_ID:
>> +	case PCI_DEVICE_ID_INTEL_ADSP_TNG:
>>   	case SST_BYT_ACPI_ID:
>>   	case SST_CHV_ACPI_ID:
> 
> I think this needs a bit more, i.e. replacing the rest with respective PCI IDs.
> 
> All three will be defined with SST prefix, which makes sense to me.
> 
> ACPI here is a bit misleading, but correct. The ACPI specification assumes that
> respective part of the ID space covers 100% of PCI ID space.
> 
> I have briefly checked the code and it seems that ID is used externally only
> for PCI case, so we may simply use the lower 16 bits of the ACPI _HID for the
> context.
> 

Do I understand correctly that I should just do:
#define PCI_DEVICE_ID_INTEL_SST_BYT	0x0F28
#define PCI_DEVICE_ID_INTEL_SST_CHV	0x22A8
and use those IDs instead?

> diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
> index a0d29510d2bc..b1f59604d825 100644
> --- a/sound/soc/intel/atom/sst/sst.c
> +++ b/sound/soc/intel/atom/sst/sst.c
> @@ -222,7 +222,7 @@ static void sst_init_locks(struct intel_sst_drv *ctx)
>   }
>   
>   int sst_alloc_drv_context(struct intel_sst_drv **ctx,
> -		struct device *dev, unsigned int dev_id)
> +		struct device *dev, unsigned short dev_id)
>   {
>   	*ctx = devm_kzalloc(dev, sizeof(struct intel_sst_drv), GFP_KERNEL);
>   	if (!(*ctx))
> diff --git a/sound/soc/intel/atom/sst/sst.h b/sound/soc/intel/atom/sst/sst.h
> index 4d37d39fd8f4..c04f033e1d5f 100644
> --- a/sound/soc/intel/atom/sst/sst.h
> +++ b/sound/soc/intel/atom/sst/sst.h
> @@ -358,7 +358,7 @@ struct sst_fw_save {
>   struct intel_sst_drv {
>   	int			sst_state;
>   	int			irq_num;
> -	unsigned int		dev_id;
> +	unsigned short		dev_id;
>   	void __iomem		*ddr;
>   	void __iomem		*shim;
>   	void __iomem		*mailbox;
> @@ -523,7 +523,7 @@ int sst_register(struct device *);
>   int sst_unregister(struct device *);
>   
>   int sst_alloc_drv_context(struct intel_sst_drv **ctx,
> -		struct device *dev, unsigned int dev_id);
> +		struct device *dev, unsigned short dev_id);
>   int sst_context_init(struct intel_sst_drv *ctx);
>   void sst_context_cleanup(struct intel_sst_drv *ctx);
>   void sst_configure_runtime_pm(struct intel_sst_drv *ctx);
> 
> ...
> 
>>   /* driver names */
>>   #define SST_DRV_NAME "intel_sst_driver"
> 
>> -#define SST_MRFLD_PCI_ID 0x119A
>>   #define SST_BYT_ACPI_ID	0x80860F28
>>   #define SST_CHV_ACPI_ID	0x808622A8
> 
> And kill all three!
> 

