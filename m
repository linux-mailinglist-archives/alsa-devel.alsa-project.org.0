Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4D4467866
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 14:31:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB8742203;
	Fri,  3 Dec 2021 14:30:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB8742203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638538304;
	bh=+EbIFGyJF8xVL9GF5U/wMhS9a4FquM+bXds7Wn1uLio=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LGDeR0sAn2lM/dBeF0aVjtfxtvgTtcBLlJfpJKbjMIqZ0HyTmxk0ZlyvvsG+uZ+Mg
	 ZNtrvRgUPEdQAqvx7Vt3tXN7Z6vXSA/ADNtwnkPiJgmUA5wELqfJ0mlO1hJ+atljaq
	 O564RwUOD811LVyoM7oqwVyhUc4AKw0PhtHJumFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 911E6F8050F;
	Fri,  3 Dec 2021 14:29:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07906F80508; Fri,  3 Dec 2021 14:29:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E1BBF804FA
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 14:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E1BBF804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NF/kdZXu"
Received: by mail-wr1-x431.google.com with SMTP id s13so5774449wrb.3
 for <alsa-devel@alsa-project.org>; Fri, 03 Dec 2021 05:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lZAJRTTgqmvVZ9uC+yTIsPzDRzkdEcdtzUS0sNflocA=;
 b=NF/kdZXuMJcQ/C0BWQvZi620UcGgTfL5lk8A5YqSFqFvCJg+NuFb3qgHoEUfdh5Jzw
 +dyGa8wDAgRVfJMx1i1ZV76qB0guwDrdojG2T96Mwj9bNFDViVZjBWOd8qb80ygbfYpr
 denHHNfi7GMi8aSOp3qpWfFtNvBKILfQEvXc2ayuKiD+1ExyNT71HeXV+/LKrqzoIru0
 +rsEGfpLjK/vDWt3mlyUrTfha+4KNr8zcqwhmclHnMMIfRRrEYhQsiGY2iDynU3lj9xx
 x4nit280nqzE686QHNR93aVIkPUIplHMfF0kry9FIzXvKWAR0MF6A5wpInaEY0jLnfpm
 3YKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lZAJRTTgqmvVZ9uC+yTIsPzDRzkdEcdtzUS0sNflocA=;
 b=ODbsje6cq47o6aGuzaHFNl6vKqudVpCU6zdZQjcwj5OcjSda9HjVoid70+JL5XkhoF
 wfT8qUUk7O8kfU8VoBp8gUPe5yv4OWimT1j8b65dX/ym8raBIN3EL191hTM+qkchoEad
 JhnHr4JeaRwb0c+bRdC8QXWC9OiRKXRoAaZ3JdjvvTSplsgFiZjdaqjaBj63vKTErFyk
 MFXZuhha02piZy8hfWvTnPnD0xwFLOGtf0YiRhx0g4ljK7iU1daML2I9K9/scmfdEThV
 x08VB3Z2zq85ZAi4V5nvQVMIcuCqyYPoLx8dnIIYG0Tr8n+EAxtUh8eguixBTNi9tNUr
 mQbw==
X-Gm-Message-State: AOAM530bnC8ImZG2SrMCQ3+dCkMOPvZW+lK0Bi7WRkvozuphPZcbaePN
 xA2gi2iSheRyrIueIl4C1iEoPg==
X-Google-Smtp-Source: ABdhPJyjzr2jYtJtPZBX2IihBdqk1/sZovUePRqug9URP0D6B18KSFa+28BHFthtSUotI4Pfa7zlHw==
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr21999145wrc.417.1638538161831; 
 Fri, 03 Dec 2021 05:29:21 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id m36sm2691670wms.25.2021.12.03.05.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 05:29:21 -0800 (PST)
Subject: Re: [PATCH v7 07/10] ASoC: qcom: Add regmap config support for codec
 dma driver
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1638459806-27600-1-git-send-email-srivasam@codeaurora.com>
 <1638459806-27600-8-git-send-email-srivasam@codeaurora.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ae65e6f4-a7ca-6b4e-6376-9af01eaa97f8@linaro.org>
Date: Fri, 3 Dec 2021 13:29:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1638459806-27600-8-git-send-email-srivasam@codeaurora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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



On 02/12/2021 15:43, Srinivasa Rao Mandadapu wrote:
> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> Update regmap configuration for supporting headset playback and
> capture and DMIC capture using codec dma interface
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>


LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-cpu.c | 185 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 185 insertions(+)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 81818f0..a5a46bc 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -28,6 +28,8 @@
>   #define LPASS_CPU_I2S_SD2_3_MASK	GENMASK(3, 2)
>   #define LPASS_CPU_I2S_SD0_1_2_MASK	GENMASK(2, 0)
>   #define LPASS_CPU_I2S_SD0_1_2_3_MASK	GENMASK(3, 0)
> +#define LPASS_REG_READ 1
> +#define LPASS_REG_WRITE 0
>   
>   /*
>    * Channel maps for Quad channel playbacks on MI2S Secondary
> @@ -798,6 +800,189 @@ static struct regmap_config lpass_hdmi_regmap_config = {
>   	.cache_type = REGCACHE_FLAT,
>   };
>   
> +static bool __lpass_rxtx_regmap_accessible(struct device *dev, unsigned int reg, bool rw)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	for (i = 0; i < v->rxtx_irq_ports; ++i) {
> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i))
> +			return true;
> +		if (reg == LPAIF_RXTX_IRQEN_REG(v, i))
> +			return true;
> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i))
> +			return true;
> +	}
> +
> +	for (i = 0; i < v->rxtx_rdma_channels; ++i) {
> +		if (reg == LPAIF_CDC_RXTX_RDMACTL_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_CDC_RXTX_RDMABASE_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_CDC_RXTX_RDMABUFF_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (rw == LPASS_REG_READ) {
> +			if (reg == LPAIF_CDC_RXTX_RDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
> +				return true;
> +		}
> +		if (reg == LPAIF_CDC_RXTX_RDMAPER_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +		if (reg == LPAIF_CDC_RXTX_RDMA_INTF_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +	}
> +
> +	for (i = 0; i < v->rxtx_wrdma_channels; ++i) {
> +		if (reg == LPAIF_CDC_RXTX_WRDMACTL_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +		if (reg == LPAIF_CDC_RXTX_WRDMABASE_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +		if (reg == LPAIF_CDC_RXTX_WRDMABUFF_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +		if (rw == LPASS_REG_READ) {
> +			if (reg == LPAIF_CDC_RXTX_WRDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
> +				return true;
> +		}
> +		if (reg == LPAIF_CDC_RXTX_WRDMAPER_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +		if (reg == LPAIF_CDC_RXTX_WRDMA_INTF_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +	}
> +	return false;
> +}
> +
> +static bool lpass_rxtx_regmap_writeable(struct device *dev, unsigned int reg)
> +{
> +	return __lpass_rxtx_regmap_accessible(dev, reg, LPASS_REG_WRITE);
> +}
> +
> +static bool lpass_rxtx_regmap_readable(struct device *dev, unsigned int reg)
> +{
> +	return __lpass_rxtx_regmap_accessible(dev, reg, LPASS_REG_READ);
> +}
> +
> +static bool lpass_rxtx_regmap_volatile(struct device *dev, unsigned int reg)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	for (i = 0; i < v->rxtx_irq_ports; ++i) {
> +		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i))
> +			return true;
> +		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i))
> +			return true;
> +	}
> +
> +	for (i = 0; i < v->rxtx_rdma_channels; ++i)
> +		if (reg == LPAIF_CDC_RXTX_RDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
> +			return true;
> +
> +	for (i = 0; i < v->rxtx_wrdma_channels; ++i)
> +		if (reg == LPAIF_CDC_RXTX_WRDMACURR_REG(v, i + v->rxtx_wrdma_channel_start,
> +							LPASS_CDC_DMA_TX3))
> +			return true;
> +
> +	return false;
> +}
> +
> +static bool __lpass_va_regmap_accessible(struct device *dev, unsigned int reg, bool rw)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	for (i = 0; i < v->va_irq_ports; ++i) {
> +		if (reg == LPAIF_VA_IRQCLEAR_REG(v, i))
> +			return true;
> +		if (reg == LPAIF_VA_IRQEN_REG(v, i))
> +			return true;
> +		if (reg == LPAIF_VA_IRQSTAT_REG(v, i))
> +			return true;
> +	}
> +
> +	for (i = 0; i < v->va_wrdma_channels; ++i) {
> +		if (reg == LPAIF_CDC_VA_WRDMACTL_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_CDC_VA_WRDMABASE_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_CDC_VA_WRDMABUFF_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (rw == LPASS_REG_READ) {
> +			if (reg == LPAIF_CDC_VA_WRDMACURR_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +				return true;
> +		}
> +		if (reg == LPAIF_CDC_VA_WRDMAPER_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +		if (reg == LPAIF_CDC_VA_WRDMA_INTF_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +	}
> +	return false;
> +}
> +
> +static bool lpass_va_regmap_writeable(struct device *dev, unsigned int reg)
> +{
> +	return __lpass_va_regmap_accessible(dev, reg, LPASS_REG_WRITE);
> +}
> +
> +static bool lpass_va_regmap_readable(struct device *dev, unsigned int reg)
> +{
> +	return __lpass_va_regmap_accessible(dev, reg, LPASS_REG_READ);
> +}
> +
> +static bool lpass_va_regmap_volatile(struct device *dev, unsigned int reg)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	for (i = 0; i < v->va_irq_ports; ++i) {
> +		if (reg == LPAIF_VA_IRQCLEAR_REG(v, i))
> +			return true;
> +		if (reg == LPAIF_VA_IRQSTAT_REG(v, i))
> +			return true;
> +	}
> +
> +	for (i = 0; i < v->va_wrdma_channels; ++i) {
> +		if (reg == LPAIF_CDC_VA_WRDMACURR_REG(v, i + v->va_wrdma_channel_start,
> +							LPASS_CDC_DMA_VA_TX0))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static struct regmap_config lpass_rxtx_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.writeable_reg = lpass_rxtx_regmap_writeable,
> +	.readable_reg = lpass_rxtx_regmap_readable,
> +	.volatile_reg = lpass_rxtx_regmap_volatile,
> +	.cache_type = REGCACHE_FLAT,
> +};
> +
> +static struct regmap_config lpass_va_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.writeable_reg = lpass_va_regmap_writeable,
> +	.readable_reg = lpass_va_regmap_readable,
> +	.volatile_reg = lpass_va_regmap_volatile,
> +	.cache_type = REGCACHE_FLAT,
> +};
> +
>   static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
>   						struct device_node *node,
>   						const char *name)
> 
