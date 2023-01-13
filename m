Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC2E66A4F6
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 22:15:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 301459DB1;
	Fri, 13 Jan 2023 22:15:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 301459DB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673644557;
	bh=0Sj9Tr5QT4dzqV7iVWUiv4fQ8QN7e5UZzJ3VzXZ1p2g=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SHzgrOvrIS3UJfG7/fgstTSVQLQpbxMlZYcLhCOMG3DLRo1f5/jyE8sqeL5ogZ5gp
	 DArpTl32q5vSZPNbExRBYWnsICylDHgvA5QSZLykiNUpZryOyjlQ4Llo27evbm60YF
	 OzHxuKIyqwN/babPd6FguslhM1o9A5grinitdafg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6AF1F803DC;
	Fri, 13 Jan 2023 22:14:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29B81F8030F; Fri, 13 Jan 2023 22:14:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BD40F8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 22:14:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BD40F8016D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UEaP2XtX
Received: by mail-lf1-x133.google.com with SMTP id g13so34829785lfv.7
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 13:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v9Q6K4s5QhNtpyqKaOo9XKQFv6iSXNWhs/iQ5O+aNxA=;
 b=UEaP2XtXo9uy7oVa0Mz87dudlHhc0V2Q5x5WQVEk/m8qZCSXoSPkGIVRFfsH9Ciaxm
 SBHB/ziQ2ptuotGxaqnKCcYcb9PunzCiz+DCw1NSJ1YSvkRZEi+wREow/0tDFktgrM29
 Ha5F7WTugiMrsNPdMiyqDTfQlMCLMh7zLGVNpIyyoE1dtn5N5o7z3QPaxyPFZJCx2lgW
 YS1Wnql2WqjeQrg+PoIUJZRfVWeFwxMtrvRglR3jxHwZc9IIrkueG44CaXY8vVlxkleN
 bHmBjtcFSekyCvja8rzwLng1KsZmydkzMbL6wHNV362p+wFql7IQP3aGAuADeZf/aQ8e
 My1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v9Q6K4s5QhNtpyqKaOo9XKQFv6iSXNWhs/iQ5O+aNxA=;
 b=g1iB0JuQea2M4rUS1QB4B91a3XQ9IBhk/hbnFIomXzB+ebAfESa6MkcnP37Qk8vjQC
 LyS2d3SLncVPm64d3pq7nmc6FEJl8tsN+kzR1jnswX3KrZtaCxpLdmn9ADjRUAomnkjN
 C15245lxrnyu/MlmSHqeOoPgiCwh9JycDRDLIwL3X9+932rBvlLdS+/Ou1UNnfHOFy/o
 dXKcmNT8mQbQAO5nj+rJeRSZjkjYsK8/QlqcLD07N1Rn/ek7QpiAs8ScKqX0cIXY/Iay
 3Fb70o5MVrrJubM/iAnCfQCNtWSWHG0tRZjdzx2aTW6o6zuK8Ys4n7afVM7CGTgbCn8i
 o+hA==
X-Gm-Message-State: AFqh2kojxxY6/jXJDcuBavESg4n7LCZ3EF6tjb4MCE7m0UxP9DoEYPUA
 ogfGk0SqwTAzxaitM83pzFw=
X-Google-Smtp-Source: AMrXdXuEK+H214nGsU2CeNX7R70Aik1NHSOs3d4i5Hk0bWget27myBty8mnJZNTUN+JaQ2vtIOfZnA==
X-Received: by 2002:a05:6512:3196:b0:4cc:7ff0:dd64 with SMTP id
 i22-20020a056512319600b004cc7ff0dd64mr10176064lfe.21.1673644491810; 
 Fri, 13 Jan 2023 13:14:51 -0800 (PST)
Received: from [10.0.0.42] (host-185-69-38-8.kaisa-laajakaista.fi.
 [185.69.38.8]) by smtp.gmail.com with ESMTPSA id
 x11-20020a056512078b00b004b5821219fbsm4020206lfr.60.2023.01.13.13.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 13:14:51 -0800 (PST)
Message-ID: <69c4d620-4b35-1ea0-c3ec-3d564d183a44@gmail.com>
Date: Fri, 13 Jan 2023 23:25:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH -next] ASoC: ti: davinci-evm: simplify the code with
 module_platform_driver
To: Yang Yingliang <yangyingliang@huawei.com>, alsa-devel@alsa-project.org
References: <20230112135457.1490360-1-yangyingliang@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20230112135457.1490360-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: tiwai@suse.com, broonie@kernel.org, lgirdwood@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/12/23 15:54, Yang Yingliang wrote:
> The init/exit() of driver only calls platform_driver_register/unregister,
> it can be simpilfied with module_platform_driver.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  sound/soc/ti/davinci-evm.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
> index 983d69b951b0..544cb3da50eb 100644
> --- a/sound/soc/ti/davinci-evm.c
> +++ b/sound/soc/ti/davinci-evm.c
> @@ -257,18 +257,7 @@ static struct platform_driver davinci_evm_driver = {
>  	},
>  };
>  
> -static int __init evm_init(void)
> -{
> -	return platform_driver_register(&davinci_evm_driver);
> -}
> -
> -static void __exit evm_exit(void)
> -{
> -	platform_driver_unregister(&davinci_evm_driver);
> -}
> -
> -module_init(evm_init);
> -module_exit(evm_exit);
> +module_platform_driver(davinci_evm_driver);
>  
>  MODULE_AUTHOR("Vladimir Barinov");
>  MODULE_DESCRIPTION("TI DAVINCI EVM ASoC driver");

-- 
Péter
