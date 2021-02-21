Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E66C3209BC
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Feb 2021 12:14:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC28A165E;
	Sun, 21 Feb 2021 12:13:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC28A165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613906072;
	bh=IsUMGnkSKl8ECxMSk/D5h9/zawGyOol0J5Qv8pdJ98g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jFazMDD33mEEdCXbmrjWUbGbM/Sh5+zpC6R1WSAabXbfp4cUyG+Wtgucqc18PJ3CR
	 A/Rf3uzGD1VNfgLl0EcsuwZjUMCSoS+qulPErg51S2S4XH3W2kPm9FReSYFoTvfG00
	 g/V8LaL6xsuVKz+sWlqSMkOXOCDMOYUhXb617lgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EBF2F80167;
	Sun, 21 Feb 2021 12:13:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AA56F8016A; Sun, 21 Feb 2021 12:12:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34E55F80152
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 12:12:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34E55F80152
Received: by mail-ej1-f54.google.com with SMTP id e13so21108804ejl.8
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 03:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M5bmp6KZy4x+gcBWuMbEclayhx1aL+iHlTUJzSU7Ayg=;
 b=qHV3HXoMoH+CRc576zuSOf44IrHwJQUc5MYmxdDPspCLmVQPY/LrTiL2/ELwxzA8SR
 nQhoYmminh5X31b0VuJLdioxAFzNrl2GZu9LckVlzG+L9pBxhS3yLZWf7w6ypH4RcVED
 SI4V3XJQSZ0OlNDL+P8MsOpD9k2mU3sl05Kpx107vhWEzy1xPZgr6V1wmHMPh9z3Kqpd
 3ikaxAZmj1h3Jl502Zf05dLSqK9U+wL8ezChMM5IYxENMiLIQ6YimhzMhZ9MEaKS8eCr
 jnHxIVrvzwByutglFGbRqb2bWO5McvgYSn3tR15pvq84gCEihXwnnWf4rZ7sX8FWCoWy
 PE9w==
X-Gm-Message-State: AOAM532KUXtkvrBTvpKyHyTFz/4apJNjhqNB2ovkZVASLMKPXQEXS6jc
 rNb/tQlzGljlz3mpiT1QzUjHuwaXkE8=
X-Google-Smtp-Source: ABdhPJxvI2sOPQm4KzhWu7L+25sFuNthVmf8uBJ0GBq+ANrnx7gwBLCqFZDU8fXLkA9NyPWAv9kp8A==
X-Received: by 2002:a17:906:4045:: with SMTP id
 y5mr16666008ejj.529.1613905972635; 
 Sun, 21 Feb 2021 03:12:52 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id k27sm8393499eje.67.2021.02.21.03.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 03:12:52 -0800 (PST)
Date: Sun, 21 Feb 2021 12:12:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 6/6] ASoC: samsung: tm2_wm5510: remove shadowing variable
Message-ID: <20210221111250.pkklcu26tt5ini2m@kozik-lap>
References: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
 <20210219230918.5058-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210219230918.5058-7-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On Fri, Feb 19, 2021 at 05:09:18PM -0600, Pierre-Louis Bossart wrote:
> cppcheck warning:
> 
> sound/soc/samsung/tm2_wm5110.c:552:26: style: Local variable 'args'
> shadows outer variable [shadowVariable]
>   struct of_phandle_args args;
>                          ^
> sound/soc/samsung/tm2_wm5110.c:504:25: note: Shadowed declaration
>  struct of_phandle_args args;
>                         ^
> sound/soc/samsung/tm2_wm5110.c:552:26: note: Shadow variable
>   struct of_phandle_args args;
>                          ^
> 
> it's not clear why there was a need for a local variable at a lower
> scope, remove it and share the same variable between scopes.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/samsung/tm2_wm5110.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
> index da6204248f82..b9c17fdd168d 100644
> --- a/sound/soc/samsung/tm2_wm5110.c
> +++ b/sound/soc/samsung/tm2_wm5110.c
> @@ -549,7 +549,6 @@ static int tm2_probe(struct platform_device *pdev)
>  	}
>  
>  	for (i = 0; i < num_codecs; i++) {
> -		struct of_phandle_args args;

I would prefer to have them more local, so:
1. Remove args in tm2_probe() scope.
2. Add args around line 588 in "if (num_codecs > 1) {" block.

Best regards,
Krzysztof
