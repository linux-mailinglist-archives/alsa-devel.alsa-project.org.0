Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC0027C07D
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 11:05:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A9BF1876;
	Tue, 29 Sep 2020 11:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A9BF1876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601370320;
	bh=MykfH4gJz+AeIvZ87kN1OSwrGyy6LMG7qrGwaRo9f+4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pnk43d8fG7814xUF0Dyj1Itrb+7kwVhnKRaxTqbs0b7Bmo2rWzF48C11wC43KKqCs
	 kGEo0C1v8f2II8PxAIPJqvWbbsxzZoa2qwSSQY4LY6JjLv1DjUVxjBWjHXOdQUgBrx
	 +l9IpioqgqQMkX5D8cKpVmWKN8mdjESrkV+TpkTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68A11F802DC;
	Tue, 29 Sep 2020 11:02:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CAD5F802DF; Tue, 29 Sep 2020 11:02:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62A44F802DC
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 11:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62A44F802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TmHkqsuM"
Received: by mail-wm1-x343.google.com with SMTP id x23so3812811wmi.3
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 02:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3fwm3unF6mJQdjkwxwll35liUr6FYR27/8kUrXbc3jo=;
 b=TmHkqsuMvohKjDsw/ZcyybOZWpgBC+NWrtROGyPNd4C5y8UftjI7LBt4mKak3cPimd
 rf3JOj8wMvo/morrCS4pQoXCgTo4TyRQcG8neyIJP1bW1YwDlVedlNGDzizlcJJQU3AD
 K+pYXhw15Fmgio5XjN51hIAtxtQdq0wezA7FJWhCcDF+ql/EyJOeAJYtRlL7PIvm1K9o
 ms8UHts9XerwOpi3YgT/8A0GinfzJ1j4POm2SojFwxY9fmJqBY7DYmzV3X3e6eME6BvR
 3w4cPClCVHWq+vr2Raa13KXFlI4BcXbQe7aJeqC9hCEJFMEGc/m5HwQjaUWvzkR4CYPM
 0w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3fwm3unF6mJQdjkwxwll35liUr6FYR27/8kUrXbc3jo=;
 b=n97Y+AmCkp3rYgwKKaJ0R6paSiRzDJ+DsUFJ5DV5WymucogRJeHy9ibX/cp01KL0rl
 izXm18Y74EZ0zAt8wtJOaZQOMbGu4/jlGU9MK4z78jIfXK8QKAMhxFsxxukWghhyv4+I
 8AdGTm6QaQGWBWgNAMNIMOxQAgLT6k38oQsshdd548GESD7rTa9Qv0bEktAxn44Cng5N
 W9vLiqykmwSU8xtz1zCB47TMEr3bL9NJOH7iAAhnGE+idr/uUyaSRXp9i4gIJEV3FMuo
 sV6O9uD8oXdjKw6UaYYrG6o15KJceqVFkiVJ32qvex1MwGDgEeKGshJjTYokdEmjZOxt
 +eKw==
X-Gm-Message-State: AOAM530hGWwI8NBw1P7sz/fjk0nOf+sFrczGFyIuHpyfkXKy3fluQQ6n
 qTNPAzIpuL7TYz1B0Lb78np3tA==
X-Google-Smtp-Source: ABdhPJymcg/C9LGfnsXsmyFBwpOvXpsH4WPRJFszJn1TYCkKucQtdRSqh4Ofe4eg0bTZQaMXr8LrIg==
X-Received: by 2002:a05:600c:258:: with SMTP id
 24mr3532901wmj.66.1601370135500; 
 Tue, 29 Sep 2020 02:02:15 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id h16sm5406290wre.87.2020.09.29.02.02.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Sep 2020 02:02:14 -0700 (PDT)
Subject: Re: [PATCH v7 5/6] ASoC: qcom: Add support for lpass hdmi driver
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1601286811-25962-1-git-send-email-srivasam@codeaurora.org>
 <1601286811-25962-6-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <18b0e13f-28e4-e4e2-637d-f7c2de8e20f9@linaro.org>
