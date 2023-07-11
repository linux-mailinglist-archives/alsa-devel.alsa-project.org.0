Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8520874F07A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:42:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D94E4A4A;
	Tue, 11 Jul 2023 15:41:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D94E4A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689082952;
	bh=dxME0Zys7vT/pFBpwkj80hNNsU8yTqns5rOzcHDTwMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VQZEV720bf+OwNIRvrgQafS37+ijMhEAtD0DDgGLopFrNsV/Mah6ZXdHdKt/2h7SO
	 DPivrIanG0JZtBqDSqTiUYd8/rV4oSldzBge4GWi6oq982Ad30No35eIiq+QDZyYDH
	 WoeblKy2DDfWkMryaql9YdcbUC2tY2QdKKJIJnAo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 975D7F80153; Tue, 11 Jul 2023 15:41:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6021CF80236;
	Tue, 11 Jul 2023 15:41:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D997F80249; Tue, 11 Jul 2023 15:41:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E306F80153
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 15:41:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E306F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UrRWY6vz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689082897; x=1720618897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dxME0Zys7vT/pFBpwkj80hNNsU8yTqns5rOzcHDTwMQ=;
  b=UrRWY6vzbmlVw06Ngbal/+m7mK+FRXdvdeZKdGz9ZPzoDMegXq39ZpFa
   ++mHwYa/jxt6/RrrzkRs7hjehvkrvAgYtELh/A9D1YfHMLZUXM+DpGMsp
   1bvMDmosrliT2pU+EGuaWaguK09AM0Q1mynghaDy1D60UlT4BvH7NrOxj
   xDuUFHd2zCmsZQQ3iuvg84nBlm+7gGh+2rUWRJTwCNAh8Zd6Nwv6TZ8XS
   cntakHP0RxvaXeF5X2FAqyi7XsmTmKkP529rU5LruL3mc4xOQNlhqpIAX
   ZxFAp8OrbLNIeIwZt/elB6ZgcKz71tSGWsWMPrLt+WUfLphGtuiaaeRqe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367198503"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="367198503"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 06:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="865735985"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="865735985"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2023 06:41:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJDcL-001rY7-2H;
	Tue, 11 Jul 2023 16:41:25 +0300
Date: Tue, 11 Jul 2023 16:41:25 +0300
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
Subject: Re: [PATCH 06/13] ASoC: Intel: Skylake: Use global PCI match macro
Message-ID: <ZK1cBWO4KWFDJMcA@smile.fi.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-7-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711125726.3509391-7-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 2BS5REDFU4T6DCEWXQZEMRM6KMFP4KK3
X-Message-ID-Hash: 2BS5REDFU4T6DCEWXQZEMRM6KMFP4KK3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2BS5REDFU4T6DCEWXQZEMRM6KMFP4KK3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 02:57:19PM +0200, Amadeusz Sławiński wrote:
> Instead of using local macro to match PCI device, use global one.

Same comment as per another patch, i.e. explain CFL/BXT --> APL (*).
With that,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

*) I think it's something like "the BXT/APL/CFL line of SoCs has the same
(compatible?) HDA IP blablabla".

> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  include/sound/hda_codec.h         | 3 ---
>  sound/soc/intel/skylake/skl-pcm.c | 3 ++-
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
> index bbb7805e85d8..5497dc9c396a 100644
> --- a/include/sound/hda_codec.h
> +++ b/include/sound/hda_codec.h
> @@ -18,9 +18,6 @@
>  #include <sound/hda_verbs.h>
>  #include <sound/hda_regmap.h>
>  
> -#define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
> -#define IS_CFL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0xa348)
> -
>  /*
>   * Structures
>   */
> diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
> index a4209d88b0c6..ac3dc8c63c26 100644
> --- a/sound/soc/intel/skylake/skl-pcm.c
> +++ b/sound/soc/intel/skylake/skl-pcm.c
> @@ -13,6 +13,7 @@
>  #include <linux/pci.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/delay.h>
> +#include <sound/hdaudio.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
>  #include "skl.h"
> @@ -152,7 +153,7 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
>  	 * The recommended SDxFMT programming sequence for BXT
>  	 * platforms is to couple the stream before writing the format
>  	 */
> -	if (IS_BXT(skl->pci)) {
> +	if (HDA_CONTROLLER_IS_APL(skl->pci)) {
>  		snd_hdac_ext_stream_decouple(bus, stream, false);
>  		err = snd_hdac_stream_setup(hdac_stream(stream));
>  		snd_hdac_ext_stream_decouple(bus, stream, true);
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


