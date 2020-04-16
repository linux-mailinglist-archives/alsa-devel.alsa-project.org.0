Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C11ABAAC
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 09:59:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0856715F9;
	Thu, 16 Apr 2020 09:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0856715F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587023997;
	bh=/ypbYkt/8XKePUgmfilaYNk4pNotpSVuib7FeTAbids=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pKH4aH/yP0Ppo1ukXwYmbU40abuaRN2cb6ja3Dt2neR98SS8VpA/H9sdWD2vDK9ta
	 Rm9xNaZdYQlU5Z4ZdnMyHvblPiVQB28uyFL0jmXzaK1dSx9GyPc8bAyUzj3WtwcbDD
	 HX1EgjPB6VkLnkuxkeqEy1SpZFneU7e8brF2H8sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFDF3F802A2;
	Thu, 16 Apr 2020 09:56:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E1EBF80240; Thu, 16 Apr 2020 09:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FBA1F8012E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 09:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FBA1F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZaSm3efi"
Received: by mail-wr1-x444.google.com with SMTP id d27so3710218wra.1
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 00:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0VpzNN+nEUfeKwRNL2u+lzKJzPxeD20kV5Qtq81EhEA=;
 b=ZaSm3efibTXvYHJ5j5wVG4+FJLqnXv2G+nMoVNz9uZdCLJSth3H36QnskC1b/fYs6z
 PrQv4kk8LppqCpUTR+JbqzqRk+E7scGdQOFsAk3wggMPkQ4Imm2c1yQPltkm4DlDabez
 zXpPDJ3A6qWT0rqO+voJUoKfGR4bP8TITO4WuDV6nzJojILn2s7S5Hcz4YI19CCbNGFE
 9pJfOgKLP7JQunoul9qETYqmd6lDEwg8oV9VTwSGULBuLpXR1pnT3ZGq4EF8WPH/2Xr2
 xZi+ZEB8cVVmdW5mihiATTGR1tZ9l2ZzRL71yCJRlDoaZMJvzv4XbcCnfBuG/d2CMjpW
 XFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0VpzNN+nEUfeKwRNL2u+lzKJzPxeD20kV5Qtq81EhEA=;
 b=NBvpx3yskVUxcVJdm6RhmkrRPACPQKNx1My9PNRfBKLrhA5HRaGe28Hz6Ltiq5lHxa
 mMua26v1qZGjmxfYfv3M3+Q/HRDMkTY8WMTyxQQZdVWwUo9ZwHP4NLtzlg8QL2d9ASm+
 7ReOmtpjYptpy7UbMPYirop1UNXxVhKt2bUQl1+6jxZxhfrf15xf0hcIMKlPRWhV8vcZ
 Ymkjswug/vV1sg2etcLsuiyI9yWJNFxaaWiUgVnZ6Y9jUbKx3WKaMoaFZez40C0m8Xod
 Uek3+IlR/21Umzhs5PWYnptTUwP5qdZOqkUcO3dzFNW2WFDVcaFBWMslrtm5i0gvlKfd
 dLtA==
X-Gm-Message-State: AGi0PubtHwbVzhnSgxTmEgLnJ34ldymVW7y7kcGWoVhQChSiIQm7Kr4i
 BBWrvU5NWJa4iEJ6aUI4V9rkOg==
X-Google-Smtp-Source: APiQypKRi7+L1yYsupMsdCU2RLIx/oH+WetQkFwHRXQyW369xeGr7YGkwU/Ea43uZ4GIdLBz7HV5CQ==
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr34570594wrx.185.1587023792860; 
 Thu, 16 Apr 2020 00:56:32 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id x132sm2674185wmg.33.2020.04.16.00.56.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 00:56:32 -0700 (PDT)
Subject: Re: [PATCH 05/11] ASoC: qcom: lpass: Add support for newer lpass
 version
To: Ajit Pandey <ajitp@codeaurora.org>, alsa-devel@alsa-project.org,
 broonie@kernel.org, devicetree@vger.kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org
References: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
 <1586592171-31644-6-git-send-email-ajitp@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1af5face-507a-5866-d5ae-24ab050dad81@linaro.org>
Date: Thu, 16 Apr 2020 08:56:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1586592171-31644-6-git-send-email-ajitp@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, tiwai@suse.com
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



On 11/04/2020 09:02, Ajit Pandey wrote:
> Few control registers bit offset of lpaif in newer lpass variants
> are changed. Added "id" field in variant struct and changes macros
> configuration of registers to calculate bit mask & offset based on
> variant id.
> 

These fields are handled much nicely with regmap_field, you should 
consider using that. If not we will add overhead of check for every mask.


> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-cpu.c       |  77 +++++++++--------
>   sound/soc/qcom/lpass-lpaif-reg.h | 182 ++++++++++++++++++++++++++++++++++++++-
>   sound/soc/qcom/lpass-platform.c  |  31 +++----
>   sound/soc/qcom/lpass.h           |   6 ++
>   4 files changed, 241 insertions(+), 55 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index f177932..006ba5a 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -77,6 +77,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>   	struct lpass_dai *dai_data = drvdata->dai_priv[dai->driver->id];
> +	struct lpass_variant *v = drvdata->variant;
>   	snd_pcm_format_t format = params_format(params);
>   	unsigned int channels = params_channels(params);
>   	unsigned int rate = params_rate(params);
> @@ -89,18 +90,18 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   		return bitwidth;
>   	}
>   
> -	regval = LPAIF_I2SCTL_LOOPBACK_DISABLE |
> -			LPAIF_I2SCTL_WSSRC_INTERNAL;
> +	regval = LPAIF_I2SCTL(v, LOOPBACK_DISABLE);
> +	regval |= LPAIF_I2SCTL(v, WSSRC_INTERNAL);
>   
>   	switch (bitwidth) {
>   	case 16:
> -		regval |= LPAIF_I2SCTL_BITWIDTH_16;
> +		regval |= LPAIF_I2SCTL(v, BITWIDTH_16);
>   		break;
>   	case 24:
> -		regval |= LPAIF_I2SCTL_BITWIDTH_24;
> +		regval |= LPAIF_I2SCTL(v, BITWIDTH_24);
>   		break;
>   	case 32:
> -		regval |= LPAIF_I2SCTL_BITWIDTH_32;
> +		regval |= LPAIF_I2SCTL(v, BITWIDTH_32);
>   		break;
>   	default:
>   		dev_err(dai->dev, "invalid bitwidth given: %d\n", bitwidth);
> @@ -110,24 +111,24 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>   		switch (channels) {
>   		case 1:
> -			regval |= LPAIF_I2SCTL_SPKMODE_SD0;
> -			regval |= LPAIF_I2SCTL_SPKMONO_MONO;
> +			regval |= LPAIF_I2SCTL(v, SPKMODE_SD0);
> +			regval |= LPAIF_I2SCTL(v, SPKMONO_MONO);
>   			break;
>   		case 2:
> -			regval |= LPAIF_I2SCTL_SPKMODE_SD0;
> -			regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
> +			regval |= LPAIF_I2SCTL(v, SPKMODE_SD0);
> +			regval |= LPAIF_I2SCTL(v, SPKMONO_STEREO);
>   			break;
>   		case 4:
> -			regval |= LPAIF_I2SCTL_SPKMODE_QUAD01;
> -			regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
> +			regval |= LPAIF_I2SCTL(v, SPKMODE_QUAD01);
> +			regval |= LPAIF_I2SCTL(v, SPKMONO_STEREO);
>   			break;
>   		case 6:
> -			regval |= LPAIF_I2SCTL_SPKMODE_6CH;
> -			regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
> +			regval |= LPAIF_I2SCTL(v, SPKMODE_6CH);
> +			regval |= LPAIF_I2SCTL(v, SPKMONO_STEREO);
>   			break;
>   		case 8:
> -			regval |= LPAIF_I2SCTL_SPKMODE_8CH;
> -			regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
> +			regval |= LPAIF_I2SCTL(v, SPKMODE_8CH);
> +			regval |= LPAIF_I2SCTL(v, SPKMONO_STEREO);
>   			break;
>   		default:
>   			dev_err(dai->dev, "invalid channels given: %u\n",
> @@ -137,24 +138,24 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   	} else {
>   		switch (channels) {
>   		case 1:
> -			regval |= LPAIF_I2SCTL_MICMODE_SD0;
> -			regval |= LPAIF_I2SCTL_MICMONO_MONO;
> +			regval |= LPAIF_I2SCTL(v, MICMODE_SD0);
> +			regval |= LPAIF_I2SCTL(v, MICMONO_MONO);
>   			break;
>   		case 2:
> -			regval |= LPAIF_I2SCTL_MICMODE_SD0;
> -			regval |= LPAIF_I2SCTL_MICMONO_STEREO;
> +			regval |= LPAIF_I2SCTL(v, MICMODE_SD0);
> +			regval |= LPAIF_I2SCTL(v, MICMONO_STEREO);
>   			break;
>   		case 4:
> -			regval |= LPAIF_I2SCTL_MICMODE_QUAD01;
> -			regval |= LPAIF_I2SCTL_MICMONO_STEREO;
> +			regval |= LPAIF_I2SCTL(v, MICMODE_QUAD01);
> +			regval |= LPAIF_I2SCTL(v, MICMONO_STEREO);
>   			break;
>   		case 6:
> -			regval |= LPAIF_I2SCTL_MICMODE_6CH;
> -			regval |= LPAIF_I2SCTL_MICMONO_STEREO;
> +			regval |= LPAIF_I2SCTL(v, MICMODE_6CH);
> +			regval |= LPAIF_I2SCTL(v, MICMONO_STEREO);
>   			break;
>   		case 8:
> -			regval |= LPAIF_I2SCTL_MICMODE_8CH;
> -			regval |= LPAIF_I2SCTL_MICMONO_STEREO;
> +			regval |= LPAIF_I2SCTL(v, MICMODE_8CH);
> +			regval |= LPAIF_I2SCTL(v, MICMONO_STEREO);
>   			break;
>   		default:
>   			dev_err(dai->dev, "invalid channels given: %u\n",
> @@ -200,15 +201,16 @@ static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
>   		struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct lpass_variant *v = drvdata->variant;
>   	int ret;
>   	unsigned int val, mask;
>   
>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		val = LPAIF_I2SCTL_SPKEN_ENABLE;
> -		mask = LPAIF_I2SCTL_SPKEN_MASK;
> +		val = LPAIF_I2SCTL(v, SPKEN_ENABLE);
> +		mask = LPAIF_I2SCTL(v, SPKEN_MASK);
>   	} else  {
> -		val = LPAIF_I2SCTL_MICEN_ENABLE;
> -		mask = LPAIF_I2SCTL_MICEN_MASK;
> +		val = LPAIF_I2SCTL(v, MICEN_ENABLE);
> +		mask = LPAIF_I2SCTL(v, MICEN_MASK);
>   	}
>   
>   	ret = regmap_update_bits(drvdata->lpaif_map,
> @@ -224,6 +226,7 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   		int cmd, struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct lpass_variant *v = drvdata->variant;
>   	int ret = -EINVAL;
>   	unsigned int val, mask;
>   
> @@ -232,11 +235,11 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   	case SNDRV_PCM_TRIGGER_RESUME:
>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>   		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -			val = LPAIF_I2SCTL_SPKEN_ENABLE;
> -			mask = LPAIF_I2SCTL_SPKEN_MASK;
> +			val = LPAIF_I2SCTL(v, SPKEN_ENABLE);
> +			mask = LPAIF_I2SCTL(v, SPKEN_MASK);
>   		} else  {
> -			val = LPAIF_I2SCTL_MICEN_ENABLE;
> -			mask = LPAIF_I2SCTL_MICEN_MASK;
> +			val = LPAIF_I2SCTL(v, MICEN_ENABLE);
> +			mask = LPAIF_I2SCTL(v, MICEN_MASK);
>   		}
>   
>   		ret = regmap_update_bits(drvdata->lpaif_map,
> @@ -251,11 +254,11 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   	case SNDRV_PCM_TRIGGER_SUSPEND:
>   	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>   		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -			val = LPAIF_I2SCTL_SPKEN_DISABLE;
> -			mask = LPAIF_I2SCTL_SPKEN_MASK;
> +			val = LPAIF_I2SCTL(v, SPKEN_DISABLE);
> +			mask = LPAIF_I2SCTL(v, SPKEN_MASK);
>   		} else  {
> -			val = LPAIF_I2SCTL_MICEN_DISABLE;
> -			mask = LPAIF_I2SCTL_MICEN_MASK;
> +			val = LPAIF_I2SCTL(v, MICEN_DISABLE);
> +			mask = LPAIF_I2SCTL(v, MICEN_MASK);
>   		}
>   
>   		ret = regmap_update_bits(drvdata->lpaif_map,
> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
> index 3d74ae1..4251aa6 100644
> --- a/sound/soc/qcom/lpass-lpaif-reg.h
> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
> @@ -17,11 +17,28 @@
>   #define LPAIF_I2SCTL_LOOPBACK_DISABLE	(0 << LPAIF_I2SCTL_LOOPBACK_SHIFT)
>   #define LPAIF_I2SCTL_LOOPBACK_ENABLE	(1 << LPAIF_I2SCTL_LOOPBACK_SHIFT)
>   
> +#define LPAIF_I2SCTL_LOOPBACK_MASK_V2	 0x20000
> +#define LPAIF_I2SCTL_LOOPBACK_SHIFT_V2	 17
> +#define LPAIF_I2SCTL_LOOPBACK_DISABLE_V2 (0 << LPAIF_I2SCTL_LOOPBACK_SHIFT_V2)
> +#define LPAIF_I2SCTL_LOOPBACK_ENABLE_V2	 (1 << LPAIF_I2SCTL_LOOPBACK_SHIFT_V2)
> +
>   #define LPAIF_I2SCTL_SPKEN_MASK		0x4000
>   #define LPAIF_I2SCTL_SPKEN_SHIFT	14
>   #define LPAIF_I2SCTL_SPKEN_DISABLE	(0 << LPAIF_I2SCTL_SPKEN_SHIFT)
>   #define LPAIF_I2SCTL_SPKEN_ENABLE	(1 << LPAIF_I2SCTL_SPKEN_SHIFT)
>   
> +#define LPAIF_I2SCTL_SPKEN_MASK_V2	0x10000
> +#define LPAIF_I2SCTL_SPKEN_SHIFT_V2	16
> +#define LPAIF_I2SCTL_SPKEN_DISABLE_V2	(0 << LPAIF_I2SCTL_SPKEN_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKEN_ENABLE_V2	(1 << LPAIF_I2SCTL_SPKEN_SHIFT_V2)
> +
> +#define __LPAIF_I2S_CTL(v, bit)  \
> +	((v->id ==  LPASS_VARIANT_V2) ? \
> +		LPAIF_I2SCTL_##bit##_V2 : \
> +		LPAIF_I2SCTL_##bit)
> +
> +#define LPAIF_I2SCTL(v, bit)		__LPAIF_I2S_CTL(v, bit)
> +
>   #define LPAIF_I2SCTL_SPKMODE_MASK	0x3C00
>   #define LPAIF_I2SCTL_SPKMODE_SHIFT	10
>   #define LPAIF_I2SCTL_SPKMODE_NONE	(0 << LPAIF_I2SCTL_SPKMODE_SHIFT)
> @@ -34,16 +51,49 @@
>   #define LPAIF_I2SCTL_SPKMODE_6CH	(7 << LPAIF_I2SCTL_SPKMODE_SHIFT)
>   #define LPAIF_I2SCTL_SPKMODE_8CH	(8 << LPAIF_I2SCTL_SPKMODE_SHIFT)
>   
> +#define LPAIF_I2SCTL_SPKMODE_MASK_V2	0xF800
> +#define LPAIF_I2SCTL_SPKMODE_SHIFT_V2	11
> +#define LPAIF_I2SCTL_SPKMODE_NONE_V2	(0 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_SD0_V2	(1 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_SD1_V2	(2 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_SD2_V2	(3 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_SD3_V2	(4 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_QUAD01_V2	(5 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_QUAD23_V2	(6 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_6CH_V2	(7 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_8CH_V2	(8 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_10CH_V2	(9 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_12CH_V2	(10 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_14CH_V2	(11 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_16CH_V2	(12 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_SD4_V2	(13 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_SD5_V2	(14 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_SD6_V2	(15 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_SD7_V2	(16 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_QUAD45_V2	(17 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_QUAD47_V2	(18 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMODE_8CH_2_V2	(19 << LPAIF_I2SCTL_SPKMODE_SHIFT_V2)
> +
>   #define LPAIF_I2SCTL_SPKMONO_MASK	0x0200
>   #define LPAIF_I2SCTL_SPKMONO_SHIFT	9
>   #define LPAIF_I2SCTL_SPKMONO_STEREO	(0 << LPAIF_I2SCTL_SPKMONO_SHIFT)
>   #define LPAIF_I2SCTL_SPKMONO_MONO	(1 << LPAIF_I2SCTL_SPKMONO_SHIFT)
>   
> +#define LPAIF_I2SCTL_SPKMONO_MASK_V2	0x0400
> +#define LPAIF_I2SCTL_SPKMONO_SHIFT_V2	10
> +#define LPAIF_I2SCTL_SPKMONO_STEREO_V2	(0 << LPAIF_I2SCTL_SPKMONO_SHIFT_V2)
> +#define LPAIF_I2SCTL_SPKMONO_MONO_V2	(1 << LPAIF_I2SCTL_SPKMONO_SHIFT_V2)
> +
>   #define LPAIF_I2SCTL_MICEN_MASK		GENMASK(8, 8)
>   #define LPAIF_I2SCTL_MICEN_SHIFT	8
>   #define LPAIF_I2SCTL_MICEN_DISABLE	(0 << LPAIF_I2SCTL_MICEN_SHIFT)
>   #define LPAIF_I2SCTL_MICEN_ENABLE	(1 << LPAIF_I2SCTL_MICEN_SHIFT)
>   
> +#define LPAIF_I2SCTL_MICEN_MASK_V2	0x0200
> +#define LPAIF_I2SCTL_MICEN_SHIFT_V2	9
> +#define LPAIF_I2SCTL_MICEN_DISABLE_V2	(0 << LPAIF_I2SCTL_MICEN_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICEN_ENABLE_V2	(1 << LPAIF_I2SCTL_MICEN_SHIFT_V2)
> +
>   #define LPAIF_I2SCTL_MICMODE_MASK	GENMASK(7, 4)
>   #define LPAIF_I2SCTL_MICMODE_SHIFT	4
>   #define LPAIF_I2SCTL_MICMODE_NONE	(0 << LPAIF_I2SCTL_MICMODE_SHIFT)
> @@ -56,22 +106,61 @@
>   #define LPAIF_I2SCTL_MICMODE_6CH	(7 << LPAIF_I2SCTL_MICMODE_SHIFT)
>   #define LPAIF_I2SCTL_MICMODE_8CH	(8 << LPAIF_I2SCTL_MICMODE_SHIFT)
>   
> +#define LPAIF_I2SCTL_MICMODE_MASK_V2	GENMASK(8, 4)
> +#define LPAIF_I2SCTL_MICMODE_SHIFT_V2	4
> +#define LPAIF_I2SCTL_MICMODE_NONE_V2	(0 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_SD0_V2	(1 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_SD1_V2	(2 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_SD2_V2	(3 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_SD3_V2	(4 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_QUAD01_V2	(5 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_QUAD23_V2	(6 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_6CH_V2	(7 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_8CH_V2	(8 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_10CH_V2	(9 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_12CH_V2	(10 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_14CH_V2	(11 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_16CH_V2	(12 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_SD4_V2	(13 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_SD5_V2	(14 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_SD6_V2	(15 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_SD7_V2	(16 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_QUAD45_V2	(17 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_QUAD47_V2	(18 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMODE_8CH_2_V2	(19 << LPAIF_I2SCTL_MICMODE_SHIFT_V2)
> +
>   #define LPAIF_I2SCTL_MIMONO_MASK	GENMASK(3, 3)
>   #define LPAIF_I2SCTL_MICMONO_SHIFT	3
>   #define LPAIF_I2SCTL_MICMONO_STEREO	(0 << LPAIF_I2SCTL_MICMONO_SHIFT)
>   #define LPAIF_I2SCTL_MICMONO_MONO	(1 << LPAIF_I2SCTL_MICMONO_SHIFT)
>   
> +#define LPAIF_I2SCTL_MICMONO_MASK_V2	GENMASK(3, 3)
> +#define LPAIF_I2SCTL_MICMONO_SHIFT_V2	3
> +#define LPAIF_I2SCTL_MICMONO_STEREO_V2	(0 << LPAIF_I2SCTL_MICMONO_SHIFT_V2)
> +#define LPAIF_I2SCTL_MICMONO_MONO_V2	(1 << LPAIF_I2SCTL_MICMONO_SHIFT_V2)
> +
>   #define LPAIF_I2SCTL_WSSRC_MASK		0x0004
>   #define LPAIF_I2SCTL_WSSRC_SHIFT	2
>   #define LPAIF_I2SCTL_WSSRC_INTERNAL	(0 << LPAIF_I2SCTL_WSSRC_SHIFT)
>   #define LPAIF_I2SCTL_WSSRC_EXTERNAL	(1 << LPAIF_I2SCTL_WSSRC_SHIFT)
>   
> +#define LPAIF_I2SCTL_WSSRC_MASK_V2	0x0004
> +#define LPAIF_I2SCTL_WSSRC_SHIFT_V2	2
> +#define LPAIF_I2SCTL_WSSRC_INTERNAL_V2	(0 << LPAIF_I2SCTL_WSSRC_SHIFT_V2)
> +#define LPAIF_I2SCTL_WSSRC_EXTERNAL_V2	(1 << LPAIF_I2SCTL_WSSRC_SHIFT_V2)
> +
>   #define LPAIF_I2SCTL_BITWIDTH_MASK	0x0003
>   #define LPAIF_I2SCTL_BITWIDTH_SHIFT	0
>   #define LPAIF_I2SCTL_BITWIDTH_16	(0 << LPAIF_I2SCTL_BITWIDTH_SHIFT)
>   #define LPAIF_I2SCTL_BITWIDTH_24	(1 << LPAIF_I2SCTL_BITWIDTH_SHIFT)
>   #define LPAIF_I2SCTL_BITWIDTH_32	(2 << LPAIF_I2SCTL_BITWIDTH_SHIFT)
>   
> +#define LPAIF_I2SCTL_BITWIDTH_MASK_V2	0x0003
> +#define LPAIF_I2SCTL_BITWIDTH_SHIFT_V2	0
> +#define LPAIF_I2SCTL_BITWIDTH_16_V2	(0 << LPAIF_I2SCTL_BITWIDTH_SHIFT_V2)
> +#define LPAIF_I2SCTL_BITWIDTH_24_V2	(1 << LPAIF_I2SCTL_BITWIDTH_SHIFT_V2)
> +#define LPAIF_I2SCTL_BITWIDTH_32_V2	(2 << LPAIF_I2SCTL_BITWIDTH_SHIFT_V2)
> +
>   /* LPAIF IRQ */
>   #define LPAIF_IRQ_REG_ADDR(v, addr, port) \
>   	(v->irq_reg_base + (addr) + v->irq_reg_stride * (port))
> @@ -91,7 +180,6 @@
>   #define LPAIF_IRQ_ALL(chan)		(7 << (LPAIF_IRQ_BITSTRIDE * (chan)))
>   
>   /* LPAIF DMA */
> -
>   #define LPAIF_RDMA_REG_ADDR(v, addr, chan) \
>   	(v->rdma_reg_base + (addr) + v->rdma_reg_stride * (chan))
>   
> @@ -143,7 +231,7 @@
>   
>   #define LPAIF_DMACTL_AUDINTF_MASK	0x0F0
>   #define LPAIF_DMACTL_AUDINTF_SHIFT	4
> -#define LPAIF_DMACTL_AUDINTF(id)	(id << LPAIF_DMACTL_AUDINTF_SHIFT)
> +#define LPAIF_DMACTL_AUDINTF(port)	(port << LPAIF_DMACTL_AUDINTF_SHIFT)
>   
>   #define LPAIF_DMACTL_FIFOWM_MASK	0x00E
>   #define LPAIF_DMACTL_FIFOWM_SHIFT	1
> @@ -158,11 +246,99 @@
>   
>   #define LPAIF_DMACTL_ENABLE_MASK	0x1
>   #define LPAIF_DMACTL_ENABLE_SHIFT	0
> -#define LPAIF_DMACTL_ENABLE_OFF	(0 << LPAIF_DMACTL_ENABLE_SHIFT)
> +#define LPAIF_DMACTL_ENABLE_OFF		(0 << LPAIF_DMACTL_ENABLE_SHIFT)
>   #define LPAIF_DMACTL_ENABLE_ON		(1 << LPAIF_DMACTL_ENABLE_SHIFT)
>   
> +#define LPAIF_IRQ_BITSTRIDE		3
> +
> +#define LPAIF_IRQ_PER(chan)		(1 << (LPAIF_IRQ_BITSTRIDE * (chan)))
> +#define LPAIF_IRQ_XRUN(chan)		(2 << (LPAIF_IRQ_BITSTRIDE * (chan)))
> +#define LPAIF_IRQ_ERR(chan)		(4 << (LPAIF_IRQ_BITSTRIDE * (chan)))
> +
> +#define LPAIF_IRQ_ALL(chan)		(7 << (LPAIF_IRQ_BITSTRIDE * (chan)))
> +
>   #define LPAIF_DMACTL_DYNCLK_MASK	BIT(12)
>   #define LPAIF_DMACTL_DYNCLK_SHIFT	12
>   #define LPAIF_DMACTL_DYNCLK_OFF	(0 << LPAIF_DMACTL_DYNCLK_SHIFT)
>   #define LPAIF_DMACTL_DYNCLK_ON		(1 << LPAIF_DMACTL_DYNCLK_SHIFT)
> +
> +#define LPAIF_DMACTL_BURSTEN_MASK_V2	0x100000
> +#define LPAIF_DMACTL_BURSTEN_SHIFT_V2	20
> +#define LPAIF_DMACTL_BURSTEN_SINGLE_V2	(0 << LPAIF_DMACTL_BURSTEN_SHIFT_V2)
> +#define LPAIF_DMACTL_BURSTEN_INCR4_V2	(1 << LPAIF_DMACTL_BURSTEN_SHIFT_V2)
> +
> +#define LPAIF_DMACTL_WPSCNT_MASK_V2	0xF0000
> +#define LPAIF_DMACTL_WPSCNT_SHIFT_V2	16
> +#define LPAIF_DMACTL_WPSCNT_ONE_V2	(0 << LPAIF_DMACTL_WPSCNT_SHIFT_V2)
> +#define LPAIF_DMACTL_WPSCNT_TWO_V2	(1 << LPAIF_DMACTL_WPSCNT_SHIFT_V2)
> +#define LPAIF_DMACTL_WPSCNT_THREE_V2	(2 << LPAIF_DMACTL_WPSCNT_SHIFT_V2)
> +#define LPAIF_DMACTL_WPSCNT_FOUR_V2	(3 << LPAIF_DMACTL_WPSCNT_SHIFT_V2)
> +#define LPAIF_DMACTL_WPSCNT_SIX_V2	(5 << LPAIF_DMACTL_WPSCNT_SHIFT_V2)
> +#define LPAIF_DMACTL_WPSCNT_EIGHT_V2	(7 << LPAIF_DMACTL_WPSCNT_SHIFT_V2)
> +#define LPAIF_DMACTL_WPSCNT_TEN_V2	(9 << LPAIF_DMACTL_WPSCNT_SHIFT_V2)
> +#define LPAIF_DMACTL_WPSCNT_TWELVE_V2	(11 << LPAIF_DMACTL_WPSCNT_SHIFT_V2)
> +#define LPAIF_DMACTL_WPSCNT_FOURTEEN_V2	(13 << LPAIF_DMACTL_WPSCNT_SHIFT_V2)
> +#define LPAIF_DMACTL_WPSCNT_SIXTEEN_V2	(15 << LPAIF_DMACTL_WPSCNT_SHIFT_V2)
> +
> +#define LPAIF_DMACTL_AUDINTF_MASK_V2	0xF000
> +#define LPAIF_DMACTL_AUDINTF_SHIFT_V2	12
> +#define LPAIF_DMACTL_AUDINTF_V2(port)	(port << LPAIF_DMACTL_AUDINTF_SHIFT_V2)
> +
> +#define LPAIF_DMACTL_AUD_INTF(v, port)  \
> +	((v->id ==  LPASS_VARIANT_V2) ? \
> +		LPAIF_DMACTL_AUDINTF_V2(port) : \
> +		LPAIF_DMACTL_AUDINTF(port))
> +
> +#define LPAIF_DMACTL_FIFOWM_MASK_V2	0x3E
> +#define LPAIF_DMACTL_FIFOWM_SHIFT_V2	1
> +#define LPAIF_DMACTL_FIFOWM_1_V2	(0 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_2_V2	(1 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_3_V2	(2 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_4_V2	(3 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_5_V2	(4 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_6_V2	(5 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_7_V2	(6 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_8_V2	(7 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_9_V2	(8 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_10_V2	(9 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_11_V2	(10 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_12_V2	(11 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_13_V2	(12 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_14_V2	(13 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_15_V2	(14 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_16_V2	(15 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_17_V2	(16 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_18_V2	(17 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_19_V2	(18 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_20_V2	(19 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_21_V2	(20 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_22_V2	(21 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_23_V2	(22 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_24_V2	(23 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_25_V2	(24 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_26_V2	(25 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_27_V2	(26 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_28_V2	(27 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_29_V2	(28 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_30_V2	(29 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_31_V2	(30 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +#define LPAIF_DMACTL_FIFOWM_32_V2	(31 << LPAIF_DMACTL_FIFOWM_SHIFT_V2)
> +
> +#define LPAIF_DMACTL_ENABLE_MASK_V2	0x1
> +#define LPAIF_DMACTL_ENABLE_SHIFT_V2	0
> +#define LPAIF_DMACTL_ENABLE_OFF_V2	(0 << LPAIF_DMACTL_ENABLE_SHIFT_V2)
> +#define LPAIF_DMACTL_ENABLE_ON_V2	(1 << LPAIF_DMACTL_ENABLE_SHIFT_V2)
> +
> +#define LPAIF_DMACTL_DYNCLK_MASK_V2	BIT(21)
> +#define LPAIF_DMACTL_DYNCLK_SHIFT_V2	21
> +#define LPAIF_DMACTL_DYNCLK_OFF_V2	(0 << LPAIF_DMACTL_DYNCLK_SHIFT_V2)
> +#define LPAIF_DMACTL_DYNCLK_ON_V2	(1 << LPAIF_DMACTL_DYNCLK_SHIFT_V2)
> +
> +#define __LPAIF_DMA_CTL(v, bit)  \
> +	((v->id ==  LPASS_VARIANT_V2) ? \
> +		LPAIF_DMACTL_##bit##_V2 : \
> +		LPAIF_DMACTL_##bit)
> +
> +#define LPAIF_DMACTL(v, bit)		__LPAIF_DMA_CTL(v, bit)
> +
>   #endif /* __LPASS_LPAIF_REG_H__ */
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index b05091c2..821599e 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -146,25 +146,26 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>   		return bitwidth;
>   	}
>   
> -	regval = LPAIF_DMACTL_BURSTEN_INCR4 |
> -			LPAIF_DMACTL_AUDINTF(dma_port) |
> -			LPAIF_DMACTL_FIFOWM_8;
> +
> +	regval = LPAIF_DMACTL(v, BURSTEN_INCR4);
> +	regval |= LPAIF_DMACTL(v, FIFOWM_8);
> +	regval |= LPAIF_DMACTL_AUD_INTF(v, dma_port);
>   
>   	switch (bitwidth) {
>   	case 16:
>   		switch (channels) {
>   		case 1:
>   		case 2:
> -			regval |= LPAIF_DMACTL_WPSCNT_ONE;
> +			regval |= LPAIF_DMACTL(v, WPSCNT_ONE);
>   			break;
>   		case 4:
> -			regval |= LPAIF_DMACTL_WPSCNT_TWO;
> +			regval |= LPAIF_DMACTL(v, WPSCNT_TWO);
>   			break;
>   		case 6:
> -			regval |= LPAIF_DMACTL_WPSCNT_THREE;
> +			regval |= LPAIF_DMACTL(v, WPSCNT_THREE);
>   			break;
>   		case 8:
> -			regval |= LPAIF_DMACTL_WPSCNT_FOUR;
> +			regval |= LPAIF_DMACTL(v, WPSCNT_FOUR);
>   			break;
>   		default:
>   			dev_err(soc_runtime->dev,
> @@ -177,19 +178,19 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>   	case 32:
>   		switch (channels) {
>   		case 1:
> -			regval |= LPAIF_DMACTL_WPSCNT_ONE;
> +			regval |= LPAIF_DMACTL(v, WPSCNT_ONE);
>   			break;
>   		case 2:
> -			regval |= LPAIF_DMACTL_WPSCNT_TWO;
> +			regval |= LPAIF_DMACTL(v, WPSCNT_TWO);
>   			break;
>   		case 4:
> -			regval |= LPAIF_DMACTL_WPSCNT_FOUR;
> +			regval |= LPAIF_DMACTL(v, WPSCNT_FOUR);
>   			break;
>   		case 6:
> -			regval |= LPAIF_DMACTL_WPSCNT_SIX;
> +			regval |= LPAIF_DMACTL(v, WPSCNT_SIX);
>   			break;
>   		case 8:
> -			regval |= LPAIF_DMACTL_WPSCNT_EIGHT;
> +			regval |= LPAIF_DMACTL(v, WPSCNT_EIGHT);
>   			break;
>   		default:
>   			dev_err(soc_runtime->dev,
> @@ -277,7 +278,7 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
>   
>   	ret = regmap_update_bits(drvdata->lpaif_map,
>   			LPAIF_DMACTL_REG(v, ch, dir),
> -			LPAIF_DMACTL_ENABLE_MASK, LPAIF_DMACTL_ENABLE_ON);
> +			LPAIF_DMACTL(v, ENABLE_MASK), LPAIF_DMACTL_ENABLE_ON);
>   	if (ret) {
>   		dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n",
>   			ret);
> @@ -326,7 +327,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   
>   		ret = regmap_update_bits(drvdata->lpaif_map,
>   				LPAIF_DMACTL_REG(v, ch, dir),
> -				LPAIF_DMACTL_ENABLE_MASK,
> +				LPAIF_DMACTL(v, ENABLE_MASK),
>   				LPAIF_DMACTL_ENABLE_ON);
>   		if (ret) {
>   			dev_err(soc_runtime->dev,
> @@ -339,7 +340,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>   		ret = regmap_update_bits(drvdata->lpaif_map,
>   				LPAIF_DMACTL_REG(v, ch, dir),
> -				LPAIF_DMACTL_ENABLE_MASK,
> +				LPAIF_DMACTL(v, ENABLE_MASK),
>   				LPAIF_DMACTL_ENABLE_OFF);
>   		if (ret) {
>   			dev_err(soc_runtime->dev,
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 279cd02..384f4b8 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -17,6 +17,9 @@
>   #define LPASS_MAX_MI2S_PORTS                   (8)
>   #define LPASS_MAX_DMA_CHANNELS                 (8)
>   
> +#define LPASS_VARIANT				0
> +#define LPASS_VARIANT_V2			1
> +
>   struct lpass_dai {
>   	struct clk *osr_clk;
>   	struct clk *bit_clk;
> @@ -91,6 +94,9 @@ struct lpass_variant {
>   	/* SOC specific clocks configuration */
>   	const char **clk_name;
>   	int num_clks;
> +
> +	/* LPASS Version id */
> +	int id;

May be spelling this out like "version_id" would make it more readable.

thanks,
srini


>   };
>   
>   /* register the platform driver from the CPU DAI driver */
> 
