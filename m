Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1DF82ED78
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 12:12:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26E2720C;
	Tue, 16 Jan 2024 12:12:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26E2720C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705403563;
	bh=hF9s8AYRGsnc1Sy+YgZt9X+50lemDfRZAIWx+Z9FKOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jQMuaYnqcOWRz+aM+ErsUsJMCIidZZBb59Axg34M1lwxSp3lp/OkWO10KWD6anrhy
	 JuQHnf7rcz48LGnLQObEKiUvN++A4TK/T9jlphaYQ4G38tYtM0ThzgDvL32OcLiXv1
	 02if4yG+TDGYOfWqEhdzYVF17rTzjBXubDbO2rus=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9D2DF8057D; Tue, 16 Jan 2024 12:12:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C72AFF8057D;
	Tue, 16 Jan 2024 12:12:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F3C3F8028D; Tue, 16 Jan 2024 12:12:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97347F8014B
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 12:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97347F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=n3LBr8Ap
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so118352225e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 16 Jan 2024 03:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705403508; x=1706008308;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3/2mxTMu2HoI1Jv/k7hB7V1HLoXtW33tUIuUh5/szw=;
        b=n3LBr8ApN1qll+69AJzPcKw2x9ORruarzYiNEqiWMpTzsFK5Bj0J6spa0bBhgLuc5v
         G5xKGoss/MIs3f/gElcKEM33YbS1kuFQtroQoJ8MHlGbm0Fe3JsK/dcRd1KG7u5pJT+z
         nSYNjq9oi1hi45HkDAieofzEhx3bzeZ4+p2BWz50dPvg5PSzqfRi5G53WzIw1im8AyBz
         0q4MbWJhjCMsNAx+Qug/IdWf0/9TnqPtYHRi7zlJgZdkzHsxPtPHAT9sWUHPahEy/VEF
         FGEs/3gozOyNII7SvJsgxI66CRAXsjAmQS13GtBXsYZZNnU1L3CN0jF036j7z4yi/WYi
         G6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705403508; x=1706008308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3/2mxTMu2HoI1Jv/k7hB7V1HLoXtW33tUIuUh5/szw=;
        b=Lrw00oStX6ODDjLCm5zr2sTC5kZ5i2Y5c5Nv6vrHkxwKqHUq2KKQf/JbwW/wUqFr2d
         whz5hIlEnLwdLLDcXtNSbcsljtzst0uPiKSlJkPgOb6/WWwww3Fj/xVY54VsIWBhhH/8
         M0Bzei4zfAD8/ZHskt0BvvKpicHulHiKC3yo0/riWd8sn1Tu/Luo/h2YCDPJNrr34U8j
         /swOeLEXcbBnWYsBN7aO0zt3m8qnv3q6k2KiTvgb+osSKPITwr16jdG6CIj0E33rAYqP
         xVVrQqwEiEKFq0++jTw5ymYBv4bKnxiA13HNoBy96lxqJdDrKGFsnoD935ALPgptWV/D
         MsZg==
X-Gm-Message-State: AOJu0YxrAuLQ9ypBbgj+6qa4NJpe5PqzDF6oZpWY0P4FJbrpMs9RNhgP
	lJ0dT46erhlCoxiICvli3zhaSL9mNkjE7g==
X-Google-Smtp-Source: 
 AGHT+IEvcX7jOOP20mKvB6k51ceMA1wWTsYpVIS9UashjuFwSv4C1JzPa/zSeg1loQ2qcxWtv1b5Gg==
X-Received: by 2002:a05:600c:4451:b0:40e:71e3:139d with SMTP id
 v17-20020a05600c445100b0040e71e3139dmr2071966wmn.154.1705403508583;
        Tue, 16 Jan 2024 03:11:48 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 iw7-20020a05600c54c700b0040d604dea3bsm18593723wmb.4.2024.01.16.03.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 03:11:48 -0800 (PST)
Message-ID: <1cc50979-741b-4341-9e9e-2fdee1dd2e65@linaro.org>
Date: Tue, 16 Jan 2024 11:11:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] ASoC: qcom: sc8280xp: limit speaker volumes
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240116093903.19403-1-johan+linaro@kernel.org>
 <20240116093903.19403-2-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240116093903.19403-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RIYLDPKHGN6YBOWVZB4DVOAWVV7ATXZJ
X-Message-ID-Hash: RIYLDPKHGN6YBOWVZB4DVOAWVV7ATXZJ
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RIYLDPKHGN6YBOWVZB4DVOAWVV7ATXZJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 16/01/2024 09:38, Johan Hovold wrote:
> The current UCM configuration sets the speaker PA volume to 15 dB when
> enabling the speakers but this does not prevent the user from increasing
> the volume further.
> 
> Limit the PA volume to 15 dB in the machine driver to reduce the risk of
> speaker damage until we have active speaker protection in place.
> 
> Note that this will probably need to be generalised using
> machine-specific limits, but a common limit should do for now.
> 
> Cc: stable@vger.kernel.org	# 6.5
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

LGTM, We can get rid of this limit once we have Speaker protection inplace.


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

> ---
>   sound/soc/qcom/sc8280xp.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index ed4bb551bfbb..aa43903421f5 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -32,12 +32,14 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>   	case WSA_CODEC_DMA_RX_0:
>   	case WSA_CODEC_DMA_RX_1:
>   		/*
> -		 * set limit of 0dB on Digital Volume for Speakers,
> -		 * this can prevent damage of speakers to some extent without
> -		 * active speaker protection
> +		 * Set limit of 0 dB on Digital Volume and 15 dB on PA Volume
> +		 * to reduce the risk of speaker damage until we have active
> +		 * speaker protection in place.
>   		 */
>   		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 84);
>   		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 84);
> +		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 12);
> +		snd_soc_limit_volume(card, "SpkrRight PA Volume", 12);
>   		break;
>   	default:
>   		break;
