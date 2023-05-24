Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D87C67125CD
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:44:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E688B851;
	Fri, 26 May 2023 13:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E688B851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685101496;
	bh=ZZPUoTjP7xJRGJghpgqLe6RGGtJMbVGg7u/LyeuxrSE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fD70Ud6VrSflYDtBrFpNmn9v1yrS8cJhaRFZXcRbg40PBkEIaakpNUz+zrUEu4jnx
	 N8NcYG5mPgkOGBQyP+xHOzDLoFxgWI5xNcpsjwa+bIfDr0yUsDlkhlxQLw6FH7KMHY
	 MqMQrXYnk4WVyTOcEEF8KcRillmUqEOK5nXQXcLQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70818F805B6; Fri, 26 May 2023 13:42:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8B11F805B2;
	Fri, 26 May 2023 13:42:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F0ECF805C9; Wed, 24 May 2023 17:52:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D432CF805C6
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 17:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D432CF805C6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=r9Xqu5ND
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f61530506aso7702575e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 24 May 2023 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684943509;
 x=1687535509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8geeXEOb1JFpSL51yP1LqtEfxAQbaVotjCJur5zhD4=;
        b=r9Xqu5ND0Bk5xdzrVcEKYQlFpEEChNge6LbIG0g17WQIR6Y6FlFTjj1VLIptKxk12Q
         yq45EGDPQw9rNHr+jipV1YSj4asgJuaRjeVL0NZhwSDk/F7WDrzxEpDXrSSJyrZb0/M3
         zBXKIn/cV0bBTAFnJDnUkCCcwvue3vKTmsqLCYu0uVu4CEJS93Dy/yQ+lZNpqtjw/llJ
         /i6QJwMZfnhn0BXjS9g7SEYSgcIwM6tYnNKca4sWH8rz2seGcHobfGaMYO1qrYroAdGx
         05BznJ1hGxFw4jfQNNWBm56IewOjSboZXbEWkM4NBUXJGppz8/FOt58lkiEa84eE4ux7
         4f7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684943509; x=1687535509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8geeXEOb1JFpSL51yP1LqtEfxAQbaVotjCJur5zhD4=;
        b=Hnk1FNvgqVzzwzk5KV3TDQEcWMF9hOjuMHgAyFzg//exQZiEIrTUQkrGBndDic1cgK
         UZ+63Si4C1fq2DIOlp/fY/npXrOYqftPC2kGD1l7Ot+oQMMXs+GX3udIeoi1+RoH298b
         /moscEIVWuamq/BqlE495hoaLMoDRanaq475rW6lz3+LeoNRhMJhMTTFSR2IsVIFEcIm
         EE7dnvINf8xSOAqGr9aV5FmKdfFqGiLjgsW9P9F6vinh0P7D0r2ETtVwfwkhoXwoynrr
         ADeHW9Td1zZth7TFcgc0OXxP+zo5XJ13NawURifau+PsIXeUk16Fm45W+bANf+lyNgmk
         QF1Q==
X-Gm-Message-State: AC+VfDzPD8+VE7UVnsTFyxRw1qYPAVXJ9YyXqGLKb7NRaBXTbHr1ul66
	yDXywShmT1WeslFnO7YeHYYdDQ==
X-Google-Smtp-Source: 
 ACHHUZ5sgxsCI/lVRvjZNq+J7kPDx+SvOmaq/8wjAiMQ785YfC+h5iFAEtyNc1gq4Kqqj6aQ7yTjgQ==
X-Received: by 2002:a7b:cb91:0:b0:3f6:45d:28a1 with SMTP id
 m17-20020a7bcb91000000b003f6045d28a1mr219488wmi.14.1684943508981;
        Wed, 24 May 2023 08:51:48 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 z26-20020a05600c221a00b003f60101074dsm2721773wml.33.2023.05.24.08.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 08:51:48 -0700 (PDT)
Message-ID: <dcd5050b-8459-e7cc-b5ad-eb435aba6e84@baylibre.com>
Date: Wed, 24 May 2023 17:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 6/7] ASoC: mediatek: mt8188-mt6359: support new board
 with nau88255
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-7-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230523021933.3422-7-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QKC4Q3WCB6XA6TPALVEMFBENGXHYJY4E
X-Message-ID-Hash: QKC4Q3WCB6XA6TPALVEMFBENGXHYJY4E
X-Mailman-Approved-At: Fri, 26 May 2023 11:42:20 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKC4Q3WCB6XA6TPALVEMFBENGXHYJY4E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/05/2023 04:19, Trevor Wu wrote:
>   	card_data = (struct mt8188_card_data *)of_device_get_match_data(&pdev->dev);
> @@ -776,9 +1066,38 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
>   				dai_link->init = mt8188_mt6359_init;
>   				init_mt6359 = true;
>   			}
> +		} else if (strcmp(dai_link->name, "ETDM1_OUT_BE") == 0 ||
> +			   strcmp(dai_link->name, "ETDM2_OUT_BE") == 0 ||
> +			   strcmp(dai_link->name, "ETDM1_IN_BE") == 0 ||
> +			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
> +			if (!strcmp(dai_link->codecs->dai_name, MAX98390_CODEC_DAI)) {
> +				dai_link->ops = &mt8188_max98390_ops;
> +				if (init_max98390)
> +					continue;

I prefer that you do like your patch [PATCH v2 1/7] to be consistent
and easy to read.

+			if (!init_mt6359) {
+				dai_link->init = mt8188_mt6359_init;
+				init_mt6359 = true;
+			}

> +
> +				dai_link->init = mt8188_max98390_codec_init;
> +				init_max98390 = true;
> +			} else if (!strcmp(dai_link->codecs->dai_name, NAU8825_CODEC_DAI)) {
> +				dai_link->ops = &mt8188_nau8825_ops;
> +				if (init_nau8825)
> +					continue;

ditto

> +
> +				dai_link->init = mt8188_nau8825_codec_init;
> +				dai_link->exit = mt8188_nau8825_codec_exit;
> +				init_nau8825 = true;
> +			} else {
> +				if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai")) {

Shouldn't be with a NOT operator ("!") ?
+ if (!strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai")) {


> +					if (init_dumb)
> +						continue;

ditto

> +
> +					dai_link->init = mt8188_dumb_amp_init;
> +					init_dumb = true;
> +				}
> +			}
>   		}
>   	}
>   
> +	priv->private_data = card_data;
>   	snd_soc_card_set_drvdata(card, priv);
>   
>   	ret = devm_snd_soc_register_card(&pdev->dev, card);
> @@ -795,11 +1114,20 @@ static struct mt8188_card_data mt8188_evb_card = {
>   	.name = "mt8188_mt6359",
>   };
>   
> +static struct mt8188_card_data mt8188_nau8825_card = {
> +	.name = "mt8188_nau8825",
> +	.quirk = NAU8825_HS_PRESENT,
> +};
> +
>   static const struct of_device_id mt8188_mt6359_dt_match[] = {
>   	{
>   		.compatible = "mediatek,mt8188-mt6359-evb",
>   		.data = &mt8188_evb_card,
>   	},
> +	{
> +		.compatible = "mediatek,mt8188-nau8825",
> +		.data = &mt8188_nau8825_card,
> +	},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mt8188_mt6359_dt_match);

-- 
Regards,
Alexandre

