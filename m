Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2158D464C03
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 11:52:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC5092599;
	Wed,  1 Dec 2021 11:51:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC5092599
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638355937;
	bh=hEiFZkksQzRQyGuew8Oc0031DbJI5By30N2tI4LrZjA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jDYgPo2oq/EllihdTmGKQc0czTMiHCdWUi4QvL608QMnRiUuf0ircp/G78DAa3+sY
	 hkjydvIMdnS2uPdqIcRlt1U4L6Dcovp5aVG0FiqwDB+U2r5CJeGQKZ8lF89puwM/Qc
	 IBLkoaRQzPT6c2xbYLrB6bCcR/aICVWqoOeYDmn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A7ECF80249;
	Wed,  1 Dec 2021 11:51:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4460CF80246; Wed,  1 Dec 2021 11:50:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E0A1F80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 11:50:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E0A1F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LjOJIErs"
Received: by mail-wr1-x42e.google.com with SMTP id q3so28369576wru.5
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 02:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iaRWBZ6wVn64G1eYkYsgJ4iKQtxS+t5xqE+mjeZLe9c=;
 b=LjOJIErsYA3H5R/SQ3MD0negXvGCfLzN7pYzmbRI9icpQz6ov+X3wjjzpbSp4pqnko
 pD1xP83AEpwysggEIadi2K24Tft1s86g/mSUuCA9d/EfpZrr7aDhCPEXwV4VwAzg9Spj
 9M4Qya3M8XGahlRBFlyBp+oG0hWjyZ1JLUftiNsKgkGkgyU0y/Z5oOga0mJQU3Q4xzri
 CPA/Z1FFGRhDjJCg2ApbPw9jHL/GJDgPlI2jCPMl/KPZlmHw1zBWQppm75vtf5dQBYfG
 6FV9+D2Jy8jucyR7nkc+Dp2VgTa5xP9E+0IvUHXQGhbIE+r8RbkIfyhwU8ol8hze8rV7
 v8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iaRWBZ6wVn64G1eYkYsgJ4iKQtxS+t5xqE+mjeZLe9c=;
 b=UYIEi1XnOpQiDHPFZtuOhBMFpOnkOP4jVnnNmp/lD8PBXFtjI374acTQI6/bwwP9dj
 SstOPa/2ChYdM+T0XAq9+tVg4YQvltXUC1D1eKshJvHp6iLdI846bMTVHE59C+FM27YQ
 S9EHjOKaS3CHPjIAtDKwkTLug3ptr/gKixnp8wkNzhserogqfjEp1N3wCD4PlxcAB4Er
 ldQNEMFVb2/INCrGgXINRRuzZsYYrkf8v5Dt7I0qThQMsl1Jr39BQCsaheW0OX+yBK1a
 lw5oOrR20nFaQZ7qzUpOOXyzC3A2RNdz/t7A216djxM741wlNoqJ+Nxwg8WYIrvRQLmK
 KXXw==
X-Gm-Message-State: AOAM532dRYW8DpBTgQDamYEztBogOD6qxeUQzVFLbtb58BfHdW2V4+vu
 aD1bIDg6SgQ8We4eUJ8dPrM2zg==
X-Google-Smtp-Source: ABdhPJzUoU308MNHGmdz4H3mCfq+Qg4jBYUexDHukpCokTgVqQC15BFqy/Uc3KNflk686Ows/ubGPA==
X-Received: by 2002:adf:ab53:: with SMTP id r19mr5827984wrc.584.1638355847050; 
 Wed, 01 Dec 2021 02:50:47 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id g18sm853449wmq.4.2021.12.01.02.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 02:50:46 -0800 (PST)
Subject: Re: [PATCH v6 10/10] ASoC: qcom: SC7280: Update config for building
 codec dma drivers
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
 <1637928282-2819-11-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0d51b0fd-61a9-e68f-6ab8-27708667d787@linaro.org>
