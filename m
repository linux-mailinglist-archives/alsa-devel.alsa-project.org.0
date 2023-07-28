Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4FD76696A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 11:53:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69D6283A;
	Fri, 28 Jul 2023 11:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69D6283A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690538031;
	bh=+XBxa+9FcyJ2jM0I6wKqzFSaDcQCR5nHUkhM8eip8/w=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ExGdXxhsKN3f57VLIWjpvhToxMM98KUJYlQL2ITSbcUyT1DQp1MnEbn5g94X6gIxd
	 zJ328n2LpOEyk7F97euA0i/5V02CJOU751cd62CsKkWkYSu0RJzATJ8CpUsyUkZF7g
	 DuoL8a13hoZx9Gr9/+6sa/j7L3i6aKwrWj/NNKLk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9CABF801F5; Fri, 28 Jul 2023 11:53:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7341FF80163;
	Fri, 28 Jul 2023 11:53:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8691F8019B; Fri, 28 Jul 2023 11:52:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07BD9F800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 11:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07BD9F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=ThGvd03C
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 421036607166;
	Fri, 28 Jul 2023 10:52:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690537973;
	bh=+XBxa+9FcyJ2jM0I6wKqzFSaDcQCR5nHUkhM8eip8/w=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=ThGvd03C5juP8jx41+NL7hYzuTN8M4pseH/LR1gqAQLMqortisFZ2HHTaD0hZxpkQ
	 VTIEjtF4KTBXi5BTUKnaGVcRW1B8PKNhFyl5L0kPO8fkrEw+rl5gG4T8pECkRujCfa
	 A6NSTH/7ISmWU2yiPUN6j+m1Knj64jUs7AfnlyXbnfLe0tu5dAw+3PO/WIazqmJk5a
	 +MnEvJqXte4rNLApmjqY0yBXBob7gNfHGftAng/+vno2nqtCGuubEGLLsp8k5OtBMD
	 mPaUxA/yr7gGTVknh8QL+ZN8bb/IJeoZ3bozhhzYrnkwzw+6MHIbRI/VvUqpYVWlKv
	 xa2BtpWo2Tv7Q==
Message-ID: <3cd43731-a49e-e751-2839-84708333a0e2@collabora.com>
Date: Fri, 28 Jul 2023 11:52:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/6] ASoC: mediatek: mt7986: add machine driver with
 wm8960
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-5-maso.huang@mediatek.com>
 <bab11add-b56f-59d3-f4fc-ad248ebe9b99@collabora.com>
