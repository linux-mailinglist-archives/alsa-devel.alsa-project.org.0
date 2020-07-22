Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EEA2294DA
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 11:27:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C369D1616;
	Wed, 22 Jul 2020 11:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C369D1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595410031;
	bh=9ahsqehIxv5jzz0n+Gz9p64tzUZBIWOMcf7uXhf48cU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vPzXiSR1AWDcmi34l39OIUcYVC3oek80a963LuiSyUESoQLk/D2iqimYVGRUO8VRP
	 JqVJoPy+y2kEzMaf7jIYtxI4lWomTDZfHzru04CLb9s6cV30C9oeFD9n3LXdGk5EgO
	 cyYd1cRD0jcve9ULlhbQUIXt6JdqSEx/K5qiuzkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5206F8015A;
	Wed, 22 Jul 2020 11:25:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 672BAF8014C; Wed, 22 Jul 2020 11:25:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B5EEF80139
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 11:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B5EEF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DFLeGgU1"
Received: by mail-wr1-x441.google.com with SMTP id b6so1167466wrs.11
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 02:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cyZuXCIHRlPYa13U9SjsJAsV0SupiVh4gFOErEQLWh0=;
 b=DFLeGgU19+wgS0ZotdpRv7fwoZoOgskp05y9CKpo8Ty7aHbIQojBYvFOM1l8PO+n/W
 DtuxIMza+78Sm4nHjdnecYODEiCxFbzaJFlQtcDfhEnUtGyeYRTiznC1qka20w3Nz9m5
 /AENeNDlJ0BazfstIuWym7I58vzlxsUF8dEUNdNqB7X4l34iYJ8yN5zNlYjUwXBhc8kl
 5fLcIQ1KvmpiVGV3r2RJykK4Pt7m0RVpXRMm44kFzOxuAJNXWBne50mZb3E6jKMGZZCM
 aQE0ACV3nZxtFbHZmaA5mJvL5ixktoAhqUF1JYhr+npeAa6GfqC8ifk0r3yujylmPXH5
 jqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cyZuXCIHRlPYa13U9SjsJAsV0SupiVh4gFOErEQLWh0=;
 b=OcGZA/cpBlXtEl2AE0CiNR3TC0y+IzwxyqZPvLe1+qN0xBDYfUyeih4IIJ9Pu+SZrV
 MGSjd9DK1pgeibC+fLpiFlna9006T6SuC1ne8oDPBI2rYoX2kRXXlFj+5u2XfrHHCHkB
 ABWebJcBWWc9fUFRYQl86DYIxuQL79BfIwYbk+CBsztWBl49z7Iui7jS0wblfhfS45rm
 DRgfLQQhM3LMibTPSGZC6EzrZlwK8nRF3NXNqKLGP/2QwPxsVKLf3+84s+bms8wXroBB
 hRF58cP9penoWiylThaQQEUWJh1QmuA3p2YouWB8oRVms3ADVhIeilLoqtbNp5go2Lcb
 bDmw==
X-Gm-Message-State: AOAM530Vh3iLEScNKIAkI9qLBFWLQm8QeCOYI50upCkICn9Enhr82BXs
 JpwCoPthH8sS3PlEU98UZgcVdw==
X-Google-Smtp-Source: ABdhPJzMh6I/kxxK9SJOedm+99xY8dCdFnUi0WJvkjwkafnGm4AW4wMJQ+3iyWhwG1DoNwM+C4EzDA==
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr30989101wrt.67.1595409916740; 
 Wed, 22 Jul 2020 02:25:16 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id q5sm1907576wmj.4.2020.07.22.02.25.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jul 2020 02:25:15 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To: Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org
References: <20200721104422.369368-1-cychiang@chromium.org>
 <20200721104422.369368-3-cychiang@chromium.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ce029818-5082-643b-ff63-25aafea3de6c@linaro.org>
