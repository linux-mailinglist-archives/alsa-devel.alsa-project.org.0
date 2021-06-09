Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C8F3A0E55
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 10:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2214C16DA;
	Wed,  9 Jun 2021 10:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2214C16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623225724;
	bh=wWKJscwnyAW8KZAhEblNJBiGXnj9c6OeWXWReijEAtg=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mhew9q8j2kqZPa1FjfA8T9kuiDdj+Plep8NTs3bharWNdnXrbECAtmEUaXJwIGddk
	 XXOmP9BzIo7LJk9pHyelAe+y7hvgHN651f0PIB6uQlY2gtvKPcNWsXWCFFgAfZw/Ay
	 c09Cl5Uc+V+xd1IxRJUH9p7YCWpMDcI+t2cXhbgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F0D2F80276;
	Wed,  9 Jun 2021 10:00:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46E1EF8026C; Wed,  9 Jun 2021 10:00:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F6B5F80116
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 10:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F6B5F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QfFOHuv4"
Received: by mail-wr1-x429.google.com with SMTP id f2so24336779wri.11
 for <alsa-devel@alsa-project.org>; Wed, 09 Jun 2021 01:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=G2EK7hq7OuAZ8vK1o6rU1XG0kTRV9Kntzv3xlza+n0A=;
 b=QfFOHuv40ZGJkmXc7S7b/QxXuUItWu1HFIvmg/6K2HiGj6AdgllxXtIKShavGF4sF7
 A+YU1CCxsSxAO2qnWKJ1wAaajH7OkrQEjRcshVZESRYj3zFVS08MWDZI4+FHfXOrpAqR
 AbWSwSWt7iPxkW4lVLzCKLC/VAytorCFe+A13wcDv1UNel4sxRb2kADMMXTLwt7CApMC
 N9O+Bqmyx1FDzxa1+LX7aevzSKZn9mYrvW8Kk15N5N4vibIHU38CZF29zv2YImIppEKp
 8jXFmJJmyLqbENa/3dzXA3XsxefpI2yBOaiuh1Qw3xwlaFyTNFmFJPsSxVOPo8SPMD7u
 U5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G2EK7hq7OuAZ8vK1o6rU1XG0kTRV9Kntzv3xlza+n0A=;
 b=JHeMkOsGAgXoGEz0oxoxX3AbfnQ/RcPIbfR1tsMcEyxUaqghjALXTCvp546S0Qw+QO
 87aE8+Ai2WzObLGBD2lD8hLmkm5rnCyf6H+8eHg87HOHWXADVVorr/PmSkhH8u8mOfTp
 iMnUiuU1WgnBPeIgaEIsNBMmKVDc+UYAoobIBK/PSzxiTB9xKyjPqNgOP+MbEEnzQZ+t
 RshAjJI+zP06W1S31ktmv10bvO6H2Jb71lcfMQN7RkSdXW26LXMtl0a2j0JF3ty/3tgA
 9WgnCngXHvMprRuzkoMzUp1Y8zNOVR1otTzGAJ3wc8SZvKFFvJDeePAiScAujTKpw4eP
 s6Yg==
X-Gm-Message-State: AOAM532g+Lu9Estri1YTw0JDGe7yotVj57OLG1gxEDnehN2TrIP0U9NE
 EE7JRAVI1E2AcA9LPpDF/4eWMA==
X-Google-Smtp-Source: ABdhPJwDiSHpwAb775A9EfjwDdPIkboWLp2SbzF44VTUmPYbQADeCfsM36T8Gw3e0Qk1hmzim1pZfA==
X-Received: by 2002:a5d:4bc9:: with SMTP id l9mr27231725wrt.97.1623225625800; 
 Wed, 09 Jun 2021 01:00:25 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id l13sm15145069wrz.34.2021.06.09.01.00.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Jun 2021 01:00:25 -0700 (PDT)
Subject: Re: [PATCH v3] ASoC: qcom: Fix for DMA interrupt clear reg overwriting
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <20210609072310.26099-1-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f8be85f2-719d-c19d-b5af-c97d7def2f6b@linaro.org>
Date: Wed, 9 Jun 2021 09:00:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210609072310.26099-1-srivasam@codeaurora.org>
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



On 09/06/2021 08:23, Srinivasa Rao Mandadapu wrote:
> The DMA interrupt clear register overwritten during
> simultaneous playback and capture in lpass platform
> interrupt handler. It's causing playback or capture stuck
> in similtaneous plaback on speaker and capture on dmic test.
> Update appropriate reg fields of corresponding channel instead
> of entire register write.
> 
> Fixes: commit c5c8635a04711 ("ASoC: qcom: Add LPASS platform driver")
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

LGTM

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
> ---
> Changes since v2:
> 	-- Removed redundant variables.
> Changes since v1:
> 	-- Subject lines changed.
>   sound/soc/qcom/lpass-platform.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 0df9481ea4c6..f9df76d37858 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -526,7 +526,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   			return -EINVAL;
>   		}
>   
> -		ret = regmap_write(map, reg_irqclr, val_irqclr);
> +		ret = regmap_update_bits(map, reg_irqclr, val_irqclr, val_irqclr);
>   		if (ret) {
>   			dev_err(soc_runtime->dev, "error writing to irqclear reg: %d\n", ret);
>   			return ret;
> @@ -650,10 +650,11 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	struct lpass_variant *v = drvdata->variant;
>   	irqreturn_t ret = IRQ_NONE;
>   	int rv;
> -	unsigned int reg = 0, val = 0;
> +	unsigned int reg, val, mask;
>   	struct regmap *map;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
> +	mask = LPAIF_IRQ_ALL(chan);
>   	switch (dai_id) {
>   	case LPASS_DP_RX:
>   		map = drvdata->hdmiif_map;
> @@ -676,8 +677,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	return -EINVAL;
>   	}
>   	if (interrupts & LPAIF_IRQ_PER(chan)) {
> -
> -		rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
> +		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_PER(chan) | val));
>   		if (rv) {
>   			dev_err(soc_runtime->dev,
>   				"error writing to irqclear reg: %d\n", rv);
> @@ -688,7 +688,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	}
>   
>   	if (interrupts & LPAIF_IRQ_XRUN(chan)) {
> -		rv = regmap_write(map, reg, LPAIF_IRQ_XRUN(chan) | val);
> +		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_XRUN(chan) | val));
>   		if (rv) {
>   			dev_err(soc_runtime->dev,
>   				"error writing to irqclear reg: %d\n", rv);
> @@ -700,7 +700,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	}
>   
>   	if (interrupts & LPAIF_IRQ_ERR(chan)) {
> -		rv = regmap_write(map, reg, LPAIF_IRQ_ERR(chan) | val);
> +		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_ERR(chan) | val));
>   		if (rv) {
>   			dev_err(soc_runtime->dev,
>   				"error writing to irqclear reg: %d\n", rv);
> 
