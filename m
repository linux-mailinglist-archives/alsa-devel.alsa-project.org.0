Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C7C465089
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 15:52:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8183D24A7;
	Wed,  1 Dec 2021 15:52:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8183D24A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638370372;
	bh=ZftFrGL0M0Z3Mca2RZi3eT7+b4/HsJUk41+Una7U6h0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CgWpC/w9cSq97Yq6lEU4ZHmkffRMCNxf6Sq6uTNx1Z7RoSfxaW6VLoVU1yYGSnLu0
	 YffkauYAfAwLmHsa4j7GGmnKiINa0sUYZ5AKcs5ylWfTTuYVq8YEFMOB6vHYQ6bFGr
	 lW/wfVsiu9QHWvc1/Zbh9G1NTPdqA7Vy4bAsLUPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 009F4F80121;
	Wed,  1 Dec 2021 15:51:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2450F80246; Wed,  1 Dec 2021 15:51:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B061CF80121
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 15:51:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B061CF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="c1e83Im7"
Received: by mail-wm1-x333.google.com with SMTP id 133so20671020wme.0
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 06:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Gb2u8KwssgNnYQE671ubZFTIQrFKxdfnexkUxxMbkM=;
 b=c1e83Im7e4gfZsyzSuBRhzTy8cTd/kesVoL5iFE1sfPY7fgN9C6+Il8MDd2pok9Zlt
 4E9n/ieM5Rjr5gDP+1n2jP6sZ3f9FYWPBYzkavxzAAdKg/d1eL80eyWnIqNH5QIpI+2Q
 uEBLAsnsr1YcNdJyxXtDDUGW4iw0hVcWwHgKW1J1uE8+cuy18QXsp6Hu9XHlaeAMhF0s
 7jmJMsRpsxgQyxHnD2CKb0h2VW70RiiNw3nVfhfoV3OqzUeawuZ7fdt2GgAU8SvHMrmt
 08DWFyc1tCFLPV7d260sj8OPYaAU2Cjrzs+lbejY+QAjHkqZYghrMQx4mLgZMvvZi7ZH
 X6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Gb2u8KwssgNnYQE671ubZFTIQrFKxdfnexkUxxMbkM=;
 b=5MDuOYN1He3UkXp2CPv0CvmIP05f7DxAu4xvXtp5ZxQloWv6/L3YfwdYyG3HYMq1Ng
 JAmD02LfrUIiDvY3C3kO2tDzZ7wQuYs9GzqhYdqNcKkm24zE0ogH0yHUWxNXVVnetRZm
 OfxGGCsjqmStsteqNDyUdBSVGSWHcJVfrdZYKGov+LIrwWbC0GwU3jCnXEkURf3mxMsW
 cWf/PAyWrTkbY0jefPT5vP7VpqQmsFUAUNN7RkZs1lBtXIrDgMZZ34XznrpGjgCfxQG1
 zEzhzlOkqSnEPY4QpDw6hXer2f1qgy32RywGsJqYJY3CFNoyISqe4MncxMbFSlmqZGPS
 gV7g==
X-Gm-Message-State: AOAM533deFfX7erVlAXq8NQjBRf06elNtNwJgkjZEH2UajuIPAEF9cIc
 n+vG3kPYEjTfdtXFLkCxB+pCMA==
X-Google-Smtp-Source: ABdhPJynR2EJWu30h829urnDjwycFMpMQ89ALzJRAbP/wOqdc3+Fz5EZOrDgq4Ow1a6QemVm+2Cctg==
X-Received: by 2002:a05:600c:4113:: with SMTP id
 j19mr7844382wmi.48.1638370283304; 
 Wed, 01 Dec 2021 06:51:23 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id 38sm63820wrc.1.2021.12.01.06.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 06:51:22 -0800 (PST)
Subject: Re: [PATCH v6 06/10] ASoC: qcom: Add support for codec dma driver
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
 <1637928282-2819-7-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0fadec22-9301-9a25-2263-a9a1b57fe8d4@linaro.org>
Date: Wed, 1 Dec 2021 14:51:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637928282-2819-7-git-send-email-srivasam@codeaurora.org>
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



On 26/11/2021 12:04, Srinivasa Rao Mandadapu wrote:
> Upadate lpass cpu and platform driver to support audio over codec dma
> in ADSP bypass use case.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-cpu.c      |  59 +++++-
>   sound/soc/qcom/lpass-platform.c | 460 ++++++++++++++++++++++++++++++++++++++--
>   sound/soc/qcom/lpass.h          |  12 ++
>   3 files changed, 510 insertions(+), 21 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 3bd9eb3..70feb9e 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -857,7 +857,9 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>   		}
...

>   
>   		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get_optional(dev,
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 5d77240..4419d3b 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -20,6 +20,9 @@
>   
>   
>   static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
>   	.info			=	SNDRV_PCM_INFO_MMAP |
> @@ -45,6 +48,99 @@ static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
>   	.fifo_size		=	0,
>   };
>   