Date: Tue, 29 Sep 2020 10:02:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1601286811-25962-6-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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



On 28/09/2020 10:53, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Upadate lpass cpu and platform driver to support audio over dp.
> Also add lpass-hdmi.c and lpass-hdmi.h.
> 

Thanks for doing the rework this patch looks much better now!

However I have few comments below!

> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> ---
>   sound/soc/qcom/Kconfig           |  17 ++
>   sound/soc/qcom/Makefile          |   2 +
>   sound/soc/qcom/lpass-apq8016.c   |   4 +-
>   sound/soc/qcom/lpass-cpu.c       |  53 ++++-
>   sound/soc/qcom/lpass-hdmi.c      | 470 +++++++++++++++++++++++++++++++++++++++
>   sound/soc/qcom/lpass-hdmi.h      | 122 ++++++++++
>   sound/soc/qcom/lpass-ipq806x.c   |   4 +-
>   sound/soc/qcom/lpass-lpaif-reg.h |  52 ++++-
>   sound/soc/qcom/lpass-platform.c  | 411 +++++++++++++++++++++++++++-------
>   sound/soc/qcom/lpass.h           | 113 +++++++++-
>   10 files changed, 1137 insertions(+), 111 deletions(-)
>   create mode 100644 sound/soc/qcom/lpass-hdmi.c
>   create mode 100644 sound/soc/qcom/lpass-hdmi.h
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index a7ef626..b7ddd05 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -12,6 +12,10 @@ config SND_SOC_LPASS_CPU
>   	tristate
>   	select REGMAP_MMIO
>   
> +config SND_SOC_LPASS_HDMI
> +	tristate
> +	select REGMAP_MMIO
> +
>   config SND_SOC_LPASS_PLATFORM
>   	tristate
>   	select REGMAP_MMIO
> @@ -30,6 +34,7 @@ config SND_SOC_LPASS_SC7180
>   	tristate
>   	select SND_SOC_LPASS_CPU
>   	select SND_SOC_LPASS_PLATFORM
> +	select SND_SOC_LPASS_HDMI
>   
>   config SND_SOC_STORM
>   	tristate "ASoC I2S support for Storm boards"
> @@ -120,4 +125,16 @@ config SND_SOC_SDM845
>   	  SDM845 SoC-based systems.
>   	  Say Y if you want to use audio device on this SoCs.
>   

<<<<<<
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
 >>>>

Does this change belong to this patch!


