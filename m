Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AE4467A4D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 16:31:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FBC9232D;
	Fri,  3 Dec 2021 16:30:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FBC9232D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638545468;
	bh=aGCn5CkIYoan6Jt2sToyrQMFtwYFHv6TE7ApwBWm8r8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=osB9k5LsZIfQvEYMS5Gd8g1bBUlvu2bokm/ZnhVhGnQMY6Cg6HXdvajvA5tf/IkWw
	 B9jp40SSa/dlA8BaZzw0lGAh++g0ez1a44vyRBoedDTVOl857xBMiHScOFoXDcrBwB
	 1Xb8nlf9V5C72cEkeYHYGinis0YmUWXTdiWOaj7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12D3EF8015B;
	Fri,  3 Dec 2021 16:29:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01E3DF80246; Fri,  3 Dec 2021 16:29:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B887F800A7
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 16:29:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B887F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="PM7om4aj"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638545383; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=f3d8XLjrfeunVf9qAZPSRFMs4nRqEca9QkB22J8l4rU=;
 b=PM7om4ajgVGFYG+YjyxqBErONLyehw20iiZF44NGt/Q732IdvGb8llQsLCexiXFRkk3lfKM9
 /x2WL8oY+x8DfsSH+gzPFZlpGGR4L5xAkRbRHyz9CrU+p6ftNWjzdCaSkG/UTQV9YcN2Knwy
 qX8Qg7txVmRVyeDICbATGD17W38=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61aa37e5903341b2e41a5f9c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Dec 2021 15:29:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6F306C43619; Fri,  3 Dec 2021 15:29:41 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DF733C4338F;
 Fri,  3 Dec 2021 15:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DF733C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v7 03/10] ASoC: qcom: Add register definition for codec
 rddma and wrdma
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1638459806-27600-1-git-send-email-srivasam@codeaurora.com>
 <1638459806-27600-4-git-send-email-srivasam@codeaurora.com>
 <87df2562-f9c0-188d-601b-d9c896b3719e@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <5cea3676-f8e8-b6e6-84f9-685e7625cb95@codeaurora.org>
