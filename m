Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8067427C063
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 11:03:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 557421877;
	Tue, 29 Sep 2020 11:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 557421877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601370238;
	bh=v2X/Y4eEIoz/Rd3mzgelhmWTEoKvP2/nDNV3jUpBqNE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=exceWtDBIYagOlqqen3iMWCiP6+aU3XgZsX92csqlCJ1NVFjdgZNC88XWAxJJkVoS
	 776GGcL+jcLV5eOykN6ajCbd+URWIDnf/YXxHR3/2a04cmXOcMCa+A8zDgfNcJ7v7H
	 lPFs8qYDkxUNTTvW8/1IBws21EgwUTJ4m3bq7tXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7066DF801F5;
	Tue, 29 Sep 2020 11:02:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27906F801F5; Tue, 29 Sep 2020 11:02:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0CBDF800AB
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 11:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0CBDF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZVlc6lz1"
Received: by mail-wr1-x442.google.com with SMTP id t10so4473311wrv.1
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 02:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kRWnM0ioVvz9IYrqqipklykFed9uM/70cGkF4NfDI6c=;
 b=ZVlc6lz1lRWD181DSCDkpTiNShg+lHhaTwBVu+ELTyiTBT7MU0ukZYxVCcfWOuJY4Y
 BpvdtzVpzo9Oa8APHUiJWh8Qx4a4MRhch7jFDndojo6lNS35N1q7v5M4cS6xV95QJDcd
 M2tUrPiYXhGxuKHGX80ZOoGOCpzXXSNc+limBg/DXhUzdkDcpdsjEEdgw6MufgRcTBMs
 C6kPMtcP5VqnNVoo2QtYq3yTBjqc6aIFB75HqaBMHznDDjlIB6YuBU/B0pMyXsHnuAVC
 d6AhiFLmhv6YFToktSC1hm9xxZOrQiogAJ2kMy1fVNTcKMbCBZEvplnvizwgXLlxHkLM
 l/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kRWnM0ioVvz9IYrqqipklykFed9uM/70cGkF4NfDI6c=;
 b=XNM17FIPgiaz6qNzEWZes/FYcjnHUZ8KFbM4XLJKiSKKk+fVLlC36pc0+HCxjQXvRB
 4vtMxm5b6vza07mE8A7Kyilxb2TUaayeXizQBMQj2lX0U2QJ5HmeiMVeSAE2iYIHpa9m
 1P7EieA7TjocXDM7GCNeI/hOr4BKi3QyXBO2+jY9MoPnFxs20fJQsxo6DvRBNryP0QbF
 Z5lqznnV2jYYYBwU1WGCfW6LUh5ESkDn3YGAdhIYvmMMeHrHmip9d+qkUpABzpyofu51
 B0hkORBRoZU7jQJGKVWK1Ufq0PsiSo+9cYd2uxj944lGdzwaMvuZdR0I43tJu5Hv9Ygs
 Lmiw==
X-Gm-Message-State: AOAM533mJKS6sWV627Q5CHvrmjFwrCLTWLSWD27ok27HHDkJejCoWTEe
 r0OC3wGyaH2X95fNA8znyaK3KoSz6DVoGg==
X-Google-Smtp-Source: ABdhPJwZicjZDLbOWmiv+ukHp013tXKjN5yDxyYYzf/JDr3i/5KjO9tElHCliFTkyxx2amCO41MEuA==
X-Received: by 2002:adf:a49d:: with SMTP id g29mr3250832wrb.219.1601370119519; 
 Tue, 29 Sep 2020 02:01:59 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id v204sm4754038wmg.20.2020.09.29.02.01.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Sep 2020 02:01:58 -0700 (PDT)
Subject: Re: [PATCH v7 3/6] Asoc:qcom:lpass-cpu:Update dts property read API
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1601286811-25962-1-git-send-email-srivasam@codeaurora.org>
 <1601286811-25962-4-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4ee2a9ad-e252-0f80-0f50-6192f9d20876@linaro.org>
Date: Tue, 29 Sep 2020 10:01:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1601286811-25962-4-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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



On 28/09/2020 10:53, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Update dts property read API call with platform get property
> by name, as it make code more readable and avoid conflicts
> when array of properties to be used.
> 
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-cpu.c      | 2 +-
>   sound/soc/qcom/lpass-platform.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 0718a0f..12950d2 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -575,7 +575,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   
>   	of_lpass_cpu_parse_dai_data(dev, drvdata);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
>   
>   	drvdata->lpaif = devm_ioremap_resource(dev, res);
>   	if (IS_ERR((void const __force *)drvdata->lpaif)) {
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 7ac2629..e7cf4e5 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -621,7 +621,7 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>   	struct lpass_variant *v = drvdata->variant;
>   	int ret;
>   
> -	drvdata->lpaif_irq = platform_get_irq(pdev, 0);
> +	drvdata->lpaif_irq = platform_get_irq_byname(pdev, "lpass-irq-lpaif");
>   	if (drvdata->lpaif_irq < 0)
>   		return -ENODEV;
>   
> 
