Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 329374D7A88
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 06:52:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFDF516CD;
	Mon, 14 Mar 2022 06:51:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFDF516CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647237121;
	bh=Rz1HIi+c6il9Hmsj+9aWZpxrklZUtCrbI+Aj4bHCmIg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z7Sg30GRa2iN0RiPf8ie9snWwWQR00lm8prTtbTkyQP6+gkcM0Bd23Q7iPW0gmjKZ
	 O2zXb+XVvHbl4g8GBC3/643iRykBWuODkvpOGDQE2idRCrB3+zeUIPepd/Mp16XPvs
	 KYBkwDE2G8WpNJ/Fzl/QGaWUylZNRk/zvGJk2Yu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28436F801EC;
	Mon, 14 Mar 2022 06:50:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B90C5F80139; Mon, 14 Mar 2022 06:50:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1466FF80095
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 06:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1466FF80095
X-QQ-mid: bizesmtp75t1647237041tkyas7qs
Received: from [10.4.23.86] ( [58.240.82.166]) by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 14 Mar 2022 13:50:40 +0800 (CST)
X-QQ-SSF: 0040000000200070E000B00A0000000
X-QQ-FEAT: Ut0pB98mtT80m0/FHA52UVC6BECN5h+BzyQlH548LAffK2VQB/MlFMSCYy6n5
 opJjZoigbt+2rjUCFy10RVnFkVUcz8406mQ5vCoPWNxqrGZCVP1dluM86y0NZ6mlnJzVVgg
 bi3OhWY8fUQLeFstZM+GSZSpWbREiAHOtio3JuAYpzwAV24t7H0Oz02eBuuiS4UOeiWsSid
 h4DqcRFEKz8Whs/zv0z/LEqRYkQwt7Pj30dzA2QpuDm7wJu2AD5eJSvUWG4XV+z45jYVAjm
 i16dmhA5eGOH6iC7RPuTflmyQkfUC2H+1WHSkIeTVI5UdcSCxo6OIyp5p20fHsE1oTyXBUz
 nKiXBUB6Ix///ktgScjk3o5Mxkce7IbvPhzbBkb
X-QQ-GoodBg: 2
Message-ID: <85c4cdab-e851-f011-4b86-2f0484ff8f78@uniontech.com>+0503DBA1AE00B4F6
Date: Mon, 14 Mar 2022 13:50:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2] ASoC: Intel: boards: Use temporary variable for struct
 device
To: broonie@kernel.org, tiwai@suse.com, perex@perex.cz
References: <20220314054621.14694-1-nizhen@uniontech.com>
From: =?UTF-8?B?5YCq5oyv?= <nizhen@uniontech.com>
In-Reply-To: <20220314054621.14694-1-nizhen@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



在 2022/3/14 13:46, Zhen Ni 写道:
> Use temporary variable for struct device to make code neater.
> 
> Signed-off-by: Zhen Ni <nizhen@uniontech.com>
> ---
>   sound/soc/intel/boards/cht_bsw_max98090_ti.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
> index b3d7a0725ef2..183edd0fd446 100644
> --- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
> +++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
> @@ -538,7 +538,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
>   	const char *platform_name;
>   	bool sof_parent;
>   
> -	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
> +	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
>   	if (!drv)
>   		return -ENOMEM;
>   
> @@ -559,8 +559,8 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
>   	}
>   
>   	/* override platform name, if required */
> -	snd_soc_card_cht.dev = &pdev->dev;
> -	mach = pdev->dev.platform_data;
> +	snd_soc_card_cht.dev = dev;
> +	mach = dev->platform_data;
>   	platform_name = mach->mach_params.platform;
>   
>   	ret_val = snd_soc_fixup_dai_links_platform_name(&snd_soc_card_cht,
> @@ -576,9 +576,9 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
>   	else
>   		mclk_name = "pmc_plt_clk_3";
>   
> -	drv->mclk = devm_clk_get(&pdev->dev, mclk_name);
> +	drv->mclk = devm_clk_get(dev, mclk_name);
>   	if (IS_ERR(drv->mclk)) {
> -		dev_err(&pdev->dev,
> +		dev_err(dev,
>   			"Failed to get MCLK from %s: %ld\n",
>   			mclk_name, PTR_ERR(drv->mclk));
>   		return PTR_ERR(drv->mclk);
> @@ -594,12 +594,12 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
>   	if (drv->quirks & QUIRK_PMC_PLT_CLK_0) {
>   		ret_val = clk_prepare_enable(drv->mclk);
>   		if (ret_val < 0) {
> -			dev_err(&pdev->dev, "MCLK enable error: %d\n", ret_val);
> +			dev_err(dev, "MCLK enable error: %d\n", ret_val);
>   			return ret_val;
>   		}
>   	}
>   
> -	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
> +	sof_parent = snd_soc_acpi_sof_parent(dev);
>   
>   	/* set card and driver name */
>   	if (sof_parent) {
> @@ -614,9 +614,9 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
>   	if (sof_parent)
>   		dev->driver->pm = &snd_soc_pm_ops;
>   
> -	ret_val = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cht);
> +	ret_val = devm_snd_soc_register_card(dev, &snd_soc_card_cht);
>   	if (ret_val) {
> -		dev_err(&pdev->dev,
> +		dev_err(dev,
>   			"snd_soc_register_card failed %d\n", ret_val);
>   		return ret_val;
>   	}


There is no significant change compared with V1, but it is suitable for 
the current code.

BRs
Zhen


