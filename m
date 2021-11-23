Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A73145A2A3
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 13:30:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D54A11683;
	Tue, 23 Nov 2021 13:29:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D54A11683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637670640;
	bh=o1jgtuaotDVGGTDMDr5KRB8Ie+09jr28MFPuO6H5pNo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUtA4rnKrkzBgyx/QiACN6ZxFyhaI8+GJjz/rtFeWFm3i1sITftBA7HUXvdNIWz6e
	 rJhrX05qyOWAX7zDJVP5M6kdFGvmz9i8HqwUPpcwsvmrFJ+oGPuLKixW/zT/u2n4xh
	 gNw4DwjA6yOWU3oPecca/ISg3ZAyKxXfKpVQUFlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 722D3F80507;
	Tue, 23 Nov 2021 13:28:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD230F804FE; Tue, 23 Nov 2021 13:28:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B9EAF804EB
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 13:28:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B9EAF804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dPMOMM5M"
Received: by mail-wr1-x42f.google.com with SMTP id a9so38648571wrr.8
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 04:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y+2dhMLktqLvGFcZL0JfDpP42kgRWTSwc0iWLEbRGpY=;
 b=dPMOMM5MzAt9NPK2WuyYvIVUKazML1VSHPp1rShpjjhhvTLE1gPGoSk74ea3wtM7aW
 oZcxFsNL/auXt6RmSrYbc8u2rUGKNxhGEmeWwnaNasf39Z3Jm3zt6LhrKZNopa9aJpIr
 nPPrGN2VXetY3nSOsfpjic8ZXeBYc3vG2zRglWLMmiYrEJwf/L57hSffW2AVhWfvtj9f
 DM9ZbvjtMEqucwNSOdKCXJ5UeQv7Qzp7Sj6U6iMADSqxzgWoS54Nd3HXXMJyEU1AMYYu
 /96o+HvVYfY18KMt/M6y85YxAnakoB6H5ny5vSbTmYhRBZdSPTJPH49SHpIMvoZz/BGe
 IC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y+2dhMLktqLvGFcZL0JfDpP42kgRWTSwc0iWLEbRGpY=;
 b=48DX7F0Npr5QMmLEboYY2P4u+7bkWedth3OXlZ7TtHnLzgFsT2TNjIqYr8v6NXWld5
 4F0zCVmMyhCT5thPAwqT8rc/ZQmR9YPjZBgBcGi7E26bldcKtN6h+ktJcC7k/P++WVq/
 c1JI32AR4meTlWZGN8i5m+nDX5OiirOWBK+LtlxPe0ALoErPIOTLqOkAANb8Rm8K80l1
 j8zMT04Gsmg4MZNwVy+SAIM0QvE2Xoae0JitFIwasaj2H12tsvcaY3zcaH9lqNET2clz
 0pfZ8nq/0FWzD2FGTgt1Xjmb0r7yQTr1RdVfoLefqhQ0Ze0YXhm85MafvgnuNVITRuzI
 cr6Q==
X-Gm-Message-State: AOAM533x4b+U2oWFsGlnL4gCb/hbl5LSPhCxE3opf3BeP13fNQIFv5vJ
 rlj58cdQ6DZ15VScr2e0VjV8LQ==
X-Google-Smtp-Source: ABdhPJyWHwpcLjAmX6aVef1dpIvIvbPsAlkjt+u1X+nUahCtZKqq61o/QkVDbMLaTxFFYqkhdIzdsA==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr6836933wrj.84.1637670504721; 
 Tue, 23 Nov 2021 04:28:24 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id q24sm978561wmj.21.2021.11.23.04.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 04:28:24 -0800 (PST)
Subject: Re: [PATCH v5 05/10] ASoC: qcom: Add helper function to get dma
 control and lpaif handle
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1637581599-24120-1-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5ddc2e60-7145-9579-3f33-91807109ec80@linaro.org>
Date: Tue, 23 Nov 2021 12:28:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637581599-24120-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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



On 22/11/2021 11:46, Srinivasa Rao Mandadapu wrote:
> Add support function to get dma control and lpaif handle to avoid
> repeated code in platform driver
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>

Few minor Nits, but overall it looks good to me.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-platform.c | 90 ++++++++++++++++++++---------------------
>   1 file changed, 43 insertions(+), 47 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index a44162c..59c0884 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -177,6 +177,44 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
>   	return 0;
>   }
>   
> +static void __get_lpaif_handle(struct snd_pcm_substream *substream,
> +				struct snd_soc_component *component,
> +				struct lpaif_dmactl **dmactl, int *id, struct regmap **map)
Same indentation is off here.

> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> +	struct snd_pcm_runtime *rt = substream->runtime;
> +	struct lpass_pcm_data *pcm_data = rt->private_data;
> +	struct lpass_variant *v = drvdata->variant;
> +	int dir = substream->stream;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	struct lpaif_dmactl *l_dmactl;
> +	struct regmap *l_map;
> +	int l_id;
> +
> +	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> +		l_id = pcm_data->dma_ch;
> +		if (dai_id == LPASS_DP_RX) {
> +			l_dmactl = drvdata->hdmi_rd_dmactl;
> +			l_map = drvdata->hdmiif_map;
> +		} else {
> +			l_dmactl = drvdata->rd_dmactl;
> +			l_map = drvdata->lpaif_map;
> +		}
> +	} else {
> +		l_dmactl = drvdata->wr_dmactl;
> +		l_id = pcm_data->dma_ch - v->wrdma_channel_start;
> +		l_map = drvdata->lpaif_map;
> +	}
> +	if (dmactl)
> +		*dmactl = l_dmactl;
> +	if (id)
> +		*id = l_id;
> +	if (map)
> +		*map = l_map;
> +}
> +
>   static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>   					   struct snd_pcm_substream *substream,
>   					   struct snd_pcm_hw_params *params)
> @@ -191,22 +229,12 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>   	unsigned int channels = params_channels(params);
>   	unsigned int regval;
>   	struct lpaif_dmactl *dmactl;
> -	int id, dir = substream->stream;
> +	int id;
>   	int bitwidth;
>   	int ret, dma_port = pcm_data->i2s_port + v->dmactl_audif_start;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
> -	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> -		id = pcm_data->dma_ch;
> -		if (dai_id == LPASS_DP_RX)
> -			dmactl = drvdata->hdmi_rd_dmactl;
> -		else
> -			dmactl = drvdata->rd_dmactl;
> -
> -	} else {
> -		dmactl = drvdata->wr_dmactl;
> -		id = pcm_data->dma_ch - v->wrdma_channel_start;
> -	}
> +	__get_lpaif_handle(substream, component, &dmactl, &id, NULL);
error handling is missing.

>   
>   	bitwidth = snd_pcm_format_width(format);
>   	if (bitwidth < 0) {
> @@ -379,24 +407,9 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
>   	int ret, id, ch, dir = substream->stream;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
> -
>   	ch = pcm_data->dma_ch;
> -	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> -		if (dai_id == LPASS_DP_RX) {
> -			dmactl = drvdata->hdmi_rd_dmactl;
> -			map = drvdata->hdmiif_map;
> -		} else {
> -			dmactl = drvdata->rd_dmactl;
> -			map = drvdata->lpaif_map;
> -		}
> -
> -		id = pcm_data->dma_ch;
> -	} else {
> -		dmactl = drvdata->wr_dmactl;
> -		id = pcm_data->dma_ch - v->wrdma_channel_start;
> -		map = drvdata->lpaif_map;
> -	}
>   
> +	__get_lpaif_handle(substream, component, &dmactl, &id, &map);
>   	ret = regmap_write(map, LPAIF_DMABASE_REG(v, ch, dir, dai_id),
>   				runtime->dma_addr);
>   	if (ret) {
> @@ -444,26 +457,12 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   	struct lpaif_dmactl *dmactl;
>   	struct regmap *map;
>   	int ret, ch, id;
> -	int dir = substream->stream;
>   	unsigned int reg_irqclr = 0, val_irqclr = 0;
>   	unsigned int  reg_irqen = 0, val_irqen = 0, val_mask = 0;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
>   	ch = pcm_data->dma_ch;
> -	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> -		id = pcm_data->dma_ch;
> -		if (dai_id == LPASS_DP_RX) {
> -			dmactl = drvdata->hdmi_rd_dmactl;
> -			map = drvdata->hdmiif_map;
> -		} else {
> -			dmactl = drvdata->rd_dmactl;
> -			map = drvdata->lpaif_map;
> -		}
> -	} else {
> -		dmactl = drvdata->wr_dmactl;
> -		id = pcm_data->dma_ch - v->wrdma_channel_start;
> -		map = drvdata->lpaif_map;
> -	}
> +	__get_lpaif_handle(substream, component, &dmactl, &id, &map);
>   
>   	switch (cmd) {
>   	case SNDRV_PCM_TRIGGER_START:
> @@ -597,10 +596,7 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
>   	struct regmap *map;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
> -	if (dai_id == LPASS_DP_RX)
> -		map = drvdata->hdmiif_map;
> -	else
> -		map = drvdata->lpaif_map;
> +	__get_lpaif_handle(substream, component, NULL, NULL, &map);
>   
>   	ch = pcm_data->dma_ch;
>   
> 
