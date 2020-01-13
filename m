Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3349D13AA82
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:18:19 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80EAA16A1;
	Mon, 13 Jan 2020 12:33:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80EAA16A1
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F36DF801F8;
	Mon, 13 Jan 2020 12:33:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC40BF801EB; Mon, 13 Jan 2020 12:33:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 206BEF80122
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 12:33:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 206BEF80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZhNfpaM9"
Received: by mail-wr1-x442.google.com with SMTP id z3so8188147wru.3
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 03:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hv2Nr7l+ONDJJyiwq7EjA5qyUhnW/X7hZs2K9HAltTw=;
 b=ZhNfpaM9dNdrTgHcv2AugZeW5dY9oqiPQ/k0qrjtiwsWWex0fJFEJmjqmsMz9qjQuB
 YExpzxY8VdH5ni6h6wfN7ggfVowsDDgtCYuhsjOBwM6vXF6dKuRV38BiA7VBIHSYvBNn
 iV/Gf06X69Dw3vZZG8OMqe3KDVPHGtM0h6zLLJx8nt+ki5A/wXqisDCwHLiKWvE6H5s1
 rE2TX0t1vk/ONNdSII87XKrKb+Vvyx/krnjnTXsYBbWzopO3X5L3fJF4i0tSVhkwAYxd
 az14R9B9SdYqi9hFgAaLaeMQQZp8t9ic5kz17PbefdAOlAiiT7Kzv4oUNH66Y8Ni8m1P
 3WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hv2Nr7l+ONDJJyiwq7EjA5qyUhnW/X7hZs2K9HAltTw=;
 b=W293f9uwGfwuyw2M9L1HI8mnRMwa+OmrKnPTPLxzP1VdOpyVvCjkO9UpJKmaSqO3hl
 Serhak8EcGsIwN6mRhZ9dRWP21UYIuPnuSARw/Ch/Cl3Nl6OrkgfTkLKjA2pp6Ep3zJ4
 63EKk3Rb2q2K4IBdInDdWa1TK/CEeQPYs/VPigoaN9P0N3rN1nSGbSWgXimybBAQUQh3
 L+F/O74THITgnpOKrIN22yIou+EYkBDZoXwPpF1gdOflsPKkbgL0/4E+ft2Ojpx7qQIv
 PSkmqMaRXOzIp3PSfegLSs+f2yJo3TxBW7GKAHirmT102tbADq1uuphuEOskTJsGFkJK
 fYUA==
X-Gm-Message-State: APjAAAXvseLNf9DarsobK2azwIhGIhaWBNuWFjS7lSyGrBz8wXy+NyP7
 aVfoFHLgDNhu74epFV4dex611w==
X-Google-Smtp-Source: APXvYqz2KuIZ2iEyb1YPmVmQ6zyvNkTzwtizAns6RWC0iVvJ/5wJ3hI8Fiwccs1wEAYX+sb0IxXigg==
X-Received: by 2002:a5d:6211:: with SMTP id y17mr17899484wru.344.1578915180093; 
 Mon, 13 Jan 2020 03:33:00 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id h66sm14771286wme.41.2020.01.13.03.32.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jan 2020 03:32:59 -0800 (PST)
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20200111164006.43074-1-stephan@gerhold.net>
 <20200111164006.43074-2-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <477e2890-27c3-5f9b-b113-a499ab85129f@linaro.org>
Date: Mon, 13 Jan 2020 11:32:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200111164006.43074-2-stephan@gerhold.net>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: msm8916-wcd-analog: Fix selected
 events for MIC BIAS External1
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
> MIC BIAS External1 sets pm8916_wcd_analog_enable_micbias_ext1()
> as event handler, which ends up in pm8916_wcd_analog_enable_micbias_ext().
> 
> But pm8916_wcd_analog_enable_micbias_ext() only handles the POST_PMU
> event, which is not specified in the event flags for MIC BIAS External1.
> This means that the code in the event handler is never actually run.
> 
> Set SND_SOC_DAPM_POST_PMU as the only event for the handler to fix this.
> 
> Fixes: 585e881e5b9e ("ASoC: codecs: Add msm8916-wcd analog codec")
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
Thanks for testing Ext mic bias and the fix.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   sound/soc/codecs/msm8916-wcd-analog.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
> index f53235be77d9..30b19f12fabc 100644
> --- a/sound/soc/codecs/msm8916-wcd-analog.c
> +++ b/sound/soc/codecs/msm8916-wcd-analog.c
> @@ -938,10 +938,10 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
>   
>   	SND_SOC_DAPM_SUPPLY("MIC BIAS External1", CDC_A_MICB_1_EN, 7, 0,
>   			    pm8916_wcd_analog_enable_micbias_ext1,
> -			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +			    SND_SOC_DAPM_POST_PMU),
>   	SND_SOC_DAPM_SUPPLY("MIC BIAS External2", CDC_A_MICB_2_EN, 7, 0,
>   			    pm8916_wcd_analog_enable_micbias_ext2,
> -			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
> +			    SND_SOC_DAPM_POST_PMU),
>   
>   	SND_SOC_DAPM_ADC_E("ADC1", NULL, CDC_A_TX_1_EN, 7, 0,
>   			   pm8916_wcd_analog_enable_adc,
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
