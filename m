Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E1946508E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 15:53:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F4F52592;
	Wed,  1 Dec 2021 15:52:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F4F52592
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638370398;
	bh=az8CbRo6oHLR9VIfukZjvNEJ5OIdvozS3rfH5YO0VDI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EeUWgQmDvVySgP2iNUhEkcq/fzDYumkySKHI8EbF82/XGON/AR5erMN7qLijTd7pV
	 7P1W+mRniaDYDzul1CLYp/ivOlS2F5hO2k3hrXTlMkSe538hmx1GR3jUyFvk80WgFz
	 GGbYIWWTZ8IoBJh8GYHm3VMTzRHnORd2ruobPzws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72E1BF804F2;
	Wed,  1 Dec 2021 15:51:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A271CF804F1; Wed,  1 Dec 2021 15:51:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBE06F804EC
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 15:51:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBE06F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="snBW4l7B"
Received: by mail-wm1-x32b.google.com with SMTP id p18so20605992wmq.5
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 06:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yr5rq6t2AKiepL38KYDfvMWLk1dP+7OM81GuA107hdI=;
 b=snBW4l7BisBgNiqUHxJzAAk7pjLMWGpuoYOj+zlhYosPAPTVzNkNmN5Q9cimcyQZs0
 ALBktbo5+EAuxpiX7D7VB0hbnNR3Lv4iCmWukgqP2YbLDkbC+6Ij40mAlXw0Egpnlt0k
 JxZ1dJvV+SeGVWotxEdMIvInirwnkVDYfOzeqJWlTr56H/LZLZzw4/1YzIbFlpxsOVxA
 FZjG2EzwqhmwGqo2Nh1ZYkL1opv0xXt4QbbTO0PPiIyMAZ+VLMz3IpK0mkqNRE8KFfn3
 YlPRqdltiS3M+iC7DCE4Pos2QjGI9jsBw/zCVUumxYHpfgO5OXFyRYZTCmt3NHBny1Wn
 BEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yr5rq6t2AKiepL38KYDfvMWLk1dP+7OM81GuA107hdI=;
 b=uH5hEgbhhGeCmxODObotl9TIiBHnQIKje89DoizHS33M7vTQVw/YRhqnh3vGlBtFX2
 UHe5N6YN5wYxXPCjYsP2DJtxnoV/EsvIG+xWKOuQHgtt8Qj7eNxnLTpw0YLN6HVPuaem
 NkcZvpgOXB58UjbavrYh8ORgpCYd2ivQzZ17sIDgDvOyI2K5aDAOwQX/QKkOrfHfd1RD
 NaMFfZHwkesU/Rc/x3YaoWiQbC3BY029MYc4bC9XfYLsedkijcMC2h64ipave4oHW0uY
 4pCzcH0SLBPVnToHBeLg9cBG3i4fARCxWD/23OBVkGIIc/loP0g6iY1fDb3JTdBtjkGo
 A6XQ==
X-Gm-Message-State: AOAM532XYL64mDtWBRdjBNQ9z9Gz73LqNDxY3QByKt1UyVF7XuNL1AHD
 Pmj+s8f32iUWdtW9gFZNaGmp9Q==
X-Google-Smtp-Source: ABdhPJxLT35K7pYT/++GMzIKWgjHLBpTXTs4n1CmJt8QwDjTKzXHzvXGAomjxK7lZ8oQ1jEnzasF6A==
X-Received: by 2002:a1c:9d03:: with SMTP id g3mr7351565wme.143.1638370301895; 
 Wed, 01 Dec 2021 06:51:41 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id bg34sm1337662wmb.47.2021.12.01.06.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 06:51:41 -0800 (PST)
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
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3bb4aea6-2f47-8b6b-e7a9-1518d478e32d@linaro.org>
Date: Wed, 1 Dec 2021 14:51:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637928282-2819-4-git-send-email-srivasam@codeaurora.org>
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
> This patch adds register definitions for codec read dma and write dma
> lpass interface.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-lpaif-reg.h | 103 ++++++++++++++++++++++++++++++++++++---
>   1 file changed, 97 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
> index 2eb03ad..697a11f 100644
> --- a/sound/soc/qcom/lpass-lpaif-reg.h
> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
> @@ -74,6 +74,16 @@
>   #define LPAIF_IRQSTAT_REG(v, port)	LPAIF_IRQ_REG_ADDR(v, 0x4, (port))
>   #define LPAIF_IRQCLEAR_REG(v, port)	LPAIF_IRQ_REG_ADDR(v, 0xC, (port))
>   
> +/* LPAIF RXTX IRQ */
> +#define LPAIF_RXTX_IRQ_REG_ADDR(v, addr, port, dai_id) \
> +		((dai_id == LPASS_CDC_DMA_RX0 || dai_id == LPASS_CDC_DMA_TX3) ? \
> +		(v->rxtx_irq_reg_base + (addr) + v->rxtx_irq_reg_stride * (port)) : \
> +		(v->va_irq_reg_base + (addr) + v->va_irq_reg_stride * (port)))
> +
> +#define LPAIF_RXTX_IRQEN_REG(v, port, dai_id) LPAIF_RXTX_IRQ_REG_ADDR(v, 0x0, port, dai_id)
> +#define LPAIF_RXTX_IRQSTAT_REG(v, port, dai_id) LPAIF_RXTX_IRQ_REG_ADDR(v, 0x4, port, dai_id)
> +#define LPAIF_RXTX_IRQCLEAR_REG(v, port, dai_id) LPAIF_RXTX_IRQ_REG_ADDR(v, 0xC, port, dai_id)
> +

