Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D89562F8062
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 17:15:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50ED01808;
	Fri, 15 Jan 2021 17:15:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50ED01808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610727355;
	bh=wSHW53VWTHZD56hECLUVohcgKxWTe2FwhI8ZUC35L94=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLMiakjcd2fvmmET9kog6MAuHBQMgMpo5nT/PB0TS8JfcdL82DJUPC/Rxx7Un0xXV
	 AP0HYRDGM1uBb2j7wW2reccbKoylznl5iD6iPVM/Oq3oBZnMR9pskx03Tmfvx826tk
	 FVOmPeSDI7ywQ7s58PLU0bSh23jXRoeZTWLYLJ4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D92A5F80254;
	Fri, 15 Jan 2021 17:14:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B18CF801ED; Fri, 15 Jan 2021 17:14:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0634F80134
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 17:14:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0634F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="tOCLBZjK"
Received: by mail-wr1-x42d.google.com with SMTP id l12so4607142wry.2
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 08:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zAzSREuAdpLgrIydvxgTpeK3rSayDnVbJH39X7xQoe8=;
 b=tOCLBZjKsNWZKLA65gfJ7zhbtOyrcjTVZrrDS/Ul5AsbAxSfgGHVOYdsXo6DyN3XP2
 NUTeQlLHrv+N3kRVyamfMjnQgU0u1YNhEa6iFXkCObHGlS0tHr09kU2futRSGjs7zv/7
 cR+XkDdsqm9Xg7oPjpTnAjAc+yrCvax3BkFelS8V1+OwZBqq2JKk1pXdA7edHxcndFrg
 DODpJ5T/+0Mp9RFmE7DqQgS8mWUvZ2uug1ynVLyMxEkdWj+RPgB4gV/ZLqq8+3RXqgPp
 CTrWienU+w9SDnJfB1E3mGlcjVvfzJXaa8M8qQ+jGrvXxTczGHV+Vs07jmLDqbIYP68H
 tCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zAzSREuAdpLgrIydvxgTpeK3rSayDnVbJH39X7xQoe8=;
 b=LUc/aRGGcTKr7H7pEDZDZY8exToIdmsJkbo0TKWrKxhkn4BHOgrmsGQ0CHUlyQ689Y
 rbmyk8vbTgDQi2jkpozvPC5Woxmy/Ij6J6oOBacas1/Q1GSsoV0IBrRAREQAOSc+1ZZv
 DQRF7bI2YCu0cg0Mb8bN4CJRuzE1NTjYd/gNGMfRBQgO9T8oykfroNAG9QiEamklocTg
 l+v7YfJ+00AXaoKh+KoodiDON4TToGxB5l9A5Xq4YmTEG4yn69pUuoQeZurVI+VxuwpE
 PH9bVwycajrATFV+uojGic+dfzwp1C6CD1Wsw+ZwY3cILYJ34SaGmMubgofYZaXPt1lL
 i21g==
X-Gm-Message-State: AOAM5321BvXa4Rqb06qNa6ELpxOe7HZkBf4TWFMTGpjnv+R+rnWbC4ir
 hGNvReI2nr+TS+w57bP+CMCfFA==
X-Google-Smtp-Source: ABdhPJz34rX8jPFZwO1dfQM6uqioSaQKYxC1+XO0trEXDlP+dnjdQpqtUXlYdsZDSVXJDadQ93WzXw==
X-Received: by 2002:adf:8b15:: with SMTP id n21mr13687058wra.426.1610727247506; 
 Fri, 15 Jan 2021 08:14:07 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id e15sm15776034wrx.86.2021.01.15.08.14.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Jan 2021 08:14:06 -0800 (PST)
Subject: Re: [PATCH 1/2] ASoC: qcom: lpass: Fix hardcoded SC7810 DAI IDs
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20210114094615.58191-1-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <68691a9f-f65d-da1a-a413-b624567ccc5f@linaro.org>
Date: Fri, 15 Jan 2021 16:14:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210114094615.58191-1-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
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

Hi Stephen,

Many thanks for looking into this issue!