In-Reply-To: <bab11add-b56f-59d3-f4fc-ad248ebe9b99@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UZY7LZD7ZBAT5KZMHBZZCHH7GL22N3QO
X-Message-ID-Hash: UZY7LZD7ZBAT5KZMHBZZCHH7GL22N3QO
X-MailFrom: angelogioacchino.delregno@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZY7LZD7ZBAT5KZMHBZZCHH7GL22N3QO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 28/07/23 11:49, AngeloGioacchino Del Regno ha scritto:
> Il 28/07/23 11:08, Maso Huang ha scritto:
>> Add support for mt7986 board with wm8960.
>>
>> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
>> ---
>>   sound/soc/mediatek/Kconfig                |  10 ++
>>   sound/soc/mediatek/mt7986/Makefile        |   1 +
>>   sound/soc/mediatek/mt7986/mt7986-wm8960.c | 184 ++++++++++++++++++++++
>>   3 files changed, 195 insertions(+)
>>   create mode 100644 sound/soc/mediatek/mt7986/mt7986-wm8960.c
>>
>> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
>> index 558827755a8d..8d1bc8814486 100644
>> --- a/sound/soc/mediatek/Kconfig
>> +++ b/sound/soc/mediatek/Kconfig
>> @@ -64,6 +64,16 @@ config SND_SOC_MT7986
>>         Select Y if you have such device.
>>         If unsure select "N".
>> +config SND_SOC_MT7986_WM8960
>> +    tristate "ASoc Audio driver for MT7986 with WM8960 codec"
>> +    depends on SND_SOC_MT7986 && I2C
>> +    select SND_SOC_WM8960
>> +    help
>> +      This adds support for ASoC machine driver for MediaTek MT7986
>> +      boards with the WM8960 codecs.
>> +      Select Y if you have such device.
>> +      If unsure select "N".
>> +
>>   config SND_SOC_MT8173
>>       tristate "ASoC support for Mediatek MT8173 chip"
>>       depends on ARCH_MEDIATEK
>> diff --git a/sound/soc/mediatek/mt7986/Makefile b/sound/soc/mediatek/mt7986/Makefile
>> index de0742a67cae..fc4c82559b29 100644
>> --- a/sound/soc/mediatek/mt7986/Makefile
>> +++ b/sound/soc/mediatek/mt7986/Makefile
>> @@ -6,3 +6,4 @@ snd-soc-mt7986-afe-objs := \
>>       mt7986-dai-etdm.o
>>   obj-$(CONFIG_SND_SOC_MT7986) += snd-soc-mt7986-afe.o
>> +obj-$(CONFIG_SND_SOC_MT7986_WM8960) += mt7986-wm8960.o
>> diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c 
>> b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
>> new file mode 100644
>> index 000000000000..a880fcb8662e
>> --- /dev/null
>> +++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
> 
> ..snip..
> 
>> +static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
>> +{
>> +    struct snd_soc_card *card = &mt7986_wm8960_card;
>> +    struct snd_soc_dai_link *dai_link;
>> +    struct mt7986_wm8960_priv *priv;
>> +    int ret, i;
>> +
>> +    priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> +    if (!priv)
>> +        return -ENOMEM;
>> +
>> +    priv->platform_node = of_parse_phandle(pdev->dev.of_node,
>> +                           "mediatek,platform", 0);
>> +    if (!priv->platform_node) {
>> +        dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    for_each_card_prelinks(card, i, dai_link) {
>> +        if (dai_link->platforms->name)
>> +            continue;
>> +        dai_link->platforms->of_node = priv->platform_node;
>> +    }
>> +
>> +    card->dev = &pdev->dev;
>> +
>> +    priv->codec_node = of_parse_phandle(pdev->dev.of_node,
>> +                        "mediatek,audio-codec", 0);
>> +    if (!priv->codec_node) {
>> +        dev_err(&pdev->dev,
>> +            "Property 'audio-codec' missing or invalid\n");
>> +        of_node_put(priv->platform_node);
>> +        return -EINVAL;
>> +    }
>> +
>> +    for_each_card_prelinks(card, i, dai_link) {
>> +        if (dai_link->codecs->name)
>> +            continue;
>> +        dai_link->codecs->of_node = priv->codec_node;
>> +    }
>> +
>> +    ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
>> +    if (ret) {
>> +        dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
>> +        goto err_of_node_put;
>> +    }
>> +
>> +    ret = devm_snd_soc_register_card(&pdev->dev, card);
>> +    if (ret) {
>> +        dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
>> +            __func__, ret);
>> +        goto err_of_node_put;
>> +    }
>> +
>> +err_of_node_put:
>> +    of_node_put(priv->codec_node);
>> +    of_node_put(priv->platform_node);
>> +    return ret;
>> +}
>> +
>> +static void mt7986_wm8960_machine_remove(struct platform_device *pdev)
>> +{
>> +    struct snd_soc_card *card = platform_get_drvdata(pdev);
>> +    struct mt7986_wm8960_priv *priv = snd_soc_card_get_drvdata(card);
>> +
>> +    of_node_put(priv->codec_node);
>> +    of_node_put(priv->platform_node);
>> +}
>> +
>> +#ifdef CONFIG_OF
> 
> Your probe function *relies on* devicetree, and you're adding an ifdef for
> CONFIG_OF? That wouldn't make sense, would it? ;-)
> 
>> +static const struct of_device_id mt7986_wm8960_machine_dt_match[] = {
>> +    {.compatible = "mediatek,mt7986-wm8960-machine",},
> 
> please...
> 
> { .compatible = "mediatek,mt7986-wm8960-machine" },

Actually, I noticed that just after sending the review.

Can you also please change the compatible, as "machine" doesn't really
mean "sound"? :-)

.compatible = "mediatek,mt7986-wm8960-sound"

Thanks!

> 
>> +    { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, mt7986_wm8960_machine_dt_match);
>> +#endif
>> +
>> +static struct platform_driver mt7986_wm8960_machine = {
>> +    .driver = {
>> +        .name = "mt7986-wm8960",
>> +#ifdef CONFIG_OF
> 
> Check `struct device_driver`: const struct of_device_id *of_match_table is
> always present, there's no ifdef.... and that's done in order to avoid seeing
> a bunch of ifdefs in drivers...
> 
> ...so, why is this callback enclosed in an ifdef?
> 
> Please drop all those ifdefs.
> 
> 
> After addressing those last comments, you can get my
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Regards,
> Angelo

