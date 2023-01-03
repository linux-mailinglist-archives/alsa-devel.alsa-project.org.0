Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC7B65BEAE
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 12:09:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABEA8D52D;
	Tue,  3 Jan 2023 12:09:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABEA8D52D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672744196;
	bh=MGh4upBCxCMKtbDxsYkvlvNDcZfKqoClcp6evnyn6bU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qNkqgxcMMZjEbnkIB4DBe61oGdls/HtAUkPCj9Xv2D7RyIOblXqqGHQiomg0Avl4g
	 GDOwIc8rXmDpvk50ROYnrt0m7eEhoPt4ZdCh5mhMZUwigSoL7B9++SpSQNn8y8mUKE
	 hV9S0p3aiu+xvlwP6b3Kz/2W2FqYWdJCrhdbv2w4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7167F800C0;
	Tue,  3 Jan 2023 12:08:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CD6AF8047B; Tue,  3 Jan 2023 12:08:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E63F0F8003C
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 12:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E63F0F8003C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=np87eWRW
Received: by mail-lf1-x136.google.com with SMTP id bq39so37394931lfb.0
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 03:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BS0JkwlA994b8gDT8ijmzGitBJGDV2ohc6oOypmPs6s=;
 b=np87eWRWakZKR/jOiuZJH+DoznqVDr/X6lVSAYal5LvDyQVolQFJ8xIcUMFWAdprBK
 k05urcpcoJL7W7xw8FQnYq0+bXyWtQw8Q7fqvQIWv9NvYq63zZ4zJPde0zMDaqOAUc1h
 hjmBpq3BqhgungABi44MJu54bixVGToCVZ/A5TutCSJ83HIMvy/2dHKF0QHf9UTpNEGl
 J/7K6nA3TLpJbx7N/sNGfQJlXbcJ2qphY4xl6cIvKO3Dss1qNGYqCx6kqckVWIQ/PB98
 PwEn4b5rHo/vM0d7llFjmSwXmKIL4MnpwfZhUpPyRVhqQtprFKUi8VRPDCMMTPERwvqm
 WUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BS0JkwlA994b8gDT8ijmzGitBJGDV2ohc6oOypmPs6s=;
 b=o99LhEWJHK1q24A/Ve1fuSLzebpGEG/9iGd3Pa7gK2/828yPm6PYr2ZJirtbciWy9l
 dF3RF0cpzcWaHdkMgtFo7jrlKfqbmVnghQ+c30xit6qdFMe305qo4fHiyCeTmiUm+/dh
 2LubIIhco9J/JKSqU7gMYB1FG3yc17ADFftUk4s/VaKAu12mPeYdDAgOWD9DLtdo2bgD
 B2BwogdrndXfM65msKzmTvPptGpZ5APHg+LM6nC2EM5H6UrufcC1qOks4B3oVyRB+LCQ
 TeVABmMf+Ryy71Qv4ayefnIFvn/cS6bFRQ9Wie+RNh46b9y7qgKy/OCpJ1Jhmzqlmkuo
 UJTw==
X-Gm-Message-State: AFqh2kqFX/XzwZjv5nAPCwBg67Mh1J7WvXkBSGirmUcBgVByhpzyAflA
 ygKJpUbisQ3VJ9svZh0qx3aKJQ==
X-Google-Smtp-Source: AMrXdXuonf6hj66exXU1xiu8uK2tdafKJa6v2G8LwY7oa7jLfWKhxOIjluFgkcYqpwExmL2xDOY7bA==
X-Received: by 2002:a05:6512:24e:b0:4b5:82f1:7f3d with SMTP id
 b14-20020a056512024e00b004b582f17f3dmr20058836lfo.58.1672744123454; 
 Tue, 03 Jan 2023 03:08:43 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 k1-20020ac257c1000000b004b55ca53543sm4785669lfo.233.2023.01.03.03.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 03:08:42 -0800 (PST)
