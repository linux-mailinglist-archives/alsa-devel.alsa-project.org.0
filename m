Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AED0F5E9B8D
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 10:04:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29277820;
	Mon, 26 Sep 2022 10:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29277820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664179480;
	bh=t874//wCtSodiUaxPhP+dwofAFoXPVpg+FoZDMDzdis=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=SGq0awfKy3savJ6zl8j/yNEa1CKZ1DhvxoQn2cyh1D+tEvu/SXgatI0OtH1n84YZl
	 HIWjD7P9uJ4estE+0t2kbBZMPBnn7ZsKHYTwjxd3cW8TNQLrGUwks+wnjot8bHmun0
	 XAEQa0mtADOY8FK30E8zyX2f+mcSGoHC8tigmQ0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C584EF8011C;
	Mon, 26 Sep 2022 10:03:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 376AFF8027D; Mon, 26 Sep 2022 10:03:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FE70F8011C
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 10:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FE70F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="F9awJydw"
Received: by mail-wm1-x333.google.com with SMTP id e18so3897978wmq.3
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 01:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:reply-to
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date;
 bh=5UaykwoP7cmogwMP8kseVUVB3uiK678gg0lc2Ydeyrk=;
 b=F9awJydw3vyGcgCTSxEz2odMcAZPYdGkTWaZVddTZr0Xg9lQbZEmw/5dwBK7j5n0lX
 9hQJcVwBBrTcpxIcbYfRQJEw9X7f0ADa1vX4OxwFWS0EwMn50rykwrRPzFXj8lT3ZIlw
 g0cluujqT4tXXpEchMom/hFHNwcGN40EafWEaXllwdJLNLuG1xUFd75ZUmhbDM3Mb2Nk
 HBlvlfyhYsa0Zv9IoxF4aSPwZBJ5eRwuO8pLAWaqGA9/WBpRQ+1FaaiaiiDxZUToReN3
 QctVytCBAh9IvyncGRcEYVrb1Kmm/IQMN7DeEDYBDGComQW+toPHYLb23v65X6eroF4R
 fkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:reply-to
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=5UaykwoP7cmogwMP8kseVUVB3uiK678gg0lc2Ydeyrk=;
 b=QRXz44BJBujjaUUHXPdbkX/E2a0I+pjzxp8pMwluaQpeOubLhwUU4cLGMRT2LhU/o9
 2/YGFDgZF6SJqGdNYCF7Uhm8bTxPwmS+IdRAzZCN5UlQS86pWGOZfbnQ5SmxrVsULOaM
 iGHIqllfM+E3l7Y1O8VICxBj5cdmm/K3VRnZjN0aYzSVXVSYj5yAxCrIbLl3jlYTnAiU
 mHkPAdX2Xp28+qgfXwuMnwRbs0CG3e7HM4hU6cHQSgRs7re66DZJzaNEUzJxERFBDbY3
 ONqsy2saPusjB1ZremmOPibuY8gNcSlrX3G2IFV3+3RBdkeEBgIQtWeCOCl8i9/7GLl4
 /dIg==
X-Gm-Message-State: ACrzQf0r5yTwpoTXGLH7dkwJyzvwVY+KRc3tB40LuCpMKmPE7l/9XuIv
 hoHC+1TtIJygAM3jYYkxDDXCuQ==
X-Google-Smtp-Source: AMsMyM7IUWbb4Nk+DUBPCqoWuZ+HeKfogZtrQdBj3R2xtlvjd3vmuNxC6S1dochOh7yFvmwixb29zQ==
X-Received: by 2002:a7b:ce08:0:b0:3b4:ff9b:3d89 with SMTP id
 m8-20020a7bce08000000b003b4ff9b3d89mr14441119wmc.31.1664179410596; 
 Mon, 26 Sep 2022 01:03:30 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 n11-20020adfe34b000000b002252ec781f7sm13710611wrj.8.2022.09.26.01.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 01:03:30 -0700 (PDT)
Message-ID: <f6e9e9ce-2c87-145d-80cc-a52c0bc9fa45@linaro.org>
Date: Mon, 26 Sep 2022 10:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] slimbus: qcom-ctrl: drop unneeded qcom,apq8064-slim
 compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
 <20220923155740.422411-2-krzysztof.kozlowski@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220923155740.422411-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 23/09/2022 17:57, Krzysztof Kozlowski wrote:
> Bindings require usage of fallback "qcom,slim" compatible, so
> "qcom,apq8064-slim" is redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/slimbus/qcom-ctrl.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
> index c0c4f895d76e..bb106eab8ae2 100644
> --- a/drivers/slimbus/qcom-ctrl.c
> +++ b/drivers/slimbus/qcom-ctrl.c
> @@ -718,7 +718,6 @@ static const struct dev_pm_ops qcom_slim_dev_pm_ops = {
>   
>   static const struct of_device_id qcom_slim_dt_match[] = {
>   	{ .compatible = "qcom,slim", },
> -	{ .compatible = "qcom,apq8064-slim", },
>   	{}
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
