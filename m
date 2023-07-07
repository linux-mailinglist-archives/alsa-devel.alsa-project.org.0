Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B48A774D9E9
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 17:32:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E61FA820;
	Mon, 10 Jul 2023 17:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E61FA820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689003138;
	bh=k6F5BWbpW6sOfXyur/LP4W5rxku50m1l8dvfnc4CnfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ePwLT0RuQgyWKF33r48/BkZJpjiUWd++2jd4xbr7125E02y049qCFBpsyWBqwbvb3
	 WSUgvjpsvezkMeZIYzT8IOTnxagoMyj8YUMA4zCUH3RBU5D9LOMjhR2GcTNkpLxuw3
	 47CGoTVCskMtpGeALDWA2RiajdQBbvT4U/cr1Oro=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 999DCF805A1; Mon, 10 Jul 2023 17:30:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC14F80588;
	Mon, 10 Jul 2023 17:30:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 558ADF80124; Fri,  7 Jul 2023 15:49:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AFB6F80093
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 15:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AFB6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=sAi3fJEV
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-98dfd15aae1so47307366b.0
        for <alsa-devel@alsa-project.org>;
 Fri, 07 Jul 2023 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688737767; x=1691329767;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2q9MqhZksTJkvIZn3w+zVX492kRKdBFgYD3XXC+4zdI=;
        b=sAi3fJEVcg3YXpDgUykFaH/O+XzolW/c9rci7fimbgTy+HCahN6RFBkOfmUMyfw70v
         aOSpU7ihuLrIi1S9nIcHcAgjclcY7Pqg9aV/DuNQrBBJ2P3u6nOm77/JTXcRsKWF33BB
         V0EWneeXdsfP8ZH7ge2p2C2a7qU73MIsD6DjrKfgsBAPs/DKcQsSbpOm3aR3J+CN5vQZ
         vZxq1E9y1pZgnlq8mPtOFqVvMihp4vI8YUk2OEzgZ7s+ctRWC3200svxvJnRlScJtdx/
         cm0mqj9v9Nia6zCMIKOQB9wK0IIMbWhpfDTYSDetXCnM4+DLUAJo+nIkQGZa4D5pbPtM
         YdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688737767; x=1691329767;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2q9MqhZksTJkvIZn3w+zVX492kRKdBFgYD3XXC+4zdI=;
        b=NyqQltyHbIAdV4cgKlURJcHw8xT+sF27TOhH7HrqZ0ITfhFhKT+Ox/yChq8rR+Adi/
         +dgnlfpJoszJHjYD9fHXgP6fkE0TXBgMU9WRoZ45lpHtY8j2roc82pqmYt8poRkUuQMP
         9tKePuy3x2QfsRlphJqXChLdxlU+HO8rNcxwPZozO2cirEB3sW33d/V5rlLiTl2d8bok
         ns30iYzaZhO4RIm/Y/dC0r5MAMJpT7CAqGUlzKxGPtYhezgc5p6X6llFmvjp7h++zaNX
         JKxaFP/SCxI/DNK18BA02MKY5gc1zXNo9ZxmPSC/lnAu8zmYSRSuea6JZA1N/khpD0YW
         ciIQ==
X-Gm-Message-State: ABy/qLZ/YV5cSXQvJ4tp4lSCdt+mwSxsdsQcfZmBVIEzjQEb1MTXW4Qr
	Yybx4A4hvE/TYFo3kyTNtww=
X-Google-Smtp-Source: 
 APBJJlHmQmKN4t57YpNaOOLJDrI8G531DNJTtjUhmgkdSVHoKkbga00ZyEufsDAny//XW7v2sCxcgw==
X-Received: by 2002:a17:906:1da:b0:988:c8bb:e3ac with SMTP id
 26-20020a17090601da00b00988c8bbe3acmr3699855ejj.7.1688737766883;
        Fri, 07 Jul 2023 06:49:26 -0700 (PDT)
Received: from [10.10.19.213] ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id
 kk8-20020a170907766800b009927d4d7a6dsm2199439ejc.192.2023.07.07.06.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 06:49:26 -0700 (PDT)
Message-ID: <0584be19-69fb-f53d-965e-cf8ce7a7b188@gmail.com>
Date: Fri, 7 Jul 2023 17:49:25 +0400
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
Message-ID-Hash: Z4FMRXK4C34I2FNJ3ATJWMWGCW73FAXN
X-Message-ID-Hash: Z4FMRXK4C34I2FNJ3ATJWMWGCW73FAXN
X-Mailman-Approved-At: Mon, 10 Jul 2023 15:29:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z4FMRXK4C34I2FNJ3ATJWMWGCW73FAXN/>
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

Looks good to me, thanks!
