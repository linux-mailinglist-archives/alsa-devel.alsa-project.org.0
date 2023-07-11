Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F2D74F0FB
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:01:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11B89EEC;
	Tue, 11 Jul 2023 16:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11B89EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689084106;
	bh=Q64irnKAz6fiSs2TqIhiYmK+yWyDNfKOvxIYYho1PUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CebWtX6BKpS363nIuXzBFVAYZUjO45WYcreSqW5D8jN/XO5H0B9XmoPD67y3LfYrk
	 iWJjMaFzeBMwgg1ZzHCPxA0HoYCJtvyWN0tGRJd4nkqsqP9k203ng483iXGyHgDvBW
	 3Sil1hZDTXN+yJsP3cKaket1jCdMaqaJs1sNUS5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EA0EF8047D; Tue, 11 Jul 2023 16:00:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 258BAF80290;
	Tue, 11 Jul 2023 16:00:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ACB4F80290; Tue, 11 Jul 2023 16:00:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E761F80236
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 16:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E761F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=APiX+nxH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689084018; x=1720620018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Q64irnKAz6fiSs2TqIhiYmK+yWyDNfKOvxIYYho1PUE=;
  b=APiX+nxH3R3C1bth2BH71gNUXg7eGhYCMUocIKXC6Kl0D9I56GUYpFO7
   lV81f0fY+x+VnwK/RZyxysJJ1Sk6woyOjZIou3M6OMEe2xyWESb5IbjVb
   83hRn5U28FnC2NItgH95NPYfkJjcOE3Wq1tHoNgPhE8o99C9YKIufeRxa
   hKrK0Pri3p9fzOwiN8eSfxONWhjddT6UqhrOZSBbz1eO8RNfQxthmpXfM
   RSsM5gJ0WZvdGPVsvGvsuAzvBDmQ5gCOesseO1W91UAsMD/qlHT1f8yap
   6UhzALoZXfuqLjViz8uTdNrJrP+yeDRUH7+SFLJWKyfHTK1M4F+4iT8JZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="395410225"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="395410225"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 07:00:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="834706770"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="834706770"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 07:00:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJDuS-001rq7-1j;
	Tue, 11 Jul 2023 17:00:08 +0300
Date: Tue, 11 Jul 2023 17:00:08 +0300
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
Subject: Re: [PATCH 07/13] ALSA: intel-dsp-config: Convert to PCI device IDs
 defines
Message-ID: <ZK1gaER7n4JUjIeW@smile.fi.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-8-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711125726.3509391-8-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: PPAPZ3DD4LI2VT3APNPFX7RMJFL44ZH5
X-Message-ID-Hash: PPAPZ3DD4LI2VT3APNPFX7RMJFL44ZH5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PPAPZ3DD4LI2VT3APNPFX7RMJFL44ZH5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 02:57:20PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header. Also simplify comments for
> Alder Lake and Raptor Lake platforms, as new IDs make it clear what
> revision is in use.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> # for Intel Tangier ID

One remark below.

> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/hda/intel-dsp-config.c | 119 ++++++++++++++++-------------------
>  1 file changed, 55 insertions(+), 64 deletions(-)
> 
> diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
> index 317bdf6dcbef..2a71fa5ffec1 100644
> --- a/sound/hda/intel-dsp-config.c
> +++ b/sound/hda/intel-dsp-config.c
> @@ -50,14 +50,14 @@ static const struct config_entry config_table[] = {
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_MERRIFIELD)
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x119a,
> +		.device = PCI_DEVICE_ID_INTEL_ADSP_TNG,

Yeah, somebody familiar with Intel history of SST/HDA/wtf should really
tell why HDA code is using this ID. Does it mean that SST implies HDA
always? Only for this (or this family of) platform?

It might affect the ID naming, but otherwise it's orthogonal to the series.

