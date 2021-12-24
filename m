Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D208647F081
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 19:08:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630E317AD;
	Fri, 24 Dec 2021 19:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630E317AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640369306;
	bh=o+yCK9ACjFoh7YUFC0yTky2BeehNBi5YTM7DQK6Mp2I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nUQmR+KrZHoFQPsy6dEVVTCg39hO5DSLWcjvlRev4hfin8f8mofT3uWDmwlhYDCg8
	 6Ae5caEyfRSmHXClL5TdEWoavDmtvkO/DfrpW7hPPYQXrhjnwx4xM385J8AksIThpH
	 sRehn7RmeRXEWZhVNEgsUx8Xs0midx3HLyFI2CRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDF18F80084;
	Fri, 24 Dec 2021 19:07:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 024FBF800FF; Fri, 24 Dec 2021 19:07:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4252AF80084
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 19:07:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4252AF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RbXc0A07"
Received: by mail-oi1-x232.google.com with SMTP id j185so14709108oif.8
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 10:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4WwkxD9pRsYNmxI5wJenMz61e+2fgc2AqpBuPszq2ec=;
 b=RbXc0A07i189egi89NZXRTEqbxCb9KwdACbYmsqaXqiOGmfribp+2gFQgcsuJCGdBd
 jawfI1a7zsBghKnXIlDW7YZvmodr3pPce2rdVwl5KID+z+nPRmX3U7UbIQje37R9olq+
 fntQorCcgI8ik+8Y5dP5ZYA1jRKnK5+vS+bMtHT79uFh09hIck7bW0ZIARnzmNLIB5Kf
 CeulPv8RenriKuwquuOYJ4OESwTeugUFdnu0Xx3afSs8nyaNj7bqY/Q7ak77+V4EZ5q7
 XZKExRJv82hKWylcltqro9dO/ujOc6JinLOo/kOFuJAq6DMtCwh6DSMaWssM4hREhWbJ
 Eb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4WwkxD9pRsYNmxI5wJenMz61e+2fgc2AqpBuPszq2ec=;
 b=P2crxMEaOhU9HIft3tzWoxPhZrhN5CCMWM8AYZqSnaLHf4vuCkR0x4tPN3dEK45g5C
 teIfkchCpDrjHPTu4lmvw3+6S+XxLcvQg0DunWCLPlpG3+C9pIe05xBQe8IcQSb0zPBJ
 BnOxp1c6VPc+qzsGVirRsE9737F03gH5Yl0djDXoQ14iwI/kH+1/XTifQjL2zA22/pEx
 b7KpSrGHPW7w/gZacjY2J8Xjy2dVhhuLhWL2RTCCKK7+mbJMAnhio09otz+UOVfyWDFR
 XvnYMlorsJQMxtH33QsYzowLMxGMW05L0oWxAyfQBwQBNdL717mq1liGRHB89NniZdcv
 iGyw==
X-Gm-Message-State: AOAM532FcGBCsqceU96U6gASJYHfA/mDZ6E55uaC/49mbNMVJivBAM5V
 ObMOylVCZCks69LNBkHymlSUaw==
X-Google-Smtp-Source: ABdhPJzJoKsrdaRl4JDv5CJ93Xuh7aO3Rr8Y4L/8xojES8sfdfdDcC9F1afkDy+uY0g7UIxoouFa9Q==
X-Received: by 2002:a05:6808:e87:: with SMTP id
 k7mr5929610oil.16.1640369228274; 
 Fri, 24 Dec 2021 10:07:08 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id bg38sm1801972oib.40.2021.12.24.10.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 10:07:07 -0800 (PST)
Date: Fri, 24 Dec 2021 10:08:11 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Use platform_get_irq() to get
 the interrupt
Message-ID: <YcYMi4QthNLF3j/f@ripper>
References: <20211224161334.31123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224161334.31123-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On Fri 24 Dec 08:13 PST 2021, Lad Prabhakar wrote:

> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

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
>  drivers/slimbus/qcom-ngd-ctrl.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 7040293c2ee8..0f29a08b4c09 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1526,13 +1526,11 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	if (IS_ERR(ctrl->base))
>  		return PTR_ERR(ctrl->base);
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
>  			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
>  	if (ret) {
>  		dev_err(&pdev->dev, "request IRQ failed\n");
> -- 
> 2.17.1
> 
