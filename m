Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F9F74F049
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:37:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D82F4BC0;
	Tue, 11 Jul 2023 15:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D82F4BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689082656;
	bh=524GPqhKA4PY07IMonLbtpmWvOSiTrizz3nlKdExsX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vMsUVF3CzCIINoOU2DzNsEoSC0OLvLWSNhX3fP3U5m0eKHAiUCfo8jM3nKqw9oJX8
	 LVLN1a+pCdrkL1tF8E8JSVeZWhbu2EFOc1kYncvR/nEu+k3y28FFHFeE8VQz5qp3oH
	 zmex86648o2ewb9hJKvJiX1dW2jVnPNM+xNCmkMA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 290B4F80236; Tue, 11 Jul 2023 15:36:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68274F80236;
	Tue, 11 Jul 2023 15:36:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D75C8F80249; Tue, 11 Jul 2023 15:36:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9838BF800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 15:36:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9838BF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nkOKQ0YX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689082577; x=1720618577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=524GPqhKA4PY07IMonLbtpmWvOSiTrizz3nlKdExsX0=;
  b=nkOKQ0YXpxf6d6HtXhT/V31Qum1ig54FxXL9x4QAtYAkoPhm5jz+i2V5
   E44L/BqpgC9rMFXcQOBqjqWRvkp+xdFvzYEslgy0HjbNRub24fzsPkpQa
   47OB/vCDB/mh7FjPzQkhWwjqBea5UP7LlTALe5OAjIvhfrIIaftYZTjCl
   VeqMvRftRhfE115jFVHAwZ9fJ19uBXdfSkTDNPmCqOZJ4ds6WBHLh5aLD
   RVPTtZRG5+WvMTMXMvSs1vsSIv0Zc18emu/3SyTSCUbTCtHG+zoq+PHtE
   +EMT17I7D0TbhBFSmzT/hnJ+TqiGbrTZJbtQHaXHnad/DwfTwmv2ppBpW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="364656340"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="364656340"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 06:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="724436510"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="724436510"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jul 2023 06:36:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJDXF-001rTm-0r;
	Tue, 11 Jul 2023 16:36:09 +0300
Date: Tue, 11 Jul 2023 16:36:09 +0300
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
Subject: Re: [PATCH 03/13] ALSA: hda: Add controller matching macros
Message-ID: <ZK1ayXcoTfIrr18V@smile.fi.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-4-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711125726.3509391-4-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: ADS7IKNIWS4APDSDIC4EYT7F44QCSBLC
X-Message-ID-Hash: ADS7IKNIWS4APDSDIC4EYT7F44QCSBLC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ADS7IKNIWS4APDSDIC4EYT7F44QCSBLC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 02:57:16PM +0200, Amadeusz Sławiński wrote:
> Some HDA controllers require additional handling, so there are macros to
> match them, however those are spread across multiple files. Add them all
> in one place, so they can be reused.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

One nit-pick below.

> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  include/sound/hdaudio.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> index 2ffdf58bd6d4..aacacca456d5 100644
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -11,6 +11,7 @@
>  #include <linux/io.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/iopoll.h>
> +#include <linux/pci.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/timecounter.h>
>  #include <sound/core.h>
> @@ -704,4 +705,30 @@ static inline unsigned int snd_array_index(struct snd_array *array, void *ptr)
>  	for ((idx) = 0, (ptr) = (array)->list; (idx) < (array)->used; \
>  	     (ptr) = snd_array_elem(array, ++(idx)))
>  
> +/*
> + * Device matching
> + */
> +
> +#define HDA_CONTROLLER_IS_HSW(pci) (pci_match_id((struct pci_device_id []){ \
> +			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_HSW_0) }, \
> +			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_HSW_2) }, \
> +			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_HSW_3) }, \
> +			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_BDW) }, \
> +			{ } \
> +		}, pci))
> +
> +#define HDA_CONTROLLER_IS_APL(pci) (pci_match_id((struct pci_device_id []){ \
> +			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_APL) }, \
> +			{ } \
> +		}, pci))
> +
> +#define HDA_CONTROLLER_IN_GPU(pci) (HDA_CONTROLLER_IS_HSW(pci) || \
> +		pci_match_id((struct pci_device_id []){ \

I think if you start with pci_match_id() and move HDA_CONTROLLER_IS_HSW() at
the end it will make this macro aligned with the rest, so easier to get them
all at once.

> +			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG1) }, \
> +			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG2_0) }, \
> +			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG2_1) }, \
> +			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG2_2) }, \
> +			{ } \
> +		}, pci))

-- 
With Best Regards,
Andy Shevchenko


