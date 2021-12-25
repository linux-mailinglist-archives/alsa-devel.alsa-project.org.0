Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08247F5CB
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Dec 2021 09:21:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EA1117ED;
	Sun, 26 Dec 2021 09:20:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EA1117ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640506894;
	bh=dYAxQUneRMmTOibZrSQgH9ypFiMr9LjVCgkFeqwZdHk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uB/favImhNPBcD+ZBtC9IErvyjYGJjY9yRDI+INTzp4TbI2a57szdoTso5wYBOXI6
	 UVhyik4elfGAw09j13OO8qPTOMGCBUKwtZimNMX5ee9OzrPj7h6McdjEv4EloZ0Wur
	 Lta701l5VW4S1YG9KlszAF94KYXe+MLoXCjKspCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A08BF80511;
	Sun, 26 Dec 2021 09:19:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AB79F800F0; Sat, 25 Dec 2021 18:40:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D15CBF80084
 for <alsa-devel@alsa-project.org>; Sat, 25 Dec 2021 18:40:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D15CBF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org
 header.b="eaAoE4zt"
Received: by mail-oo1-xc2e.google.com with SMTP id
 e17-20020a4a8291000000b002c5ee0645e7so3762143oog.2
 for <alsa-devel@alsa-project.org>; Sat, 25 Dec 2021 09:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WfzhWj1jtwCdxEak/D97aNhkHTpQCqGgLyMJk8IXEwI=;
 b=eaAoE4ztF41KiZpnzSfaK9/FXh47Z15i/58PZS//afGbMpjYyS2woT9xWMHQvEJeZ4
 bK8MppOg/i4qnbJie6j7sWtJ7DGauG30E0V7rDy8BmdJfBeXDMbumgI1fm5bCHxI5XYO
 tfIwqEzLG9RVVBP1WWMq9TPuMm/Jt/K8xlFZWn+NsPSk1g/FSE1p1+6V1IqOEvPLuKOI
 wA+qcKwIBZm3rCsf3L/ZPj7+DYd5gRbXWH5uWOaJxZjOipCEBBLqJZCfP7Q50xm9mBTN
 2RAfJHyd4eH4p5j189+F/LnRv4qAFKuBdN/Wk9PN/nUF0W6qBU4wZW0u/m5Fy5qDyOX7
 F5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WfzhWj1jtwCdxEak/D97aNhkHTpQCqGgLyMJk8IXEwI=;
 b=8GA8wdQhCwZGlxohMInsYd3hG7h2wLXnK6/0HU1FlzQJSJcF1JYYn2OI3N2wJVV2Ju
 rHZQ7UuSNFd+Hubfa5i8wDJTECrwxEDuj4omBOQ450bPrEWi+P6NjaHIhf6OsUJ8mmH3
 2rO1Wxwhe5HKVM+6WCwfz8RHR11Ok3XFrN+EYroOso0mfrlJ3vOAvH0fjVQhCbcU87O9
 sMBee4TL1vYgnIjqLfNMsuYLJSQ3DC6ZBSmh1ztoNs9hwmFqHnR+5xnRd1FsxgxZI+sa
 FKBFlGMREfcHt2wM9v7HXdH9Xf/aWwiPYU2WfK8OEpF485oSNVoq2kD0aRDUqKST0dcn
 Vc/g==
X-Gm-Message-State: AOAM531lOCqXyUSLOVW0mUfj2qqkgC4fxpy5rjLXHLc01qvZJU7ug3yp
 hB0jQnSNJhFwMv6NweniLhcBgA==
X-Google-Smtp-Source: ABdhPJwTd64h6NmnuJkKrnhyJ8AydZv/uOcsiocQB/wkmdKbXj9YXiW8i6BntXb/sn4Bbg1VBBPEpA==
X-Received: by 2002:a4a:9612:: with SMTP id q18mr7025002ooi.36.1640454006594; 
 Sat, 25 Dec 2021 09:40:06 -0800 (PST)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246])
 by smtp.gmail.com with ESMTPSA id v20sm2018193otj.27.2021.12.25.09.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Dec 2021 09:40:06 -0800 (PST)
Message-ID: <85cc3f89-6e87-6fc7-311e-d410833d75da@kali.org>
Date: Sat, 25 Dec 2021 11:40:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Use platform_get_irq() to get the
 interrupt
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20211224161334.31123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 26 Dec 2021 09:19:06 +0100
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


On 12/24/21 10:13 AM, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
>
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
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

Tested on Lenovo Yoga C630

Tested-By: Steev Klimaszewski <steev@kali.org>

