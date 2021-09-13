Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB012408B0A
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 14:28:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51B4082A;
	Mon, 13 Sep 2021 14:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51B4082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631536083;
	bh=VEn3it/2B/lWuu5n7jKR9I8jGr+A1SbheYllFdgyfFc=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UgbZB7hrZNed+GZeh+1m0ra8rPZANtjBr7JJnTCOdDj9HBfZXSXynYO16E6bcrPME
	 ydYgS7gTAmL26/86/GMR7EzQ8l+pDbY2ZAFeL/jNObOIr1bWytF7Md3MeZUygTyAYb
	 koWTUcF0HtQJofhEsv0g4rSFAEst4avGHIAnHG1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05BD1F80227;
	Mon, 13 Sep 2021 14:26:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8140F8027C; Mon, 13 Sep 2021 14:26:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F62BF80128
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 14:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F62BF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="f+Iz+vHo"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631535998; h=Content-Type: In-Reply-To: MIME-Version: Date:
 Message-ID: From: References: To: Subject: Sender;
 bh=8YlV4qJDM/OviKK02LkHzOUBiriFnU5ZxnhXgSNC3IM=;
 b=f+Iz+vHoDJYZJaRwXtxyp9p1NSloLX885mfHdrq5zaw2whfjchF8rALBj85tCDQDEJa3rTO2
 j8wLjbYvA753av5Vkci76osQDxGgcq5pXXekN3XvNCx9FJhONT2ylODBbAKuJNFOpkBXYES2
 ZEfftQce9x81N7sKcC3BTG8to3w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 613f4375648642cc1ccb62ea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 12:26:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 08C9AC43460; Mon, 13 Sep 2021 12:26:29 +0000 (UTC)
Received: from [10.242.137.170] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 465C1C4338F;
 Mon, 13 Sep 2021 12:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 465C1C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 2/2] ASoC: qcom: SC7280: Add machine driver
To: Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
References: <1631124057-17155-1-git-send-email-srivasam@codeaurora.org>
 <1631124057-17155-3-git-send-email-srivasam@codeaurora.org>
 <CAE-0n51EESvy0Y5WzcZJDAx+V1OpnaxM4T-BUbuReepJt7ufRA@mail.gmail.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <a8fb43db-924a-33a6-78c3-1048d16b3472@codeaurora.org>
Date: Mon, 13 Sep 2021 17:56:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n51EESvy0Y5WzcZJDAx+V1OpnaxM4T-BUbuReepJt7ufRA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Thanks for Your Time Stephen!!!