How about doing like this:


/* LPAIF RXTX IRQ */
#define LPAIF_RXTX_IRQ_REG_ADDR(v, addr, port) \
		(v->rxtx_irq_reg_base + (addr) + v->rxtx_irq_reg_stride * (port))

#define LPAIF_RXTX_IRQEN_REG(v, port, dai_id) LPAIF_RXTX_IRQ_REG_ADDR(v, 
0x0, port)
#define LPAIF_RXTX_IRQSTAT_REG(v, port, dai_id) 
LPAIF_RXTX_IRQ_REG_ADDR(v, 0x4, port)
#define LPAIF_RXTX_IRQCLEAR_REG(v, port, dai_id) 
LPAIF_RXTX_IRQ_REG_ADDR(v, 0xC, port)

/* LPAIF VA IRQ */
#define LPAIF_VA_IRQ_REG_ADDR(v, addr, port) \
		(v->va_irq_reg_base + (addr) + v->va_irq_reg_stride * (port))

#define LPAIF_VA_IRQEN_REG(v, port, dai_id) LPAIF_VA_IRQ_REG_ADDR(v, 
0x0, port)
#define LPAIF_VA_IRQSTAT_REG(v, port, dai_id) LPAIF_VA_IRQ_REG_ADDR(v, 
0x4, port)
#define LPAIF_VA_IRQCLEAR_REG(v, port, dai_id) LPAIF_VA_IRQ_REG_ADDR(v, 
0xC, port)



>   
>   #define LPASS_HDMITX_APP_IRQ_REG_ADDR(v, addr)  \
>   	((v->hdmi_irq_reg_base) + (addr))
> @@ -139,12 +149,93 @@
>   		(LPAIF_INTFDMA_REG(v, chan, reg, dai_id)) : \
>   		LPAIF_WRDMA##reg##_REG(v, chan))
>   
> -#define LPAIF_DMACTL_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, CTL, dai_id)
> -#define LPAIF_DMABASE_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, BASE, dai_id)
> -#define	LPAIF_DMABUFF_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, BUFF, dai_id)
> -#define LPAIF_DMACURR_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, CURR, dai_id)
> -#define	LPAIF_DMAPER_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, PER, dai_id)
> -#define	LPAIF_DMAPERCNT_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, PERCNT, dai_id)
> +#define LPAIF_DMACTL_REG(v, chan, dir, dai_id)  \
> +	(((dai_id == LPASS_CDC_DMA_RX0) || \
> +	(dai_id == LPASS_CDC_DMA_TX3) || \
> +	(dai_id == LPASS_CDC_DMA_VA_TX0)) ? \
> +	__LPAIF_CDC_DMA_REG(v, chan, dir, CTL, dai_id) : \
> +	__LPAIF_DMA_REG(v, chan, dir, CTL, dai_id))


How about:

#define LPAIF_DMACTL_REG(v, chan, dir, dai_id)  \
	is_cdc_dma_port(dai_id) ? \
	__LPAIF_CDC_DMA_REG(v, chan, dir, CTL, dai_id) : \
	__LPAIF_DMA_REG(v, chan, dir, CTL, dai_id)


simillar comments to most of the macros in this patch that are directly 
comparing the dai_ids.


