Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482139DF42
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 16:51:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB8071676;
	Mon,  7 Jun 2021 16:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB8071676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623077512;
	bh=wyElrFuFo8lb6cZqUtaw8G64zLhKp/JvfoBEKSuyFfE=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NtQY1ADRJc5vm412A2oB03AN48rKj2grTWfRvFlZ4DOP4aDbH2jyU23/C1e+xN2zy
	 fWkTD0i6ixQ251EzCT58+x/s0/ANou03MeirgNvg6M+vFH6R01vtsvES2zV93XSgKD
	 VLPTZIdebFplYnKutBRKr/qr3AUXLWx70J3HeCU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A686F8026C;
	Mon,  7 Jun 2021 16:50:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A979EF80212; Mon,  7 Jun 2021 16:50:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A697BF800AF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 16:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A697BF800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Q+AUXH6O"
Received: by mail-wr1-x42e.google.com with SMTP id q5so17977121wrm.1
 for <alsa-devel@alsa-project.org>; Mon, 07 Jun 2021 07:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ByuWA/FeshPmLL8w1r+fuCOMh+rIc6tFaDLNfGOXkJ4=;
 b=Q+AUXH6Ozlo1bGcem9xyhXLx6p5zw2kfb5vmaOQlSrxbGpyKvoWKTpZpEJ5ldB0oIC
 wraYRcylqwrytpiW4zj62E+ZoZdSFWh9YWyk94dnSUGPFzkhJje3pzPp8uKaETDiapR0
 Mb/TEAdkpUcE2FLckZ4CeYBof1xyG3XTltANywQNINpLvY9IAycbT/nK0Q/cJO8JCWwp
 dgOYOMSDb46x69pcxr7dOkpt3YBLZBCvOo6vw7lelyJ5ZOAQHT+gHPnC3OZEH5M50zR0
 HKo5967qxi6xvh5n48XjRAnpZ7PSIFOKuqjMc9xcAWkXt5Fi6cNAwaJC+hr6n6KVpgtp
 RnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ByuWA/FeshPmLL8w1r+fuCOMh+rIc6tFaDLNfGOXkJ4=;
 b=CulG63oRKUn0KT4SzEiYumkrzznEm85DkDm6y8R9uX6cDsE2udh0zEhYD7KnLFqC7h
 uqG4EbzmY6IftXFlqmk8KXJNDLNjnMWDt+eSjQTNDT/J1Cs+NOg8hu4Ov3WTA7GSCqFO
 SlpH4g5PEaPm4SJXBqGDXqKkkdJiBhLU0il7tT7lbAA7Fcdpkt3d9jC+epcKfeJves56
 Z9aPL1OFjThMMpy6bWfPVrxqTc3ZG/sRHl48gZVwfUiLW/QvbbCAmLymzjK3QEWHBW9W
 cZLLXlO1yBZ/Q1UQE3C4OCnjR853wwTypZSaQ5cZeAn0f+YArpfZaFz9T68oxb7CwCZb
 bONg==
X-Gm-Message-State: AOAM5332qlDivLqA5C0EBwq0tE5LfkJVRoAYyz/mOWPXTZR5QCneWn9v
 2FKI5tCQl1Qa1hufSHX8OnzOkg==
X-Google-Smtp-Source: ABdhPJw59vawdwGj786iQvPc2EqyB2ILv3MVi/4BNcV3iN6RvaKPmAY4ReeZNQGuKy0QuV3behuSxg==
X-Received: by 2002:a05:6000:1803:: with SMTP id
 m3mr17161493wrh.257.1623077414589; 
 Mon, 07 Jun 2021 07:50:14 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id x10sm5665619wrt.26.2021.06.07.07.50.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jun 2021 07:50:13 -0700 (PDT)
Subject: Re: [PATCH v2] ASoC: qcom: Fix for DMA interrupt clear reg overwriting
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <20210605113809.26584-1-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ac3e70da-7d82-2021-3a25-08179aeb6b54@linaro.org>
Date: Mon, 7 Jun 2021 15:50:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210605113809.26584-1-srivasam@codeaurora.org>
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



On 05/06/2021 12:38, Srinivasa Rao Mandadapu wrote:
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
> ---
>   sound/soc/qcom/lpass-platform.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 0df9481ea4c6..f220a2739ac3 100644
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
> @@ -650,7 +650,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	struct lpass_variant *v = drvdata->variant;
>   	irqreturn_t ret = IRQ_NONE;
>   	int rv;
> -	unsigned int reg = 0, val = 0;
> +	unsigned int reg, val, val_clr, val_mask;

minor nit here, variable name val_clr is pretty confusing to readers, It 
might be okay for irq clr register but we are using the same name of 
writing to other registers. So can I suggest you to reuse val variable.

other thing is val_mask, please rename this to mask and just set it in 
the start of function so you can avoid 3 extra lines below.

Other than that patch looks good to me!

--srini
>   	struct regmap *map;
>   	unsigned int dai_id = cpu_dai->driver->id;
>   
> @@ -676,8 +676,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	return -EINVAL;
>   	}
>   	if (interrupts & LPAIF_IRQ_PER(chan)) {
> -
> -		rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
> +		val_clr = LPAIF_IRQ_PER(chan) | val;
> +		val_mask = LPAIF_IRQ_ALL(chan);
> +		rv = regmap_update_bits(map, reg, val_mask, val_clr);
>   		if (rv) {
>   			dev_err(soc_runtime->dev,
>   				"error writing to irqclear reg: %d\n", rv);
> @@ -688,7 +689,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	}
>   
>   	if (interrupts & LPAIF_IRQ_XRUN(chan)) {
> -		rv = regmap_write(map, reg, LPAIF_IRQ_XRUN(chan) | val);
> +		val_clr = (LPAIF_IRQ_XRUN(chan) | val);
> +		val_mask = LPAIF_IRQ_ALL(chan);
> +		rv = regmap_update_bits(map, reg, val_mask, val_clr);
>   		if (rv) {
>   			dev_err(soc_runtime->dev,
>   				"error writing to irqclear reg: %d\n", rv);
> @@ -700,7 +703,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>   	}
>   
>   	if (interrupts & LPAIF_IRQ_ERR(chan)) {
> -		rv = regmap_write(map, reg, LPAIF_IRQ_ERR(chan) | val);
> +		val_clr = (LPAIF_IRQ_ERR(chan) | val);
> +		val_mask = LPAIF_IRQ_ALL(chan);
> +		rv = regmap_update_bits(map, reg, val_mask, val_clr);
>   		if (rv) {
>   			dev_err(soc_runtime->dev,
>   				"error writing to irqclear reg: %d\n", rv);
> 
