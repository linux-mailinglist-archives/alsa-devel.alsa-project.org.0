Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9461E495445
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 19:38:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B8862E7B;
	Thu, 20 Jan 2022 19:37:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B8862E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642703906;
	bh=Hs88VGS01GmyEkdxMoCilhjnzvi8k0zoZa9d9iOugW4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b90hs7u9DR2EHCuit1ab8RN+YkR/ARD4zKk+qiIMRop9CRaYNS2Pp1PVLEHhn4jeC
	 q67LkE3gtyQmh7xqsN89JHb9ARWD9dW9yflm3Ch257Ql7B4XrCZxPwjIo2WmUPHYx3
	 pHj2gmc9htXhBff5J/m8YhzA2NdatC/nKym1Mw2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6390F80134;
	Thu, 20 Jan 2022 19:37:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A09EF8007E; Thu, 20 Jan 2022 19:37:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04B44F8007E
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 19:37:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04B44F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aCw6jcxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642703834; x=1674239834;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Hs88VGS01GmyEkdxMoCilhjnzvi8k0zoZa9d9iOugW4=;
 b=aCw6jcxN4ucPiU//Fjmnv3CBHlsfv+mwO/e5DOvfhGHlJCcxMkQnNYuY
 a5Tu3vLTYoZHrdT/tMTCmWm+JFvbwj/YOuq5hoKb7b0x2UtnkCXWZo4la
 XtNBzf3bX92s711fkX/nypvET5vJXLHKuKk62tlrqM3GpcCvaJyJGKRBd
 mUeba4FR2MbaGXS8uDhs4WbPiiJdng8BC9UcPTIwlBoQWcswhGERWBGoR
 hr+ztxlpMCmkruP9dOCUFnvmfFHipaOuoxfOxBcoY1cmaRv+QZAfNNizY
 +zRw5fR2kjXzIsKiwbrVs/389QlTHojFECqDSflb50tq0zGqyDx5tnCnZ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="244248255"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="244248255"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:37:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="531097845"
Received: from lbrim-t480s.amr.corp.intel.com (HELO [10.213.186.73])
 ([10.213.186.73])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:37:09 -0800
Subject: Re: [PATCH v2] ASoC: Intel: sof_rt5682: add 512FS MCLK clock
 configuration
To: Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
References: <20220120054012.15849-1-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e8003b13-9eb2-bd45-916c-0054fe26f35a@linux.intel.com>
Date: Thu, 20 Jan 2022 08:15:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220120054012.15849-1-mac.chiang@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: guennadi.liakhovetski@linux.intel.com, kai.vehmanen@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org, shumingf@realtek.com,
 brent.lu@intel.com
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



On 1/19/22 11:40 PM, Mac Chiang wrote:
> codec system clock source support 512FS MCLK synchronous directly, so
> no need to set PLL configuration when MCLK 24.576MHz.
> 
> Suggested-by: Shuming Fan <shumingf@realtek.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> ---
> Changelog:
> 
> v2:
>   - apply mclk configuration to both rt5682vd and rt5682vs
>   - Thanks to Brent by suggesting pll_in condition if MCLK or
>     PLL requires.

Nice simplification, thanks!

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/sof_rt5682.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index bd6d2e7dea53..f4e833cbffe1 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -369,11 +369,16 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
>  
>  	pll_out = params_rate(params) * 512;
>  
> -	/* Configure pll for codec */
> -	ret = snd_soc_dai_set_pll(codec_dai, pll_id, pll_source, pll_in,
> -				  pll_out);
> -	if (ret < 0)
> -		dev_err(rtd->dev, "snd_soc_dai_set_pll err = %d\n", ret);
> +	/* when MCLK is 512FS, no need to set PLL configuration additionally. */
> +	if (pll_in == pll_out)
> +		clk_id = RT5682S_SCLK_S_MCLK;
> +	else {
> +		/* Configure pll for codec */
> +		ret = snd_soc_dai_set_pll(codec_dai, pll_id, pll_source, pll_in,
> +					  pll_out);
> +		if (ret < 0)
> +			dev_err(rtd->dev, "snd_soc_dai_set_pll err = %d\n", ret);
> +	}
>  
>  	/* Configure sysclk for codec */
>  	ret = snd_soc_dai_set_sysclk(codec_dai, clk_id,
> 
