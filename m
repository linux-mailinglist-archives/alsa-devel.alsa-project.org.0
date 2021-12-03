Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC4D46752E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 11:36:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFAEA21BD;
	Fri,  3 Dec 2021 11:35:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFAEA21BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638527796;
	bh=GHL0iRzycNuD0RvnvpyuexHBVvCiz1NhM3BUi8m04EQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KYJ7C+xXHJO2LsozPc8xFvuBT2Z7jFaxqMJI8O4c9sf7hwSfcpwZkofFVHOxOV5nQ
	 sBPGfFo3VHGTo8tcvW/z9zMiLM2sx/z8b0q96mp73KzrvxfAcjrLMR7f60VKrdjA77
	 KYDxtI+PDypFCHvOKsK2xvZy6yCijh+eLBOfZkSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21580F8028D;
	Fri,  3 Dec 2021 11:35:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E60CF8025C; Fri,  3 Dec 2021 11:35:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0839EF8015B
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 11:35:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0839EF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="l5sFEgxc"
Received: by mail-wm1-x32b.google.com with SMTP id i12so1943344wmq.4
 for <alsa-devel@alsa-project.org>; Fri, 03 Dec 2021 02:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sc8qBFRkpBmY603LQppPaoS0iorq+tIsz0Rmji+3lf8=;
 b=l5sFEgxcwy2PXro55Ttz1sH75nrROO7rzPV3/9RtZOvYNmFwhY1c/o5et+lcAXVZe7
 DU1aOTMe3uDIRD2qVJaDp0I/25nSmh9yAgii7C2FgUOAe/lBIohWaBB7SkfAV5hqOS4T
 bmUfjJsnose2t2ywqibDGHq8JsMc8lpxEgSAW0Ll9zsrvg0knpICy39dYNZD8WgMEefy
 bqhllGpw5//PqCcfF4FRWPhz3vE7FSkuoYWmbFDRuSICOdGEW+tfLzoznefEfeU3Ef5s
 kBO2BBuTFOgZhxGyyV48hSS7dvlQdmvX9UoEelc+g6h6O4SPMXMZbroE9LEbEqfPZVd9
 8Bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sc8qBFRkpBmY603LQppPaoS0iorq+tIsz0Rmji+3lf8=;
 b=rvjJWHz+AwNUaPNxW7vQ8PoJpTYt5kncb9Xxb6JMbKwlElQ82gCTrqwnbXUzMSV9fV
 QvEa/dCffx3qFmwj4Y/o15K7qqgfIDMc0QyJ8q017NKkubZ9wsC/3PIN/LiI8V7WWM2Z
 tc1X/oyTfo9JDto3+oywoXJjAWvR1C8vE7xD+TPRd8NaR874M3GWZOZxjpqR5p0OYvdZ
 GfmkLl4fYlna7nLjHcL3aT/BYk6bv0oegunhT9kv3G8No9I+xDKHgnQUEp14nMLDb2zb
 4hON8cGD6eV0pL56TQ0pc8k3eUa7Vx8Fkhxw5vPeK4eg1bUkpfhDdwfzmtUNV+Ove+0Y
 ZCLA==
X-Gm-Message-State: AOAM530h2t7TSDOMYZXfmLhtdgfKoJyvAIhvUwz82sfUd7KXKTSQuRYT
 qAbwuA8Zp+SF4GR1ZCWf+LBwkw==
X-Google-Smtp-Source: ABdhPJx32/9nrOEoHs9RwjfYOrigwc+jwYwDUqVFTM5JTPxB4J0YF7szeUFLpu2ZcBRVWehJxlkThw==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr13868535wmj.169.1638527709660; 
 Fri, 03 Dec 2021 02:35:09 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id r11sm2243265wrw.5.2021.12.03.02.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 02:35:09 -0800 (PST)
Subject: Re: [PATCH 5/5] ASoC: qcom: apq8016_sbc: Allow routing audio through
 QDSP6
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-6-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <455604c2-9b73-4b9b-2ce7-890aafe41845@linaro.org>
Date: Fri, 3 Dec 2021 10:35:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211202145505.58852-6-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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

