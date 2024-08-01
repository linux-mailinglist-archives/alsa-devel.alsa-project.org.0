Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A07944B18
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 14:15:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0D8A4117;
	Thu,  1 Aug 2024 14:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0D8A4117
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722514511;
	bh=IzTwNrilBUAlwP925WvEJZboHMLUQHtVa3f+NyNlaK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FNHwYHq7AxYykqou/8rqwATp+wa1j5Xei2ktMpSuQ/QHuwiQhLarNaF4jeKnQB/Bz
	 kBxDz3XUlmHqxkHgrJnreEmPAgTx4AQiK+gwMn3D3PrH4SEs9lkenjCMNHbG/SrgMz
	 tLblkYjmfNdavAn9iH5NwzHpVJTJB2QPooF0R5pE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF07EF80768; Thu,  1 Aug 2024 14:12:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED61DF807D2;
	Thu,  1 Aug 2024 14:12:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30ED3F8026A; Thu,  1 Aug 2024 13:08:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40A12F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 13:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40A12F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dphSY+if
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7d26c2297eso838169966b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Aug 2024 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722510502; x=1723115302;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FExuf/EqIwu44cXtirgV7vgVSEt4vB1L1sgTb2On32Q=;
        b=dphSY+ifNL3LLi6fAOQ9jvfS5v9OTZKw2wgMLaNiaMygtMZzVmyVEof8jcvISMijJv
         mXou65UxkgBjyeNm05PRr/mmY9SkZ8b0bkSEXmm5o6EdxtceiU1ER9M0RssvIbJpOaMz
         K7IJUDhiHiwN90IKsZjv80snBySfINCBfyLLaZeV8Z1yJFsi5celX0FnzFWsCXiWPpnw
         33lDkIxC0D68SDhU8Cc1vXZuHEBoamWmDovL5YXBO1Xnxg/sfaeW83RfqygqCeWD9YVl
         UEBfQFCjg4pT1oEtl+tn4tmx4piNxwm+9/XTNyTeq6b4PKPq92YnocKRUdxznjdRW/Am
         OqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722510502; x=1723115302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FExuf/EqIwu44cXtirgV7vgVSEt4vB1L1sgTb2On32Q=;
        b=W3y8IqwZDneDcYnYhYrUjLk1QumUiScffnm+VOnMpMaaLBc02ahJFdiIz9TY7dbLh2
         A4y9ySYtj/yW70orauJ2giMSP5RyL+4AGilrK01AEVpBK72wOxJ3vI9McOZl6b0YFnMh
         f8/rFbyCCH4NXf6M11CkDn2z1MAbtZeQfrwU07PIhmNfpEomnFj4mfqOhXIsXOe3ro/o
         Cloh51+1YaKEw6ylXS2OOIVNyRPrFfP3S/V2g1nr5VPVeH8jLvSRUCASaVOLSE7GRYTx
         b6Nt5SO1aD2KH6TtTtttnp5iEipK6CKpgg0BxwhA0RuzTwdxgkWE5YRXbNBF8nsO/fa4
         5JXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZdzwgchOWletoVlXBHFfL6Fsp0Bi8wirqec11971tQTswQZfw0NwS3j7kURwu3UcNLnDvorj0fOyvuA4HG2UKKbRvg+nrZZsMCoE=
X-Gm-Message-State: AOJu0YxFEp9MdnQoTlkW6nWctPGYTc17jcmUXNXUPEcGojlwVVUWnAL1
	NmoS7jXZYpx09BgyY/Z4a1cfPVPmSyfTg1dFTCpqalZQY8zeoky5/hlku83Aw9Q=
X-Google-Smtp-Source: 
 AGHT+IGqr7N4CpNmN1ermVEFWMT0947mfSXTC3VHJzla+OoRW5oknSUl8o0Y7+o27NpeeOS8sdiOuw==
X-Received: by 2002:a17:907:25c3:b0:a77:e48d:bc8 with SMTP id
 a640c23a62f3a-a7daf4c8093mr173415166b.21.1722510502384;
        Thu, 01 Aug 2024 04:08:22 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:31d2:aeb1:18cd:e482])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad90264sm894932366b.148.2024.08.01.04.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 04:08:22 -0700 (PDT)
Date: Thu, 1 Aug 2024 13:08:20 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/8] ASoC: qcom: apq8016_sbc: Add support for msm8976
 SoC
Message-ID: <ZqtspO9hO0yFus1u@linaro.org>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-7-163f23c3a28d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-7-163f23c3a28d@gmail.com>
X-MailFrom: stephan.gerhold@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: K6PKU5WW5ZAARWGNFSDCFMNYG4T2XB6W
X-Message-ID-Hash: K6PKU5WW5ZAARWGNFSDCFMNYG4T2XB6W
X-Mailman-Approved-At: Thu, 01 Aug 2024 12:08:07 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6PKU5WW5ZAARWGNFSDCFMNYG4T2XB6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 31, 2024 at 05:25:31PM +0200, Adam Skladowski wrote:
> Introduce support for audio card on MSM8976 platform.
> While MSM8976 falls into v1 category with MSM8916, digitial codec clock
> is not available in GCC so we have to set it in machine driver.
> For that reason for V1 clocks new boolean is added to check
> if we need to enable codec clock.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 3ed35beb671a..8219d4d55625 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -35,6 +35,7 @@ struct apq8016_sbc_data {
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
>  	enum afe_clk_api q6afe_clk_ver;
> +	bool dig_cdc_mclk_en;
>  	int mi2s_clk_count[MI2S_COUNT];
>  };
>  
> @@ -242,6 +243,16 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
>  
>  	if (++data->mi2s_clk_count[mi2s] > 1)
>  		return 0;
> +	/*
> +	 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
> +	 * so we have to request clock from machine driver using V1 API)
> +	 */
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 &&
> +	    data->dig_cdc_mclk_en) {
> +		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);
> +		if (ret)
> +			dev_err(card->dev, "Failed to enable LPAIF dig clk: %d\n", ret);
> +	}
>  
>  	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
>  	if (ret)
> @@ -267,6 +278,13 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
>  	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
>  	if (ret)
>  		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
> +
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 &&
> +	    data->dig_cdc_mclk_en) {
> +		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, 0, 0);
> +		if (ret)
> +			dev_err(card->dev, "Failed to disable LPAIF dig clk: %d\n", ret);
> +	}
>  }

I'm a bit confused why this works correctly. The digital codec clock
(mclk) is needed whenever accessing registers of the digital codec
("qcom,msm8916-wcd-digital-codec"). This is why the clock is directly
assigned to it in the DT, so the codec driver can request it when
needed. The startup/shutdown callbacks in this patch are only called
during audio playback, while the codec registers might be accessed any
time e.g. when changing the volume mixers. Perhaps you are lucky not to
hit that, but if the clock is off at that point the device will crash or
hang.

Instead of requesting the clock here, we should assign it to the digital
codec in the DT. I think Otto's series also allowed that for the older
v1 firmware [1]. Can we work towards finishing that up instead? That
should be more reliable.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20231029165716.69878-1-otto.pflueger@abscue.de/
