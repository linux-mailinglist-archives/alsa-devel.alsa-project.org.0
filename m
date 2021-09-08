Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8165F40412B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 00:44:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC180168A;
	Thu,  9 Sep 2021 00:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC180168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631141055;
	bh=PmXZQBvUI2TEcABlbgHNiAQAHbkEr7fFdCHsBmwVs4U=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sVHPFsCNN9QMJp5SRewn0/U22U8BT5OmsoSp+cVZRXgX1leyPFyb04BbPyGxp58kA
	 xVHzeJBm06TF9kwuT+EiB4+8xYKtyUAIPpPXaP2nRR0UUV6uSCqzfdu2+7dAfndVFm
	 U3R43A+C2EjihRMpjzpQH0H5IjGI+BRNSCkoSdio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43BAAF80166;
	Thu,  9 Sep 2021 00:43:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5996BF802E7; Thu,  9 Sep 2021 00:42:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C460DF80166
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 00:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C460DF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Hqc3NBf8"
Received: by mail-oi1-x22d.google.com with SMTP id bd1so16103oib.5
 for <alsa-devel@alsa-project.org>; Wed, 08 Sep 2021 15:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=VqW5+bekt6QQoJuxceGB6Gpgo1qlpGgrwjlTJ2fvXwI=;
 b=Hqc3NBf8JTg7GipE1wzXwn/flNwn+MY+VUUhGnKThL3LCKzu4VSfdnz2yAhquXyZbL
 fbXUWc9mnrAWY4bWGcj424gvueEJhW1/FkTORFr9yjK0zj9i86hTh3GouPwxVCoCmZPk
 +GIMaN5NsD32W27XGzxpYN1vBdSVe+jpmcrZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=VqW5+bekt6QQoJuxceGB6Gpgo1qlpGgrwjlTJ2fvXwI=;
 b=C+eO3MLp+ZszOKiWgKgLIb9fijOLJBmFKSj6jT+RAW9w0BprRNGQJEtlWlRXQoWxwa
 gwLzD3MRf9burTsYCsbnvptS1Ee32cBxHR7ldhoh76Hy+rUT0n5xaiZwcu1TcETiwJKS
 XjxV73gauhTJA6lu1EAwf+lIGnhUFQQKmnC2XwtbCRNYXNeGyRXN+Ots7P1TZrq8b1/T
 Zz7jbqG8h7fu3t8oYSF3vJsLC/Gdty6GvotOZ37GrlRpRCVmeKugvQci3Gn8qh+dZNV4
 5pmaUmpCJT8SZakOlKOFi08IqCrzt4dQFNyYHPA+cGKWXVeSkXzLYyHb9XXBCL67D3Q7
 yZBQ==
X-Gm-Message-State: AOAM533gDGMBGA4kN5XDg/ctM5Sg+NAp5tWXspDPJxP7DSiZMhwejLcm
 v6hX0nemCcP+ilflWtuCqPcYozgzWQj+r8KbfYRpRg==
X-Google-Smtp-Source: ABdhPJw5BZv+m1oFwBZVKDWtQ/OmALelhjo35OhxGCLqbEojB3tWU3Kr5bPVDLdWU8HMDQJCcc/Xks3EG2bdLcbXO2c=
X-Received: by 2002:aca:2310:: with SMTP id e16mr319666oie.64.1631140970485;
 Wed, 08 Sep 2021 15:42:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Sep 2021 15:42:50 -0700
MIME-Version: 1.0
In-Reply-To: <1631124057-17155-3-git-send-email-srivasam@codeaurora.org>
References: <1631124057-17155-1-git-send-email-srivasam@codeaurora.org>
 <1631124057-17155-3-git-send-email-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 8 Sep 2021 15:42:50 -0700
Message-ID: <CAE-0n51EESvy0Y5WzcZJDAx+V1OpnaxM4T-BUbuReepJt7ufRA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: qcom: SC7280: Add machine driver
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
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

Quoting Srinivasa Rao Mandadapu (2021-09-08 11:00:57)
> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
> new file mode 100644
> index 0000000..1ab29f6
> --- /dev/null
> +++ b/sound/soc/qcom/sc7280.c
> @@ -0,0 +1,347 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> +//
> +// sc7280.c -- ALSA SoC Machine driver for sc7280
> +
> +#include <dt-bindings/sound/sc7180-lpass.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>

Can these come after the linux/sound includes?

> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <uapi/linux/input-event-codes.h>

Is this include used?

> +
> +#include "../codecs/wcd938x.h"
> +#include "common.h"
> +#include "lpass.h"
> +
> +#define DRIVER_NAME "SC7280"