> +#define LPAIF_DMABASE_REG(v, chan, dir, dai_id) \
> +	((dai_id == LPASS_CDC_DMA_RX0 || \
> +	dai_id == LPASS_CDC_DMA_TX3 || \
> +	dai_id == LPASS_CDC_DMA_VA_TX0) ? \
> +	__LPAIF_CDC_DMA_REG(v, chan, dir, BASE, dai_id) : \
> +	__LPAIF_DMA_REG(v, chan, dir, BASE, dai_id))
> +#define LPAIF_DMABUFF_REG(v, chan, dir, dai_id) \
> +	((dai_id == LPASS_CDC_DMA_RX0 || \
> +	dai_id == LPASS_CDC_DMA_TX3 || \
> +	dai_id == LPASS_CDC_DMA_VA_TX0) ? \
> +	__LPAIF_CDC_DMA_REG(v, chan, dir, BUFF, dai_id) : \
> +	__LPAIF_DMA_REG(v, chan, dir, BUFF, dai_id))
> +#define LPAIF_DMACURR_REG(v, chan, dir, dai_id) \
> +	((dai_id == LPASS_CDC_DMA_RX0 || \
> +	dai_id == LPASS_CDC_DMA_TX3 || \
> +	dai_id == LPASS_CDC_DMA_VA_TX0) ? \
> +	__LPAIF_CDC_DMA_REG(v, chan, dir, CURR, dai_id) : \
> +	__LPAIF_DMA_REG(v, chan, dir, CURR, dai_id))
> +#define LPAIF_DMAPER_REG(v, chan, dir, dai_id)  \
> +	((dai_id == LPASS_CDC_DMA_RX0 || \
> +	dai_id == LPASS_CDC_DMA_TX3 || \
> +	dai_id == LPASS_CDC_DMA_VA_TX0) ? \
> +	__LPAIF_CDC_DMA_REG(v, chan, dir, PER, dai_id) : \
> +	__LPAIF_DMA_REG(v, chan, dir, PER, dai_id))
> +#define LPAIF_DMAPERCNT_REG(v, chan, dir, dai_id) \
> +	((dai_id == LPASS_CDC_DMA_RX0 || \
> +	dai_id == LPASS_CDC_DMA_TX3 || \
> +	dai_id == LPASS_CDC_DMA_VA_TX0) ? \
> +	__LPAIF_CDC_DMA_REG(v, chan, dir, PERCNT, dai_id) : \
> +	__LPAIF_DMA_REG(v, chan, dir, PERCNT, dai_id))
> +
> +#define LPAIF_CDC_RDMA_REG_ADDR(v, addr, chan, dai_id) \
> +	((dai_id == LPASS_CDC_DMA_RX0 || dai_id == LPASS_CDC_DMA_TX3) ? \
> +	(v->rxtx_rdma_reg_base + (addr) + v->rxtx_rdma_reg_stride * (chan)) : \
> +	(v->va_rdma_reg_base + (addr) + v->va_rdma_reg_stride * (chan)))
> +
> +#define LPAIF_CDC_RDMACTL_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x00, (chan), dai_id)
> +#define LPAIF_CDC_RDMABASE_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x04, (chan), dai_id)
> +#define LPAIF_CDC_RDMABUFF_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x08, (chan), dai_id)
> +#define LPAIF_CDC_RDMACURR_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
> +#define LPAIF_CDC_RDMAPER_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x10, (chan), dai_id)
> +
> +#define LPAIF_CDC_RDMA_INTF_REG(v, chan, dai_id) \
> +	LPAIF_CDC_RDMA_REG_ADDR(v, 0x50, (chan), dai_id)
> +
> +#define LPAIF_CDC_WRDMA_REG_ADDR(v, addr, chan, dai_id) \
> +	((dai_id == LPASS_CDC_DMA_RX0 || dai_id == LPASS_CDC_DMA_TX3) ? \
> +	(v->rxtx_wrdma_reg_base + (addr) + \
> +	v->rxtx_wrdma_reg_stride * (chan - v->rxtx_wrdma_channel_start)) : \
> +	(v->va_wrdma_reg_base + (addr) + \
> +	v->va_wrdma_reg_stride * (chan - v->va_wrdma_channel_start)))

Can we split this to LPAIF_CDC_TXRX_WRDMA_REG_ADDR and
LPAIF_CDC_VA_WRDMA_REG_ADDR macros?

--srini

> +
> +#define LPAIF_CDC_WRDMACTL_REG(v, chan, dai_id) \
> +	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x00, (chan), dai_id)
> +#define LPAIF_CDC_WRDMABASE_REG(v, chan, dai_id) \
> +	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x04, (chan), dai_id)
> +#define LPAIF_CDC_WRDMABUFF_REG(v, chan, dai_id) \
> +	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x08, (chan), dai_id)
> +#define LPAIF_CDC_WRDMACURR_REG(v, chan, dai_id) \
> +	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
> +#define LPAIF_CDC_WRDMAPER_REG(v, chan, dai_id) \
> +	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x10, (chan), dai_id)
> +#define LPAIF_CDC_WRDMA_INTF_REG(v, chan, dai_id) \
> +	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x50, (chan), dai_id)
> +
> +#define __LPAIF_CDC_DMA_REG(v, chan, dir, reg, dai_id)  \
> +		((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
> +		(LPAIF_CDC_RDMA##reg##_REG(v, chan, dai_id)) : \
> +		LPAIF_CDC_WRDMA##reg##_REG(v, chan, dai_id))
> +
> +#define LPAIF_CDC_INTF_REG(v, chan, dir, dai_id) \
> +		((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
> +		LPAIF_CDC_RDMA_INTF_REG(v, chan, dai_id) : \
> +		LPAIF_CDC_WRDMA_INTF_REG(v, chan, dai_id))
> +
> +#define LPAIF_INTF_REG(v, chan, dir, dai_id) \
> +		((dai_id == LPASS_CDC_DMA_RX0 || \
> +		dai_id == LPASS_CDC_DMA_TX3 || \
> +		dai_id == LPASS_CDC_DMA_VA_TX0) ? \
> +		LPAIF_CDC_INTF_REG(v, chan, dir, dai_id) : \
> +		LPAIF_DMACTL_REG(v, chan, dir, dai_id))
>   
>   #define LPAIF_DMACTL_BURSTEN_SINGLE	0
>   #define LPAIF_DMACTL_BURSTEN_INCR4	1
> 
