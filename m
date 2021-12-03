Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C19DE467865
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 14:31:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD7521D6;
	Fri,  3 Dec 2021 14:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD7521D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638538283;
	bh=QvY0spc5AvMzUJwn3zQt6q2tnFxlrspCMaL/TaHgvBU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LGqWL0+JG0fwaznCJoD28MPtRBeG+uKgL9qFMH0oUS8KQm0PbnzDSPiEREvmjQAOP
	 I4TFwFJHGQry40fXS75zD/tqD2cTeObsreVbQXTihR7jUNwSQOcMJfN8eT1UFgw+SA
	 69pbBE5YqHqXtPi7epb5BDaMtByQgo6knOHDvyj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09E7CF804FD;
	Fri,  3 Dec 2021 14:29:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D27B7F804FE; Fri,  3 Dec 2021 14:29:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 785D6F80475
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 14:29:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 785D6F80475
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HCQFftSt"
Received: by mail-wr1-x436.google.com with SMTP id c4so5707565wrd.9
 for <alsa-devel@alsa-project.org>; Fri, 03 Dec 2021 05:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=isJ9LXCbuLBi+EgAN03ievGsEcwbRlwZXFCssH3Qgd0=;
 b=HCQFftStQWYJtv2saM9XDXGlmiHb/W/P/gGEB5Uur5jETqvdtwCN6XivKqwC7QdyUB
 RibDN5yuLdJAxjMT7nQDJ+nP6hmSB7i4Ka2gdLIj+gtXwMw9eDxrFa8JLYFyHheXsSP/
 Hcy0C4GQ5geKIJKK5Qta51qHv3O7C7yv0y8pYRelMpxoy4YQ2P9DFxrQV0OBaOZuuWet
 fuzgnplY1Fbr/Il6Hb1KAdEHOPynrO2Q27aSVcxh7oCtE8N7/ONctcYHbUc5jJRWn2Ss
 JYj8MhHDfpj2V3bfh+OstkAXhGngE00iGxs2R21+f0kzqvT6Kahw1Of7Wi060I4hUn+0
 9k1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=isJ9LXCbuLBi+EgAN03ievGsEcwbRlwZXFCssH3Qgd0=;
 b=H9Gr9ugcfveWYk2YL1IS5W5DcPlpqHeQwbJWU2VSWgmQd1gJ4Cc3F/cBEJXOHycwNk
 WdPRVBy6z/aFWQIx6Vub+pFgh5CIA6OR+x0yCnGL5y2i7/ffpiT36JiGFF1jwyIXMRsz
 wo/IaY2owTu+bZMlXOAJgpaHyU8VW7Q74EjfvTMJTEIaGBGYcRM4dQTWdl+UK/qUdGaj
 qEEWBN1Vj5q0KjU5eHvs/4PhFEEj0offZEfKDvJmNxcqq+uVyNeRQS5LKGYOwdzwvdaw
 nrXxi1nmDpm48zMl2VSatZ6XiIHdhgHCjSUXPplANRwNsi8ykV3uVe1LfUrSOExBy7/o
 N3YQ==
X-Gm-Message-State: AOAM533NLrnx+DL6AiNq44cq5jayXji6/Goy0biZ0rF992t8PnuokODr
 U84/KTpfgpzYXvWMsNjt0jUclQ==
X-Google-Smtp-Source: ABdhPJyqu02SjcxjbeeZn/zowWSDCTNDTSi6P6EeueYnp6mPZf14Ay78VTinNEvmiWdmhYYkpoz9lA==
X-Received: by 2002:adf:f207:: with SMTP id p7mr21625947wro.173.1638538151458; 
 Fri, 03 Dec 2021 05:29:11 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id j134sm2808530wmj.3.2021.12.03.05.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 05:29:11 -0800 (PST)
Subject: Re: [PATCH v7 04/10] ASoC: qcom: Add lpass CPU driver for codec dma
 control
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1638459806-27600-1-git-send-email-srivasam@codeaurora.com>
 <1638459806-27600-5-git-send-email-srivasam@codeaurora.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <65f4d0e4-7868-1d65-0343-0c0244e66247@linaro.org>
Date: Fri, 3 Dec 2021 13:29:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1638459806-27600-5-git-send-email-srivasam@codeaurora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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



