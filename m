Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C54341926D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 12:44:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90B5E168B;
	Mon, 27 Sep 2021 12:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90B5E168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632739470;
	bh=UpCvAc3jLOWEoezi89c2fuwzt7EXeLVDGJHQVvE+zqU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hVMcDjZcKpOsnur6RRe2rU5UvhNdWlVx2N3wdKLpfOAqx5Bvr7t52ZmHeix/rj5rp
	 CrTpnq4Klf0XW0ID4jEFJmPfvM43FuJPnR7Kk5ayUtmtYm/Ah4Kgg2MwMjUA02KJgi
	 0kdKyK3kfFQY/2QazGDyk6lrwlSig6ztEYsiznCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E4F5F80272;
	Mon, 27 Sep 2021 12:43:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFF12F8026D; Mon, 27 Sep 2021 12:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A338F801EC
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 12:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A338F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kDhQYXhc"
Received: by mail-wm1-x329.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so77119wmq.1
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 03:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bl3l80PLJwDnjPoaNYbvG3Z+vfpuSPjJGAmYGrPl1Y4=;
 b=kDhQYXhctmPax8BWT4MUKhzXGoZ8mPx8LMLOINhqUYV3MUr4X0A/ZLvxTikNd6/CA8
 WvBFrCd1W/Wnl0wf9u1H9Tb1Yb/C0Ud0C1JWmey+IcaZvCuAjJc2M5GgPuIFR8H5YcI0
 6f9L6Y5scExb76lRh4gJt+2rp52cbmlZWbogJQIm78QLF17Jbek0MGib2KUpFkoDG7MR
 4oIxmxM+E5kEO1zKdYS0ZcOyjoFfON66Jnpww5Q6aSWfebCLXkkicXZbwG3tbGUvEbgJ
 VCqOT21vRQoqaUULj/6I5NLuv90AGBsvVxhpsgN3rkKqM8puquBoZOANORH09LfxsiRl
 i5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bl3l80PLJwDnjPoaNYbvG3Z+vfpuSPjJGAmYGrPl1Y4=;
 b=tChSuSORE9biUz0D53ox6KllZ2HLfL3XbV2MzApwIE5kIGmhMyVXzW2QXRQNgMgvjt
 Juw2nyGFoLYFT2FrTTxlZNLsqiiBgd8szU3LIdAVgVg/DeE/A/BUGWKI3++RbogAgnP5
 QS8EOy0VQiLXJUQUX0jQp33DAWG5B4xxsoAIm1TELVPiDNXEjKETzzC5EX/08m7gTU4K
 lIVFRSzxy1jyhIGoM03V9UqP0kD1xtTjbSmk91SBMz8KSx/SH5Anz1nRmoaRVVr7Wsse
 K0emuyauafOfkZoyW929rN7OM+iMPAwyky41p5ppCxm2rSlynmqiU/dTZUYOOLqi4ZZX
 uzlA==
X-Gm-Message-State: AOAM533RbSqCIbIZtnYs4gwMSaz6EI7aUU3LcqJkif1hxetvRnXR7/NV
 wM1FbwIfj2cuceBpH+YgYQHsjA==
X-Google-Smtp-Source: ABdhPJyPrHcwo/l44zFRoQnD/3cTUE6JBsBv7AeTjSfz3ViSTlBXNAeTSvaNS50OEFWy78/iNPp4+w==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr15176884wml.109.1632739374619; 
 Mon, 27 Sep 2021 03:42:54 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id i18sm16528281wrn.64.2021.09.27.03.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 03:42:54 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] ASoC: codecs: tx-macro: Update tx default values
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <agross@kernel.org; bjorn.andersson@linaro.org;
 lgirdwood@gmail.com; broonie@kernel.org;robh+dt@kernel.org;
 plai@codeaurora.org; bgoswami@codeaurora.org; perex@perex.cz;
 tiwai@suse.com;srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org;
 linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org;
 devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
 swboyd@chromium.org; judyhsiao@chromium.org;>
 <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
 <1632313878-12089-5-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e65c77f4-766c-a5ce-9cbd-f1697c1be28c@linaro.org>
Date: Mon, 27 Sep 2021 11:42:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1632313878-12089-5-git-send-email-srivasam@codeaurora.org>
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



On 22/09/2021 13:31, Srinivasa Rao Mandadapu wrote:
> Update mic control register default values to hardware reset values
> 
> Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for lpass tx macro)
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/codecs/lpass-tx-macro.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index e980b2e..66c39fb 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -279,7 +279,7 @@ static const struct reg_default tx_defaults[] = {
>   	{ CDC_TX_CLK_RST_CTRL_SWR_CONTROL, 0x00},
>   	{ CDC_TX_TOP_CSR_TOP_CFG0, 0x00},
>   	{ CDC_TX_TOP_CSR_ANC_CFG, 0x00},
> -	{ CDC_TX_TOP_CSR_SWR_CTRL, 0x00},
> +	{ CDC_TX_TOP_CSR_SWR_CTRL, 0x60},

This does not make sense as this register only has one bit to control.
Why do we even need to change this, can you please explain what happens 
if we do not change this?

>   	{ CDC_TX_TOP_CSR_FREQ_MCLK, 0x00},
>   	{ CDC_TX_TOP_CSR_DEBUG_BUS, 0x00},
>   	{ CDC_TX_TOP_CSR_DEBUG_EN, 0x00},
> @@ -290,8 +290,8 @@ static const struct reg_default tx_defaults[] = {
>   	{ CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0x00},
>   	{ CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0x00},
>   	{ CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0x00},
> -	{ CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x00},
> -	{ CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x00},
> +	{ CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x0E},
> +	{ CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x0E},

These two registers should have default value of 0x06 as this has only 
one clk selection field with bits 2:1.

-srini


>   	{ CDC_TX_INP_MUX_ADC_MUX0_CFG0, 0x00},
>   	{ CDC_TX_INP_MUX_ADC_MUX0_CFG1, 0x00},
>   	{ CDC_TX_INP_MUX_ADC_MUX1_CFG0, 0x00},
> 