Date: Wed, 22 Jul 2020 10:25:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200721104422.369368-3-cychiang@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 dianders@chromium.org, Ajit Pandey <ajitp@codeaurora.org>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org
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

Few comments apart from Tzung-Bi comments,

On 21/07/2020 11:44, Cheng-Yi Chiang wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Add new driver to register sound card on sc7180 trogdor board and
> do the required configuration for lpass cpu dai and external codecs
> connected over MI2S interfaces.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>   sound/soc/qcom/Kconfig  |  11 ++
>   sound/soc/qcom/Makefile |   2 +
>   sound/soc/qcom/sc7180.c | 380 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 393 insertions(+)
>   create mode 100644 sound/soc/qcom/sc7180.c
> 

> diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> new file mode 100644
> index 000000000000..3beb2b129d01
> --- /dev/null
> +++ b/sound/soc/qcom/sc7180.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +//Copyright (c) 2020, The Linux Foundation. All rights reserved.
> +//
> +//sc7180.c -- ALSA SoC Machine driver for SC7180
> +
> +#include <dt-bindings/sound/sc7180-lpass.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <uapi/linux/input-event-codes.h>
> +
> +#include "../codecs/rt5682.h"
> +#include "common.h"

What is that you are using from this header?

> +#include "lpass.h"
> +
> +#define DEFAULT_SAMPLE_RATE_48K		48000
> +#define DEFAULT_MCLK_RATE		19200000
> +#define RT5682_PLL1_FREQ (48000 * 512)
> +
> +static int sc7180_headset_init(struct snd_soc_component *component);
> +
> +static struct snd_soc_aux_dev sc7180_headset_dev = {
> +	.dlc = COMP_EMPTY(),
> +	.init = sc7180_headset_init,
> +};

Can you explain why can you not use snd_soc_component_set_jack() on the 
codec component from link->init() callback?

