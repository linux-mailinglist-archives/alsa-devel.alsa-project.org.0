Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 969404D445E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 11:17:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A93A1883;
	Thu, 10 Mar 2022 11:16:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A93A1883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646907455;
	bh=EXxsU7bb4p75pfO8sLSCyCd/AXaDqiKA9HqIvRAA9hc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SZwFwiOTU3sa5Ru6lk6WRdmtkKuVOmADWiNlRZZu/OG0/YhaNwRJF+3VfOIcaP/dN
	 1wELd3U1U435DMLBHdDcR45g/RcwSai1bWhAyQ+RF05WUZdyIrDbJvL39Ww5kv9bb0
	 S34Nf7mF/MNdNA2BAcVtGOsWvoQmXweDSOdEWjds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54670F800D2;
	Thu, 10 Mar 2022 11:16:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A275F80137; Thu, 10 Mar 2022 11:16:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55878F800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 11:16:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55878F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Zd+TYWLs"
Received: by mail-wm1-x32f.google.com with SMTP id
 n31-20020a05600c3b9f00b003898fc06f1eso5113849wms.1
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 02:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=04ryZIvTRUDhoUYmcvNQt9Swok7h0slWygeHVa8vqiY=;
 b=Zd+TYWLsSoSNZ4+/oqHc8x5LYljlVmF7e5FaMcx556ItTvBHOLjGkpe92tMUlHeg84
 X2TJbDLtMC75+dpMRAH3b0To67/E5an/De1MrzB0ANAFWByKf1MDsjrwZHLQdJgL/PCl
 mfdgGLZuCT0FL3SnDYD5obVjh0eEykCQwtBWxEQXywF77qF6hpGivHmJ3ibcr5EedMYh
 CzJmC3TRzjVh+D6G1Rz87t+jjp8bQZkrUZTBeFWjPn+PaOL7h0hghF+tk0xVtakvyo6u
 aO95fA5W/7bY8YxsNe/4GByhqCmWH5Ad9Nyyih9514EE8DbPhKoN9epwwmS47fWrGnj7
 gwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=04ryZIvTRUDhoUYmcvNQt9Swok7h0slWygeHVa8vqiY=;
 b=aSu+N6UVkLA628jsxXmASM6XNW7uHPCXjEdUL4gLOq5BsvnbFZcT4efVeEJcYwtYn+
 pp5U6w/y31L6Gv+zw/1hOFmU5FV1EB3WgxmV5i8UrGTMc6ALlh7IthLIIJ6QZ+9sHXi4
 rsdmUkUT+DaYwBWLu+kYaA9PT5wIH4HRw7SRZnzvYWXs9HjogHs3VkPKG36gGMaKTYQn
 i0e3pCXNqU50Nof6bmqJ1V7IJq66c/fZbu2tV+LPH8xDkI5owhxEupGZfFtoJ8Hgxt4z
 25FGDlJQTqmxbE1v2brfaBHzy5zDN/EOiC2h6PABAb21wjoRqzccirzIGiOV1CSkG1zC
 L2ig==
X-Gm-Message-State: AOAM531zTuZLApCX5I10JRiqqIFsrLLOD1unFVbjyAn85LDZcO9elpga
 AMYtxvOMzsNQFsRpZBYRmsSyIA==
X-Google-Smtp-Source: ABdhPJyywi34YHOHVhNPxnoUPjmKH7B/IOtSTulhMR1UULi9LtjP9plyHy6KFFq/cJtVWwQ6br/aJA==
X-Received: by 2002:a05:600c:1f15:b0:389:ab64:fe80 with SMTP id
 bd21-20020a05600c1f1500b00389ab64fe80mr11070007wmb.141.1646907378180; 
 Thu, 10 Mar 2022 02:16:18 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 k10-20020adfe3ca000000b001f0329ba94csm5594508wrm.18.2022.03.10.02.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 02:16:17 -0800 (PST)
Message-ID: <c5ea7235-8642-6a89-f4ce-bd0861b6e4aa@linaro.org>
Date: Thu, 10 Mar 2022 10:16:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Use platform_get_irq() to get the
 interrupt
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211224161334.31123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org
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



On 24/12/2021 16:13, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue

Are you saying that we should not be using platform_get_resource(pdev, 
IORESOURCE_IRQ, ...) on drivers that support DT?

> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.

Should this not be fixed in the DT core itself?

> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().

I would prefer this patch to be part of the series that removes IRQ 
resource handling from DT core.


--srini

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi,
> 
> Dropping usage of platform_get_resource() was agreed based on
> the discussion [0].
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/
> patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Cheers,
> Prabhakar
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 7040293c2ee8..0f29a08b4c09 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1526,13 +1526,11 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>   	if (IS_ERR(ctrl->base))
>   		return PTR_ERR(ctrl->base);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev, "no slimbus IRQ resource\n");
> -		return -ENODEV;
> -	}
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		return ret;
>   
> -	ret = devm_request_irq(dev, res->start, qcom_slim_ngd_interrupt,
> +	ret = devm_request_irq(dev, ret, qcom_slim_ngd_interrupt,
>   			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
>   	if (ret) {
>   		dev_err(&pdev->dev, "request IRQ failed\n");
