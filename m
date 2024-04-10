Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E08A9EFD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:49:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29F33E67;
	Thu, 18 Apr 2024 17:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29F33E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455367;
	bh=9VfcLjEoMTpi7xm+VUn6B0UvA2/X0m8cCVXK0p51Jw4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vOcmeWRao8+SInFBq8TVbGYLyXdTX7UODXWRCkYkVroLVln4h5lQd7Vi/h6Tqrisb
	 SRA3Qigu4S/6sHF7zk1kKY9OYBQhpAQLFBYVz56fVItVGB/NPjSwzrlNTvHRFqKBvK
	 S8I+Rg5IJGRPK++RBi3O75/VXBH8BDW3zoAlAFa8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 334A1F80878; Thu, 18 Apr 2024 17:45:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E907F80C90;
	Thu, 18 Apr 2024 17:45:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2891F8026D; Wed, 10 Apr 2024 16:00:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C027F800C9
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 15:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C027F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=kEsihWUH
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-343f62d8124so3527134f8f.2
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Apr 2024 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712757597;
 x=1713362397; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g67OSHlwNTDKaFrM3/uwoPsdE8uUwCxkLF5hYguHcs4=;
        b=kEsihWUHuCkKdb9kFThp5Dc+pb2vFU12e8tISDdCFhVdRAGUU408vpYPqoNZw32And
         LUocvhGePhojhr9VVTN7RAoqc170v/5e+vOA/kGnM6YIed7v8fCg12jjEkVQg4hHcp4y
         6pWD/VNURaRGXQh+g389muxY2bP7colk8LtboyC6ZrADVrjmWalPO2zsmwOYfsyXmO18
         qXmxXJBAAbY++vPKFQuHx/xM4vZBNHxNEc2CTdze8F/9yWksnhlPdqIm3ACCxQT63Mhw
         GvJzP66mZYzGBPBpnajT+e9vFVn7QqQBxxjIM35ETGm+5HSgWpzaZlqA+H/Em2RCY2N/
         ha3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712757597; x=1713362397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g67OSHlwNTDKaFrM3/uwoPsdE8uUwCxkLF5hYguHcs4=;
        b=FBbjwN3KEqw3MLiICZ9xaPDzFDvtXCFaXgHI/FhOTLgsSwMFnwuKf4AsDesB+pcOyl
         xPdhrCsumC4TzdT62dHuzrV/WZxYFihnwYs008jh7z4W8PCIXNPj8R7lcq9qOLw5IjgS
         ePalqDCGDeww4zPyKfht0PS7QudkSVcW7awBko83feuaN98OXWhlRNWN2p9oJxshJuzj
         Jw9c+QrA6wNPneX2nG4VtCQqzBHZYJhTL8DOkcTagCVdfwxgCzVCmaAHLZqnjktYypiy
         GumzseQ3TyC6ZV1DM2qaVKrh0fOYPn8C5mJ+0PmBZ8SLxfaQLghseBPY45RcIzQGqdgN
         x8mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJwHB4r/5Pd4MFU5z3Z58gHdMf0fag1ZejjOjIC/nJO7oqyrutAdTI5WnhaOgurpDQjiQRmEXBORVnLShiGSeQ7Akfzh7EOxo94kA=
X-Gm-Message-State: AOJu0YwSoNPJi2raw+lIW1RBKE3+joeZp4hksbeXgbtCuP2lSUfGmBRq
	e4/itZaaDSDjNl0DDX54XUW6AV578lxugHhCPKaTwIH+eMl+lGOoOsBSiBHfXe8=
X-Google-Smtp-Source: 
 AGHT+IGRtn6DL2DEemnsBxsmvHHTd4nWEQsASvLDi6kfhHaIx+DPnIFaevFeAdtATqfu2OGeHdeMQw==
X-Received: by 2002:a5d:620c:0:b0:343:98ee:524 with SMTP id
 y12-20020a5d620c000000b0034398ee0524mr1624742wru.36.1712757597439;
        Wed, 10 Apr 2024 06:59:57 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 j15-20020a5d452f000000b00343e825d679sm13385379wra.87.2024.04.10.06.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:59:56 -0700 (PDT)
Message-ID: <cf0184c4-2b3e-4074-9e30-bf65ec7f0aaa@baylibre.com>
Date: Wed, 10 Apr 2024 15:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/18] ASoC: mediatek: mt8192: Migrate to
 mtk_soundcard_common_probe
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
 <20240409113310.303261-6-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SSOLB3XN4DZY3IFF2FXQV67KWM6BIEPV
X-Message-ID-Hash: SSOLB3XN4DZY3IFF2FXQV67KWM6BIEPV
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:45:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSOLB3XN4DZY3IFF2FXQV67KWM6BIEPV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> @@ -1211,52 +1196,85 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
>   		if (dai_link->num_codecs && dai_link->codecs[0].dai_name &&
>   		    strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
>   			dai_link->ops = &mt8192_rt1015_i2s_ops;
> -
> -		if (!dai_link->platforms->name)
> -			dai_link->platforms->of_node = platform_node;
> -	}
> -
> -	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv) {
> -		ret = -ENOMEM;
> -		goto err_probe;
> -	}
> -	snd_soc_card_set_drvdata(card, priv);
> -
> -	ret = mt8192_afe_gpio_init(&pdev->dev);
> -	if (ret) {
> -		dev_err_probe(&pdev->dev, ret, "%s init gpio error\n", __func__);

I don't think __func__ is necessary.

> -		goto err_probe;
>   	}
>   
> -	ret = devm_snd_soc_register_card(&pdev->dev, card);
> -	if (ret)
> -		dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", __func__);

I don't think __func__ is necessary.

> -
> -err_probe:
>   	of_node_put(headset_codec);
>   err_headset_codec:
>   	of_node_put(speaker_codec);
>   err_speaker_codec:
> -	of_node_put(platform_node);
> -err_platform_node:
> -	of_node_put(hdmi_codec);
> +	if (hdmi_codec)
> +		of_node_put(hdmi_codec);
> +
>   	return ret;
>   }
>   
> +static int mt8192_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data, bool legacy)
> +{
> +	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
> +	struct snd_soc_card *card = card_data->card;
> +	int ret;
> +
> +	if (legacy) {
> +		ret = mt8192_mt6359_legacy_probe(soc_card_data);
> +		if (ret)
> +			return ret;
> +	} else {
> +		struct snd_soc_dai_link *dai_link;
> +		int i;
> +
> +		for_each_card_prelinks(card, i, dai_link)
> +			if (dai_link->num_codecs && dai_link->codecs[0].dai_name &&
> +			    strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
> +				dai_link->ops = &mt8192_rt1015_i2s_ops;
> +	}
> +
> +	ret = mt8192_afe_gpio_init(card->dev);
> +	if (ret)
> +		return dev_err_probe(card->dev, ret, "%s init gpio error\n", __func__);

I don't think __func__ is necessary.

> +
> +	return 0;
> +}

Beside that,
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
