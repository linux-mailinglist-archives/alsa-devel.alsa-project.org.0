Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A1039DFF6
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 17:06:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 180AC1676;
	Mon,  7 Jun 2021 17:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 180AC1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623078406;
	bh=7Ss3Vt9XHStxA/CF4BLBi7fB5wOqM62v2JMF7rnGYOk=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GKIc6QyCsM1jWJJx6UNyrFeHEJcHMBCPj9kZo0jzQ1S0/T+TJXhnp7gsAxRvAfsqZ
	 Nygk6piqfpgM0JEJxX+dIZ2ZbAzxJUg7AGfMEhmI7Lzd+m35Pv9qXYBe1RNycA437L
	 ZL/aNlpW/sPRRaMghxivJ3mmMiME/hNApRr5DDD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B03F8026C;
	Mon,  7 Jun 2021 17:05:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 922D3F800DF; Mon,  7 Jun 2021 17:05:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBE68F800DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 17:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBE68F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="At6HmWUw"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623078315; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=6OL88XHWl9ozHCq99izlFd+FKI5s0/oTrciQ/ohCW7A=;
 b=At6HmWUwG656vgoLwCtsh72x0gwNwJKQnZAv9Y9jvFkd1i+lN0aErFQozx8nINyAIO5r4+8a
 N6sRmxeJAS3tWSOWuYECKb0r6KuD3VzT9d6ZyB+kr8rUR3/zRGEM7SJ1IDzwOBLWaXppOCZ2
 QUaKljOS9oUmMwc7tho2Nf+uCqw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60be356fe27c0cc77fec30ca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Jun 2021 15:04:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9566EC4323A; Mon,  7 Jun 2021 15:04:14 +0000 (UTC)
Received: from [192.168.29.24] (unknown [49.37.144.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 37A76C433D3;
 Mon,  7 Jun 2021 15:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37A76C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v2] ASoC: qcom: Fix for DMA interrupt clear reg overwriting
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <20210605113809.26584-1-srivasam@codeaurora.org>
 <ac3e70da-7d82-2021-3a25-08179aeb6b54@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <8028139e-fe25-bb9e-3038-5180bc5f8ca3@codeaurora.org>
Date: Mon, 7 Jun 2021 20:34:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ac3e70da-7d82-2021-3a25-08179aeb6b54@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Hi Srini,

Thanks for your review comments!!!

On 6/7/2021 8:20 PM, Srinivas Kandagatla wrote:
>
>
> On 05/06/2021 12:38, Srinivasa Rao Mandadapu wrote:
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
>> ---
>>   sound/soc/qcom/lpass-platform.c | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-platform.c 
>> b/sound/soc/qcom/lpass-platform.c
>> index 0df9481ea4c6..f220a2739ac3 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -526,7 +526,7 @@ static int lpass_platform_pcmops_trigger(struct 
>> snd_soc_component *component,
>>               return -EINVAL;
>>           }
>>   -        ret = regmap_write(map, reg_irqclr, val_irqclr);
>> +        ret = regmap_update_bits(map, reg_irqclr, val_irqclr, 
>> val_irqclr);
>>           if (ret) {
>>               dev_err(soc_runtime->dev, "error writing to irqclear 
>> reg: %d\n", ret);
>>               return ret;
>> @@ -650,7 +650,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>       struct lpass_variant *v = drvdata->variant;
>>       irqreturn_t ret = IRQ_NONE;
>>       int rv;
>> -    unsigned int reg = 0, val = 0;
>> +    unsigned int reg, val, val_clr, val_mask;
>
> minor nit here, variable name val_clr is pretty confusing to readers, 
> It might be okay for irq clr register but we are using the same name 
> of writing to other registers. So can I suggest you to reuse val 
> variable.
>
> other thing is val_mask, please rename this to mask and just set it in 
> the start of function so you can avoid 3 extra lines below.
Ok will do accordingly and repost patch.
>
> Other than that patch looks good to me!
>
> --srini
>>       struct regmap *map;
>>       unsigned int dai_id = cpu_dai->driver->id;
>>   @@ -676,8 +676,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>       return -EINVAL;
>>       }
>>       if (interrupts & LPAIF_IRQ_PER(chan)) {
>> -
>> -        rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
>> +        val_clr = LPAIF_IRQ_PER(chan) | val;
>> +        val_mask = LPAIF_IRQ_ALL(chan);
>> +        rv = regmap_update_bits(map, reg, val_mask, val_clr);
>>           if (rv) {
>>               dev_err(soc_runtime->dev,
>>                   "error writing to irqclear reg: %d\n", rv);
>> @@ -688,7 +689,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>       }
>>         if (interrupts & LPAIF_IRQ_XRUN(chan)) {
>> -        rv = regmap_write(map, reg, LPAIF_IRQ_XRUN(chan) | val);
>> +        val_clr = (LPAIF_IRQ_XRUN(chan) | val);
>> +        val_mask = LPAIF_IRQ_ALL(chan);
>> +        rv = regmap_update_bits(map, reg, val_mask, val_clr);
>>           if (rv) {
>>               dev_err(soc_runtime->dev,
>>                   "error writing to irqclear reg: %d\n", rv);
>> @@ -700,7 +703,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>       }
>>         if (interrupts & LPAIF_IRQ_ERR(chan)) {
>> -        rv = regmap_write(map, reg, LPAIF_IRQ_ERR(chan) | val);
>> +        val_clr = (LPAIF_IRQ_ERR(chan) | val);
>> +        val_mask = LPAIF_IRQ_ALL(chan);
>> +        rv = regmap_update_bits(map, reg, val_mask, val_clr);
>>           if (rv) {
>>               dev_err(soc_runtime->dev,
>>                   "error writing to irqclear reg: %d\n", rv);
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

