Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3905B6932
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 10:09:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8404A1753;
	Tue, 13 Sep 2022 10:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8404A1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663056553;
	bh=cvZ2TM6hCRLiJ4827CHcLJrAhi/wZiqFHNLaQ1jHwQU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jrp3DvFeKSD4C2kw4R3CykAsbDXiSochK30aQnVlxdizNkMudPj7yhLXmcwZuXQ8r
	 cUupUp5uQuJm3S4V81tVAjJ4OqzYXO33UHymsoTtip75ljopPRIGXHxSziDu9rShmT
	 J1MU4eHlZe27m2zArQk0PxLWnAKEc484PrTor4iI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE57CF800FE;
	Tue, 13 Sep 2022 10:08:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCD94F80224; Tue, 13 Sep 2022 10:08:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E822F800FE
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 10:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E822F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="T1byDERx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663056489; x=1694592489;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cvZ2TM6hCRLiJ4827CHcLJrAhi/wZiqFHNLaQ1jHwQU=;
 b=T1byDERxI81w/tJ/5IOpq4c/qV8R8vcPM3RLs+HhZ9mmjU2082q3/rAZ
 HBmIWnfbzhnFMUnhCmYG/CbSAeQ0ZwrVX0cAjkTEUr8Li/CnmFtuVV3uT
 RFRJ6mmSnc0tskVI0kbQkAbWL5pGS9D/evmTkWKJeCSADb+fbf07cyUb9
 2HnjCaTWpR+gAdb2LA4lgFuNl4kqjrDfW8Io0HkNJSUnzUrJrIKVCHqjQ
 IRDs01rFlLM/SaKjVNFPvvCTYT8DFrng1k2eXUnZX/g+mDCDVT3dGu6Gq
 urrPRwrJu3uK8xTiFV/1V8bNszgMROgvUqk1C863I/mFPCz/Ne05EdhA0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="278468716"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="278468716"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 01:07:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="618836636"
Received: from tleistix-mobl2.ger.corp.intel.com (HELO [10.251.208.174])
 ([10.251.208.174])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 01:07:38 -0700
Message-ID: <2577e4db-8593-cf37-135b-aa51b6268cd7@linux.intel.com>
Date: Tue, 13 Sep 2022 10:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: remove
 SOF_RT1015_SPEAKER_AMP_100FS flag
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20220913074906.926774-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220913074906.926774-1-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ajye Huang <ajye.huang@gmail.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>, Yong Zhi <yong.zhi@intel.com>
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




> -static int rt1015_hw_params_pll_and_tdm(struct snd_pcm_substream *substream,
> -					 struct snd_pcm_hw_params *params)
> -{
> -	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> -	struct snd_soc_dai *codec_dai;
> -	int i, fs = 100, ret;
> -
>  	for_each_rtd_codec_dais(rtd, i, codec_dai) {
>  		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
> -					  params_rate(params) * fs,
> +					  clk_freq,
>  					  params_rate(params) * 256);
> -		if (ret)
> +		if (ret) {
> +			dev_err(codec_dai->dev, "fail to set pll, ret %d\n",
> +				ret);
>  			return ret;
> +		}
>  
>  		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
>  					     params_rate(params) * 256,
>  					     SND_SOC_CLOCK_IN);
> -		if (ret)
> +		if (ret) {
> +			dev_err(codec_dai->dev, "fail to set sysclk, ret %d\n",
> +				ret);
>  			return ret;
> -	}
> -	/* rx slot 1 for RT1015_DEV0_NAME */
> -	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0),
> -				       0x0, 0x1, 4, 24);
> -	if (ret)
> -		return ret;
> +		}
>  
> -	/* rx slot 2 for RT1015_DEV1_NAME */
> -	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 1),
> -				       0x0, 0x2, 4, 24);
> -	if (ret)
> -		return ret;
> +		switch (dai_link->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +		case SND_SOC_DAIFMT_DSP_A:
> +		case SND_SOC_DAIFMT_DSP_B:
> +			/* 4-slot TDM */
> +			ret = snd_soc_dai_set_tdm_slot(codec_dai,
> +						       rt1015_tdm_mask[i].tx,
> +						       rt1015_tdm_mask[i].rx,
> +						       4,
> +						       params_width(params));

The changes look ok, just wondering if we can avoid hard-coding those 4
values. Can we not get the number of TDM slots from topology and/or
dailink configuration?


> +			if (ret < 0) {
> +				dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
> +					ret);
> +				return ret;
> +			}
> +			break;
> +		default:
> +			dev_dbg(codec_dai->dev, "codec is in I2S mode\n");
> +			break;
> +		}
> +	}
>  
> -	return 0;
> +	return ret;
