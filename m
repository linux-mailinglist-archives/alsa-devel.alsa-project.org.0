Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ADD74F06C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:40:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 626A7BC0;
	Tue, 11 Jul 2023 15:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 626A7BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689082821;
	bh=SvVZcp0S2hY+uXhZp9wo8Qq7oQErKF5vDvaioaBE7KI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pg6CloU2PadjgYTKsqadAkAoHUAy0Rwwk3BSCu3zs1oPF4ULNTj/bAQ3VyntIaZu7
	 JfAn6EwP5NSDRPxb6VSFZ4RxLGV6bfA7nCbpvWqFowO6TYESFL3CM/Wl8yQUDWnzq8
	 L6Df+J1FHaPw8lr0OAKrEz995VdeHC8xNHQJS774=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32078F8053B; Tue, 11 Jul 2023 15:39:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D76FCF80236;
	Tue, 11 Jul 2023 15:39:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EB22F80249; Tue, 11 Jul 2023 15:39:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CCBBF800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 15:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CCBBF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ddeY+mZ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689082765; x=1720618765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SvVZcp0S2hY+uXhZp9wo8Qq7oQErKF5vDvaioaBE7KI=;
  b=ddeY+mZ8pl65Y0QyNiwIT4b+wTwwqz5OGsartpUr9YIQozytPbgYLCmW
   N49yZgzuhsxiovesdkQ+ehUDCmBQ9un1OjrcrEU4umIaZgySKXtu6/IJQ
   hfpAbLgOEp8v7J2KVPM7HMeXzcDRm2oM50P26EP3DjIkl3AiK94JHpHbx
   RwO+nljGNtmumv0VYVUbeUVXgCc1avPx3IHLbOqKf8IZFqzoLla3q9821
   PhhqBbc61ufnX7rnB2fc7vHuMQAtfUG4mPJDrvY9TbHmje1nCwXYW8rG2
   agF16gEbDdlaCMmf6jacGeS9dWo+XVy9pXOYSU/BfTJCcGd/yuNyMXUkn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367197980"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="367197980"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 06:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="865735211"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="865735211"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2023 06:39:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJDa4-001rWK-1b;
	Tue, 11 Jul 2023 16:39:04 +0300
Date: Tue, 11 Jul 2023 16:39:04 +0300
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
Subject: Re: [PATCH 05/13] ALSA: hda/i915:  Use global PCI match macro
Message-ID: <ZK1beJ3eI3wIxeJx@smile.fi.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-6-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711125726.3509391-6-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 6V2DZM4VG2VYSF3WCWOLPEPO7A5WCSA3
X-Message-ID-Hash: 6V2DZM4VG2VYSF3WCWOLPEPO7A5WCSA3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6V2DZM4VG2VYSF3WCWOLPEPO7A5WCSA3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 02:57:18PM +0200, Amadeusz Sławiński wrote:
> Instead of using local macro to match PCI device, use global one.

FWIW,

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/hda/hdac_i915.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index 161a9711cd63..2a451ff4fe6a 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -11,11 +11,6 @@
>  #include <sound/hda_i915.h>
>  #include <sound/hda_register.h>
>  
> -#define IS_HSW_CONTROLLER(pci) (((pci)->device == 0x0a0c) || \
> -				((pci)->device == 0x0c0c) || \
> -				((pci)->device == 0x0d0c) || \
> -				((pci)->device == 0x160c))
> -
>  /**
>   * snd_hdac_i915_set_bclk - Reprogram BCLK for HSW/BDW
>   * @bus: HDA core bus
> @@ -39,7 +34,7 @@ void snd_hdac_i915_set_bclk(struct hdac_bus *bus)
>  
>  	if (!acomp || !acomp->ops || !acomp->ops->get_cdclk_freq)
>  		return; /* only for i915 binding */
> -	if (!IS_HSW_CONTROLLER(pci))
> +	if (!HDA_CONTROLLER_IS_HSW(pci))
>  		return; /* only HSW/BDW */
>  
>  	cdclk_freq = acomp->ops->get_cdclk_freq(acomp->dev);
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


