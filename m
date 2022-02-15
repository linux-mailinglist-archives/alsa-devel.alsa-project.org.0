Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3359F4B600A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 02:34:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C17DD187D;
	Tue, 15 Feb 2022 02:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C17DD187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644888873;
	bh=ZCdvPX4doszxgnvdnECtVymSHsJpXy/ooEaVt5IrF1A=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZvHEFi7KQA4aJCs1mjghAXqtOv+3D4mBnvLVK6YQ8/MYcE/cp86MOZUZCgntEoOX8
	 hZpDm/5j/E/qGNvy3v2cyqA4h9O22SE/C19q2/CAkqzJnkdx5fNCEw+gU/Y2YbTap1
	 ed71vub1QiyazboOVt6pk7R+6rjEy3tqk1G5N7mM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F62CF80430;
	Tue, 15 Feb 2022 02:33:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74D88F80310; Tue, 15 Feb 2022 02:33:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74989F800D8
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 02:33:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74989F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="lg7h0h0W"
Received: by mail-oo1-xc30.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so21471028oor.12
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 17:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=nX6pl1UEdX4TbIrCFbTFlyF9s+l0Lz9gE6yTidCnraQ=;
 b=lg7h0h0WNCWbeYorvtnmNMhTfJMZ4Plgw6ZC1AXidw/dektcl5VCOqolx7KZnH88oJ
 +3Q3T22xYO5ULfPVZnH/u8kfBNcLGk7fn4/rls2V13u27CET58YwpXECIQGtk6vtzsmH
 S2gxNPaq8eaQhW2pLoVCf2+sVV14V3r3RuKdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=nX6pl1UEdX4TbIrCFbTFlyF9s+l0Lz9gE6yTidCnraQ=;
 b=2UDI+SfIYfU9SjBqVdjUgD9B5gn0PLqURAVFRyUR1vtb+JJ4buiiIRp7ZNLywn6Wo2
 aTuDkaiYLvgpHzsrbhd1xYvSQXbI0RRJFhW7lS7NDxAHo9EM0mMXeHlncwySHG8tkBHW
 6u4n5nmGL1ZmuRxEkKkP3A5AbRFEAsLeSh0bTsL4MNUXq68xQLQGf5gMYUIA9NSaR7vH
 xl5rtWBf9AGR7VGVXl/g+AKbHQRJPxf+NNYAuLU45sMJb4981vkoxlZiP6Ma6uF4cYk7
 M/lLSuZNSg0EMNoJYL8QDR98RAeiNv3dQLUFrUFIrHxno4twLs7DA8t+R2iBcQlV9VRX
 bSfw==
X-Gm-Message-State: AOAM530oTDzbVO9ipvQklyDNVYQ9IdXxvw7VXGuN48K35mDMymtK1D9E
 YSsOerO3BZx+zeCm0jUWcC2aacx+V1w3QWLWlHjWww==
X-Google-Smtp-Source: ABdhPJybU5j0GNiqh2ewKTf8xlCckslNYhfXNuV69eqLU6t0KK22+gCX96F4/TfETOrHBmrxXcR5j6ocEDTIucBsxns=
X-Received: by 2002:a05:6870:d413:: with SMTP id
 i19mr623336oag.54.1644888797057; 
 Mon, 14 Feb 2022 17:33:17 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Feb 2022 17:33:16 -0800
MIME-Version: 1.0
In-Reply-To: <1644850708-11099-9-git-send-email-quic_srivasam@quicinc.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
 <1644850708-11099-9-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 14 Feb 2022 17:33:16 -0800
Message-ID: <CAE-0n52jD_BvQm4CeTkiR723-3uKC9G4fFeynFbs5Ukg_S762g@mail.gmail.com>
Subject: Re: [RESEND v13 08/10] ASoC: qcom: Add lpass CPU driver for codec dma
 control
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, 
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:26)
> diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
> new file mode 100644
> index 0000000..4a50baa
> --- /dev/null
> +++ b/sound/soc/qcom/lpass-cdc-dma.c
> @@ -0,0 +1,304 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 The Linux Foundation. All rights reserved.
> + *
> + * lpass-cdc-dma.c -- ALSA SoC CDC DMA CPU DAI driver for QTi LPASS
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/module.h>

