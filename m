Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DAA4F6AAD
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 21:58:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5AE9170F;
	Wed,  6 Apr 2022 21:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5AE9170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649275096;
	bh=VZOpPuNLMzwL5gdslrykRO3rE041x6y0M1he5pPnhEE=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mWaMu0ExQi0boyR+AkUNTYUHDf/xtcnO3DDw0rxuOBwjMyNyCn8orNfg+oYz6+mv5
	 1YdmVZUwXZ4ORldGp6pXDTasV7M8IsI+J15Lyn1B6drWMHAKefdMHiJgvOPvN2FUHK
	 IQyLtp5T0XYzUy7hwrDo0L2BTmQWgnmrMHWCrR1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C4FF80054;
	Wed,  6 Apr 2022 21:57:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60975F80141; Wed,  6 Apr 2022 21:57:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B370BF800D1
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 21:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B370BF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qQ26SHSZ"
Received: by mail-lf1-x12b.google.com with SMTP id y32so5953003lfa.6
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 12:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=g7ztqiXiRJRWyb0oF8JanOthw/sBGyBWWS1T9cwNFWA=;
 b=qQ26SHSZT6N2m5UMWrPZvxHJGfnffKEvFJmf+AiWAlUNgpOQY8WXUy7LcnzBrLgzGt
 9zLN060XMX5PI3NFkk1JChqWAbw9Gmxorw3Og8nUOCNB5TfxjfezD0GB9rG6Yj4e4+k1
 CNdv4rxdO1J54ddTKgYF4hnBPFRx/x3+tyO/UeqAEBKsguQdjEpsMiYjbpYXIOso7LKH
 C7uNebs9yYBFIFiX+ufGavfOCnJymLQBB6GiarnSAS9CgiTyN+VEV7mxoOW+KiioCr2n
 WRddAhl/ro7i0jb9t7hPzlW1fHB9QinIocsXiWT8gEspKZ4IgbQckqJ7YhsvkqCi4uhD
 R2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=g7ztqiXiRJRWyb0oF8JanOthw/sBGyBWWS1T9cwNFWA=;
 b=J1vmRnNobcucJbA4SWT1FtlVfPs5YGBJrFzdWOH/4BvQbPCSB6+clWhll3kfVYtXZZ
 UAW6kxwoKhQLZH2E5SNC8xs6TKW4Wub5crWPsgzt7wAtoUt6obuYv6vEr8D/qpCIoByY
 DoN3wQOOEvC1Gdg2QY8wOIW0q9RWDGGDyXNBNUhpQDSSjcQpCBgIgEoE7weT2+CxMScM
 GMbwy01U0+DGFI/5POUXF3wX4tVpuU24FcKmpO0QjDbKVTW/EmAayebs2YYr6lsY/JVr
 VtF3207sKcwdI0o2ULQaSEFtge6aA7GQl4j235NewO2nU6uhZXVtxsphaJ9Uz+Vo5mM0
 v+7g==
X-Gm-Message-State: AOAM533OLQ0pQ7Zcrsot8q/1XUTMnftSTJaEVk8Fhtk27fXEcGlLbrGR
 lVyLsGzopYIB1/jO1Fw3W1x6S8ijNUSmW5pL
X-Google-Smtp-Source: ABdhPJynpegKu4/oSyXIHRHMGizneGJGYguDdzuoasTpZArw9AqSno9DKrZaGCfs/NLf0zj1CkLOJA==
X-Received: by 2002:a05:6512:20ce:b0:44a:384a:9195 with SMTP id
 u14-20020a05651220ce00b0044a384a9195mr7076190lfr.492.1649275032572; 
 Wed, 06 Apr 2022 12:57:12 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 h1-20020a2e9ec1000000b0024afb868455sm1744622ljk.5.2022.04.06.12.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 12:57:11 -0700 (PDT)
Message-ID: <1fa386d7-2222-f12d-8a8f-c7be29b1c6d2@gmail.com>
Date: Wed, 6 Apr 2022 22:57:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] ASoC: ti: osk5912: Make it CCF clk API compatible
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20220402120106.131118-1-jmkrzyszt@gmail.com>
Content-Language: en-US
In-Reply-To: <20220402120106.131118-1-jmkrzyszt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>
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

Hi Janusz,

On 02/04/2022 15:01, Janusz Krzysztofik wrote:
> The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
> supported by OMAP1 custom implementation of clock API.  However, non-CCF
> stubs of those functions exist for use on such platforms until converted
> to CCF.
> 
> Update the driver to be compatible with CCF implementation of clock API.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
>  sound/soc/ti/osk5912.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
> index 40e29dda7e7a..22da3b335e81 100644
> --- a/sound/soc/ti/osk5912.c
> +++ b/sound/soc/ti/osk5912.c
> @@ -134,6 +134,10 @@ static int __init osk_soc_init(void)
>  		goto err2;
>  	}
>  
> +	err = clk_prepare(tlv320aic23_mclk);

would not make sense to change the clk_enable() to clk_prepare_enable()
in osk_startup() and the clk_disable() to clk_disable_unprepare() in
osk_shutdown() instead leaving the clock in prepared state as long as
the driver is loaded?

> +	if (err)
> +		goto err3;
> +
>  	/*
>  	 * Configure 12 MHz output on MCLK.
>  	 */
> @@ -142,7 +146,7 @@ static int __init osk_soc_init(void)
>  		if (clk_set_rate(tlv320aic23_mclk, CODEC_CLOCK)) {
>  			printk(KERN_ERR "Cannot set MCLK for AIC23 CODEC\n");
>  			err = -ECANCELED;
> -			goto err3;
> +			goto err4;
>  		}
>  	}
>  
> @@ -151,6 +155,8 @@ static int __init osk_soc_init(void)
>  
>  	return 0;
>  
> +err4:
> +	clk_unprepare(tlv320aic23_mclk);
>  err3:
>  	clk_put(tlv320aic23_mclk);
>  err2:
> @@ -164,6 +170,7 @@ static int __init osk_soc_init(void)
>  
>  static void __exit osk_soc_exit(void)
>  {
> +	clk_unprepare(tlv320aic23_mclk);
>  	clk_put(tlv320aic23_mclk);
>  	platform_device_unregister(osk_snd_device);
>  }

-- 
Péter