>  	},
>  #endif
>  /* Broxton-T */
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x1a98,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_APL_T,
>  	},
>  #endif
>  /*
> @@ -68,7 +68,7 @@ static const struct config_entry config_table[] = {
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x5a98,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
>  				.ident = "Up Squared",
> @@ -82,14 +82,14 @@ static const struct config_entry config_table[] = {
>  	},
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x5a98,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
>  		.codec_hid =  &essx_83x6,
>  	},
>  #endif
>  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
>  	{
>  		.flags = FLAG_SST,
> -		.device = 0x5a98,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
>  				.ident = "Google Chromebooks",
> @@ -110,7 +110,7 @@ static const struct config_entry config_table[] = {
>  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
>  	{
>  		.flags = FLAG_SST,
> -		.device = 0x9d70,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
>  				.ident = "Google Chromebooks",
> @@ -123,14 +123,14 @@ static const struct config_entry config_table[] = {
>  	},
>  	{
>  		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
> -		.device = 0x9d70,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
>  	},
>  #endif
>  /* Kabylake-LP */
>  #if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
>  	{
>  		.flags = FLAG_SST,
> -		.device = 0x9d71,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
>  				.ident = "Google Chromebooks",
> @@ -143,7 +143,7 @@ static const struct config_entry config_table[] = {
>  	},
>  	{
>  		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
> -		.device = 0x9d71,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
>  	},
>  #endif
>  
> @@ -155,7 +155,7 @@ static const struct config_entry config_table[] = {
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x3198,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_GML,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
>  				.ident = "Google Chromebooks",
> @@ -168,7 +168,7 @@ static const struct config_entry config_table[] = {
>  	},
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x3198,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_GML,
>  		.codec_hid =  &essx_83x6,
>  	},
>  #endif
> @@ -188,7 +188,7 @@ static const struct config_entry config_table[] = {
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x9dc8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_LP,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
>  				.ident = "Google Chromebooks",
> @@ -207,12 +207,12 @@ static const struct config_entry config_table[] = {
>  	},
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x09dc8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_LP,
>  		.codec_hid =  &essx_83x6,
>  	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x9dc8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_LP,
>  	},
>  #endif
>  
> @@ -220,7 +220,7 @@ static const struct config_entry config_table[] = {
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0xa348,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_H,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
>  				.ident = "Google Chromebooks",
> @@ -233,7 +233,7 @@ static const struct config_entry config_table[] = {
>  	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0xa348,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_CNL_H,
>  	},
>  #endif
>  
> @@ -241,7 +241,7 @@ static const struct config_entry config_table[] = {
>  /* Cometlake-LP */
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x02c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
>  				.ident = "Google Chromebooks",
> @@ -267,17 +267,17 @@ static const struct config_entry config_table[] = {
>  	},
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x02c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
>  		.codec_hid =  &essx_83x6,
>  	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x02c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
>  	},
>  /* Cometlake-H */
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x06c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_CML_H,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
>  				.matches = {
> @@ -296,12 +296,12 @@ static const struct config_entry config_table[] = {
>  	},
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x06c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_CML_H,
>  		.codec_hid =  &essx_83x6,
>  	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x06c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_CML_H,
>  	},
>  #endif
>  
> @@ -309,7 +309,7 @@ static const struct config_entry config_table[] = {
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x34c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ICL_LP,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
>  				.ident = "Google Chromebooks",
> @@ -322,12 +322,12 @@ static const struct config_entry config_table[] = {
>  	},
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x34c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ICL_LP,
>  		.codec_hid =  &essx_83x6,
>  	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x34c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ICL_LP,
>  	},
>  #endif
>  
> @@ -335,7 +335,7 @@ static const struct config_entry config_table[] = {
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x4dc8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_JSL_N,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
>  				.ident = "Google Chromebooks",
> @@ -348,12 +348,12 @@ static const struct config_entry config_table[] = {
>  	},
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x4dc8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_JSL_N,
>  		.codec_hid =  &essx_83x6,
>  	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
> -		.device = 0x4dc8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_JSL_N,
>  	},
>  #endif
>  
> @@ -361,7 +361,7 @@ static const struct config_entry config_table[] = {
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0xa0c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_TGL_LP,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
>  				.ident = "Google Chromebooks",
> @@ -380,16 +380,16 @@ static const struct config_entry config_table[] = {
>  	},
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0xa0c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_TGL_LP,
>  		.codec_hid =  &essx_83x6,
>  	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0xa0c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_TGL_LP,
>  	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x43c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_TGL_H,
>  	},
>  #endif
>  
> @@ -397,78 +397,69 @@ static const struct config_entry config_table[] = {
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
> -		.device = 0x4b55,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_EHL_0,
>  	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
> -		.device = 0x4b58,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_EHL_3,
>  	},
>  #endif
>  
> -/* Alder Lake */
> +/* Alder Lake / Raptor Lake */
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
> -	/* Alderlake-S */
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x7ad0,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_S,
>  	},
> -	/* RaptorLake-S */
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x7a50,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_S,
>  	},
> -	/* Alderlake-P */
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x51c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
>  		.codec_hid =  &essx_83x6,
>  	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x51c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
>  	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x51cd,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PX,
>  	},
> -	/* Alderlake-PS */
>  	{
>  		.flags = FLAG_SOF,
> -		.device = 0x51c9,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PS,
>  		.codec_hid =  &essx_83x6,
>  	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x51c9,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PS,
>  	},
> -	/* Alderlake-M */
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x51cc,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_M,
>  	},
> -	/* Alderlake-N */
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x54c8,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_N,
>  	},
> -	/* RaptorLake-P */
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x51ca,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_0,
>  	},
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x51cb,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_1,
>  	},
> -	/* RaptorLake-M */
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x51ce,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_M,
>  	},
> -	/* RaptorLake-PX */
>  	{
>  		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> -		.device = 0x51cf,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_PX,
>  	},
>  #endif
>  
> @@ -549,7 +540,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>  	const struct config_entry *cfg;
>  
>  	/* Intel vendor only */
> -	if (pci->vendor != 0x8086)
> +	if (pci->vendor != PCI_VENDOR_ID_INTEL)
>  		return SND_INTEL_DSP_DRIVER_ANY;
>  
>  	/*
> @@ -557,12 +548,12 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>  	 * for HDMI/DP support, ignore kernel parameter
>  	 */
>  	switch (pci->device) {
> -	case 0x160c: /* Broadwell */
> -	case 0x0a0c: /* Haswell */
> -	case 0x0c0c:
> -	case 0x0d0c:
> -	case 0x0f04: /* Baytrail */
> -	case 0x2284: /* Braswell */
> +	case PCI_DEVICE_ID_INTEL_HDA_BDW:
> +	case PCI_DEVICE_ID_INTEL_HDA_HSW_0:
> +	case PCI_DEVICE_ID_INTEL_HDA_HSW_2:
> +	case PCI_DEVICE_ID_INTEL_HDA_HSW_3:
> +	case PCI_DEVICE_ID_INTEL_HDA_BYT:
> +	case PCI_DEVICE_ID_INTEL_HDA_BSW:
>  		return SND_INTEL_DSP_DRIVER_ANY;
>  	}
>  
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