export.h for EXPORT_SYMBOL usage.

> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +
> +#include "lpass-lpaif-reg.h"
> +#include "lpass.h"
> +
> +#define CODEC_MEM_FREQ_NORMAL 153600000

Is this in Hz? CODEC_MEM_HZ_NORMAL?

> +
> +enum codec_dma_interfaces {
> +       LPASS_CDC_DMA_INTERFACE1 = 1,
> +       LPASS_CDC_DMA_INTERFACE2,
> +       LPASS_CDC_DMA_INTERFACE3,
> +       LPASS_CDC_DMA_INTERFACE4,
> +       LPASS_CDC_DMA_INTERFACE5,
> +       LPASS_CDC_DMA_INTERFACE6,
> +       LPASS_CDC_DMA_INTERFACE7,
> +       LPASS_CDC_DMA_INTERFACE8,
> +       LPASS_CDC_DMA_INTERFACE9,
> +       LPASS_CDC_DMA_INTERFACE10,
> +};
> +
> +static void __lpass_get_dmactl_handle(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
> +                                     struct lpaif_dmactl **dmactl, int *id)
> +{
> +       struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +       struct snd_pcm_runtime *rt = substream->runtime;
> +       struct lpass_pcm_data *pcm_data = rt->private_data;
> +       struct lpass_variant *v = drvdata->variant;
> +       unsigned int dai_id = cpu_dai->driver->id;
> +
> +       switch (dai_id) {
> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +               *dmactl = drvdata->rxtx_rd_dmactl;
> +               *id = pcm_data->dma_ch;
> +               break;
> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +               *dmactl = drvdata->rxtx_wr_dmactl;
> +               *id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
> +               break;
> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
> +               *dmactl = drvdata->va_wr_dmactl;
> +               *id = pcm_data->dma_ch - v->va_wrdma_channel_start;
> +               break;
> +       default:
> +               dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %d\n", dai_id);
> +               break;
> +       }
> +}
> +
> +static int __lpass_get_codec_dma_intf_type(int dai_id)
> +{
> +       int ret;
> +
> +       switch (dai_id) {
> +       case LPASS_CDC_DMA_RX0:
> +       case LPASS_CDC_DMA_TX0:
> +       case LPASS_CDC_DMA_VA_TX0:
> +               ret = LPASS_CDC_DMA_INTERFACE1;
> +               break;
> +       case LPASS_CDC_DMA_RX1:
> +       case LPASS_CDC_DMA_TX1:
> +       case LPASS_CDC_DMA_VA_TX1:
> +               ret = LPASS_CDC_DMA_INTERFACE2;
> +               break;
> +       case LPASS_CDC_DMA_RX2:
> +       case LPASS_CDC_DMA_TX2:
> +       case LPASS_CDC_DMA_VA_TX2:
> +               ret = LPASS_CDC_DMA_INTERFACE3;
> +               break;
> +       case LPASS_CDC_DMA_RX3:
> +       case LPASS_CDC_DMA_TX3:
> +       case LPASS_CDC_DMA_VA_TX3:
> +               ret = LPASS_CDC_DMA_INTERFACE4;
> +               break;
> +       case LPASS_CDC_DMA_RX4:
> +       case LPASS_CDC_DMA_TX4:
> +       case LPASS_CDC_DMA_VA_TX4:
> +               ret = LPASS_CDC_DMA_INTERFACE5;
> +               break;
> +       case LPASS_CDC_DMA_RX5:
> +       case LPASS_CDC_DMA_TX5:
> +       case LPASS_CDC_DMA_VA_TX5:
> +               ret = LPASS_CDC_DMA_INTERFACE6;
> +               break;
> +       case LPASS_CDC_DMA_RX6:
> +       case LPASS_CDC_DMA_TX6:
> +       case LPASS_CDC_DMA_VA_TX6:
> +               ret = LPASS_CDC_DMA_INTERFACE7;
> +               break;
> +       case LPASS_CDC_DMA_RX7:
> +       case LPASS_CDC_DMA_TX7:
> +       case LPASS_CDC_DMA_VA_TX7:
> +               ret = LPASS_CDC_DMA_INTERFACE8;
> +               break;
> +       case LPASS_CDC_DMA_RX8:
> +       case LPASS_CDC_DMA_TX8:
> +       case LPASS_CDC_DMA_VA_TX8:
> +               ret = LPASS_CDC_DMA_INTERFACE9;
> +               break;
> +       case LPASS_CDC_DMA_RX9:
> +               ret  = LPASS_CDC_DMA_INTERFACE10;
> +               break;
> +       default:
> +               ret = -EINVAL;
> +               break;
> +       }
> +       return ret;
> +}
> +
> +static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
> +                                           struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +       struct lpaif_dmactl *dmactl = NULL;
> +       struct device *dev = soc_runtime->dev;
> +       int ret, id, codec_intf;
> +       unsigned int dai_id = cpu_dai->driver->id;
> +
> +       codec_intf = __lpass_get_codec_dma_intf_type(dai_id);
> +       if (codec_intf < 0) {
> +               dev_err(dev, "failed to get codec_intf: %d\n", codec_intf);
> +               return codec_intf;
> +       }
> +
> +       __lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
> +       if (!dmactl) {
> +               dev_err(dev, "failed to get dmactl handle for dai_id: %d\n", dai_id);
> +               return -EINVAL;
> +       }
> +
> +       ret = regmap_fields_write(dmactl->codec_intf, id, codec_intf);
> +       if (ret) {
> +               dev_err(dev, "error writing to dmactl codec_intf reg field: %d\n", ret);
> +               return ret;
> +       }
> +       ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
> +       if (ret) {
> +               dev_err(dev, "error writing to dmactl codec_fs_sel reg field: %d\n", ret);
> +               return ret;
> +       }
> +       ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
> +       if (ret) {
> +               dev_err(dev, "error writing to dmactl codec_fs_delay reg field: %d\n", ret);
> +               return ret;
> +       }
> +       ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
> +       if (ret) {
> +               dev_err(dev, "error writing to dmactl codec_pack reg field: %d\n", ret);
> +               return ret;
> +       }
> +       ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_ON);
> +       if (ret) {
> +               dev_err(dev, "error writing to dmactl codec_enable reg field: %d\n", ret);
> +               return ret;
> +       }
> +       return 0;
> +}
> +
> +static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
> +                                   struct snd_soc_dai *dai)
> +{
> +       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +       struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +
> +       switch (dai->id) {
> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +               clk_set_rate(drvdata->cdc_clks[2].clk, CODEC_MEM_FREQ_NORMAL);
> +               clk_prepare_enable(drvdata->cdc_clks[2].clk);

Where do '2' and '5' come from? Why are they part of the bulk clk array?
Why not get them separately and give them real named pointer values?

> +               break;
> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
> +               clk_set_rate(drvdata->cdc_clks[5].clk, CODEC_MEM_FREQ_NORMAL);
> +               clk_prepare_enable(drvdata->cdc_clks[5].clk);
> +               break;
> +       default:
> +               dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
> +               break;
> +       }
> +       return 0;
> +}
> +
> +static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
> +                                     struct snd_soc_dai *dai)
> +{
> +       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +       struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +
> +       switch (dai->id) {
> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +               clk_disable_unprepare(drvdata->cdc_clks[2].clk);
> +               break;
> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
> +               clk_disable_unprepare(drvdata->cdc_clks[5].clk);
> +               break;
> +       default:
> +               dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
> +               break;
> +       }
> +}
> +
> +static int lpass_cdc_dma_daiops_hw_params(struct snd_pcm_substream *substream,
> +                                     struct snd_pcm_hw_params *params,
> +                                     struct snd_soc_dai *dai)
> +{
> +       struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +       struct lpaif_dmactl *dmactl = NULL;
> +       unsigned int ret, regval;
> +       unsigned int channels = params_channels(params);
> +       int id;
> +
> +       switch (channels) {
> +       case 1:
> +               regval = LPASS_CDC_DMA_INTF_ONE_CHANNEL;
> +               break;
> +       case 2:
> +               regval = LPASS_CDC_DMA_INTF_TWO_CHANNEL;
> +               break;
> +       case 4:
> +               regval = LPASS_CDC_DMA_INTF_FOUR_CHANNEL;
> +               break;
> +       case 6:
> +               regval = LPASS_CDC_DMA_INTF_SIX_CHANNEL;
> +               break;
> +       case 8:
> +               regval = LPASS_CDC_DMA_INTF_EIGHT_CHANNEL;
> +               break;
> +       default:
> +               dev_err(soc_runtime->dev, "invalid PCM config\n");
> +               return -EINVAL;
> +       }
> +
> +       __lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
> +       if (!dmactl) {
> +               dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
> +               return -EINVAL;
> +       }
> +       ret = regmap_fields_write(dmactl->codec_channel, id, regval);
> +       if (ret) {
> +               dev_err(soc_runtime->dev,
> +                       "error writing to dmactl codec_channel reg field: %d\n", ret);
> +               return ret;
> +       }
> +       return 0;
> +}
> +
> +static int lpass_cdc_dma_daiops_trigger(struct snd_pcm_substream *substream,
> +                                   int cmd, struct snd_soc_dai *dai)
> +{
> +       struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +       struct lpaif_dmactl *dmactl;
> +       int ret = 0, id;
> +
> +       switch (cmd) {
> +       case SNDRV_PCM_TRIGGER_START:
> +       case SNDRV_PCM_TRIGGER_RESUME:
> +       case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +               __lpass_platform_codec_intf_init(dai, substream);
> +               break;
> +       case SNDRV_PCM_TRIGGER_STOP:
> +       case SNDRV_PCM_TRIGGER_SUSPEND:
> +       case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +               __lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
> +               if (!dmactl) {
> +                       dev_err(soc_runtime->dev, "failed to get dmactl handle\n");

This same message is in many places. I really hope it never gets printed
because finding out which line it got printed at is going to be
impossible.

> +                       return -EINVAL;
> +               }
> +               ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_OFF);
> +               if (ret) {
> +                       dev_err(soc_runtime->dev,
> +                               "error writing to dmactl codec_enable reg: %d\n", ret);
> +                       return ret;
> +               }
> +               break;
> +       default:
> +               ret = -EINVAL;
> +               dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, cmd);
> +               break;
> +       }
> +       return ret;
> +}
> +
> +const struct snd_soc_dai_ops asoc_qcom_lpass_cdc_dma_dai_ops = {
> +       .startup        = lpass_cdc_dma_daiops_startup,
> +       .shutdown       = lpass_cdc_dma_daiops_shutdown,
> +       .hw_params      = lpass_cdc_dma_daiops_hw_params,
> +       .trigger        = lpass_cdc_dma_daiops_trigger,
> +};
> +EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cdc_dma_dai_ops);
> +
> +MODULE_DESCRIPTION("QTi LPASS CDC DMA Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index e059c4a..d279a72 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -410,5 +410,6 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
>  extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
>  int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
>                                 struct snd_soc_dai *dai);
> +extern const struct snd_soc_dai_ops asoc_qcom_lpass_cdc_dma_dai_ops;
>
>  #endif /* __LPASS_H__ */
> --
> 2.7.4
>
