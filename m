Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B795B1F4C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 15:34:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CD0C1704;
	Thu,  8 Sep 2022 15:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CD0C1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662644063;
	bh=mZwjPNgTFWbiA/iZHAwCC3+nCxPVJ53/EhXvgaJWoHY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fb8itTRHDutJF4tfYVzEIih8WxH7pWrTeWB8V+Cef1ya268jsZTi190OEwwUuFi6o
	 /1niKXttxgS/XoNtf3OLi3L9/uE9jote9Csw8Z8hejAgn/SwqQi809qxp+M1+cBcfA
	 ewl90gQYvTqnVrtnAsEBck3c+Wkw+2+D1aVEXUbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4B67F8023B;
	Thu,  8 Sep 2022 15:33:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0E0AF80217; Thu,  8 Sep 2022 15:33:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A702CF801F7
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 15:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A702CF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AXjs7SeC"
Received: by mail-lf1-x136.google.com with SMTP id p7so27743159lfu.3
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 06:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=v+nLP1GILkW9Gge3OsJBURWQxulylGJsueWr5G/FbUI=;
 b=AXjs7SeC2bNajIGzzilmj1UnttUpGMFJQz6DbggMGB0LNjQZCA0BbydGpvdrTdWAtO
 +ZVAdYTOBPktxw0J11Snj/uhPdKOeNMi15JJ+TdrRlHvsFrLnsd5OMSqGdDVUwj3xWsm
 kIGolA7tv0C8LX41CUFiuJOA8hL6U+ka4Iifrqi9aFPuqL5yFLxviweWt95b/zat+aDr
 Lplv8eQ6t4SmwOirtEWpeyUwAhrTKL/3mIdYhLlFtyjnbKmyopK2QGnqjDUWSK2fMgqe
 BijBy+ZxJP+6v/+41QDiToMJveJTG//ORSv0aIoJCV3grVh6j1tm7XjKkLHiEe8kBUg+
 zjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=v+nLP1GILkW9Gge3OsJBURWQxulylGJsueWr5G/FbUI=;
 b=ev218uzS7nZJbAl4gjcFiFYZZs/2vcqKxYoLzOt5Sg4YWsiA6f2Im7sSO5Z/cM1+NH
 eWNG2hQcPtSKhd2NICgSBveT312XubDBHo3aUlMIOEkMb/GMPoJHFppzt14USB4preIG
 igln1tGGpR24vdyUVL9PCx0GQqNA0Mp1NOg4l0ijwfcbLnERmlaOBCHL/0r5/FpLG1uB
 UMHd0g/2Za6iQNwuZ3wui0B7dkgq9TeOz2NOZcr8Tg/QV62T6pzt8nHT6Eld3rQ9dZDr
 4wyg5e/v8CmYlIb6PK3jZ4XtgLZnh8GvgD91X7CRqOvuQpDsliOjHuonahp46uQO9FBx
 DNaA==
X-Gm-Message-State: ACgBeo3Hd/Jo6/6CG/li++TMUsu3uqcJGgZZs0kQxoWPF8hMaqfnTKEj
 5D/7Mkwlmo7SYS1z40uIPHHEtA==
X-Google-Smtp-Source: AA6agR7qZb0s6jkFG3gvDIE1FIubqaemFVhdAPftP12eW2EqWqGyq59lZCqqpQY+uR4uy0zdZY9Qxw==
X-Received: by 2002:ac2:43a1:0:b0:48a:fa18:60c4 with SMTP id
 t1-20020ac243a1000000b0048afa1860c4mr2586638lfl.27.1662643993108; 
 Thu, 08 Sep 2022 06:33:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 d2-20020ac25ec2000000b00497a1f92a72sm1365662lfq.221.2022.09.08.06.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:33:12 -0700 (PDT)
Message-ID: <db2080ab-7140-ae10-4655-fe4b4163d25a@linaro.org>
Date: Thu, 8 Sep 2022 15:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 4/4] ASoC: qcom: add machine driver for sc8280xp
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
 <20220908063448.27102-5-srinivas.kandagatla@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908063448.27102-5-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

On 08/09/2022 08:34, Srinivas Kandagatla wrote:
> Add machine driver for sc8280xp SoC.
> 
> This intial supports only includes WSA883x Speakers and WCD938x based headset.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/Kconfig    |  11 +++
>  sound/soc/qcom/Makefile   |   2 +
>  sound/soc/qcom/sc8280xp.c | 157 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 170 insertions(+)
>  create mode 100644 sound/soc/qcom/sc8280xp.c
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 750653404ba3..d0e59e07b1fc 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -173,6 +173,17 @@ config SND_SOC_SM8250
>  	  SM8250 SoC-based systems.
>  	  Say Y if you want to use audio device on this SoCs.
>  
> +config SND_SOC_SC8280XP
> +	tristate "SoC Machine driver for SC8280XP boards"
> +	depends on QCOM_APR && SOUNDWIRE

Comments from my v2 - compile test for APR.

> +	depends on COMMON_CLK
> +	select SND_SOC_QDSP6
> +	select SND_SOC_QCOM_COMMON
> +	help
> +	  To add support for audio on Qualcomm Technologies Inc.
> +	  SC8280XP SoC-based systems.
> +	  Say Y if you want to use audio device on this SoCs.
> +
>  config SND_SOC_SC7180
>  	tristate "SoC Machine driver for SC7180 boards"
>  	depends on I2C && GPIOLIB
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 8b7b876899a8..8b97172cf990 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -26,6 +26,7 @@ snd-soc-sc7180-objs := sc7180.o
>  snd-soc-sc7280-objs := sc7280.o
>  snd-soc-sdm845-objs := sdm845.o
>  snd-soc-sm8250-objs := sm8250.o
> +snd-soc-sc8280xp-objs := sc8280xp.o
>  snd-soc-qcom-common-objs := common.o
>  
>  obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
> @@ -33,6 +34,7 @@ obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
>  obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
>  obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
>  obj-$(CONFIG_SND_SOC_SC7280) += snd-soc-sc7280.o
> +obj-$(CONFIG_SND_SOC_SC8280XP) += snd-soc-sc8280xp.o
>  obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
>  obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
>  obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> new file mode 100644
> index 000000000000..ade44ad7c585
> --- /dev/null
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2022, Linaro Limited
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_device.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/pcm.h>
> +#include <linux/soundwire/sdw.h>
> +#include <sound/jack.h>
> +#include <linux/input-event-codes.h>
> +#include "qdsp6/q6afe.h"
> +#include "common.h"
> +
> +#define DRIVER_NAME		"sc8280xp"
> +
> +struct sc8280xp_snd_data {
> +	bool stream_prepared[AFE_PORT_MAX];
> +	struct snd_soc_card *card;
> +	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
> +	struct snd_soc_jack jack;
> +	bool jack_setup;
> +};
> +
> +static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +
> +	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> +}
> +
> +static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> +				     struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	struct snd_interval *rate = hw_param_interval(params,
> +					SNDRV_PCM_HW_PARAM_RATE);
> +	struct snd_interval *channels = hw_param_interval(params,
> +					SNDRV_PCM_HW_PARAM_CHANNELS);
> +
> +	rate->min = rate->max = 48000;
> +	channels->min = 2;
> +	channels->max = 2;
> +	switch (cpu_dai->id) {
> +	case TX_CODEC_DMA_TX_0:
> +	case TX_CODEC_DMA_TX_1:
> +	case TX_CODEC_DMA_TX_2:
> +	case TX_CODEC_DMA_TX_3:
> +		channels->min = 1;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +

Just one blank line.


Best regards,
Krzysztof
