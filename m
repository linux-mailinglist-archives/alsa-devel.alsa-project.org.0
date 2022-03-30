Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 059B24ECA92
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 19:25:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87E7B185D;
	Wed, 30 Mar 2022 19:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87E7B185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648661129;
	bh=sXIvE9dNkgtO4EXOy67WUkJ/qQhK9TK+SEsx1XCzbNo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNPZOV3ychU5YKGthDIvAQ/mIufDYukz1+KcVk4mhKKzy4g7sLsvUgUWRHgkhJ2Kz
	 qdjQWzLwmWFpVtT62r2aVsu3iyRr7NtXVR8p3SSE8kCOSVEL+jOdSBXrNxqPUNe6Ig
	 MrBdL//hCD+M4+IQNBOXRjOjoyuP3gZdUELssUpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAD0FF8025A;
	Wed, 30 Mar 2022 19:24:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E0B0F80254; Wed, 30 Mar 2022 19:24:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF1F9F800F2
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 19:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF1F9F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ahzFnfI0"
Received: by mail-pf1-x431.google.com with SMTP id b15so19417244pfm.5
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 10:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=czlQvbkyhcIvLLP/kerBjk96Vh15ed44dz1d5B6c270=;
 b=ahzFnfI0hphDf3O+AHBufiZX0BHt092Wy224ems0w1nT2GF3hbO09GHnM1aXPSQXa8
 izSZm98/ey3wEGM4yhGNnOI151Iuceg/i6mHiC2cmoo0pcG+MbRpahKjFvXtnsefeupP
 emsBemXIOKGLevHkR5TK5/wOqklZvueumjohw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=czlQvbkyhcIvLLP/kerBjk96Vh15ed44dz1d5B6c270=;
 b=BD8eREgNbHIkiWkKKy6L5/wULzcgOGCZ+RNWP0TuXQ+jBWws30dT1FLNcI6MGXA7mK
 l0KBufSKajhynGQObwXwTU3cxjJODervi2LXEnibKgJOa1GAzLBGCWbHZPlrQ3i94NMr
 YODzEUM/+b6FLP0ibJ2Ox9kRRmB85wAYAx+F35SfiW5JV+s+PpNsynkZZpQJTKb/APhl
 i68fC0ZXVNB/y7qGXOS/hSnKNUOmVZug70q9Gl++nbICzjeU3RvWgSsGdVcV8+X8pGId
 Ua0B8cRKUX3G6fwZctK9me0wHB6z4HHun4dJ+bLLNtOm4mPz9WwYyGTEmQlcH5rDhYmP
 dUeA==
X-Gm-Message-State: AOAM533FpuAKSad8tKDH/vygde9bOjDEc51NE6Gg/IrGHfwcxsb9DsLR
 zI3di7mbAbJXYiB7+gNuj6QDqg==
X-Google-Smtp-Source: ABdhPJy1cMvbpr6Uu0vAt3g+S0FU168G58nrHSfPAT9H/HOzwsO0LQU4+C4+f6gSMeQOuU/fa0VijA==
X-Received: by 2002:a05:6a00:885:b0:4f4:17d8:be31 with SMTP id
 q5-20020a056a00088500b004f417d8be31mr438686pfj.57.1648661050000; 
 Wed, 30 Mar 2022 10:24:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d50d:daac:acf3:cda6])
 by smtp.gmail.com with UTF8SMTPSA id
 q20-20020a056a00151400b004fb31b073cesm17568038pfu.109.2022.03.30.10.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 10:24:09 -0700 (PDT)
Date: Wed, 30 Mar 2022 10:24:07 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [v1] ASoC: qcom: Add driver support for ALC5682I-VS.
Message-ID: <YkSSNypRYqM4PtFB@google.com>
References: <20220330084519.3863856-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220330084519.3863856-1-judyhsiao@chromium.org>
Cc: dianders@chromium.org, judyhsiao@google.com,
 Banajit Goswami <bgoswami@codeaurora.org>, cychiang@google.com,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, yuhsuan@chromium.org
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

On Wed, Mar 30, 2022 at 04:45:19PM +0800, Judy Hsiao wrote:
> Subject: ASoC: qcom: Add driver support for ALC5682I-VS.

nit: drop period from the subject

> Add Machine driver support for ALC5682I-VS codec.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  sound/soc/qcom/Kconfig  |   2 +
>  sound/soc/qcom/sc7280.c | 104 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 106 insertions(+)
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 28d0dfb4033c..750653404ba3 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -197,6 +197,8 @@ config SND_SOC_SC7280
>  	select SND_SOC_LPASS_MACRO_COMMON
>  	imply SND_SOC_LPASS_RX_MACRO
>  	imply SND_SOC_LPASS_TX_MACRO
> +	select SND_SOC_RT5682_I2C
> +	select SND_SOC_RT5682S
>  	help
>  	  Add support for audio on Qualcomm Technologies Inc.
>  	  SC7280 SoC-based systems.
> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
> index bd0bf9c8cb28..a3e6f61e92cb 100644
> --- a/sound/soc/qcom/sc7280.c
> +++ b/sound/soc/qcom/sc7280.c
> @@ -12,14 +12,20 @@
>  #include <sound/jack.h>
>  #include <sound/pcm.h>
>  #include <sound/soc.h>
> +#include <sound/rt5682s.h>
>  #include <linux/soundwire/sdw.h>
>  
> +#include "../codecs/rt5682.h"
> +#include "../codecs/rt5682s.h"
>  #include "common.h"
>  #include "lpass.h"
>  
> +#define DEFAULT_MCLK_RATE              19200000
> +#define RT5682_PLL1_FREQ (48000 * 512)
>  struct sc7280_snd_data {
>  	struct snd_soc_card card;
>  	struct sdw_stream_runtime *sruntime[LPASS_MAX_PORTS];
> +	u32 pri_mi2s_clk_count;
>  	struct snd_soc_jack hs_jack;
>  	struct snd_soc_jack hdmi_jack;
>  	bool jack_setup;
> @@ -69,6 +75,7 @@ static int sc7280_headset_init(struct snd_soc_pcm_runtime *rtd)
>  		pdata->jack_setup = true;
>  	}
>  	switch (cpu_dai->id) {
> +	case MI2S_PRIMARY:
>  	case LPASS_CDC_DMA_RX0:
>  	case LPASS_CDC_DMA_TX3:
>  		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> @@ -110,11 +117,49 @@ static int sc7280_hdmi_init(struct snd_soc_pcm_runtime *rtd)
>  	return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
>  }
>  
> +static int sc7280_rt5682_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_card *card = rtd->card;
> +	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
> +	int ret;
> +
> +	if (++data->pri_mi2s_clk_count == 1) {
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			LPASS_MCLK0,
> +			DEFAULT_MCLK_RATE,
> +			SNDRV_PCM_STREAM_PLAYBACK);
> +	}
> +	snd_soc_dai_set_fmt(codec_dai,
> +				SND_SOC_DAIFMT_CBS_CFS |
> +				SND_SOC_DAIFMT_NB_NF |
> +				SND_SOC_DAIFMT_I2S);
> +
> +	ret = snd_soc_dai_set_pll(codec_dai, RT5682S_PLL1, RT5682S_PLL_S_BCLK1,
> +					1536000, RT5682_PLL1_FREQ);
> +	if (ret) {
> +		dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682S_SCLK_S_PLL1,
> +					RT5682_PLL1_FREQ,
> +					SND_SOC_CLOCK_IN);
> +
> +	if (ret)
> +		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
> +			ret);

With the current code the function would return 0, I imagine that's not
intended.

> +
> +	return 0;
> +}
> +
