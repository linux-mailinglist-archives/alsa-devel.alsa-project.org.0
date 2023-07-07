Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D38574D9ED
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 17:33:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B70C9206;
	Mon, 10 Jul 2023 17:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B70C9206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689003188;
	bh=eA+qKPz1NBmWddK1WFn7bk/ex3i4czF1vMZoD9B1E4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lJLOWbFqJUVZ/yWxCnW1bEsUGwOeCeWnnmbO4lGerVBFXu2lac2eYUwxA0z7Kfags
	 6DHRYDCgqjaaAzHKk319U6Zg0LQcB3Y/7vREdYiGpEb+7tpMZtS3duEyIuHuwWR+iM
	 wTmsXnqCWuMHjD6UOKFtc5Pu4SlWX2FBE94xjfbo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22BB1F805D8; Mon, 10 Jul 2023 17:30:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 706AEF805CA;
	Mon, 10 Jul 2023 17:30:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AE23F80124; Fri,  7 Jul 2023 15:52:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92758F80100
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 15:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92758F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=V5HmRWIt
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-98502b12fd4so56369766b.1
        for <alsa-devel@alsa-project.org>;
 Fri, 07 Jul 2023 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688737930; x=1691329930;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cAfcpJAyLiXpelZx0FzNKHNfmyegTCEyDaCNf4Jxlbk=;
        b=V5HmRWItDThS0s4TeaiemXYOaT1UkrwYK8tPiFvRa0NJsHf79Ae+cnVsSYmG0t0jFe
         KVCDcZT35FVUI7GzJPCNQna39/xjNQvp+y+XineJKRn8ZQR7AnSbtkC/AqxrNHS7Ca1N
         2ABfiY/8/YLRRQYDtrb1W4JqAbqnpLpagH187tPZ37fakXYgoSkVs0iRMfGgkxh/KkgH
         +zYZRrStnuezMzG9cy6/2WtG1BPFkTXRjWvAQzO93VX3Q7lW/uaSZuAqArbMcpdblKP7
         hIa4dk8rOzzXzSq2a0Q4+WRE7aJPcckGpofBMcrE0kfFrQhgbfNn9TfnwGIIF7w13PA/
         a+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688737930; x=1691329930;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAfcpJAyLiXpelZx0FzNKHNfmyegTCEyDaCNf4Jxlbk=;
        b=L4N5WK83tzpJAjc+Ib8UiNwOxvc10il6PLnVAd431zIzXrqqbSv+TMRk/yKXS59X7i
         l1yHnRH/kMhO1kjgJ4PlZSldpUA6AV4ZYR+P/tNXSkftizr4DfnWgXFaVs3Wtm+C3z/r
         FNoeUxpl9sRrtgzWFSBaaKy4zYlfse0NRSewVNlhUHvzcCFXtpYy+WHIADAtK1SXtu6h
         iW3SIxASod7HYfL42qO04XPeX+yUdys/h/yOUOyxrA7ZlkWEGOD7xoDYQl0xp2XRbdBJ
         XiRdlMSzM34WpU6cR5lTu1mSSb7cP18MUnYeGDye0+xguBdVb5sHp1/W0AeBGTPETQe0
         u5GA==
X-Gm-Message-State: ABy/qLZr+Lkk7DWSXUc5EhVlmoTX+KijjXH4VqoyuRLbXGwB4eEU87nf
	ZEtx6QPFoHRi831Fmy7gk3HvzDv2wX9PI5iJ
X-Google-Smtp-Source: 
 APBJJlGjq4INu/TemzS5xpPiMiK8sF9C5RzTgbqs9TztAsVSi6Ybsq9Rube/UKoKzxCTbwA2kdgncw==
X-Received: by 2002:a17:906:7a19:b0:988:f9ba:e18d with SMTP id
 d25-20020a1709067a1900b00988f9bae18dmr4108907ejo.6.1688737930391;
        Fri, 07 Jul 2023 06:52:10 -0700 (PDT)
Received: from [10.10.19.213] ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id
 r11-20020a17090638cb00b00993a508b818sm2230981ejd.1.2023.07.07.06.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 06:52:10 -0700 (PDT)
Message-ID: <f4b76578-f141-6603-0c04-eca3c11a5293@gmail.com>
Date: Fri, 7 Jul 2023 17:52:05 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] ALSA: pcmtest: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de
References: <20230707075058.3402832-1-u.kleine-koenig@pengutronix.de>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20230707075058.3402832-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PRTVUED26YAJXWKK7LZHSH6BXELMVTU3
X-Message-ID-Hash: PRTVUED26YAJXWKK7LZHSH6BXELMVTU3
X-Mailman-Approved-At: Mon, 10 Jul 2023 15:30:17 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PRTVUED26YAJXWKK7LZHSH6BXELMVTU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/7/23 11:50, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   sound/drivers/pcmtest.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
> index 2ae912a64d16..1fff85feaf82 100644
> --- a/sound/drivers/pcmtest.c
> +++ b/sound/drivers/pcmtest.c
> @@ -576,10 +576,9 @@ static int pcmtst_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int pdev_remove(struct platform_device *dev)
> +static void pdev_remove(struct platform_device *dev)
>   {
>   	snd_pcmtst_free(pcmtst);
> -	return 0;
>   }
>   
>   static struct platform_device pcmtst_pdev = {
> @@ -589,7 +588,7 @@ static struct platform_device pcmtst_pdev = {
>   
>   static struct platform_driver pcmtst_pdrv = {
>   	.probe =	pcmtst_probe,
> -	.remove =	pdev_remove,
> +	.remove_new =	pdev_remove,
>   	.driver =	{
>   		.name = "pcmtest",
>   	},
> 
> base-commit: 5133c9e51de41bfa902153888e11add3342ede18

Acked-by: Ivan Orlov <ivan.orlov0322@gmail.com>
