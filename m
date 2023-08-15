Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44E77CFC0
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 17:58:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2159C74C;
	Tue, 15 Aug 2023 17:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2159C74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692115106;
	bh=z4YNtVemGpaMn6cnGX/oRcs7rBSpc7X3Yc6wPTVeBMY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UCKjAQnSyH+9F1JVXKDw3zMZgJT/XczpuUWjw8H7kMAaUg15T03WENCCyZnjkMUtr
	 vJR8JYbvjHwZKukxpmuLESOYcYvH1KLBka0nNdnvsutsFcVaEGpnUx0OYuMU6g5tVS
	 YSA7l9zL3CY8t5PYDYwt1ctIBqtmnrAUxtcwki5M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FF4AF80510; Tue, 15 Aug 2023 17:57:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C55ECF8016A;
	Tue, 15 Aug 2023 17:57:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CAD7F8016D; Tue, 15 Aug 2023 17:57:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22C1DF80027
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 17:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22C1DF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UAgibfNt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692115018; x=1723651018;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=z4YNtVemGpaMn6cnGX/oRcs7rBSpc7X3Yc6wPTVeBMY=;
  b=UAgibfNtBXBF/RTcyk0PyibGCOYSMkGh1PQ4nPOFCsM8QPAQ2Y7Ky/nY
   Iwp684sKOwBhpB5btce+EJK+8Qd8badeSrgbyz5LRVtJjLe30pHfZJbnT
   bcOP0FEsSpyV3TmfE0TnlDubq/PKJoNI1SdUWUTbwN9UJBj6lRdJHf/c4
   CopWlG7LEi8WL3yilNRso9q1feKGEkwbXXCSFTH40v6HbC8RyoYO82icc
   7llsZ8BpmRHrYh3NxQc9z1cv3nRZVeiTHysDzzokT8buzs3tTzMdQtjU8
   x+YbXS9IHpmOlLRdcuTyg0hEycp0JR+ImapcbckRnKJEEXQDjAdgH0qJ0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436203882"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="436203882"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 08:56:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763304996"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="763304996"
Received: from bawerden-mobl.amr.corp.intel.com (HELO [10.209.163.183])
 ([10.209.163.183])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 08:56:51 -0700
Message-ID: <850c5b2c-265e-a565-8a88-58a88f8fb4e8@linux.intel.com>
Date: Tue, 15 Aug 2023 10:56:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2] ALSA: hda: intel-dsp-cfg: Add Chromebook quirk to
 ADL/RPL
Content-Language: en-US
To: Brady Norander <bradynorander@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@linux.intel.com,
 perex@perex.cz, tiwai@suse.de, cujomalainey@chromium.org
References: <ZNuDLk5hgmfKrZg6@arch>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZNuDLk5hgmfKrZg6@arch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GLF73PHBQR3JUBMP22AX4PDG5TPRWHBG
X-Message-ID-Hash: GLF73PHBQR3JUBMP22AX4PDG5TPRWHBG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GLF73PHBQR3JUBMP22AX4PDG5TPRWHBG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/15/23 08:52, Brady Norander wrote:
> AlderLake and RaptorLake Chromebooks currently use the HDA driver by
> default. Add a quirk to use the SOF driver on these platforms, which is
> needed for functional internal audio.
> 
> Signed-off-by: Brady Norander <bradynorander@gmail.com>

Thanks for the patch

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> 
> v2: Removed quirk from SKUs not used in Chrome platforms
> 
>  sound/hda/intel-dsp-config.c | 60 +++++++++++++++++++++++++++++++++---
>  1 file changed, 56 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
> index dcf2453138a5..24a948baf1bc 100644
> --- a/sound/hda/intel-dsp-config.c
> +++ b/sound/hda/intel-dsp-config.c
> @@ -167,10 +167,10 @@ static const struct config_entry config_table[] = {
>  #endif
>  
>  /*
> - * CoffeeLake, CannonLake, CometLake, IceLake, TigerLake use legacy
> - * HDAudio driver except for Google Chromebooks and when DMICs are
> - * present. Two cases are required since Coreboot does not expose NHLT
> - * tables.
> + * CoffeeLake, CannonLake, CometLake, IceLake, TigerLake, AlderLake,
> + * RaptorLake use legacy HDAudio driver except for Google Chromebooks
> + * and when DMICs are present. Two cases are required since Coreboot
> + * does not expose NHLT tables.
>   *
>   * When the Chromebook quirk is not present, it's based on information
>   * that no such device exists. When the quirk is present, it could be
> @@ -408,6 +408,19 @@ static const struct config_entry config_table[] = {
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_S,
>  	},
> +	{
> +		.flags = FLAG_SOF,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
> +		.dmi_table = (const struct dmi_system_id []) {
> +			{
> +				.ident = "Google Chromebooks",
> +				.matches = {
> +					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +				}
> +			},
> +			{}
> +		}
> +	},
>  	{
>  		.flags = FLAG_SOF,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
> @@ -434,14 +447,53 @@ static const struct config_entry config_table[] = {
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_M,
>  	},
> +	{
> +		.flags = FLAG_SOF,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_N,
> +		.dmi_table = (const struct dmi_system_id []) {
> +			{
> +				.ident = "Google Chromebooks",
> +				.matches = {
> +					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +				}
> +			},
> +			{}
> +		}
> +	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_N,
>  	},
> +	{
> +		.flags = FLAG_SOF,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_0,
> +		.dmi_table = (const struct dmi_system_id []) {
> +			{
> +				.ident = "Google Chromebooks",
> +				.matches = {
> +					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +				}
> +			},
> +			{}
> +		}
> +	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_0,
>  	},
> +	{
> +		.flags = FLAG_SOF,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_1,
> +		.dmi_table = (const struct dmi_system_id []) {
> +			{
> +				.ident = "Google Chromebooks",
> +				.matches = {
> +					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +				}
> +			},
> +			{}
> +		}
> +	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_1,