Date: Fri, 3 Dec 2021 20:59:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87df2562-f9c0-188d-601b-d9c896b3719e@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 12/3/2021 6:58 PM, Srinivas Kandagatla wrote:
Thanks for your time Srini!!!
>
> On 02/12/2021 15:43, Srinivasa Rao Mandadapu wrote:
>> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>
>> This patch adds register definitions for codec read dma and write dma
>> lpass interface.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>
> Overall the patch LGTM,
> but for bisectablity reasons, pleas make sure these macros
>
> is_rxtx_cdc_dma_port()
> is_cdc_dma_port()
>
> to be avaiable in this patch.
Okay. Will change accordingly.
>
> Once that is fixed you could add my
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> --srini
>
>
>> ---
>>   sound/soc/qcom/lpass-lpaif-reg.h | 127 
>> +++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 121 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h 
>> b/sound/soc/qcom/lpass-lpaif-reg.h
>> index 2eb03ad..6d9d9d1 100644
>> --- a/sound/soc/qcom/lpass-lpaif-reg.h
>> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
>> @@ -74,6 +74,21 @@
>>   #define LPAIF_IRQSTAT_REG(v, port)    LPAIF_IRQ_REG_ADDR(v, 0x4, 
>> (port))
>>   #define LPAIF_IRQCLEAR_REG(v, port)    LPAIF_IRQ_REG_ADDR(v, 0xC, 
>> (port))
>>   +/* LPAIF RXTX IRQ */
>> +#define LPAIF_RXTX_IRQ_REG_ADDR(v, addr, port) \
>> +        (v->rxtx_irq_reg_base + (addr) + v->rxtx_irq_reg_stride * 
>> (port))
>> +
>> +#define LPAIF_RXTX_IRQEN_REG(v, port) LPAIF_RXTX_IRQ_REG_ADDR(v, 
>> 0x0, port)
>> +#define LPAIF_RXTX_IRQSTAT_REG(v, port) LPAIF_RXTX_IRQ_REG_ADDR(v, 
>> 0x4, port)
>> +#define LPAIF_RXTX_IRQCLEAR_REG(v, port) LPAIF_RXTX_IRQ_REG_ADDR(v, 
>> 0xC, port)
>> +
>> +/* LPAIF VA IRQ */
>> +#define LPAIF_VA_IRQ_REG_ADDR(v, addr, port) \
>> +        (v->va_irq_reg_base + (addr) + v->va_irq_reg_stride * (port))
>> +
>> +#define LPAIF_VA_IRQEN_REG(v, port) LPAIF_VA_IRQ_REG_ADDR(v, 0x0, port)
>> +#define LPAIF_VA_IRQSTAT_REG(v, port) LPAIF_VA_IRQ_REG_ADDR(v, 0x4, 
>> port)
>> +#define LPAIF_VA_IRQCLEAR_REG(v, port) LPAIF_VA_IRQ_REG_ADDR(v, 0xC, 
>> port)
>>     #define LPASS_HDMITX_APP_IRQ_REG_ADDR(v, addr)  \
>>       ((v->hdmi_irq_reg_base) + (addr))
>> @@ -139,12 +154,112 @@
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
>> +#define LPAIF_DMACTL_REG(v, chan, dir, dai_id) \
>> +    (is_cdc_dma_port(dai_id) ? \
>> +    __LPAIF_CDC_DMA_REG(v, chan, dir, CTL, dai_id) : \
>> +    __LPAIF_DMA_REG(v, chan, dir, CTL, dai_id))
>> +#define LPAIF_DMABASE_REG(v, chan, dir, dai_id) \
>> +    (is_cdc_dma_port(dai_id) ? \
>> +    __LPAIF_CDC_DMA_REG(v, chan, dir, BASE, dai_id) : \
>> +    __LPAIF_DMA_REG(v, chan, dir, BASE, dai_id))
>> +#define LPAIF_DMABUFF_REG(v, chan, dir, dai_id) \
>> +    (is_cdc_dma_port(dai_id) ? \
>> +    __LPAIF_CDC_DMA_REG(v, chan, dir, BUFF, dai_id) : \
>> +    __LPAIF_DMA_REG(v, chan, dir, BUFF, dai_id))
>> +#define LPAIF_DMACURR_REG(v, chan, dir, dai_id) \
>> +    (is_cdc_dma_port(dai_id) ? \
>> +    __LPAIF_CDC_DMA_REG(v, chan, dir, CURR, dai_id) : \
>> +    __LPAIF_DMA_REG(v, chan, dir, CURR, dai_id))
>> +#define LPAIF_DMAPER_REG(v, chan, dir, dai_id)  \
>> +    (is_cdc_dma_port(dai_id) ? \
>> +    __LPAIF_CDC_DMA_REG(v, chan, dir, PER, dai_id) : \
>> +    __LPAIF_DMA_REG(v, chan, dir, PER, dai_id))
>> +#define LPAIF_DMAPERCNT_REG(v, chan, dir, dai_id) \
>> +    (is_cdc_dma_port(dai_id) ? \
>> +    __LPAIF_CDC_DMA_REG(v, chan, dir, PERCNT, dai_id) : \
>> +    __LPAIF_DMA_REG(v, chan, dir, PERCNT, dai_id))
>> +
>> +#define LPAIF_CDC_RDMA_REG_ADDR(v, addr, chan, dai_id) \
>> +    (is_rxtx_cdc_dma_port(dai_id) ? \
>> +    (v->rxtx_rdma_reg_base + (addr) + v->rxtx_rdma_reg_stride * 
>> (chan)) : \
>> +    (v->va_rdma_reg_base + (addr) + v->va_rdma_reg_stride * (chan)))
>> +
>> +#define LPAIF_CDC_RXTX_RDMACTL_REG(v, chan, dai_id) \
>> +        LPAIF_CDC_RDMA_REG_ADDR(v, 0x00, (chan), dai_id)
>> +#define LPAIF_CDC_RXTX_RDMABASE_REG(v, chan, dai_id) \
>> +        LPAIF_CDC_RDMA_REG_ADDR(v, 0x04, (chan), dai_id)
>> +#define LPAIF_CDC_RXTX_RDMABUFF_REG(v, chan, dai_id) \
>> +        LPAIF_CDC_RDMA_REG_ADDR(v, 0x08, (chan), dai_id)
>> +#define LPAIF_CDC_RXTX_RDMACURR_REG(v, chan, dai_id) \
>> +        LPAIF_CDC_RDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
>> +#define LPAIF_CDC_RXTX_RDMAPER_REG(v, chan, dai_id) \
>> +        LPAIF_CDC_RDMA_REG_ADDR(v, 0x10, (chan), dai_id)
>> +#define LPAIF_CDC_RXTX_RDMA_INTF_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_RDMA_REG_ADDR(v, 0x50, (chan), dai_id)
>> +
>> +#define LPAIF_CDC_VA_RDMACTL_REG(v, chan, dai_id) 
>> LPAIF_CDC_RDMA_REG_ADDR(v, 0x00, (chan), dai_id)
>> +#define LPAIF_CDC_VA_RDMABASE_REG(v, chan, dai_id) 
>> LPAIF_CDC_RDMA_REG_ADDR(v, 0x04, (chan), dai_id)
>> +#define LPAIF_CDC_VA_RDMABUFF_REG(v, chan, dai_id) 
>> LPAIF_CDC_RDMA_REG_ADDR(v, 0x08, (chan), dai_id)
>> +#define LPAIF_CDC_VA_RDMACURR_REG(v, chan, dai_id) 
>> LPAIF_CDC_RDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
>> +#define LPAIF_CDC_VA_RDMAPER_REG(v, chan, dai_id) 
>> LPAIF_CDC_RDMA_REG_ADDR(v, 0x10, (chan), dai_id)
>> +#define LPAIF_CDC_VA_RDMA_INTF_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_RDMA_REG_ADDR(v, 0x50, (chan), dai_id)
>> +
>> +#define LPAIF_CDC_WRDMA_REG_ADDR(v, addr, chan, dai_id) \
>> +    (is_rxtx_cdc_dma_port(dai_id) ? \
>> +    (v->rxtx_wrdma_reg_base + (addr) + \
>> +        v->rxtx_wrdma_reg_stride * (chan - 
>> v->rxtx_wrdma_channel_start)) : \
>> +    (v->va_wrdma_reg_base + (addr) + \
>> +        v->va_wrdma_reg_stride * (chan - v->va_wrdma_channel_start)))
>> +
>> +#define LPAIF_CDC_RXTX_WRDMACTL_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x00, (chan), dai_id)
>> +#define LPAIF_CDC_RXTX_WRDMABASE_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x04, (chan), dai_id)
>> +#define LPAIF_CDC_RXTX_WRDMABUFF_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x08, (chan), dai_id)
>> +#define LPAIF_CDC_RXTX_WRDMACURR_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
>> +#define LPAIF_CDC_RXTX_WRDMAPER_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x10, (chan), dai_id)
>> +#define LPAIF_CDC_RXTX_WRDMA_INTF_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x50, (chan), dai_id)
>> +
>> +#define LPAIF_CDC_VA_WRDMACTL_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x00, (chan), dai_id)
>> +#define LPAIF_CDC_VA_WRDMABASE_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x04, (chan), dai_id)
>> +#define LPAIF_CDC_VA_WRDMABUFF_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x08, (chan), dai_id)
>> +#define LPAIF_CDC_VA_WRDMACURR_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
>> +#define LPAIF_CDC_VA_WRDMAPER_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x10, (chan), dai_id)
>> +#define LPAIF_CDC_VA_WRDMA_INTF_REG(v, chan, dai_id) \
>> +    LPAIF_CDC_WRDMA_REG_ADDR(v, 0x50, (chan), dai_id)
>> +
>> +#define __LPAIF_CDC_RDDMA_REG(v, chan, dir, reg, dai_id) \
>> +        (is_rxtx_cdc_dma_port(dai_id) ? 
>> LPAIF_CDC_RXTX_RDMA##reg##_REG(v, chan, dai_id) : \
>> +            LPAIF_CDC_VA_RDMA##reg##_REG(v, chan, dai_id))
>> +
>> +#define __LPAIF_CDC_WRDMA_REG(v, chan, dir, reg, dai_id) \
>> +        (is_rxtx_cdc_dma_port(dai_id) ? 
>> LPAIF_CDC_RXTX_WRDMA##reg##_REG(v, chan, dai_id) : \
>> +            LPAIF_CDC_VA_WRDMA##reg##_REG(v, chan, dai_id))
>> +
>> +#define __LPAIF_CDC_DMA_REG(v, chan, dir, reg, dai_id) \
>> +        ((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
>> +            __LPAIF_CDC_RDDMA_REG(v, chan, dir, reg, dai_id) : \
>> +            __LPAIF_CDC_WRDMA_REG(v, chan, dir, reg, dai_id))
>> +
>> +#define LPAIF_CDC_INTF_REG(v, chan, dir, dai_id) \
>> +        ((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
>> +        LPAIF_CDC_RDMA_INTF_REG(v, chan, dai_id) : \
>> +        LPAIF_CDC_WRDMA_INTF_REG(v, chan, dai_id))
>> +
>> +#define LPAIF_INTF_REG(v, chan, dir, dai_id) \
>> +        (is_cdc_dma_port(dai_id) ? \
>> +        LPAIF_CDC_INTF_REG(v, chan, dir, dai_id) : \
>> +        LPAIF_DMACTL_REG(v, chan, dir, dai_id))
>>     #define LPAIF_DMACTL_BURSTEN_SINGLE    0
>>   #define LPAIF_DMACTL_BURSTEN_INCR4    1
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

