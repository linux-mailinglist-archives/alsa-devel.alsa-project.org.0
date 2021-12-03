Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8F5467A30
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 16:23:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E27E522B6;
	Fri,  3 Dec 2021 16:22:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E27E522B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638544998;
	bh=RP4/uks+wVL3wefNyn83+pJPRUZKKmB2Yy7oswxvdTQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dCe9yBq/JNSsLbfMgMGIQ4LSsDV5nbPa6z2gjyR3BIL4n6Tf56q//ihSwb5jjbnHi
	 QfIycC7oASuoeKd6QCS5TV0inHruS9ruBfdT3+Mz0d0MWVbHTSVtXh5Xp3aZF8MMEL
	 m8hszq8hJkx3cKkcnnqJLgSGPIKAA4AWgiEpCJ9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3919CF800A7;
	Fri,  3 Dec 2021 16:22:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02451F80246; Fri,  3 Dec 2021 16:21:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0499BF80085
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 16:21:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0499BF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="n1qKX7Cf"
Received: by mail-wr1-x430.google.com with SMTP id d9so6468856wrw.4
 for <alsa-devel@alsa-project.org>; Fri, 03 Dec 2021 07:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NWBlTWNs/SDRDxcsHdXQ/DBHT2ACOQuzczNNaBJvbGY=;
 b=n1qKX7CfMzr4yCAZC9iSYNLdp7VBfQxHHj5oZ6QrGM8NZY0WIqd6gHb4vo9dBWkQHi
 +5z53Dr7s7yweBq14ZJShl2FihQ22vaFl+NzBuaGL8MaWAzD7SspZqEnK9eu9kdoHRLu
 Z5Zhu2xayKowcOwCc4CGyMKLaDYhjf0HS8+vZj9yJ+asrzmuXoku1dER4OYK3XVFngpt
 Z6h2vMNQsw8/ztpVi6VubQCgiQcgoPXNsQECwxkcxhwiH1Ga0fkr0gVSc6I/sUPE/h0T
 cZrYaoNapMNsV6uVrgJPS5+ubpY9umj0Mv8L94E6nOkgtPKA3PUdY9d597LNbyvKLZmE
 G1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NWBlTWNs/SDRDxcsHdXQ/DBHT2ACOQuzczNNaBJvbGY=;
 b=61iUMUtGdFSfI3A6pgHwh5GabdG0vQ/tvsZG5gR4qNO0t5i5ptOnmM6UAzufuI2Ffv
 p+pbQbnl537xxt42Rfw79fVruFHDm6gpBQhwRsYQ2BroD60HSFRjvqbge/mBoEp0KKe6
 bHouUedRpbNI3sxo+eXtRumQqGKanriu3+Wwi4tORs7CR8NzTy3vnCN/9ZumptncgMRR
 8VkmC3GO5HrDua0bPwxngIsmVq82jLtZcM0BOngldGQlFW5PgX0Oov05wJ2FjMAlhzU0
 PiEsHbY4jBhWE9ClIO9YrdI8PiWO0QAeMiC7BQwgAvZm9tRPFE/slK04E/304vFUbkw2
 KAmQ==
X-Gm-Message-State: AOAM533qqGya3Del5UlnS1AYh64R7lvX/rlAixxT4OWRemHBcVqdwDP5
 VqXqcqcaUmdiTVJWa/Ywm8bDfQ==
X-Google-Smtp-Source: ABdhPJy1yWegc3CaZOHkauWkJOjTboULhasYlk4AaL+a0tQia5tvbT2eDC/LqcL9NV5yVluiLFeLIg==
X-Received: by 2002:adf:f209:: with SMTP id p9mr21771829wro.191.1638544909324; 
 Fri, 03 Dec 2021 07:21:49 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id a1sm3945521wri.89.2021.12.03.07.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 07:21:48 -0800 (PST)
Subject: Re: [PATCH v7 2/2] ASoC: qcom: SC7280: Add machine driver
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1638533183-19023-1-git-send-email-srivasam@codeaurora.com>
 <1638533183-19023-3-git-send-email-srivasam@codeaurora.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a564d5d5-5f31-2005-3546-2390bba3ff9e@linaro.org>
Date: Fri, 3 Dec 2021 15:21:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1638533183-19023-3-git-send-email-srivasam@codeaurora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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



