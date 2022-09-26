Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B8C5E9B94
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 10:05:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DD6D847;
	Mon, 26 Sep 2022 10:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DD6D847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664179529;
	bh=FlQg95+SryhMluL22LcxJNb9d5B1eCKq7crgyhyztiI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=DAHlvAIikyXF5tRQwDBDQ56i4qpreuvmWTRCK5vyTYwnI3m+rDnCdqXTP+COh8Mqy
	 Q85OGcurojf/MA4gYrS8WTV0Nh+fFcWxZ4LxQ5LoC3ohz4N/tMk4i5powvkoCXO3jo
	 +Zx+BKKeYU8V8e243PsIgIcTb/L4AngBuc4uSl6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F859F80542;
	Mon, 26 Sep 2022 10:04:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97DF7F80542; Mon, 26 Sep 2022 10:04:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 824D7F8053C
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 10:04:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 824D7F8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jdPA8sqV"
Received: by mail-wm1-x332.google.com with SMTP id
 z13-20020a7bc7cd000000b003b5054c6f9bso6425134wmk.2
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 01:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:reply-to
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date;
 bh=fjd/wwBnMeI0DV/PUi7MEDTvbPZrf3Ei8JLKkheRfIc=;
 b=jdPA8sqVYFN4kapZ9XAcbntn/UOQmmtt9Q+Ix4InstCcrd4Lo87awspNPQkUHuJ/aX
 z1TSZ6WOb7VGZF9iakxf4oJl2DCKpaLioonfOom/v1F+GqnT/Xvr8oGnT2eneJH7Rwy+
 yPpZMy7tv038H5QLCSibzBGjfCp/y9jrNb9kmGkz94lPFFzmveUkUfcvjlyGEQqIQFsn
 Nscxve0/nxRCFw0IXojHwqPLtzpPKMTN5OY+POdd8ejQVdaeWkISLa4UU+/X0o2rZUFN
 HlajCjmCUOz3Ut6HJVm0C6w27z+E634TsovhL3zt524BU6G3SqSKGQLOqI3w04XekjX/
 ZluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:reply-to
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=fjd/wwBnMeI0DV/PUi7MEDTvbPZrf3Ei8JLKkheRfIc=;
 b=Gs27WSRAebpoRv9CFgWc4Bh3/J4oZLZYX4u53gTjizNHdgtpOW/4mhdNHO9IIpyibV
 8W8Ny1q1AU1LRJEoI7mX3PdIK4LyUcvzuHMAdb3VNJSWtnrjlQ0cEgt2OhJgJqrd9Ufl
 8uTk7m+T69j+eRrHPQspMqZ/jpPdS0GSupmMdrVK1TDzYigI45f+bgdDZP+jsfmbHwLk
 mAZIWzzBAXsOTE3unxs1gDBqhly7MuTJv0iZUBrH3zjIqJ4HTr0ZvuREAfAHYj4NWfhG
 JQUtI41kUzp1888Wm0pSjqR/Juoh4aU7yEKyG04yxJQopC8MWAmrssBPbzl6rfYGU/EV
 ZQgA==
X-Gm-Message-State: ACrzQf0ZThwyG0Lv0rrE34KiEsan5DTE6QYM4XMk720vr07j9kwoH7U/
 N4YdKc6VGRE91LglRfUsql7yug==
X-Google-Smtp-Source: AMsMyM70DMzNhDNFCtPndNtPp8Oq+HakIQwZKWmT0Z9fs2emPxZu2QV/cd/U3yk671w8cSR15AQB0g==
X-Received: by 2002:a05:600c:a49:b0:3a6:673a:2a9b with SMTP id
 c9-20020a05600c0a4900b003a6673a2a9bmr20581222wmq.3.1664179440497; 
 Mon, 26 Sep 2022 01:04:00 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a5d5281000000b002287d99b455sm13421183wrv.15.2022.09.26.01.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 01:04:00 -0700 (PDT)
Message-ID: <a79e942e-64be-1584-41aa-17fe6275c562@linaro.org>
Date: Mon, 26 Sep 2022 10:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/5] slimbus: qcom-ngd-ctrl: use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
 <20220923155740.422411-4-krzysztof.kozlowski@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220923155740.422411-4-krzysztof.kozlowski@linaro.org>
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
> Simplify the code with devm_platform_get_and_ioremap_resource().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index cec11aa106bf..548dd7661334 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1522,7 +1522,6 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct qcom_slim_ngd_ctrl *ctrl;
> -	struct resource *res;
>   	int ret;
>   	struct pdr_service *pds;
>   
> @@ -1532,8 +1531,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>   
>   	dev_set_drvdata(dev, ctrl);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ctrl->base = devm_ioremap_resource(dev, res);
> +	ctrl->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>   	if (IS_ERR(ctrl->base))
>   		return PTR_ERR(ctrl->base);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