Message-ID: <0cb682bd-7f1b-009d-6f1a-1a5a46366fe8@linaro.org>
Date: Tue, 3 Jan 2023 12:08:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/5] ASoC: samsung: i2s: add support for FSD I2S
Content-Language: en-US
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 s.nawrocki@samsung.com, perex@perex.cz, tiwai@suse.com,
 pankaj.dubey@samsung.com, alim.akhtar@samsung.com, rcsekar@samsung.com,
 aswani.reddy@samsung.com
References: <20230103045613.100309-1-p.rajanbabu@samsung.com>
 <CGME20230103045655epcas5p1af06a83208190c471e8cd891ef4760f3@epcas5p1.samsung.com>
 <20230103045613.100309-3-p.rajanbabu@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103045613.100309-3-p.rajanbabu@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 03/01/2023 05:56, Padmanabhan Rajanbabu wrote:
> Add support for enabling I2S controller on FSD platform.
> 
> FSD I2S controller is based on Exynos7 I2S controller, supporting
> 2CH playback/capture in I2S mode and 7.1CH playback/capture in TDM
> mode.
> 
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> ---
>  sound/soc/samsung/i2s-regs.h |  1 +
>  sound/soc/samsung/i2s.c      | 57 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/sound/soc/samsung/i2s-regs.h b/sound/soc/samsung/i2s-regs.h
> index b4b5d6053503..4444c857d0c0 100644
> --- a/sound/soc/samsung/i2s-regs.h
> +++ b/sound/soc/samsung/i2s-regs.h
> @@ -132,6 +132,7 @@
>  #define EXYNOS7_MOD_RCLK_192FS	7
>  
>  #define PSR_PSREN		(1 << 15)
> +#define PSR_PSVAL(x)		(((x - 1) << 8) & 0x3f00)
>  
>  #define FIC_TX2COUNT(x)		(((x) >>  24) & 0xf)
>  #define FIC_TX1COUNT(x)		(((x) >>  16) & 0xf)
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 9505200f3d11..dcb5c438cb2f 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -50,6 +50,10 @@ struct samsung_i2s_dai_data {
>  	u32 quirks;
>  	unsigned int pcm_rates;
>  	const struct samsung_i2s_variant_regs *i2s_variant_regs;
> +	void (*fixup_early)(struct snd_pcm_substream *substream,
> +					struct snd_soc_dai *dai);
> +	void (*fixup_late)(struct snd_pcm_substream *substream,
> +					struct snd_soc_dai *dai);
>  };
>  
>  struct i2s_dai {
> @@ -111,6 +115,10 @@ struct samsung_i2s_priv {
>  	u32 suspend_i2spsr;
>  
>  	const struct samsung_i2s_variant_regs *variant_regs;
> +	void (*fixup_early)(struct snd_pcm_substream *substream,
> +						struct snd_soc_dai *dai);
> +	void (*fixup_late)(struct snd_pcm_substream *substream,
> +						struct snd_soc_dai *dai);
>  	u32 quirks;
>  
>  	/* The clock provider's data */
> @@ -940,6 +948,10 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
>  	case SNDRV_PCM_TRIGGER_RESUME:
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>  		pm_runtime_get_sync(dai->dev);
> +
> +		if (priv->fixup_early)
> +			priv->fixup_early(substream, dai);
> +
>  		spin_lock_irqsave(&priv->lock, flags);
>  
>  		if (config_setup(i2s)) {
> @@ -947,6 +959,13 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
>  			return -EINVAL;
>  		}
>  

Except several warnings this patch generates, this is a bit surprising:

> +		spin_unlock_irqrestore(&priv->lock, flags);

You have critical section which you now break into two. You cannot do
this usually. How the synchronization is now kept?

> +
> +		if (priv->fixup_late)
> +			priv->fixup_late(substream, dai);
> +
> +		spin_lock_irqsave(&priv->lock, flags);
> +
>  		if (capture)
>  			i2s_rxctrl(i2s, 1);
>  		else

Best regards,
Krzysztof

