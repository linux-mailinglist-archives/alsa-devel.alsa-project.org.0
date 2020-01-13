Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5716113AAC9
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:23:42 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB90F1875;
	Mon, 13 Jan 2020 15:09:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB90F1875
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46325F801EB;
	Mon, 13 Jan 2020 15:08:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AC11F801EB; Mon, 13 Jan 2020 15:08:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E4C9F800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 15:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E4C9F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="id32scTt"
Received: by mail-wr1-x444.google.com with SMTP id d16so8695350wre.10
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 06:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6brqNIXVo1X+/WBaKssbUapnE1dHmqqu6FP7b2WIQ5c=;
 b=id32scTtrrtfO7CyDkdlCH7EkcUDthTQFmSQbzFz/NAY8OmyeF2PcoHgdmkDjJh1vM
 2wCIDTFZfFpZodp6ftTBnhIQTVM+PQVSVAoNuYqnVgb45BaREz43QE+Mces+m0bohY7Q
 IBsfvS31qLtphLSyLO/mJSTH7wUQyn7uzaIViP7cSXf1Has5q1FrQzgfe2WGXDT3gmoV
 5tSlsJWSJHfSxvw8WVnVGRLsHkNHI9KO40JwUAbnOj/ibO8zwlXwBlDWaMaFgIfaFD3x
 CKdlS5R4G3YOVBf0EjmfHM2WBgpO37M6P1T9yi/dSjlC0bdn3Q3RZhlTMAECDNmuJtyd
 7gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6brqNIXVo1X+/WBaKssbUapnE1dHmqqu6FP7b2WIQ5c=;
 b=oYBgrauzDcpwEDwSngo8bYDT5998hHbuFGLkG1Cqo5s3TevZOt5KQOTLwOtBWjzO1J
 q5BYIwGHkpvZowy2TVi4o9JYakS2AsneSBUu5Lm7vbS6x5zub9/0T9Rj/tOwhmwxDQA9
 0VBOTSqXV417+ZxuZCY4WB0W0M+iKMO+oCEAYGerNhYdhlgFYRByK1o7dpJPB1bT46kK
 RtD2v1wk8pDL44bkIlDyZiCy3IkH9GRRoC62ojwHjL48ePFjjLGNZLxTonfYHcka3zwP
 sjZzMsCdv8H6Aq9AaZP6kkrIQVLTIGKmxkKPE7KJjcmFHvKOq536nRkHs6pBBVamnoav
 Yx0w==
X-Gm-Message-State: APjAAAUJrkV4VRz+cc/cmzQfErih4cAVo60nPdaEJ7KY2wVBheRBN8Nz
 4v4etq/6h3KbeJRrwdxCAhnxmQ==
X-Google-Smtp-Source: APXvYqzXvkK6eyrdk98XbNT11Vg/d+Fd1hjAAc5Oi0ry63EBpw4YxmkhWTxZ8lMb8G4ryS8fxQ75JA==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr19500191wrv.148.1578924515464; 
 Mon, 13 Jan 2020 06:08:35 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id n67sm14944863wmf.46.2020.01.13.06.08.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jan 2020 06:08:34 -0800 (PST)
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20200111164006.43074-1-stephan@gerhold.net>
 <20200111164006.43074-3-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <faf8cd28-999b-54c2-2ee6-b5179a917aef@linaro.org>
Date: Mon, 13 Jan 2020 14:08:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200111164006.43074-3-stephan@gerhold.net>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [alsa-devel] [PATCH 2/4] ASoC: msm8916-wcd-analog: Fix MIC BIAS
	Internal1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 11/01/2020 16:40, Stephan Gerhold wrote:
> MIC BIAS Internal1 is broken at the moment because we always
> enable the internal rbias resistor to the TX2 line (connected to
> the headset microphone), rather than enabling the resistor connected
> to TX1.
> 
> Move the RBIAS code to pm8916_wcd_analog_enable_micbias_int1/2()
> to fix this.
> 
> Fixes: 585e881e5b9e ("ASoC: codecs: Add msm8916-wcd analog codec")
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   sound/soc/codecs/msm8916-wcd-analog.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
> index 30b19f12fabc..1f7964beb20c 100644
> --- a/sound/soc/codecs/msm8916-wcd-analog.c
> +++ b/sound/soc/codecs/msm8916-wcd-analog.c
> @@ -396,9 +396,6 @@ static int pm8916_wcd_analog_enable_micbias_int(struct snd_soc_component
>   
>   	switch (event) {
>   	case SND_SOC_DAPM_PRE_PMU:
> -		snd_soc_component_update_bits(component, CDC_A_MICB_1_INT_RBIAS,
> -				    MICB_1_INT_TX2_INT_RBIAS_EN_MASK,
> -				    MICB_1_INT_TX2_INT_RBIAS_EN_ENABLE);
>   		snd_soc_component_update_bits(component, reg, MICB_1_EN_PULL_DOWN_EN_MASK, 0);
>   		snd_soc_component_update_bits(component, CDC_A_MICB_1_EN,
>   				    MICB_1_EN_OPA_STG2_TAIL_CURR_MASK,
> @@ -448,6 +445,14 @@ static int pm8916_wcd_analog_enable_micbias_int1(struct
>   	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>   	struct pm8916_wcd_analog_priv *wcd = snd_soc_component_get_drvdata(component);
>   
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		snd_soc_component_update_bits(component, CDC_A_MICB_1_INT_RBIAS,
> +				    MICB_1_INT_TX1_INT_RBIAS_EN_MASK,
> +				    MICB_1_INT_TX1_INT_RBIAS_EN_ENABLE);
> +		break;
> +	}
> +
>   	return pm8916_wcd_analog_enable_micbias_int(component, event, w->reg,
>   						     wcd->micbias1_cap_mode);
>   }
> @@ -558,6 +563,11 @@ static int pm8916_wcd_analog_enable_micbias_int2(struct
>   	struct pm8916_wcd_analog_priv *wcd = snd_soc_component_get_drvdata(component);
>   
>   	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		snd_soc_component_update_bits(component, CDC_A_MICB_1_INT_RBIAS,
> +				    MICB_1_INT_TX2_INT_RBIAS_EN_MASK,
> +				    MICB_1_INT_TX2_INT_RBIAS_EN_ENABLE);
> +		break;
>   	case SND_SOC_DAPM_POST_PMU:
>   		pm8916_mbhc_configure_bias(wcd, true);
>   		break;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