Thanks Stephan for doing this,

I have tested DB410c this use case in the past using similar patch [1].

Over all it looks good, except one comment.

On 02/12/2021 14:55, Stephan Gerhold wrote:
> The apq8016-sbc-sndcard is designed to be used with the LPASS drivers
> (bypassing the combined audio/modem DSP in MSM8916/APQ8016).
> Make it possible to use QDSP6 audio instead for the msm8916-qdsp6-sndcard.
> 
> This only requires adding some additional hooks that set up the DPCM
> backends correctly. Similar code is already used in drivers for newer
> SoCs such as apq8096.c, sdm845.c and sm8250.c.
> 
> A slightly different initialization sequence is used for the apq8016-sbc
> and msm8916-qdsp6 sound card by defining the apq8016_sbc_add_ops()
> function as device match data.

Other alternative is to reuse card->name populated from "qcom,model" 
property to differentiate between both of these.

This should also help in differentiating UCM configs.


> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Few minor nits, other than that it LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/apq8016_sbc.c | 134 +++++++++++++++++++++++++++++++++--
>   1 file changed, 129 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index ba2a98268ee4..f9d69375320e 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -17,6 +17,9 @@
>   #include <uapi/linux/input-event-codes.h>
>   #include <dt-bindings/sound/apq8016-lpass.h>
>   #include "common.h"
> +#include "qdsp6/q6afe.h"
> +
> +#define MI2S_COUNT  (MI2S_QUATERNARY + 1)
>   
>   struct apq8016_sbc_data {
>   	struct snd_soc_card card;
> @@ -24,6 +27,7 @@ struct apq8016_sbc_data {
>   	void __iomem *spkr_iomux;
>   	struct snd_soc_jack jack;
>   	bool jack_setup;
> +	int mi2s_clk_count[MI2S_COUNT];
>   };
>   
>   #define MIC_CTRL_TER_WS_SLAVE_SEL	BIT(21)
> @@ -38,10 +42,10 @@ struct apq8016_sbc_data {
>   #define SPKR_CTL_TLMM_WS_EN_SEL_MASK	GENMASK(19, 18)
>   #define SPKR_CTL_TLMM_WS_EN_SEL_SEC	BIT(18)
>   #define DEFAULT_MCLK_RATE		9600000
> +#define MI2S_BCLK_RATE			1536000
>   
> -static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
> +static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
>   {
> -	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>   	struct snd_soc_dai *codec_dai;
>   	struct snd_soc_component *component;
>   	struct snd_soc_card *card = rtd->card;
> @@ -49,7 +53,7 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
>   	int i, rval;
>   	u32 value;
>   
> -	switch (cpu_dai->id) {
> +	switch (mi2s) {
>   	case MI2S_PRIMARY:
>   		writel(readl(pdata->spkr_iomux) | SPKR_CTL_PRI_WS_SLAVE_SEL_11,
>   			pdata->spkr_iomux);
> @@ -128,6 +132,13 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
>   	return 0;
>   }
>   
> +static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +	return apq8016_dai_init(rtd, cpu_dai->id);
> +}
> +
>   static void apq8016_sbc_add_ops(struct snd_soc_card *card)
>   {
>   	struct snd_soc_dai_link *link;
> @@ -137,6 +148,113 @@ static void apq8016_sbc_add_ops(struct snd_soc_card *card)
>   		link->init = apq8016_sbc_dai_init;
>   }
>   
> +static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
> +{
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX:
> +	case PRIMARY_MI2S_TX:
> +		return MI2S_PRIMARY;
> +	case SECONDARY_MI2S_RX:
> +	case SECONDARY_MI2S_TX:
> +		return MI2S_SECONDARY;
> +	case TERTIARY_MI2S_RX:
> +	case TERTIARY_MI2S_TX:
> +		return MI2S_TERTIARY;
> +	case QUATERNARY_MI2S_RX:
> +	case QUATERNARY_MI2S_TX:
> +		return MI2S_QUATERNARY;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +	snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_CBS_CFS);
> +	return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
> +}
> +
> +static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_card *card = rtd->card;
> +	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	int mi2s, ret;
> +
> +	mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
> +	if (mi2s < 0)
> +		return mi2s;
> +
> +	if (++data->mi2s_clk_count[mi2s] > 1)
> +		return 0;
> +

Am assuming that as you are not setting any DIGITAL CDC clock here you 
might be using an external codec.

> +	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
> +	if (ret)
> +		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
> +	return ret;
> +}
> +
> +static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_card *card = rtd->card;
> +	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	int mi2s, ret;
> +
> +	mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
> +	if (mi2s < 0)
> +		return;
> +
> +	if (--data->mi2s_clk_count[mi2s] > 0)
> +		return;
> +
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
> +	if (ret)
> +		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
> +}
> +
> +static const struct snd_soc_ops msm8916_qdsp6_be_ops = {
> +	.startup = msm8916_qdsp6_startup,
> +	.shutdown = msm8916_qdsp6_shutdown,
> +};
> +
> +static int msm8916_qdsp6_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> +					    struct snd_pcm_hw_params *params)
> +{
> +	struct snd_interval *rate = hw_param_interval(params,
> +					SNDRV_PCM_HW_PARAM_RATE);
> +	struct snd_interval *channels = hw_param_interval(params,
> +					SNDRV_PCM_HW_PARAM_CHANNELS);
> +	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
> +
> +	rate->min = rate->max = 48000;
> +	channels->min = channels->max = 2;
> +	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
> +
> +	return 0;
> +}
> +
> +static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *link;
> +	int i;
> +
> +	/* Make it obvious to userspace that QDSP6 is used */
> +	card->components = "qdsp6";
> +
> +	for_each_card_prelinks(card, i, link) {
> +		if (link->no_pcm) {
> +			link->init = msm8916_qdsp6_dai_init;
> +			link->ops = &msm8916_qdsp6_be_ops;
> +			link->be_hw_params_fixup = msm8916_qdsp6_be_hw_params_fixup;
> +		}
> +	}
> +}
> +
>   static const struct snd_soc_dapm_widget apq8016_sbc_dapm_widgets[] = {
>   
>   	SND_SOC_DAPM_MIC("Handset Mic", NULL),
> @@ -148,11 +266,16 @@ static const struct snd_soc_dapm_widget apq8016_sbc_dapm_widgets[] = {
>   
>   static int apq8016_sbc_platform_probe(struct platform_device *pdev)
>   {
> +	void (*add_ops)(struct snd_soc_card *card);
>   	struct device *dev = &pdev->dev;
>   	struct snd_soc_card *card;
>   	struct apq8016_sbc_data *data;
>   	int ret;
>   
> +	add_ops = device_get_match_data(&pdev->dev);
> +	if (!add_ops)
> +		return -EINVAL;

We will never hit the error case here because without a match we can not 
even enter the probe function.

--srini
> +
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
> @@ -177,12 +300,13 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
>   
>   	snd_soc_card_set_drvdata(card, data);
>   
> -	apq8016_sbc_add_ops(card);
> +	add_ops(card);
>   	return devm_snd_soc_register_card(&pdev->dev, card);
>   }
>   
>   static const struct of_device_id apq8016_sbc_device_id[] __maybe_unused = {
> -	{ .compatible = "qcom,apq8016-sbc-sndcard" },
> +	{ .compatible = "qcom,apq8016-sbc-sndcard", .data = apq8016_sbc_add_ops },
> +	{ .compatible = "qcom,msm8916-qdsp6-sndcard", .data = msm8916_qdsp6_add_ops },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);
> 
[1]: 
https://git.linaro.org/people/srinivas.kandagatla/linux.git/commit/?h=q6dsp-db410c-v5.11-rc6&id=9d62822a5f66cd06a5e6b31f6b841a25c143926c
