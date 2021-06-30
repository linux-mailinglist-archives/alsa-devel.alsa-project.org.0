Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E00733B84A9
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jun 2021 16:05:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA8001684;
	Wed, 30 Jun 2021 16:05:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA8001684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625061951;
	bh=duzY7eKzVSRbBd74H0tPEAdKyoY5Mu+54r3Lt7EzJAw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lPRxXOsl+oIayRs+HJWE+cj0Z2qqao80QkpCnd+6XpOcmXm82w/aKs0WlGyS0g9dM
	 gfNR07EMPD0Xa7xaety4teg4TTs9WeAQAYo8gyFR5kNcCSjCWgqx+8r6YJbTGz5NH7
	 J28PRHm3FFcDQmNSLiUhxCr37xLzQNJEBWDn/Y10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21F32F80217;
	Wed, 30 Jun 2021 16:04:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC40EF80229; Wed, 30 Jun 2021 16:04:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C640EF80156
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 16:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C640EF80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jAyYP64u"
Received: by mail-lj1-x233.google.com with SMTP id h6so3435934ljl.8
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 07:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=57vYDWtaiAc9fCqO279XfLyvE20qvnTCvRyRXxlPmgg=;
 b=jAyYP64udX37D3pFHoVvKXOKf/Y4VbO6LowSd9VeDV6VfPWc+bXfUK+PMkpepVH3Bp
 jVP2gRZf2Etdvgc31YlomCyMWCnGxFQqN381nKXatw/zG9cdB/VZF7UxPXCQt2Zy0ZQ2
 zXjeyK2E6OPn6xA4ohdg6vNymxpwtmHysVtPdu4WI45CTbsBG23WuuftbEJ9tQuqWplj
 m728AUXnnlOTYzIseByCBXoJyXipeyZpjyOGaKTMuO2KDfEB8ssAp1NqsuZFyw4n1qGa
 z4vbfOKitKRrO0sHtBNWVaZe6vvpGGWjZPy4Rb/OdWXCdcn2lMKlzygG4JSC6Aq3L3Rg
 wT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=57vYDWtaiAc9fCqO279XfLyvE20qvnTCvRyRXxlPmgg=;
 b=De3R0/QGgKAbXz0IBkLON6oJcwbpL1xlWKqI4fPaADJXKQy9jXh0nsKh9rIGl7xvjH
 3FX/gJBb9MPZYWfLGwXaWhOfN9cYWn7rP0NLpwa1TAcEjIjjhf7fu4Ym4XlDBZuFxEXK
 zFLI0l0+D8pL5/f/z/p37h1mnbNbRuXYnp5WwWzVI29kpFI/T0gDVLrhG7+eeoNU5B1M
 7GJFn090bLocIH+gdzDuc/rN5qJ2A6ZWvDH3AzRlKS6N0XL2B4ZuoEIIKbof8FKy2A0p
 TZdFM1CCKzcEw/jmbgBW6/f5tL9ai8/BBXPamD4dPtuH7/le2b850znxJzEzlcdYJfT1
 iUVA==
X-Gm-Message-State: AOAM531AUA0fkgoStZeZowgeJutN5k3VRu1mcP9IJ5a42FBcRaX31GuG
 5psanazLl/rAzAAGG/cGIyA=
X-Google-Smtp-Source: ABdhPJy/2s9U8czt+fFFdv6oHM3g32XncInGR8IEojZ5SGHDCn98TDgZkw4S+KzOn64r++ck2UAYNg==
X-Received: by 2002:a2e:9c18:: with SMTP id s24mr2330139lji.249.1625061854376; 
 Wed, 30 Jun 2021 07:04:14 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id o15sm1565990lfu.134.2021.06.30.07.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 07:04:13 -0700 (PDT)
Subject: Re: [PATCH] ASoC: ti: delete some dead code in omap_abe_probe()
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YNxTHXz58dhgbFtG@mwanda>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <24479ba7-6fc3-fce1-735d-b611d056412e@gmail.com>
Date: Wed, 30 Jun 2021 17:04:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNxTHXz58dhgbFtG@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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



On 30/06/2021 14:18, Dan Carpenter wrote:
> This code checks "priv->mclk_freq" twice and the second check is not
> required.  The code is left over from when removed support for legacy
> boot.

Good find, thank you!

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Fixes: 8fe120b5a665 ("ASoC: omap-abe-twl6040: Remove support for pdata (legacy boot)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/ti/omap-abe-twl6040.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
> index 91cc9a4f44d7..2e3d1eea77c1 100644
> --- a/sound/soc/ti/omap-abe-twl6040.c
> +++ b/sound/soc/ti/omap-abe-twl6040.c
> @@ -292,11 +292,6 @@ static int omap_abe_probe(struct platform_device *pdev)
>  
>  	card->fully_routed = 1;
>  
> -	if (!priv->mclk_freq) {
> -		dev_err(&pdev->dev, "MCLK frequency missing\n");
> -		return -ENODEV;
> -	}
> -
>  	card->dai_link = priv->dai_links;
>  	card->num_links = num_links;
>  
> 

-- 
Péter