Is this useful? Why not just inline it in the one place it is used so we
don't have to jump to the define to figure out what it is?

> +#define LPASS_MAX_PORTS  (LPASS_CDC_DMA_VA_TX8 + 1)
> +
> +
> +struct sc7280_snd_data {
> +       bool stream_prepared[LPASS_MAX_PORTS];
> +       struct snd_soc_card card;
> +       struct sdw_stream_runtime *sruntime[LPASS_MAX_PORTS];
> +       struct snd_soc_jack hs_jack;
> +       struct snd_soc_jack hdmi_jack;
> +       bool jack_setup;
> +};
> +
> +static void sc7280_jack_free(struct snd_jack *jack)
> +{
> +       struct snd_soc_component *component = jack->private_data;
> +
> +       snd_soc_component_set_jack(component, NULL, NULL);
> +}
> +
> +static int sc7280_headset_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +       struct snd_soc_card *card = rtd->card;
> +       struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(card);
> +       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +       struct snd_soc_component *component = codec_dai->component;
> +       struct snd_jack *jack;
> +       int rval, i;
> +
> +       if (!pdata->jack_setup) {
> +               rval = snd_soc_card_jack_new(card, "Headset Jack",
> +                                                       SND_JACK_HEADSET | SND_JACK_LINEOUT |
> +                                                       SND_JACK_MECHANICAL |
> +                                                       SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +                                                       SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +                                                       SND_JACK_BTN_4 | SND_JACK_BTN_5,
> +                                                       &pdata->hs_jack, NULL, 0);
> +
> +               if (rval < 0) {
> +                       dev_err(card->dev, "Unable to add Headset Jack\n");
> +                       return rval;
> +               }
> +
> +               jack = pdata->hs_jack.jack;
> +
> +               snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_MEDIA);
> +               snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> +               snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> +               snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> +
> +               jack->private_data = component;
> +               jack->private_free = sc7280_jack_free;
> +               pdata->jack_setup = true;
> +       }
> +       switch (cpu_dai->id) {
> +       case LPASS_CDC_DMA_RX0:
> +       case LPASS_CDC_DMA_TX3:
> +               for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +                       rval = snd_soc_component_set_jack(component, &pdata->hs_jack, NULL);
> +                       if (rval != 0 && rval != -EOPNOTSUPP) {
> +                               dev_warn(card->dev, "Failed to set jack: %d\n", rval);

Why not dev_err?

> +                               return rval;
> +                       }
> +               }
> +
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int sc7280_hdmi_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +       struct snd_soc_card *card = rtd->card;
> +       struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(card);
> +       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +       struct snd_soc_component *component = codec_dai->component;
> +       struct snd_jack *jack;
> +       int rval;
> +
> +       rval = snd_soc_card_jack_new(
> +                       card, "HDMI Jack",
> +                       SND_JACK_LINEOUT,
> +                       &pdata->hdmi_jack, NULL, 0);
> +
> +       if (rval < 0) {
> +               dev_err(card->dev, "Unable to add HDMI Jack\n");
> +               return rval;
> +       }
> +
> +       jack = pdata->hdmi_jack.jack;
> +       jack->private_data = component;
> +       jack->private_free = sc7280_jack_free;
> +
> +       return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
> +}
> +
> +static int sc7280_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +       switch (cpu_dai->id) {
> +       case LPASS_CDC_DMA_TX3:
> +               return sc7280_headset_init(rtd);
> +       case LPASS_CDC_DMA_RX0:
> +       case LPASS_CDC_DMA_VA_TX0:
> +       case MI2S_SECONDARY:
> +               return 0;
> +       case LPASS_DP_RX:
> +               return sc7280_hdmi_init(rtd);
> +       default:
> +               dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
> +               return -EINVAL;
> +       }

Nitpick: Add newline.

> +       return 0;

Can we even get here? Maybe remove return from default above and make
this a return -EINVAL.

> +}
> +
> +static int sc7280_snd_startup(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +       switch (cpu_dai->id) {
> +       case LPASS_CDC_DMA_RX0:
> +       case LPASS_CDC_DMA_TX3:
> +       case LPASS_CDC_DMA_VA_TX0:
> +               break;
> +       case MI2S_SECONDARY:
> +               break;
> +       case LPASS_DP_RX:
> +               break;
> +       default:
> +               dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
> +               return -EINVAL;
> +       }

Nitpick: Add newline.

> +       return 0;
> +}
> +
> +static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
> +                               struct snd_pcm_hw_params *params)
> +{
> +       struct snd_pcm_runtime *runtime = substream->runtime;
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_dai *codec_dai;
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);

const?

