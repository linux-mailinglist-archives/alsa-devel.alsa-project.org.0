Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4FE22C459
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 13:24:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 079971697;
	Fri, 24 Jul 2020 13:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 079971697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595589858;
	bh=cjGlO/ne3bdmBqRwR/ek8mqSk9abFhH/Ui/gdGtH4J8=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oLjNzyYWLz3q9qUfCydsDjnJN+Z/7fYMCqWYDMfKcpw7wAvcieLcEW5O9vutKHRM2
	 86bYVynbu81Leszsr6TAwXGrUnlpF7FVy/us070f0FLKmJBCDi54ECyvTOsXNUd6pB
	 rQRCiQFfBOTqhA+clxwLNc7RtShB/7zFQeRkMPOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8242BF80150;
	Fri, 24 Jul 2020 13:22:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C703F80161; Fri, 24 Jul 2020 13:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73466F80150
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 13:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73466F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MFQ4I9EY"
Received: by mail-wr1-x444.google.com with SMTP id y3so7965023wrl.4
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 04:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Yxn5p63f6xRMyNZIKI09U0WQN+ewDSvHCk0EiFeJonw=;
 b=MFQ4I9EYPiUXBME2soPRf0FHybbqt0G73mLbezrYwDF9EkrdbgGj7Ql/TdkrH9A5TN
 byMUVKgWirUxLFsx1EcGnDXrkwzQNypVsr3FEzd13RDYGLi8diuVor5dgnmpyTpWGbvF
 snI1FdnNtl6hG7U1/7BVJVWMZPhEYyEgbqPF3CaKAFZOuCfvNCwcGJ7YtxZssa2rhHWP
 FnWOmXg6UN1Pv/iKqpDA//ISLi0FlQ1XlCGiTNwRP49bHMfwcGp3VmLJlThQoP3HzLai
 b9YKINrFfJgSu8X3G7H/4s1yy5zioHh1m3xO1z8lxVUHE7vwI/SXy1MJ0EdjsIWyio1n
 SPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yxn5p63f6xRMyNZIKI09U0WQN+ewDSvHCk0EiFeJonw=;
 b=nYMsL0GuNy3x/N5MhuA/9D+6jvUx+RKEJYtpC+1RPguSNc1ciM97mYL8dWVXmPR+qq
 Dq6GhLAcAjqjyz+J3TiVL9rkCKCkfzQDxqKvth35SVcp9y0ukcKeLvKFGlKKGpCDl2Cx
 EDVXDE93ZxUiom/qH8Bdf4N6Q79BYsK7+yn0NA1Nmg8Pr0sXx7UCaJgkwTwJ+PTUJSWy
 XTiM87CXTw2IWexR6pqKK1ocjmvDbASwexBjNVSGkIFikHXhsBK+ddX67DYb10c9/Xo/
 dteD3L9G76db6IQhXbC9GzbIDF4z1IO4wrfGdCDowdgLrkldngJtKo9HzQ29LEUxR1Rl
 TUvA==
X-Gm-Message-State: AOAM530a9nq6Qe8e/fK8dK44ZT+/+VWOgjrIc9EBo/ypHHDXo9bbhb/8
 aFPrDwxvoLrCBfI8mhlIMf0DXA==
X-Google-Smtp-Source: ABdhPJwk3yJH2k2se0co2uZc0PH6TC0Af1M7TgEssnr7ir+wGzTPfXA1pcbKzdW/TothLmRlWDKafA==
X-Received: by 2002:a5d:424f:: with SMTP id s15mr8736978wrr.342.1595589707519; 
 Fri, 24 Jul 2020 04:21:47 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id a10sm14965705wmd.3.2020.07.24.04.21.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jul 2020 04:21:46 -0700 (PDT)
Subject: Re: [PATCH v4 04/12] ASoC: qcom: lpass-platform: fix memory leak
To: Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-5-git-send-email-rohitkr@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1b8f969a-8f88-2928-0b29-9325451d9613@linaro.org>
Date: Fri, 24 Jul 2020 12:21:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1595413915-17867-5-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 22/07/2020 11:31, Rohit kumar wrote:
> lpass_pcm_data is never freed. Free it in close
> ops to avoid memory leak.
> 
> Fixes: 022d00ee0b55 ("ASoC: lpass-platform: Fix broken pcm data usage")
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-platform.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index fb9acfd..b195f3d 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -61,7 +61,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
>   	int ret, dma_ch, dir = substream->stream;
>   	struct lpass_pcm_data *data;
>   
> -	data = devm_kzalloc(soc_runtime->dev, sizeof(*data), GFP_KERNEL);
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
>   
> @@ -118,6 +118,7 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
>   	if (v->free_dma_channel)
>   		v->free_dma_channel(drvdata, data->dma_ch);
>   
> +	kfree(data);
>   	return 0;
>   }
>   
> 
