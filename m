Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E284B45A29D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 13:29:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B617167E;
	Tue, 23 Nov 2021 13:28:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B617167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637670589;
	bh=HDJj/edOsWzZ4eBNlFqSs6lFzLjRxJ8zkRI6X1Vsk9g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gHJ9xa9h3T5Lw3HHN5HWcJbcVZeisthD5EPIHmZAtTJYXR/MFh1r9/sqSlG5Pc460
	 Dz5TqxHLqfamG9gEAHpxYZS5W0S8zAp0TmTKbsPcUF53WUS8jOaZzLjCSGssIRj0dd
	 VBS6Hz3h05dGH0A0AsFiyB/vLxlxwsAR949VxaJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C387F80154;
	Tue, 23 Nov 2021 13:28:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52DB9F804B1; Tue, 23 Nov 2021 13:28:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B317BF80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 13:28:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B317BF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uBZfXDXi"
Received: by mail-wm1-x32b.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so1785722wmb.0
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 04:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vG8XyzfUAyCNckB0of+lAS3wGdbLzXgTJmgBOJ3/Nz4=;
 b=uBZfXDXi79LUjtupK3Bcw51vbAO/9N5XX5KYG4Z+x4U4NcUDsovndBWzK2Jg6LT3fb
 5Je/htDHr8jcKCJC6Ita1539TjE3kOyC2wwCJtHb3WdVXMR/ZjCnPN3/IUs7fDhfI1nt
 Vs9iI48wNr+nxYdw0gySzb0Ntmk+GMnOsElpRL5GOftSNjnxOo6thqn4FoIz37SCdF9f
 1HYXeRnakMRkpVq4MlIsSShRz83rTI2T7o1/Vty29GdCXT6PUCotOPJ/7MY5W+JUBHGs
 sCOYHSqPcfJwjMhWqOuttW/ekjs6PIRQwPQp+3uxMfO4cMM1GM0QoAgWFdiImNg1Kn+/
 mSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vG8XyzfUAyCNckB0of+lAS3wGdbLzXgTJmgBOJ3/Nz4=;
 b=HfvnNBPHIjuzKlRmSJ0PVCRaKGq3Br7WttPNRFvYDkV49sDSJX/JqSBVVv24TJX/gZ
 3s0TP+ZdKKeuK6y5Xxu9W2Wz46fkZJVEBMN6vJX9aGz+GFl6rEJHM3iPQL4j5ojO4Ks/
 lpDc6+mwaZmF1zhnW1W9Ly2/rwldacfRIgqWZHQGR8Dbc2GRL+hrss4nUfT05Isri2na
 PpM45p7N6FcLYN5lhLxgXqGlxXJFVUL6t5EbovZagd3vZDHA91u6/0nezvO9wWpDGA7O
 phEPPbSd/12cj8E+9aWu3v89QoUh7wlu3Jf2Q9N0FupatRajSoG5ffJgpZtZG4J/TggI
 /RmQ==
X-Gm-Message-State: AOAM531Bb010r1XjbYgfUIbeoAvcfyJaIxbfg449Ota7IdxWt1rtpSu8
 JpxmmXQrO/RxYyZ+XB+ry/a4pg==
X-Google-Smtp-Source: ABdhPJyVI/cLTFuvGNRTpmVvxnirtExGfyMzczV+dUIcxsW8D50ZAcBNkWAynsJPt0zuHzgZHP6s+Q==
X-Received: by 2002:a05:600c:1083:: with SMTP id
 e3mr2531659wmd.167.1637670481539; 
 Tue, 23 Nov 2021 04:28:01 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id b197sm998624wmb.24.2021.11.23.04.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 04:28:00 -0800 (PST)
Subject: Re: [PATCH v5 04/10] ASoC: qcom: Add lpass CPU driver for codec dma
 control
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1637239714-11211-1-git-send-email-srivasam@codeaurora.org>
 <1637239714-11211-5-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <03051fc7-5f52-2a09-4136-6a1c717c3e75@linaro.org>
