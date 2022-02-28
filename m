Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA074C6C5F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 13:25:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8D01171F;
	Mon, 28 Feb 2022 13:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8D01171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646051114;
	bh=kGShEC2r/aBCZx03qBC/4FyKUJyjZAh1R+N2WqAOYig=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V+PsA1GzC5fTk0KVMeaOgrbPJlVPB4kfepl/G4lI4487LPN+oxSsnObbb6ppCo1/x
	 gDcBRMtqCZn2tcGLrqO5m9H1ciFWvTpDK0SW1i08d9kIkK67pl+dNS7+zC9TNEqy4L
	 9OH7j1XjNdWJgd7yTPrqpnxfy0J1W8RMJ+lO+r9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C16AF800F8;
	Mon, 28 Feb 2022 13:24:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8CB7F8013C; Mon, 28 Feb 2022 13:24:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB64FF800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 13:24:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB64FF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Zx/DYktO"
Received: by mail-lf1-x12c.google.com with SMTP id j15so20998755lfe.11
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 04:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5douA7CZIH+Mx4m1ZPjo7hgc7hLgTfbR8KBe0Jl3pk8=;
 b=Zx/DYktODLaBxNdmRkxWJ2LcmngjxLMA/yR0j3z1EzR73uwoD1Aw26Y+/6VfDWXHEn
 JeDYCHDhA0wjBHdfH8SViYJpOwSsAXGWVQk7A7UUutoKVUr3fv4077+yK+kmlj4fC0MI
 UaFAt3HBPUG5Ol87P3Hr5qmAT3V/xzociNyvkF1YNtOSMCvK7/2RJjEjw2ZkCOvqfDAY
 eRLJOrHy+3Uyby4dGOeEDHKbuhcYc666aYGEqC8z2m0IwhttTlyq43WaOXXN7FNy1odj
 vxsx8tCmZ8LPygFMX88UzAcb8Ahwynd/RqSua/MRhJDC7kQNCxx4yyuUJ1WSO/i7mHoe
 R5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5douA7CZIH+Mx4m1ZPjo7hgc7hLgTfbR8KBe0Jl3pk8=;
 b=FkOmmzMAQnshk+ow2kNxobNmMKdIqYVESuwXpynvcsSkH0mOqBoOyP8dZr3X6u2oAW
 W+Rk3LVp6AIw3uOQNS2632MdFy3BY9dU37VwqL/s1xchAIeX+niVlyr5Z8S/tO0XUuIF
 NNWadVSjb1CbDsWB2U7fP/lLwSrEmmiwPCAgiDQ78oCDIpVnmIeDmNdG17doI49lkpl7
 aIkmGXYKrv+k+Bj45+TD/8PoA/Z1dEaJKUOxa+oVqn7rvYA8oT3Ihkru9wMnZqWhmt4d
 ACT2yxN6sYsUJ4ZtxyhZDb61MX0gPXw7PEZoi2Ax/3484lU+yn2OBSDdaPxhRujaQieg
 vNbw==
X-Gm-Message-State: AOAM531B+l8eV/GOJW4MdxXS1rigYtiPBNN36nzJ1wpbvat0mgDWa0yG
 U+PJ85G3XKixfUzJIUSjp34=
X-Google-Smtp-Source: ABdhPJxiEZ409LKvmGodDzUeaJr366SPHcC8ExlBAW+6dq9/QYXc467qpqIa/MIJW/fuzCdIK/mGRw==
X-Received: by 2002:ac2:4898:0:b0:443:7f7c:2de4 with SMTP id
 x24-20020ac24898000000b004437f7c2de4mr13058704lfc.428.1646051039453; 
 Mon, 28 Feb 2022 04:23:59 -0800 (PST)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 m11-20020a05651202eb00b00443130ce80asm932589lfq.138.2022.02.28.04.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:23:59 -0800 (PST)
Message-ID: <764a2715-9c24-25f0-74ee-c9cf5d8a46c6@gmail.com>
Date: Mon, 28 Feb 2022 14:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] ASoC: ti: davinci-i2s: Add check for clk_enable()
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
References: <20220228031540.3571959-1-jiasheng@iscas.ac.cn>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220228031540.3571959-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 28/02/2022 05:15, Jiasheng Jiang wrote:
> As the potential failure of the clk_enable(),
> it should be better to check it and return error
> if fails.

Thank you for the patch!

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>


> 
> Fixes: 5f9a50c3e55e ("ASoC: Davinci: McBSP: add device tree support for McBSP")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  sound/soc/ti/davinci-i2s.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
> index 6dca51862dd7..0363a088d2e0 100644
> --- a/sound/soc/ti/davinci-i2s.c
> +++ b/sound/soc/ti/davinci-i2s.c
> @@ -708,7 +708,9 @@ static int davinci_i2s_probe(struct platform_device *pdev)
>  	dev->clk = clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(dev->clk))
>  		return -ENODEV;
> -	clk_enable(dev->clk);
> +	ret = clk_enable(dev->clk);
> +	if (ret)
> +		goto err_put_clk;
>  
>  	dev->dev = &pdev->dev;
>  	dev_set_drvdata(&pdev->dev, dev);
> @@ -730,6 +732,7 @@ static int davinci_i2s_probe(struct platform_device *pdev)
>  	snd_soc_unregister_component(&pdev->dev);
>  err_release_clk:
>  	clk_disable(dev->clk);
> +err_put_clk:
>  	clk_put(dev->clk);
>  	return ret;
>  }

-- 
Péter
