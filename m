Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8F0492990
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 16:21:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77DF01A16;
	Tue, 18 Jan 2022 16:20:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77DF01A16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642519264;
	bh=QUuNFrE7g4eNQv74eurDTHIoeO53a7VroakpVdBCYJA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JqQVQiTtDYUHJs28KQjERfpgA0iif2aUkITrg1+Oqu3dW/Ry7KX4SiCJHFADjdxVX
	 f54C9IQQ+7yxD3i58pIjoOpGcltR2t/UFaSie/o/rDqAv0p2TvfmTWAAv7uaVoWctE
	 59JhXLXvb4th5IXKdArENfN8ACi31e3jJEextgmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07FA3F80246;
	Tue, 18 Jan 2022 16:19:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B591F8023B; Tue, 18 Jan 2022 16:19:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 869F9F800CE
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 16:19:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 869F9F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nr40nfCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642519191; x=1674055191;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=QUuNFrE7g4eNQv74eurDTHIoeO53a7VroakpVdBCYJA=;
 b=nr40nfCMKiDi4cqK8rxdQfgtwoOfIIX1blgsPGyCVzFm7dfija72poXT
 GNc4uWYJpqHXG9NQub9+Hm+1pB43nwhbS6DZ+9qcDyV/1D4vAwbHcYl3E
 36p/S0qTqjMMquUHDYLsBud3hy+yHhvHDAcMOj+ngA1+pYb766UFkwAIy
 Ujg7N6VbJ4fHEdMtuPJ6zV38JnIJyQua+3VrM1slNmcuCE5RKl0t2CqNm
 fzpAh9cv+Pw4KUGc34eY87goYaG+LSep4B0Atmp4fid2eaKodZ+wz6Zf+
 v4Dk0n1fOWGLOuaUAWtGVIK462a9+dNOvs0Ipyi5p0+Dh3TCRGQCXxdEm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="244633446"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="244633446"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 07:19:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="622170107"
Received: from mdzurick-mobl.amr.corp.intel.com (HELO [10.209.145.208])
 ([10.209.145.208])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 07:19:33 -0800
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: add 512FS MCLK clock
 configuration
To: Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
References: <20220118084952.9555-1-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6aba2a91-695c-c69b-db0a-59a6b27fb425@linux.intel.com>
Date: Tue, 18 Jan 2022 09:19:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118084952.9555-1-mac.chiang@intel.com>
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



On 1/18/22 2:49 AM, Mac Chiang wrote:
> codec system clock source support 512FS MCLK synchronous directly, so
> no need to set PLL configuration when MCLK 24.576MHz.
> 
> Suggested-by: Shuming Fan <shumingf@realtek.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> ---
>  sound/soc/intel/boards/sof_rt5682.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index bd6d2e7dea53..a6efffc14cad 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -61,7 +61,6 @@
>  #define SOF_MAX98390_SPEAKER_AMP_PRESENT	BIT(24)
>  #define SOF_MAX98390_TWEETER_SPEAKER_PRESENT	BIT(25)
>  
> -
>  /* Default: MCLK on, MCLK 19.2M, SSP0  */
>  static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
>  					SOF_RT5682_SSP_CODEC(0);
> @@ -362,6 +361,9 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
>  	if (sof_rt5682_quirk & SOF_RT5682S_HEADPHONE_CODEC_PRESENT) {
>  		pll_id = RT5682S_PLL2;
>  		clk_id = RT5682S_SCLK_S_PLL2;
> +
> +		if (pll_in == 24576000)
> +			clk_id = RT5682S_SCLK_S_MCLK;

this case only affects the RT5682s case.

>  	} else {
>  		pll_id = RT5682_PLL1;
>  		clk_id = RT5682_SCLK_S_PLL1;

for the RT5682 we keep using the PLL. Is this intentional?

I also wonder if we can avoid the hard-coding. Can we use e.g.

if (pll_in == params_rate(params) * 512)

?


> @@ -369,11 +371,14 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
>  
>  	pll_out = params_rate(params) * 512;
>  
> -	/* Configure pll for codec */
> -	ret = snd_soc_dai_set_pll(codec_dai, pll_id, pll_source, pll_in,
> -				  pll_out);
> -	if (ret < 0)
> -		dev_err(rtd->dev, "snd_soc_dai_set_pll err = %d\n", ret);
> +	/* when MCLK is 512FS, no need to set PLL configuration additionally. */
> +	if (pll_in != 24576000) {

can we use if (pll_in == pll_out) ?

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
