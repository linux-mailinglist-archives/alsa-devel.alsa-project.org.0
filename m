Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E36567D86A4
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 18:22:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAA3BAE9;
	Thu, 26 Oct 2023 18:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAA3BAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698337376;
	bh=iTQEXUDkvx/4fWHDP5aEjzYZAddxWvDdYoJGKWG12t8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=agpY/RtzwnBCm6C3qWIe3PYagZUciAX8ndOGjF9mXZtl909dDABkGJw6XywBjdAST
	 rW6i9Fn7whQeLgPHxUlrs6gSFFFfu7djglf3lMcGOLKoNejXp0j2t1I1TI6JbDiNZI
	 lqw5nAN6js8S6+jZQ0QGzg8tA5Ortfkwv9Y88AL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45734F805C9; Thu, 26 Oct 2023 18:21:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCD98F805AA;
	Thu, 26 Oct 2023 18:21:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C299AF80165; Thu, 26 Oct 2023 08:46:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org
 [213.239.216.189])
	by alsa1.perex.cz (Postfix) with ESMTP id 08FE8F8010B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 08:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08FE8F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=postmarketos.org header.i=@postmarketos.org
 header.a=rsa-sha256 header.s=donut header.b=IT1RxCxj
Message-ID: <8441f987-cf40-b254-ed95-bd9a894ec6de@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=donut; t=1698302788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GdUw7FXJa1/MNHUyjI19mQt/B38JsgdBRy7vlg7v/Tg=;
	b=IT1RxCxjqrnlgIM4wubSJx7mkzfP1vGFfPO3f6lxLEyIMOH9Wty7Rk9Y7RvD1zDF/avEti
	x4reBqQ6smZprJVJiiPJm/64CMWiEr0+OJfg/vot8q6gtloDP+0XQGQra4UtZqK2BjcOhI
	QTJYFRgZOTcsMAmFrMOjTyKilqrr9wI=
Date: Thu, 26 Oct 2023 09:46:27 +0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ASoC: qcom: sc7180: Add support for qdsp6 baked sound
To: Nikita Travkin <nikita@trvn.ru>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231020-sc7180-qdsp-sndcard-v1-0-157706b7d06f@trvn.ru>
 <20231020-sc7180-qdsp-sndcard-v1-2-157706b7d06f@trvn.ru>
Content-Language: en-US
From: Anton Bambura <jenneron@postmarketos.org>
In-Reply-To: <20231020-sc7180-qdsp-sndcard-v1-2-157706b7d06f@trvn.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: jenneron@postmarketos.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CZ2GW44MQ5ED6PEUTBALYDWTXTFZVZWE
X-Message-ID-Hash: CZ2GW44MQ5ED6PEUTBALYDWTXTFZVZWE
X-Mailman-Approved-At: Thu, 26 Oct 2023 16:20:51 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZ2GW44MQ5ED6PEUTBALYDWTXTFZVZWE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 10/20/23 18:33, Nikita Travkin wrote:
> Some sc7180 devices use audio adsp to play sound. The setup for this
> adsp is similar to the dirrect lpass usage but requires the use of
> different link ids and clocks.
>
> This commit adds support for the qdsp based audio, reusing the common
> parts like audio codec setup and jack creation.
>
> Since the setup is mostly generic and codec specific setup is guarded
> behind a check, a generic compatible is added, similar to other
> platforms. Even though those changes target Acer Aspire 1 as the only
> user of the adsp audio on this platform present upstream at the moment
> of the commit, those changes should be either dirrectly compatible or
> trivially expandable to the other devices that will be added in the
> future.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

Tested that sound still works on lazor chromebook

Tested-by: Anton Bambura <jenneron@postmarketos.org>

