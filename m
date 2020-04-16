Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 338581ABA9A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 09:58:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD3C11614;
	Thu, 16 Apr 2020 09:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD3C11614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587023938;
	bh=mU/o4EvJ4t4Et8b+5jyhLG7U0PJdQ6d20/ZyyN4kUpo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=poKPUuZpb3bQ7gfihcIgysz1Oo2bDZiPVwXU8aOZFs18RdN1vOlkNKglX2mljxVnw
	 1+xhwAVYazKU0u3V9YYQ1pGfGbgqW/m51D9BASZfl+tb4qXFIKImZ6ZpxGBMaSgb41
	 BQYRaFEhYh+iLxrRxXDWXk+XMeV6AiDPASeKcrl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A60C5F8028C;
	Thu, 16 Apr 2020 09:56:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7F58F8014E; Thu, 16 Apr 2020 09:56:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C1C0F8013D
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 09:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C1C0F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VCUgW+gv"
Received: by mail-wm1-x344.google.com with SMTP id c195so1856080wme.1
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 00:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ulm6HXP6hdRkHQzW/BLmx++TLB4SCHFqhDCHGDLiv5k=;
 b=VCUgW+gvGSo/XCfIqo2sYI3PBbjb3wawnETBSCwGVfPCiqHKGOv3DPYvC1eL+jRpLt
 OeywBaxuHAlyazt97+Ff3g8Sq7DIzxIMjfcC4xCku9dfiNfTXm8Oo84NC5YMuNNdMdx7
 3fowegU2XrojDa5oIOLxE3D5zHJq2AN/yfPtZqshseVia0n4w6SyyTUGN1zgaWTobRNy
 ic140FiDKZCKRz79WZ+WkhVse+vyuAXAygWsoclijbqWjQvxrLlURtw+9s7dXcZM8u/m
 K6mJI3w4e84YnG29lpmarSFNCGD3uKRXaU9mBDutOBZPAyRvR4NMDhecfumiT1c+gQ2L
 dvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ulm6HXP6hdRkHQzW/BLmx++TLB4SCHFqhDCHGDLiv5k=;
 b=YXiggyHkEfiDs3SoYhUDE00cr4wFEd2Jvexu7alA7SRWB4oTsGq+Xnm1QpJ3/05SxF
 96RwjKjXD1J4MhUZpREV+3jL8d22hhEkd8Pkqon4LzB8EdGXS0A0vlWsYzFkBR7BZrXv
 YbbLlWZPqGAVlGa/3LbIDIcmc9RTUs+UTey9U/1iWCa2K+IDErFG8vsMJ2440TVc7KRH
 WTGqL7MepqU0mQLIBxW/gG0R2z4K6ihFpRErk8je4hqh2ULClMhBmPfKzE1eBaYQvbtW
 JIyQOJ1jlSrRanNocgPb7T6uykwMRFXUEryipcZGFK78pWAWnaWVde46vRW1cXPZK0H5
 if7g==
X-Gm-Message-State: AGi0Pub/lqkyP4mlUhAI+U4zztjHwqi9FNc1VJnN/Bo8+OjsPxVrhRhf
 sh3u9pIPpaHxLu9vw3zUL6BVRg==
X-Google-Smtp-Source: APiQypIuyuTdkSr1XavGzGP+CH0F5J2V8jUq1iDBI93URi223iG8SPHxhzLzFDRV4YsUAnVC0qlN2w==
X-Received: by 2002:a1c:3d83:: with SMTP id k125mr3751097wma.177.1587023782932; 
 Thu, 16 Apr 2020 00:56:22 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id s27sm17430055wra.94.2020.04.16.00.56.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 00:56:22 -0700 (PDT)
Subject: Re: [PATCH 02/11] ASoC: qcom: lpass: Add struct lpass_dai to store
 dai clocks pointer
To: Ajit Pandey <ajitp@codeaurora.org>, alsa-devel@alsa-project.org,
 broonie@kernel.org, devicetree@vger.kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org
