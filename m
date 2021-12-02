Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC84661D3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 11:57:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6306E240C;
	Thu,  2 Dec 2021 11:56:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6306E240C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638442653;
	bh=AOV8wcU97TepQRuBzOJW7jcOkBsie2SCJkuJ1lJqIQo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RDHb14R2rv37Ktk4JxmHeXeZY+Eva0KPos2Cwn6DBXkcBSGqhuxEbyjYDBlMLq2mz
	 POfKK0HFxwUX+abR9dPnrx2XCyh7g2CU7bfLDSKFxNxCy+zs5/NPXK+tnqHaL+y0Np
	 IGwvSL43tLm4VFplgRUQWERMB30BlymPQfT3J3o0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D05CAF800BE;
	Thu,  2 Dec 2021 11:56:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2561F802A0; Thu,  2 Dec 2021 11:56:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CCF1F800EE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 11:56:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CCF1F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="D4mX8COl"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638442567; h=Content-Type: In-Reply-To: MIME-Version: Date:
 Message-ID: From: References: Cc: To: Subject: Sender;
 bh=oFZy8m9+T9KQEBP8EaIwlge/XKxnthcQKa7uJ+1k6tY=;
 b=D4mX8COlTLY2TXb5ymci6quzAOiGw9eZHZ5h7PebRBeMGsoVErBkA22Htn7EBSg3JW/DZfdr
 wRMfp8sboZ1wOn46dW91bVNV35oP53GzG2SezmLrA7816Wj4tv1FdFAbTAr6N6ROfzO4nlX7
 b2MpvTAxZ1N0zHopTeDuuv4OraA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 61a8a6457d878c8ded4ca01c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Dec 2021 10:56:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1A61FC43619; Thu,  2 Dec 2021 10:56:05 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E6CB9C4338F;
 Thu,  2 Dec 2021 10:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E6CB9C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v6 03/10] ASoC: qcom: Add register definition for codec
 rddma and wrdma
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
 <1637928282-2819-4-git-send-email-srivasam@codeaurora.org>
 <3bb4aea6-2f47-8b6b-e7a9-1518d478e32d@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <efb98b22-e56a-d193-6ca0-e950dc3c4a42@codeaurora.org>
Date: Thu, 2 Dec 2021 16:25:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3bb4aea6-2f47-8b6b-e7a9-1518d478e32d@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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


