Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECCE4D515A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 19:52:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07F27193F;
	Thu, 10 Mar 2022 19:51:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07F27193F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646938342;
	bh=gPJHila5zLpPmYhvasnJNpKqqfvFsbmocAlOkHlc8nA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VqTMBJoKaAuucegi0VDZmPxullDl9LEYf679ZrZIWJMy8pbVzJxkFft5/6yDrLT+e
	 pk6SmG0HmgDOs5A91mcELxXyTpsEuq+a81VyjBo5WgSXdudXWlI5C2UX//TyqoG8gW
	 m0/glmnjWeglAY+XGhGiRLyjox5jjpoUPViE2TCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C5F6F8013C;
	Thu, 10 Mar 2022 19:51:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 409B4F80137; Thu, 10 Mar 2022 19:51:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06B56F800FD
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 19:51:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06B56F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="oAX+OAEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646938266; x=1678474266;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gPJHila5zLpPmYhvasnJNpKqqfvFsbmocAlOkHlc8nA=;
 b=oAX+OAEWvNX0Dr/RUQ39gDniLjzsfrBj7Wjw0EZVtk/1o63qQU+TAEU3
 jxKODlO80YFuFuGVHOLeMKxgqifyGkNnR3A6xKEMSWkj+JP+L83ZOIvdC
 I9WRHOCpsbv3F/Pq0MYb1RyoB4jDSrPflmp1zqPs1CYmp4vVRmW+O200h
 WEgsnkUYnbNa7dd3PBVhsCm7MvNMu+pzpgCk7pPC7La+aNxcW9/CCmL+w
 sJbULUDO7wH+rDbqA1K4y8Je7eTE+BFvRu/wAN/Dl5Hu6l2xitdsF3RSy
 Q/XJ2ANSJGn1vWSRASInVBZ9NfnaieHkwQaj8mLfBWHMcAM3w+CrCsoS8 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="318563627"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="318563627"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 10:50:58 -0800
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="816005666"
Received: from maxdorn-mobl.amr.corp.intel.com (HELO [10.209.77.185])
 ([10.209.77.185])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 10:50:57 -0800
Message-ID: <1371b991-ba9e-f1a8-db6a-f5cd645e7ba6@linux.intel.com>
Date: Thu, 10 Mar 2022 09:30:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: Intel: boards: Use temporary variable for struct
 device
Content-Language: en-US
To: Zhen Ni <nizhen@uniontech.com>, broonie@kernel.org, tiwai@suse.com,
 perex@perex.cz
References: <20220310065354.14493-1-nizhen@uniontech.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220310065354.14493-1-nizhen@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 3/10/22 00:53, Zhen Ni wrote:
> Use temporary variable for struct device to make code neater. >
> Signed-off-by: Zhen Ni <nizhen@uniontech.com>

There's quite a few Intel machine drivers where we have the same sort of 
code, we'll need to do a wider cleanup at some point.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/boards/cht_bsw_max98090_ti.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
> index 1bc21434c9de..d9f4206e1f96 100644
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
>   	/* override plaform name, if required */
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
