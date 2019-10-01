Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D54B2C35D9
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 15:36:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E391167C;
	Tue,  1 Oct 2019 15:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E391167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569937018;
	bh=zdntYU24hvR4SyRhaIMaF0REvCg0iM3Yd2Ef0TrLsC0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TQWBChBy6LD3whfcQ3t2nKtFIvHnrPXGIkKaSJE1yYLS+ZGsSmFXH4yjNm2vtGTWd
	 ZKPJi/vEN+n+fsD1Un2tPjEG12IiJ4CWgJnY76BNmMKSBuWVvRCeCZM83ghl6u+Nub
	 ZATVd9IGJOe1YNNYUIsaNxG2BfRu7MwO0eG+kJUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C3B1F80506;
	Tue,  1 Oct 2019 15:35:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30738F80506; Tue,  1 Oct 2019 15:35:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23AC1F800DE
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 15:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23AC1F800DE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 06:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; d="scan'208";a="194529042"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 01 Oct 2019 06:35:05 -0700
Received: from anuprani-mobl2.gar.corp.intel.com (unknown [10.251.3.192])
 by linux.intel.com (Postfix) with ESMTP id 1897E5803DA;
 Tue,  1 Oct 2019 06:35:04 -0700 (PDT)
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <1569919250-24472-1-git-send-email-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <823bff94-3135-c3a9-4d7f-c07b564faba2@linux.intel.com>
Date: Tue, 1 Oct 2019 08:35:03 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569919250-24472-1-git-send-email-brent.lu@intel.com>
Content-Language: en-US
Cc: cezary.rojewski@intel.com, harshapriya.n@intel.com,
 "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>,
 yang.jie@linux.intel.com, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, broonie@kernel.org, naveen.m@intel.com,
 yung-chuan.liao@linux.intel.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: eve: Enable mclk and ssp sclk
 early
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


> rt5663 and rt5514 needs mclk/sclk early to synchronize its internal
> clocks.

There are a couple of differences with similar code used in 
kbl_rt5663_max98927, see below


> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> index 5c27f7a..d5f167e 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -315,6 +315,7 @@ config SND_SOC_INTEL_KBL_RT5663_RT5514_MAX98927_MACH
>   	depends on I2C && ACPI
>   	depends on MFD_INTEL_LPSS || COMPILE_TEST
>           depends on SPI
> +	select SND_SOC_INTEL_SKYLAKE_SSP_CLK

It would be nicer to follow the same order as for kbl_rt5663_max98927, 
with this SKYLAKE_SSP_CLK added last after HDAC_HDMI


> +static int platform_clock_control(struct snd_soc_dapm_widget *w,
> +			struct snd_kcontrol *k, int  event)
> +{
> +	struct snd_soc_dapm_context *dapm = w->dapm;
> +	struct snd_soc_card *card = dapm->card;
> +	struct kbl_codec_private *priv = snd_soc_card_get_drvdata(card);
> +	int ret = 0;
> +
> +	/*
> +	 * MCLK/SCLK need to be ON early for a successful synchronization of
> +	 * codec internal clock. And the clocks are turned off during
> +	 * POST_PMD after the stream is stopped.
> +	 */
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		if (__clk_is_enabled(priv->mclk))
> +			return 0;

Is this if() test needed? it's not part of the code for 
kbl_rt5663_max98927, despite all the comments and code structure being 
identical.

> +
> +		/* Enable MCLK */
> +		ret = clk_set_rate(priv->mclk, 24000000);
> +		if (ret < 0) {
> +			dev_err(card->dev, "Can't set rate for mclk, err: %d\n",
> +				ret);
> +			return ret;
> +		}
> +
> +		ret = clk_prepare_enable(priv->mclk);
> +		if (ret < 0) {
> +			dev_err(card->dev, "Can't enable mclk, err: %d\n", ret);
> +			return ret;
> +		}
> +
> +		/* Enable SCLK */
> +		ret = clk_set_rate(priv->sclk, 3072000);
> +		if (ret < 0) {
> +			dev_err(card->dev, "Can't set rate for sclk, err: %d\n",
> +				ret);
> +			clk_disable_unprepare(priv->mclk);
> +			return ret;
> +		}
> +
> +		ret = clk_prepare_enable(priv->sclk);
> +		if (ret < 0) {
> +			dev_err(card->dev, "Can't enable sclk, err: %d\n", ret);
> +			clk_disable_unprepare(priv->mclk);
> +		}
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		if (!__clk_is_enabled(priv->mclk))
> +			return 0;

same here, is this if() test needed? If yes, isn't it needed in 
kbl_rt5663_max98927?

> +
> +		clk_disable_unprepare(priv->mclk);
> +		clk_disable_unprepare(priv->sclk);
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +

While I am at it, this machine driver uses .ignore_pmdown_time, which is 
typically used to avoid clock issues. Now that you have an explicit 
control on clocks, is .ignore_pmdown_time actually required?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
