Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC39542425F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:15:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E64921663;
	Wed,  6 Oct 2021 18:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E64921663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633536948;
	bh=6RPenMUMkylPtn8WwQwCtz1SomrmkSz3EgmMDk6L1XY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HzhFXXU405MHc7tWuOber3nA/dDezeLbz/E9YiUWB1YhhpsIlODpzJ+Hcn79VHr1T
	 tw07x7FHwIXJ0SSVgpRp8e79H4xlYGZIb3abOvtcVSa0yJn1iRoztpG+8pSDM4zmEa
	 VyZC0qc4vz4eeBdvnK0JaBPQpSK17dC2RKI70UBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D498F8010B;
	Wed,  6 Oct 2021 18:14:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61FF2F80249; Wed,  6 Oct 2021 18:14:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 562D2F80240
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 562D2F80240
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="249310206"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="249310206"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:09:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="439169460"
Received: from nbasa-mobl2.amr.corp.intel.com (HELO [10.213.170.135])
 ([10.213.170.135])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:09:04 -0700
Subject: Re: [PATCH v1 3/4] ASoC: Intel: bytcr_rt5640: use
 devm_clk_get_optional() for mclk
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20211006150442.16503-1-andriy.shevchenko@linux.intel.com>
 <20211006150442.16503-3-andriy.shevchenko@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <31338a32-a870-4bf8-52ba-5204109cf974@linux.intel.com>
Date: Wed, 6 Oct 2021 10:54:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006150442.16503-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
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



On 10/6/21 10:04 AM, Andy Shevchenko wrote:
> The devm_clk_get_optional() helper returns NULL when devm_clk_get()
> returns -ENOENT. This makes things slightly cleaner. The added benefit
> is mostly cosmetic.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  sound/soc/intel/boards/bytcr_rt5640.c | 75 ++++++++++++---------------
>  1 file changed, 32 insertions(+), 43 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 0f609a0b3527..2e7d45f0f05d 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -269,13 +269,10 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
>  		return -EIO;
>  
>  	if (SND_SOC_DAPM_EVENT_ON(event)) {
> -		if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {

same comment as for rt5651, I don't see the point of removing the test
on this quirk?

> -			ret = clk_prepare_enable(priv->mclk);
> -			if (ret < 0) {
> -				dev_err(card->dev,
> -					"could not configure MCLK state\n");
> -				return ret;
> -			}
> +		ret = clk_prepare_enable(priv->mclk);
> +		if (ret < 0) {
> +			dev_err(card->dev, "could not configure MCLK state\n");
> +			return ret;
>  		}
>  		ret = byt_rt5640_prepare_and_enable_pll1(codec_dai, 48000);
>  	} else {
> @@ -287,10 +284,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
>  		ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_RCCLK,
>  					     48000 * 512,
>  					     SND_SOC_CLOCK_IN);
> -		if (!ret) {
> -			if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN)
> -				clk_disable_unprepare(priv->mclk);
> -		}
> +		if (!ret)
> +			clk_disable_unprepare(priv->mclk);
>  	}
>  
>  	if (ret < 0) {
> @@ -1217,30 +1212,25 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
>  			return ret;
>  	}
>  
> -	if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {
> -		/*
> -		 * The firmware might enable the clock at
> -		 * boot (this information may or may not
> -		 * be reflected in the enable clock register).
> -		 * To change the rate we must disable the clock
> -		 * first to cover these cases. Due to common
> -		 * clock framework restrictions that do not allow
> -		 * to disable a clock that has not been enabled,
> -		 * we need to enable the clock first.
> -		 */
> -		ret = clk_prepare_enable(priv->mclk);
> -		if (!ret)
> -			clk_disable_unprepare(priv->mclk);
> -
> -		if (byt_rt5640_quirk & BYT_RT5640_MCLK_25MHZ)
> -			ret = clk_set_rate(priv->mclk, 25000000);
> -		else
> -			ret = clk_set_rate(priv->mclk, 19200000);
> +	/*
> +	 * The firmware might enable the clock at boot (this information
> +	 * may or may not be reflected in the enable clock register).
> +	 * To change the rate we must disable the clock first to cover
> +	 * these cases. Due to common clock framework restrictions that
> +	 * do not allow to disable a clock that has not been enabled,
> +	 * we need to enable the clock first.
> +	 */
> +	ret = clk_prepare_enable(priv->mclk);
> +	if (!ret)
> +		clk_disable_unprepare(priv->mclk);
>  
> -		if (ret) {
> -			dev_err(card->dev, "unable to set MCLK rate\n");
> -			return ret;
> -		}
> +	if (byt_rt5640_quirk & BYT_RT5640_MCLK_25MHZ)
> +		ret = clk_set_rate(priv->mclk, 25000000);
> +	else
> +		ret = clk_set_rate(priv->mclk, 19200000);
> +	if (ret) {
> +		dev_err(card->dev, "unable to set MCLK rate\n");
> +		return ret;
>  	}
>  
>  	if (BYT_RT5640_JDSRC(byt_rt5640_quirk)) {
> @@ -1653,7 +1643,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>  		byt_rt5640_dais[dai_index].cpus->dai_name = "ssp0-port";
>  
>  	if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {
> -		priv->mclk = devm_clk_get(dev, "pmc_plt_clk_3");
> +		priv->mclk = devm_clk_get_optional(dev, "pmc_plt_clk_3");
>  		if (IS_ERR(priv->mclk)) {
>  			ret_val = PTR_ERR(priv->mclk);
>  
> @@ -1661,15 +1651,14 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>  				"Failed to get MCLK from pmc_plt_clk_3: %d\n",
>  				ret_val);
>  
> -			/*
> -			 * Fall back to bit clock usage for -ENOENT (clock not
> -			 * available likely due to missing dependencies), bail
> -			 * for all other errors, including -EPROBE_DEFER
> -			 */
> -			if (ret_val != -ENOENT)
> -				goto err;
> -			byt_rt5640_quirk &= ~BYT_RT5640_MCLK_EN;
> +			goto err;
>  		}
> +		/*
> +		 * Fall back to bit clock usage when clock is not
> +		 * available likely due to missing dependencies.
> +		 */
> +		if (!priv->mclk)
> +			byt_rt5640_quirk &= ~BYT_RT5640_MCLK_EN;
>  	}
>  
>  	if (byt_rt5640_quirk & BYT_RT5640_NO_SPEAKERS) {
> 
