Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C249D39B51C
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 10:45:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C5CF1715;
	Fri,  4 Jun 2021 10:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C5CF1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622796356;
	bh=X1T2yzMeI3vS7XDGFP9iiEhGe70CT9UWoBKOTqd+5Gc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iPnva/KoRvCymVM7aC01RkEPfwzwzTMH/AFb9+Cke5wGMOh0UMr4NIZNfFyXStg17
	 3RiTzXStYqEyfAG3UXz1vZR9kuUsmF+HQSBE7hjERmX1mt/iToiX5N3OcblunLVbrE
	 ZjHZ08GxC5PeTjETNueB9Xrwj4B3oaImyiFHUcj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9250CF802A9;
	Fri,  4 Jun 2021 10:44:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A2D7F802C4; Fri,  4 Jun 2021 10:44:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2858DF80103
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 10:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2858DF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KOXWEob0"
Received: by mail-lj1-x235.google.com with SMTP id m3so10539137lji.12
 for <alsa-devel@alsa-project.org>; Fri, 04 Jun 2021 01:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8qje2jMT9k/yWcqfBZuQl0YlsfGCuFmFF0ZAae2cfIA=;
 b=KOXWEob0hERH0Y0+StGplaqUt60wSGg+aqansgO/OyDXDzsC0XFHoEXfxKfj7uzmpc
 7u4l5kDjjfVj0NIoW/TM64rCid5hMr4EzA4QMQ+hjlgwXaamzzl+iQnB284hethUcyJz
 KxHKDrI7yJxJjd9VklowlZMky6JUjwimfB8kxKt/kuHPZ8uZfTj9JxReDkrLxWAxqWld
 y0M7rZqfg/ftFfPkoRFHOSa/LdTFyYzBxPhCeTIuBE+rkqQDoyDs/weXTkeyVh92u9s0
 1TqqvckhMoFwe3/2H0vWUjJSZpoANH8NhpGs+lPizHTVjfQXpNPTckbuXNdZFv3J26Ft
 sRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8qje2jMT9k/yWcqfBZuQl0YlsfGCuFmFF0ZAae2cfIA=;
 b=KB9pUYBnkHfAKot7ZWGa1OI4vC9pQ4nKoOiJhk2IBzinb9PgOc5iwuGz1WtGgzLuQl
 HSHcn5h/vQyfMoUjATY2gHLQSvmNcP33kj9yj53h4b8iF2qYiSY64WK5O/eDlzEGr6V8
 ouKj6kp2YxrxvQnDX8qwx+V0fEIpO3vSI+wkn7o5iZGy0DhMDhg0NW7unKDdU0uOu2Ad
 J2foPVBVhwOTaKiO97IqWHV2n2QPlZ9FJJh2P0rOfP3U5r7fMv85NiIJcQs9+sVLOEqw
 p8hu8jfUtL6zt9T7Legyj88gDvpgGcS9EnHMeeZOUPbnuPDek38sETNaC1kD0DfD8A06
 sMaw==
X-Gm-Message-State: AOAM533JSd2kv392i0k3lPj4BqCy8x4DmGbXuI2nxOtnOLxmiLRSlEuQ
 1RZv//OOFmmucD5+t4CBf1U=
X-Google-Smtp-Source: ABdhPJy+1611WuPZMiE8gnObgiAWxRMGON1e8gtOn+PqjM9SDqSc3QyxqFiQ9cR4G4V4w3QmvAEGOA==
X-Received: by 2002:a2e:9f4c:: with SMTP id v12mr2596710ljk.176.1622796260789; 
 Fri, 04 Jun 2021 01:44:20 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id 26sm550657lfr.184.2021.06.04.01.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 01:44:20 -0700 (PDT)
Subject: Re: [PATCH v2][next] ASoC: ti: davinci-mcasp: Fix fall-through
 warning for Clang
To: Joe Perches <joe@perches.com>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20210604072714.GA244640@embeddedor>
 <a0452dc7da2c46e3e764bdd5fd9b94dc96d96912.camel@perches.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <4c217782-21e5-b408-0fb9-f0a2c5b31591@gmail.com>
Date: Fri, 4 Jun 2021 11:44:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <a0452dc7da2c46e3e764bdd5fd9b94dc96d96912.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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



On 04/06/2021 10:53, Joe Perches wrote:
> On Fri, 2021-06-04 at 02:27 -0500, Gustavo A. R. Silva wrote:
>> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
>> by explicitly adding a fallthrough; statement.
>>
>> Link: https://github.com/KSPP/linux/issues/115
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>> Changes in v2:
>>  - Use fallthrough; instead of break;
>>  - Update changelog text.
>>  Link: https://lore.kernel.org/linux-hardening/25941c37-6e38-88ae-3afe-4f5af44380d3@gmail.com/
> []
>> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> []
>> @@ -2317,6 +2317,7 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
>>  		break;
>>  	default:
>>  		dev_err(&pdev->dev, "No DMA controller found (%d)\n", ret);
>> +		fallthrough;
>>  	case -EPROBE_DEFER:
>>  		goto err;
>>  	}
> 
> While this is OK, perhaps the below would be clearer and a more common style
> as it doesn't intermix default: with logging output and a case label.

True, this looks even better.

Acked-by: Peter Ujfalusi <peter.ujflausi@gmail.com>

> ---
>  sound/soc/ti/davinci-mcasp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index b94220306d1a8..1059a696ff90e 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -2305,6 +2305,9 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
>  		goto err;
>  
>  	ret = davinci_mcasp_get_dma_type(mcasp);
> +	if (ret == -EPROBE_DEFER)
> +		goto err;
> +
>  	switch (ret) {
>  	case PCM_EDMA:
>  		ret = edma_pcm_platform_register(&pdev->dev);
> @@ -2317,7 +2320,6 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
>  		break;
>  	default:
>  		dev_err(&pdev->dev, "No DMA controller found (%d)\n", ret);
> -	case -EPROBE_DEFER:
>  		goto err;
>  	}
>  
> 

-- 
Péter