>   endif #SND_SOC_QCOM
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 7972c94..0bd90d7 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -1,12 +1,14 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # Platform
>   snd-soc-lpass-cpu-objs := lpass-cpu.o
> +snd-soc-lpass-hdmi-objs := lpass-hdmi.o
>   snd-soc-lpass-platform-objs := lpass-platform.o
>   snd-soc-lpass-ipq806x-objs := lpass-ipq806x.o
>   snd-soc-lpass-apq8016-objs := lpass-apq8016.o
>   snd-soc-lpass-sc7180-objs := lpass-sc7180.o
>   
>   obj-$(CONFIG_SND_SOC_LPASS_CPU) += snd-soc-lpass-cpu.o
> +obj-$(CONFIG_SND_SOC_LPASS_HDMI) += snd-soc-lpass-hdmi.o
>   obj-$(CONFIG_SND_SOC_LPASS_PLATFORM) += snd-soc-lpass-platform.o
>   obj-$(CONFIG_SND_SOC_LPASS_IPQ806X) += snd-soc-lpass-ipq806x.o
>   obj-$(CONFIG_SND_SOC_LPASS_APQ8016) += snd-soc-lpass-apq8016.o
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 5c8ae22..0aedb3a 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -125,7 +125,7 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
>   };
>   
>   static int apq8016_lpass_alloc_dma_channel(struct lpass_data *drvdata,
> -					   int direction)
> +					   int direction, unsigned int dai_id)
>   {
>   	struct lpass_variant *v = drvdata->variant;
>   	int chan = 0;
> @@ -151,7 +151,7 @@ static int apq8016_lpass_alloc_dma_channel(struct lpass_data *drvdata,
>   	return chan;
>   }
>   
> -static int apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
> +static int apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, unsigned int dai_id)
>   {
>   	clear_bit(chan, &drvdata->dma_ch_bit_map);
>   
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 12950d2..81aaf51 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -535,13 +535,17 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>   			dev_err(dev, "valid dai id not found: %d\n", ret);
>   			continue;
>   		}
> -
> -		data->mi2s_playback_sd_mode[id] =
> -			of_lpass_cpu_parse_sd_lines(dev, node,
> -						    "qcom,playback-sd-lines");
> -		data->mi2s_capture_sd_mode[id] =
> -			of_lpass_cpu_parse_sd_lines(dev, node,
> +		if (id == LPASS_DP_RX) {
> +			data->hdmi_port_enable = 1;
> +			dev_err(dev, "HDMI Port is enabled: %d\n", id);
> +		} else {
> +			data->mi2s_playback_sd_mode[id] =
> +				of_lpass_cpu_parse_sd_lines(dev, node,
> +							    "qcom,playback-sd-lines");
> +			data->mi2s_capture_sd_mode[id] =
> +				of_lpass_cpu_parse_sd_lines(dev, node,
>   						    "qcom,capture-sd-lines");
> +		}
>   	}
>   }
>   
> @@ -589,13 +593,34 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   						variant->wrdma_channel_start);
>   
>   	drvdata->lpaif_map = devm_regmap_init_mmio(dev, drvdata->lpaif,
> -			&lpass_cpu_regmap_config);
> +		&lpass_cpu_regmap_config);

Looks like unnecessary change!

