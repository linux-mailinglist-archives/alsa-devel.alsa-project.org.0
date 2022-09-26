Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8455E9B91
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 10:05:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A02FF83D;
	Mon, 26 Sep 2022 10:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A02FF83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664179507;
	bh=oAHV04xbjiHDUs3xEFzxlsCAwGcI9ztIQseCZCo9KjY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=RvkslMQ4DXDpX134YmOHB1vClhf/qeJy84sx7w/oni9b5PLTn+z+1Xo0MQK8lHsrN
	 Oci7TddGu3qu+pw7F0C36tLDxSrMEIU7B9/Qs5lbZSWK4m8zCrvcoUh7vJTinGw04E
	 rDW8ZeBMcBxfEANh9N9YE6NBzsSyulOt7SRK6330=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57F98F80510;
	Mon, 26 Sep 2022 10:03:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FB84F802BE; Mon, 26 Sep 2022 10:03:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32290F802BE
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 10:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32290F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sid3k+0H"
Received: by mail-wm1-x331.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso3256361wmq.2
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 01:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:reply-to
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date;
 bh=s1GDsk/KtoTE59u0rYU4aKY4t7QMGjP0CyyjigpbcZw=;
 b=sid3k+0HnjhqHkStn6TpoHVSP2SNvoyIt77MkwA/le0AROpXtk75s1MW+L+Yj66KEQ
 Cl10tanKlY2ZjlIPX+YwtwDOzKR714vIa7PZeCYAcTKJ83n7CbUaD85PQH8c6TFGN1rY
 dq3pFn9YrZIvl4zdlXLu+CjMh6uog604xE4KMeYm5xy0t+9YfUG/F2kQC5Xv8+zV4zQ9
 LT0S/27aRUCze7grdKFD4ApXbXjkZle+WvYbDCdzWmfRsBMMV5SQcpIjVfR1cY8D+bO9
 CD6GLsVulf8ign9872vNqVsg9HsOyHKh6J7unYy5Qs9n01QIlxY+iw0pmX16M9WM/E3i
 dl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:reply-to
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=s1GDsk/KtoTE59u0rYU4aKY4t7QMGjP0CyyjigpbcZw=;
 b=aqVgwIbMJG3wXT5RbyzI9GtOa4GhQ+BJfeWoDIqajmM+bFmNmNOyk2xz5y7XxduubI
 7vVE2YKML+B3Kmo+xj/7haeAXLeMw6ZKcu1yJcbFyZUuSqxb8KNTcv8q1Wnw1XlGQ1aJ
 28xA9Ghf6NVd1LPtxHnaIHQ2m3oveLIidWy0gdP5IHC0wmDVb9vjO6NY99GKoXDzSDcs
 /P16LEL3dDoxRNorj2CT56XBUEU1Om8IdUP5r44wdN/jLx8d6G9SdZMPt5eNuvMKZwO2
 TXRjPwu91V4gsAbl4H1L7MWgnoNcn4EKQqc3RlECja0a2gDXdjny+68BJeqW4P8EBdAV
 dJKQ==
X-Gm-Message-State: ACrzQf2gs7RcMsZOItnsCTFaIYqvTHeIguZ2sE7lQbIl6RRsd81ZtQBt
 t1w4tOUhnQDp2xvBCYOMeh4JxA==
X-Google-Smtp-Source: AMsMyM43qYcB+JuoInA8MkWG+06M+titsDaKBTncBaaGoxvbpayvSx4rhBSH8L3N4GbbHNcI9OMGWw==
X-Received: by 2002:a1c:7c03:0:b0:3b4:7647:ccd8 with SMTP id
 x3-20020a1c7c03000000b003b47647ccd8mr14091264wmc.10.1664179424704; 
 Mon, 26 Sep 2022 01:03:44 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003b4ac05a8a4sm12743612wmo.27.2022.09.26.01.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 01:03:44 -0700 (PDT)
Message-ID: <3c69b64e-8dcf-91e5-6863-198120c31065@linaro.org>
Date: Mon, 26 Sep 2022 10:03:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/5] slimbus: qcom-ctrl: use
 devm_platform_ioremap_resource_byname()
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
 <20220923155740.422411-3-krzysztof.kozlowski@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220923155740.422411-3-krzysztof.kozlowski@linaro.org>
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
> Simplify the code with devm_platform_ioremap_resource_byname().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/slimbus/qcom-ctrl.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
> index bb106eab8ae2..400b7b385a44 100644
> --- a/drivers/slimbus/qcom-ctrl.c
> +++ b/drivers/slimbus/qcom-ctrl.c
> @@ -488,7 +488,6 @@ static int qcom_slim_probe(struct platform_device *pdev)
>   {
>   	struct qcom_slim_ctrl *ctrl;
>   	struct slim_controller *sctrl;
> -	struct resource *slim_mem;
>   	int ret, ver;
>   
>   	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
> @@ -519,8 +518,7 @@ static int qcom_slim_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, ctrl);
>   	dev_set_drvdata(ctrl->dev, ctrl);
>   
> -	slim_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ctrl");
> -	ctrl->base = devm_ioremap_resource(ctrl->dev, slim_mem);
> +	ctrl->base = devm_platform_ioremap_resource_byname(pdev, "ctrl");
>   	if (IS_ERR(ctrl->base))
>   		return PTR_ERR(ctrl->base);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
