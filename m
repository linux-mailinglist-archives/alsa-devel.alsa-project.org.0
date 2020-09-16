Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F0A26C499
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 17:52:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8879167D;
	Wed, 16 Sep 2020 17:51:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8879167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600271525;
	bh=eDSL5wHnBf/+XTBgMp68fhkXzh7/ANnGHxvdJg9YiPM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EgOFMac6RtW+iSt+F6ayyxILoejYrBidstFlw7xpUO4IfQRuQL/InPbHPSh2Sm3yc
	 ZnZ0Qw7H2BVBIAC2g2k0yXe+8/FxXySznE8wWtwFJd35VPRG9zbQk2DRopuWQKnnSr
	 6/ElMHaRe4ysTWyY3u/hR08XsqKUvZOeuJzBwTHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D579FF800BB;
	Wed, 16 Sep 2020 17:50:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C83F3F8015A; Wed, 16 Sep 2020 17:50:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C2B1F800BB
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 17:50:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C2B1F800BB
IronPort-SDR: 8Vk+aITyUEurvdbbl4IaXW7jSKhpeMLbMuse51eOz1GFURbVsgL/NRyEKbtRECzeCTfTNv1gVY
 zW3wz8dwzwoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="244335996"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="244335996"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 08:50:08 -0700
IronPort-SDR: asoHghpfg15Q+cr/TtSOIGeNmvzjNzi3Uwmx6unIvyVpq8F6xTEcinIcrGuWUUjAJxRmc7MOsc
 Eeu6+o1bLa9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="336067170"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 16 Sep 2020 08:50:03 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kIZh2-00H7Gm-D1; Wed, 16 Sep 2020 18:50:00 +0300
Date: Wed, 16 Sep 2020 18:50:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v5 10/13] ASoC: Intel: haswell: Remove haswell-solution
 specific code
Message-ID: <20200916155000.GR3956970@smile.fi.intel.com>
References: <20200915162944.16241-1-cezary.rojewski@intel.com>
 <20200915162944.16241-11-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915162944.16241-11-cezary.rojewski@intel.com>
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

On Tue, Sep 15, 2020 at 06:29:41PM +0200, Cezary Rojewski wrote:
> Remove code specific to sound/soc/intel/haswell. Update BE dai_link
> definition to provide seamless transition to catpt solution.

I thought I gave a tag for this...
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
> 
> No changes since initial version.
> 
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


