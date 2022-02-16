Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC24B8B4D
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 15:21:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E4E41944;
	Wed, 16 Feb 2022 15:21:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E4E41944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645021310;
	bh=WTHeSjByQBcQFcp7pzcKb/82xc8dPK4w7tEq0Kprgew=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CuzCPNDHeJoKVGTXjGV33plv3DFgYS0wjC3g/2Y/Jo0FbWiByOKNoCstUz7GwcqyA
	 teqrlf2WqTjKHm2PxM+uXwkNq6XqfRRdz3KOmr10rcEJeI6PseELe+V0X9sJJXpc1v
	 Xax+CKPM6pbW6PPIuk7kbtmqtYeklcfeV0WYOdKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 303A9F80256;
	Wed, 16 Feb 2022 15:20:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA19AF80245; Wed, 16 Feb 2022 15:20:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6438F80118
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 15:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6438F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CtRgQr4v"
Received: by mail-wr1-x434.google.com with SMTP id e3so3818797wra.0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 06:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AA6sqHNZlIg8SGGbsraAtAlG7fg+PCiJ8r+WX/B76Po=;
 b=CtRgQr4vdIESNeW8jYcs0C6ivkl2n0pBfMkfDOpZ6FPM8OkGSHQxhJb+X0ugruc9cN
 rgxTXkLxX4Ev7W9Si/K0a8PJT1tnQ2W3T3DSKG7fnShjGDmhRZFw/3JfRuG/EYD/pydf
 q/yl4QFapvWzNBTA3r9QzFzpt+G46umUgfFyDgeEjpyx0SzubWRfjWifT+CzvYOMW2Ga
 EfMbX23vxb17BHWsLI9vn3HVxT5nLEynoigLxZjDsZ5zIG/1UEWsg0iZ6a1MwR4SL8QP
 qmBN5JyIFcup9jVTbOpt+jIjYZXgb7svY5nxxyXxESBQGKEer0qkTvtRcjanDmiUKGN+
 XODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AA6sqHNZlIg8SGGbsraAtAlG7fg+PCiJ8r+WX/B76Po=;
 b=p+Z5xGdi7qNp1rV0UEgxQGc9jpyXkkoee/YaM53SOrZUUQcM8uxBh4LcbTrAsh32N3
 aFHPBibjs7ccqImq9SbbczCXiKf1XYn8xUb2dmblxkDlcjddqckrFfQUMvFDuiFC+CyG
 WzINJY+/0CHFoO5LiyNuXPo33qQ0A1JRvaTe4moBaQefKE6b6+591lBletVKyj6hjhpF
 M3NTD+RSVdkjt94sPNk4AD/h1MtdAVVh/bG5qbtWrB8eL4GKo1LTfwlhkRcqMAnbRH4Z
 nRVh+CEaQ7ySffkUmaPeF3xTdorxaYNU45LCLYzK5y9HiPZsSm3px1Xmb4QOaB0YSTZm
 gyMA==
X-Gm-Message-State: AOAM531m01urrPB6oXjAO2bwuQ5vces3nPtcCJrfZLiJIw1vHpB1RKMg
 XtgOD/8RZL7S3rNQDJLK5ftKQQ==
X-Google-Smtp-Source: ABdhPJzK8GjerP0gr5REaN0lpUxRC3/agCT70JvKOqZN+hZJp49y95J3ljQEeWqh1kgthEzhPnzZeQ==
X-Received: by 2002:adf:fe0d:0:b0:1e3:3f5e:7469 with SMTP id
 n13-20020adffe0d000000b001e33f5e7469mr2520594wrr.61.1645021205108; 
 Wed, 16 Feb 2022 06:20:05 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id j6sm24002828wrt.70.2022.02.16.06.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 06:20:04 -0800 (PST)
Message-ID: <a209336a-9108-f1ac-ee6d-a838df115c6d@linaro.org>
Date: Wed, 16 Feb 2022 14:20:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 7/7] pinctrl: qcom: Update clock voting as optional
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-8-git-send-email-quic_srivasam@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1644851994-22732-8-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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



On 14/02/2022 15:19, Srinivasa Rao Mandadapu wrote:
> Update bulk clock voting to optional voting as ADSP bypass platform doesn't
> need macro and decodec clocks, these are maintained as power domains and
> operated from lpass audio core cc.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c        | 16 +++++++++-------
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.h        |  1 +
>   drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c |  1 +
>   3 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 8a82fd9..103f0a6c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -407,13 +407,15 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>   				     "Slew resource not provided\n");
>   
> -	ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Can't get clocks\n");
> -
> -	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Can't enable clocks\n");
> +	if (!data->is_clk_optional) {
> +		ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Can't get clocks\n");
> +
> +		ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Can't enable clocks\n");
> +	}
>   
>   	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
>   	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> index a511d72..c1079bf 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> @@ -77,6 +77,7 @@ struct lpi_pinctrl_variant_data {
>   	int ngroups;
>   	const struct lpi_function *functions;
>   	int nfunctions;
> +	int is_clk_optional;
>   };
>   
>   int lpi_pinctrl_probe(struct platform_device *pdev);
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index 5bf30d97..4277e31 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -143,6 +143,7 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>   	.ngroups = ARRAY_SIZE(sc7280_groups),
>   	.functions = sc7280_functions,
>   	.nfunctions = ARRAY_SIZE(sc7280_functions),
> +	.is_clk_optional = 1,

This is forcefully set assuming that sc7280 is always used in ADSP 
bypass mode. Which is not correct.

Can't you use devm_clk_bulk_get_optional instead?

--srini

>   };
>   
>   static const struct of_device_id lpi_pinctrl_of_match[] = {
