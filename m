Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7C05154D4
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 21:41:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DDA81F2;
	Fri, 29 Apr 2022 21:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DDA81F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651261274;
	bh=KMkJ3LTFTZAz4VUB2PpqdSSanbTQ6rDgKhpZXZaE7cY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dm8i5jGwwnjmzNiUPIVXGO7luVQ9BT8wqFPazVWSICFSt6loIZ3cRezs0p+mytWbx
	 jVw5PO9dsnHvqdueY5WMCCwUrpY+rMzEW5pmxyN9c73I6SSJMvO9b+9U7YdiPKX19+
	 HuNd0jq6AFL1IRu57xrAo5mzttjzGg6DA7fU4hNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C51DDF8007E;
	Fri, 29 Apr 2022 21:40:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5858F8025D; Fri, 29 Apr 2022 21:40:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37928F8012B
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 21:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37928F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lFm3iQKY"
Received: by mail-lf1-x134.google.com with SMTP id x33so15835258lfu.1
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 12:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mwwKTzefmTJKE4K4xtYs5yV3nVraWz0ZikLnWGl59aE=;
 b=lFm3iQKYv+iXNQnPNgYbCjemLYCoLZ+6q3E1x5ZMCZD5yY5Lk3h4X7aYbN3drSWwRq
 CZR+ejaRvWTyJYhdfolC2BRIb3vwePu/AuaOIJBvbr/O8vgAUGwbvcXCgL2qQbuKN9Yt
 D6BhohHanWNoi3TeFJqIOyOcbGaZiW03aJle0blhFeqHz8o2E4TtUDsM/rLXL4UJyaUz
 sb2pclaEe80ffX92ViuVUvI5/jBhF5n9FySGqMvkJ8P/K5MPg0degFfETklPUxnLkw6m
 Sx9KK0aVCKgguvLJQxxQwj03fos43udYhs3ZE8/xNVjOwD+tL+3uKwMGc5DeY8UCeISv
 b8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mwwKTzefmTJKE4K4xtYs5yV3nVraWz0ZikLnWGl59aE=;
 b=2+0ItQcA01wB47NOn0mAiPSsFLCM4UBPZyzXkBWB/aI8nrXUVbDSYFFTiI2suoKeE4
 nK0pS7wPEdmM2imLctrHaKC2vk5/jz/8HWcKt6QH1yQgAVmUXT3/pLBRkZ0L8bgez/Q2
 xg3Ca4IRr2XSQvu1F6lg2d2ryTJEHnpt6TW3aLMyhsngnqyBPm81ne6Hzpd1Fj+lSJFM
 yZH5odXf0pU40pugN3dBO4gpyZPZTE/tGaZhuE8TEyUHak/YyDi99bQEGjgCUIbGJMqL
 ZGPdvhREX503W+n9wU/5VrJgKUKCiX1eHx1FTc+x685q3w58LIdG0N1R4NqTKsof8n3w
 +8CA==
X-Gm-Message-State: AOAM533WIWXeDrkUd3NDUhTdyNLPB3gMJw2paecXNfD2Yeut88zmZPx6
 jPPM4Y8WYH7d6pwLzyFOsas=
X-Google-Smtp-Source: ABdhPJwLT2ZuEsOVkBi1kQnU4XUi1G08j+m8GU1+lKJy45lTkkivaxkbrGinKlPedfjaN/CuQeBHKw==
X-Received: by 2002:ac2:4884:0:b0:472:344:1c86 with SMTP id
 x4-20020ac24884000000b0047203441c86mr551948lfc.628.1651261204509; 
 Fri, 29 Apr 2022 12:40:04 -0700 (PDT)
Received: from [10.0.0.42] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 q14-20020ac2514e000000b0047255d211acsm7463lfd.219.2022.04.29.12.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 12:40:03 -0700 (PDT)
Message-ID: <8db28ee0-6aff-24aa-5bc1-45a639592f88@gmail.com>
Date: Fri, 29 Apr 2022 22:46:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] ASoC: ti: davinci-mcasp: Add dma-type for bcdma
Content-Language: en-US
To: Jai Luthra <j-luthra@ti.com>
References: <20220422054001.3738-1-j-luthra@ti.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220422054001.3738-1-j-luthra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Jayesh Choudhary <j-choudhary@ti.com>,
 linux-kernel@vger.kernel.org
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



On 4/22/22 08:40, Jai Luthra wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> Set DMA type for ti-bcdma controller for AM62-SK.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 2c146b91fca3..377be2e2b6ee 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -2047,6 +2047,8 @@ static int davinci_mcasp_get_dma_type(struct davinci_mcasp *mcasp)
>  		return PCM_SDMA;
>  	else if (strstr(tmp, "udmap"))
>  		return PCM_UDMA;
> +	else if (strstr(tmp, "bcdma"))
> +		return PCM_UDMA;
>  
>  	return PCM_EDMA;
>  }

-- 
Péter
