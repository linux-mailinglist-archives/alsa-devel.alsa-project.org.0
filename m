Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CEC902457
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2024 16:43:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8821B846;
	Mon, 10 Jun 2024 16:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8821B846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718030623;
	bh=WfJ9jpzyEaAtpm/A8NCBTJr5h8q7wIHU4XCBvX6wUno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rrY+evOmy/MdF3TdK4f9rTP0Q62xD8JwAVEJO+7jRjRg4G9yQy7fpdO+Dfj8e8gWq
	 wYLxdMBGJpkmOBOoarnzOQOuJL/0k4NdA1fVv2iRoxaoDDsYQu2YuWKra98BhwaBas
	 Dhe4GRfSdRztQ/588tsGjBLnDYr1w/8YqtG37PCo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EEFCF80588; Mon, 10 Jun 2024 16:43:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35410F805B2;
	Mon, 10 Jun 2024 16:43:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C46EF8057A; Mon, 10 Jun 2024 16:43:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02A29F80578
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 16:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02A29F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=H0/vwmWt
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52c8342af5eso1573593e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Jun 2024 07:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718030587; x=1718635387;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARiAbV9duxyFUqNEp29RQ3QZg/sow4QH3/UXrM8Ep8I=;
        b=H0/vwmWtufzi6G/c9hMqTBhIDagZkqYzWndPKLEPlwa/GGQ0/QiBdaFcSWwkPenmHK
         zUHT+SlB2Sa3rtT7eEz1U0XQuld/qGsz9x3Tg54L1KxyOx/bUWdvKubVkEUjlVj7d8/P
         ScEAmaLia5vyNkI+wt8afMYMiuDB4KsSYoFViim3iXbhPKjieN4+t86QzfJVwzjnCr79
         yoqRjTC6Kzw5t/Vd8ljHFLmfOUrs2n8g64EUhmYWyqL6NhxN+6t7oLBOPpcPnezjcq8t
         TgqphCAs6SiRtIMYE1sYJQpxBdoMNJefCCPHHZcdZ72J6Z30XiDCbbA9qqF35A/HSEMi
         W78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718030587; x=1718635387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ARiAbV9duxyFUqNEp29RQ3QZg/sow4QH3/UXrM8Ep8I=;
        b=e5ey+4ROf3a88MlLlOyomvounHLM5isnH0s5RG73GkqpdTgkAWzrzj/DVjTX5UoqK3
         5ZOHEBdAVe8ytHI5LPWuhUmnijNBwbg/o/on7+Rr6UQQd2+jRpWwkybchlJAvPQMp6QO
         Kla+iS8IfoMO7uSUp/T8JZhTSi2XJVxIUj1GMFHewbnIahLc7VE9aq6IO3LJHSjowymI
         w/0ASAW+I+LkwKh88qzp8MNvVjDLuQbR5/vv9zrmESgu37z576QLlHRcGb8ahtFE2Kd9
         DMXSeAHtudW4KTtisKOpPrb1onJZ8CFnG6fuRg+9tESqaWdXMGlrwWk7FhlWqJnXcTtn
         vt6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlCuXWDV42I9VKg9EQNisH4HJi1nOTzObnJyYsIJNNmKlbzaeS8mkJwFlbS8IwmR3k63kON6qMdQf+mkq2Y81hLx9pFjUB9tdlyVY=
X-Gm-Message-State: AOJu0YzDJsJ4D15eOcZXn99wq960qQbm3aB/SsnrVK7Jgiigpf59x3qi
	dbWG07qOCL3xD6YXf8suMa4dJMh6xLXG1fuJrxBt2xtSbcuBxZYq
X-Google-Smtp-Source: 
 AGHT+IHiYOo9667BlphoO7DGPwPfS2rjmuIrjpGhocXL80s7aww/8aocaCFP8lqC989SjleMvbUgRg==
X-Received: by 2002:a05:6512:3b98:b0:52c:841c:d15a with SMTP id
 2adb3069b0e04-52c841cd44fmr3611477e87.7.1718030587281;
        Mon, 10 Jun 2024 07:43:07 -0700 (PDT)
Received: from [10.0.0.42] (host-85-29-124-88.kaisa-laajakaista.fi.
 [85.29.124.88])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c8857d03asm725070e87.261.2024.06.10.07.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 07:43:06 -0700 (PDT)
Message-ID: <605944ac-6dfa-4620-84b6-392665cdc05d@gmail.com>
Date: Mon, 10 Jun 2024 17:46:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: ti: omap-hdmi: Fix too long driver name
To: Primoz Fiser <primoz.fiser@norik.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
References: <20240610125847.773394-1-primoz.fiser@norik.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20240610125847.773394-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VJTBFWBUTYVMUXV6KEGCFVSCD36IUFAN
X-Message-ID-Hash: VJTBFWBUTYVMUXV6KEGCFVSCD36IUFAN
X-MailFrom: peter.ujfalusi@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJTBFWBUTYVMUXV6KEGCFVSCD36IUFAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 6/10/24 3:58 PM, Primoz Fiser wrote:
> Set driver name to "HDMI". This simplifies the code and gets rid of
> the following error messages:
> 
>   ASoC: driver name too long 'HDMI 58040000.encoder' -> 'HDMI_58040000_e'

Thank you for the update,
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
> Changes in v2:
> - use "HDMI" instead of DRV_NAME (requested)
> 
>  sound/soc/ti/omap-hdmi.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
> index 639bc83f4263..cf43ac19c4a6 100644
> --- a/sound/soc/ti/omap-hdmi.c
> +++ b/sound/soc/ti/omap-hdmi.c
> @@ -354,11 +354,7 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
>  	if (!card)
>  		return -ENOMEM;
>  
> -	card->name = devm_kasprintf(dev, GFP_KERNEL,
> -				    "HDMI %s", dev_name(ad->dssdev));
> -	if (!card->name)
> -		return -ENOMEM;
> -
> +	card->name = "HDMI";
>  	card->owner = THIS_MODULE;
>  	card->dai_link =
>  		devm_kzalloc(dev, sizeof(*(card->dai_link)), GFP_KERNEL);

-- 
Péter
