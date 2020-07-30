Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EB72337C9
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 19:38:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 596B51676;
	Thu, 30 Jul 2020 19:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 596B51676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596130696;
	bh=gWFyaJuvp8dAhkdd47ZR1wXvR6hAXdUvbm1ynq4N2pY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TPuCP040SZT5EMCl92RjZjNZnWjiNdlsG07e8/KVH+55lIVOS6M0CgKUzpGTPHKpD
	 f5tmI1itiYwrbjkr8/mtz+WHksUoLzXFoobtFqUSRSFGGTRlmuJ+WdjcxkOWyMOO+a
	 Dp5vIqYj9F05ZhC/nRiBDG6ZIB8AeTy9WHotloYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 986EFF80111;
	Thu, 30 Jul 2020 19:36:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7B2DF8021E; Thu, 30 Jul 2020 19:36:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD423F80111
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 19:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD423F80111
IronPort-SDR: b0WX4noYK3+6XhFXTva7rZ5YignHKu65vrX+3nRIGS1PIdY04IbfOHZLlcoMnh7HJDI9cu1+20
 j1Nny0oY9+Cw==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="149485956"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="149485956"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 10:36:24 -0700
IronPort-SDR: J+cBjAUFg6+143oVDL5RZeGSDQxV6bLu40H91dr8wU3rHUZexhTzwohHWdjcTXTfkOKe1wqFkj
 nimyamDy6n7g==
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="286929621"
Received: from jrwang2-mobl.amr.corp.intel.com (HELO [10.212.82.25])
 ([10.212.82.25])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 10:36:23 -0700
Subject: Re: [PATCH v2] ASoC: Intel: boards: eve: Fix DMIC records zero
To: Harsha Priya <harshapriya.n@intel.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <1596129988-304-1-git-send-email-harshapriya.n@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2788f0fd-adaa-c56d-6801-503432ba7ee6@linux.intel.com>
Date: Thu, 30 Jul 2020 12:36:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596129988-304-1-git-send-email-harshapriya.n@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
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


>   	/*
>   	 * MCLK/SCLK need to be ON early for a successful synchronization of
>   	 * codec internal clock. And the clocks are turned off during
> @@ -91,38 +108,48 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
>   	 */
>   	switch (event) {
>   	case SND_SOC_DAPM_PRE_PMU:
> -		/* Enable MCLK */
>   		ret = clk_set_rate(priv->mclk, 24000000);
>   		if (ret < 0) {
> -			dev_err(card->dev, "Can't set rate for mclk, err: %d\n",
> -				ret);
> -			return ret;
> +			dev_err(card->dev, "Can't set rate for mclk for ssp%d, err: %d\n",
> +				ssp_num, ret);
> +				return ret;

nit-pick: alignment is off for the 'return ret'.

>   		}
>   
> -		ret = clk_prepare_enable(priv->mclk);
> -		if (ret < 0) {
> -			dev_err(card->dev, "Can't enable mclk, err: %d\n", ret);
> -			return ret;
> +		if (!__clk_is_enabled(priv->mclk)) {
> +			/* Enable MCLK */
> +			ret = clk_prepare_enable(priv->mclk);

That seems correct since you share the mclk between two resources but 
see [1] below

> +			if (ret < 0) {
> +				dev_err(card->dev, "Can't enable mclk for ssp%d, err: %d\n",
> +					ssp_num, ret);
> +				return ret;
> +			}
>   		}
>   
> -		/* Enable SCLK */
> -		ret = clk_set_rate(priv->sclk, 3072000);
> +		ret = clk_set_rate(sclk, sclk_rate);
>   		if (ret < 0) {
> -			dev_err(card->dev, "Can't set rate for sclk, err: %d\n",
> -				ret);
> +			dev_err(card->dev, "Can't set rate for sclk for ssp%d, err: %d\n",
> +				ssp_num, ret);
>   			clk_disable_unprepare(priv->mclk);
>   			return ret;
>   		}
>   
> -		ret = clk_prepare_enable(priv->sclk);
> -		if (ret < 0) {
> -			dev_err(card->dev, "Can't enable sclk, err: %d\n", ret);
> -			clk_disable_unprepare(priv->mclk);
> +		if (!__clk_is_enabled(sclk)) {

Why do you need this test? the sclocks are not shared? see also [2] below

> +			/* Enable SCLK */
> +			ret = clk_prepare_enable(sclk);
> +			if (ret < 0) {
> +				dev_err(card->dev, "Can't enable sclk for ssp%d, err: %d\n",
> +					ssp_num, ret);
> +				clk_disable_unprepare(priv->mclk);
> +				return ret;
> +			}
>   		}
>   		break;
>   	case SND_SOC_DAPM_POST_PMD:
> -		clk_disable_unprepare(priv->mclk);
> -		clk_disable_unprepare(priv->sclk);
> +		if (__clk_is_enabled(priv->mclk))
> +			clk_disable_unprepare(priv->mclk);
> +

[1] this seems wrong in case you have two SSPs working, and stop one. 
This would turn off the mclk while one of the two SSPs is still working.

> +		if (__clk_is_enabled(sclk))

[2] Again is this test needed since sclk is not shared between SSPs

> +			clk_disable_unprepare(sclk);

