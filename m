Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1D6B504D
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 16:25:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25B45166D;
	Tue, 17 Sep 2019 16:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25B45166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568730332;
	bh=ZgCFJDAKGzJjRSxYh5caWQvRtwPSM8ez5okhssvlL7I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KD+xv+Eqy8WD6/6RukVhR0ijD1DEBYsKawsKf6ZuAXNEqZOgubsCKsT0eceZCMkwr
	 rieSbvu0MfFVXk32oO133Azb9/xqz/GdXyhW5fftubYNWit+L2MvnrPmOG+UpnhFF1
	 HNHIRnZAGIoGHWYDPczW7u3sKUXXRYHYvWCzj8WM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4D36F80361;
	Tue, 17 Sep 2019 16:23:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60F32F80361; Tue, 17 Sep 2019 16:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56388F80146
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 16:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56388F80146
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 07:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,516,1559545200"; d="scan'208";a="193762956"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Sep 2019 07:23:39 -0700
Received: from pbossart-mac01.local (unknown [10.251.11.91])
 by linux.intel.com (Postfix) with ESMTP id E194A580834;
 Tue, 17 Sep 2019 07:23:38 -0700 (PDT)
To: Sam McNally <sammc@chromium.org>, alsa-devel@alsa-project.org
References: <20190917054933.209335-1-sammc@chromium.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6b50adbe-a3d3-e5fb-e3c7-b8277551f36d@linux.intel.com>
Date: Tue, 17 Sep 2019 09:23:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917054933.209335-1-sammc@chromium.org>
Content-Language: en-US
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: Intel: cht_bsw_rt5645: Add quirk
 for boards using pmc_plt_clk_0
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

On 9/17/19 12:49 AM, Sam McNally wrote:
> As of commit 648e921888ad ("clk: x86: Stop marking clocks as
> CLK_IS_CRITICAL"), the cht_bsw_rt5645 driver needs to enable the clock
> it's using for the codec's mclk. It does this from commit 7735bce05a9c
> ("ASoC: Intel: boards: use devm_clk_get() unconditionally"), enabling
> pmc_plt_clk_3. However, Strago family Chromebooks use pmc_plt_clk_0 for
> the codec mclk, resulting in white noise with some digital microphones.
> Add a DMI-based quirk for Strago family Chromebooks to use pmc_plt_clk_0
> instead - mirroring the changes made to cht_bsw_max98090_ti in
> commit a182ecd3809c ("ASoC: intel: cht_bsw_max98090_ti: Add quirk for
> boards using pmc_plt_clk_0") and making use of the existing
> dmi_check_system() call and related infrastructure added in
> commit 22af29114eb4 ("ASoC: Intel: cht-bsw-rt5645: add quirks for
> SSP0/AIF1/AIF2 routing").
> 
> Signed-off-by: Sam McNally <sammc@chromium.org>

Looks good to me, thanks for the patch

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> 
> Changes in v2:
> - Added to the description references to more related commits (similar
>    cht_bsw_max98090_ti clock quirks inspiring this change and and the
>    cht_bsw_rt5645 quirks setup)
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
> +
> +	drv->mclk = devm_clk_get(&pdev->dev, mclk_name);
>   	if (IS_ERR(drv->mclk)) {
> -		dev_err(&pdev->dev,
> -			"Failed to get MCLK from pmc_plt_clk_3: %ld\n",
> -			PTR_ERR(drv->mclk));
> +		dev_err(&pdev->dev, "Failed to get MCLK from %s: %ld\n",
> +			mclk_name, PTR_ERR(drv->mclk));
>   		return PTR_ERR(drv->mclk);
>   	}
>   
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
