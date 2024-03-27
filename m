Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13288E1CB
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 14:11:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 572E22BE7;
	Wed, 27 Mar 2024 14:11:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 572E22BE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711545113;
	bh=EIfAaG+8ChusQ7KuCbmqxqXGfMQafmgd9vGhe7mjxFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G7iuTwV80hUcr0L7hDFSfWMelEdUTycMrEh+RszYG+xJHObRjLR70//mAzz5EVE8o
	 b8PqGQ6cW66sLaEcLnJ84OsGDbFIPxw4bPoaUvEkbZRd7wNaZwoj/LD+HxkeC6Vn9K
	 T3wEUL9K3D3CaI1zidnk98bj2Xwj3/ejbkLP8LQ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F3C4F80563; Wed, 27 Mar 2024 14:11:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A84CF805A8;
	Wed, 27 Mar 2024 14:11:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83C20F8025F; Wed, 27 Mar 2024 14:10:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B1E6F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 14:10:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B1E6F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=P1qvj0Na
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-dcbcea9c261so6811971276.3
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711545002; x=1712149802;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lzCuQ38z5tEvKes8luQhWNfmBRoi0Op2h6rKQaV0U3o=;
        b=P1qvj0NaAVN2ynRnHvU0TX1BF/95vMUuNjyVtAmIYrR0O0Y8Bqi0RRefr8shMLcetZ
         /xVYa4iKEv8hI+opqp2fs7y2Wa3JAwGu7wQ4QnYBVSmoDWzXrVgeKL3hN8cVFS4MnPYF
         vUkg7vHEXDXyaVABVjqJdqwieWKEmTLDPZlsYE5pHSz6uj7y4Rm2g5PFi2uA5wwkrW0i
         9xSLKqkaIRQGJfWhwQAO0Ya1e5aa2ltMkpnYqbxwgEJ8/QR2CfwQdkJzAsxyxkJ75krq
         zC0cI++BJvNsKeoeWOnau2n6UFAQ3YcPVpe/XJ99a/JFVmeJBGP59ioL37Xg4sYefKkG
         nOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711545002; x=1712149802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzCuQ38z5tEvKes8luQhWNfmBRoi0Op2h6rKQaV0U3o=;
        b=kUO8qFN+s75N2+0IyyiqOTnOD3l4OTcqTLiZwELIGky0eE3TsRaLXzM1EIw5W1vwNm
         nfK4iD+88puNo2XYaKp7SLtS4IVyoAI2zysRAOBdMcybLAq8cg5ek+HHjDTMAAy1qIxm
         4IyI7U6oAmbKoZqd0kKiq2G7gnFYs2wUPHou2CVQ0ccVmUpTkpQGUePMokg7XumDIbYW
         7h+HP2zNIQfH+Mz9+KGibL21WNRF3M6Q7x2UMfJgIH0xXCPdjaFJznBzGgXKU8JvBRsJ
         t2GBcYGKMWH44rbbQatLYpOoYr8mkK8bLRzyc917UHKnM6X40grvCCFW6auUt8NRRAMd
         Qw9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuqWh7O82fUogSFlQmtfg4CbNTbQZFzXXYka4XZbSgBq3Xq0+Kc/pqrDQEGEr8Lr2W2Dj6qqSVDB+qXiYG1myXB+eZCUsIJCORRxI=
X-Gm-Message-State: AOJu0Yyz4uwEOcHnDVwhnfWsHrkp0YJbG6L/nSdaYGdt+W3I9FIRhjGO
	ZcVz4ORG4AEe/U+hffe0geHe7f1vfcNRunUOGZsbvnTEXZqwIerrX5VBqIMwycQbYI25AH1Z3+g
	0SyXb50RFQYYoPMULdUnf+INqQ4kOMwPLI+UG2A==
X-Google-Smtp-Source: 
 AGHT+IFEFjTBVS4HBczGqVH75JCqDQR+t3W+i9jRyLyq5dNnFwQJkaqlnv27HDRa7w6hVneeKjVD/LRnNW7r5pdZrf0=
X-Received: by 2002:a25:ac10:0:b0:dcb:e82c:f7d with SMTP id
 w16-20020a25ac10000000b00dcbe82c0f7dmr3861776ybi.41.1711545002212; Wed, 27
 Mar 2024 06:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240327113228.1706975-1-quic_mohs@quicinc.com>
 <20240327113228.1706975-3-quic_mohs@quicinc.com>