> +
> +struct sc7180_snd_data {
> +	struct snd_soc_jack jack;
> +	struct snd_soc_card *card;
> +	u32 pri_mi2s_clk_count;
> +};
> +
> +static void sc7180_jack_free(struct snd_jack *jack)
> +{
> +	struct snd_soc_component *component = jack->private_data;
> +
> +	snd_soc_component_set_jack(component, NULL, NULL);
> +}
> +
> +static int sc7180_headset_init(struct snd_soc_component *component)
> +{
> +	struct snd_soc_card *card = component->card;
> +	struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> +	struct snd_jack *jack;
> +	int rval;
> +
> +	rval = snd_soc_card_jack_new(
> +			card, "Headset Jack",
> +			SND_JACK_HEADSET |
> +			SND_JACK_HEADPHONE |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3,
> +			&pdata->jack, NULL, 0);
> +
> +	if (rval < 0) {
> +		dev_err(card->dev, "Unable to add Headset Jack\n");
> +		return rval;
> +	}
> +
> +	jack = pdata->jack.jack;
> +
> +	snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> +	snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> +	snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> +	snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> +
> +	jack->private_data = component;
> +	jack->private_free = sc7180_jack_free;
> +
> +	rval = snd_soc_component_set_jack(component,
> +					  &pdata->jack, NULL);
> +	if (rval != 0 && rval != -EOPNOTSUPP) {
> +		dev_warn(card->dev, "Failed to set jack: %d\n", rval);
> +		return rval;
> +	}
> +
> +	return 0;
> +}
> +
> +
> +static unsigned int primary_dai_fmt = SND_SOC_DAIFMT_CBS_CFS |
> +				      SND_SOC_DAIFMT_NB_NF |
> +				      SND_SOC_DAIFMT_I2S;
> +
> +static int sc7180_snd_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_card *card = rtd->card;
> +	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	int ret;
> +
> +	switch (cpu_dai->id) {
> +	case MI2S_PRIMARY:
> +		if (++data->pri_mi2s_clk_count == 1) {
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +					       LPASS_MCLK0,
> +					       DEFAULT_MCLK_RATE,
> +					       SNDRV_PCM_STREAM_PLAYBACK);
> +		}
> +		snd_soc_dai_set_fmt(codec_dai, primary_dai_fmt);
> +
> +		/* Configure PLL1 for codec */
> +		ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
> +					  DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);
> +		if (ret < 0) {
> +			dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> +			return ret;
> +		}
> +
> +		/* Configure sysclk for codec */
> +		ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
> +					     RT5682_PLL1_FREQ,
> +					     SND_SOC_CLOCK_IN);
> +		if (ret < 0)
> +			dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
> +				ret);
> +
> +		break;
> +	case MI2S_SECONDARY:
> +		break;
> +	default:
> +		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +			cpu_dai->id);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_card *card = rtd->card;
> +	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +	switch (cpu_dai->id) {
> +	case MI2S_PRIMARY:
> +		if (--data->pri_mi2s_clk_count == 0) {
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +					       LPASS_MCLK0,
> +					       0,
> +					       SNDRV_PCM_STREAM_PLAYBACK);
> +		}
> +		break;
> +	case MI2S_SECONDARY:
> +		break;
> +	default:
> +		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +			cpu_dai->id);
> +		break;
> +	}
> +}
> +
> +static const struct snd_soc_ops sc7180_ops = {
> +	.startup = sc7180_snd_startup,
> +	.shutdown = sc7180_snd_shutdown,
> +};
> +
> +static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +};
> +
> +static struct snd_soc_card sc7180_card = {
> +	.owner = THIS_MODULE,
> +	.aux_dev = &sc7180_headset_dev,
> +	.num_aux_devs = 1,
> +	.dapm_widgets = sc7180_snd_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets),
> +};
> +
> +static int sc7180_parse_of(struct snd_soc_card *card)
> +{

This code is getting duplicated in various places like 
apq8016_sbc_parse_of, it will be nice to common this up, if possible!


> +	struct device_node *np;
> +	struct device_node *codec = NULL;
> +	struct device_node *platform = NULL;
> +	struct device_node *cpu = NULL;
> +	struct device *dev = card->dev;
> +	struct snd_soc_dai_link *link;
> +	struct of_phandle_args args;
> +	struct snd_soc_dai_link_component *dlc;
> +	int ret, num_links;
> +
> +	ret = snd_soc_of_parse_card_name(card, "model");
> +	if (ret) {
> +		dev_err(dev, "Error parsing card name: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* DAPM routes */
> +	if (of_property_read_bool(dev->of_node, "audio-routing")) {
> +		ret = snd_soc_of_parse_audio_routing(card,
> +						     "audio-routing");
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* headset aux dev. */
> +	sc7180_headset_dev.dlc.of_node = of_parse_phandle(
> +			dev->of_node, "aux-dev", 0);
> +	if (!sc7180_headset_dev.dlc.of_node) {
> +		dev_err(dev,
> +			"Property 'aux-dev' missing/invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Populate links */
> +	num_links = of_get_child_count(dev->of_node);
> +
> +	/* Allocate the DAI link array */
> +	card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link),
> +				      GFP_KERNEL);
> +	if (!card->dai_link)
> +		return -ENOMEM;
> +
> +	card->num_links = num_links;
> +	link = card->dai_link;
> +
> +	for_each_child_of_node(dev->of_node, np) {
> +		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
> +		if (!dlc)
> +			return -ENOMEM;
> +
> +		link->cpus	= &dlc[0];
> +		link->platforms	= &dlc[1];
> +
> +		link->num_cpus		= 1;
> +		link->num_platforms	= 1;
> +
> +		ret = of_property_read_string(np, "link-name", &link->name);
> +		if (ret) {
> +			dev_err(card->dev,
> +				"error getting codec dai_link name\n");
> +			goto err;
> +		}
> +
> +		link->playback_only = of_property_read_bool(np,
> +							    "playback_only");
> +		link->capture_only = of_property_read_bool(np,
> +							   "capture_only");

Does this even work??
You have replaced "-" with "_" for property name?

> +
> +		if (link->playback_only && link->capture_only) {
> +			dev_err(card->dev,
> +				"getting both playback and capture only\n");
> +			goto err;
> +		}
> +
> +		cpu = of_get_child_by_name(np, "cpu");
> +		codec = of_get_child_by_name(np, "codec");
> +
> +		if (!cpu) {
> +			dev_err(dev, "%s: Can't find cpu DT node\n",
> +				link->name);
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		ret = of_parse_phandle_with_args(cpu, "sound-dai",
> +						 "#sound-dai-cells", 0, &args);
> +		if (ret) {
> +			dev_err(card->dev, "%s: error getting cpu phandle\n",
> +				link->name);
> +			goto err;
> +		}
> +		link->cpus->of_node = args.np;
> +		link->id = args.args[0];
> +
> +		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
> +		if (ret) {
> +			dev_err(card->dev, "%s: error getting cpu dai name\n",
> +				link->name);
> +			goto err;
> +		}
> +
> +		if (codec) {
> +			ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
> +			if (ret < 0) {
> +				dev_err(card->dev, "%s: codec dai not found\n",
> +					link->name);
> +				goto err;
> +			}
> +		} else {
> +			dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
> +			if (!dlc)
> +				return -ENOMEM;
> +
> +			link->codecs	 = dlc;
> +			link->num_codecs = 1;
> +
> +			link->codecs->dai_name = "snd-soc-dummy-dai";
> +			link->codecs->name = "snd-soc-dummy";
> +		}
> +
> +		link->platforms->of_node = link->cpus->of_node;
> +		link->stream_name = link->name;
> +		link->ops = &sc7180_ops;
> +		link++;
> +
> +		of_node_put(cpu);
> +		of_node_put(codec);
> +	}
> +
> +	return 0;
> +err:
> +	of_node_put(np);
> +	of_node_put(cpu);
> +	of_node_put(codec);
> +	of_node_put(platform);
> +	return ret;
> +}
> +
> +static int sc7180_snd_platform_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card;
> +	struct sc7180_snd_data *data;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	card = &sc7180_card;
> +
> +	/* Allocate the private data */
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	card->dapm_widgets = sc7180_snd_widgets;
> +	card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
> +	card->dev = dev;
> +	dev_set_drvdata(dev, card);
> +	ret = sc7180_parse_of(card);
> +	if (ret) {
> +		dev_err(dev, "Error parsing OF data\n");
> +		return ret;
> +	}
> +
> +	data->card = card;
> +	snd_soc_card_set_drvdata(card, data);
> +
> +	ret = snd_soc_register_card(card);

devm_snd_soc_register_card()??

> +	if (ret) {
> +		dev_err(dev, "Sound card registration failed\n");
> +		return ret;
> +	}
> +	return ret;
> +}
> +
> +static int sc7180_snd_platform_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = dev_get_drvdata(&pdev->dev);
> +
> +	snd_soc_unregister_card(card);
> +	return 0;
> +}
> +
> +static const struct of_device_id sc7180_snd_device_id[]  = {
> +	{ .compatible = "qcom,sc7180-sndcard" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sc7180_snd_device_id);
> +
> +static struct platform_driver sc7180_snd_driver = {
> +	.probe = sc7180_snd_platform_probe,
> +	.remove = sc7180_snd_platform_remove,
> +	.driver = {
> +		.name = "msm-snd-sc7180",
> +		.of_match_table = sc7180_snd_device_id,
> +	},
> +};
> +module_platform_driver(sc7180_snd_driver);
> +
> +MODULE_DESCRIPTION("sc7180 ASoC Machine Driver");
> +MODULE_LICENSE("GPL v2");
> 
