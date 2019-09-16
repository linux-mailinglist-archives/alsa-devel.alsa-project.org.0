Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C334B3D16
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 17:04:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8801F166F;
	Mon, 16 Sep 2019 17:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8801F166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568646251;
	bh=8OsqljCB9BooI0mODj3CJZmk2HL3e4GXW8B+TDMKVx0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cqd2TeQ5CMUxBQsnEYL/X99/hlDqltyLPDW74UX3wQkZEyZN1TYk2yKO78LWPFPeL
	 X86azXVANnodL9vDhEeQzAEnRrAEepiLRWK+CgzeRV+y1euYESlFIbKCd2+TmQrWur
	 o8kxFMzbcMJWlfwj7FA5EnaHYSc2KZWlOTq/nPiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7AF5F80506;
	Mon, 16 Sep 2019 17:02:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A60C2F80506; Mon, 16 Sep 2019 17:02:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66014F80148
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 17:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66014F80148
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 08:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,513,1559545200"; d="scan'208";a="193459449"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Sep 2019 08:02:17 -0700
Received: from pbossart-mac01.local (unknown [10.251.11.91])
 by linux.intel.com (Postfix) with ESMTP id B72505806A0;
 Mon, 16 Sep 2019 08:02:16 -0700 (PDT)
To: Sam McNally <sammc@chromium.org>, alsa-devel@alsa-project.org
References: <20190916071511.5909-1-sammc@chromium.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <412d8b9f-463a-1082-8fbb-7a0879decddd@linux.intel.com>
Date: Mon, 16 Sep 2019 10:02:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190916071511.5909-1-sammc@chromium.org>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: cht_bsw_rt5645: Add quirk for
 boards using pmc_plt_clk_0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 9/16/19 2:15 AM, Sam McNally wrote:
> As of commit 648e921888ad ("clk: x86: Stop marking clocks as
> CLK_IS_CRITICAL"), the cht_bsw_rt5645 driver needs to enable the clock
> it's using for the codec's mclk. It does this from commit 7735bce05a9c
> ("ASoC: Intel: boards: use devm_clk_get() unconditionally"), enabling
> pmc_plt_clk_3. However, Strago family Chromebooks use pmc_plt_clk_0 for
> the codec mclk, resulting in white noise with some digital microphones.
> Add a DMI-based quirk for Strago family Chromebooks to use pmc_plt_clk_0
> instead.

Sounds good, thanks for the patch. You will need to Cc: maintainers 
(Takashi and Mark) if you want them to see your patches.

Maybe you should mention in the commit message that this mirrors the 
changes made in cht_bsw_max98090_ti?

Also see more important comment below

> 
> Signed-off-by: Sam McNally <sammc@chromium.org>
> ---
> 
>   sound/soc/intel/boards/cht_bsw_rt5645.c | 26 +++++++++++++++++++------
>   1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
> index 8879c3be29d5..c68a5b85a4a0 100644
> --- a/sound/soc/intel/boards/cht_bsw_rt5645.c
> +++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
> @@ -48,6 +48,7 @@ struct cht_mc_private {
>   #define CHT_RT5645_SSP2_AIF2     BIT(16) /* default is using AIF1  */
>   #define CHT_RT5645_SSP0_AIF1     BIT(17)
>   #define CHT_RT5645_SSP0_AIF2     BIT(18)
> +#define CHT_RT5645_PMC_PLT_CLK_0 BIT(19)
>   
>   static unsigned long cht_rt5645_quirk = 0;
>   
> @@ -59,6 +60,8 @@ static void log_quirks(struct device *dev)
>   		dev_info(dev, "quirk SSP0_AIF1 enabled");
>   	if (cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2)
>   		dev_info(dev, "quirk SSP0_AIF2 enabled");
> +	if (cht_rt5645_quirk & CHT_RT5645_PMC_PLT_CLK_0)
> +		dev_info(dev, "quirk PMC_PLT_CLK_0 enabled");
>   }
>   
>   static int platform_clock_control(struct snd_soc_dapm_widget *w,
> @@ -226,15 +229,21 @@ static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
>   	return 0;
>   }
>   
> -/* uncomment when we have a real quirk
>   static int cht_rt5645_quirk_cb(const struct dmi_system_id *id)
>   {
>   	cht_rt5645_quirk = (unsigned long)id->driver_data;
>   	return 1;
>   }
> -*/
>   
>   static const struct dmi_system_id cht_rt5645_quirk_table[] = {
> +	{
> +		/* Strago family Chromebooks */
> +		.callback = cht_rt5645_quirk_cb,
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Intel_Strago"),
> +		},
> +		.driver_data = (void *)CHT_RT5645_PMC_PLT_CLK_0,
> +	},
>   	{
>   	},
>   };
> @@ -526,6 +535,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
>   	int dai_index = 0;
>   	int ret_val = 0;
>   	int i;
> +	const char *mclk_name;
>   
>   	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
>   	if (!drv)
> @@ -662,11 +672,15 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
>   	if (ret_val)
>   		return ret_val;
>   
> -	drv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
> +	if (cht_rt5645_quirk & CHT_RT5645_PMC_PLT_CLK_0)
> +		mclk_name = "pmc_plt_clk_0";
> +	else
> +		mclk_name = "pmc_plt_clk_3";

Aren't you missing a call to dmi_first_match() to change the default 
value of this cht_rt5645_quirk variable?

The rest of the patch looks good but I don't see how the DMI info is 
actually used.

> +	drv->mclk = devm_clk_get(&pdev->dev, mclk_name);
>   	if (IS_ERR(drv->mclk)) {
> -		dev_err(&pdev->dev,
> -			"Failed to get MCLK from pmc_plt_clk_3: %ld\n",
> -			PTR_ERR(drv->mclk));
> +		dev_err(&pdev->dev, "Failed to get MCLK from %s: %ld\n",
> +			mclk_name, PTR_ERR(drv->mclk)); >   		return PTR_ERR(drv->mclk);
>   	}
>   
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
