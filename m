Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB07D29A915
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 11:09:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0542116AC;
	Tue, 27 Oct 2020 11:09:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0542116AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603793393;
	bh=udrsWBrHD9OdyCFJWF1tvpE0CReCx4kDr8XWf91UsFQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UzmnQYGVVxEBfhYfHpaNIwRMH6V4szbl41jtUbwJUV0AIEUZpDCieCYZBqo3OV4sD
	 VU4RZsZi8C1ioNIaTyMsG+AorEIrYTmaTVJmUdaTpbwfKTk2m5UNSLBEqhSJUagEMl
	 f0Z4mcdxXDY9P5FXThLnzzrCvvSGSdfAhyuL/GVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80255F80240;
	Tue, 27 Oct 2020 11:08:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DED5F80227; Tue, 27 Oct 2020 11:08:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7765F8020D
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:08:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7765F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AXtJi7wO"
Received: by mail-wr1-x442.google.com with SMTP id t9so1155003wrq.11
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 03:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0EHvgCNrgvcXDm16RwWLmpbp6fZVh/2gRxXz60HJJfw=;
 b=AXtJi7wOUmEWuxK0Guadm/npFj7ioygK+aVqN1F1zn2b1HcT3cI/Amy5yDp0rr5K1A
 w57IQGfGD/jEdN7VCMrHhwBU4qtV4q4pMVJ4IkdFeBuz2ZpQAnbEWH1XEOh6m2XquuvE
 j4aKfN84yUQSDC0HIZmAmwV7DriVBLJwnAGJngwSCTKFdCXxVcosJc2USxTfw2gxJ7Av
 PtB4snzbSEqVXy5oIGFJJq4+9IYyymfEJfqQ6bq348iK9cmqkBh9xrIn78Lm0LYSFYFT
 MTYUN0PXIcvi2mkhvdyOZPIIaRFjP2poewN87s28xUXvxULQREwQ+1lSRAA+RNpfhLCe
 W4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0EHvgCNrgvcXDm16RwWLmpbp6fZVh/2gRxXz60HJJfw=;
 b=ZE4gf+fFBM0gdEgc44US3+d03e9MwT6XYSLGmsKx0xPZBvFe3jSysfuD7LHhdU6sbg
 84LZ1txj7y8QTTJGCt58U+C3fFR6KZraRuI1GNIBK5jcgBLm9skaqdfD+35SE1xqrPym
 bbkeiIYYkR9CmV2iu94s1ntDqLE7rw3C+XWZHpCkujFv6vjPCtaFLi+EEF4RVGEbCPkG
 MilaRT4Qv/guP78cyYJQ7f3nlmoFSp7UDA5b4yOPbZUbUx8cxHGmQHSmnvVWdC0TxaKP
 qKry7cR1iwV6t3zZg0xiTK+EcC8m5CXkSkkMSwnaua/CiDEFAbmpVm+yz1ziRSHcS6su
 Zfog==
X-Gm-Message-State: AOAM531lBI8jM/jFzZsxvNs+fWXu1+GyxUSg6oP4oY1tGCgciXiPHfDW
 W8d+nyENxNlm/bfVAdeImeZkOQ==
X-Google-Smtp-Source: ABdhPJwpT/flkol7foxjtt5TuSdDvj4hG5XYuxH4oMMiopLlnd2lZTrk+9sX2Vb7TM/CRcs0pRcdhw==
X-Received: by 2002:a5d:5387:: with SMTP id d7mr1865897wrv.224.1603793285943; 
 Tue, 27 Oct 2020 03:08:05 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id u195sm1532952wmu.18.2020.10.27.03.08.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 03:08:05 -0700 (PDT)