> ---
>   sound/soc/qcom/sc7180.c | 195 ++++++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 173 insertions(+), 22 deletions(-)
>
> diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> index 8e433e309f77..b0320a74d508 100644
> --- a/sound/soc/qcom/sc7180.c
> +++ b/sound/soc/qcom/sc7180.c
> @@ -5,6 +5,7 @@
>   // sc7180.c -- ALSA SoC Machine driver for SC7180
>   
>   #include <dt-bindings/sound/sc7180-lpass.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>   #include <linux/gpio.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/module.h>
> @@ -19,8 +20,10 @@
>   #include "../codecs/rt5682.h"
>   #include "../codecs/rt5682s.h"
>   #include "common.h"
> +#include "qdsp6/q6afe.h"
>   
>   #define DEFAULT_MCLK_RATE		19200000
> +#define MI2S_BCLK_RATE			1536000
>   #define RT5682_PLL1_FREQ (48000 * 512)
>   
>   #define DRIVER_NAME "SC7180"
> @@ -133,12 +136,28 @@ static int sc7180_init(struct snd_soc_pcm_runtime *rtd)
>   	return 0;
>   }
>   
> -static int sc7180_snd_startup(struct snd_pcm_substream *substream)
> +static int sc7180_qdsp_init(struct snd_soc_pcm_runtime *rtd)
>   {
> -	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> -	struct snd_soc_card *card = rtd->card;
> -	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
>   	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX:
> +		return sc7180_headset_init(rtd);
> +	case PRIMARY_MI2S_TX:
> +	case TERTIARY_MI2S_RX:
> +		return 0;
> +	case DISPLAY_PORT_RX:
> +		return sc7180_hdmi_init(rtd);
> +	default:
> +		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +			cpu_dai->id);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int sc7180_startup_realtek_codec(struct snd_soc_pcm_runtime *rtd)
> +{
>   	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>   	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
>   
> @@ -154,8 +173,40 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
>   		clk_id = RT5682S_SCLK_S_PLL2;
>   		pll_out = RT5682_PLL1_FREQ;
>   		pll_in = DEFAULT_MCLK_RATE;
> +	} else {
> +		return 0;
> +	}
> +	snd_soc_dai_set_fmt(codec_dai,
> +			    SND_SOC_DAIFMT_BC_FC |
> +			    SND_SOC_DAIFMT_NB_NF |
> +			    SND_SOC_DAIFMT_I2S);
> +
> +	/* Configure PLL1 for codec */
> +	ret = snd_soc_dai_set_pll(codec_dai, pll_id, pll_source,
> +				  pll_in, pll_out);
> +	if (ret) {
> +		dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> +		return ret;
>   	}
>   
> +	/* Configure sysclk for codec */
> +	ret = snd_soc_dai_set_sysclk(codec_dai, clk_id, pll_out,
> +				     SND_SOC_CLOCK_IN);
> +	if (ret)
> +		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
> +			ret);
> +
> +	return ret;
> +}
> +
> +static int sc7180_snd_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_card *card = rtd->card;
> +	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int ret;
> +
>   	switch (cpu_dai->id) {
>   	case MI2S_PRIMARY:
>   		if (++data->pri_mi2s_clk_count == 1) {
> @@ -165,30 +216,66 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
>   					       SNDRV_PCM_STREAM_PLAYBACK);
>   		}
>   
> -		snd_soc_dai_set_fmt(codec_dai,
> -				    SND_SOC_DAIFMT_BC_FC |
> -				    SND_SOC_DAIFMT_NB_NF |
> -				    SND_SOC_DAIFMT_I2S);
> -
> -		/* Configure PLL1 for codec */
> -		ret = snd_soc_dai_set_pll(codec_dai, pll_id, pll_source,
> -					  pll_in, pll_out);
> -		if (ret) {
> -			dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> +		ret = sc7180_startup_realtek_codec(rtd);
> +		if (ret)
>   			return ret;
> +
> +		break;
> +	case MI2S_SECONDARY:
> +		break;
> +	case LPASS_DP_RX:
> +		break;
> +	default:
> +		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +			cpu_dai->id);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int sc7180_qdsp_snd_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_card *card = rtd->card;
> +	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
> +	int ret;
> +
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX:
> +	case PRIMARY_MI2S_TX:
> +		if (++data->pri_mi2s_clk_count == 1) {
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +					       Q6AFE_LPASS_CLK_ID_MCLK_1,
> +					       DEFAULT_MCLK_RATE,
> +					       SNDRV_PCM_STREAM_PLAYBACK);
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +					       Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
> +					       MI2S_BCLK_RATE,
> +					       SNDRV_PCM_STREAM_PLAYBACK);
>   		}
>   
> -		/* Configure sysclk for codec */
> -		ret = snd_soc_dai_set_sysclk(codec_dai, clk_id, pll_out,
> -					     SND_SOC_CLOCK_IN);
> +		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +
> +		ret = sc7180_startup_realtek_codec(rtd);
>   		if (ret)
> -			dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
> -				ret);
> +			return ret;
>   
>   		break;
> -	case MI2S_SECONDARY:
> +	case TERTIARY_MI2S_RX:
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +				       Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
> +				       MI2S_BCLK_RATE,
> +				       SNDRV_PCM_STREAM_PLAYBACK);
> +
> +		snd_soc_dai_set_fmt(codec_dai,
> +				SND_SOC_DAIFMT_BC_FC |
> +				SND_SOC_DAIFMT_NB_NF |
> +				SND_SOC_DAIFMT_I2S);
> +		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
>   		break;
> -	case LPASS_DP_RX:
> +	case DISPLAY_PORT_RX:
>   		break;
>   	default:
>   		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> @@ -246,6 +333,42 @@ static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
>   	}
>   }
>   
> +static void sc7180_qdsp_snd_shutdown(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_card *card = rtd->card;
> +	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX:
> +	case PRIMARY_MI2S_TX:
> +		if (--data->pri_mi2s_clk_count == 0) {
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +					       Q6AFE_LPASS_CLK_ID_MCLK_1,
> +					       0,
> +					       SNDRV_PCM_STREAM_PLAYBACK);
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +					       Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
> +					       0,
> +					       SNDRV_PCM_STREAM_PLAYBACK);
> +		}
> +		break;
> +	case TERTIARY_MI2S_RX:
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +				       Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
> +				       0,
> +				       SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case DISPLAY_PORT_RX:
> +		break;
> +	default:
> +		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +			cpu_dai->id);
> +		break;
> +	}
> +}
> +
>   static int sc7180_adau7002_init(struct snd_soc_pcm_runtime *rtd)
>   {
>   	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> @@ -294,11 +417,30 @@ static int sc7180_adau7002_snd_startup(struct snd_pcm_substream *substream)
>   	return 0;
>   }
>   
> +static int sc7180_qdsp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> +				     struct snd_pcm_hw_params *params)
> +{
> +	struct snd_interval *rate = hw_param_interval(params,
> +					SNDRV_PCM_HW_PARAM_RATE);
> +	struct snd_interval *channels = hw_param_interval(params,
> +					SNDRV_PCM_HW_PARAM_CHANNELS);
> +
> +	rate->min = rate->max = 48000;
> +	channels->min = channels->max = 2;
> +
> +	return 0;
> +}
> +
>   static const struct snd_soc_ops sc7180_ops = {
>   	.startup = sc7180_snd_startup,
>   	.shutdown = sc7180_snd_shutdown,
>   };
>   
> +static const struct snd_soc_ops sc7180_qdsp_ops = {
> +	.startup = sc7180_qdsp_snd_startup,
> +	.shutdown = sc7180_qdsp_snd_shutdown,
> +};
> +
>   static const struct snd_soc_ops sc7180_adau7002_ops = {
>   	.startup = sc7180_adau7002_snd_startup,
>   };
> @@ -354,7 +496,7 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
>   	struct snd_soc_dai_link *link;
>   	int ret;
>   	int i;
> -	bool no_headphone = false;
> +	bool qdsp = false, no_headphone = false;
>   
>   	/* Allocate the private data */
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> @@ -390,6 +532,8 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
>   		no_headphone = true;
>   		card->dapm_widgets = sc7180_adau7002_snd_widgets;
>   		card->num_dapm_widgets = ARRAY_SIZE(sc7180_adau7002_snd_widgets);
> +	} else if (of_device_is_compatible(dev->of_node, "qcom,sc7180-qdsp6-sndcard")) {
> +		qdsp = true;
>   	}
>   
>   	ret = qcom_snd_parse_of(card);
> @@ -400,6 +544,12 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
>   		if (no_headphone) {
>   			link->ops = &sc7180_adau7002_ops;
>   			link->init = sc7180_adau7002_init;
> +		} else if (qdsp) {
> +			if (link->no_pcm == 1) {
> +				link->ops = &sc7180_qdsp_ops;
> +				link->be_hw_params_fixup = sc7180_qdsp_be_hw_params_fixup;
> +				link->init = sc7180_qdsp_init;
> +			}
>   		} else {
>   			link->ops = &sc7180_ops;
>   			link->init = sc7180_init;
> @@ -412,6 +562,7 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
>   static const struct of_device_id sc7180_snd_device_id[]  = {
>   	{.compatible = "google,sc7180-trogdor"},
>   	{.compatible = "google,sc7180-coachz"},
> +	{.compatible = "qcom,sc7180-qdsp6-sndcard"},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, sc7180_snd_device_id);
>