> +       struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
> +       struct sdw_stream_runtime *sruntime;
> +       int i;
> +
> +       snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2, 2);
> +       snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE, 48000, 48000);
> +
> +       switch (cpu_dai->id) {
> +       case LPASS_CDC_DMA_TX3:
> +       case LPASS_CDC_DMA_RX0:
> +               for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +                       sruntime = snd_soc_dai_get_sdw_stream(codec_dai, substream->stream);
> +                       if (sruntime != ERR_PTR(-EOPNOTSUPP))
> +                               pdata->sruntime[cpu_dai->id] = sruntime;
> +               }
> +               break;
> +       }
> +
> +       return 0;
> +

Nitpick: Drop newline.

> +}
> +
> +static int sc7280_snd_swr_prepare(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);

const?

> +       struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +       struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
> +       int ret;
> +
> +       if (!sruntime)
> +               return 0;
> +
> +       if (data->stream_prepared[cpu_dai->id]) {
> +               sdw_disable_stream(sruntime);
> +               sdw_deprepare_stream(sruntime);
> +               data->stream_prepared[cpu_dai->id] = false;
> +       }
> +
> +       ret = sdw_prepare_stream(sruntime);
> +       if (ret)
> +               return ret;
> +
> +       ret = sdw_enable_stream(sruntime);
> +       if (ret) {
> +               sdw_deprepare_stream(sruntime);
> +               return ret;
> +       }
> +       data->stream_prepared[cpu_dai->id]  = true;

Why two spaces after ]?

> +
> +       return ret;
> +}
> +
> +
> +static int sc7280_snd_prepare(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);

const?

> +
> +       switch (cpu_dai->id) {
> +       case LPASS_CDC_DMA_RX0:
> +       case LPASS_CDC_DMA_TX3:
> +               return sc7280_snd_swr_prepare(substream);
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int sc7280_snd_hw_free(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);

const?

> +       struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
> +
> +       switch (cpu_dai->id) {
> +       case LPASS_CDC_DMA_RX0:
> +       case LPASS_CDC_DMA_TX3:
> +               if (sruntime && data->stream_prepared[cpu_dai->id]) {
> +                       sdw_disable_stream(sruntime);
> +                       sdw_deprepare_stream(sruntime);
> +                       data->stream_prepared[cpu_dai->id] = false;
> +               }
> +               break;
> +       default:
> +               break;
> +       }
> +       return 0;
> +}
> +
> +static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +
> +       switch (cpu_dai->id) {
> +       case LPASS_CDC_DMA_RX0:
> +       case LPASS_CDC_DMA_TX3:
> +       case LPASS_CDC_DMA_VA_TX0:
> +               break;
> +       case MI2S_SECONDARY:
> +               break;
> +       case LPASS_DP_RX:
> +               break;
> +       default:
> +               dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);

Can use %#x to skip the 0x part.

> +               break;
> +       }
> +}
> +
> +static const struct snd_soc_ops sc7280_ops = {
> +       .startup = sc7280_snd_startup,
> +       .shutdown = sc7280_snd_shutdown,
> +       .hw_params = sc7280_snd_hw_params,
> +       .hw_free = sc7280_snd_hw_free,
> +       .prepare = sc7280_snd_prepare,
> +};
> +
> +static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
> +       SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +       SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +};
> +
> +static int sc7280_snd_platform_probe(struct platform_device *pdev)
> +{
> +       struct snd_soc_card *card;
> +       struct sc7280_snd_data *data;
> +       struct device *dev = &pdev->dev;
> +       struct snd_soc_dai_link *link;
> +       int ret, i;
> +
> +       /* Allocate the private data */
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       card = &data->card;
> +       data->jack_setup = false;

Isn't that implicit via kzalloc above? This can be dropped.

> +       snd_soc_card_set_drvdata(card, data);
> +
> +       card->owner = THIS_MODULE;
> +       card->driver_name = DRIVER_NAME;
> +       card->dev = dev;
> +
> +       ret = qcom_snd_parse_of(card);
> +       if (ret)
> +               return ret;
> +
> +       for_each_card_prelinks(card, i, link) {
> +               link->init = sc7280_init;
> +               link->ops = &sc7280_ops;
> +       }
> +       ret = devm_snd_soc_register_card(dev, card);
> +       return ret;

Nitpick:

return devm_snd_soc_register_card(dev, card)

> +}
> +
> +static const struct of_device_id sc7280_snd_device_id[]  = {
> +       {.compatible = "google,sc7280-herobrine"},
> +       {},

Nitpick: Drop comma here so nothing can come after without causing a
compile error.

> +};
> +MODULE_DEVICE_TABLE(of, sc7280_snd_device_id);
> +
