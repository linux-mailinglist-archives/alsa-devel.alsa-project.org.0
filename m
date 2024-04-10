Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A735A8A9F17
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:52:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF2C914E9;
	Thu, 18 Apr 2024 17:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF2C914E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455522;
	bh=GGGXqb/dRvAmsbMVacoTodVUEkGNMLSBqd77vagY4mQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y/ek6Gd7Vdu1vylNBRTVddrWsr+kXie8K1YJCTKAcLM+xnMMigyPbmTAQC2kzPito
	 oxj0NvvMmvs2l16CeCtvAL3WIqTfFR6quvhGC0X2OfGohZh9916v4Nfocw3yu2WO4A
	 8pMANg8H4o523lwk16vixGh33fLuuzLEYSSG1YaU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57F55F806A2; Thu, 18 Apr 2024 17:47:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F0C1F80698;
	Thu, 18 Apr 2024 17:47:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D42A6F8026D; Wed, 10 Apr 2024 17:38:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24B15F800C9
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 17:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24B15F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=YzxDCTDi
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d700beb6beso74742831fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Apr 2024 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712763531;
 x=1713368331; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ziNLBEavMFMG0GfbRRHA8010gbB3jZaJU46gRxSDrTY=;
        b=YzxDCTDiLbF12kgyGM8bbYE0tne/torzrqT4yFIyUGVuPo830GnYEkeRDM9UMUmTt8
         KS4EF2T25d1iAGa4F99Q1rna8zCNbs+DC1WNB2k6amDfeDgELJefosfp9PIIrBRlCLcj
         7HBjEHknZ22f49FDPdxg/jIdjHnRr6G6DL7srELXIH4sipM5PVlX6ys/qHAfiVO5Ws7V
         WIt+J7aYclyQaFksMD96pFzMFyg7dNvELDZiR8Oyqaus2166E8c2lpjATyxYxrc8936U
         tbA4ZqauTToN3JPc4z4GYFm36fSKlWCykm6HWVrTBZCN4OLVqrv+I3P4Rw7KbiyWrWIU
         nhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712763531; x=1713368331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ziNLBEavMFMG0GfbRRHA8010gbB3jZaJU46gRxSDrTY=;
        b=r+t4T42xLxZYmZXyRa1z/N9GFWsZ6aKJQhB8MEX6l5Ei9Kj0ITYthJ5FNos1hYmUWf
         RSS3lGUiSs7hpXrDbhqYrTOizQNE+q8F4/LyfoyyyepKKBy7ffuoOveTDmx57zKq0YMK
         mykgYBYg5Tf7Q0q0wNw/5PqPu9nl7Rl0JX5XRjYmZl2d1lhZwLYmdWIlsqPgEufcrcEH
         M1kD+IuWHc+Mp4osgpI4ir7yGKtd6hfYaRLOkIer4BwUpC3TPjhN51e4T69nV55K2ay4
         DKCPQGZ+uQ+JaOA7BD3WzIPTfqMKbMKRUsSMk+CGSdzSNz/77rWWtOWBPZgvYVCJC7Cq
         MfdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv+T0wcDtw/HGnjy8b4lmcd77fldPjGHNG2iHJrnUzMqczpq9fvtk0bTQy65W3YDDI5FN1S6paONLkW56Htu/NWwZt+g7VXRcyMQo=
X-Gm-Message-State: AOJu0Yx0cl4mZUYFSTHSiAup+nuWL1+Hnild67X/MkiIvUYUwWfU3Ucw
	26km1KHRtrQ7YZehhsOKJeW90nMpBCyqhN+lDhoUggXnN2CbrrIxTSqOm0W5MOA=
X-Google-Smtp-Source: 
 AGHT+IG2wwHYacJLlQJ1p8tbRHpThfXnZhkjy+riyIarl5DIopRdALbX2un4cz4Xr1qBJqWWBM+Yfw==
X-Received: by 2002:a05:651c:1a28:b0:2d8:34ad:7f4e with SMTP id
 by40-20020a05651c1a2800b002d834ad7f4emr2818446ljb.4.1712763530670;
        Wed, 10 Apr 2024 08:38:50 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c470700b00416b2cbad06sm2591936wmo.41.2024.04.10.08.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:38:50 -0700 (PDT)
Message-ID: <757b554b-add9-4d0e-89cf-0a5569187f18@baylibre.com>
Date: Wed, 10 Apr 2024 17:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/18] ASoC: mediatek: mt8186: Unify mt8186-mt6366
 machine drivers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
 <20240409113310.303261-14-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: 
 <20240409113310.303261-14-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BQMAX7S7SSRDKF6SY6QKADQZE5UA3QE6
X-Message-ID-Hash: BQMAX7S7SSRDKF6SY6QKADQZE5UA3QE6
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:47:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQMAX7S7SSRDKF6SY6QKADQZE5UA3QE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> @@ -318,16 +409,24 @@ static int mt8186_it6505_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   static int mt8186_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
>   				     struct snd_pcm_hw_params *params)
>   {
> +	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
>   	int ret;
>   
>   	ret = mtk_sof_dai_link_fixup(rtd, params);
>   
>   	if (!strcmp(rtd->dai_link->name, "I2S0") ||
>   	    !strcmp(rtd->dai_link->name, "I2S1") ||
> -	    !strcmp(rtd->dai_link->name, "I2S2"))
> -		mt8186_i2s_hw_params_fixup(rtd, params);
> -	else if (!strcmp(rtd->dai_link->name, "I2S3"))
> -		mt8186_it6505_i2s_hw_params_fixup(rtd, params);
> +	    !strcmp(rtd->dai_link->name, "I2S2")) {
> +		if (soc_card_data->card_data->flags & DA7219_CODEC_PRESENT)

Is the flag missing like you did for mt8195-mt6359.c ?
			if (!(codec_init & MT6359_CODEC_INIT)) {
				dai_link->init = mt8195_mt6359_init;
				codec_init |= MT6359_CODEC_INIT;


> +			mt8186_i2s_hw_params_32le_fixup(rtd, params);
> +		else
> +			mt8186_i2s_hw_params_24le_fixup(rtd, params);
> +	} else if (!strcmp(rtd->dai_link->name, "I2S3")) {
> +		if (soc_card_data->card_data->flags & DA7219_CODEC_PRESENT)
> +			mt8186_i2s_hw_params_24le_fixup(rtd, params);
> +		else
> +			mt8186_i2s_hw_params_32le_fixup(rtd, params);
> +	}
>   
>   	return ret;
>   }

-- 
Regards,
Alexandre
