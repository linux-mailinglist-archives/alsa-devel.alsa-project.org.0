Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EF87285C3
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 18:49:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FA076C1;
	Thu,  8 Jun 2023 18:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FA076C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686242989;
	bh=gNQceAUJmTa6TFvIL+Km87KR8NZEQMd0d9aJCTeM7YU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=voQXssO1sN+ZqGbF+M2BgB37TAgx969lgH50mAaW9UoN0JkIdEywpXmZX5YLNsX5G
	 VQ55IZGph02AUqH31KqjyUyNV/2UlKfzUNb1WfMIonWR7ESDsQH9gxdkcpBwlLZaE4
	 /HS9ahzM5NX1wzVIJ0kbSl8922UcghjQqHtclfHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1334F80155; Thu,  8 Jun 2023 18:48:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A129F8016C;
	Thu,  8 Jun 2023 18:48:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D12F1F80199; Thu,  8 Jun 2023 18:48:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D94BAF800ED
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 18:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D94BAF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=ISUlowyJ
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30adc51b65cso851522f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686242898; x=1688834898;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQLEV575N+KrNUGlsZrmx4zC48HUkepNutbY0RXCnbk=;
        b=ISUlowyJjuLK125JQcOXVHEa2QeAgCdOj4C8MAGqYt7vr0t5LECt5PYKZ8XvtYHa/f
         /jcGG0yITgrSx3ZzeH/RA+yJlQYKG+JF3qEckajkfu/8g5A8UodMP37O2GuDhJfYiC32
         s+WRvq+3t8uPqJo5C25EYlZGDeY43Xp3xUwb5RdWahvk5iuoBMVEmeSbIHvo5rk4yEa7
         f/XxcdTbh/6e6Kr6J3r6NBMuuNxx6H1UKOR1oP3FCyTWcGcrEH4c6FWWwrrRNFF5HyFA
         99PMUVtltuQLEHUzouvdxGezr9nk8JiKbYrQpNE69pfOW7dKa6x17mUFEfuIBTloWhss
         vy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686242898; x=1688834898;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQLEV575N+KrNUGlsZrmx4zC48HUkepNutbY0RXCnbk=;
        b=BvgthhLyoRJWu+J/TXe5UwCh6maHMLCUdguzJHzPArs22iG4Wlhw4lYHrKHa6lhikF
         0ER4xFO4B54riGvjF0PfnTV7O78YaK/aqXFF9IjCTmUyEnkRX67czksa4K+7MCa3aVh/
         eQD4wRM1y3uNsLdqzRHTmiZEKu/O8naB3vHWEqw4BY5LHILNFuaThaIXEHvzHcRMpPuR
         lWJKMVHXkYiamPp6cnoPiqLN7l8kN3Nx10VQd1lSW/H/+voCFVCNwTb0l3sBEDhZE4e1
         sDj38TlxBCix9wRAzP90YrQa8SUZZRPuakMtwBckfQsGl6D5XE2AKK04SyCJj6ezyzAq
         hN2g==
X-Gm-Message-State: AC+VfDzKf5+2/yGi3pw1C2EpX5qmQM/msYXT56s0VNj/ODH+JlBOgxLh
	1gbVfT016XLGgyDkkAEkjIw=
X-Google-Smtp-Source: 
 ACHHUZ4dJo9Yhk6pVGkaDe0tPdKFCQhHLtZW7L57ZwBBoQ377VxaNTldMtwjWar/LJ3Y+f0Y+1PTPw==
X-Received: by 2002:adf:ea8c:0:b0:2f9:a798:602f with SMTP id
 s12-20020adfea8c000000b002f9a798602fmr10422192wrm.48.1686242898149;
        Thu, 08 Jun 2023 09:48:18 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id
 q11-20020a056000136b00b002f9e04459desm2023010wrz.109.2023.06.08.09.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:48:16 -0700 (PDT)
Message-ID: <b7a19bb7-94e9-4837-c1dd-0ca891995efb@gmail.com>
Date: Thu, 8 Jun 2023 18:48:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/5] ASoC: mediatek: mt8188-mt6359: Compress of_device_id
 entries
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, amergnat@baylibre.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230608084727.74403-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: F2M5XNJHMDWD5OEMCC6SZPKIW2NJTZV4
X-Message-ID-Hash: F2M5XNJHMDWD5OEMCC6SZPKIW2NJTZV4
X-MailFrom: matthias.bgg@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F2M5XNJHMDWD5OEMCC6SZPKIW2NJTZV4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 08/06/2023 10:47, AngeloGioacchino Del Regno wrote:
> Those entries fit in one line: compress them to reduce line count.
> While at it, also add the sentinel comment to the last entry.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index bc4b74970a46..643a7a12a96b 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -1117,15 +1117,9 @@ static struct mt8188_card_data mt8188_nau8825_card = {
>   };
>   
>   static const struct of_device_id mt8188_mt6359_dt_match[] = {
> -	{
> -		.compatible = "mediatek,mt8188-mt6359-evb",
> -		.data = &mt8188_evb_card,
> -	},
> -	{
> -		.compatible = "mediatek,mt8188-nau8825",
> -		.data = &mt8188_nau8825_card,
> -	},
> -	{},
> +	{ .compatible = "mediatek,mt8188-mt6359-evb", .data = &mt8188_evb_card, },
> +	{ .compatible = "mediatek,mt8188-nau8825", .data = &mt8188_nau8825_card, },
> +	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, mt8188_mt6359_dt_match);
>   