Subject: Re: [PATCH v12 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To: Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org
References: <20201027032234.1705835-1-cychiang@chromium.org>
 <20201027032234.1705835-3-cychiang@chromium.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ee4b5e84-cb1e-b2d5-a309-0f03a4e643e2@linaro.org>
Date: Tue, 27 Oct 2020 10:08:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201027032234.1705835-3-cychiang@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Patrick Lai <plai@codeaurora.org>, Ajit Pandey <ajitp@codeaurora.org>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Takashi Iwai <tiwai@suse.com>, xuyuqing@huaqin.corp-partner.google.com,
 Mark Brown <broonie@kernel.org>
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



On 27/10/2020 03:22, Cheng-Yi Chiang wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Add new driver to register sound card on sc7180 trogdor board and
> do the required configuration for lpass cpu dai and external codecs
> connected over MI2S interfaces.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>

Looks good to me,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
> Changes from v11 to v12
> - Machine driver:
>   - Use the definitaion of index LPASS_DP_RX in sc7180-lpass.h.
>   - Fix compatible string.
>   - Replace a comma with semicolon.
> 
>   sound/soc/qcom/Kconfig  |  12 ++
>   sound/soc/qcom/Makefile |   2 +
>   sound/soc/qcom/sc7180.c | 266 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 280 insertions(+)
>   create mode 100644 sound/soc/qcom/sc7180.c
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 484cad31da25..41cb08bd5588 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -138,4 +138,16 @@ config SND_SOC_SM8250
>   	  SM8250 SoC-based systems.
>   	  Say Y if you want to use audio device on this SoCs.
>   
> +config SND_SOC_SC7180
> +	tristate "SoC Machine driver for SC7180 boards"
> +	depends on I2C
> +	select SND_SOC_QCOM_COMMON
> +	select SND_SOC_LPASS_SC7180
> +	select SND_SOC_MAX98357A
> +	select SND_SOC_RT5682_I2C
> +	help
> +	  To add support for audio on Qualcomm Technologies Inc.
> +	  SC7180 SoC-based systems.
> +	  Say Y if you want to use audio device on this SoCs.
> +
>   endif #SND_SOC_QCOM
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index effa4b3f58fa..1600ae55bd34 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_SND_SOC_LPASS_SC7180) += snd-soc-lpass-sc7180.o
>   snd-soc-storm-objs := storm.o
>   snd-soc-apq8016-sbc-objs := apq8016_sbc.o
>   snd-soc-apq8096-objs := apq8096.o
> +snd-soc-sc7180-objs := sc7180.o
>   snd-soc-sdm845-objs := sdm845.o
>   snd-soc-sm8250-objs := sm8250.o
>   snd-soc-qcom-common-objs := common.o
> @@ -25,6 +26,7 @@ snd-soc-qcom-common-objs := common.o
>   obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
>   obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
>   obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
> +obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
>   obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
>   obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
>   obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
> diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> new file mode 100644
> index 000000000000..b391f64c3a80
> --- /dev/null
> +++ b/sound/soc/qcom/sc7180.c
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2020, The Linux Foundation. All rights reserved.
> +//
> +// sc7180.c -- ALSA SoC Machine driver for SC7180
> +
> +#include <dt-bindings/sound/sc7180-lpass.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <uapi/linux/input-event-codes.h>
> +
> +#include "../codecs/rt5682.h"
> +#include "common.h"
> +#include "lpass.h"
> +
> +#define DEFAULT_MCLK_RATE		19200000
> +#define RT5682_PLL1_FREQ (48000 * 512)
> +
> +#define DRIVER_NAME "SC7180"
> +
> +struct sc7180_snd_data {
> +	struct snd_soc_card card;
> +	u32 pri_mi2s_clk_count;
> +	struct snd_soc_jack hs_jack;
> +	struct snd_soc_jack hdmi_jack;
> +};
> +
> +static void sc7180_jack_free(struct snd_jack *jack)
> +{
> +	struct snd_soc_component *component = jack->private_data;
> +
> +	snd_soc_component_set_jack(component, NULL, NULL);
> +}
> +
> +static int sc7180_headset_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_component *component = codec_dai->component;
> +	struct snd_jack *jack;
> +	int rval;
> +
> +	rval = snd_soc_card_jack_new(
> +			card, "Headset Jack",
> +			SND_JACK_HEADSET |
> +			SND_JACK_HEADPHONE |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3,
> +			&pdata->hs_jack, NULL, 0);
> +
> +	if (rval < 0) {
> +		dev_err(card->dev, "Unable to add Headset Jack\n");
> +		return rval;
> +	}
> +
> +	jack = pdata->hs_jack.jack;
> +
> +	snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> +	snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> +	snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> +	snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> +
> +	jack->private_data = component;
> +	jack->private_free = sc7180_jack_free;
> +
> +	return snd_soc_component_set_jack(component, &pdata->hs_jack, NULL);
> +}
> +
> +static int sc7180_hdmi_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_component *component = codec_dai->component;
> +	struct snd_jack *jack;
> +	int rval;
> +
> +	rval = snd_soc_card_jack_new(
> +			card, "HDMI Jack",
> +			SND_JACK_LINEOUT,
> +			&pdata->hdmi_jack, NULL, 0);
> +
> +	if (rval < 0) {
> +		dev_err(card->dev, "Unable to add HDMI Jack\n");
> +		return rval;
> +	}
> +
> +	jack = pdata->hdmi_jack.jack;
> +	jack->private_data = component;
> +	jack->private_free = sc7180_jack_free;
> +
> +	return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
> +}
> +
> +static int sc7180_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +	switch (cpu_dai->id) {
> +	case MI2S_PRIMARY:
> +		return sc7180_headset_init(rtd);
> +	case MI2S_SECONDARY:
> +		return 0;
> +	case LPASS_DP_RX:
> +		return sc7180_hdmi_init(rtd);
> +	default:
> +		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
> +			cpu_dai->id);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
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
> +
> +		snd_soc_dai_set_fmt(codec_dai,
> +				    SND_SOC_DAIFMT_CBS_CFS |
> +				    SND_SOC_DAIFMT_NB_NF |
> +				    SND_SOC_DAIFMT_I2S);
> +
> +		/* Configure PLL1 for codec */
> +		ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
> +					  DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);
> +		if (ret) {
> +			dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> +			return ret;
> +		}
> +
> +		/* Configure sysclk for codec */
> +		ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
> +					     RT5682_PLL1_FREQ,
> +					     SND_SOC_CLOCK_IN);
> +		if (ret)
> +			dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
> +				ret);
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
> +	case LPASS_DP_RX:
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
> +static void sc7180_add_ops(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *link;
> +	int i;
> +
> +	for_each_card_prelinks(card, i, link) {
> +		link->ops = &sc7180_ops;
> +		link->init = sc7180_init;
> +	}
> +}
> +
> +static int sc7180_snd_platform_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card;
> +	struct sc7180_snd_data *data;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	/* Allocate the private data */
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	card = &data->card;
> +	snd_soc_card_set_drvdata(card, data);
> +
> +	card->owner = THIS_MODULE;
> +	card->driver_name = DRIVER_NAME;
> +	card->dev = dev;
> +	card->dapm_widgets = sc7180_snd_widgets;
> +	card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
> +
> +	ret = qcom_snd_parse_of(card);
> +	if (ret)
> +		return ret;
> +
> +	sc7180_add_ops(card);
> +
> +	return devm_snd_soc_register_card(dev, card);
> +}
> +
> +static const struct of_device_id sc7180_snd_device_id[]  = {
> +	{ .compatible = "google,sc7180-trogdor"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sc7180_snd_device_id);
> +
> +static struct platform_driver sc7180_snd_driver = {
> +	.probe = sc7180_snd_platform_probe,
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
