Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E8A1ABAD0
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 10:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E878E1665;
	Thu, 16 Apr 2020 10:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E878E1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587024468;
	bh=VxSllAJH/zVv/mARLGCkb021wqovSASU9gMj8cwSFZQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=houu9eS59CPDu/TGMmYKcFkueUgFK0d5vD3YY8d5okYUSXGI0Y+ICyR2dhyoKMmdT
	 MAOeTjquWV9lFagi4KtYxses4Qkx9D+hrMOjs9LMBUFqpu7QJWFoMu55RTCkj0jb3C
	 lSnXl2mZVGo+lI8MRI+DUK3pBY0jr05+qe0fxsu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA2F8F8016F;
	Thu, 16 Apr 2020 10:06:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 292E7F8014E; Thu, 16 Apr 2020 10:06:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AD35F8012E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 10:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AD35F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ljCN0Eh8"
Received: by mail-wm1-x344.google.com with SMTP id x4so3561815wmj.1
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 01:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uV16bW5Qou5HX/ecLg8k6CUH6HA5iJ8FFoob8YYamBs=;
 b=ljCN0Eh8i0yJ4+SXVeS8uWjAW7ZFvAZJwKpZ6fLDVwjGW0e0Ehfcf1AEfaWthyab7o
 2FDZt6F/h9cJMPeHORes/2aQElMBh/q6ri1YKBxOuaZcX+Gj9Q/8WHIqWYXdYS1qLTQx
 bfFGjpPm98kDJjPq3KAYPa56+q4LakqovsK8WZzKFPdTr/L94OjT9/7rH1OAW6E9gR+W
 JFQiEv+r7VIOHA2qEJiL73R6mhtpsawbtsAlYHk/f3uSifyTm3cGDY6Vf6ciRpGEH3pz
 JT3yNCMwEOkIjG61/Qk/vBqLyhd29BBp0TC+MT7XEcbpLelji96T5FAdiQUEMvigVGEZ
 B4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uV16bW5Qou5HX/ecLg8k6CUH6HA5iJ8FFoob8YYamBs=;
 b=hDCHnO1CPNNyIrQC61S+rglJ5KDdLklfhfoNUXs2sPs4gkbwqV+nnwKHMe+BT4q/H7
 5woaigEmXnBVX5CfsXoGI/LFS3djIUzOWKd2XuCIcIYYsuu6an0qxpwv07fPqWMYgYnd
 CvVxyytL4r5zu1FwJu1/oysgmWR5WziiSzz/OuClcn+fyJYaIBwiI2xaQarn5uD5xqyK
 illIaKq1upjcRWAJEVpiYh6sfNMl5myYOq5/+pboWU+Rs4nLfabokf+wN1eIG2xnokUZ
 n4ynLRxfCBEPK5D487i7BrxbyRxU9F6yLFP4mJXrfu8xF2WeHPFsAELMi0jR+OzDMq/w
 4ieQ==
X-Gm-Message-State: AGi0PubCvMesMY3y7vLgfSvVGi8smTjXfonnagx9Ul64245JZl4MU/0z
 jEzGIwTeGeZzbktqU1PUFJ7KtA==
X-Google-Smtp-Source: APiQypIRGcjIwp1s+fOs+F0CzIqeFfO2L62PN8lr+ClPBiAGKeNKI2rZAgQCnriNtLAp60EQECv19Q==
X-Received: by 2002:a05:600c:22d1:: with SMTP id
 17mr3296204wmg.167.1587024356884; 
 Thu, 16 Apr 2020 01:05:56 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id t67sm2687859wmg.40.2020.04.16.01.05.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 01:05:56 -0700 (PDT)
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: support full duplex operation
To: broonie@kernel.org
References: <20200306130147.27452-1-srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <841cb73b-82d3-9fb9-0ed3-547882872085@linaro.org>
Date: Thu, 16 Apr 2020 09:05:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200306130147.27452-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takahide Higuchi <takahidehiguchi@gmail.com>,
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

Hi Mark,


On 06/03/2020 13:01, Srinivas Kandagatla wrote:
> From: Takahide Higuchi <takahidehiguchi@gmail.com>
> 
> This patch fixes a bug where playback on bidirectional I2S interface stops
> when we start recording on the same interface.
> 
> We use regmap_update_bits instead of regmap_write so that we will not clear
> SPKEN and SPKMODE bits when we start/stop recording.
> 
> Signed-off-by: Takahide Higuchi <takahidehiguchi@gmail.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Looks like this patch was missed in last cycle, Should I resend this one 
or are you okay to apply this. This patch is required to get full duplex 
on msm8916 based platforms.