...
> +static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
> +				      struct snd_pcm_substream *substream,
> +				      struct vm_area_struct *vma)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +	unsigned int dai_id = cpu_dai->driver->id;
> +
> +	if (is_cdc_dma_port(dai_id))
> +		return lpass_platform_cdc_dma_mmap(component, substream, vma);
> +
> +	return 0;

Now we have broken what was working before,

This should proably be

if (is_cdc_dma_port(dai_id))
	err = lpass_platform_cdc_dma_mmap(component, substream, vma);
else
	err = snd_pcm_lib_default_mmap(substream, vma);

return err;

> +}
> +
>   static irqreturn_t lpass_dma_interrupt_handler(
>   			struct snd_pcm_substream *substream,
>   			struct lpass_data *drvdata,
> @@ -674,6 +908,17 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   		reg = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>   		val = 0;
>   	break;
> +	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +		map = drvdata->rxtx_lpaif_map;
> +		reg = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
> +		val = 0;
> +	break;
> +	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
> +		map = drvdata->va_lpaif_map;
> +		reg = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST, dai_id);
> +		val = 0;
> +	break;
>   	default:
>   	dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
>   	return -EINVAL;
> @@ -781,18 +1026,123 @@ static irqreturn_t lpass_platform_hdmiif_irq(int irq, void *data)
>   				return rv;
>   		}
>   	}
> +	return IRQ_HANDLED;
> +}
>   
> +static irqreturn_t lpass_platform_rxtxif_irq(int irq, void *data)
> +{
> +	struct lpass_data *drvdata = data;
> +	struct lpass_variant *v = drvdata->variant;
> +	unsigned int irqs;
> +	int rv, chan;
> +
> +	rv = regmap_read(drvdata->rxtx_lpaif_map,
> +			LPAIF_RXTX_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_RX0), &irqs);
> +	if (rv)
> +		return IRQ_NONE;
> +	/* Handle per channel interrupts */
> +	for (chan = 0; chan < LPASS_MAX_CDC_DMA_CHANNELS; chan++) {
> +		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->rxtx_substream[chan]) {
> +			rv = lpass_dma_interrupt_handler(
> +						drvdata->rxtx_substream[chan],
> +						drvdata, chan, irqs);
> +			if (rv != IRQ_HANDLED)
> +				return rv;
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t lpass_platform_vaif_irq(int irq, void *data)
> +{
> +	struct lpass_data *drvdata = data;
> +	struct lpass_variant *v = drvdata->variant;
> +	unsigned int irqs;
> +	int rv, chan;
> +
> +	rv = regmap_read(drvdata->va_lpaif_map,
> +			LPAIF_RXTX_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST,
> +			LPASS_CDC_DMA_VA_TX0), &irqs);
> +	if (rv)
> +		return IRQ_NONE;
> +	/* Handle per channel interrupts */
> +	for (chan = 0; chan < LPASS_MAX_VA_CDC_DMA_CHANNELS; chan++) {
> +		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->va_substream[chan]) {
> +			rv = lpass_dma_interrupt_handler(
> +						drvdata->va_substream[chan],
> +						drvdata, chan, irqs);
> +			if (rv != IRQ_HANDLED)
> +				return rv;
> +		}
> +	}
>   	return IRQ_HANDLED;
>   }
>   
> +static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *component,
> +			struct snd_pcm *pcm, int dai_id)
> +{
> +	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> +	struct snd_pcm_substream *substream;
> +	struct snd_dma_buffer *buf;
> +	int ret;
> +
> +	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
> +		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
> +	else
> +		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
> +
> +	ret = dma_coerce_mask_and_coherent(pcm->card->dev, DMA_BIT_MASK(64));
> +	if (ret)
> +		return ret;
> +
> +	buf = &substream->dma_buffer;
> +	buf->dev.dev = pcm->card->dev;
> +	buf->private_data = NULL;
> +
> +	/* Assign Codec DMA buffer pointers */
> +	buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
> +
> +	switch (dai_id) {
> +	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
> +		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf;
> +		break;
> +	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
> +		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
> +		break;
> +	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
> +		buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
> +		buf->addr = drvdata->va_cdc_dma_lpm_buf;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	buf->area = (unsigned char * __force)ioremap(buf->addr, buf->bytes);
> +
> +	return 0;
> +}
> +
>   static int lpass_platform_pcm_new(struct snd_soc_component *component,
>   				  struct snd_soc_pcm_runtime *soc_runtime)
>   {
>   	struct snd_pcm *pcm = soc_runtime->pcm;
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
> +	unsigned int dai_id = cpu_dai->driver->id;
> +
>   	size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
>   
> -	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> -					    component->dev, size);
> +	/*
> +	 * Lpass codec dma can access only lpass lpm hardware memory.
> +	 * ioremap is for HLOS to access hardware memory.
> +	 */
> +	if (is_cdc_dma_port(dai_id))
> +		return lpass_platform_prealloc_cdc_dma_buffer(component, pcm, dai_id);
> +	else
> +		return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> +						component->dev, size);
>   }
>   
>   static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
> @@ -827,6 +1177,22 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
>   	return regcache_sync(map);
>   }
>   
> +int lpass_platform_copy(struct snd_soc_component *component,
> +			 struct snd_pcm_substream *substream, int channel,
> +			 unsigned long pos, void __user *buf, unsigned long bytes)
> +{
> +	struct snd_pcm_runtime *rt = substream->runtime;
> +
> +	unsigned char *dma_buf = rt->dma_area + pos +
> +				channel * (rt->dma_bytes / rt->channels);
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		return copy_from_user_toio(dma_buf, buf, bytes);
> +	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> +		return copy_to_user_fromio(buf, dma_buf, bytes);

Should this be:

if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
	if (is_cdc_dma_port(dai_id))
		ret = copy_from_user_toio(dma_buf, buf, bytes);
	else
		ret = copy_from_user((void __force *)dma_buf, buf, bytes);
} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
	if (is_cdc_dma_port(dai_id))
		ret = copy_to_user_fromio(buf, dma_buf, bytes);
	else
		ret = copy_to_user(buf, dma_buf, bytes);
}