On 12/1/2021 8:21 PM, Srinivas Kandagatla wrote:
Thanks for your time Srini!!!
>
> On 26/11/2021 12:04, Srinivasa Rao Mandadapu wrote:
>> This patch adds register definitions for codec read dma and write dma
>> lpass interface.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> ---
>>   sound/soc/qcom/lpass-lpaif-reg.h | 103 
>> ++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 97 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h 
>> b/sound/soc/qcom/lpass-lpaif-reg.h
>> index 2eb03ad..697a11f 100644
>> --- a/sound/soc/qcom/lpass-lpaif-reg.h
>> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
>> @@ -74,6 +74,16 @@
>>   #define LPAIF_IRQSTAT_REG(v, port)    LPAIF_IRQ_REG_ADDR(v, 0x4, 
>> (port))
>>   #define LPAIF_IRQCLEAR_REG(v, port)    LPAIF_IRQ_REG_ADDR(v, 0xC, 
>> (port))
>>   +/* LPAIF RXTX IRQ */
>> +#define LPAIF_RXTX_IRQ_REG_ADDR(v, addr, port, dai_id) \
>> +        ((dai_id == LPASS_CDC_DMA_RX0 || dai_id == 
>> LPASS_CDC_DMA_TX3) ? \
>> +        (v->rxtx_irq_reg_base + (addr) + v->rxtx_irq_reg_stride * 
>> (port)) : \
>> +        (v->va_irq_reg_base + (addr) + v->va_irq_reg_stride * (port)))
>> +
>> +#define LPAIF_RXTX_IRQEN_REG(v, port, dai_id) 
>> LPAIF_RXTX_IRQ_REG_ADDR(v, 0x0, port, dai_id)
>> +#define LPAIF_RXTX_IRQSTAT_REG(v, port, dai_id) 
>> LPAIF_RXTX_IRQ_REG_ADDR(v, 0x4, port, dai_id)
>> +#define LPAIF_RXTX_IRQCLEAR_REG(v, port, dai_id) 
>> LPAIF_RXTX_IRQ_REG_ADDR(v, 0xC, port, dai_id)
>> +
>
> How about doing like this:
>
>
> /* LPAIF RXTX IRQ */
> #define LPAIF_RXTX_IRQ_REG_ADDR(v, addr, port) \
>         (v->rxtx_irq_reg_base + (addr) + v->rxtx_irq_reg_stride * (port))
>
> #define LPAIF_RXTX_IRQEN_REG(v, port, dai_id) 
> LPAIF_RXTX_IRQ_REG_ADDR(v, 0x0, port)
> #define LPAIF_RXTX_IRQSTAT_REG(v, port, dai_id) 
> LPAIF_RXTX_IRQ_REG_ADDR(v, 0x4, port)
> #define LPAIF_RXTX_IRQCLEAR_REG(v, port, dai_id) 
> LPAIF_RXTX_IRQ_REG_ADDR(v, 0xC, port)
>
> /* LPAIF VA IRQ */
> #define LPAIF_VA_IRQ_REG_ADDR(v, addr, port) \
>         (v->va_irq_reg_base + (addr) + v->va_irq_reg_stride * (port))
>
> #define LPAIF_VA_IRQEN_REG(v, port, dai_id) LPAIF_VA_IRQ_REG_ADDR(v, 
> 0x0, port)
> #define LPAIF_VA_IRQSTAT_REG(v, port, dai_id) LPAIF_VA_IRQ_REG_ADDR(v, 
> 0x4, port)
> #define LPAIF_VA_IRQCLEAR_REG(v, port, dai_id) 
> LPAIF_VA_IRQ_REG_ADDR(v, 0xC, port)
>
With this we are seeing number macros increasing. How about handling 
like below.
> lpass.h:

static inline bool is_rxtx_cdc_dma_port(int dai_id)
{

     switch (dai_id) {
         case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
         case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
             return true;
         default:
             return false;
       }
}


Usage:

#define LPAIF_RXTX_IRQ_REG_ADDR(v, addr, port, dai_id) \
is_rxtx_cdc_dma_port(dai_id) ? \
(v->rxtx_irq_reg_base + (addr) + v->rxtx_irq_reg_stride * (port)) : \
(v->va_irq_reg_base + (addr) + v->va_irq_reg_stride * (port))


