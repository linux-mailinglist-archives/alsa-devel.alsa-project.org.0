Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C74153748C
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 09:21:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97789191E;
	Mon, 30 May 2022 09:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97789191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653895293;
	bh=7S17Q2nGio7Iq23EDnAAhNPluUQv4vpzCSs1ZpBYz70=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QUCZIC+EG8tw5RwLl2ub679EqqKZRL09tjYPmxxq6HC6ICPlEdwKIV9lZQOHh7nw+
	 az6gWr/RkDrv6TYaNECAyWTx5xuRdYf8bHUwYq5L2pXx1AcUQ3cmhF2B4QDFNssATb
	 2CwfayBltunxBkaYqCxgRV6rtdAkf1kSfEIwbf6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A3BFF801F5;
	Mon, 30 May 2022 09:20:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D46AF80279; Sat, 28 May 2022 11:17:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 853E2F80124
 for <alsa-devel@alsa-project.org>; Sat, 28 May 2022 11:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 853E2F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LD81542I"
Received: by mail-lj1-x22c.google.com with SMTP id v9so7092265lja.12
 for <alsa-devel@alsa-project.org>; Sat, 28 May 2022 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4AsMBYjaCbPUjugaq7DmP2Bn6t4OXtAIJ6K1lbWCPpo=;
 b=LD81542I5JgGIWWa8sMguiyhmKk5EcA48B7PIF/17V2lhqHZU316ogdL+m9CGYc9k8
 9wXlu/EdGeZ2gDZgnU9di9ql27TZYy1KPMQttJP+vS2avnqrvjOvRPBcLlZxJ/1EjwMn
 qsxOXkPtuJCFIdLhiLp1fjw8EzGmuRoj+uzFS3CLMslo1QXhgIop57xV1k8knI6Jq+0F
 1a4e5A0uHAaP1IV93ziGs6i9UlEzWNwnSmfwuN3eBBoA2mUnq0dpyvW7UENs/ChdWz9v
 v+cMJeCZMtXFWlKLKqEiP2bFKyCus6ibZNHlG4wkRXT1HHZKv70toSR/25s15eR6GT5f
 Ec2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4AsMBYjaCbPUjugaq7DmP2Bn6t4OXtAIJ6K1lbWCPpo=;
 b=KTNXvT5VAZNS8G3SzqB/Kiaf7BtihgiwPvbZTLfNHPXyHKWw/NDeWhroX4JwxO7Ea8
 3WZJspw/K/QTMIfAdOPJcL1GMcQXnIBon206bawj/szOtU7WYpytfQYByCXKnmaQ9xuC
 cVltyKTEF9PcWlGL6NNhKEhjyHTxuMBp2cMKEPjH4US/B5bQdhJB78JTYsPi7rpjegwS
 RXFkh3MCP6C07k6vWw0jS7PUmpeOAWmSaXsx99Uqi7o1cnmvaAvtCZAIwpf87DasVAXv
 Ft8XPMQDdB4FcswFRufWGJKAx+mqLDneG9kMlMGDZ3ga5DQ/YSyjtYIFC+4P5lKAmnmi
 XMTQ==
X-Gm-Message-State: AOAM533Q2JUlVEXpXCrdMT5YrwM5+coiqFS90pYc6HC2q0NGlIYAHTbE
 NzZXGOo3ayzeEgLxQfUmqik=
X-Google-Smtp-Source: ABdhPJwBbL3mkzKywpc+IfrnbZ4hmf9StcqSwcwm8m0YGTWqNE/eSCSKyfUOG/h/I7gMut48Zoqa6A==
X-Received: by 2002:a2e:7819:0:b0:255:4957:c350 with SMTP id
 t25-20020a2e7819000000b002554957c350mr633181ljc.426.1653729458980; 
 Sat, 28 May 2022 02:17:38 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 l2-20020ac24a82000000b004785b66a9a4sm1243469lfp.126.2022.05.28.02.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 May 2022 02:17:38 -0700 (PDT)
Message-ID: <a92ef8a0-e065-60fe-1f5f-a5ecf0ca74c9@gmail.com>
Date: Sat, 28 May 2022 12:18:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 25/56] ASoC: ti: Update to use set_fmt_new callback
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-26-ckeepax@opensource.cirrus.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220519154318.2153729-26-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 30 May 2022 09:20:34 +0200
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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


On 19/05/2022 18:42, Charles Keepax wrote:
> As part of updating the core to directly tell drivers if they are clock
> provider or consumer update these CPU side drivers to use the new direct
> callback.