In-Reply-To: <20240327113228.1706975-3-quic_mohs@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Mar 2024 15:09:51 +0200
Message-ID: 
 <CAA8EJpqh0emOFUPSj8rPaKr2hZRWwOh9NNTco8fyJCtwXe9sSA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: qcom: qcm6490: Add machine driver for
 qcm6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, broonie@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, lgirdwood@gmail.com, tiwai@suse.com,
	quic_rohkumar@quicinc.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: AKCXATOF2KIOO6QW2CXATLH6KPFAJFKJ
X-Message-ID-Hash: AKCXATOF2KIOO6QW2CXATLH6KPFAJFKJ
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKCXATOF2KIOO6QW2CXATLH6KPFAJFKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 27 Mar 2024 at 13:34, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
> Add machine driver for qcm6490 SoC.
>
> This initial supports which includes WSA883x Speakers with onboard DMIC
> connected to internal LPASS codec via VA macros respectively and also
> WCD937x based headset.
>
> Add compatible for sound card on Qualcomm qcs6490 boards.

Granted that qcm6490 is similar to sc7280, is there any reason why you
can not use one of the existing sound card drivers? Like sc7280.c or
sc8280xp.c?

>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  sound/soc/qcom/Kconfig   |  13 +++
>  sound/soc/qcom/Makefile  |   2 +
>  sound/soc/qcom/qcm6490.c | 173 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 188 insertions(+)
>  create mode 100644 sound/soc/qcom/qcm6490.c
>
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 762491d6f2f2..0bc536766872 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -151,6 +151,19 @@ config SND_SOC_MSM8996
>           APQ8096 SoC-based systems.
>           Say Y if you want to use audio device on this SoCs
>
> +config SND_SOC_QCM6490
> +       tristate "SoC Machine driver for QCM6490 boards"
> +       depends on QCOM_APR && SOUNDWIRE
> +       depends on COMMON_CLK
> +       select SND_SOC_QDSP6
> +       select SND_SOC_QCOM_COMMON
> +       select SND_SOC_QCOM_SDW
> +       help
> +         Add support for audio on Qualcomm Technologies Inc.
> +         QCM6490 SoC-based systems.
> +         To compile this driver say Y or M if you want to
> +         use audio device on this SoCs.
> +
>  config SND_SOC_SDM845
>         tristate "SoC Machine driver for SDM845 boards"
>         depends on QCOM_APR && I2C && SOUNDWIRE
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 34f3fcb8ee9a..feb2c164be69 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_SND_SOC_LPASS_SC7280) += snd-soc-lpass-sc7280.o
>  snd-soc-storm-objs := storm.o
>  snd-soc-apq8016-sbc-objs := apq8016_sbc.o
>  snd-soc-apq8096-objs := apq8096.o
> +snd-soc-qcm6490-objs := qcm6490.o
>  snd-soc-sc7180-objs := sc7180.o
>  snd-soc-sc7280-objs := sc7280.o
>  snd-soc-sdm845-objs := sdm845.o
> @@ -34,6 +35,7 @@ snd-soc-x1e80100-objs := x1e80100.o
>  obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
>  obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
>  obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
> +obj-$(CONFIG_SND_SOC_QCM6490) += snd-soc-qcm6490.o
>  obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
>  obj-$(CONFIG_SND_SOC_SC7280) += snd-soc-sc7280.o
>  obj-$(CONFIG_SND_SOC_SC8280XP) += snd-soc-sc8280xp.o
> diff --git a/sound/soc/qcom/qcm6490.c b/sound/soc/qcom/qcm6490.c
> new file mode 100644
> index 000000000000..5b0dc95963f5
> --- /dev/null
> +++ b/sound/soc/qcom/qcm6490.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> +
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_device.h>
> +#include <sound/core.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/pcm.h>
> +#include <linux/soundwire/sdw.h>
> +#include <sound/jack.h>
> +#include <sound/pcm_params.h>
> +#include "lpass.h"
> +#include "qdsp6/q6afe.h"
> +#include "common.h"
> +#include "sdw.h"
> +
> +struct qcm6490_snd_data {
> +       bool stream_prepared[AFE_PORT_MAX];
> +       struct snd_soc_card *card;
> +       struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
> +       struct snd_soc_jack jack;
> +       bool jack_setup;
> +};
> +
> +static int qcm6490_snd_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +       struct qcm6490_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +
> +       switch (cpu_dai->id) {
> +       case TX_CODEC_DMA_TX_3:
> +       case LPASS_CDC_DMA_TX3:
> +       case RX_CODEC_DMA_RX_0:
> +               return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> +       case VA_CODEC_DMA_TX_0:
> +       case WSA_CODEC_DMA_RX_0:
> +               return 0;
> +       default:
> +               dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int qcm6490_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> +                                     struct snd_pcm_hw_params *params)
> +{
> +       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +       struct snd_interval *rate = hw_param_interval(params,
> +                                       SNDRV_PCM_HW_PARAM_RATE);
> +       struct snd_interval *channels = hw_param_interval(params,
> +                                       SNDRV_PCM_HW_PARAM_CHANNELS);
> +
> +       rate->min = 48000;
> +       rate->max = 48000;
> +       channels->min = 2;
> +       channels->max = 2;
> +       switch (cpu_dai->id) {
> +       case TX_CODEC_DMA_TX_0:
> +       case TX_CODEC_DMA_TX_1:
> +       case TX_CODEC_DMA_TX_2:
> +       case TX_CODEC_DMA_TX_3:
> +               channels->min = 1;
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int qcm6490_snd_hw_params(struct snd_pcm_substream *substream,
> +                                struct snd_pcm_hw_params *params)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +       struct qcm6490_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
> +
> +       return qcom_snd_sdw_hw_params(substream, params, &pdata->sruntime[cpu_dai->id]);
> +}
> +
> +static int qcm6490_snd_prepare(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +       struct qcm6490_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +       struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
> +
> +       return qcom_snd_sdw_prepare(substream, sruntime,
> +                                   &data->stream_prepared[cpu_dai->id]);
> +}
> +
> +static int qcm6490_snd_hw_free(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct qcm6490_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +       struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
> +
> +       return qcom_snd_sdw_hw_free(substream, sruntime,
> +                                   &data->stream_prepared[cpu_dai->id]);
> +}
> +
> +static const struct snd_soc_ops qcm6490_be_ops = {
> +       .hw_params = qcm6490_snd_hw_params,
> +       .hw_free = qcm6490_snd_hw_free,
> +       .prepare = qcm6490_snd_prepare,
> +};
> +
> +static void qcm6490_add_be_ops(struct snd_soc_card *card)
> +{
> +       struct snd_soc_dai_link *link;
> +       int i;
> +
> +       for_each_card_prelinks(card, i, link) {
> +               if (link->no_pcm == 1) {
> +                       link->init = qcm6490_snd_init;
> +                       link->be_hw_params_fixup = qcm6490_be_hw_params_fixup;
> +                       link->ops = &qcm6490_be_ops;
> +               }
> +       }
> +}
> +
> +static int qcm6490_platform_probe(struct platform_device *pdev)
> +{
> +       struct snd_soc_card *card;
> +       struct qcm6490_snd_data *data;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
> +       if (!card)
> +               return -ENOMEM;
> +       card->owner = THIS_MODULE;
> +       /* Allocate the private data */
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       card->dev = dev;
> +       dev_set_drvdata(dev, card);
> +       snd_soc_card_set_drvdata(card, data);
> +       ret = qcom_snd_parse_of(card);
> +       if (ret)
> +               return ret;
> +
> +       card->driver_name = of_device_get_match_data(dev);
> +       qcm6490_add_be_ops(card);
> +       return devm_snd_soc_register_card(dev, card);
> +}
> +
> +static const struct of_device_id snd_qcm6490_dt_match[] = {
> +       {.compatible = "qcom,qcm6490-sndcard", "qcm6490"},
> +       {.compatible = "qcom,qcs6490-sndcard", "qcs6490"},
> +       {}
> +};
> +
> +MODULE_DEVICE_TABLE(of, snd_qcm6490_dt_match);
> +
> +static struct platform_driver snd_qcm6490_driver = {
> +       .probe  = qcm6490_platform_probe,
> +       .driver = {
> +               .name = "snd-qcm6490",
> +               .of_match_table = snd_qcm6490_dt_match,
> +       },
> +};
> +module_platform_driver(snd_qcm6490_driver);
> +MODULE_DESCRIPTION("qcm6490 ASoC Machine Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry
