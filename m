Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 602A13AE5F4
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 11:24:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D458116C7;
	Mon, 21 Jun 2021 11:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D458116C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624267464;
	bh=a3vrotR3vHCGSL+9mpLaM9kGmvzYCpGchZuxBbUIzJ8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lOrPJUWVwzpHnvDsAVvL/dkPGuwuUA363eT5ZIuorDGUlGhZJzrU1ONPsXUel2xob
	 le9jEfwJm+22L2PKp2bEcEwT0G9SfyG0tfAo2lioHGYUxfsntcTWVMcyjCenyVyzNs
	 ukDF6VM5+4zTeHU/g7nN3rp9b+AxDpLHinAa7n/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C40FF804B0;
	Mon, 21 Jun 2021 11:22:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 263C1F80245; Mon, 21 Jun 2021 11:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECF1DF80111
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 11:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECF1DF80111
Received: from mail-ed1-f72.google.com ([209.85.208.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lvG8b-0000a8-Ed
 for alsa-devel@alsa-project.org; Mon, 21 Jun 2021 09:22:37 +0000
Received: by mail-ed1-f72.google.com with SMTP id
 ee28-20020a056402291cb0290394a9a0bfaeso1999442edb.6
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 02:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lFki3J4aiGoaJoSHiqdWzrvE2ADBGFOB1MBQxny61RQ=;
 b=BwquTICtXyj7Mb8qM1fK3zsSJSPxpTYP1SXKVcj01psTODrTVI1DbFcq665hMr99u7
 auPbuOcE3JDspO+2Z/6VIcp5Tz23aPFlZtjFbMjeZSeU5QmB+n2CPA4Vh7QFq0SLcoHx
 sObjPGBW8VlxtMFTsBsapoXsGYk6NxPkxPZTDdRu+OmdtHKy56+MtWpA7CiiY1ZVqwLZ
 6vkUw6qYx6CHutcSOXeM94Ec+Z0w0KPnqJN1gbsN7AxWVTbTTWsbVkyng6k9Gg8n91wB
 ewuwBS6FZiheJacQJZ8kBZmnIpJ/ll2q49CrcKahX4Y0h9ML4R/v+p29Q5xQM74s9nmw
 hgGg==
X-Gm-Message-State: AOAM530pPkarOResTzcV1NKOj8ndYdRKS0Sd0h3PuEL0rRY1iK52ValD
 uTFwQ46mmrcUFVJCgVnLehZqGdax+pnX2HLeulFWdEZ6IGIpyXHtJwMdrBqZMCQVPmPY7leMbKC
 sVDQ88O4n6HxbxVXY3gADlQcCXnpjOOiJb/dvonPD
X-Received: by 2002:a17:906:ae85:: with SMTP id
 md5mr23700220ejb.93.1624267357257; 
 Mon, 21 Jun 2021 02:22:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys4r+Z83OlHvoCM0AG3+WxmdWA+czemIHfk9Y1zu2ld/0q2m7OEVksFdXru0oGi52t90ECrA==
X-Received: by 2002:a17:906:ae85:: with SMTP id
 md5mr23700209ejb.93.1624267357154; 
 Mon, 21 Jun 2021 02:22:37 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id n2sm10348412edi.32.2021.06.21.02.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 02:22:36 -0700 (PDT)
Subject: Re: [PATCH -next 3/4] ASoC: samsung: s3c2412-i2s: Use
 devm_platform_get_and_ioremap_resource()
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20210616091652.2552927-1-yangyingliang@huawei.com>
 <20210616091652.2552927-4-yangyingliang@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9aabb88e-c40a-352b-3403-9ed6a728a9ba@canonical.com>
Date: Mon, 21 Jun 2021 11:22:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616091652.2552927-4-yangyingliang@huawei.com>
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
>  sound/soc/samsung/s3c2412-i2s.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
> index 81f416ac457e..ec1c6f9d76ac 100644
> --- a/sound/soc/samsung/s3c2412-i2s.c
> +++ b/sound/soc/samsung/s3c2412-i2s.c
> @@ -208,8 +208,7 @@ static int s3c2412_iis_dev_probe(struct platform_device *pdev)
>  		return -ENXIO;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	s3c2412_i2s.regs = devm_ioremap_resource(&pdev->dev, res);
> +	s3c2412_i2s.regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(s3c2412_i2s.regs))
>  		return PTR_ERR(s3c2412_i2s.regs);
>  
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