looks good, thanks Charles,

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/ti/davinci-i2s.c   | 34 +++++++++++++++++-----------------
>  sound/soc/ti/davinci-mcasp.c | 12 ++++++------
>  sound/soc/ti/omap-mcbsp.c    | 14 +++++++-------
>  3 files changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
> index 0363a088d2e00..c7368d5296688 100644
> --- a/sound/soc/ti/davinci-i2s.c
> +++ b/sound/soc/ti/davinci-i2s.c
> @@ -230,15 +230,15 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  
>  	dev->fmt = fmt;
>  	/* set master/slave audio interface */
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* cpu is master */
>  		pcr = DAVINCI_MCBSP_PCR_FSXM |
>  			DAVINCI_MCBSP_PCR_FSRM |
>  			DAVINCI_MCBSP_PCR_CLKXM |
>  			DAVINCI_MCBSP_PCR_CLKRM;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFS:
> +	case SND_SOC_DAIFMT_BC_FP:
>  		pcr = DAVINCI_MCBSP_PCR_FSRM | DAVINCI_MCBSP_PCR_FSXM;
>  		/*
>  		 * Selection of the clock input pin that is the
> @@ -260,7 +260,7 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  		}
>  
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* codec is master */
>  		pcr = 0;
>  		break;
> @@ -395,12 +395,12 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
>  	}
>  
> -	master = dev->fmt & SND_SOC_DAIFMT_MASTER_MASK;
> +	master = dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
>  	fmt = params_format(params);
>  	mcbsp_word_length = asp_word_length[fmt];
>  
>  	switch (master) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	case SND_SOC_DAIFMT_BP_FP:
>  		freq = clk_get_rate(dev->clk);
>  		srgr = DAVINCI_MCBSP_SRGR_FSGM |
>  		       DAVINCI_MCBSP_SRGR_CLKSM;
> @@ -426,7 +426,7 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  		clk_div &= 0xFF;
>  		srgr |= clk_div;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFS:
> +	case SND_SOC_DAIFMT_BC_FP:
>  		srgr = DAVINCI_MCBSP_SRGR_FSGM;
>  		clk_div = dev->clk_div - 1;
>  		srgr |= DAVINCI_MCBSP_SRGR_FWID(mcbsp_word_length * 8 - 1);
> @@ -434,7 +434,7 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  		clk_div &= 0xFF;
>  		srgr |= clk_div;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* Clock and frame sync given from external sources */
>  		i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_SAMPLE_BITS);
>  		srgr = DAVINCI_MCBSP_SRGR_FSGM;
> @@ -473,15 +473,15 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  			fmt = double_fmt[fmt];
>  		}
>  		switch (master) {
> -		case SND_SOC_DAIFMT_CBS_CFS:
> -		case SND_SOC_DAIFMT_CBS_CFM:
> +		case SND_SOC_DAIFMT_BP_FP:
> +		case SND_SOC_DAIFMT_BP_FC:
>  			rcr |= DAVINCI_MCBSP_RCR_RFRLEN2(0);
>  			xcr |= DAVINCI_MCBSP_XCR_XFRLEN2(0);
>  			rcr |= DAVINCI_MCBSP_RCR_RPHASE;
>  			xcr |= DAVINCI_MCBSP_XCR_XPHASE;
>  			break;
> -		case SND_SOC_DAIFMT_CBM_CFM:
> -		case SND_SOC_DAIFMT_CBM_CFS:
> +		case SND_SOC_DAIFMT_BC_FC:
> +		case SND_SOC_DAIFMT_BC_FP:
>  			rcr |= DAVINCI_MCBSP_RCR_RFRLEN2(element_cnt - 1);
>  			xcr |= DAVINCI_MCBSP_XCR_XFRLEN2(element_cnt - 1);
>  			break;
> @@ -492,13 +492,13 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  	mcbsp_word_length = asp_word_length[fmt];
>  
>  	switch (master) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> -	case SND_SOC_DAIFMT_CBS_CFM:
> +	case SND_SOC_DAIFMT_BP_FP:
> +	case SND_SOC_DAIFMT_BP_FC:
>  		rcr |= DAVINCI_MCBSP_RCR_RFRLEN1(0);
>  		xcr |= DAVINCI_MCBSP_XCR_XFRLEN1(0);
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> -	case SND_SOC_DAIFMT_CBM_CFS:
> +	case SND_SOC_DAIFMT_BC_FC:
> +	case SND_SOC_DAIFMT_BC_FP:
>  		rcr |= DAVINCI_MCBSP_RCR_RFRLEN1(element_cnt - 1);
>  		xcr |= DAVINCI_MCBSP_XCR_XFRLEN1(element_cnt - 1);
>  		break;
> @@ -606,7 +606,7 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
>  	.prepare	= davinci_i2s_prepare,
>  	.trigger	= davinci_i2s_trigger,
>  	.hw_params	= davinci_i2s_hw_params,
> -	.set_fmt	= davinci_i2s_set_dai_fmt,
> +	.set_fmt_new	= davinci_i2s_set_dai_fmt,
>  	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
>  
>  };
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 377be2e2b6ee7..961bac6963652 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -492,8 +492,8 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  	mcasp_mod_bits(mcasp, DAVINCI_MCASP_RXFMT_REG, FSRDLY(data_delay),
>  		       FSRDLY(3));
>  
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* codec is clock and frame slave */
>  		mcasp_set_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, ACLKXE);
>  		mcasp_set_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, AFSXE);
> @@ -510,7 +510,7 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  
>  		mcasp->bclk_master = 1;
>  		break;
> -	case SND_SOC_DAIFMT_CBS_CFM:
> +	case SND_SOC_DAIFMT_BP_FC:
>  		/* codec is clock slave and frame master */
>  		mcasp_set_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, ACLKXE);
>  		mcasp_clr_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, AFSXE);
> @@ -527,7 +527,7 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  
>  		mcasp->bclk_master = 1;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFS:
> +	case SND_SOC_DAIFMT_BC_FP:
>  		/* codec is clock master and frame slave */
>  		mcasp_clr_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, ACLKXE);
>  		mcasp_set_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, AFSXE);
> @@ -544,7 +544,7 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  
>  		mcasp->bclk_master = 0;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* codec is clock and frame master */
>  		mcasp_clr_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, ACLKXE);
>  		mcasp_clr_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, AFSXE);
> @@ -1620,7 +1620,7 @@ static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
>  	.trigger	= davinci_mcasp_trigger,
>  	.delay		= davinci_mcasp_delay,
>  	.hw_params	= davinci_mcasp_hw_params,
> -	.set_fmt	= davinci_mcasp_set_dai_fmt,
> +	.set_fmt_new	= davinci_mcasp_set_dai_fmt,
>  	.set_clkdiv	= davinci_mcasp_set_clkdiv,
>  	.set_sysclk	= davinci_mcasp_set_sysclk,
>  	.set_tdm_slot	= davinci_mcasp_set_tdm_slot,
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 4479d74f0a458..5bfb56d4ff844 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -1036,8 +1036,8 @@ static int omap_mcbsp_dai_hw_params(struct snd_pcm_substream *substream,
>  
>  	/* In McBSP master modes, FRAME (i.e. sample rate) is generated
>  	 * by _counting_ BCLKs. Calculate frame size in BCLKs */
> -	master = mcbsp->fmt & SND_SOC_DAIFMT_MASTER_MASK;
> -	if (master ==	SND_SOC_DAIFMT_CBS_CFS) {
> +	master = mcbsp->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
> +	if (master == SND_SOC_DAIFMT_BP_FP) {
>  		div = mcbsp->clk_div ? mcbsp->clk_div : 1;
>  		framesize = (mcbsp->in_freq / div) / params_rate(params);
>  
> @@ -1136,20 +1136,20 @@ static int omap_mcbsp_dai_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  		return -EINVAL;
>  	}
>  
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* McBSP master. Set FS and bit clocks as outputs */
>  		regs->pcr0	|= FSXM | FSRM |
>  				   CLKXM | CLKRM;
>  		/* Sample rate generator drives the FS */
>  		regs->srgr2	|= FSGM;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFS:
> +	case SND_SOC_DAIFMT_BC_FP:
>  		/* McBSP slave. FS clock as output */
>  		regs->srgr2	|= FSGM;
>  		regs->pcr0	|= FSXM | FSRM;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* McBSP slave */
>  		break;
>  	default:
> @@ -1271,7 +1271,7 @@ static const struct snd_soc_dai_ops mcbsp_dai_ops = {
>  	.trigger	= omap_mcbsp_dai_trigger,
>  	.delay		= omap_mcbsp_dai_delay,
>  	.hw_params	= omap_mcbsp_dai_hw_params,
> -	.set_fmt	= omap_mcbsp_dai_set_dai_fmt,
> +	.set_fmt_new	= omap_mcbsp_dai_set_dai_fmt,
>  	.set_clkdiv	= omap_mcbsp_dai_set_clkdiv,
>  	.set_sysclk	= omap_mcbsp_dai_set_dai_sysclk,
>  };

-- 
Péter
