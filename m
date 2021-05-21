Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C395638C353
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 11:37:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F3FB1687;
	Fri, 21 May 2021 11:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F3FB1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621589876;
	bh=7sPZH9iIDM7ToQcO3zweSUhAwPK1KQZ4r4MYbK0BaJo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uB9wSUX8TT7mrwS3Oa1TjWayDEOmhdzvo9lE79W7cZ+7pYZeeHJ5oxAWpOUTQVKaK
	 QUWbpmYHEn2Iwxlo7U4ckqwDAvKTCfB5SHJW0wxRwouZnZ6jrGEFKE2JybczwOkOIz
	 FAgk/adz4phEA5gqNF2eFyEtHEclt3GW/C4n4x1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CD57F80246;
	Fri, 21 May 2021 11:35:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59E8DF801DB; Fri, 21 May 2021 11:35:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25D5EF800C1
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 11:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25D5EF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fztd89Om"
Received: by mail-wm1-x32c.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso6470022wmc.1
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 02:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QS9C9TZP/LIhXh/A86+cA4E2zCqL/pkxZ+dcKq3mb/8=;
 b=fztd89Omuf4opCAx6o67aZ0oeo6vyXKFZdPl6G2tingNdDYrhoEFs3wlaqcHS8uxaO
 pq2mVArFa4w0Q1oJ1RF/YYasVVX/BCOwi1PVIyxxJgClzxKvLc4WPCNxjrvbHHpNTZk1
 kg77USyJYEbHd7Pel+V6NFSnjrZKNrqwcYunKzQl4+fkmfKaVROmmJ2LeZ3qel9BVhIN
 WOQ70lxA1LanxVCRdfj//1bckFAAQelE1Ucj1V2phNeSxFMPGdp0zurtSpaXv/w+lu00
 BEHhygMVoitmv3BXEvS0E7MbEj706n7zcLl7rnSOBAumCdWEjU/oCh0kGjbRyOlAaqCt
 KloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QS9C9TZP/LIhXh/A86+cA4E2zCqL/pkxZ+dcKq3mb/8=;
 b=E/WAi2tkyCIiRws6Z1AodNkvD/1VmNveGthkpFehC7vUeRz84iynMiD0FgBaV1kr1M
 TohKSsrMfE22PYxBHV+2ae8lr/+pV69FOPh1ZCC0QI/ySwBhQ48IxzsSj5dMmED3jZiC
 QucGgBwe5tqs0uH9L9kLMkG3AYT1Gowctc58Ut+55IwHWvdW9iF+zoehfy3FzUB5QesI
 j9kZNTKrZJaJGlWby0e0UvrZAXs58RAPYKPytrAUXbx1IDcTigh9kjosWvmQSdY+Vt29
 07UCpaHruvuSX13kakr5Im2A4gOzCQRha5q9yTZlt23wTwjmt+paTbLC2jlqlDhjVzMt
 z8RA==
X-Gm-Message-State: AOAM530iTBMJW/odN3D6a0PZnFbVhlMAyqPM7NdUqsn8JKklC8aYWT3X
 Is8rgvkYowZn4+wXnckjUPEq/w==
X-Google-Smtp-Source: ABdhPJxKLuDkDkJcUdWHYHwuORgC+mlRBwAFwJvqko9NwAyymbpZBtCpoLhIIaAHqoxMYzHgADSoXw==
X-Received: by 2002:a1c:f012:: with SMTP id a18mr7771186wmb.53.1621589693793; 
 Fri, 21 May 2021 02:34:53 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id z131sm4993484wmb.30.2021.05.21.02.34.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 May 2021 02:34:53 -0700 (PDT)
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Use optional clk APIs
To: Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>
References: <20210520014807.3749797-1-swboyd@chromium.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <96301eb2-ef2d-be7f-2a24-8723c1e39905@linaro.org>
Date: Fri, 21 May 2021 10:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210520014807.3749797-1-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-kernel@vger.kernel.org
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

Thanks Stephen for patch.

On 20/05/2021 02:48, Stephen Boyd wrote:
> This driver spits out a warning for me at boot:
> 
>   sc7180-lpass-cpu 62f00000.lpass: asoc_qcom_lpass_cpu_platform_probe() error getting optional null: -2
> 
> but it looks like it is all an optional clk. Use the optional clk APIs
> here so that we don't see this message and everything else is the same.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Banajit Goswami <bgoswami@codeaurora.org>
> Fixes: 3e53ac8230c1 ("ASoC: qcom: make osr clock optional")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini

> ---
>   sound/soc/qcom/lpass-cpu.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index c62d2612e8f5..28c7497344e3 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -835,18 +835,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   		if (dai_id == LPASS_DP_RX)
>   			continue;
>   
> -		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get(dev,
> +		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get_optional(dev,
>   					     variant->dai_osr_clk_names[i]);
> -		if (IS_ERR(drvdata->mi2s_osr_clk[dai_id])) {
> -			dev_warn(dev,
> -				"%s() error getting optional %s: %ld\n",
> -				__func__,
> -				variant->dai_osr_clk_names[i],
> -				PTR_ERR(drvdata->mi2s_osr_clk[dai_id]));
> -
> -			drvdata->mi2s_osr_clk[dai_id] = NULL;
> -		}
> -
>   		drvdata->mi2s_bit_clk[dai_id] = devm_clk_get(dev,
>   						variant->dai_bit_clk_names[i]);
>   		if (IS_ERR(drvdata->mi2s_bit_clk[dai_id])) {
> 
> base-commit: 6efb943b8616ec53a5e444193dccf1af9ad627b5
> 
