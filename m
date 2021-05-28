Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC9D393EE3
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 10:38:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9556416E1;
	Fri, 28 May 2021 10:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9556416E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622191096;
	bh=IyxtrKEY/kYCz78hc36LoOdxi/+s136peZN2G0StIhA=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LIiEh0aVg1ox7Qle14ggfiioZyMvPWK0Jk4bY5di54Y5paKNMD9JTNelIGKamWlfd
	 tHTYxggw0wnDlzJLeNgUurOPJxZWjv0uVZ8E2gYyTRiQT0MZWP5d4vz3vsdbGEOJsg
	 Fi+5d7UbAxWC2ZjzPLDctHjzcSbL35sWb1X69Fmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10289F800F9;
	Fri, 28 May 2021 10:36:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80880F80264; Fri, 28 May 2021 10:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA292F8013A
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 10:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA292F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IhPoCNOa"
Received: by mail-wr1-x42d.google.com with SMTP id n2so2517043wrm.0
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=V03u/XyZi3pPuRX5LQlb8QPL3m3IaEUB6/fHYvwS6Eg=;
 b=IhPoCNOaFrHxImotr9rEePvVlb9Wt/uvzpY2poaWhCt0r8hA6Y0EUpjovO7BH5iPkL
 EDruzLmZfJcc+Ax2OuQxn5rrAHPE+erAFE2eGQmjRta5x//cPJc9xBPvRGojfScEexB+
 P1lxEhrFkPn7ZfpLVBo8UQkImc6Lt2Acvc9y2h1xgFFVjESwi7+Qvap2ONNcVm8UArlm
 HMPD4aIm6IYjgSbHN2h9KS1zRet1LsGNcY+QU+ytBeP/aohjlA/wv19rd8rUY70JJHVI
 Z8t7NJ2+cM7Y43F9Fw3Rzgr40QvQyrFIpJ1GJhv9UrH9T3D7zcyDC/jCVz0lm6maN8mW
 ktpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V03u/XyZi3pPuRX5LQlb8QPL3m3IaEUB6/fHYvwS6Eg=;
 b=nNLnWGaZJHTXpu/daeuf1TH3A9WK1EXEWZMTGeDucHTT1b5/+ZE3rZPWP4gzD1h1sm
 L9Ia+rxque22vNQdSvK9o9uQrTZx0Z55elkHVLbB0CiO1jQ0hyE9TcRRq0LfMHg7nOWD
 Yyl4Mr+uzc0GIcdwUbIFqiPwdqyWkLyagrvtbx8qgx7fSbLe7uB9NA+Giup2/8X16Aq1
 Zny/x8VakqKULbR4HM+bhifhNUJkBk62T9nevhTzxFlZ2NKIAKOGJ1/F7rKct0Dw0Gyi
 wa669sLstX+0ypupEk4NzdUwMBvz21z6NY3u/k6CvjuJOimhg+tKzpWVnz/pHQPA7FJz
 b1Nw==
X-Gm-Message-State: AOAM532/TOl4RvBxIUgvp7db+h9rT+BJO3kle07GT4ZxHPRuKh+2IGyG
 27/7HKyQe0RG+byEoCh2iZdLDg==
X-Google-Smtp-Source: ABdhPJw6ASwJx8tFWYm7xXzM/CV0saZMtFH4llkM7XlWYPBuT3XmqhTIKbzhkmMQWzeXk0irJ/RScA==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr7537375wrq.356.1622190997481; 
 Fri, 28 May 2021 01:36:37 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id s2sm11785217wmc.21.2021.05.28.01.36.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 May 2021 01:36:36 -0700 (PDT)
Subject: Re: [PATCH] Asoc: qcom: Add four speaker support on MI2S secondary
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <20210527073309.28661-1-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <213e1133-0164-03da-1740-c7ca39f3fd8c@linaro.org>
Date: Fri, 28 May 2021 09:36:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210527073309.28661-1-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi Srinivasa,

On 27/05/2021 08:33, Srinivasa Rao Mandadapu wrote:
> Add four speaker support on MI2S secondary block
> by using I2S SD1 line on gpio52 pin, and add channel map
> control support in the lpass-cpu audio driver.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-cpu.c    | 106 +++++++++++++++++++++++++++++++++-
>   sound/soc/qcom/lpass-sc7180.c |   1 +
>   sound/soc/qcom/lpass.h        |   5 ++
>   3 files changed, 111 insertions(+), 1 deletion(-)
> 

This patch looks totally redundant to set_channel_map/get_channel_map 
implementation. You should probably consider adding that support to the 
qcom_lpass_cpu_dai_ops. And let the machine driver set the channel map.

--srini

> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index c62d2612e8f5..88a038a107a7 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -28,6 +28,19 @@
>   #define LPASS_CPU_I2S_SD2_3_MASK	GENMASK(3, 2)
>   #define LPASS_CPU_I2S_SD0_1_2_MASK	GENMASK(2, 0)
>   #define LPASS_CPU_I2S_SD0_1_2_3_MASK	GENMASK(3, 0)
> +#define LPASS_CHMAP_IDX_UNKNOWN		-1
> +
> +/*
> + * Channel maps for multi-channel playbacks on MI2S Secondary, up to 4 n_ch
> + */
> +static struct snd_pcm_chmap_elem lpass_chmaps[] = {
> +	{ .channels = 2,
> +	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR } },
> +	{ .channels = 4,
> +	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
> +				SNDRV_CHMAP_RL, SNDRV_CHMAP_RR } },
> +	{ }
> +};
>   
>   static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
>   			struct lpaif_i2sctl *i2sctl, struct regmap *map)
> @@ -86,6 +99,9 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
>   		clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
>   		return ret;
>   	}
> +	if (drvdata->chmap_info && drvdata->chmap_info->max_channels == 4)
> +		drvdata->chmap_info->chmap = lpass_chmaps;
> +
>   	return 0;
>   }
>   
> @@ -96,6 +112,7 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
>   
>   	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
>   	clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
> +	drvdata->chmap_idx = LPASS_CHMAP_IDX_UNKNOWN;
>   }
>   
>   static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
> @@ -224,9 +241,14 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   				ret);
>   			return ret;
>   		}
> -		if (channels >= 2)
> +		if (channels >= 2) {
>   			ret = regmap_fields_write(i2sctl->spkmono, id,
>   						 LPAIF_I2SCTL_SPKMONO_STEREO);
> +			if (channels == 4)
> +				drvdata->chmap_idx = 1;
> +			else
> +				drvdata->chmap_idx = 0;
> +		}
>   		else
>   			ret = regmap_fields_write(i2sctl->spkmono, id,
>   						 LPAIF_I2SCTL_SPKMONO_MONO);
> @@ -324,6 +346,84 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
>   };
>   EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
>   
> +static int lpass_cpu_chmap_ctl_get(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	unsigned const char *map;
> +	unsigned int i;
> +	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
> +	struct lpass_data *drvdata = info->private_data;
> +
> +	if (info->max_channels == 2)
> +		map = &lpass_chmaps[0].map[0];
> +	else if (info->max_channels == 4)
> +		map = &lpass_chmaps[1].map[0];
> +
> +	for (i = 0; i < info->max_channels; i++) {
> +		if (drvdata->chmap_idx == LPASS_CHMAP_IDX_UNKNOWN)
> +			ucontrol->value.integer.value[i] = 0;
> +		else
> +			ucontrol->value.integer.value[i] = map[i];
> +	}
> +
> +	return 0;
> +}
> +
> +static int lpass_cpu_chmap_ctl_set(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	unsigned int i;
> +	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
> +	struct lpass_data *drvdata = info->private_data;
> +	unsigned char *map;
> +
> +	if (info->max_channels == 2)
> +		map = &lpass_chmaps[0].map[0];
> +	else if (info->max_channels == 4)
> +		map = &lpass_chmaps[1].map[0];
> +
> +	for (i = 0; i < info->max_channels; i++) {
> +		if (drvdata->chmap_idx == LPASS_CHMAP_IDX_UNKNOWN)
> +			map[i] = 0;
> +		else
> +			map[i] = ucontrol->value.integer.value[i];
> +	}
> +
> +	return 0;
> +}
> +
> +int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
> +			      struct snd_soc_dai *dai)
> +{
> +	int ret;
> +
> +	struct snd_soc_dai_driver *drv = dai->driver;
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +
> +	ret =  snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
> +			snd_pcm_alt_chmaps, drv->playback.channels_max, 0,
> +			&drvdata->chmap_info);
> +	if (ret < 0)
> +		return ret;
> +
> +
> +	/*
> +	 * override handlers
> +	 */
> +	drvdata->chmap_info->private_data = drvdata;
> +	drvdata->chmap_info->kctl->get = lpass_cpu_chmap_ctl_get;
> +	drvdata->chmap_info->kctl->put = lpass_cpu_chmap_ctl_set;
> +
> +	/*
> +	 * default chmap supported is stereo
> +	 */
> +	drvdata->chmap_info->chmap = lpass_chmaps;
> +	drvdata->chmap_idx = LPASS_CHMAP_IDX_UNKNOWN;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(lpass_cpu_pcm_new);
> +
>   int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> @@ -856,6 +956,10 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
>   			return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
>   		}
> +		if (drvdata->mi2s_playback_sd_mode[dai_id] == LPAIF_I2SCTL_MODE_QUAD01) {
> +			variant->dai_driver[dai_id].playback.channels_min = 4;
> +			variant->dai_driver[dai_id].playback.channels_max = 4;
> +		}
>   	}
>   
>   	/* Allocation for i2sctl regmap fields */
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index 8c168d3c589e..77a556b27cf0 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -58,6 +58,7 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
>   		},
>   		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
>   		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
> +		.pcm_new = lpass_cpu_pcm_new,
>   	}, {
>   		.id = LPASS_DP_RX,
>   		.name = "Hdmi",
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 83b2e08ade06..fb82591d550c 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -76,6 +76,9 @@ struct lpass_data {
>   	/* regmap backed by the low-power audio interface (LPAIF) registers */
>   	struct regmap *lpaif_map;
>   	struct regmap *hdmiif_map;
> +	struct snd_pcm_chmap *chmap_info;
> +
> +	int chmap_idx;
>   
>   	/* interrupts from the low-power audio interface (LPAIF) */
>   	int lpaif_irq;
> @@ -259,5 +262,7 @@ void asoc_qcom_lpass_cpu_platform_shutdown(struct platform_device *pdev);
>   int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);
>   int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
>   extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
> +int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
> +				struct snd_soc_dai *dai);
>   
>   #endif /* __LPASS_H__ */
> 
