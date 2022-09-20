Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B675E7609
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 10:44:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FAFC851;
	Fri, 23 Sep 2022 10:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FAFC851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663922656;
	bh=g7e9jPDdmfD5yR8xkQdw3NTmKGbyC7NyDf7gitlOjxA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qvBURiK0HwvnqwFlfIZGDaatD5P3wguIjxCnjNj8YJtAn5w31nBPNhMl/L1foJYAt
	 XcdcmDCTBHbn12M84bFCFX3VqXz77v+YBYYaEO9kzmTcroarPZMJc0fSkWsg2TN6dq
	 mBQhL9w//wVYcwCJsv04wqRKw49HWjQpx3Yv5XI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90276F8053D;
	Fri, 23 Sep 2022 10:42:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FE89F80153; Tue, 20 Sep 2022 15:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13557F800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 15:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13557F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ahZuUmZP"
Received: by mail-wm1-x32c.google.com with SMTP id
 c2-20020a1c3502000000b003b2973dafb7so6882605wma.2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 06:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date;
 bh=g5jWZ2WFsY/FBmA+o1CluBEPsaJX+nCuG4k+tTP6m98=;
 b=ahZuUmZPGV5kDEbozZYj/AQZKifnavG29tNgalSvlzR5TcLPGh1dSvBuu0oEwJWkK8
 eGDqMvolNTe8QT2zuxZLn6S8pQpToMAWOV0m8ATNCMc7S8AGPU1V+Nk9sOBew7VWMUyU
 uyigES993TtvKSZyAtdJjZeeQgrmza0ncNlYvvp0MfYTlSzYNBY01YZQgI3nWKhxpdx+
 ERvibhp7HoUL1OgkpSyB15LJyXRTO8O3vtlG9UK9CjReqCffygYnKc+JJ0drJVY3SdCi
 v7biwIIurbVya/n8QT6NsrszkTIdWIO2jENz5ysO8svMiWV8zedM1M3aENtrta9MV24m
 hYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=g5jWZ2WFsY/FBmA+o1CluBEPsaJX+nCuG4k+tTP6m98=;
 b=nodcVLX4P36TqRPmZ8CmzHjrjC0oKGBTn1vSD1nuT4o75ZEPeVuv4lHNWXSnZ+2hXK
 fnXYt7y9fefWWCNbc5gqNQltIbdqANShD4XWBlri/n9+O3t2awwjVnjOWCdxMxtIL7xZ
 Y5xtX8ARlyklcWuE8CC5UE0Fn8BQ00fvqPpCpGRHZIBcKqnPZqu5CXGhCtVXbbf9yvq/
 wu9Z+JUTkfB4yJU3QOigsM26kxRk74/Vq+RIkDw+wWVd7pghSyrIs17ymMe58mg9KIYm
 rrv8j0+YKYldioZNeAxDpVkLEQq75T28ttIsutv8CuOS+3TsgTLkVFlVICH2VJ8iyda7
 A00w==
X-Gm-Message-State: ACrzQf2Nn+17IZR8jyzYOgvGj0/5N1vPfDs6LxTi6FX4EAKwdNImJffc
 mXr2VmBEMWqA86fz5W3vxeKVsQ==
X-Google-Smtp-Source: AMsMyM5QtgXayw9Vbt5bQUfay84AiUJaO/gk8txKtCJ6f5cE6M/XeIOV5ivdcHiSum4QLXKloFZ0JA==
X-Received: by 2002:a05:600c:43d3:b0:3b3:2f1c:f01c with SMTP id
 f19-20020a05600c43d300b003b32f1cf01cmr2465695wmn.152.1663680724742; 
 Tue, 20 Sep 2022 06:32:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e10:f0f:43b2:9b5e?
 ([2a01:e0a:982:cbb0:7e10:f0f:43b2:9b5e])
 by smtp.gmail.com with ESMTPSA id
 e24-20020adfa458000000b002252ec781f7sm80983wra.8.2022.09.20.06.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 06:32:04 -0700 (PDT)
Message-ID: <c117c5d5-e864-068b-a1fe-961e2eeba84c@linaro.org>
Date: Tue, 20 Sep 2022 15:32:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH -next] slimbus: qcom-ngd: Add error handling in
 of_qcom_slim_ngd_register
Content-Language: en-US
To: Lin Yujun <linyujun809@huawei.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 srinivas.kandagatla@linaro.org, gregkh@linuxfoundation.org, vkoul@kernel.org
References: <20220914031953.94061-1-linyujun809@huawei.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro
In-Reply-To: <20220914031953.94061-1-linyujun809@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 23 Sep 2022 10:42:24 +0200
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 14/09/2022 05:19, Lin Yujun wrote:
> No error handling is performed when platform_device_add()
> return fails. Refer to the error handling of driver_set_override(),
> add error handling for platform_device_add().
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Signed-off-by: Lin Yujun <linyujun809@huawei.com>
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 0aa8408464ad..fb591990ddad 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1470,7 +1470,13 @@ static int of_qcom_slim_ngd_register(struct device *parent,
>   		ngd->pdev->dev.of_node = node;
>   		ctrl->ngd = ngd;
>   
> -		platform_device_add(ngd->pdev);
> +		ret = platform_device_add(ngd->pdev);
> +		if (ret) {
> +			platform_device_put(ngd->pdev);
> +			kfree(ngd);
> +			of_node_put(node);
> +			return ret;
> +		}
>   		ngd->base = ctrl->base + ngd->id * data->offset +
>   					(ngd->id - 1) * data->size;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