Date: Wed, 1 Dec 2021 10:50:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637928282-2819-11-git-send-email-srivasam@codeaurora.org>
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
> Add configuration for building SC7280 audio codec dma drivers.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
> This patch set depends on:
>      -- https://patchwork.kernel.org/project/alsa-devel/list/?series=582321
> 
>   sound/soc/qcom/Kconfig  | 13 +++++++++++++
>   sound/soc/qcom/Makefile |  4 ++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 530d01f..b46a2e7 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -20,6 +20,10 @@ config SND_SOC_LPASS_PLATFORM
>   	tristate
>   	select REGMAP_MMIO
>   
> +config SND_SOC_LPASS_CDC_DMA
> +	tristate
> +	select REGMAP_MMIO
> +
>   config SND_SOC_LPASS_IPQ806X
>   	tristate
>   	select SND_SOC_LPASS_CPU
> @@ -36,6 +40,13 @@ config SND_SOC_LPASS_SC7180
>   	select SND_SOC_LPASS_PLATFORM
>   	select SND_SOC_LPASS_HDMI
>   
> +config SND_SOC_LPASS_SC7280
> +	tristate
> +	select SND_SOC_LPASS_CPU
> +	select SND_SOC_LPASS_PLATFORM
> +	select SND_SOC_LPASS_HDMI
> +	select SND_SOC_LPASS_CDC_DMA
> +
>   config SND_SOC_STORM
>   	tristate "ASoC I2S support for Storm boards"
>   	select SND_SOC_LPASS_IPQ806X
> @@ -156,7 +167,9 @@ config SND_SOC_SC7280
>   	tristate "SoC Machine driver for SC7280 boards"
>   	depends on I2C && SOUNDWIRE || COMPILE_TEST
>   	select SND_SOC_QCOM_COMMON
> +	select SND_SOC_LPASS_SC7280
>   	select SND_SOC_MAX98357A
> +	select SND_SOC_WCD938X

Why are we updating machine Kconfigs in this patch, should that be not 
in your machine driver patch series?

I think I did point this out in previous versions too.


--srini


>   	select SND_SOC_LPASS_RX_MACRO
>   	select SND_SOC_LPASS_TX_MACRO
>   	help
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 625aec6..8b7b876 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -1,18 +1,22 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # Platform
>   snd-soc-lpass-cpu-objs := lpass-cpu.o
> +snd-soc-lpass-cdc-dma-objs := lpass-cdc-dma.o
>   snd-soc-lpass-hdmi-objs := lpass-hdmi.o
>   snd-soc-lpass-platform-objs := lpass-platform.o
>   snd-soc-lpass-ipq806x-objs := lpass-ipq806x.o
>   snd-soc-lpass-apq8016-objs := lpass-apq8016.o
>   snd-soc-lpass-sc7180-objs := lpass-sc7180.o
> +snd-soc-lpass-sc7280-objs := lpass-sc7280.o
>   
>   obj-$(CONFIG_SND_SOC_LPASS_CPU) += snd-soc-lpass-cpu.o
> +obj-$(CONFIG_SND_SOC_LPASS_CDC_DMA) += snd-soc-lpass-cdc-dma.o
>   obj-$(CONFIG_SND_SOC_LPASS_HDMI) += snd-soc-lpass-hdmi.o
>   obj-$(CONFIG_SND_SOC_LPASS_PLATFORM) += snd-soc-lpass-platform.o
>   obj-$(CONFIG_SND_SOC_LPASS_IPQ806X) += snd-soc-lpass-ipq806x.o
>   obj-$(CONFIG_SND_SOC_LPASS_APQ8016) += snd-soc-lpass-apq8016.o
>   obj-$(CONFIG_SND_SOC_LPASS_SC7180) += snd-soc-lpass-sc7180.o
> +obj-$(CONFIG_SND_SOC_LPASS_SC7280) += snd-soc-lpass-sc7280.o
>   
>   # Machine
>   snd-soc-storm-objs := storm.o
> 