On 14/01/2021 09:46, Stephan Gerhold wrote:
> LPASS is broken on MSM8916/DragonBoard 410c since Linux 5.10.
> 
> Attempting to play HDMI audio results in:
> 
>    ADV7533: lpass_platform_pcmops_hw_params: invalid  interface: 3
>    ADV7533: lpass_platform_pcmops_trigger: invalid 3 interface
>    apq8016-lpass-cpu 7708000.audio-controller: ASoC: error at soc_component_trigger on 7708000.audio-controller: -22
> 
> Attempting to record analog audio results in:
> 
>    Unable to handle kernel NULL pointer dereference at virtual address 00000000000001e4
>    Internal error: Oops: 96000004 [#1] PREEMPT SMP
>    CPU: 1 PID: 1568 Comm: arecord Not tainted 5.11.0-rc3 #20
>    Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
>    pc : regmap_write+0x14/0x80
>    lr : lpass_platform_pcmops_open+0xd8/0x210 [snd_soc_lpass_platform]
>    Call trace:
>     regmap_write+0x14/0x80
>     lpass_platform_pcmops_open+0xd8/0x210 [snd_soc_lpass_platform]
>     snd_soc_component_open+0x2c/0x94
>     ...
> 
> The problem was introduced in commit 7cb37b7bd0d3 ("ASoC: qcom: Add support
> for lpass hdmi driver"). The mistake made there is that lpass.h now contains
> 
>    #include <dt-bindings/sound/sc7180-lpass.h>
> 

This thing was obviously missed in the review and testing, and its 
really bad idea to have multiple header files based on different SOC for 
the same driver. We are planning to add some basic tests in ciloop to 
catch such issues!

IMO, Its better to sort it out now, before this gets complicated!

Am thinking of making a common header file ("lpass,h") and include that 
in the existing SoC specific header for compatibility reasons only.

In future we should just keep adding new DAI index in incremental 
fashion to common header file rather than creating SoC specific one!


> and then the SC7810 DAI IDs are hardcoded all over lpass-cpu.c and
> lpass-platform.c. But apq8016 and ipq806x have completely different
> DAI IDs so now MI2S_QUATERNARY (HDMI) is invalid and
> MI2S_TERTIARY (= LPASS_DP_RX in sc7180-lpass.h) is treated as HDMI port.
> 
> Therefore, LPASS is broken on all platforms except SC7810.
> 
> This commit fixes the problem by removing the include from lpass.h.
> To check if a DAI is an HDMI port, we compare the dai_id with a new
> "hdmi_dai" variable in lpass_variant. For SC7180 this is set to
> LPASS_DP_RX (as before), for all other platform to some unrealistic
> value (UINT_MAX).
> 
> Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Srinivas mentioned a potential different fix here:
> https://lore.kernel.org/alsa-devel/4b34bd4f-e7bc-84f9-5e8a-b2348c17b7aa@linaro.org/
> 
> Instead of this patch, we could change the dt-bindings for LPASS,
> so that all SoCs use consistent DAI IDs.

TBH, Am inclined to do the right thing and make DAI ID's consistent!
Like we do at the dsp afe interfaces.

This will also bring in the need to add .of_xlate_dai_name callback 
along with fixing sc7180_lpass_cpu_dai_driver array index.

Without this the code will end up very confusing!

--srini

> 
> In general, I think this might be cleaner, especially in case more special
> DAIs are added in the future. However, when I made this patch (before Srinivas
> mentioned it) I tried to avoid changing the dt-bindings because:
> 
>    - Changing dt-bindings after they are added is generally discouraged.
> 
> but more importantly:
> 
>    - lpass-ipq806x.c does not seem to have PRIMARY, SECONDARY, ...
>      but something completely different. I know nothing about that
>      platform so I don't know how to handle it.
> ---
>   sound/soc/qcom/lpass-apq8016.c   |  1 +
>   sound/soc/qcom/lpass-cpu.c       |  9 ++--
>   sound/soc/qcom/lpass-ipq806x.c   |  1 +
>   sound/soc/qcom/lpass-lpaif-reg.h |  2 +-
>   sound/soc/qcom/lpass-platform.c  | 77 +++++++++++---------------------
>   sound/soc/qcom/lpass-sc7180.c    |  1 +
>   sound/soc/qcom/lpass.h           |  4 +-
>   7 files changed, 39 insertions(+), 56 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 8507ef8f6679..40e9c66a74a9 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -273,6 +273,7 @@ static struct lpass_variant apq8016_data = {
>   	.num_clks		= 2,
>   	.dai_driver		= apq8016_lpass_cpu_dai_driver,
>   	.num_dai		= ARRAY_SIZE(apq8016_lpass_cpu_dai_driver),
> +	.hdmi_dai		= LPASS_HDMI_DAI_UNSUPPORTED,
>   	.dai_osr_clk_names	= (const char *[]) {
>   				"mi2s-osr-clk0",
>   				"mi2s-osr-clk1",
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index c5e99c2d89c7..b22992050646 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -707,7 +707,8 @@ static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
>   }
>   
>   static void of_lpass_cpu_parse_dai_data(struct device *dev,
> -					struct lpass_data *data)
> +					struct lpass_data *data,
> +					struct lpass_variant *variant)
>   {
>   	struct device_node *node;
>   	int ret, id;
> @@ -724,7 +725,7 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>   			dev_err(dev, "valid dai id not found: %d\n", ret);
>   			continue;
>   		}
> -		if (id == LPASS_DP_RX) {
> +		if (id == variant->hdmi_dai) {
>   			data->hdmi_port_enable = 1;
>   			dev_err(dev, "HDMI Port is enabled: %d\n", id);
>   		} else {
> @@ -766,7 +767,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   	drvdata->variant = (struct lpass_variant *)match->data;
>   	variant = drvdata->variant;
>   
> -	of_lpass_cpu_parse_dai_data(dev, drvdata);
> +	of_lpass_cpu_parse_dai_data(dev, drvdata, variant);
>   
>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
>   
> @@ -820,7 +821,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   
>   	for (i = 0; i < variant->num_dai; i++) {
>   		dai_id = variant->dai_driver[i].id;
> -		if (dai_id == LPASS_DP_RX)
> +		if (dai_id == variant->hdmi_dai)
>   			continue;
>   
>   		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get(dev,
> diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
> index 92f98b4df47f..a0c7c5eb03f1 100644
> --- a/sound/soc/qcom/lpass-ipq806x.c
> +++ b/sound/soc/qcom/lpass-ipq806x.c
> @@ -149,6 +149,7 @@ static struct lpass_variant ipq806x_data = {
>   
>   	.dai_driver		= &ipq806x_lpass_cpu_dai_driver,
>   	.num_dai		= 1,
> +	.hdmi_dai		= LPASS_HDMI_DAI_UNSUPPORTED,
>   	.dai_osr_clk_names	= (const char *[]) {
>   				"mi2s-osr-clk",
>   				},
> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
> index 405542832e99..332f1b9ba674 100644
> --- a/sound/soc/qcom/lpass-lpaif-reg.h
> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
> @@ -133,7 +133,7 @@
>   #define	LPAIF_WRDMAPERCNT_REG(v, chan)	LPAIF_WRDMA_REG_ADDR(v, 0x14, (chan))
>   
>   #define LPAIF_INTFDMA_REG(v, chan, reg, dai_id)  \
> -		((v->dai_driver[dai_id].id ==  LPASS_DP_RX) ? \
> +		((v->dai_driver[dai_id].id ==  v->hdmi_dai) ? \
>   		LPAIF_HDMI_RDMA##reg##_REG(v, chan) : \
>   		 LPAIF_RDMA##reg##_REG(v, chan))
>   
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index d1c248590f3a..140609fe835d 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -128,7 +128,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
>   		return dma_ch;
>   	}
>   
> -	if (cpu_dai->driver->id == LPASS_DP_RX) {
> +	if (cpu_dai->driver->id == v->hdmi_dai) {
>   		map = drvdata->hdmiif_map;
>   		drvdata->hdmi_substream[dma_ch] = substream;
>   	} else {
> @@ -173,7 +173,7 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
>   	data = runtime->private_data;
> -	if (dai_id == LPASS_DP_RX)
> +	if (dai_id == v->hdmi_dai)
>   		drvdata->hdmi_substream[data->dma_ch] = NULL;
>   	else
>   		drvdata->substream[data->dma_ch] = NULL;
> @@ -205,7 +205,7 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>   
>   	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
>   		id = pcm_data->dma_ch;
> -		if (dai_id == LPASS_DP_RX)
> +		if (dai_id == v->hdmi_dai)
>   			dmactl = drvdata->hdmi_rd_dmactl;
>   		else
>   			dmactl = drvdata->rd_dmactl;
> @@ -234,8 +234,7 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>   		return ret;
>   	}
>   
> -	switch (dai_id) {
> -	case LPASS_DP_RX:
> +	if (dai_id == v->hdmi_dai) {
>   		ret = regmap_fields_write(dmactl->burst8, id,
>   							LPAIF_DMACTL_BURSTEN_INCR4);
>   		if (ret) {
> @@ -254,9 +253,7 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>   			dev_err(soc_runtime->dev, "error updating dynbursten field: %d\n", ret);
>   			return ret;
>   		}
> -		break;
> -	case MI2S_PRIMARY:
> -	case MI2S_SECONDARY:
> +	} else {
>   		ret = regmap_fields_write(dmactl->intf, id,
>   						LPAIF_DMACTL_AUDINTF(dma_port));
>   		if (ret) {
> @@ -264,12 +261,8 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>   					ret);
>   			return ret;
>   		}
> -
> -		break;
> -	default:
> -		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai_id);
> -		break;
>   	}
> +
>   	switch (bitwidth) {
>   	case 16:
>   		switch (channels) {
> @@ -299,22 +292,22 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>   			regval = LPAIF_DMACTL_WPSCNT_ONE;
>   			break;
>   		case 2:
> -			regval = (dai_id == LPASS_DP_RX ?
> +			regval = (dai_id == v->hdmi_dai ?
>   			LPAIF_DMACTL_WPSCNT_ONE :
>   			LPAIF_DMACTL_WPSCNT_TWO);
>   			break;
>   		case 4:
> -			regval = (dai_id == LPASS_DP_RX ?
> +			regval = (dai_id == v->hdmi_dai ?
>   			LPAIF_DMACTL_WPSCNT_TWO :
>   			LPAIF_DMACTL_WPSCNT_FOUR);
>   			break;
>   		case 6:
> -			regval = (dai_id == LPASS_DP_RX ?
> +			regval = (dai_id == v->hdmi_dai ?
>   			LPAIF_DMACTL_WPSCNT_THREE :
>   			LPAIF_DMACTL_WPSCNT_SIX);
>   			break;
>   		case 8:
> -			regval = (dai_id == LPASS_DP_RX ?
> +			regval = (dai_id == v->hdmi_dai ?
>   			LPAIF_DMACTL_WPSCNT_FOUR :
>   			LPAIF_DMACTL_WPSCNT_EIGHT);
>   			break;
> @@ -354,7 +347,7 @@ static int lpass_platform_pcmops_hw_free(struct snd_soc_component *component,
>   	struct regmap *map;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
> -	if (dai_id == LPASS_DP_RX)
> +	if (dai_id == v->hdmi_dai)
>   		map = drvdata->hdmiif_map;
>   	else
>   		map = drvdata->lpaif_map;
> @@ -386,7 +379,7 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
>   
>   	ch = pcm_data->dma_ch;
>   	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> -		if (dai_id == LPASS_DP_RX) {
> +		if (dai_id == v->hdmi_dai) {
>   			dmactl = drvdata->hdmi_rd_dmactl;
>   			map = drvdata->hdmiif_map;
>   		} else {
> @@ -456,7 +449,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   	ch = pcm_data->dma_ch;
>   	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
>   		id = pcm_data->dma_ch;
> -		if (dai_id == LPASS_DP_RX) {
> +		if (dai_id == v->hdmi_dai) {
>   			dmactl = drvdata->hdmi_rd_dmactl;
>   			map = drvdata->hdmiif_map;
>   		} else {
> @@ -480,8 +473,8 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   				"error writing to rdmactl reg: %d\n", ret);
>   			return ret;
>   		}
> -		switch (dai_id) {
> -		case LPASS_DP_RX:
> +
> +		if (dai_id == v->hdmi_dai) {
>   			ret = regmap_fields_write(dmactl->dyncclk, id,
>   					 LPAIF_DMACTL_DYNCLK_ON);
>   			if (ret) {
> @@ -504,9 +497,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   					LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(ch) |
>   					LPAIF_IRQ_HDMI_METADONE |
>   					LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(ch));
> -			break;
> -		case MI2S_PRIMARY:
> -		case MI2S_SECONDARY:
> +		} else {
>   			reg_irqclr = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>   			val_irqclr = LPAIF_IRQ_ALL(ch);
>   
> @@ -514,10 +505,6 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   			reg_irqen = LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
>   			val_mask = LPAIF_IRQ_ALL(ch);
>   			val_irqen = LPAIF_IRQ_ALL(ch);
> -			break;
> -		default:
> -			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);
> -			return -EINVAL;
>   		}
>   
>   		ret = regmap_write(map, reg_irqclr, val_irqclr);
> @@ -541,8 +528,8 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   				"error writing to rdmactl reg: %d\n", ret);
>   			return ret;
>   		}
> -		switch (dai_id) {
> -		case LPASS_DP_RX:
> +
> +		if (dai_id == v->hdmi_dai) {
>   			ret = regmap_fields_write(dmactl->dyncclk, id,
>   					 LPAIF_DMACTL_DYNCLK_OFF);
>   			if (ret) {
> @@ -556,16 +543,10 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   					LPAIF_IRQ_HDMI_METADONE |
>   					LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(ch));
>   			val_irqen = 0;
> -			break;
> -		case MI2S_PRIMARY:
> -		case MI2S_SECONDARY:
> +		} else {
>   			reg_irqen = LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
>   			val_mask = LPAIF_IRQ_ALL(ch);
>   			val_irqen = 0;
> -			break;
> -		default:
> -			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);
> -			return -EINVAL;
>   		}
>   
>   		ret = regmap_update_bits(map, reg_irqen, val_mask, val_irqen);
> @@ -595,7 +576,7 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
>   	struct regmap *map;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
> -	if (dai_id == LPASS_DP_RX)
> +	if (dai_id == v->hdmi_dai)
>   		map = drvdata->hdmiif_map;
>   	else
>   		map = drvdata->lpaif_map;
> @@ -645,24 +626,18 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	struct regmap *map;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
> -	switch (dai_id) {
> -	case LPASS_DP_RX:
> +	if (dai_id == v->hdmi_dai) {
>   		map = drvdata->hdmiif_map;
>   		reg = LPASS_HDMITX_APP_IRQCLEAR_REG(v);
>   		val = (LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(chan) |
>   		LPAIF_IRQ_HDMI_METADONE |
>   		LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(chan));
> -	break;
> -	case MI2S_PRIMARY:
> -	case MI2S_SECONDARY:
> +	} else {
>   		map = drvdata->lpaif_map;
>   		reg = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>   		val = 0;
> -	break;
> -	default:
> -	dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
> -	return -EINVAL;
>   	}
> +
>   	if (interrupts & LPAIF_IRQ_PER(chan)) {
>   
>   		rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
> @@ -826,10 +801,11 @@ static void lpass_platform_pcm_free(struct snd_soc_component *component,
>   static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
>   {
>   	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> +	struct lpass_variant *v = drvdata->variant;
>   	struct regmap *map;
>   	unsigned int dai_id = component->id;
>   
> -	if (dai_id == LPASS_DP_RX)
> +	if (dai_id == v->hdmi_dai)
>   		map = drvdata->hdmiif_map;
>   	else
>   		map = drvdata->lpaif_map;
> @@ -843,10 +819,11 @@ static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
>   static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
>   {
>   	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> +	struct lpass_variant *v = drvdata->variant;
>   	struct regmap *map;
>   	unsigned int dai_id = component->id;
>   
> -	if (dai_id == LPASS_DP_RX)
> +	if (dai_id == v->hdmi_dai)
>   		map = drvdata->hdmiif_map;
>   	else
>   		map = drvdata->lpaif_map;
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index 85db650c2169..76bff06543ea 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -271,6 +271,7 @@ static struct lpass_variant sc7180_data = {
>   	.num_clks		= 3,
>   	.dai_driver		= sc7180_lpass_cpu_dai_driver,
>   	.num_dai		= ARRAY_SIZE(sc7180_lpass_cpu_dai_driver),
> +	.hdmi_dai		= LPASS_DP_RX,
>   	.dai_osr_clk_names      = (const char *[]) {
>   				   "mclk0",
>   				   "null",
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 0195372905ed..2de0632c1fb7 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -12,7 +12,6 @@
>   #include <linux/compiler.h>
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
> -#include <dt-bindings/sound/sc7180-lpass.h>
>   #include "lpass-hdmi.h"
>   
>   #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
> @@ -20,6 +19,8 @@
>   #define LPASS_MAX_DMA_CHANNELS			(8)
>   #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
>   
> +#define LPASS_HDMI_DAI_UNSUPPORTED		UINT_MAX
> +
>   #define QCOM_REGMAP_FIELD_ALLOC(d, m, f, mf)    \
>   	do { \
>   		mf = devm_regmap_field_alloc(d, m, f);     \
> @@ -245,6 +246,7 @@ struct lpass_variant {
>   	/* SOC specific dais */
>   	struct snd_soc_dai_driver *dai_driver;
>   	int num_dai;
> +	unsigned int hdmi_dai;
>   	const char * const *dai_osr_clk_names;
>   	const char * const *dai_bit_clk_names;
>   
> 
