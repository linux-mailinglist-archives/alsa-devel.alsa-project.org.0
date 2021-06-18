Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEAE3ACA24
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 13:42:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A44461724;
	Fri, 18 Jun 2021 13:41:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A44461724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624016568;
	bh=mxQ9N/aQFojfrF+hhFfU4Oa2RR8DShW5KHmruRnLohU=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NEJko+pEildq5/I8B6MNqMnOVkzT2FLWAGF4uGzhqYHRdMNqSpxxn9cC9y/ozokIj
	 G1Ky4IpV3M2E+KSbEOOwaJ00LmPJYX9yb3VMGERKeBwzYxYGNUbe9/+TKmGmh7uoRh
	 aSS2QpKcCef2qbkgzOreM1GQKuQVKRyijKSta9BQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BAEDF80084;
	Fri, 18 Jun 2021 13:41:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7D1DF80084; Fri, 18 Jun 2021 13:41:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF065F80084
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 13:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF065F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TId1KcZQ"
Received: by mail-wr1-x42d.google.com with SMTP id m18so10435937wrv.2
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 04:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2+aVtjIZPMWAlSORuslJEgy3WIqb0GMm7Q4JpdPCkC0=;
 b=TId1KcZQnz4L0hbs4WelnUMqcvwWWi1WzMVQ5EOOM2NgW6Xi2Y9wwFhhDRFn7VX7hS
 uaWIZNTtdUL8kzuGdo494lwZEYt1+LEw4vydd790n69r7iz8DfD7JaO7PGii2coZFaFh
 yzwVf0YskKDyzKyEjLltHqA4Vr3uihuQDYJ5v7F8idCcAlrZHEyC9Rk7wz/4PGECRTZE
 SgiSuE0hgiaVyqmmRMmk/d0P4vWxXeuq86Z54X7DqS99MZDUg+GXaXmQbDbr09Ly71D3
 gJYwRPPhUaTgiZ7jpnwXEhGdJRcnZhSvRhyD6WxXpeNeVABMkSj9k00eauzED27LCSpn
 fejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2+aVtjIZPMWAlSORuslJEgy3WIqb0GMm7Q4JpdPCkC0=;
 b=trglgezxSyVf6UzoAHmAl07pItrM0xgsohlzdpxRNPmZ43L2v2lEMqCGgwlMlwl0Dj
 NMAR9oG5WN/aU+AHf/9+J7PwVcbtjhtbEqPY7jzRClOIzCzOG+xUfw1xQO3D/9S4K56O
 lXYZL18dQkgZr0ZB2R1H4BBywinaONNVAAF4+NcM+1mUjajo0DCfRn5Jrr8NsDtPP6oJ
 IxXMm2eMLUW4o3JmEvSLytLlhzq+fDvuJI3NiTeHXa8/opDJo26mho/sUQb5Sb7HwTAY
 hrJ1FGv5aK5mq7kfCJGWGEYyQBWOh6XusIMPuUAEMAZrptku1M6Wdt2LODI2OVPItmBc
 DOsg==
X-Gm-Message-State: AOAM532Sod4/rAF9N39EdwmPNGN+UwA5RMAMzS1Okct0CjcFVvRkdfGd
 PlVbXwX5eLSe/PkTSAvvjNmf+A==
X-Google-Smtp-Source: ABdhPJwhkaQHejxBMQnTClcBCXFQ2/K58vup9P7+dj81rIrBztuammVJmK/4c3JNzjsIcgV4Cbj5PQ==
X-Received: by 2002:a5d:6849:: with SMTP id o9mr11612861wrw.44.1624016471416; 
 Fri, 18 Jun 2021 04:41:11 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id u15sm8553491wmq.1.2021.06.18.04.41.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jun 2021 04:41:10 -0700 (PDT)
Subject: Re: [PATCH v3] ASoC: qcom: Fix for DMA interrupt clear reg overwriting
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <20210609072310.26099-1-srivasam@codeaurora.org>
 <CGME20210617193537eucas1p217b93d091ae8795581b30931ad8c7467@eucas1p2.samsung.com>
 <5ae06ccb-ffd4-ca9f-5a88-1f8bf8b48d37@samsung.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <83be2add-2fa7-a16e-4250-95520e80c514@linaro.org>
