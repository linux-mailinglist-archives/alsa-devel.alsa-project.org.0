Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F2B3E441D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 12:46:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA63167E;
	Mon,  9 Aug 2021 12:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA63167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628505976;
	bh=rMlA82JGaLiJR86gO6cuWzk+Ciy2mu6QJFvT7YeHNEM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SvlSUbZQIqoB3qsSy5EJ38IgauiAwIaUnn6zglfUOzM0OfGTPGhoc6qC4eTqZJFjC
	 2yLEd5UXP3I2UZMrMYjUJWFCx2kJIucZIqe0wZXTwX3WGNXbLN90a/xFtLypl/PCpR
	 NUQkRHgetpIr+YLHDzT6xcvu3o89C6ri6ECpBg7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3992F8032D;
	Mon,  9 Aug 2021 12:44:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3659BF802D2; Mon,  9 Aug 2021 12:44:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DDCCF800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 12:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DDCCF800FD
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="214395227"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="214395227"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 03:44:34 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="438886157"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.12.103])
 ([10.237.12.103])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 03:44:32 -0700
Subject: Re: [PATCH] ASoC: nau8821: new driver
To: Seven Lee <wtli@nuvoton.com>, broonie@kernel.org
References: <20210809101000.3947156-1-wtli@nuvoton.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <7fac2710-0173-cbc0-94e1-fb168dc4f069@linux.intel.com>
Date: Mon, 9 Aug 2021 12:44:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809101000.3947156-1-wtli@nuvoton.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com, supercraig0719@gmail.com
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

On 8/9/2021 12:10 PM, Seven Lee wrote:
> Add driver for NAU88L21.
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---

...

> +
> +static int dmic_clock_control(struct snd_soc_dapm_widget *w,
> +		struct snd_kcontrol *k, int  event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
> +	int i, speed_selection, clk_adc_src, clk_adc;
> +	unsigned int clk_divider_r03;
> +
> +	/* The DMIC clock is gotten from adc clock divided by
> +	 * CLK_DMIC_SRC (1, 2, 4, 8). The clock has to be equal or
> +	 * less than nau8821->dmic_clk_threshold.
> +	 */
> +	regmap_read(nau8821->regmap, NAU8821_R03_CLK_DIVIDER,
> +		&clk_divider_r03);
> +	clk_adc_src = (clk_divider_r03 & NAU8821_CLK_ADC_SRC_MASK)
> +		>> NAU8821_CLK_ADC_SRC_SFT;
> +
> +	switch (clk_adc_src) {
> +	case 0:
> +		clk_adc = nau8821->fs * 256;
> +		break;
> +	case 1:
> +		clk_adc = (nau8821->fs * 256) >> 1;
> +		break;
> +	case 2:
> +		clk_adc = (nau8821->fs * 256) >> 2;
> +		break;
> +	case 3:
> +		clk_adc = (nau8821->fs * 256) >> 3;
> +		break;
> +	}

Just do:
clk_adc = (nau8821->fs * 256) >> clk_adc_src;
instead of whole switch?

> +
> +	for (i = 0 ; i < 4 ; i++) {
> +		if ((clk_adc >> dmic_speed_sel[i].param) <=
> +			nau8821->dmic_clk_threshold) {
> +			speed_selection = dmic_speed_sel[i].val;
> +			break;
> +		}
> +	}
> +
> +	dev_dbg(nau8821->dev,
> +		"clk_adc=%d, dmic_clk_threshold = %d, param=%d, val = %d\n",
> +		clk_adc, nau8821->dmic_clk_threshold,
> +		dmic_speed_sel[i].param, dmic_speed_sel[i].val);
> +	regmap_update_bits(nau8821->regmap, NAU8821_R13_DMIC_CTRL,
> +		NAU8821_DMIC_SRC_MASK,
> +		(speed_selection << NAU8821_DMIC_SRC_SFT));
> +
> +	return 0;
> +}
> +

...

> +
> +static int nau8821_clock_check(struct nau8821 *nau8821,
> +	int stream, int rate, int osr)
> +{
> +	int osrate = 0;
> +
> +	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		if (osr >= ARRAY_SIZE(osr_dac_sel))
> +			return -EINVAL;
> +		osrate = osr_dac_sel[osr].osr;
> +	} else {
> +		if (osr >= ARRAY_SIZE(osr_adc_sel))
> +			return -EINVAL;
> +		osrate = osr_adc_sel[osr].osr;
> +	}
true and false cases seem to be the same here, you can remove the "if 
else" and just leave one of them.

> +
> +	if (!osrate || rate * osrate > CLK_DA_AD_MAX) {
> +		dev_err(nau8821->dev,
> +		"exceed the maximum frequency of CLK_ADC or CLK_DAC\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +

...
