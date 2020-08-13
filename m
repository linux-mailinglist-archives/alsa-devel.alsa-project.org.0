Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42091243F15
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 20:58:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCB64166B;
	Thu, 13 Aug 2020 20:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCB64166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597345134;
	bh=3y1YW2BWHgEIDQ3Df4cWrHlizYkAbJYpZEqeeCMI6kU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PNhRFvezgK6brPUGwOnjRCQjtPm2PTcaPmavzG7gtkYhYTBBtZQ1HQmf3yDkahMjQ
	 jSigxZnt2z6MwKOI5wx4bWzCHkiHruhz8UHAJMT2GBHNpXTbI0szF86v4pLcG8C4jQ
	 Q/Pp9H/dmz90qJUE/FZi92/L0Dj4zP8xiEpwlWYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22DFDF801A3;
	Thu, 13 Aug 2020 20:57:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 063FEF80171; Thu, 13 Aug 2020 20:57:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C81D8F80161
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 20:57:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C81D8F80161
IronPort-SDR: VwagBvaB1cWdiAsr8zMZNkfy5WbtOBkSwXlAEDpNrjVedYUNtIT9oQUyoX4BxBepIZBeyGo7Qw
 Gr4ficZfopww==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="142155212"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="142155212"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 11:57:02 -0700
IronPort-SDR: AOJELhDlCbYqmzkVy+CY3x4LbPMl0zUNhGIYS3blRuAU9J1j+lIHkAHeSowvnaxmd68rrKFHyP
 d9RzkVYdGQ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="325507891"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 13 Aug 2020 11:56:58 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k6IPJ-008UvG-9i; Thu, 13 Aug 2020 21:56:57 +0300
Date: Thu, 13 Aug 2020 21:56:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 12/13] ASoC: Intel: bdw-5650: Remove haswell-solution
 specific code
Message-ID: <20200813185657.GE1891694@smile.fi.intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-13-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812205753.29115-13-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Aug 12, 2020 at 10:57:52PM +0200, Cezary Rojewski wrote:
> Remove code specific to sound/soc/intel/haswell. Update BE dai_link
> definition to provide seamless transition to catpt solution.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/boards/bdw-rt5650.c | 36 -----------------------------
>  1 file changed, 36 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
> index ce7320916b22..c5820787c53e 100644
> --- a/sound/soc/intel/boards/bdw-rt5650.c
> +++ b/sound/soc/intel/boards/bdw-rt5650.c
> @@ -16,9 +16,6 @@
>  #include <sound/soc.h>
>  #include <sound/soc-acpi.h>
>  
> -#include "../common/sst-dsp.h"
> -#include "../haswell/sst-haswell-ipc.h"
> -
>  #include "../../codecs/rt5645.h"
>  
>  struct bdw_rt5650_priv {
> @@ -138,30 +135,6 @@ static struct snd_soc_ops bdw_rt5650_ops = {
>  	.hw_params = bdw_rt5650_hw_params,
>  };
>  
> -#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
> -static int bdw_rt5650_rtd_init(struct snd_soc_pcm_runtime *rtd)
> -{
> -	struct snd_soc_component *component =
> -		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
> -	struct sst_pdata *pdata = dev_get_platdata(component->dev);
> -	struct sst_hsw *broadwell = pdata->dsp;
> -	int ret;
> -
> -	/* Set ADSP SSP port settings
> -	 * clock_divider = 4 means BCLK = MCLK/5 = 24MHz/5 = 4.8MHz
> -	 */
> -	ret = sst_hsw_device_set_config(broadwell, SST_HSW_DEVICE_SSP_0,
> -		SST_HSW_DEVICE_MCLK_FREQ_24_MHZ,
> -		SST_HSW_DEVICE_TDM_CLOCK_MASTER, 4);
> -	if (ret < 0) {
> -		dev_err(rtd->dev, "error: failed to set device config\n");
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -#endif
> -
>  static const unsigned int channels[] = {
>  	2, 4,
>  };
> @@ -251,10 +224,8 @@ SND_SOC_DAILINK_DEF(platform,
>  SND_SOC_DAILINK_DEF(be,
>  	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5650:00", "rt5645-aif1")));
>  
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
>  SND_SOC_DAILINK_DEF(ssp0_port,
>  	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
> -#endif
>  
>  static struct snd_soc_dai_link bdw_rt5650_dais[] = {
>  	/* Front End DAI links */
> @@ -263,9 +234,6 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
>  		.stream_name = "System Playback",
>  		.dynamic = 1,
>  		.ops = &bdw_rt5650_fe_ops,
> -#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
> -		.init = bdw_rt5650_rtd_init,
> -#endif
>  		.trigger = {
>  			SND_SOC_DPCM_TRIGGER_POST,
>  			SND_SOC_DPCM_TRIGGER_POST
> @@ -289,11 +257,7 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
>  		.dpcm_playback = 1,
>  		.dpcm_capture = 1,
>  		.init = bdw_rt5650_init,
> -#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
> -		SND_SOC_DAILINK_REG(dummy, be, dummy),
> -#else
>  		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
> -#endif
>  	},
>  };
>  
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


