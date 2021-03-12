Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 321E4338A8F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 11:50:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCF0916EF;
	Fri, 12 Mar 2021 11:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCF0916EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615546239;
	bh=5tjcwlXEc/4hndVKaBxfNhXJhYm+F3oB2Vvz7bxbB6A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ViL65yfp/EJ2LHfo4B1UYjYeKlc9qKy8v0sADyeEoDjE3CFTMIbsJt/doSfznOih+
	 TTmbEkldMcz+A2oKYSXaDypvwa6b97V176X1waHjHv1CbCO+Tq/x9rkQ5kz3ZZzAyE
	 4jNgSC1nwBihf7NUe3NDAAhmxsz6rgFUzPbHy5As=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32029F801ED;
	Fri, 12 Mar 2021 11:49:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6E58F80475; Fri, 12 Mar 2021 11:46:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3838AF80424
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 11:46:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3838AF80424
Received: from mail-ed1-f70.google.com ([209.85.208.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKfIp-0003rM-Cx
 for alsa-devel@alsa-project.org; Fri, 12 Mar 2021 10:45:59 +0000
Received: by mail-ed1-f70.google.com with SMTP id a2so11322776edx.0
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 02:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OSNCox4qPdg2aWBTm1XA98MyYWn+PqANeEOKeNeMm/c=;
 b=mL2q4DT7S6hVoMCGM1o6qVmRXhyKEzm9ldRTre9UZElT9jBxzJRdjR2l5JTTJ1Q5on
 CWVzXsCb8FdgSJ32hA34db61if1Zg/1X11LsKQR5wgc8iWp7IPpNhVjFTfaxyOb/kRJK
 ZD6lEw/Sd4OBHc5tiFwbdRIeb1FDeJhzQrklMvYDwYP0u0NxlB6XwxYim7bdJqfq1gnp
 WQ9cLHqfMrBBbANyhY7gOj3544ahP6xYV6wxBkNZaIAscrIu6xjjMvGTti0/7mjEEpb2
 pP8fVXwtAPmOoAFrVITncmPxzAll7gQ1JW0sZ2cKkm9ToDjqqJNM6hCwbx2YXhuXiTzq
 lrRA==
X-Gm-Message-State: AOAM5323hBNov3AUxl6AnGG7QDFXKnsrVYL5csNvGUUSVb9bJ6JZgGJH
 aSnlrldtEXHNZ8JlI5SqOHCCzkxHJOt8kjJ/h2ZfHQoacQGgX7JiIlCdoc0AbQjKllhVO+se5Yn
 iNhrB0ZY11ezj3PSEaUBsRtQvk+E1iRCRMC3m/PW9
X-Received: by 2002:a17:906:4c85:: with SMTP id
 q5mr7711037eju.375.1615545955134; 
 Fri, 12 Mar 2021 02:45:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXhd7HmyHBGdow+/gkcLpeVOzNVd8KgDgTiwbfnDaXCBRELkbmGw2inZa391dekTGhoHuf3A==
X-Received: by 2002:a17:906:4c85:: with SMTP id
 q5mr7711021eju.375.1615545954980; 
 Fri, 12 Mar 2021 02:45:54 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id q1sm2508770ejt.65.2021.03.12.02.45.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 02:45:54 -0800 (PST)
Subject: Re: [PATCH v3 2/2] ASoC: samsung: tm2_wm5110: remove shadowing
 variable
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20210311003516.120003-1-pierre-louis.bossart@linux.intel.com>
 <20210311003516.120003-3-pierre-louis.bossart@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2be5ca0b-2b72-d1fd-7322-5b672c9ebede@canonical.com>
Date: Fri, 12 Mar 2021 11:45:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311003516.120003-3-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 12 Mar 2021 11:49:04 +0100
Cc: tiwai@suse.de, broonie@kernel.org
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

On 11/03/2021 01:35, Pierre-Louis Bossart wrote:
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
> index 125e07f65d2b..c1ab6c3afd0e 100644
> --- a/sound/soc/samsung/tm2_wm5110.c
> +++ b/sound/soc/samsung/tm2_wm5110.c
> @@ -549,7 +549,6 @@ static int tm2_probe(struct platform_device *pdev)
>  	}
>  
>  	for (i = 0; i < num_codecs; i++) {
> -		struct of_phandle_args args;
>  
>  		ret = of_parse_phandle_with_args(dev->of_node, "i2s-controller",
>  						 cells_name, i, &args);
> 

The agreement was to keep it as in v2, so to have two local variables
instead of bigger scope.

Best regards,
Krzysztof