>   	if (IS_ERR(drvdata->lpaif_map)) {
>   		dev_err(dev, "error initializing regmap: %ld\n",
>   			PTR_ERR(drvdata->lpaif_map));
>   		return PTR_ERR(drvdata->lpaif_map);
>   	}
>   
> +	if (drvdata->hdmi_port_enable) {
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-hdmiif");
> +
> +		drvdata->hdmiif = devm_ioremap_resource(dev, res);
> +		if (IS_ERR((void const __force *)drvdata->hdmiif)) {
> +			dev_err(dev, "error mapping reg resource: %ld\n",
> +					PTR_ERR((void const __force *)drvdata->hdmiif));
> +			return PTR_ERR((void const __force *)drvdata->hdmiif);
> +		}
> +
> +		lpass_hdmi_regmap_config.max_register = LPAIF_HDMI_RDMAPER_REG(variant,
> +					variant->hdmi_rdma_channels);
> +		drvdata->hdmiif_map = devm_regmap_init_mmio(dev, drvdata->hdmiif,
> +					&lpass_hdmi_regmap_config);
> +		if (IS_ERR(drvdata->hdmiif_map)) {
> +			dev_err(dev, "error initializing regmap: %ld\n",
> +			PTR_ERR(drvdata->hdmiif_map));
> +			return PTR_ERR(drvdata->hdmiif_map);
> +		}
> +	}
> +
>   	if (variant->init) {
>   		ret = variant->init(pdev);
>   		if (ret) {
> @@ -606,6 +631,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   
>   	for (i = 0; i < variant->num_dai; i++) {
>   		dai_id = variant->dai_driver[i].id;
> +		if (dai_id == LPASS_DP_RX)
> +			continue;
> +
>   		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get(dev,
>   					     variant->dai_osr_clk_names[i]);
>   		if (IS_ERR(drvdata->mi2s_osr_clk[dai_id])) {
> @@ -636,11 +664,16 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   	/* Initialize bitfields for dai I2SCTL register */
>   	ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
>   						drvdata->lpaif_map);
> -	if (ret) {
> +	if (ret)
>   		dev_err(dev, "error init i2sctl field: %d\n", ret);
> -		return ret;
> -	}
>   
> +	if (drvdata->hdmi_port_enable) {
> +		ret = lpass_hdmi_init_bitfields(dev, drvdata->hdmiif_map);
> +		if (ret) {
> +			dev_err(dev, "%s error  hdmi init failed\n", __func__);
> +			return ret;
> +		}
> +	}
>   	ret = devm_snd_soc_register_component(dev,
>   					      &lpass_cpu_comp_driver,
>   					      variant->dai_driver,
> diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
> new file mode 100644
> index 0000000..fcbb5f2
> --- /dev/null
> +++ b/sound/soc/qcom/lpass-hdmi.c
> @@ -0,0 +1,470 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
> + *
> + * lpass-hdmi.c -- ALSA SoC HDMI-CPU DAI driver for QTi LPASS HDMI
> + */
> +
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <sound/pcm_params.h>
> +#include <linux/regmap.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include <dt-bindings/sound/sc7180-lpass.h>
> +#include "lpass-lpaif-reg.h"
> +#include "lpass.h"
> +
> +#define QCOM_REGMAP_FILED_ALLOC(d, m, f, mf)    \

s/QCOM_REGMAP_FILED_ALLOC/QCOM_REGMAP_FIELD_ALLOC

> +	do { \
> +		mf = devm_regmap_field_alloc(d, m, f);     \
> +		if (IS_ERR(mf))                \
> +			return -EINVAL;         \
> +	} while (0)
> +
> +
> +int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	unsigned int i;
> +	struct lpass_hdmi_tx_ctl *tx_ctl;
> +	struct lpass_hdmitx_legacy *legacy;
> +	struct lpass_vbit_ctrl *vbit_ctl;
> +	struct lpass_hdmi_tx_parity *tx_parity;
> +	struct lpass_dp_metadata_ctl *meta_ctl;
> +	struct lpass_sstream_ctl *sstream_ctl;
> +	struct lpass_hdmi_tx_ch_msb *ch_msb;
> +	struct lpass_hdmi_tx_ch_lsb *ch_lsb;
> +	struct lpass_hdmitx_dmactl *tx_dmactl;

I see that you split the data structures into logical groups, does it 
really help the driver in anyway? I mean do you pass this structures to 
any functions?
Question is do you really need this level of abstraction?
Can't you just use flat regmap fileds with prefixes that would make code 
even cleaner!


> +	int rval;
> +
> +	tx_ctl = devm_kzalloc(dev, sizeof(*tx_ctl), GFP_KERNEL);
> +	if (!tx_ctl)
> +		return -ENOMEM;
> +
> +	QCOM_REGMAP_FILED_ALLOC(dev, map, v->soft_reset, tx_ctl->soft_reset);
> +	QCOM_REGMAP_FILED_ALLOC(dev, map, v->force_reset, tx_ctl->force_reset);
> +	drvdata->tx_ctl = tx_ctl;
> +
> +	legacy = devm_kzalloc(dev, sizeof(*legacy), GFP_KERNEL);
> +	if (!legacy)
> +		return -ENOMEM;
> +
> +	QCOM_REGMAP_FILED_ALLOC(dev, map, v->legacy_en, legacy->legacy_en);
> +	drvdata->legacy = legacy;
> +
> +	vbit_ctl = devm_kzalloc(dev, sizeof(*vbit_ctl), GFP_KERNEL);
> +	if (!vbit_ctl)
> +		return -ENOMEM;
> +
> +	QCOM_REGMAP_FILED_ALLOC(dev, map, v->replace_vbit, vbit_ctl->replace_vbit);
> +	QCOM_REGMAP_FILED_ALLOC(dev, map, v->vbit_stream, vbit_ctl->vbit_stream);
> +	drvdata->vbit_ctl = vbit_ctl;
> +
> +	tx_parity = devm_kzalloc(dev, sizeof(*tx_parity), GFP_KERNEL);
> +	if (!tx_parity)
> +		return -ENOMEM;
> +
> +	QCOM_REGMAP_FILED_ALLOC(dev, map, v->calc_en, tx_parity->calc_en);
> +	drvdata->tx_parity = tx_parity;
> +
> +	meta_ctl = devm_kzalloc(dev, sizeof(*meta_ctl), GFP_KERNEL);
> +	if (!meta_ctl)
> +		return -ENOMEM;
> +
> +	rval = devm_regmap_field_bulk_alloc(dev, map, &meta_ctl->mute, &v->mute, 7);
> +	if (rval)
> +		return rval;
> +	drvdata->meta_ctl = meta_ctl;
> +
> +	sstream_ctl = devm_kzalloc(dev, sizeof(*sstream_ctl), GFP_KERNEL);
> +	if (!sstream_ctl)
> +		return -ENOMEM;
> +
> +	rval = devm_regmap_field_bulk_alloc(dev, map, &sstream_ctl->sstream_en, &v->sstream_en, 9);
> +	if (rval)
> +		return rval;
> +
> +	drvdata->sstream_ctl = sstream_ctl;
> +
> +	for (i = 0; i < LPASS_MAX_HDMI_DMA_CHANNELS; i++) {
> +		ch_msb = devm_kzalloc(dev, sizeof(*ch_msb), GFP_KERNEL);
> +		if (!ch_msb)
> +			return -ENOMEM;
> +
> +		QCOM_REGMAP_FILED_ALLOC(dev, map, v->msb_bits, ch_msb->msb_bits);
> +		drvdata->ch_msb[i] = ch_msb;
> +
> +		ch_lsb = devm_kzalloc(dev, sizeof(*ch_lsb), GFP_KERNEL);
> +		if (!ch_lsb)
> +			return -ENOMEM;
> +
> +		QCOM_REGMAP_FILED_ALLOC(dev, map, v->lsb_bits, ch_lsb->lsb_bits);
> +		drvdata->ch_lsb[i] = ch_lsb;
> +
> +		tx_dmactl = devm_kzalloc(dev, sizeof(*tx_dmactl), GFP_KERNEL);
> +		if (!tx_dmactl)
> +			return -ENOMEM;
> +
> +		QCOM_REGMAP_FILED_ALLOC(dev, map, v->use_hw_chs, tx_dmactl->use_hw_chs);
> +		QCOM_REGMAP_FILED_ALLOC(dev, map, v->use_hw_usr, tx_dmactl->use_hw_usr);
> +		QCOM_REGMAP_FILED_ALLOC(dev, map, v->hw_chs_sel, tx_dmactl->hw_chs_sel);
> +		QCOM_REGMAP_FILED_ALLOC(dev, map, v->hw_usr_sel, tx_dmactl->hw_usr_sel);
> +		drvdata->hdmi_tx_dmactl[i] = tx_dmactl;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL(lpass_hdmi_init_bitfields);
> +
...

> +
> +static bool lpass_hdmi_regmap_volatile(struct device *dev, unsigned int reg)
> +{
> +	return true;
> +}

Are you sure are all the registers volatile?


> +
> +struct regmap_config lpass_hdmi_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.writeable_reg = lpass_hdmi_regmap_writeable,
> +	.readable_reg = lpass_hdmi_regmap_readable,
> +	.volatile_reg = lpass_hdmi_regmap_volatile,
> +	.cache_type = REGCACHE_FLAT,
> +};
> +EXPORT_SYMBOL(lpass_hdmi_regmap_config);
> +
> +MODULE_DESCRIPTION("QTi LPASS HDMI Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/qcom/lpass-hdmi.h b/sound/soc/qcom/lpass-hdmi.h
> new file mode 100644
> index 0000000..0389af0
> --- /dev/null
> +++ b/sound/soc/qcom/lpass-hdmi.h
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
> + *
> + * lpass_hdmi.h - Definitions for the QTi LPASS HDMI
> + */
> +
> +#ifndef __LPASS_HDMI_H__
> +#define __LPASS_HDMI_H__
> +
> +#include <linux/regmap.h>
> +
> +#define LPASS_HDMITX_LEGACY_DISABLE		0x0
> +#define LPASS_HDMITX_LEGACY_ENABLE		0x1
> +#define LPASS_DP_AUDIO_BITWIDTH16		0x0
> +#define LPASS_DP_AUDIO_BITWIDTH24		0xb
> +#define LPASS_DATA_FORMAT_SHIFT			0x1
> +#define LPASS_FREQ_BIT_SHIFT			24
> +#define LPASS_DATA_FORMAT_LINEAR		0x0
> +#define LPASS_DATA_FORMAT_NON_LINEAR	0x1
> +#define LPASS_SAMPLING_FREQ32			0x3
> +#define LPASS_SAMPLING_FREQ44			0x0
> +#define LPASS_SAMPLING_FREQ48			0x2
> +#define LPASS_TX_CTL_RESET				0x1
> +#define LPASS_TX_CTL_CLEAR				0x0
> +#define LPASS_SSTREAM_ENABLE			1
> +#define LPASS_SSTREAM_DISABLE			0
> +#define LPASS_LAYOUT_SP_DEFAULT			0xf
> +#define LPASS_SSTREAM_DEFAULT_ENABLE	1
> +#define LPASS_SSTREAM_DEFAULT_DISABLE	0
> +#define LPASS_MUTE_ENABLE				1
> +#define LPASS_MUTE_DISABLE				0
> +#define LPASS_META_DEFAULT_VAL			0
> +#define HW_MODE							1
> +#define SW_MODE							0
> +#define LEGACY_LPASS_LPAIF				1
> +#define LEGACY_LPASS_HDMI				0
> +#define REPLACE_VBIT					0x1
> +#define LINEAR_PCM_DATA					0x0
> +#define NON_LINEAR_PCM_DATA				0x1
> +#define HDMITX_PARITY_CALC_EN			0x1
> +#define HDMITX_PARITY_CALC_DIS			0x0
> +#define LPASS_DATA_FORMAT_MASK			GENMASK(1, 1)
> +#define LPASS_WORDLENGTH_MASK			GENMASK(3, 0)
> +#define LPASS_FREQ_BIT_MASK				GENMASK(27, 24)
> +
> +#define LPASS_HDMI_TX_CTL_ADDR(v)		(v->hdmi_tx_ctl_addr)
> +#define LPASS_HDMI_TX_LEGACY_ADDR(v)	(v->hdmi_legacy_addr)
> +#define LPASS_HDMI_TX_VBIT_CTL_ADDR(v)	(v->hdmi_vbit_addr)
> +#define LPASS_HDMI_TX_PARITY_ADDR(v)	(v->hdmi_parity_addr)
> +#define LPASS_HDMI_TX_DP_ADDR(v)		(v->hdmi_DP_addr)
> +#define LPASS_HDMI_TX_SSTREAM_ADDR(v)	(v->hdmi_sstream_addr)
> +
> +#define LPASS_HDMI_TX_CH_LSB_ADDR(v, port) \
> +		(v->hdmi_ch_lsb_addr + v->ch_stride * (port))
> +#define LPASS_HDMI_TX_CH_MSB_ADDR(v, port) \
> +		(v->hdmi_ch_msb_addr + v->ch_stride * (port))
> +#define LPASS_HDMI_TX_DMA_ADDR(v, port) \
> +		(v->hdmi_dmactl_addr + v->hdmi_dma_stride * (port))
> +
> +struct lpass_sstream_ctl {
> +	struct regmap_field *sstream_en;
> +	struct regmap_field *dma_sel;
> +	struct regmap_field *auto_bbit_en;
> +	struct regmap_field *layout;
> +	struct regmap_field *layout_sp;
> +	struct regmap_field *set_sp_on_en;
> +	struct regmap_field *dp_audio;
> +	struct regmap_field *dp_staffing_en;
> +	struct regmap_field *dp_sp_b_hw_en;
> +};
> +
> +struct lpass_dp_metadata_ctl {
> +	struct regmap_field *mute;
> +	struct regmap_field *as_sdp_cc;
> +	struct regmap_field *as_sdp_ct;
> +	struct regmap_field *aif_db4;
> +	struct regmap_field *frequency;
> +	struct regmap_field *mst_index;
> +	struct regmap_field *dptx_index;
> +};
> +
> +struct lpass_hdmi_tx_ctl {
> +	struct regmap_field *soft_reset;
> +	struct regmap_field *force_reset;
> +};
> +
> +struct lpass_hdmitx_dmactl {
> +	struct regmap_field *use_hw_chs;
> +	struct regmap_field *use_hw_usr;
> +	struct regmap_field *hw_chs_sel;
> +	struct regmap_field *hw_usr_sel;
> +};
> +
> +struct lpass_vbit_ctrl {
> +		struct regmap_field *replace_vbit;
> +		struct regmap_field *vbit_stream;
> +};
> +
> +struct  lpass_hdmitx_legacy {
> +	struct regmap_field *legacy_en;
> +};
> +
> +struct  lpass_hdmi_tx_parity {
> +	struct regmap_field *calc_en;
> +};
> +
> +struct  lpass_hdmi_tx_ch_lsb {
> +	struct regmap_field *lsb_bits;
> +};
> +
> +struct  lpass_hdmi_tx_ch_msb {
> +	struct regmap_field *msb_bits;
> +};
> +
> +extern int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map);
> +extern struct regmap_config lpass_hdmi_regmap_config;

You should consider moving the regmap_config to lpass-cpu.c, Not sure 
why we really need to export this symbol! most of this regmap config is 
only used in lpass-cpu.c


> +extern const struct snd_soc_dai_ops asoc_qcom_lpass_hdmi_dai_ops;
> +
> +
> +
> +#endif /* __LPASS_HDMI_H__ */
> diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
> index 72f09b3..832a916 100644
> --- a/sound/soc/qcom/lpass-ipq806x.c
> +++ b/sound/soc/qcom/lpass-ipq806x.c
> @@ -96,7 +96,7 @@ static int ipq806x_lpass_exit(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int ipq806x_lpass_alloc_dma_channel(struct lpass_data *drvdata, int dir)
> +static int ipq806x_lpass_alloc_dma_channel(struct lpass_data *drvdata, int dir, unsigned int dai_id)
>   {
>   	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
>   		return IPQ806X_LPAIF_RDMA_CHAN_MI2S;
> @@ -104,7 +104,7 @@ static int ipq806x_lpass_alloc_dma_channel(struct lpass_data *drvdata, int dir)
>   		return -EINVAL;
>   }
>   
> -static int ipq806x_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
> +static int ipq806x_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, unsigned int dai_id)
>   {
>   	return 0;
>   }
...

> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index db0d959..390a66b 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -23,7 +23,7 @@ struct lpass_pcm_data {
>   	int i2s_port;
>   };
>   
> -#define LPASS_PLATFORM_BUFFER_SIZE	(16 * 1024)
> +#define LPASS_PLATFORM_BUFFER_SIZE	(24 *  2 * 1024)


Why do you need to change this?
even if you plan to change this please send this as a seperate patch!

>   #define LPASS_PLATFORM_PERIODS		2
>   
>   static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
> @@ -80,6 +80,23 @@ static int lpass_platform_alloc_dmactl_fields(struct device *dev,
>   					    &v->wrdma_intf, 6);
>   }
>   
> +static int lpass_platform_alloc_hdmidmactl_fields(struct device *dev,
> +					 struct regmap *map)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	struct lpaif_dmactl *rd_dmactl;
> +
> +	rd_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl), GFP_KERNEL);
> +	if (rd_dmactl == NULL)
> +		return -ENOMEM;
> +
> +	drvdata->hdmi_rd_dmactl = rd_dmactl;
> +
> +	return devm_regmap_field_bulk_alloc(dev, map, &rd_dmactl->bursten,
> +					    &v->hdmi_rdma_bursten, 8);
> +}
> +
>   static int lpass_platform_pcmops_open(struct snd_soc_component *component,
>   				      struct snd_pcm_substream *substream)
>   {
> @@ -89,7 +106,9 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
>   	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
>   	struct lpass_variant *v = drvdata->variant;
>   	int ret, dma_ch, dir = substream->stream;
> -	struct lpass_pcm_data *data;
> +	struct lpass_pcm_data *data = NULL;

What is the reason for intializing, Did you hit any compile warning?
> +	struct regmap *map;
> +	unsigned int dai_id = cpu_dai->driver->id;
>   
>   	data = kzalloc(sizeof(*data), GFP_KERNEL);
>   	if (!data)
> @@ -99,25 +118,28 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
>   	runtime->private_data = data;
>   
>   	if (v->alloc_dma_channel)
> -		dma_ch = v->alloc_dma_channel(drvdata, dir);
> +		dma_ch = v->alloc_dma_channel(drvdata, dir, dai_id);
>   	else
>   		dma_ch = 0;
>   
>   	if (dma_ch < 0)
>   		return dma_ch;
>   
> -	drvdata->substream[dma_ch] = substream;
> -
> -	ret = regmap_write(drvdata->lpaif_map,
> -			LPAIF_DMACTL_REG(v, dma_ch, dir), 0);
> +	if (cpu_dai->driver->id == LPASS_DP_RX) {
> +		map = drvdata->hdmiif_map;
> +		drvdata->hdmi_substream[dma_ch] = substream;
> +	} else {
> +		map = drvdata->lpaif_map;
> +		drvdata->substream[dma_ch] = substream;
> +	}
> +	data->dma_ch = dma_ch;
> +	ret = regmap_write(map,
> +			LPAIF_DMACTL_REG(v, dma_ch, dir, data->i2s_port), 0);
>   	if (ret) {
>   		dev_err(soc_runtime->dev,
>   			"error writing to rdmactl reg: %d\n", ret);
>   		return ret;
>   	}
> -
> -	data->dma_ch = dma_ch;
> -
>   	snd_soc_set_runtime_hwparams(substream, &lpass_platform_pcm_hardware);
>   
>   	runtime->dma_bytes = lpass_platform_pcm_hardware.buffer_bytes_max;
> @@ -139,14 +161,20 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
>  

...

>   static int lpass_platform_pcm_new(struct snd_soc_component *component,
>   				  struct snd_soc_pcm_runtime *soc_runtime)
>   {
> @@ -625,22 +856,20 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>   	if (drvdata->lpaif_irq < 0)
>   		return -ENODEV;
>   
> -	/* ensure audio hardware is disabled */
> -	ret = regmap_write(drvdata->lpaif_map,
> -			LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0);
> +	ret = devm_request_irq(&pdev->dev, drvdata->lpaif_irq,
> +			lpass_platform_lpaif_irq, 0, "lpass-irq-lpaif", drvdata);
>   	if (ret) {
> -		dev_err(&pdev->dev, "error writing to irqen reg: %d\n", ret);
> +		dev_err(&pdev->dev, "irq request failed: %d\n", ret);

This type of changes can be in seperate patch!

>   		return ret;
>   	}
>   
> -	ret = devm_request_irq(&pdev->dev, drvdata->lpaif_irq,
> -			lpass_platform_lpaif_irq, IRQF_TRIGGER_RISING,
> -			"lpass-irq-lpaif", drvdata);
> +	/* ensure audio hardware is disabled */
> +	ret = regmap_write(drvdata->lpaif_map,
> +			LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0);
>   	if (ret) {
> -		dev_err(&pdev->dev, "irq request failed: %d\n", ret);
> +		dev_err(&pdev->dev, "error writing to irqen reg: %d\n", ret);
>   		return ret;
>   	}
> -

Unnecessary change!

>   	ret = lpass_platform_alloc_dmactl_fields(&pdev->dev,
>   						 drvdata->lpaif_map);

Thanks,
srini