On 02/12/2021 15:43, Srinivasa Rao Mandadapu wrote:
> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> Add lpass cpu driver to support audio over codec dma for
> ADSP bypass usecase.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-cdc-dma.c | 275 +++++++++++++++++++++++++++++++++++++++++
>   sound/soc/qcom/lpass.h         |   1 +
>   2 files changed, 276 insertions(+)
>   create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
> 
> diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
> new file mode 100644
> index 0000000..51cd7ea
> --- /dev/null
> +++ b/sound/soc/qcom/lpass-cdc-dma.c
> @@ -0,0 +1,275 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 The Linux Foundation. All rights reserved.
> + *
> + * lpass-cdc-dma.c -- ALSA SoC CDC DMA CPU DAI driver for QTi LPASS
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
> +enum codec_dma_interfaces {
> +	LPASS_CDC_DMA_INTERFACE1 = 1,
> +	LPASS_CDC_DMA_INTERFACE2,
> +	LPASS_CDC_DMA_INTERFACE3,
> +	LPASS_CDC_DMA_INTERFACE4,
> +	LPASS_CDC_DMA_INTERFACE5,
> +	LPASS_CDC_DMA_INTERFACE6,
> +	LPASS_CDC_DMA_INTERFACE7,
> +	LPASS_CDC_DMA_INTERFACE8,
> +	LPASS_CDC_DMA_INTERFACE9,
> +	LPASS_CDC_DMA_INTERFACE10,
> +};
> +
> +static void __lpass_get_dmactl_handle(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
> +				      struct lpaif_dmactl **dmactl, int *id)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct snd_pcm_runtime *rt = substream->runtime;
> +	struct lpass_pcm_data *pcm_data = rt->private_data;
> +	struct lpass_variant *v = drvdata->variant;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +
> +	switch (dai_id) {
> +	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +		*dmactl = drvdata->rxtx_rd_dmactl;
> +		*id = pcm_data->dma_ch;
> +		break;
> +	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +		*dmactl = drvdata->rxtx_wr_dmactl;
> +		*id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
> +		break;
> +	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
> +		*dmactl = drvdata->va_wr_dmactl;
> +		*id = pcm_data->dma_ch - v->va_wrdma_channel_start;
> +		break;
> +	default:
> +		dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %d\n", dai_id);
> +		break;
> +	}
> +}
> +
> +static int __lpass_get_codec_dma_intf_type(int dai_id)
> +{
> +	int ret;
> +
> +	switch (dai_id) {
> +	case LPASS_CDC_DMA_RX0:
> +	case LPASS_CDC_DMA_TX0:
> +	case LPASS_CDC_DMA_VA_TX0:
> +		ret = LPASS_CDC_DMA_INTERFACE1;
> +		break;
> +	case LPASS_CDC_DMA_RX1:
> +	case LPASS_CDC_DMA_TX1:
> +	case LPASS_CDC_DMA_VA_TX1:
> +		ret = LPASS_CDC_DMA_INTERFACE2;
> +		break;
> +	case LPASS_CDC_DMA_RX2:
> +	case LPASS_CDC_DMA_TX2:
> +	case LPASS_CDC_DMA_VA_TX2:
> +		ret = LPASS_CDC_DMA_INTERFACE3;
> +		break;
> +	case LPASS_CDC_DMA_RX3:
> +	case LPASS_CDC_DMA_TX3:
> +	case LPASS_CDC_DMA_VA_TX3:
> +		ret = LPASS_CDC_DMA_INTERFACE4;
> +		break;
> +	case LPASS_CDC_DMA_RX4:
> +	case LPASS_CDC_DMA_TX4:
> +	case LPASS_CDC_DMA_VA_TX4:
> +		ret = LPASS_CDC_DMA_INTERFACE5;
> +		break;
> +	case LPASS_CDC_DMA_RX5:
> +	case LPASS_CDC_DMA_TX5:
> +	case LPASS_CDC_DMA_VA_TX5:
> +		ret = LPASS_CDC_DMA_INTERFACE6;
> +		break;
> +	case LPASS_CDC_DMA_RX6:
> +	case LPASS_CDC_DMA_TX6:
> +	case LPASS_CDC_DMA_VA_TX6:
> +		ret = LPASS_CDC_DMA_INTERFACE7;
> +		break;
> +	case LPASS_CDC_DMA_RX7:
> +	case LPASS_CDC_DMA_TX7:
> +	case LPASS_CDC_DMA_VA_TX7:
> +		ret = LPASS_CDC_DMA_INTERFACE8;
> +		break;
> +	case LPASS_CDC_DMA_RX8:
> +	case LPASS_CDC_DMA_TX8:
> +	case LPASS_CDC_DMA_VA_TX8:
> +		ret = LPASS_CDC_DMA_INTERFACE9;
> +		break;
> +	case LPASS_CDC_DMA_RX9:
> +		ret  = LPASS_CDC_DMA_INTERFACE10;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
> +					    struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +	struct lpaif_dmactl *dmactl = NULL;
> +	struct device *dev = soc_runtime->dev;
> +	int ret, id, codec_intf;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +
> +	codec_intf = __lpass_get_codec_dma_intf_type(dai_id);
> +	if (codec_intf < 0) {
> +		dev_err(dev, "failed to get codec_intf: %d\n", codec_intf);
> +		return codec_intf;
> +	}
> +
> +	__lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
> +	if (!dmactl) {
> +		dev_err(dev, "failed to get dmactl handle for dai_id: %d\n", dai_id);
> +		return -EINVAL;
> +	}
> +
> +	ret = regmap_fields_write(dmactl->codec_intf, id, codec_intf);
> +	if (ret) {
> +		dev_err(dev, "error writing to dmactl codec_intf reg field: %d\n", ret);
> +		return ret;
> +	}
> +	ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
> +	if (ret) {
> +		dev_err(dev, "error writing to dmactl codec_fs_sel reg field: %d\n", ret);
> +		return ret;
> +	}
> +	ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
> +	if (ret) {
> +		dev_err(dev, "error writing to dmactl codec_fs_delay reg field: %d\n", ret);
> +		return ret;
> +	}
> +	ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
> +	if (ret) {
> +		dev_err(dev, "error writing to dmactl codec_pack reg field: %d\n", ret);
> +		return ret;
> +	}
> +	ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_ON);
> +	if (ret) {
> +		dev_err(dev, "error writing to dmactl codec_enable reg field: %d\n", ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
> +				    struct snd_soc_dai *dai)
> +{
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +
> +	return clk_bulk_prepare_enable(drvdata->cdc_num_clks, drvdata->cdc_clks);
> +}
> +
> +static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
> +				      struct snd_soc_dai *dai)
> +{
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +
> +	clk_bulk_disable_unprepare(drvdata->cdc_num_clks, drvdata->cdc_clks);
> +}
> +
> +static int lpass_cdc_dma_daiops_hw_params(struct snd_pcm_substream *substream,
> +				      struct snd_pcm_hw_params *params,
> +				      struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +	struct lpaif_dmactl *dmactl = NULL;
> +	unsigned int ret, regval;
> +	unsigned int channels = params_channels(params);
> +	int id;
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
> +	__lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
> +	if (!dmactl) {
> +		dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
> +		return -EINVAL;
> +	}
> +	ret = regmap_fields_write(dmactl->codec_channel, id, regval);
> +	if (ret) {
> +		dev_err(soc_runtime->dev,
> +			"error writing to dmactl codec_channel reg field: %d\n", ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int lpass_cdc_dma_daiops_trigger(struct snd_pcm_substream *substream,
> +				    int cmd, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +	struct lpaif_dmactl *dmactl;
> +	int ret = 0, id;
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
> +		__lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
> +		if (!dmactl) {
> +			dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
> +			return -EINVAL;
> +		}
> +		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_OFF);
> +		if (ret) {
> +			dev_err(soc_runtime->dev,
> +				"error writing to dmactl codec_enable reg: %d\n", ret);
> +			return ret;
> +		}
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, cmd);
> +		break;
> +	}
> +	return ret;
> +}
> +
> +const struct snd_soc_dai_ops asoc_qcom_lpass_cdc_dma_dai_ops = {
> +	.startup	= lpass_cdc_dma_daiops_startup,
> +	.shutdown	= lpass_cdc_dma_daiops_shutdown,
> +	.hw_params	= lpass_cdc_dma_daiops_hw_params,
> +	.trigger	= lpass_cdc_dma_daiops_trigger,
> +};
> +EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cdc_dma_dai_ops);
> +
> +MODULE_DESCRIPTION("QTi LPASS CDC DMA Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 4142f12..413cead 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -403,5 +403,6 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
>   extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
>   int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
>   				struct snd_soc_dai *dai);
> +extern const struct snd_soc_dai_ops asoc_qcom_lpass_cdc_dma_dai_ops;
>   
>   #endif /* __LPASS_H__ */
> 