Date: Tue, 23 Nov 2021 12:27:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637239714-11211-5-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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



On 18/11/2021 12:48, Srinivasa Rao Mandadapu wrote:
> Add lpass cpu driver to support audio over codec dma for
> ADSP bypass usecase.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-cdc-dma.c | 195 +++++++++++++++++++++++++++++++++++++++++
>   sound/soc/qcom/lpass.h         |   1 +
>   2 files changed, 196 insertions(+)
>   create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
> 
> diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
> new file mode 100644
> index 0000000..f5bfda9
> --- /dev/null
> +++ b/sound/soc/qcom/lpass-cdc-dma.c
> @@ -0,0 +1,195 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 The Linux Foundation. All rights reserved.
> + *
> + * lpass-cdc-dma.c -- ALSA SoC WCD -CPU DAI driver for QTi LPASS WCD
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +
> +#include "lpass-lpaif-reg.h"
> +#include "lpass.h"
> +
> +static void __get_dmactl_handle(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
> +					struct lpaif_dmactl **dmactl, int *id)

Please rename this with an lpass prefix, Also indentation looks bit off 
here.

> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct snd_pcm_runtime *rt = substream->runtime;
> +	struct lpass_pcm_data *pcm_data = rt->private_data;
> +	struct lpass_variant *v = drvdata->variant;
> +	int dir = substream->stream;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +
> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
> +		*dmactl = drvdata->rxtx_rd_dmactl;
> +		*id = pcm_data->dma_ch;
> +	} else {
> +		if (dai_id == LPASS_CDC_DMA_TX3) {
> +			*dmactl = drvdata->rxtx_wr_dmactl;
> +			*id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
> +		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
> +			*dmactl = drvdata->va_wr_dmactl;
> +			*id = pcm_data->dma_ch - v->va_wrdma_channel_start;
> +		}

use switch case here, also something like this makes more sense rather 
that just dealing with TX3 and VA TX0

switch (dai_id) {
case: LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX8:
	*dmactl = drvdata->rxtx_wr_dmactl;
	*id = pcm_data->dma_ch;
	break;
case: LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
	*dmactl = drvdata->rxtx_wr_dmactl;
	*id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
	break;
case LPASS_CDC_DMA_VA_TX0 ...  LPASS_CDC_DMA_VA_TX8:
	*dmactl = drvdata->rxtx_wr_dmactl;
	*id = pcm_data->dma_ch - v->va_wrdma_channel_start;
	break;
default:
	dev_err(dev, "Invalid dai id for dma ctl\n");
	break;
}

> +	}
> +}
> +
> +static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
> +					 struct snd_pcm_substream *substream)

Indentation is off, I think most of the code has simillar issue.

> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +	struct lpaif_dmactl *dmactl;
> +	int dir = substream->stream;
> +	int ret, id, codec_intf;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +
> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
> +		codec_intf = LPASS_CDC_DMA_RX0_INTERFACE;

Why are we limiting this to just RX0, it should be trivial to add 
support to other RX and TX dais.

Add a helper to convert the dai ids to interface indexs

> +	else
> +		codec_intf = LPASS_CDC_DMA_INTERFACE(dai_id);
> +
> +	__get_dmactl_handle(substream, dai, &dmactl, &id);

