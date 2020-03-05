Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3417A658
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:27:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 741421679;
	Thu,  5 Mar 2020 14:27:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 741421679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583414876;
	bh=UPafrNw5I0RgSP8eHC1D8brgZoMoRIZQz8SOuANmbow=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o0s9Ww+dIWad0gvvNX8R+83+DRlxcY6g4R9Z2BXhllsXkVRAT4QAbFJ1pNcHEd1aj
	 +psmG374Z1ecxhAORccGh9xOiP9dT+n4ESKVWc9s/LQ3cZ6IZf2gpZVpoq3Gnlfdej
	 erS5apR71pIlC67c107ZFE1ZDUUk3hqVqEijT28E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73A12F80266;
	Thu,  5 Mar 2020 14:26:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C795EF800D8; Thu,  5 Mar 2020 14:26:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57888F800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:25:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57888F800D8
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 05:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="275085884"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002.fm.intel.com with ESMTP; 05 Mar 2020 05:25:55 -0800
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1j9qVi-0076Uu-2S; Thu, 05 Mar 2020 15:25:58 +0200
Date: Thu, 5 Mar 2020 15:25:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
Message-ID: <20200305132558.GJ1224808@smile.fi.intel.com>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
 <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Thu, Mar 05, 2020 at 07:06:15AM -0600, Pierre-Louis Bossart wrote:
> The use of devm_gpiod_get() in a dailink .init() callback generates issues
> when unloading modules. The dependencies between modules are not well
> handled and the snd_soc_rt5677 module cannot be removed:
> 
> rmmod: ERROR: Module snd_soc_rt5677 is in use
> 
> Removing the use of devm_ and manually releasing the gpio descriptor

gpio -> GPIO

> in the dailink .exit() callback solves the issue.
> 
> Tested on SAMUS Chromebook with SOF driver.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/intel/boards/bdw-rt5677.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
> index a94f498388e1..641491cb449b 100644
> --- a/sound/soc/intel/boards/bdw-rt5677.c
> +++ b/sound/soc/intel/boards/bdw-rt5677.c
> @@ -247,8 +247,8 @@ static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
>  			RT5677_CLK_SEL_SYS2);
>  
>  	/* Request rt5677 GPIO for headphone amp control */
> -	bdw_rt5677->gpio_hp_en = devm_gpiod_get(component->dev, "headphone-enable",
> -						GPIOD_OUT_LOW);
> +	bdw_rt5677->gpio_hp_en = gpiod_get(component->dev, "headphone-enable",
> +					   GPIOD_OUT_LOW);
>  	if (IS_ERR(bdw_rt5677->gpio_hp_en)) {
>  		dev_err(component->dev, "Can't find HP_AMP_SHDN_L gpio\n");
>  		return PTR_ERR(bdw_rt5677->gpio_hp_en);
> @@ -282,6 +282,15 @@ static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
>  	return 0;
>  }
>  
> +static void bdw_rt5677_exit(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct bdw_rt5677_priv *bdw_rt5677 =
> +			snd_soc_card_get_drvdata(rtd->card);
> +

> +	if (!IS_ERR(bdw_rt5677->gpio_hp_en))

I'm wondering if you need this check at all? In the above (I left for context)
the GPIO is considered mandatory, does the core handles errors from ->init()
correctly?

> +		gpiod_put(bdw_rt5677->gpio_hp_en);
> +}
> +
>  /* broadwell digital audio interface glue - connects codec <--> CPU */
>  SND_SOC_DAILINK_DEF(dummy,
>  	DAILINK_COMP_ARRAY(COMP_DUMMY()));
> @@ -350,6 +359,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
>  		.dpcm_playback = 1,
>  		.dpcm_capture = 1,
>  		.init = bdw_rt5677_init,
> +		.exit = bdw_rt5677_exit,
>  		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
>  	},
>  };
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko


