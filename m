Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C83243F2B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 21:06:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03710166A;
	Thu, 13 Aug 2020 21:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03710166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597345560;
	bh=74QDyBzt+ae9em00OilWN0C8ASWMeGsoY7swkOuwJ14=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pMp/a0ccv1vHGU69YTnHUaeHu1KiQs69Lk2ELNeY6gmbcRWHB+S0DRFI5WpJW6MZr
	 u0iWbnjuHCp/2TpcpkVI+D48JmYLiQBAexGD70Ci3LeuRCjjcuB4HvNlxYdPvWexrp
	 4suUEI6z2Umps5kgpsuHvUSo02q8rC6Bpn3V3Yac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11DEBF8014C;
	Thu, 13 Aug 2020 21:04:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25188F80161; Thu, 13 Aug 2020 21:04:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F0B6F800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 21:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F0B6F800F4
IronPort-SDR: O6U4DD+OqHYdVyo54GM8Jbk0pvGKF+jQMvdDk7sld+HC/L3nuFXFbFNm5Yw1df3SFwF3CGyMyA
 l/Klhk/803dA==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="239139676"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="239139676"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 12:04:03 -0700
IronPort-SDR: tIgetsvPhostzCu6sSXuT8wVOjAN9fyQ5KqIU2V+OPQZTK1gBxegJhFMUesmigmqf7T1Lg9cLz
 kgi3jghbq3NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="325510074"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 13 Aug 2020 12:03:59 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k6IPm-008Uve-0V; Thu, 13 Aug 2020 21:57:26 +0300
Date: Thu, 13 Aug 2020 21:57:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 13/13] ASoC: Intel: bdw-5677: Remove haswell-solution
 specific code
Message-ID: <20200813185725.GF1891694@smile.fi.intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-14-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812205753.29115-14-cezary.rojewski@intel.com>
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

On Wed, Aug 12, 2020 at 10:57:53PM +0200, Cezary Rojewski wrote:
> Remove code specific to sound/soc/intel/haswell. Update BE dai_link
> definition to provide seamless transition to catpt solution.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/boards/bdw-rt5677.c | 33 -----------------------------
>  1 file changed, 33 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
> index 86e427e3822f..4451957fc170 100644
> --- a/sound/soc/intel/boards/bdw-rt5677.c
> +++ b/sound/soc/intel/boards/bdw-rt5677.c
> @@ -17,9 +17,6 @@
>  #include <sound/jack.h>
>  #include <sound/soc-acpi.h>
>  
> -#include "../common/sst-dsp.h"
> -#include "../haswell/sst-haswell-ipc.h"
> -
>  #include "../../codecs/rt5677.h"
>  
>  struct bdw_rt5677_priv {
> @@ -201,27 +198,6 @@ static const struct snd_soc_ops bdw_rt5677_dsp_ops = {
>  	.hw_params = bdw_rt5677_dsp_hw_params,
>  };
>  
> -#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
> -static int bdw_rt5677_rtd_init(struct snd_soc_pcm_runtime *rtd)
> -{
> -	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
> -	struct sst_pdata *pdata = dev_get_platdata(component->dev);
> -	struct sst_hsw *broadwell = pdata->dsp;
> -	int ret;
> -
> -	/* Set ADSP SSP port settings */
> -	ret = sst_hsw_device_set_config(broadwell, SST_HSW_DEVICE_SSP_0,
> -		SST_HSW_DEVICE_MCLK_FREQ_24_MHZ,
> -		SST_HSW_DEVICE_CLOCK_MASTER, 9);
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
>  	2,
>  };
> @@ -333,10 +309,8 @@ SND_SOC_DAILINK_DEF(platform,
>  SND_SOC_DAILINK_DEF(be,
>  	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-RT5677CE:00", "rt5677-aif1")));
>  
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
>  SND_SOC_DAILINK_DEF(ssp0_port,
>  	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
> -#endif
>  
>  /* Wake on voice interface */
>  SND_SOC_DAILINK_DEFS(dsp,
> @@ -350,9 +324,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
>  		.name = "System PCM",
>  		.stream_name = "System Playback/Capture",
>  		.dynamic = 1,
> -#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
> -		.init = bdw_rt5677_rtd_init,
> -#endif
>  		.trigger = {
>  			SND_SOC_DPCM_TRIGGER_POST,
>  			SND_SOC_DPCM_TRIGGER_POST
> @@ -387,11 +358,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
>  		.dpcm_capture = 1,
>  		.init = bdw_rt5677_init,
>  		.exit = bdw_rt5677_exit,
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


