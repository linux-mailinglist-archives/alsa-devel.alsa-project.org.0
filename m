Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57911466242
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 12:23:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E94002573;
	Thu,  2 Dec 2021 12:22:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E94002573
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638444218;
	bh=9+RIZOWHSUdBU44gWo7ZhkjF02D0Pp6P+e51fJ6pZW8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zjh1l1IUBWCsFM+IYMAoBboFsQ6l9vwGtCByz9j8wh5/wUHyiYNqGKWSS+Z3Rz6b9
	 FyHkLevM/Ti2FDLr8J7eKHxcKRDYbYl1sEw+2RiNeYuQ+fEOfEdBKVOW7a2RaP26oG
	 T/SkwWtnMAqrsRhnFv3P/t0qoaLZ46sIglGDb4a0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 488CFF802E0;
	Thu,  2 Dec 2021 12:22:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29464F802A0; Thu,  2 Dec 2021 12:22:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89F88F800EE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 12:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89F88F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="j/lo7Y+8"
Received: by mail-wr1-x42b.google.com with SMTP id s13so58947758wrb.3
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 03:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=57MihNmUyq2yL5Hp/EvWIEoULb+nvWcaJPe8Tm/kK3I=;
 b=j/lo7Y+8i3x/bYaN1cp6hiulf75jS1A+Lk0q6kayJ4J8UCI1s8URhPTKaZssoIBl6V
 2NfAp26ve0kg29/NBBarRV9zhSNVKkoEfOLiP20FJsF6t7HArfrUhpSFtzww4Y+9L6v1
 rXlBZpu85XURN3J0ZOD5R2WrsffY9LsVZiyE7SBy/6OjCSYm5SoQGzQeRuiio3ATKt6q
 13VrrojWhA7jXNuPGAT3c4wxaP0frleUZYI0fbZyDkEknjAgh8xAOx76ft5QMVHgc7hN
 8w68sya6W8sovRSW1JKTidfgaWguTV6S1pUTWVZRP2vqVkrNSXUkGI1FpJzJPIFNdaxd
 dPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=57MihNmUyq2yL5Hp/EvWIEoULb+nvWcaJPe8Tm/kK3I=;
 b=Sbdj20FYAltjTmQh58R6cEjcJxZZmasQC8FewCa9/zyb5vDAUqZIPv46+17zRTW4qI
 bdGU6EpnvBBcRSRPjy1wlShhriBTusVD9SWC1iqvdLhA1ly4AzfTrOfOEkniM5dbip+K
 QlU/k+modZxXKt4DqSr82zyIwk4xmR+SvzIo1zxh62nFNoWePWszp8h7KKaGj5336D9v
 gW6wsFcWlFocYi/nvTynCZX0sLrmxOdeksFFhjH8rR4rtawRBG0UAwXVPGBYYQJERE6x
 FTIXt2RGwbisbDCnPkyulheQ3N9RmCyIwEO6xP5FRP2ylqRQIm9dLoIXQQOagVtb+Zyk
 xNzg==
X-Gm-Message-State: AOAM5321HuoZyvVQy28WwCA+ETM4dzr+Cqw+lETDroIdxqDQkGaWajzr
 IxZAZgTjVTCaSPWhVzzFsTKg5Q==
X-Google-Smtp-Source: ABdhPJzv2sMtPSd0XDLh5Macj8qITjActzhDy+HoOIouRPrsCxZNACCQB+UrNGU00jKFXN2yn5bV4w==
X-Received: by 2002:adf:b35d:: with SMTP id k29mr13179787wrd.466.1638444134961; 
 Thu, 02 Dec 2021 03:22:14 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id z14sm2337734wrp.70.2021.12.02.03.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 03:22:14 -0800 (PST)
Subject: Re: [PATCH v6 03/10] ASoC: qcom: Add register definition for codec
 rddma and wrdma
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
 <1637928282-2819-4-git-send-email-srivasam@codeaurora.org>
 <3bb4aea6-2f47-8b6b-e7a9-1518d478e32d@linaro.org>
 <efb98b22-e56a-d193-6ca0-e950dc3c4a42@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <928c419e-ae92-38bd-3974-e81efbe301ff@linaro.org>