We are not checking if dmactl is valid or not, best is to have a error 
returned from __get_dmactl_handle() and handle it properly here.
> +
> +	ret = regmap_fields_write(dmactl->codec_intf, id, codec_intf);
> +	if (ret) {
> +		dev_err(soc_runtime->dev,
Why not use a local declare a local dev pointer and use it here, it will 
save lines here.
> +			"error writing to dmactl codec_intf reg field: %d\n", ret);
> +		return ret;
> +	}
> +	ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
> +	if (ret) {
> +		dev_err(soc_runtime->dev,
> +			"error writing to dmactl codec_fs_sel reg field: %d\n", ret);
> +		return ret;
> +	}
> +	ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
> +	if (ret) {
> +		dev_err(soc_runtime->dev,
> +			"error writing to dmactl codec_fs_delay reg field: %d\n", ret);
> +		return ret;
> +	}
> +	ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
> +	if (ret) {
> +		dev_err(soc_runtime->dev,
> +			"error writing to dmactl codec_pack reg field: %d\n", ret);
> +		return ret;
> +	}
> +	ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_ON);
> +	if (ret) {
> +		dev_err(soc_runtime->dev,
> +			"error writing to dmactl codec_enable reg field: %d\n", ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int lpass_wcd_daiops_startup(struct snd_pcm_substream *substream,
> +		struct snd_soc_dai *dai)
> +{
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(drvdata->cdc_num_clks, drvdata->cdc_clks);
> +	if (ret) {
> +		dev_err(dai->dev, "error in enabling cdc dma clks: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;

may be just do
return clk_bulk_prepare_enable(drvdata->cdc_num_clks, drvdata->cdc_clks);

soc_dai_ret() should print an error if startup fails.



> +}
> +
> +static void lpass_wcd_daiops_shutdown(struct snd_pcm_substream *substream,
> +		struct snd_soc_dai *dai)
> +{
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +
> +	clk_bulk_disable_unprepare(drvdata->cdc_num_clks, drvdata->cdc_clks);
> +}
> +
> +static int lpass_wcd_daiops_hw_params(struct snd_pcm_substream *substream,
> +		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +	struct lpaif_dmactl *dmactl;
> +	unsigned int ret, regval;
> +	unsigned int channels = params_channels(params);
> +	int id;
> +
> +	__get_dmactl_handle(substream, dai, &dmactl, &id);

may be move it after switch case and handle the errors.
> +
> +	switch (channels) {
> +	case 1:
> +		regval = LPASS_CDC_DMA_INTF_ONE_CHANNEL;
> +		break;
> +	case 2:
> +		regval = LPASS_CDC_DMA_INTF_TWO_CHANNEL;
> +		break;
> +	case 4:
> +		regval = LPASS_CDC_DMA_INTF_FOUR_CHANNEL;
> +		break;
> +	case 6:
> +		regval = LPASS_CDC_DMA_INTF_SIX_CHANNEL;
> +		break;
> +	case 8:
> +		regval = LPASS_CDC_DMA_INTF_EIGHT_CHANNEL;
> +		break;
> +	default:
> +		dev_err(soc_runtime->dev, "invalid PCM config\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = regmap_fields_write(dmactl->codec_channel, id, regval);
> +	if (ret) {
> +		dev_err(soc_runtime->dev,
> +			"error writing to dmactl codec_channel reg field: %d\n", ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int lpass_wcd_daiops_trigger(struct snd_pcm_substream *substream,
> +		int cmd, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +	struct lpaif_dmactl *dmactl;
> +	int ret = 0, id;
> +
> +	__get_dmactl_handle(substream, dai, &dmactl, &id);

move it inside the case where this is really used.

> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		__lpass_platform_codec_intf_init(dai, substream);
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_OFF);
> +		if (ret) {
> +			dev_err(soc_runtime->dev,
> +				"error writing to dmactl codec_enable reg: %d\n", ret);
> +			return ret;
> +		}
> +
> +		break;

missing default:

> +	}
> +	return ret;
> +}
> +
> +const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops = {
> +	.startup	= lpass_wcd_daiops_startup,
> +	.shutdown	= lpass_wcd_daiops_shutdown,
> +	.hw_params	= lpass_wcd_daiops_hw_params,
> +	.trigger	= lpass_wcd_daiops_trigger,
> +};
> +EXPORT_SYMBOL_GPL(asoc_qcom_lpass_wcd_dai_ops);
> +
> +MODULE_DESCRIPTION("QTi LPASS CDC DMA Driver");
> +MODULE_LICENSE("GPL v2");

use
MODULE_LICENSE("GPL");

more info in ./Documentation/process/license-rules.rst

--srini
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index b068534..f912425 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -414,5 +414,6 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
>   extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
>   int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
>   				struct snd_soc_dai *dai);
> +extern const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops;
>   
>   #endif /* __LPASS_H__ */
> 