Date: Fri, 18 Jun 2021 12:41:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5ae06ccb-ffd4-ca9f-5a88-1f8bf8b48d37@samsung.com>
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

Hi Marek,

Thanks for testing next and reporting this back.

On 17/06/2021 20:35, Marek Szyprowski wrote:
> Hi,
> 
> On 09.06.2021 09:23, Srinivasa Rao Mandadapu wrote:
>> The DMA interrupt clear register overwritten during
>> simultaneous playback and capture in lpass platform
>> interrupt handler. It's causing playback or capture stuck
>> in similtaneous plaback on speaker and capture on dmic test.
>> Update appropriate reg fields of corresponding channel instead
>> of entire register write.
>>
>> Fixes: commit c5c8635a04711 ("ASoC: qcom: Add LPASS platform driver")
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> This patch landed recently in linux-next as commit da0363f7bfd3 ("ASoC:
> qcom: Fix for DMA interrupt clear reg overwriting"). It breaks ALSA
> playback on DragonBoard 410c (arch/arm64/boot/dts/qcom/apq8016-sbc.dts).
> After applying this patch, running 'speaker-test -l1' never finishes.
> There is no error nor kernel warning message. Before that commit, the
> playback worked fine on that board.

TBH, I should have looked at the hw register description that is being 
updated in the patch. This is a software write only and hardware 
readable register for which update_bits really does not make sense at 
all. While digging out I found an issue with regmap_cache reads which 
should have reported an error while attempting to even do this. I sent 
out a patch to fix this.

Now for this patch itself, We should send a patch to revert it.


thanks,
srini


> 
>> ---
>> Changes since v2:
>> 	-- Removed redundant variables.
>> Changes since v1:
>> 	-- Subject lines changed.
>>    sound/soc/qcom/lpass-platform.c | 12 ++++++------
>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>> index 0df9481ea4c6..f9df76d37858 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -526,7 +526,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>>    			return -EINVAL;
>>    		}
>>    
>> -		ret = regmap_write(map, reg_irqclr, val_irqclr);
>> +		ret = regmap_update_bits(map, reg_irqclr, val_irqclr, val_irqclr);
>>    		if (ret) {
>>    			dev_err(soc_runtime->dev, "error writing to irqclear reg: %d\n", ret);
>>    			return ret;
>> @@ -650,10 +650,11 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>    	struct lpass_variant *v = drvdata->variant;
>>    	irqreturn_t ret = IRQ_NONE;
>>    	int rv;
>> -	unsigned int reg = 0, val = 0;
>> +	unsigned int reg, val, mask;
>>    	struct regmap *map;
>>    	unsigned int dai_id = cpu_dai->driver->id;
>>    
>> +	mask = LPAIF_IRQ_ALL(chan);
>>    	switch (dai_id) {
>>    	case LPASS_DP_RX:
>>    		map = drvdata->hdmiif_map;
>> @@ -676,8 +677,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>    	return -EINVAL;
>>    	}
>>    	if (interrupts & LPAIF_IRQ_PER(chan)) {
>> -
>> -		rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
>> +		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_PER(chan) | val));
>>    		if (rv) {
>>    			dev_err(soc_runtime->dev,
>>    				"error writing to irqclear reg: %d\n", rv);
>> @@ -688,7 +688,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>    	}
>>    
>>    	if (interrupts & LPAIF_IRQ_XRUN(chan)) {
>> -		rv = regmap_write(map, reg, LPAIF_IRQ_XRUN(chan) | val);
>> +		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_XRUN(chan) | val));
>>    		if (rv) {
>>    			dev_err(soc_runtime->dev,
>>    				"error writing to irqclear reg: %d\n", rv);
>> @@ -700,7 +700,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>    	}
>>    
>>    	if (interrupts & LPAIF_IRQ_ERR(chan)) {
>> -		rv = regmap_write(map, reg, LPAIF_IRQ_ERR(chan) | val);
>> +		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_ERR(chan) | val));
>>    		if (rv) {
>>    			dev_err(soc_runtime->dev,
>>    				"error writing to irqclear reg: %d\n", rv);
> 
> Best regards
> 