Date: Thu, 2 Dec 2021 11:22:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <efb98b22-e56a-d193-6ca0-e950dc3c4a42@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 02/12/2021 10:55, Srinivasa Rao Mandadapu wrote:
>>>   +/* LPAIF RXTX IRQ */
>>> +#define LPAIF_RXTX_IRQ_REG_ADDR(v, addr, port, dai_id) \
>>> +        ((dai_id == LPASS_CDC_DMA_RX0 || dai_id == 
>>> LPASS_CDC_DMA_TX3) ? \
>>> +        (v->rxtx_irq_reg_base + (addr) + v->rxtx_irq_reg_stride * 
>>> (port)) : \
>>> +        (v->va_irq_reg_base + (addr) + v->va_irq_reg_stride * (port)))
>>> +
>>> +#define LPAIF_RXTX_IRQEN_REG(v, port, dai_id) 
>>> LPAIF_RXTX_IRQ_REG_ADDR(v, 0x0, port, dai_id)
>>> +#define LPAIF_RXTX_IRQSTAT_REG(v, port, dai_id) 
>>> LPAIF_RXTX_IRQ_REG_ADDR(v, 0x4, port, dai_id)
>>> +#define LPAIF_RXTX_IRQCLEAR_REG(v, port, dai_id) 
>>> LPAIF_RXTX_IRQ_REG_ADDR(v, 0xC, port, dai_id)
>>> +
>>
>> How about doing like this:
>>
>>
>> /* LPAIF RXTX IRQ */
>> #define LPAIF_RXTX_IRQ_REG_ADDR(v, addr, port) \
>>         (v->rxtx_irq_reg_base + (addr) + v->rxtx_irq_reg_stride * (port))
>>
>> #define LPAIF_RXTX_IRQEN_REG(v, port, dai_id) 
>> LPAIF_RXTX_IRQ_REG_ADDR(v, 0x0, port)
>> #define LPAIF_RXTX_IRQSTAT_REG(v, port, dai_id) 
>> LPAIF_RXTX_IRQ_REG_ADDR(v, 0x4, port)
>> #define LPAIF_RXTX_IRQCLEAR_REG(v, port, dai_id) 
>> LPAIF_RXTX_IRQ_REG_ADDR(v, 0xC, port)
>>
>> /* LPAIF VA IRQ */
>> #define LPAIF_VA_IRQ_REG_ADDR(v, addr, port) \
>>         (v->va_irq_reg_base + (addr) + v->va_irq_reg_stride * (port))
>>
>> #define LPAIF_VA_IRQEN_REG(v, port, dai_id) LPAIF_VA_IRQ_REG_ADDR(v, 
>> 0x0, port)
>> #define LPAIF_VA_IRQSTAT_REG(v, port, dai_id) LPAIF_VA_IRQ_REG_ADDR(v, 
>> 0x4, port)
>> #define LPAIF_VA_IRQCLEAR_REG(v, port, dai_id) 
>> LPAIF_VA_IRQ_REG_ADDR(v, 0xC, port)
>>
> With this we are seeing number macros increasing. How about handling 

Its okay to add new macros, this makes them much clear to the reader and 
inline with rest of the macros in the file.


--srini
> like below.
>> lpass.h:
> 
> static inline bool is_rxtx_cdc_dma_port(int dai_id)
> {
> 
>      switch (dai_id) {
>          case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>          case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>              return true;
>          default:
>              return false;
>        }
> }
> 
> 
> Usage:
> 
> #define LPAIF_RXTX_IRQ_REG_ADDR(v, addr, port, dai_id) \
> is_rxtx_cdc_dma_port(dai_id) ? \
> (v->rxtx_irq_reg_base + (addr) + v->rxtx_irq_reg_stride * (port)) : \
> (v->va_irq_reg_base + (addr) + v->va_irq_reg_stride * (port))
> 
> 
