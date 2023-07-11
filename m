Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE2F74F141
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:10:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4439FE7A;
	Tue, 11 Jul 2023 16:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4439FE7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689084617;
	bh=OItnSNHuKeCQX1TJzcCcwRvIxNHYN/3rVnIlwqJU1DE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u4j5HXUG52gOXiM5BC4m1fA8zX767vcjms35ZvMKmz1pgLpZ3yrYFpUq+EJUP8rjn
	 rfl+oUNfFX2R/QrbThEobljK2aC9JPk5KyVwxZuYKu8u2Kz1KELLEoe8rijMHmfVM+
	 YrtCTy/biykyv1oLAW/vZXb2jvdefgFSjMrsrdj8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0605F800E4; Tue, 11 Jul 2023 16:09:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4225F80236;
	Tue, 11 Jul 2023 16:09:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59860F80249; Tue, 11 Jul 2023 16:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1C82F80153
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 16:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1C82F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MjNtLdxz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689084562; x=1720620562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OItnSNHuKeCQX1TJzcCcwRvIxNHYN/3rVnIlwqJU1DE=;
  b=MjNtLdxz3FMp/ztDmmKvNH19c/ZlalUDn7WHSfUIiGl7o1cbCRyzpZdd
   oO5JrAnvtIBFTH0T/HMGWKrK/ia3sL1bpxusJ0A5zxcgWHaHWYcfu6Zt2
   yjifGITv2aXojbR6IQSq2awz25+WkHUQ2yqh9IFyYaHpAqs0AQCofHgQy
   auRhQQmCqN4WgE8DAOUBYAP0qYYH4xubQe8mTle3ggF+YL044BU223+zv
   aLN9sW0k82KgLsPs6/dpH9hUni8wXcPrtDnUSAZzUsnRqZH2g0ceeW3Tr
   IIyWqCMkf3jjxhmC1u+rfJCHACBGNvB/LAl8ra44oKFzinPfltTmZYjUY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="364664511"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="364664511"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 07:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="895185821"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="895185821"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 11 Jul 2023 07:09:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJE3F-001rxJ-05;
	Tue, 11 Jul 2023 17:09:13 +0300
Date: Tue, 11 Jul 2023 17:09:12 +0300
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
Subject: Re: [PATCH 10/13] ASoC: Intel: avs: Convert to PCI device IDs defines
Message-ID: <ZK1iiMgmjpCA02x+@smile.fi.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-11-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711125726.3509391-11-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: XTITYQ2F6FUZIHJCXFA63FDEAKLEKLBF
X-Message-ID-Hash: XTITYQ2F6FUZIHJCXFA63FDEAKLEKLBF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XTITYQ2F6FUZIHJCXFA63FDEAKLEKLBF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 02:57:23PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header. Adjust AVS_MACH_ENTRY() macro,
> so device ID can be provided in short form.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/soc/intel/avs/board_selection.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
> index 60f8fb0bff95..b32e02940e30 100644
> --- a/sound/soc/intel/avs/board_selection.c
> +++ b/sound/soc/intel/avs/board_selection.c
> @@ -263,14 +263,14 @@ struct avs_acpi_boards {
>  };
>  
>  #define AVS_MACH_ENTRY(_id, _mach) \
> -	{ .id = (_id), .machs = (_mach), }
> +	{ .id = PCI_DEVICE_ID_INTEL_##_id, .machs = (_mach), }
>  
>  /* supported I2S boards per platform */
>  static const struct avs_acpi_boards i2s_boards[] = {
> -	AVS_MACH_ENTRY(0x9d70, avs_skl_i2s_machines), /* SKL */
> -	AVS_MACH_ENTRY(0x9d71, avs_kbl_i2s_machines), /* KBL */
> -	AVS_MACH_ENTRY(0x5a98, avs_apl_i2s_machines), /* APL */
> -	AVS_MACH_ENTRY(0x3198, avs_gml_i2s_machines), /* GML */
> +	AVS_MACH_ENTRY(HDA_SKL_LP, avs_skl_i2s_machines),
> +	AVS_MACH_ENTRY(HDA_KBL_LP, avs_kbl_i2s_machines),
> +	AVS_MACH_ENTRY(HDA_APL, avs_apl_i2s_machines),
> +	AVS_MACH_ENTRY(HDA_GML, avs_gml_i2s_machines),

Maybe sort them by name?

>  	{},
>  };
>  
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


