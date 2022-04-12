Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 205794FD331
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 11:07:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD00616A6;
	Tue, 12 Apr 2022 11:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD00616A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649754442;
	bh=rnjInkowutSj7ol4v7/eQcXu6pBnwptMUKosAtXfGwo=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fLW4frmxnMP4qsI8ZgTLArj6XWKgl5/rakMOHMC++pUfr/0rYycuPq2QvFLeKg+Sz
	 DI5agmPuvQlUrGEt99Q3uV9PxWoi0pj203iC1QG/4SLzRZgUUdHjsSi2kOnWCb9Al2
	 gGr4unY0M1bujJx5Ykagd99VdW+HNYvSj4PXmqpo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4108EF80245;
	Tue, 12 Apr 2022 11:06:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3178F8011C; Tue, 12 Apr 2022 11:06:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 186A7F8011C
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 11:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 186A7F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FgvDw1Ru"
Received: by mail-wr1-x436.google.com with SMTP id w4so26657569wrg.12
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 02:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=TcbQOnznNM38vbqn4dzf7jYEVnEO7TEqfVzrcEANZdA=;
 b=FgvDw1RuIAKPJbLmdUWuxbejU3TEbMwippcIC3e1RZFiwuTdqSXegk6DO/0S184zN7
 ZxetjPdw7QvHIknfHNJr2DbQF/5AKkurjIiaLA/fopymwMVH6cBTgTxXnRYIEFlUlSYs
 XEufP/K2/jtm9Crs/8dSJgPW7vvhW62UuvBxa5XJ4EU4OOG7EdAR+nbROACZb9/jHyIg
 gxRp8kZS9xsMf5edPWC4xWfakFXLV0HOIa179FqG0PzcAe3hYo7i/eXMeebGVruCb6o+
 iAte2FpSwgaF2oZCDVqZ5knjPR2wvtk1VihxMiPl9advkhXBl3JVxGVQKGg39s8ECZTw
 Quaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TcbQOnznNM38vbqn4dzf7jYEVnEO7TEqfVzrcEANZdA=;
 b=Lmzdt8+0EU4/gPKQ1s4/ksOrWmf5XtGQf0uxrj8scOKDEegwPiu4ePL6bz0fljm81H
 VBvA8tWthDAx/Ldyzx8sotMaFXFSVlZoOojR5dV9BK1N8JLNXzhMG8SOBX8RCo/P2x3G
 xICMTGA6Nj4UTsIt17I0lw7v2wkR4Riq7sNaVDFNG7PGjZfsIfykTvk3LD3F4ll59dXr
 QIFAjlXPO5l68oARZsIOHJTaIFeo6P2+q5ShXgZBCk9wP1iQXHl+J3pii5idwCslSFRs
 +6GZI4JLpPDjgQXSP/O3AMzz4GtM4Udtq/gEnf5zKcqfr9wwZg/5bWDP6tOpq9O16sNL
 LjYQ==
X-Gm-Message-State: AOAM533gRE9GxN3kvE6x9oTDYPTHkSXHPowaFAMtkqCTyWbX8bfrZgJ/
 BtP7b5KwrUYxMouiL9gCAHeEuQ==
X-Google-Smtp-Source: ABdhPJyCsICMMt55JJuqse75adWYa2k+xDavBtU14NQhFbciHUBoB8+E7linJ/Ua3r5xirDa71f7Aw==
X-Received: by 2002:a05:6000:15cb:b0:207:9f9e:547e with SMTP id
 y11-20020a05600015cb00b002079f9e547emr11653325wry.549.1649754375837; 
 Tue, 12 Apr 2022 02:06:15 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 g17-20020a05600c4ed100b0038ca32d0f26sm2000647wmq.17.2022.04.12.02.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 02:06:15 -0700 (PDT)
Message-ID: <4d3a73bd-4048-2cef-0682-0823e29a6514@linaro.org>
Date: Tue, 12 Apr 2022 10:06:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] slimbus: qcom: Fix IRQ check in qcom_slim_probe
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sagar Dharia <sdharia@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <239c3b32-6754-02ba-6bfd-7f05fa2adfed@linux.intel.com>
 <20220301061421.14366-1-linmq006@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220301061421.14366-1-linmq006@gmail.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 01/03/2022 06:14, Miaoqian Lin wrote:
> platform_get_irq() returns non-zero IRQ number on success,
> negative error number on failure.
> And the doc of platform_get_irq() provides a usage example:
> 
>      int irq = platform_get_irq(pdev, 0);
>      if (irq < 0)
>          return irq;
> 
> Fix the check of return value to catch errors correctly.
> 
> Fixes: ad7fcbc308b0 ("slimbus: qcom: Add Qualcomm Slimbus controller driver")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Applied thanks,

--srini
> ---
> changes in v2:
> - use more precise expression in commit message.
> ---
>   drivers/slimbus/qcom-ctrl.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
> index f04b961b96cd..ec58091fc948 100644
> --- a/drivers/slimbus/qcom-ctrl.c
> +++ b/drivers/slimbus/qcom-ctrl.c
> @@ -510,9 +510,9 @@ static int qcom_slim_probe(struct platform_device *pdev)
>   	}
>   
>   	ctrl->irq = platform_get_irq(pdev, 0);
> -	if (!ctrl->irq) {
> +	if (ctrl->irq < 0) {
>   		dev_err(&pdev->dev, "no slimbus IRQ\n");
> -		return -ENODEV;
> +		return ctrl->irq;
>   	}
>   
>   	sctrl = &ctrl->ctrl;