On 03/12/2021 12:06, Srinivasa Rao Mandadapu wrote:
> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> Add new machine driver to register sound card on sc7280 based targets and
> do the required configuration for lpass cpu dai and external codecs
> connected over MI2S and soundwire interfaces.
> Add support for audio jack detection, soundwire init and MBHC.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/qcom/Kconfig  |  14 +++
>   sound/soc/qcom/Makefile |   2 +
>   sound/soc/qcom/lpass.h  |   1 +
>   sound/soc/qcom/sc7280.c | 290 ++++++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 307 insertions(+)
>   create mode 100644 sound/soc/qcom/sc7280.c

Overall it looks good, but few nits below.

> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index cc7c1de..932b082 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -152,4 +152,18 @@ config SND_SOC_SC7180
>   	  SC7180 SoC-based systems.
>   	  Say Y if you want to use audio device on this SoCs.
>   
> +config SND_SOC_SC7280
> +	tristate "SoC Machine driver for SC7280 boards"
> +	depends on I2C && SOUNDWIRE || COMPILE_TEST
> +	select SND_SOC_QCOM_COMMON
> +	select SND_SOC_LPASS_SC7280
> +	select SND_SOC_MAX98357A
> +	select SND_SOC_WCD938X
> +	select SND_SOC_LPASS_RX_MACRO
> +	select SND_SOC_LPASS_TX_MACRO
> +	help
> +	  Add support for audio on Qualcomm Technologies Inc.
> +	  SC7280 SoC-based systems.
> +	  Say Y or M if you want to use audio device on this SoCs.
> +
>   endif #SND_SOC_QCOM
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 1600ae5..625aec6 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -19,6 +19,7 @@ snd-soc-storm-objs := storm.o
>   snd-soc-apq8016-sbc-objs := apq8016_sbc.o
>   snd-soc-apq8096-objs := apq8096.o
>   snd-soc-sc7180-objs := sc7180.o
> +snd-soc-sc7280-objs := sc7280.o
>   snd-soc-sdm845-objs := sdm845.o
>   snd-soc-sm8250-objs := sm8250.o
>   snd-soc-qcom-common-objs := common.o
> @@ -27,6 +28,7 @@ obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
>   obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
>   obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
>   obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
> +obj-$(CONFIG_SND_SOC_SC7280) += snd-soc-sc7280.o
>   obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
>   obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
>   obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 67ef497..c0f0247 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -16,6 +16,7 @@
>   #include "lpass-hdmi.h"
>   
>   #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
> +#define LPASS_MAX_PORTS			(LPASS_CDC_DMA_VA_TX8 + 1)

This change does not really belong in this patch, can you move this into 
a separate patch?


>   #define LPASS_MAX_MI2S_PORTS			(8)
>   #define LPASS_MAX_DMA_CHANNELS			(8)
>   #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
> new file mode 100644
> index 0000000..31a77eb
> --- /dev/null
> +++ b/sound/soc/qcom/sc7280.c
> @@ -0,0 +1,290 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> +//
> +// ALSA SoC Machine driver for sc7280
> +
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <linux/soundwire/sdw.h>
> +
...

> +
> +static const struct snd_soc_ops sc7280_ops = {
> +	.hw_params = sc7280_snd_hw_params,
> +	.hw_free = sc7280_snd_hw_free,
> +	.prepare = sc7280_snd_prepare,
> +};
> +
> +static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +};

This is not used anywhere in the file.

> +
> +static int sc7280_snd_platform_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card;
> +	struct sc7280_snd_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct snd_soc_dai_link *link;
> +	int ret, i;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	card = &data->card;
> +	snd_soc_card_set_drvdata(card, data);
> +
> +	card->owner = THIS_MODULE;
> +	card->driver_name = "SC7280";
> +	card->dev = dev;
> +
> +	ret = qcom_snd_parse_of(card);
> +	if (ret)
> +		return ret;
> +
> +	for_each_card_prelinks(card, i, link) {
> +		link->init = sc7280_init;
> +		link->ops = &sc7280_ops;
> +	}
> +
> +	return devm_snd_soc_register_card(dev, card);
> +}
> +
> +static const struct of_device_id sc7280_snd_device_id[]  = {
> +	{ .compatible = "google,sc7280-herobrine" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, sc7280_snd_device_id);
> +
> +static struct platform_driver sc7280_snd_driver = {
> +	.probe = sc7280_snd_platform_probe,
> +	.driver = {
> +		.name = "msm-snd-sc7280",
> +		.of_match_table = sc7280_snd_device_id,
> +		.pm = &snd_soc_pm_ops,
> +	},
> +};
> +module_platform_driver(sc7280_snd_driver);
> +
> +MODULE_DESCRIPTION("sc7280 ASoC Machine Driver");
> +MODULE_LICENSE("GPL");
> 