thanks,
srini

> ---
>   sound/soc/qcom/lpass-apq8016.c   |  2 ++
>   sound/soc/qcom/lpass-cpu.c       | 24 ++++++++++++++++++------
>   sound/soc/qcom/lpass-lpaif-reg.h |  2 +-
>   3 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 6575da549237..85079c697faa 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -121,6 +121,8 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
>   		},
>   		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
>   		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
> +		.symmetric_samplebits   = 1,
> +		.symmetric_rates        = 1,
>   	},
>   };
>   
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index dbce7e92baf3..dc8acb380b6f 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -72,6 +72,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   	snd_pcm_format_t format = params_format(params);
>   	unsigned int channels = params_channels(params);
>   	unsigned int rate = params_rate(params);
> +	unsigned int mask;
>   	unsigned int regval;
>   	int bitwidth, ret;
>   
> @@ -81,6 +82,9 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   		return bitwidth;
>   	}
>   
> +	mask   = LPAIF_I2SCTL_LOOPBACK_MASK |
> +			LPAIF_I2SCTL_WSSRC_MASK |
> +			LPAIF_I2SCTL_BITWIDTH_MASK;
>   	regval = LPAIF_I2SCTL_LOOPBACK_DISABLE |
>   			LPAIF_I2SCTL_WSSRC_INTERNAL;
>   
> @@ -100,6 +104,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   	}
>   
>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		mask   |= LPAIF_I2SCTL_SPKMODE_MASK | LPAIF_I2SCTL_SPKMONO_MASK;
>   		switch (channels) {
>   		case 1:
>   			regval |= LPAIF_I2SCTL_SPKMODE_SD0;
> @@ -127,6 +132,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   			return -EINVAL;
>   		}
>   	} else {
> +		mask   |= LPAIF_I2SCTL_MICMODE_MASK | LPAIF_I2SCTL_MICMONO_MASK;
>   		switch (channels) {
>   		case 1:
>   			regval |= LPAIF_I2SCTL_MICMODE_SD0;
> @@ -155,9 +161,9 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   		}
>   	}
>   
> -	ret = regmap_write(drvdata->lpaif_map,
> -			   LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
> -			   regval);
> +	ret = regmap_update_bits(drvdata->lpaif_map,
> +			 LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
> +			 mask, regval);
>   	if (ret) {
>   		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
>   		return ret;
> @@ -178,11 +184,17 @@ static int lpass_cpu_daiops_hw_free(struct snd_pcm_substream *substream,
>   		struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	unsigned int mask;
>   	int ret;
>   
> -	ret = regmap_write(drvdata->lpaif_map,
> -			   LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
> -			   0);
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		mask   = LPAIF_I2SCTL_SPKMODE_MASK;
> +	else
> +		mask   = LPAIF_I2SCTL_MICMODE_MASK;
> +
> +	ret = regmap_update_bits(drvdata->lpaif_map,
> +			 LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
> +			 mask, 0);
>   	if (ret)
>   		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
>   
> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
> index 3d74ae123e9d..7a2b9cf99976 100644
> --- a/sound/soc/qcom/lpass-lpaif-reg.h
> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
> @@ -56,7 +56,7 @@
>   #define LPAIF_I2SCTL_MICMODE_6CH	(7 << LPAIF_I2SCTL_MICMODE_SHIFT)
>   #define LPAIF_I2SCTL_MICMODE_8CH	(8 << LPAIF_I2SCTL_MICMODE_SHIFT)
>   
> -#define LPAIF_I2SCTL_MIMONO_MASK	GENMASK(3, 3)
> +#define LPAIF_I2SCTL_MICMONO_MASK	GENMASK(3, 3)
>   #define LPAIF_I2SCTL_MICMONO_SHIFT	3
>   #define LPAIF_I2SCTL_MICMONO_STEREO	(0 << LPAIF_I2SCTL_MICMONO_SHIFT)
>   #define LPAIF_I2SCTL_MICMONO_MONO	(1 << LPAIF_I2SCTL_MICMONO_SHIFT)
> 