References: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
 <1586592171-31644-3-git-send-email-ajitp@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3b6fb5bf-c580-a543-ab70-d08113193a34@linaro.org>
Date: Thu, 16 Apr 2020 08:56:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1586592171-31644-3-git-send-email-ajitp@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, tiwai@suse.com
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



On 11/04/2020 09:02, Ajit Pandey wrote:
> lpass_dai will store clocks related to respective dai's and it will
> be initialized during probe based on variant clock names.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>

I dont understand why do we need this change? What is the advantage of 
doing this way vs the existing one?


--srini

> ---
>   sound/soc/qcom/lpass-cpu.c | 89 ++++++++++++++++++++++++++--------------------
>   sound/soc/qcom/lpass.h     | 18 +++++-----
>   2 files changed, 61 insertions(+), 46 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index dbce7e9..492f27b 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -23,13 +23,15 @@ static int lpass_cpu_daiops_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>   		unsigned int freq, int dir)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> -	int ret;
> -
> -	ret = clk_set_rate(drvdata->mi2s_osr_clk[dai->driver->id], freq);
> -	if (ret)
> -		dev_err(dai->dev, "error setting mi2s osrclk to %u: %d\n",
> -			freq, ret);
> +	struct lpass_dai *dai_data = drvdata->dai_priv[dai->driver->id];
> +	int ret = 0;
>   
> +	if (dai_data->osr_clk != NULL) {
> +		ret = clk_set_rate(dai_data->osr_clk, freq);
> +		if (ret)
> +			dev_err(dai->dev, "error setting mi2s osrclk to %u:%d\n",
> +				freq, ret);
> +	}
>   	return ret;
>   }
>   
> @@ -37,18 +39,22 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
>   		struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct lpass_dai *dai_data = drvdata->dai_priv[dai->driver->id];
>   	int ret;
>   
> -	ret = clk_prepare_enable(drvdata->mi2s_osr_clk[dai->driver->id]);
> -	if (ret) {
> -		dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);
> -		return ret;
> +	if (dai_data->osr_clk != NULL) {
> +		ret = clk_prepare_enable(dai_data->osr_clk);
> +		if (ret) {
> +			dev_err(dai->dev,
> +				"error in enabling mi2s osr clk: %d\n", ret);
> +			return ret;
> +		}
>   	}
>   
> -	ret = clk_prepare_enable(drvdata->mi2s_bit_clk[dai->driver->id]);
> +	ret = clk_prepare_enable(dai_data->bit_clk);
>   	if (ret) {
>   		dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> -		clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
> +		clk_disable_unprepare(dai_data->osr_clk);
>   		return ret;
>   	}
>   
> @@ -59,16 +65,18 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
>   		struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct lpass_dai *dai_data = drvdata->dai_priv[dai->driver->id];
>   
> -	clk_disable_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
> +	clk_disable_unprepare(dai_data->bit_clk);
>   
> -	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
> +	clk_disable_unprepare(dai_data->osr_clk);
>   }
>   
>   static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct lpass_dai *dai_data = drvdata->dai_priv[dai->driver->id];
>   	snd_pcm_format_t format = params_format(params);
>   	unsigned int channels = params_channels(params);
>   	unsigned int rate = params_rate(params);
> @@ -163,8 +171,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   		return ret;
>   	}
>   
> -	ret = clk_set_rate(drvdata->mi2s_bit_clk[dai->driver->id],
> -			   rate * bitwidth * 2);
> +	ret = clk_set_rate(dai_data->bit_clk, rate * bitwidth * 2);
>   	if (ret) {
>   		dev_err(dai->dev, "error setting mi2s bitclk to %u: %d\n",
>   			rate * bitwidth * 2, ret);
> @@ -413,6 +420,25 @@ static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
>   	.cache_type = REGCACHE_FLAT,
>   };
>   
> +static int lpass_init_dai_clocks(struct device *dev,
> +			   struct lpass_data *drvdata)
> +{
> +	struct lpass_dai *dai;
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	for (i = 0; i < v->num_dai; i++) {
> +
> +		dai = drvdata->dai_priv[i];
> +
> +		dai->osr_clk = devm_clk_get_optional(dev,
> +						     v->dai_osr_clk_names[i]);
> +		dai->bit_clk = devm_clk_get(dev, v->dai_bit_clk_names[i]);
> +	}
> +
> +	return 0;
> +}
> +
>   int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   {
>   	struct lpass_data *drvdata;
> @@ -421,7 +447,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   	struct lpass_variant *variant;
>   	struct device *dev = &pdev->dev;
>   	const struct of_device_id *match;
> -	int ret, i, dai_id;
> +	int ret, i;
>   
>   	dsp_of_node = of_parse_phandle(pdev->dev.of_node, "qcom,adsp", 0);
>   	if (dsp_of_node) {
> @@ -467,28 +493,15 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   		variant->init(pdev);
>   
>   	for (i = 0; i < variant->num_dai; i++) {
> -		dai_id = variant->dai_driver[i].id;
> -		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get(&pdev->dev,
> -					     variant->dai_osr_clk_names[i]);
> -		if (IS_ERR(drvdata->mi2s_osr_clk[dai_id])) {
> -			dev_warn(&pdev->dev,
> -				"%s() error getting optional %s: %ld\n",
> -				__func__,
> -				variant->dai_osr_clk_names[i],
> -				PTR_ERR(drvdata->mi2s_osr_clk[dai_id]));
> -
> -			drvdata->mi2s_osr_clk[dai_id] = NULL;
> -		}
> +		drvdata->dai_priv[i] = devm_kzalloc(dev,
> +						sizeof(struct lpass_dai),
> +						GFP_KERNEL);
> +	}
>   
> -		drvdata->mi2s_bit_clk[dai_id] = devm_clk_get(&pdev->dev,
> -						variant->dai_bit_clk_names[i]);
> -		if (IS_ERR(drvdata->mi2s_bit_clk[dai_id])) {
> -			dev_err(&pdev->dev,
> -				"error getting %s: %ld\n",
> -				variant->dai_bit_clk_names[i],
> -				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
> -			return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
> -		}
> +	ret = lpass_init_dai_clocks(dev, drvdata);
> +	if (ret) {
> +		dev_err(&pdev->dev, "error intializing dai clock: %d\n", ret);
> +		return ret;
>   	}
>   
>   	drvdata->ahbix_clk = devm_clk_get(&pdev->dev, "ahbix-clk");
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 17113d3..b729686 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -13,9 +13,14 @@
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   
> -#define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
> -#define LPASS_MAX_MI2S_PORTS			(8)
> -#define LPASS_MAX_DMA_CHANNELS			(8)
> +#define LPASS_AHBIX_CLOCK_FREQUENCY            131072000
> +#define LPASS_MAX_MI2S_PORTS                   (8)
> +#define LPASS_MAX_DMA_CHANNELS                 (8)
> +
> +struct lpass_dai {
> +	struct clk *osr_clk;
> +	struct clk *bit_clk;
> +};
>   
>   /* Both the CPU DAI and platform drivers will access this data */
>   struct lpass_data {
> @@ -23,11 +28,8 @@ struct lpass_data {
>   	/* AHB-I/X bus clocks inside the low-power audio subsystem (LPASS) */
>   	struct clk *ahbix_clk;
>   
> -	/* MI2S system clock */
> -	struct clk *mi2s_osr_clk[LPASS_MAX_MI2S_PORTS];
> -
> -	/* MI2S bit clock (derived from system clock by a divider */
> -	struct clk *mi2s_bit_clk[LPASS_MAX_MI2S_PORTS];
> +	/* MI2S dai specific configuration */
> +	struct lpass_dai *dai_priv[LPASS_MAX_MI2S_PORTS];
>   
>   	/* low-power audio interface (LPAIF) registers */
>   	void __iomem *lpaif;
> 
