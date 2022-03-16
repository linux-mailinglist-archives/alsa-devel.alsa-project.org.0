Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B90C44DAAC5
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 07:35:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41D4116D3;
	Wed, 16 Mar 2022 07:34:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41D4116D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647412531;
	bh=UzSQUDUdoqckDWyGUp3V43uuriQy0b8mL2fh+su854M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PsawJ04pUoBDLgSa3iOkzSbZkAgs+R+UzXRRj2Kdiy0tvrRONc0DmesGtb53q0vSG
	 GijT/l1C6bFyRWFTND4ZefnuX0ZdnDRvAqYcJxwn2xSoKOmhXtcCPN9166CUi0rtdw
	 aE+nieninuyzwdpp5yR68/e89FQom1ECla0LTpVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4DABF80084;
	Wed, 16 Mar 2022 07:34:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A94AF8019D; Wed, 16 Mar 2022 07:34:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2F59F80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 07:34:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2F59F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SNUuaqm7"
Received: by mail-lj1-x22c.google.com with SMTP id h11so1842453ljb.2
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 23:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=++sa46MhpxjLZvQiBNBROIYgnEoEgMiydkA3vO85G7U=;
 b=SNUuaqm75EI0XWtB8fHZf6wvFEokjwp2fTUs+dK+S/Zm1Ow/VfJ3qlTL3AcuVao/C+
 tWWS4RCRZ/w9FQC58sXFjAM904UYhyMAbGwnnp74AIAZqojBGXDNccIrFBvVj12CuJ+c
 cBzbfOE1OBeCqj4x625ts2yQaXf0aXVP0zA9NuJxA25NWFOB4LHd7jfccKuRWjCn90x9
 /AGL+3XN++s61neGYD5kt9FV/xghZ8v/iDJ2KJCqSbIAxGo8IsTuJkpK7o4tMFC46mG3
 cmAIPx7OyXQrZWpGtjWs5vMwCz9wh28jxJrs0C/wghLM1jQs9OCzT3itsXvuNgHwc/sV
 Nlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=++sa46MhpxjLZvQiBNBROIYgnEoEgMiydkA3vO85G7U=;
 b=dmAXLo5QsnTLFrEP8WUI2IP1s2VZYce5An21bUCSQGZF91P1KpnZvuAhXaH4pjAYRA
 46VPKuRG6JvA7hqVjgd3hhZql55pt7BeHHf3Txf4boPsbq0urM7GDklLEwhg/1WbWvDB
 wGKdH6M7t1iuYHhFHPgcQw/C3JB39W6op0ELYwj2dPOaNuYz/oFZ78o4hUm0KSCuDUzN
 oi8lzRI9sdliTSzIahICabCmWFKAdGSrJ3mvsh0e9r0KtI+m4Wk/K/wr8Rki/33zOxKR
 mZt0t8S4Tm88VNYz3mK2ZFbHMxKipwzEXbC/frte0roi2h76tvvxcUvmgdZxaux78OIR
 7Xfw==
X-Gm-Message-State: AOAM530gYIEoQ88Qp9jiJXiq8c4mpAzw9fFmD/tDP8lX1AVB6zBRAIXI
 s+A/2JhdoVnge254PMaXqKo=
X-Google-Smtp-Source: ABdhPJw9Ww1GDbf/aCnm1Gvac/Z8tRDtL6lbAgGCsIzAKktioAvkLknuASghcm3WBucuxEXIZ8MTOA==
X-Received: by 2002:a2e:b004:0:b0:247:e29f:fbd4 with SMTP id
 y4-20020a2eb004000000b00247e29ffbd4mr19034842ljk.315.1647412452039; 
 Tue, 15 Mar 2022 23:34:12 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 l9-20020a2ea309000000b00246299de080sm102223lje.48.2022.03.15.23.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 23:34:11 -0700 (PDT)
Message-ID: <4d3c65c0-1bc3-bc8f-393a-22c964f18120@gmail.com>
Date: Wed, 16 Mar 2022 08:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: ti: Fix spelling mistake "cant" -> "can't"
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
References: <20220315230816.2964577-1-colin.i.king@gmail.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220315230816.2964577-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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



On 16/03/2022 01:08, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  sound/soc/ti/omap-dmic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/omap-dmic.c b/sound/soc/ti/omap-dmic.c
> index a26588e9c3bc..f3eed20611a3 100644
> --- a/sound/soc/ti/omap-dmic.c
> +++ b/sound/soc/ti/omap-dmic.c
> @@ -474,7 +474,7 @@ static int asoc_dmic_probe(struct platform_device *pdev)
>  
>  	dmic->fclk = devm_clk_get(dmic->dev, "fck");
>  	if (IS_ERR(dmic->fclk)) {
> -		dev_err(dmic->dev, "cant get fck\n");
> +		dev_err(dmic->dev, "can't get fck\n");
>  		return -ENODEV;
>  	}
>  

-- 
Péter