return ret;

--srini

> +
> +	return 0;
> +}
>   
>   static const struct snd_soc_component_driver lpass_component_driver = {
>   	.name		= DRV_NAME,
> @@ -837,9 +1203,11 @@ static const struct snd_soc_component_driver lpass_component_driver = {
>   	.prepare	= lpass_platform_pcmops_prepare,
>   	.trigger	= lpass_platform_pcmops_trigger,
>   	.pointer	= lpass_platform_pcmops_pointer,
> +	.mmap		= lpass_platform_pcmops_mmap,
>   	.pcm_construct	= lpass_platform_pcm_new,
>   	.suspend		= lpass_platform_pcmops_suspend,
>   	.resume			= lpass_platform_pcmops_resume,
> +	.copy_user		= lpass_platform_copy,
>   
>   };
>   
> @@ -877,6 +1245,60 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	if (drvdata->codec_dma_enable) {
> +		ret = regmap_write(drvdata->rxtx_lpaif_map,
> +			LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_TX3), 0x0);
> +		if (ret) {
> +			dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
> +			return ret;
> +		}
> +		ret = regmap_write(drvdata->va_lpaif_map,
> +			LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST, LPASS_CDC_DMA_VA_TX0), 0x0);
> +		if (ret) {
> +			dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
> +			return ret;
> +		}
> +		drvdata->rxtxif_irq = platform_get_irq_byname(pdev, "lpass-irq-rxtxif");
> +		if (drvdata->rxtxif_irq < 0)
> +			return -ENODEV;
> +
> +		ret = devm_request_irq(&pdev->dev, drvdata->rxtxif_irq,
> +				lpass_platform_rxtxif_irq, IRQF_TRIGGER_RISING,
> +				"lpass-irq-rxtxif", drvdata);
> +		if (ret) {
> +			dev_err(&pdev->dev, "rxtx irq request failed: %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = lpass_platform_alloc_rxtx_dmactl_fields(&pdev->dev,
> +						 drvdata->rxtx_lpaif_map);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"error initializing rxtx dmactl fields: %d\n", ret);
> +			return ret;
> +		}
> +
> +		drvdata->vaif_irq = platform_get_irq_byname(pdev, "lpass-irq-vaif");
> +		if (drvdata->vaif_irq < 0)
> +			return -ENODEV;
> +
> +		ret = devm_request_irq(&pdev->dev, drvdata->vaif_irq,
> +				lpass_platform_vaif_irq, IRQF_TRIGGER_RISING,
> +				"lpass-irq-vaif", drvdata);
> +		if (ret) {
> +			dev_err(&pdev->dev, "va irq request failed: %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = lpass_platform_alloc_va_dmactl_fields(&pdev->dev,
> +						 drvdata->va_lpaif_map);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"error initializing va dmactl fields: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
>   	if (drvdata->hdmi_port_enable) {
>   		drvdata->hdmiif_irq = platform_get_irq_byname(pdev, "lpass-irq-hdmi");
>   		if (drvdata->hdmiif_irq < 0)
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 48602c1..d35dc93 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -38,6 +38,18 @@
>   			return -EINVAL;         \
>   	} while (0)
>   
> +static inline bool is_cdc_dma_port(int dai_id)
> +{
> +	switch (dai_id) {
> +	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>   struct lpaif_i2sctl {
>   	struct regmap_field *loopback;
>   	struct regmap_field *spken;
> 
