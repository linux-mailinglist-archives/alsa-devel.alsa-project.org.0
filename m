Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DBA2C64E8
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 961091846;
	Fri, 27 Nov 2020 13:10:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 961091846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606479099;
	bh=iyFxpgZRGwB0Tu/VCoiuumoSy9Fq6NENJPBOd5lS3iU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SbOLDlQmLQ+odmsQrwsOEoVPI0AV6hrNhzXLxVB1vCXPhRmyUjfHSKBAl45mt+smi
	 0vrya6nd695aD+eGLnCnv6nUc2FCbnj7RASF0E89J8Sb7PlSOtKcg8CtLGq4Vxyl/D
	 S6Rvrp4ZRL32t/rBPO3g5zIZggZMJ3mBL5U4yAUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DF35F80218;
	Fri, 27 Nov 2020 13:10:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D10CF8019D; Fri, 27 Nov 2020 13:10:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAE09F800E0
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 13:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAE09F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HD0g/xb6"
Received: by mail-wr1-x442.google.com with SMTP id 23so5346974wrc.8
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 04:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Asqct0DSkmui/624U1aTT6HUn2Jr+y44t573X8ecn1I=;
 b=HD0g/xb6TLZtBPVVfmoTpSeb1IQLHkmwP9ZMYhDyLk6bMzNQBR7yjV522waHdonR5d
 eyUizTJEBAWsAIqaTrv0JY7FjHfAmsg/rozRl79/Y8wXJgfYFZhYsZACB1ZQNetmy2PE
 R3x+O0etGRUdcC732kOXg630hGy5sOkpvMnYEn/whuIjuSTFCf34crBSbEX4aucH4t1c
 F4yXxGxRFSEisgheuzx3ODNYfi83aUyhJJsF3pB7WkXVPh164D1zads/oTX0oDK5dQFG
 zLj2vIzAE97wgmBEUK5BDPCLYC3dV9vYws8kzzjDyfzPA+bLkq8Vkk/dlhj1qemuMGdP
 e8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Asqct0DSkmui/624U1aTT6HUn2Jr+y44t573X8ecn1I=;
 b=mUE95XwYBmQh6f54PFTQ8HCG8izHHy2dBU7AFqKKBBW0GWy7lyQoUqeeOUGsjmzhbX
 bimutnii6DPw4ZUhOzva4m3TIOrxHKD8yeQPt8vdp/6zPcxlC+2ydHG61v8uZ925NxFQ
 GyelG6PMpxuUFw13oIcLc19OG6M6iMiJDruN58h/hqBPV3NpDaZEwu4HjFGMa+cr7R4H
 jhcGgnBtZax9b+F22iAtJOXJ2zCxp6jnOzzTyWfWt44P4BF7F/K4CH1RWLr0qOeQKpoY
 EcGn4isvdPau4EKD5l8fcp0yMazXH0oqx5VHXvXQz06q7z/30adFaiZICo7vAvTYsImG
 2Low==
X-Gm-Message-State: AOAM530GdIg3CiyYPz2TiEaOwNvc3CwcoTD7Mt6vqfEu5UboRl3KDkDi
 2reNAvkGtsDf98DQMQv+NK77tg==
X-Google-Smtp-Source: ABdhPJwk9Q/m7ZsZoPuHbodu+4dr0DtmJ92+OAyIXQLH3mTtHoc3PFsRMoMDRX7Ioh6bQJX2nHIWPg==
X-Received: by 2002:adf:f0c2:: with SMTP id x2mr9907638wro.184.1606478994658; 
 Fri, 27 Nov 2020 04:09:54 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id t20sm13916831wmi.3.2020.11.27.04.09.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Nov 2020 04:09:53 -0800 (PST)
Subject: Re: [PATCH v3] ASoC: qcom: Fix playback recover problem in suspend
 resume
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1606470988-26965-1-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1146040c-5559-f4bf-fafe-eb7468e577a0@linaro.org>
Date: Fri, 27 Nov 2020 12:09:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1606470988-26965-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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



On 27/11/2020 09:56, Srinivasa Rao Mandadapu wrote:
> To support playback continuation after hard suspend(bypass powerd)
>   and resume:
> Prepare device in  platform trigger callback.
> Make I2s and DMA control registers as non volatile.
Looks like there are two changes here, One is fixing the volatile registers!


Other is preparing device after suspend!

Consider splitting them!

> 

Fixes tag is missing here?

> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
> Changes Since v1 and v2:
>    -- Subject lines changed
> 
>   sound/soc/qcom/lpass-cpu.c      | 8 ++------
>   sound/soc/qcom/lpass-platform.c | 5 +++--
>   2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index af684fd..c99be03 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -454,20 +454,16 @@ static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
>   	struct lpass_variant *v = drvdata->variant;
>   	int i;
>   
> -	for (i = 0; i < v->i2s_ports; ++i)
> -		if (reg == LPAIF_I2SCTL_REG(v, i))
> -			return true;
>   	for (i = 0; i < v->irq_ports; ++i)
>   		if (reg == LPAIF_IRQSTAT_REG(v, i))
>   			return true;
>   
>   	for (i = 0; i < v->rdma_channels; ++i)
> -		if (reg == LPAIF_RDMACURR_REG(v, i) || reg == LPAIF_RDMACTL_REG(v, i))
> +		if (reg == LPAIF_RDMACURR_REG(v, i))
>   			return true;
>   
>   	for (i = 0; i < v->wrdma_channels; ++i)
> -		if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start) ||
> -			reg == LPAIF_WRDMACTL_REG(v, i + v->wrdma_channel_start))
> +		if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start))
>   			return true;
>   
>   	return false;
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 80b09de..2b0a7c1 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -481,8 +481,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   		return -ENOTRECOVERABLE;
>   	}
>   	switch (cmd) {
> -	case SNDRV_PCM_TRIGGER_START:
>   	case SNDRV_PCM_TRIGGER_RESUME:
> +		lpass_platform_pcmops_prepare(component, substream);

Can you elaborate the actual issue here?

Are any other registers needs to re-programmed??

Does it make sense to use
regcache_mark_dirty()
regcache_sync() in pm suspend resume path,
instead of calling prepare explicitly?


--srini


> +	case SNDRV_PCM_TRIGGER_START:
>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>   		ret = regmap_fields_write(dmactl->enable, id,
>   						 LPAIF_DMACTL_ENABLE_ON);
> @@ -592,7 +593,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   		break;
>   	}
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
> 