>
>>     #define LPASS_HDMITX_APP_IRQ_REG_ADDR(v, addr)  \
>>       ((v->hdmi_irq_reg_base) + (addr))
>> @@ -139,12 +149,93 @@
>>           (LPAIF_INTFDMA_REG(v, chan, reg, dai_id)) : \
>>           LPAIF_WRDMA##reg##_REG(v, chan))
>>   -#define LPAIF_DMACTL_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, 
>> chan, dir, CTL, dai_id)
>> -#define LPAIF_DMABASE_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, 
>> chan, dir, BASE, dai_id)
>> -#define    LPAIF_DMABUFF_REG(v, chan, dir, dai_id) 
>> __LPAIF_DMA_REG(v, chan, dir, BUFF, dai_id)
>> -#define LPAIF_DMACURR_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, 
>> chan, dir, CURR, dai_id)
>> -#define    LPAIF_DMAPER_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, 
>> chan, dir, PER, dai_id)
>> -#define    LPAIF_DMAPERCNT_REG(v, chan, dir, dai_id) 
>> __LPAIF_DMA_REG(v, chan, dir, PERCNT, dai_id)
>> +#define LPAIF_DMACTL_REG(v, chan, dir, dai_id)  \
>> +    (((dai_id == LPASS_CDC_DMA_RX0) || \
>> +    (dai_id == LPASS_CDC_DMA_TX3) || \
>> +    (dai_id == LPASS_CDC_DMA_VA_TX0)) ? \
>> +    __LPAIF_CDC_DMA_REG(v, chan, dir, CTL, dai_id) : \
>> +    __LPAIF_DMA_REG(v, chan, dir, CTL, dai_id))
>
>
> How about:
>
> #define LPAIF_DMACTL_REG(v, chan, dir, dai_id)  \
>     is_cdc_dma_port(dai_id) ? \
>     __LPAIF_CDC_DMA_REG(v, chan, dir, CTL, dai_id) : \
>     __LPAIF_DMA_REG(v, chan, dir, CTL, dai_id)
>
Yes this looks clean and handles all ports.
>
> simillar comments to most of the macros in this patch that are 
> directly comparing the dai_ids.
Okay. Will change accordingly.
>
>
>> +#define LPAIF_DMABASE_REG(v, chan, dir, dai_id) \
>> +    ((dai_id == LPASS_CDC_DMA_RX0 || \
>> +    dai_id == LPASS_CDC_DMA_TX3 || \
>> +    dai_id == LPASS_CDC_DMA_VA_TX0) ? \
>> +    __LPAIF_CDC_DMA_REG(v, chan, dir, BASE, dai_id) : \
>> +    __LPAIF_DMA_REG(v, chan, dir, BASE, dai_id))
>> +#define LPAIF_DMABUFF_REG(v, chan, dir, dai_id) \
>> +    ((dai_id == LPASS_CDC_DMA_RX0 || \
>> +    dai_id == LPASS_CDC_DMA_TX3 || \
>> +    dai_id == LPASS_CDC_DMA_VA_TX0) ? \
>> +    __LPAIF_CDC_DMA_REG(v, chan, dir, BUFF, dai_id) : \
>> +    __LPAIF_DMA_REG(v, chan, dir, BUFF, dai_id))
>> +#define LPAIF_DMACURR_REG(v, chan, dir, dai_id) \
>> +    ((dai_id == LPASS_CDC_DMA_RX0 || \
>> +    dai_id == LPASS_CDC_DMA_TX3 || \
>> +    dai_id == LPASS_CDC_DMA_VA_TX0) ? \
>> +    __LPAIF_CDC_DMA_REG(v, chan, dir, CURR, dai_id) : \
>> +    __LPAIF_DMA_REG(v, chan, dir, CURR, dai_id))
>> +#define LPAIF_DMAPER_REG(v, chan, dir, dai_id)  \
>> +    ((dai_id == LPASS_CDC_DMA_RX0 || \
>> +    dai_id == LPASS_CDC_DMA_TX3 || \
>> +    dai_id == LPASS_CDC_DMA_VA_TX0) ? \
>> +    __LPAIF_CDC_DMA_REG(v, chan, dir, PER, dai_id) : \
>> +    __LPAIF_DMA_REG(v, chan, dir, PER, dai_id))
>> +#define LPAIF_DMAPERCNT_REG(v, chan, dir, dai_id) \
>> +    ((dai_id == LPASS_CDC_DMA_RX0 || \
>> +    dai_id == LPASS_CDC_DMA_TX3 || \
>> +    dai_id == LPASS_CDC_DMA_VA_TX0) ? \
>> +    __LPAIF_CDC_DMA_REG(v, chan, dir, PERCNT, dai_id) : \
>> +    __LPAIF_DMA_REG(v, chan, dir, PERCNT, dai_id))
>> +
>> +#define LPAIF_CDC_RDMA_REG_ADDR(v, addr, chan, dai_id) \
>> +    ((dai_id == LPASS_CDC_DMA_RX0 || dai_id == LPASS_CDC_DMA_TX3) ? \
>> +    (v->rxtx_rdma_reg_base + (addr) + v->rxtx_rdma_reg_stride * 
>> (chan)) : \
>> +    (v->va_rdma_reg_base + (addr) + v->va_rdma_reg_stride * (chan)))
>> +
>> +#define LPAIF_CDC_RDMACTL_REG(v, chan, dai_id) 
>> LPAIF_CDC_RDMA_REG_ADDR(v, 0x00, (chan), dai_id)
>> +#define LPAIF_CDC_RDMABASE_REG(v, chan, dai_id) 
>> LPAIF_CDC_RDMA_REG_ADDR(v, 0x04, (chan), dai_id)
>> +#define LPAIF_CDC_RDMABUFF_REG(v, chan, dai_id) 
>> LPAIF_CDC_RDMA_REG_ADDR(v, 0x08, (chan), dai_id)
>> +#define LPAIF_CDC_RDMACURR_REG(v, chan, dai_id) 
>> LPAIF_CDC_RDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
>> +#define LPAIF_CDC_RDMAPER_REG(v, chan, dai_id) 
>> LPAIF_CDC_RDMA_REG_ADDR(v, 0x10, (chan), dai_id)
>> +
>> +#define LPAIF_CDC_RDMA_INTF_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_RDMA_REG_ADDR(v, 0x50, (chan), dai_id)
>> +
>> +#define LPAIF_CDC_WRDMA_REG_ADDR(v, addr, chan, dai_id) \
>> +    ((dai_id == LPASS_CDC_DMA_RX0 || dai_id == LPASS_CDC_DMA_TX3) ? \
>> +    (v->rxtx_wrdma_reg_base + (addr) + \
>> +    v->rxtx_wrdma_reg_stride * (chan - v->rxtx_wrdma_channel_start)) 
>> : \
>> +    (v->va_wrdma_reg_base + (addr) + \
>> +    v->va_wrdma_reg_stride * (chan - v->va_wrdma_channel_start)))
>
> Can we split this to LPAIF_CDC_TXRX_WRDMA_REG_ADDR and
> LPAIF_CDC_VA_WRDMA_REG_ADDR macros?

