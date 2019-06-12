Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 250D642862
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 16:07:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69D2F1764;
	Wed, 12 Jun 2019 16:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69D2F1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560348431;
	bh=gBt7uID6WGJf7GaBkvXkv6665sSqhFMxMYGpT+rW8OI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aC3YwGbR2RuiHiI/sEoktkZXlLZ+ilmqeGUJ+Yje7Eo8vzlblYyz22OzgdpWENptt
	 lXExW5j17ckJhl/92Fca5qn/y7Z0C/6n2F45bMU5RXmVPAX2MC+BiaeF2hVha6JzP8
	 /QzunA/8nRjxxA1cKj3/C1KDlIh0XiV77Jv8RjHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA8D3F896EA;
	Wed, 12 Jun 2019 16:05:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF4DAF896E0; Wed, 12 Jun 2019 16:05:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30AABF80791
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 16:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30AABF80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Pii1LECE"
Received: by mail-wm1-x344.google.com with SMTP id w9so4374825wmd.1
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 07:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5tpcgl3qIKhsxO50HPH4oBdVdF+iPNj/upBLCYMsWNU=;
 b=Pii1LECEMqdhzLzjeRUu1DZhdns+EBva2g55W5ECOwLzWMa+jOQnntv9lQvBPiFuLj
 lZWVR7q8vYvY0fWRfPUv63GEfzpxaVLPYHBnAtLNQkS4/9DK/ZlLmXpi8n0+1CXicINv
 au7GhTDuMF6KL44mOPJCMjlee5EafJKrh8MyajFVJu+s0w48ZkbJ3zfq3rJqefkgzLDy
 qATazzBC0wp2JjJvbbIAs89x3SGckpx14a94AqbALysQB+7fVJx3FeEmtW+H4V9xUXvI
 Lfd2x/8ezGFT3JvtDHsxnwqwzbXSH4BnohjtVbCEKsuy4lsDvtPZmiLahOWpwYemnsRn
 UvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5tpcgl3qIKhsxO50HPH4oBdVdF+iPNj/upBLCYMsWNU=;
 b=gnXUfR0HE9A25YG359JSZPTUEgcbvN0tm/BXe8vdTgXp0SW98gnI2HbtOdEIrPxIuE
 6xvzb9Umz9mVGjqf+npTCLjG6Wj63qC3lwGUNoMMu/d1DX3pJTP3TQ99DNTSAmOCmABy
 BiJ5ELcZl0SRS7nxWlnPvc4VZEox500kuf2rdQl83Rc+H9E7+SF21O7y86dN/o8Fylz0
 N6CiRVx9SmoBXqVxtU7K9t521HvDkuPjPnrvMejx9V+Ba33cwsyNn1QHFOy4OUaYxlIq
 dbriAOHYVxAl++xm16Ut3Mz9ucx33sLf9eikQR4Z1neDPJgLpPVs6bGSeLuNNuNmJv3q
 /85w==
X-Gm-Message-State: APjAAAUPfZWh1p3xJb/1CT7GvsBuf1tqOKgiCLiVynGfIY78jFMo+JK/
 cC35rSmo/rowkjQVagyyPWo=
X-Google-Smtp-Source: APXvYqyp0JazxfPqtev9TZ+RrwJc7uk33jOlE4vqY/kQfu5wMp7gPKqQMfB1kLVpioSt4Q+/G5hbNw==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr3609046wmb.66.1560348321342; 
 Wed, 12 Jun 2019 07:05:21 -0700 (PDT)
Received: from zhanggen-UX430UQ ([108.61.173.19])
 by smtp.gmail.com with ESMTPSA id y38sm28564148wrd.41.2019.06.12.07.05.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 07:05:20 -0700 (PDT)
Date: Wed, 12 Jun 2019 22:05:11 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: Ben Hutchings <ben.hutchings@codethink.co.uk>
Message-ID: <20190612140511.GA4412@zhanggen-UX430UQ>
References: <20190612133040.5kgtio7gidxx64gh@xylophone.i.decadent.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612133040.5kgtio7gidxx64gh@xylophone.i.decadent.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH] Revert "wcd9335: fix a incorrect use of
	kstrndup()"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jun 12, 2019 at 02:30:40PM +0100, Ben Hutchings wrote:
> This reverts commit a54988113985ca22e414e132054f234fc8a92604.
> The strings being duplicated are not fixed-length, so kstrndup()
> is the correct function to use.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@codethink.co.uk>
> ---
>  sound/soc/codecs/wcd9335.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> index 85737fe54474..a04a7cedd99d 100644
> --- a/sound/soc/codecs/wcd9335.c
> +++ b/sound/soc/codecs/wcd9335.c
> @@ -2734,7 +2734,7 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
>  	char *dec;
>  	u8 hpf_coff_freq;
>  
> -	widget_name = kmemdup_nul(w->name, 15, GFP_KERNEL);
> +	widget_name = kstrndup(w->name, 15, GFP_KERNEL);
>  	if (!widget_name)
>  		return -ENOMEM;
>  
> -- 
> Ben Hutchings, Software Developer                         Codethink Ltd
> https://www.codethink.co.uk/                 Dale House, 35 Dale Street
>                                      Manchester, M1 2HF, United Kingdom
> 
BTW, why don't you use ben@decadent.org.uk this time...
I am just curious:-)
No need to reply

Thanks
Gen
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
