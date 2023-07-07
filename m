Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F53074D9EC
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 17:32:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CD001FA;
	Mon, 10 Jul 2023 17:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CD001FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689003164;
	bh=zHIl662lWWU+B6sQKR+/gG8x38lE0TCM8V1izdXqukw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FoOVz89b0FWP3kuXGM25wRSsdCwY5Y/dS14YxTYhq9Uhf/7ffCzEUzQPz7yAJVtOL
	 SHSQmRmjdOBviR4uOaaKj4D673Ws+z69QmKZusyD9c0BUgRPgK82Pm+FQUeJAcotQ+
	 6EgX9rOH92JOr2qxDT/m0fJVgcw7q/vbReiXnKH4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 149D1F805B4; Mon, 10 Jul 2023 17:30:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24A0DF805BA;
	Mon, 10 Jul 2023 17:30:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4087DF80124; Fri,  7 Jul 2023 15:51:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 224E8F80100
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 15:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 224E8F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=rOHVCC5e
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb87828386so606872e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 07 Jul 2023 06:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688737908; x=1691329908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RjyUuVCb40UG+YZHlv1fhhaX0Rj//9E+jfLMtqzkDG8=;
        b=rOHVCC5etMYFYqIrMDp9sJSwFzUwHJik/6QYDQjYZbfc9mM3F/BNFYv/V7gZaAZjvq
         nap0RVYrh0sPq22YY21mOIdDdu9x1SFgRUSb/UfrT+pgmt1lw9vUPgreNClwaccLF/rk
         RZqC1+lb+DofchcdGXrE2OWKl0rSkSIpVop7spdNWvJ2COncbJYsXvrmXaJu1CDpGT2t
         lb1uSDojXHRwsH+aZJJF+tvXO5Vxt4ox0jwijx4SCb8RaKTPW6mTFEYDihDDYnUsTUkp
         WGhqjdLl3VBaFhflpSPFvOb/rQFZAyM8sIaaxG5qy16XD2HUqB+ZsOLTmwcYcLj0XbdH
         vmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688737908; x=1691329908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RjyUuVCb40UG+YZHlv1fhhaX0Rj//9E+jfLMtqzkDG8=;
        b=OYP8TO4tUdSUQB+8EgbfN3bfdumGBsmm634TorY6/+8glB2h48rE/kfsvWFJ/s0SNc
         3ZNHJ5OM+dPpvVZ6Wy1kWDVQ6782pBUpyBj/8UKsL6GnOPtA+lGqe8svt10jzi5BNWr1
         chjXfbVvaLbIIQJBPwHT5eanPAR9EJNkyq9Fh/Hx+3G+Dvqg+U3WttTKwkTTvqdhu96b
         tlw3jEhxcflSTW+n4IOUngjLLPB/eCjw4Ko1R3jwyp+9py0RXBESNKXDIx8y6fJToptd
         jBRhZJbiaz5kZlDoZbe74gcqMJtVi1Nl7priwsus7CZCTNRxDvq/RqAIOYOBrpwYgbn5
         z22g==
X-Gm-Message-State: ABy/qLY2Zv1v04yBPh/z1bLBA7/3ShPw9/+LU0lbbYC0jfT6nkJKXdM6
	JhQ8dQ6HksO7zviTyz8Pz5k=
X-Google-Smtp-Source: 
 APBJJlHyQv+owgKJLrAgfHF84Oar5AH9TslNcgKQJ7ReDCf/o82qWTy8UylfuZiTQAqbzAUoJ6I3EQ==
X-Received: by 2002:a05:651c:1589:b0:2b6:9e4d:119e with SMTP id
 h9-20020a05651c158900b002b69e4d119emr4647458ljq.2.1688737908041;
        Fri, 07 Jul 2023 06:51:48 -0700 (PDT)
Received: from [10.10.19.213] ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id
 a6-20020a1709065f8600b009893b06e9e3sm2229335eju.225.2023.07.07.06.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 06:51:47 -0700 (PDT)
Message-ID: <f47f97a4-064f-8675-aae4-53ba481c3f8f@gmail.com>
Date: Fri, 7 Jul 2023 17:51:44 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] ALSA: pcmtest: Don't use static storage to track per
 device data
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de
References: <20230707075058.3402832-1-u.kleine-koenig@pengutronix.de>
 <20230707075058.3402832-2-u.kleine-koenig@pengutronix.de>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20230707075058.3402832-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KVEQOLNHMSVPGSMATV46JNTQ3KW2UPHU
X-Message-ID-Hash: KVEQOLNHMSVPGSMATV46JNTQ3KW2UPHU
X-Mailman-Approved-At: Mon, 10 Jul 2023 15:30:17 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVEQOLNHMSVPGSMATV46JNTQ3KW2UPHU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/7/23 11:50, Uwe Kleine-König wrote:
> While there is probably only ever a single instance of such a pcmtst
> device, it's still bad style to use a static variable to store per
> device data. Make use of platform_get_drvdata() and
> platform_set_drvdata() which fixes a data corruption if there should be
> two or more such devices (or this driver is used as a template for
> another driver).
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   sound/drivers/pcmtest.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
> index 1fff85feaf82..291e7fe47893 100644
> --- a/sound/drivers/pcmtest.c
> +++ b/sound/drivers/pcmtest.c
> @@ -110,8 +110,6 @@ struct pcmtst_buf_iter {
>   	struct timer_list timer_instance;
>   };
>   
> -static struct pcmtst *pcmtst;
> -
>   static struct snd_pcm_hardware snd_pcmtst_hw = {
>   	.info = (SNDRV_PCM_INFO_INTERLEAVED |
>   		 SNDRV_PCM_INFO_BLOCK_TRANSFER |
> @@ -552,6 +550,7 @@ static int snd_pcmtst_create(struct snd_card *card, struct platform_device *pdev
>   static int pcmtst_probe(struct platform_device *pdev)
>   {
>   	struct snd_card *card;
> +	struct pcmtst *pcmtst;
>   	int err;
>   
>   	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> @@ -573,11 +572,15 @@ static int pcmtst_probe(struct platform_device *pdev)
>   	if (err < 0)
>   		return err;
>   
> +	platform_set_drvdata(pdev, pcmtst);
> +
>   	return 0;
>   }
>   
> -static void pdev_remove(struct platform_device *dev)
> +static void pdev_remove(struct platform_device *pdev)
>   {
> +	struct pcmtst *pcmtst = platform_get_drvdata(pdev);
> +
>   	snd_pcmtst_free(pcmtst);
>   }
>   

Also looks good.

Acked-by: Ivan Orlov <ivan.orlov0322@gmail.com>