On 9/9/2021 4:12 AM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2021-09-08 11:00:57)
>> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
>> new file mode 100644
>> index 0000000..1ab29f6
>> --- /dev/null
>> +++ b/sound/soc/qcom/sc7280.c
>> @@ -0,0 +1,347 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +//
>> +// Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>> +//
>> +// sc7280.c -- ALSA SoC Machine driver for sc7280
>> +
>> +#include <dt-bindings/sound/sc7180-lpass.h>
>> +#include <dt-bindings/sound/qcom,q6afe.h>
> Can these come after the linux/sound includes?
yes. it can be moved to below.
>
>> +#include <linux/gpio.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <sound/core.h>
>> +#include <sound/jack.h>
>> +#include <sound/pcm.h>
>> +#include <sound/soc.h>
>> +#include <uapi/linux/input-event-codes.h>
> Is this include used?
This is is required for macros KEY_MEDIA' KEY_'VOICECOMMAND' 'KEY_VOLUMEUP'.
>
>> +
>> +#include "../codecs/wcd938x.h"
>> +#include "common.h"
>> +#include "lpass.h"
>> +
>> +#define DRIVER_NAME "SC7280"
> Is this useful? Why not just inline it in the one place it is used so we
> don't have to jump to the define to figure out what it is?
Yes. will make it inline.
>> +#define LPASS_MAX_PORTS  (LPASS_CDC_DMA_VA_TX8 + 1)
>> +
>> +
>> +struct sc7280_snd_data {
>> +       bool stream_prepared[LPASS_MAX_PORTS];
>> +       struct snd_soc_card card;
>> +       struct sdw_stream_runtime *sruntime[LPASS_MAX_PORTS];
>> +       struct snd_soc_jack hs_jack;
>> +       struct snd_soc_jack hdmi_jack;
>> +       bool jack_setup;
>> +};
>> +
>> +static void sc7280_jack_free(struct snd_jack *jack)
>> +{
>> +       struct snd_soc_component *component = jack->private_data;
>> +
>> +       snd_soc_component_set_jack(component, NULL, NULL);
>> +}
>> +
>> +static int sc7280_headset_init(struct snd_soc_pcm_runtime *rtd)
>> +{
>> +       struct snd_soc_card *card = rtd->card;
>> +       struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(card);
>> +       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>> +       struct snd_soc_component *component = codec_dai->component;
>> +       struct snd_jack *jack;
>> +       int rval, i;
>> +
>> +       if (!pdata->jack_setup) {
>> +               rval = snd_soc_card_jack_new(card, "Headset Jack",
>> +                                                       SND_JACK_HEADSET | SND_JACK_LINEOUT |
>> +                                                       SND_JACK_MECHANICAL |
>> +                                                       SND_JACK_BTN_0 | SND_JACK_BTN_1 |
>> +                                                       SND_JACK_BTN_2 | SND_JACK_BTN_3 |
>> +                                                       SND_JACK_BTN_4 | SND_JACK_BTN_5,
>> +                                                       &pdata->hs_jack, NULL, 0);
>> +
>> +               if (rval < 0) {
>> +                       dev_err(card->dev, "Unable to add Headset Jack\n");
>> +                       return rval;
>> +               }
>> +
>> +               jack = pdata->hs_jack.jack;
>> +
>> +               snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_MEDIA);
>> +               snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
>> +               snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
>> +               snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
>> +
>> +               jack->private_data = component;
>> +               jack->private_free = sc7280_jack_free;
>> +               pdata->jack_setup = true;
>> +       }
>> +       switch (cpu_dai->id) {
>> +       case LPASS_CDC_DMA_RX0:
>> +       case LPASS_CDC_DMA_TX3:
>> +               for_each_rtd_codec_dais(rtd, i, codec_dai) {
>> +                       rval = snd_soc_component_set_jack(component, &pdata->hs_jack, NULL);
>> +                       if (rval != 0 && rval != -EOPNOTSUPP) {
>> +                               dev_warn(card->dev, "Failed to set jack: %d\n", rval);
> Why not dev_err?
Okay. will change to dev_err().
>
>> +                               return rval;
>> +                       }
>> +               }
>> +
>> +               break;
>> +       default:
>> +               break;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int sc7280_hdmi_init(struct snd_soc_pcm_runtime *rtd)
>> +{
>> +       struct snd_soc_card *card = rtd->card;
>> +       struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(card);
>> +       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>> +       struct snd_soc_component *component = codec_dai->component;
>> +       struct snd_jack *jack;
>> +       int rval;
>> +
>> +       rval = snd_soc_card_jack_new(
>> +                       card, "HDMI Jack",
>> +                       SND_JACK_LINEOUT,
>> +                       &pdata->hdmi_jack, NULL, 0);
>> +
>> +       if (rval < 0) {
>> +               dev_err(card->dev, "Unable to add HDMI Jack\n");
>> +               return rval;
>> +       }
>> +
>> +       jack = pdata->hdmi_jack.jack;
>> +       jack->private_data = component;
>> +       jack->private_free = sc7280_jack_free;
>> +
>> +       return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
>> +}
>> +
>> +static int sc7280_init(struct snd_soc_pcm_runtime *rtd)
>> +{
>> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>> +
>> +       switch (cpu_dai->id) {
>> +       case LPASS_CDC_DMA_TX3:
>> +               return sc7280_headset_init(rtd);
>> +       case LPASS_CDC_DMA_RX0:
>> +       case LPASS_CDC_DMA_VA_TX0:
>> +       case MI2S_SECONDARY:
>> +               return 0;
>> +       case LPASS_DP_RX:
>> +               return sc7280_hdmi_init(rtd);
>> +       default:
>> +               dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
>> +               return -EINVAL;
>> +       }
> Nitpick: Add newline.
Okay.
>
>> +       return 0;
> Can we even get here? Maybe remove return from default above and make
> this a return -EINVAL.
>
>> +}
>> +
>> +static int sc7280_snd_startup(struct snd_pcm_substream *substream)
>> +{
>> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>> +
>> +       switch (cpu_dai->id) {
>> +       case LPASS_CDC_DMA_RX0:
>> +       case LPASS_CDC_DMA_TX3:
>> +       case LPASS_CDC_DMA_VA_TX0:
>> +               break;
>> +       case MI2S_SECONDARY:
>> +               break;
>> +       case LPASS_DP_RX:
>> +               break;
>> +       default:
>> +               dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
>> +               return -EINVAL;
>> +       }
> Nitpick: Add newline.
Okay.
>
>> +       return 0;
>> +}
>> +
>> +static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
>> +                               struct snd_pcm_hw_params *params)
>> +{
>> +       struct snd_pcm_runtime *runtime = substream->runtime;
>> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +       struct snd_soc_dai *codec_dai;
>> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> const?
Okay.
>
>> +       struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
>> +       struct sdw_stream_runtime *sruntime;
>> +       int i;
>> +
>> +       snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2, 2);
>> +       snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE, 48000, 48000);
>> +
>> +       switch (cpu_dai->id) {
>> +       case LPASS_CDC_DMA_TX3:
>> +       case LPASS_CDC_DMA_RX0:
>> +               for_each_rtd_codec_dais(rtd, i, codec_dai) {
>> +                       sruntime = snd_soc_dai_get_sdw_stream(codec_dai, substream->stream);
>> +                       if (sruntime != ERR_PTR(-EOPNOTSUPP))
>> +                               pdata->sruntime[cpu_dai->id] = sruntime;
>> +               }
>> +               break;
>> +       }
>> +
>> +       return 0;
>> +
> Nitpick: Drop newline.
Okay.
>
>> +}
>> +
>> +static int sc7280_snd_swr_prepare(struct snd_pcm_substream *substream)
>> +{
>> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> const?
Okay.
>
>> +       struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>> +       struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
>> +       int ret;
>> +
>> +       if (!sruntime)
>> +               return 0;
>> +
>> +       if (data->stream_prepared[cpu_dai->id]) {
>> +               sdw_disable_stream(sruntime);
>> +               sdw_deprepare_stream(sruntime);
>> +               data->stream_prepared[cpu_dai->id] = false;
>> +       }
>> +
>> +       ret = sdw_prepare_stream(sruntime);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = sdw_enable_stream(sruntime);
>> +       if (ret) {
>> +               sdw_deprepare_stream(sruntime);
>> +               return ret;
>> +       }
>> +       data->stream_prepared[cpu_dai->id]  = true;
> Why two spaces after ]?
Okay. Will remove it.
>
>> +
>> +       return ret;
>> +}
>> +
>> +
>> +static int sc7280_snd_prepare(struct snd_pcm_substream *substream)
>> +{
>> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> const?
Okay.
>
>> +
>> +       switch (cpu_dai->id) {
>> +       case LPASS_CDC_DMA_RX0:
>> +       case LPASS_CDC_DMA_TX3:
>> +               return sc7280_snd_swr_prepare(substream);
>> +       default:
>> +               break;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int sc7280_snd_hw_free(struct snd_pcm_substream *substream)
>> +{
>> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +       struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> const?
Okay.
>
>> +       struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
>> +
>> +       switch (cpu_dai->id) {
>> +       case LPASS_CDC_DMA_RX0:
>> +       case LPASS_CDC_DMA_TX3:
>> +               if (sruntime && data->stream_prepared[cpu_dai->id]) {
>> +                       sdw_disable_stream(sruntime);
>> +                       sdw_deprepare_stream(sruntime);
>> +                       data->stream_prepared[cpu_dai->id] = false;
>> +               }
>> +               break;
>> +       default:
>> +               break;
>> +       }
>> +       return 0;
>> +}
>> +
>> +static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
>> +{
>> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>> +
>> +       switch (cpu_dai->id) {
>> +       case LPASS_CDC_DMA_RX0:
>> +       case LPASS_CDC_DMA_TX3:
>> +       case LPASS_CDC_DMA_VA_TX0:
>> +               break;
>> +       case MI2S_SECONDARY:
>> +               break;
>> +       case LPASS_DP_RX:
>> +               break;
>> +       default:
>> +               dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
> Can use %#x to skip the 0x part.
Okay. Will Change it to %d.
>
>> +               break;
>> +       }
>> +}
>> +
>> +static const struct snd_soc_ops sc7280_ops = {
>> +       .startup = sc7280_snd_startup,
>> +       .shutdown = sc7280_snd_shutdown,
>> +       .hw_params = sc7280_snd_hw_params,
>> +       .hw_free = sc7280_snd_hw_free,
>> +       .prepare = sc7280_snd_prepare,
>> +};
>> +
>> +static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
>> +       SND_SOC_DAPM_HP("Headphone Jack", NULL),
>> +       SND_SOC_DAPM_MIC("Headset Mic", NULL),
>> +};
>> +
>> +static int sc7280_snd_platform_probe(struct platform_device *pdev)
>> +{
>> +       struct snd_soc_card *card;
>> +       struct sc7280_snd_data *data;
>> +       struct device *dev = &pdev->dev;
>> +       struct snd_soc_dai_link *link;
>> +       int ret, i;
>> +
>> +       /* Allocate the private data */
>> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +       if (!data)
>> +               return -ENOMEM;
>> +
>> +       card = &data->card;
>> +       data->jack_setup = false;
> Isn't that implicit via kzalloc above? This can be dropped.
Yes. Will remove it.
>
>> +       snd_soc_card_set_drvdata(card, data);
>> +
>> +       card->owner = THIS_MODULE;
>> +       card->driver_name = DRIVER_NAME;
>> +       card->dev = dev;
>> +
>> +       ret = qcom_snd_parse_of(card);
>> +       if (ret)
>> +               return ret;
>> +
>> +       for_each_card_prelinks(card, i, link) {
>> +               link->init = sc7280_init;
>> +               link->ops = &sc7280_ops;
>> +       }
>> +       ret = devm_snd_soc_register_card(dev, card);
>> +       return ret;
> Nitpick:
>
> return devm_snd_soc_register_card(dev, card)
Okay. will change it.
>
>> +}
>> +
>> +static const struct of_device_id sc7280_snd_device_id[]  = {
>> +       {.compatible = "google,sc7280-herobrine"},
>> +       {},
> Nitpick: Drop comma here so nothing can come after without causing a
> compile error.
Okay. Will remove it.
>
>> +};
>> +MODULE_DEVICE_TABLE(of, sc7280_snd_device_id);
>> +

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

