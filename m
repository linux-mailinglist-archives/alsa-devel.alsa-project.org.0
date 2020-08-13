Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37320243F16
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 20:59:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3468847;
	Thu, 13 Aug 2020 20:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3468847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597345152;
	bh=9XQZIxbRk9IKMv4X7LOcwnMcSr/AN8kfM3/9DHFsxnA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eN93FJOnhglde2G1VTo/ExHlYoi5lpuP9ujBqIi7cLMRp7rZXoPbEDpOEys3Q4wNb
	 gy3a0ez+leMksADgBUS1j1PLsxVoJWpkgFByrLRBpD8q1FMIFTwI7prdQvJR2B8k4Z
	 X1OHrooYUWYo6ldjqfHTFZB7YSaE98b0BvWY3H6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EB42F80100;
	Thu, 13 Aug 2020 20:58:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AED95F8015B; Thu, 13 Aug 2020 20:58:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90F2BF80100
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 20:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90F2BF80100
IronPort-SDR: lllIrPU6ZhdyVqMb741oEz/l/9i/jJSNLhpN9SREpsRjCmmeY4EwYxf8QrRpZAFq3ApBzXcdyT
 rWVrns075Nvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="215834126"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="215834126"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 11:58:05 -0700
IronPort-SDR: 4/IwmvhRKGVWonzq8hSKzXl9xFUnMhDLtFgfcRV0XKFxa3yAOZrEKc+yZa/C1TwgToCxQKz1Ya
 8+SRcR+Yhu7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="325508217"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 13 Aug 2020 11:58:01 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k6IQJ-008Uvw-MS; Thu, 13 Aug 2020 21:57:59 +0300
Date: Thu, 13 Aug 2020 21:57:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 10/13] ASoC: Intel: haswell: Remove haswell-solution
 specific code
Message-ID: <20200813185759.GG1891694@smile.fi.intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-11-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812205753.29115-11-cezary.rojewski@intel.com>
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

On Wed, Aug 12, 2020 at 10:57:50PM +0200, Cezary Rojewski wrote:
> Remove code specific to sound/soc/intel/haswell. Update BE dai_link
> definition to provide seamless transition to catpt solution.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/boards/haswell.c | 28 ++++------------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/haswell.c b/sound/soc/intel/boards/haswell.c
> index 744b7b5b8106..c268405e5594 100644
> --- a/sound/soc/intel/boards/haswell.c
> +++ b/sound/soc/intel/boards/haswell.c
> @@ -13,9 +13,6 @@
>  #include <sound/soc-acpi.h>
>  #include <sound/pcm_params.h>
>  
> -#include "../common/sst-dsp.h"
> -#include "../haswell/sst-haswell-ipc.h"
> -
>  #include "../../codecs/rt5640.h"
>  
>  /* Haswell ULT platforms have a Headphone and Mic jack */
> @@ -77,25 +74,6 @@ static const struct snd_soc_ops haswell_rt5640_ops = {
>  	.hw_params = haswell_rt5640_hw_params,
>  };
>  
> -static int haswell_rtd_init(struct snd_soc_pcm_runtime *rtd)
> -{
> -	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
> -	struct sst_pdata *pdata = dev_get_platdata(component->dev);
> -	struct sst_hsw *haswell = pdata->dsp;
> -	int ret;
> -
> -	/* Set ADSP SSP port settings */
> -	ret = sst_hsw_device_set_config(haswell, SST_HSW_DEVICE_SSP_0,
> -		SST_HSW_DEVICE_MCLK_FREQ_24_MHZ,
> -		SST_HSW_DEVICE_CLOCK_MASTER, 9);
> -	if (ret < 0) {
> -		dev_err(rtd->dev, "failed to set device config\n");
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  SND_SOC_DAILINK_DEF(dummy,
>  	DAILINK_COMP_ARRAY(COMP_DUMMY()));
>  
> @@ -117,13 +95,15 @@ SND_SOC_DAILINK_DEF(codec,
>  SND_SOC_DAILINK_DEF(platform,
>  	DAILINK_COMP_ARRAY(COMP_PLATFORM("haswell-pcm-audio")));
>  
> +SND_SOC_DAILINK_DEF(ssp0_port,
> +	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
> +
>  static struct snd_soc_dai_link haswell_rt5640_dais[] = {
>  	/* Front End DAI links */
>  	{
>  		.name = "System",
>  		.stream_name = "System Playback/Capture",
>  		.dynamic = 1,
> -		.init = haswell_rtd_init,
>  		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
>  		.dpcm_playback = 1,
>  		.dpcm_capture = 1,
> @@ -167,7 +147,7 @@ static struct snd_soc_dai_link haswell_rt5640_dais[] = {
>  		.ops = &haswell_rt5640_ops,
>  		.dpcm_playback = 1,
>  		.dpcm_capture = 1,
> -		SND_SOC_DAILINK_REG(dummy, codec, dummy),
> +		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
>  	},
>  };
>  
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


