Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD7374F063
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:39:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6001DAE8;
	Tue, 11 Jul 2023 15:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6001DAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689082751;
	bh=sDKsooMzYAP81kDUoSO2n2MLd1qZqSlgq3mclaJSUS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DKmopVzvcUsBIQqKxpBZqWdhHcrPqbCnt+R5lpo0CuTlo4fwLegCceEDlUXjQbJgb
	 j1rHSw8IbBW8Eu8LQ0C++ImmsjZ9leO1BYX2IswXmabKywB+dnNlLSyglFfpiv1wIW
	 9hs5q/ZRjDH4xRPc7yYcvBdtLFa2X4p3kPqROMyA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9803F80249; Tue, 11 Jul 2023 15:38:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42330F80249;
	Tue, 11 Jul 2023 15:38:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78400F80249; Tue, 11 Jul 2023 15:37:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C826DF800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 15:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C826DF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bjqi/1eg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689082673; x=1720618673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sDKsooMzYAP81kDUoSO2n2MLd1qZqSlgq3mclaJSUS4=;
  b=bjqi/1egSO2Hhz19wDxpKtRlXlsHK6cChir24J20MevezBBgCQXi8IQM
   jcYqqIhuX4Cm4qJ3m78Q4w3LkTmgFCbPxUxT4yeKwtnAIfvTyqeKouaeG
   4/p8JaLDuRYOXtMhRFnAn4S11CktLnZhV4mGkPoFxAQDA2RhQQLAtlM55
   cjZuoX8eMRN0aj6TRgE4Zq5uZDocsD9RvAvTuFNfbDvqDyIRFk1a8FJsq
   wGroazh+XRTp3/qjAoxyJxQvCXpuSUlC7Z64SQYngZihsDU2Xzpoxa5TC
   PUagPeqra19tO8KxTw9KyOvgqshNup0v9qWRDvAW6xmNfoP7feIFF/62d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="428315948"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="428315948"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 06:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="721091183"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="721091183"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 11 Jul 2023 06:37:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJDYi-001rVJ-1K;
	Tue, 11 Jul 2023 16:37:40 +0300
Date: Tue, 11 Jul 2023 16:37:40 +0300
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
Subject: Re: [PATCH 04/13] ALSA: hda: Use global PCI match macro
Message-ID: <ZK1bJJpZLv75acvc@smile.fi.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-5-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711125726.3509391-5-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: YXCVXMMPZSBKHY3QKMXMXECHQOBNYZDQ
X-Message-ID-Hash: YXCVXMMPZSBKHY3QKMXMXECHQOBNYZDQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YXCVXMMPZSBKHY3QKMXMXECHQOBNYZDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 02:57:17PM +0200, Amadeusz Sławiński wrote:
> Instead of using local macro to match PCI device, use global one.

I believe from the previous discussion that this one needs a couple of words
w.r.t. BXT --> APL change.

Otherwise, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/pci/hda/hda_intel.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index ef831770ca7d..143efa54b9bf 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -330,18 +330,6 @@ enum {
>  #define needs_eld_notify_link(chip)	false
>  #endif
>  
> -#define CONTROLLER_IN_GPU(pci) (((pci)->vendor == 0x8086) &&         \
> -				       (((pci)->device == 0x0a0c) || \
> -					((pci)->device == 0x0c0c) || \
> -					((pci)->device == 0x0d0c) || \
> -					((pci)->device == 0x160c) || \
> -					((pci)->device == 0x490d) || \
> -					((pci)->device == 0x4f90) || \
> -					((pci)->device == 0x4f91) || \
> -					((pci)->device == 0x4f92)))
> -
> -#define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
> -
>  static const char * const driver_short_names[] = {
>  	[AZX_DRIVER_ICH] = "HDA Intel",
>  	[AZX_DRIVER_PCH] = "HDA Intel PCH",
> @@ -573,7 +561,7 @@ static void hda_intel_init_chip(struct azx *chip, bool full_reset)
>  	snd_hdac_set_codec_wakeup(bus, false);
>  
>  	/* reduce dma latency to avoid noise */
> -	if (IS_BXT(pci))
> +	if (HDA_CONTROLLER_IS_APL(pci))
>  		bxt_reduce_dma_latency(chip);
>  
>  	if (bus->mlcap != NULL)
> @@ -2175,7 +2163,7 @@ static int azx_probe(struct pci_dev *pci,
>  #endif /* CONFIG_SND_HDA_PATCH_LOADER */
>  
>  #ifndef CONFIG_SND_HDA_I915
> -	if (CONTROLLER_IN_GPU(pci))
> +	if (HDA_CONTROLLER_IN_GPU(pci))
>  		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SND_HDA_I915\n");
>  #endif
>  
> @@ -2283,7 +2271,7 @@ static int azx_probe_continue(struct azx *chip)
>  			 * for other chips, still continue probing as other
>  			 * codecs can be on the same link.
>  			 */
> -			if (CONTROLLER_IN_GPU(pci)) {
> +			if (HDA_CONTROLLER_IN_GPU(pci)) {
>  				dev_err(chip->card->dev,
>  					"HSW/BDW HD-audio HDMI/DP requires binding with gfx driver\n");
>  				goto out_free;
> @@ -2294,7 +2282,7 @@ static int azx_probe_continue(struct azx *chip)
>  		}
>  
>  		/* HSW/BDW controllers need this power */
> -		if (CONTROLLER_IN_GPU(pci))
> +		if (HDA_CONTROLLER_IN_GPU(pci))
>  			hda->need_i915_power = true;
>  	}
>  
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