How about this way?

#define LPAIF_CDC_WRDMA_REG_ADDR(v, addr, chan, dai_id) \
is_rxtx_cdc_dma_port(dai_id) ? \
(v->rxtx_wrdma_reg_base + (addr) + \
v->rxtx_wrdma_reg_stride * (chan - v->rxtx_wrdma_channel_start)) : \
(v->va_wrdma_reg_base + (addr) + \
v->va_wrdma_reg_stride * (chan - v->va_wrdma_channel_start))

>
> --srini
>
>> +
>> +#define LPAIF_CDC_WRDMACTL_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x00, (chan), dai_id)
>> +#define LPAIF_CDC_WRDMABASE_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x04, (chan), dai_id)
>> +#define LPAIF_CDC_WRDMABUFF_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x08, (chan), dai_id)
>> +#define LPAIF_CDC_WRDMACURR_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
>> +#define LPAIF_CDC_WRDMAPER_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x10, (chan), dai_id)
>> +#define LPAIF_CDC_WRDMA_INTF_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x50, (chan), dai_id)
>> +
>> +#define __LPAIF_CDC_DMA_REG(v, chan, dir, reg, dai_id)  \
>> +        ((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
>> +        (LPAIF_CDC_RDMA##reg##_REG(v, chan, dai_id)) : \
>> +        LPAIF_CDC_WRDMA##reg##_REG(v, chan, dai_id))
>> +
>> +#define LPAIF_CDC_INTF_REG(v, chan, dir, dai_id) \
>> +        ((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
>> +        LPAIF_CDC_RDMA_INTF_REG(v, chan, dai_id) : \
>> +        LPAIF_CDC_WRDMA_INTF_REG(v, chan, dai_id))
>> +
>> +#define LPAIF_INTF_REG(v, chan, dir, dai_id) \
>> +        ((dai_id == LPASS_CDC_DMA_RX0 || \
>> +        dai_id == LPASS_CDC_DMA_TX3 || \
>> +        dai_id == LPASS_CDC_DMA_VA_TX0) ? \
>> +        LPAIF_CDC_INTF_REG(v, chan, dir, dai_id) : \
>> +        LPAIF_DMACTL_REG(v, chan, dir, dai_id))
>>     #define LPAIF_DMACTL_BURSTEN_SINGLE    0
>>   #define LPAIF_DMACTL_BURSTEN_INCR4    1
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

