Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA2B13AA5F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:13:08 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38E2A1679;
	Mon, 13 Jan 2020 12:31:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38E2A1679
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C010DF801EB;
	Mon, 13 Jan 2020 12:30:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E08F8F801EB; Mon, 13 Jan 2020 12:30:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F135F80122
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 12:30:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F135F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rJmtVmX5"
Received: by mail-wm1-x344.google.com with SMTP id u2so9210628wmc.3
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 03:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L9J6bdgSQjodLI23YpSiTesx0n9B3HndOvra4M8+p7k=;
 b=rJmtVmX5YKzQhdTnqWIDt0Sd7hRfyDZ9J2/r7AgrnRy+LnIovCP86RslmsEr+2/7HK
 J/SKbxZYfjjBgawUJkeQI47bODPEW9k2Yued/The+xcicFpPCZOKzRvUVa1gWbllfa4V
 7SnQvUJoGE4rWnEaE7YWJxfrNCWNUwWSt6UI8ni1fYPw0MYPCZyslpfHTbGY22MjcCkS
 7A/lojLQb9M4Aant41VIH4xrR4xE3xuAZfAbJ5nr63S2aQ2jgVBk/PkA9LU0J6EuBPTk
 HVlKkDWboTipYxPCwf4y7vop7zhR8rZn5uwcAsawQ+6LWOj9z249IYDF+ZxCwJVWKDXg
 d82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L9J6bdgSQjodLI23YpSiTesx0n9B3HndOvra4M8+p7k=;
 b=X5DxbKFf4Hc8zJ4prSXOsQ4Tm6X9YVDCtULAzINIcShjxgVSfJMNMfp9NoE+Qu9/4/
 OAFJ2/jMz/RfL8ey8fF/eoJPcxFZsRBse7E7ndaUv2zoXyYGx4ph6cpZOx2kFqrCji1E
 QgqgYFilZ7b9Mr1mzVAwCFQtA3Dcqq7U9LVLHuDYKmx89dUsNz3nXqT/OLZNTBSWFWmM
 GgFJgruT7RoRDXK2dcA/2vMH4cfvzP32I1+YI3oylQZdYz8tHFYfKL5ytJ6jf3zdCaCq
 QW7z4cgvMuQl6K4gYOoYD6d9MjucgOJoerkfjabZR87UOTH0UpZaxBk+tgPA6dX0YPiF
 mErg==
X-Gm-Message-State: APjAAAW6qQNYdzhSC9BOit2JRp5BHVXxVE1ua+VEbUH+ejItkXMyF1tu
 BkHE1B9uagcCFLUS9xb3jFeKFQ==
X-Google-Smtp-Source: APXvYqwzfJShA35mlKYnLzNK54JVIn52v5SM+atzIQ1r2mhhM94/PF6eqTGKTUqYGhEgmy5gqGc+4w==
X-Received: by 2002:a1c:b603:: with SMTP id g3mr19010718wmf.133.1578915050398; 
 Mon, 13 Jan 2020 03:30:50 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id k11sm13455223wmc.20.2020.01.13.03.30.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jan 2020 03:30:49 -0800 (PST)
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20200105102753.83108-1-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <33e68247-ff11-6c0c-b91c-9b406f9607cd@linaro.org>
Date: Mon, 13 Jan 2020 11:30:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200105102753.83108-1-stephan@gerhold.net>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [alsa-devel] [PATCH] ASoC: msm8916-wcd-digital: Reset RX
 interpolation path after use
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



On 05/01/2020 10:27, Stephan Gerhold wrote:
> For some reason, attempting to route audio through QDSP6 on MSM8916
> causes the RX interpolation path to get "stuck" after playing audio
> a few times. In this situation, the analog codec part is still working,
> but the RX path in the digital codec stops working, so you only hear
> the analog parts powering up. After a reboot everything works again.
> 
> So far I was not able to reproduce the problem when using lpass-cpu.
> 
> The downstream kernel driver avoids this by resetting the RX
> interpolation path after use. In mainline we do something similar
> for the TX decimator (LPASS_CDC_CLK_TX_RESET_B1_CTL), but the
> interpolator reset (LPASS_CDC_CLK_RX_RESET_CTL) got lost when the
> msm8916-wcd driver was split into analog and digital.
> 
> Fix this problem by adding the reset to
> msm8916_wcd_digital_enable_interpolator().
> 
> Fixes: 150db8c5afa1 ("ASoC: codecs: Add msm8916-wcd digital codec")
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Thanks for the patch and testing it with QDSP6.

> ---
> Tested on msm8916-samsung-a5u:
>    - qdsp6 does no longer stop working after playing audio a few times
>    - lpass-cpu is still working fine (no difference)
> ---
>   sound/soc/codecs/msm8916-wcd-digital.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
> index 58b2468fb2a7..09fccacadd6b 100644
> --- a/sound/soc/codecs/msm8916-wcd-digital.c
> +++ b/sound/soc/codecs/msm8916-wcd-digital.c
> @@ -586,6 +586,12 @@ static int msm8916_wcd_digital_enable_interpolator(
>   		snd_soc_component_write(component, rx_gain_reg[w->shift],
>   			      snd_soc_component_read32(component, rx_gain_reg[w->shift]));
>   		break;
> +	case SND_SOC_DAPM_POST_PMD:

We should do this in SND_SOC_DAPM_PRE_PMU rather than in power down 
sequence.


> +		snd_soc_component_update_bits(component, LPASS_CDC_CLK_RX_RESET_CTL,
> +					      1 << w->shift, 1 << w->shift);
> +		snd_soc_component_update_bits(component, LPASS_CDC_CLK_RX_RESET_CTL,
> +					      1 << w->shift, 0x0);
> +		break;
>   	}
>   	return 0;
>   }
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
