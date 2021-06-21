Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7930C3AE5F5
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 11:25:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E043B16D2;
	Mon, 21 Jun 2021 11:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E043B16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624267501;
	bh=KytmJdTQwDlbNDbm+QkJJW+ZeZCdhEu5zii7Ab8zpFI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MhA8bFbmrtb/PdFnnUhOE0d7A5lzLx4dKky1J1dJciETB98HZriWF25MQMfyKACO4
	 HXCM3TwAZ1SOx5nrM+EFVfEuX8KJaMRSI1r6zuCBNK6Xva02V/dIXVJXWod8d50gjY
	 0Q5R77XVl3vt0a/5+kIrrl8efDo58nOePeOPQEjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40D68F804D6;
	Mon, 21 Jun 2021 11:22:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8279F804D6; Mon, 21 Jun 2021 11:22:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EA49F8016D
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 11:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA49F8016D
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lvG8f-0000c8-1r
 for alsa-devel@alsa-project.org; Mon, 21 Jun 2021 09:22:41 +0000
Received: by mail-ed1-f69.google.com with SMTP id
 y16-20020a0564024410b0290394293f6816so7417423eda.20
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 02:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hZC3Rg3BvJB4BQwVaSuLDsENz/aC3X5mhOq0Jc6AB58=;
 b=dmhqSWhVRxKW5t0W/a4iJao5BRdUMKKYI56QV69ZCsil/XmkCKmNxRjZeIWhqtD7Ff
 dM+0nOYoFF9v03QlAEhkuYno0uqF94spgRSstRVbGDJPCA9k07RWZ3KnWe3XUQpdiZW8
 xKyMhGOd6iQopWil6BxBNa82vTFs+DrRzvINtUmSaqIuV0tWgHL950woia7eAHQnhY5S
 6433u6ZISSauoOvSHYgE/+yPy/ZdJYNnLWIgZU1UpSMUnR1VVBsbk6+8rCtpZUDSmlKM
 GE0AsGrRIW62wwxJ65uYd/1wJFaCYty/zbw0pmrgg5fcWCpEA6YVtlc+M6m+JAKfGj3L
 ZnXg==
X-Gm-Message-State: AOAM530aClJ32G1wsM2ut8RSjF4I86GW2LrWOfZzvpc9s2e/4CXIvDmn
 0xnbsJ2PweUkAW0TxQOmkj+QGOr+cnCaOHZaEC2Mu2uXxb/FKuC2HtMOhoyoFnfAi5ghT0IaYCa
 uW5E7acuIrUshzGes/m10zwjAs8z6parwRuF3KMP/
X-Received: by 2002:a05:6402:b17:: with SMTP id
 bm23mr1884934edb.173.1624267360873; 
 Mon, 21 Jun 2021 02:22:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwfZk5ISqN2ouBhxsLkXdlM8l0yr/wsX851g9ngedNHQwRH0qR983JIMEqkYLCHTg+bWq3Yw==
X-Received: by 2002:a05:6402:b17:: with SMTP id
 bm23mr1884925edb.173.1624267360791; 
 Mon, 21 Jun 2021 02:22:40 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id q20sm4633633ejb.71.2021.06.21.02.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 02:22:40 -0700 (PDT)
Subject: Re: [PATCH -next 1/4] ASoC: samsung: i2s: Use
 devm_platform_get_and_ioremap_resource()
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20210616091652.2552927-1-yangyingliang@huawei.com>
 <20210616091652.2552927-2-yangyingliang@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <aaf277d2-a163-1658-4d01-b5843ea95b81@canonical.com>
Date: Mon, 21 Jun 2021 11:22:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616091652.2552927-2-yangyingliang@huawei.com>
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
>  sound/soc/samsung/i2s.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index c632842d42eb..309badc97290 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -1441,8 +1441,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->addr = devm_ioremap_resource(&pdev->dev, res);
> +	priv->addr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(priv->addr))
>  		return PTR_ERR(priv->addr);
>  
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
