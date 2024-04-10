Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3C89FB93
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 17:30:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12EF9211D;
	Wed, 10 Apr 2024 17:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12EF9211D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712763025;
	bh=CKYJu7WyQjbgodgDBQk/bD0aZ+5Ih4b2bRRph8ajJNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mayYkeEfHvHhyRV+e3QY58roTEzBq9Wk+NBk5Fpj1IQA82BiotLunxUjXw3WiTKm+
	 ilwaIRBdJwwRmRHMjMsFThjOeKVI1aKNoy/dZgHiHYnsvT8ZUJYhhgqKypukFRdoBi
	 voN1uEem0UJcKbq2bRGa+m0orEy/tiJD6TeYd9B0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCE92F80571; Wed, 10 Apr 2024 17:30:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 070FAF805A1;
	Wed, 10 Apr 2024 17:30:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBECAF8026D; Wed, 10 Apr 2024 17:28:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDEA3F8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 17:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDEA3F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=K1g8NZ9X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712762924;
	bh=CKYJu7WyQjbgodgDBQk/bD0aZ+5Ih4b2bRRph8ajJNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K1g8NZ9XR3lakU90fT945gzq+DiAo/FRpF8YT7T6u+aQZmErduUjLkdbPHkFjx8pu
	 mzrRW1tBX48RU8nBach238E42fYVQLFIvISoTqSysZhQeyZRkdXYnEHB78EC60oPHs
	 HcAah3gmFWgu5zRhllO7O8W1tC98QU5Xc6BgbldS76U0M9dPM1Vw68ZgGPP9D1G5R4
	 dCTniLg2gjCeqAcr5rFQDwfICu23kOxzIWORkG44Xmu1YRVXkgd2ISRqssYHuleWcZ
	 2riMyfqkOmZ9NXXLB+wUCSUs577ZiwKxtmL1FoSDrtAxskh8Uj1CoNZCDrihogfJW5
	 HhS7bd8w+H66w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 89F423780C13;
	Wed, 10 Apr 2024 15:28:42 +0000 (UTC)
Message-ID: <636411e6-05fd-4e32-8e3c-6bcc0c9ec063@collabora.com>
Date: Wed, 10 Apr 2024 17:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/18] ASoC: mediatek: mt8192: Migrate to
 mtk_soundcard_common_probe
To: Alexandre Mergnat <amergnat@baylibre.com>, broonie@kernel.org
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
 <cf0184c4-2b3e-4074-9e30-bf65ec7f0aaa@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cf0184c4-2b3e-4074-9e30-bf65ec7f0aaa@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SCSH76IZNXUT27WMS34I6NROLT3NKLXQ
X-Message-ID-Hash: SCSH76IZNXUT27WMS34I6NROLT3NKLXQ
X-MailFrom: angelogioacchino.delregno@collabora.com
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 10/04/24 15:59, Alexandre Mergnat ha scritto:
> 
> 
> On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
>> @@ -1211,52 +1196,85 @@ static int mt8192_mt6359_dev_probe(struct platform_device 
>> *pdev)
>>           if (dai_link->num_codecs && dai_link->codecs[0].dai_name &&
>>               strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
>>               dai_link->ops = &mt8192_rt1015_i2s_ops;
>> -
>> -        if (!dai_link->platforms->name)
>> -            dai_link->platforms->of_node = platform_node;
>> -    }
>> -
>> -    priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> -    if (!priv) {
>> -        ret = -ENOMEM;
>> -        goto err_probe;
>> -    }
>> -    snd_soc_card_set_drvdata(card, priv);
>> -
>> -    ret = mt8192_afe_gpio_init(&pdev->dev);
>> -    if (ret) {
>> -        dev_err_probe(&pdev->dev, ret, "%s init gpio error\n", __func__);
> 
> I don't think __func__ is necessary.
> 
>> -        goto err_probe;
>>       }
>> -    ret = devm_snd_soc_register_card(&pdev->dev, card);
>> -    if (ret)
>> -        dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", 
>> __func__);
> 
> I don't think __func__ is necessary.

I am removing the line, here :-P

> 
>> -
>> -err_probe:
>>       of_node_put(headset_codec);
>>   err_headset_codec:
>>       of_node_put(speaker_codec);
>>   err_speaker_codec:
>> -    of_node_put(platform_node);
>> -err_platform_node:
>> -    of_node_put(hdmi_codec);
>> +    if (hdmi_codec)
>> +        of_node_put(hdmi_codec);
>> +
>>       return ret;
>>   }
>> +static int mt8192_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data, 
>> bool legacy)
>> +{
>> +    struct mtk_platform_card_data *card_data = soc_card_data->card_data;
>> +    struct snd_soc_card *card = card_data->card;
>> +    int ret;
>> +
>> +    if (legacy) {
>> +        ret = mt8192_mt6359_legacy_probe(soc_card_data);
>> +        if (ret)
>> +            return ret;
>> +    } else {
>> +        struct snd_soc_dai_link *dai_link;
>> +        int i;
>> +
>> +        for_each_card_prelinks(card, i, dai_link)
>> +            if (dai_link->num_codecs && dai_link->codecs[0].dai_name &&
>> +                strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
>> +                dai_link->ops = &mt8192_rt1015_i2s_ops;
>> +    }
>> +
>> +    ret = mt8192_afe_gpio_init(card->dev);
>> +    if (ret)
>> +        return dev_err_probe(card->dev, ret, "%s init gpio error\n", __func__);
> 
> I don't think __func__ is necessary.
> 

That was on purpose.
I'm migrating things, but I am leaving the prints as they were.

Cheers,
Angelo

>> +
>> +    return 0;
>> +}
> 
> Beside that,
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> 



