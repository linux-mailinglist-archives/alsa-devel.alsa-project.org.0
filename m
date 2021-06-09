Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB14B3A15B2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 15:33:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F5F016C1;
	Wed,  9 Jun 2021 15:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F5F016C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623245607;
	bh=+aWHhFedcQfgkaa870NuwsF5GF91lx5+aAq+WS87utI=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EyBBAq1XeVSCgnoTYAx0a/onVSqvNLFXuQkeTnKQz3kEiMLDSNKmvyQhqN2M4/WMZ
	 VE6/LBJxJFrPshCRMYydm++kH6wTSODrWTcPwkwwDj+OY/nLzPLgLLzEDIzVgDQxuQ
	 GuPaSU78iJaStY1X0PI/GEfIJXpJ5J8dZS56onvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9F8BF80212;
	Wed,  9 Jun 2021 15:32:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF958F8027C; Wed,  9 Jun 2021 15:32:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E26EF80276
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 15:32:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E26EF80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="R8mGoDMw"
Received: by mail-wr1-x431.google.com with SMTP id o3so7138529wri.8
 for <alsa-devel@alsa-project.org>; Wed, 09 Jun 2021 06:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lUdke6htwmhA5dwmH5nqrl72FFCl9nDLwry0d6NYq10=;
 b=R8mGoDMwBBV4hbsRgCugAOZRINIEA08feaDk66tA1/lvBXWu/S4mRWoZjlLTMQUcZb
 B8+GK7X12x72JgBelnNELBMtYhTs4wrfoQDGA/Pzy+e5QoYH4e5G0JJpPwKEp1gn7QPA
 JR8mJ9uO0uI17pQoEOzhV6Hp0ubeniwuLMc/BdnbdXiZgLA6EO9I4ziIrnSWDn3h1nK2
 eljT/7K45PN6HgdIetUOoiIbNLJ0tthL1GCmIrOpOQS/umywKSxrGq1FbEpazIafkUkx
 gFaDXtSIEFArgmBZRXSkSaJvnZE6tb2BsLMBxTNXEmgAR2RbKsl6FC08bkKGqZQOkmfo
 D+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lUdke6htwmhA5dwmH5nqrl72FFCl9nDLwry0d6NYq10=;
 b=lBZXZEYl1xoN4TxKJRusyK/Dj5ae1IuKcqw1m+62ykNvix2eoBPWTB8KcV5iMyYbAD
 erVQEAuar02DirZcVUb/aU+SxzRx9qdV53b01YoU1gQKKH6d/zXxvH2V0fA/2onAPuUt
 aMJQPu/owyas6jeVbR62vpHszzy8fisS/KWJXqhJrHwi3gIJg9hPJvkfB1vCPlLV3Aze
 Mm9ky+U8072be+wduiH8x1PnTMAORAq3IyFlIho9FZVnPMKxVymrnvkg44EXJlpXgNHO
 hU2uidDj+5QdUzR6Qaihg0l6Emti67E13O5dEPekcCOp+gVwEEyuwhluvOJpRQoztO9j
 Zyww==
X-Gm-Message-State: AOAM530StKUTWeze5ZY3HiYaZ9nnbbMQ72e5IoMuJw4gdigQ1AedD79N
 PG6O4FN5JFvy6x/5fg6YwgqZIA==
X-Google-Smtp-Source: ABdhPJxsmddMb8dvO3dYf14XNfU0myBP9qEVALchMojRiPg7w1K9x7FqpVtDhdvheKH6YNVjevxE0w==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr18312086wrr.292.1623245550059; 
 Wed, 09 Jun 2021 06:32:30 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id v18sm26112965wrb.10.2021.06.09.06.32.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Jun 2021 06:32:29 -0700 (PDT)
Subject: Re: [PATCH v3] ASoC: qcom: Add four speaker support on MI2S secondary
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <20210609133039.4648-1-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c2ab81bc-98e8-e833-a8cc-7176ff03809c@linaro.org>
Date: Wed, 9 Jun 2021 14:32:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210609133039.4648-1-srivasam@codeaurora.org>
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



On 09/06/2021 14:30, Srinivasa Rao Mandadapu wrote:
> Add four speaker support on MI2S secondary block
> by using I2S SD1 line on gpio52 pin, and add channel map
> control support in the lpass-cpu audio driver.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>



--srini
> Changes Since V2:
> 	-- Added empty entry at the end of channel maps array.
> Changes Since V1:
> 	-- removed set_channel_map/get_channel_map implementation as default kcontrols
> 		added in pcm_new API.
>   sound/soc/qcom/lpass-cpu.c    | 33 +++++++++++++++++++++++++++++++++
>   sound/soc/qcom/lpass-sc7180.c |  1 +
>   sound/soc/qcom/lpass.h        |  2 ++
>   3 files changed, 36 insertions(+)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index c62d2612e8f5..aff39c9f6326 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -29,6 +29,15 @@
>   #define LPASS_CPU_I2S_SD0_1_2_MASK	GENMASK(2, 0)
>   #define LPASS_CPU_I2S_SD0_1_2_3_MASK	GENMASK(3, 0)
>   
> +/*
> + * Channel maps for Quad channel playbacks on MI2S Secondary
> + */
> +static struct snd_pcm_chmap_elem lpass_quad_chmaps[] = {
> +		{ .channels = 4,
> +		  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_RL,
> +				SNDRV_CHMAP_FR, SNDRV_CHMAP_RR } },
> +		{ }
> +};
>   static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
>   			struct lpaif_i2sctl *i2sctl, struct regmap *map)
>   {
> @@ -324,6 +333,25 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
>   };
>   EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
>   
> +int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
> +				struct snd_soc_dai *dai)
> +{
> +	int ret;
> +	struct snd_soc_dai_driver *drv = dai->driver;
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +
> +	if (drvdata->mi2s_playback_sd_mode[dai->id] == LPAIF_I2SCTL_MODE_QUAD01) {
> +		ret =  snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
> +				lpass_quad_chmaps, drv->playback.channels_max, 0,
> +				NULL);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(lpass_cpu_pcm_new);
> +
>   int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> @@ -856,6 +884,11 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
>   			return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
>   		}
> +		if (drvdata->mi2s_playback_sd_mode[dai_id] ==
> +			LPAIF_I2SCTL_MODE_QUAD01) {
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
> index 83b2e08ade06..623ddccdafff 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -259,5 +259,7 @@ void asoc_qcom_lpass_cpu_platform_shutdown(struct platform_device *pdev);
>   int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);
>   int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
>   extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
> +int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
> +				struct snd_soc_dai *dai);
>   
>   #endif /* __LPASS_H__ */
> 
