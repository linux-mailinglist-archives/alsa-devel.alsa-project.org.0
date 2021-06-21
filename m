Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DD23AE5FB
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 11:25:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A86416BE;
	Mon, 21 Jun 2021 11:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A86416BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624267513;
	bh=OjLZ1liKVnkwT47vwE+2RnFVu2xA7+Ujmf9h2TxW5LQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aFENkBRAdf+4xalitTens2dcPs9eUwyxhsjyzX6+rs52BzUr+ifJjl3Yk0Qt4rWff
	 u7sYqUlSvyONF3sba2AV1kXaVlL1cIt8C9b7VLf7VBdZX114jAcy5sX7ZlezGMMV4K
	 rA203ZgyeQT9d3k5b/7DSOrK+iJE6xXVh64VdqAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44FCBF804D8;
	Mon, 21 Jun 2021 11:22:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B04EF804D2; Mon, 21 Jun 2021 11:22:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EB31F80245
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 11:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EB31F80245
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lvG8i-0000ce-O3
 for alsa-devel@alsa-project.org; Mon, 21 Jun 2021 09:22:44 +0000
Received: by mail-ed1-f71.google.com with SMTP id
 ch5-20020a0564021bc5b029039389929f28so7397612edb.16
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 02:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9hRe7zjfZNvSRfKJkWKSh5Dej/dPL2l2W1UbNWsYK2U=;
 b=MgynHI8VOsnUThgNhe4PdY9p5YqkccPvgEsqECJBJ1EKtMUA0Oj2KmuXeiVSHX9j95
 PJ7nzwkPHj2vCB9l7XUHWpao27YIT+pXyb4OkLek/a8JsfsDTrTwCgH5+BiOCkqvsIo8
 0wae5Vqn4ccvAFnnkCjAKUz4i0/SXg4nV+/032doYxqSOFuibpHoVyicrjBpYGUERkME
 Rx8/8XSFI5X8eVhKXwQ7oeXiv+4Ar6H2PaHE4Fp4bQp4UMq5lZePDNK3gOfyLrbrnNZN
 x0tmHQajWwtKz1d67mC7UHzNliFusBKsVTBLPr/ziMYFPU139AnRubADM4C0LLziFgXx
 U4LQ==
X-Gm-Message-State: AOAM530W7HBjLHWqxromZY8d4T2DJ849yLYGR9+TyUM/CwbnJ7OZH9Vz
 OSBr9ZUNE1QN3HH1dJ++wVbAVvryYxWSDBZRbD2UyHMsWJWA6G9IAKC/uG9SiwmFNyP1zcYWd0r
 z1ZnAy5HBxNBPDqheXj914yP8CILkpXYjDUEOhqrc
X-Received: by 2002:aa7:ce86:: with SMTP id y6mr20052617edv.309.1624267364569; 
 Mon, 21 Jun 2021 02:22:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdTF04BSdUZTAZjRPtmzyfYfNWL/XJ9f/4aweEYPF/XycKnP7nFSxN+HP8ORuLjmJWF1Se3g==
X-Received: by 2002:aa7:ce86:: with SMTP id y6mr20052598edv.309.1624267364414; 
 Mon, 21 Jun 2021 02:22:44 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id df20sm10047400edb.76.2021.06.21.02.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 02:22:44 -0700 (PDT)
Subject: Re: [PATCH -next 2/4] ASoC: samsung: pcm: Use
 devm_platform_get_and_ioremap_resource()
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20210616091652.2552927-1-yangyingliang@huawei.com>
 <20210616091652.2552927-3-yangyingliang@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <88808fcb-d89b-9e90-bd5e-c9074f373192@canonical.com>
Date: Mon, 21 Jun 2021 11:22:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616091652.2552927-3-yangyingliang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org
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

On 16/06/2021 11:16, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  sound/soc/samsung/pcm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
> index bfd76e9cc0ca..4c4dfde0568f 100644
> --- a/sound/soc/samsung/pcm.c
> +++ b/sound/soc/samsung/pcm.c
> @@ -512,8 +512,7 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
>  	/* Default is 128fs */
>  	pcm->sclk_per_fs = 128;
>  
> -	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	pcm->regs = devm_ioremap_resource(&pdev->dev, mem_res);
> +	pcm->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &mem_res);
>  	if (IS_ERR(pcm->regs))
>  		return PTR_ERR(pcm->regs);
>  
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
