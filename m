Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E649219C47
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 11:30:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 069E51655;
	Thu,  9 Jul 2020 11:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 069E51655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594287024;
	bh=/0nugwVRVA99NTIzUswuImxp86yxsi5zFPKvT8S51lM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ShVLHvit2jFq4YTuqlQIxMul/LIHQ0NC6qxOauavGllEwRD1JYZO1NzzQG5zuN/Ks
	 X/PHzdtHDoV9YqWmxMc87TCof3rSHC7/He54H6D/7sXmaRJ3mH/wXdX0DMKHolqsU/
	 0Sn6F/Egx5pT/zIO/0HgiD/4OyReIlAMp2U4aSl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF525F802E1;
	Thu,  9 Jul 2020 11:27:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A29F802D2; Thu,  9 Jul 2020 11:27:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CE29F802BE
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 11:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CE29F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="C70Q1X38"
Received: by mail-wm1-x343.google.com with SMTP id g10so5820612wmc.1
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 02:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FMsIKqz0TQneom1juHBrnPr4+LEkvs5/fxv1IIE3XgY=;
 b=C70Q1X38U223aCxs3FuOSpOTlYanEEPYXT0t+3DaQrYJWv09II/lPp5kqQs7gQ2VcN
 uN2igTC0DKNVTINBl+iTe2eiZIrOVoDJU47iAHJB1cEdHgJerHBzasRcCR6Ck/Cwss2o
 49uYuYdqW2tnrw7c94AbG7DSmTxaROH+jwViikAJfdNJFiQ0aIQvQWiBTR5mAPTC9vvT
 P8akeXqEr8JZ/5Gysl0VTyvZJewLN/pebHicUXKXKalBV/Xn5Q19HnoZ6v+PvtIoRx+/
 HyD0QfsBAIlQwElCRFFWr2fIyZvM8NTZgpeMvSb5K+Ey2WqJOH4khwPyNb2zxVjHzebp
 B79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FMsIKqz0TQneom1juHBrnPr4+LEkvs5/fxv1IIE3XgY=;
 b=Wph4n3rioDVOP5lnPUAstVzFaEUO3pVLP8EXp+cn9ow04f7pv/kUF4SryhriO0u1QC
 7QfTrUGOKepED/+VaqwjAw1Bfm+v6TuY51fPjGcU8bMWFgGmdk/jgpgOsLxLrDZPC7bD
 YcpJVPg8O7hMKzIZrStxdZqSFOW2LSGrvaG3PnN9tpqCrudAA/MfeUpg0Ft/crPmdMeN
 WUsoHKh8rYkEvedUmyGY+ZVMNzEfRZYsmlAtljd/uvSjuZ/VbmA/SH95K6daRbzGOmRJ
 rjbLhXsJTD4Mv0EgpNv+mHEUPDxKIRkCtlovPR5iyBo5lsvEsgO0aDbEUa1qldRVQNKA
 OqAg==
X-Gm-Message-State: AOAM533aZEoNQjMUqf/OFe4AQS6GsBLnB9513+YztsiQWGn3Z35uJxkg
 ASIX2ivfjNVQAusMiqedaFw5Yg==
X-Google-Smtp-Source: ABdhPJx87vQ0PwnhiI1ahJoRP9NqWJA8+wddTTJt2k6+Vxk0Mt82SqkDwaPOMXauL4B2pMFUp5h+rQ==
X-Received: by 2002:a7b:c4d6:: with SMTP id g22mr13843098wmk.170.1594286820618; 
 Thu, 09 Jul 2020 02:27:00 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id 65sm4081184wmd.20.2020.07.09.02.26.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 02:27:00 -0700 (PDT)
Subject: Re: [PATCH v3 5/8] ASoC: qcom: lpass-platform: Replace card->dev with
 component->dev
To: Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-6-git-send-email-rohitkr@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <61b45372-2e84-9695-b99f-4839d507bb4e@linaro.org>
Date: Thu, 9 Jul 2020 10:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594184896-10629-6-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Ajit Pandey <ajitp@codeaurora.org>
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



On 08/07/2020 06:08, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> We are allocating dma memory for component->dev but trying to mmap
> such memory for substream->pcm->card->dev. Replace device argument
> in mmap with component->dev to fix this.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-platform.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 445ca193..f9424cc 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -472,9 +472,8 @@ static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
>   {
>   	struct snd_pcm_runtime *runtime = substream->runtime;
>   
> -	return dma_mmap_coherent(substream->pcm->card->dev, vma,
> -			runtime->dma_area, runtime->dma_addr,
> -			runtime->dma_bytes);
> +	return dma_mmap_coherent(component->dev, vma, runtime->dma_area,
> +				 runtime->dma_addr, runtime->dma_bytes);
>   }
>   
>   static irqreturn_t lpass_dma_interrupt_handler(
> 
