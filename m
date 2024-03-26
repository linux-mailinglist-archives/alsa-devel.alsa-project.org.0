Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E50A988BD46
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 10:06:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1FC61ED;
	Tue, 26 Mar 2024 10:05:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1FC61ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711443969;
	bh=ixR84/hC5ObDuk4xPuGOBtJ9kzC3VnB6M3PMiFfGYYw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W5oJj/PP1POwFyIgLo9q8caust+qzK0pkIPQwaeLKhATq3/PcSaVrJFB4yTBR9gG8
	 fIo9hg5s0HWajsN3eb20B0RKs49Sz8A9BhVlr1/CTl/YeaKWAnHmlE8Poz5JYfs1tj
	 qPlZDWYDPwcyZsKWsA6xKf1lIxS1DXhfA0hP+o2I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99FC7F801EB; Tue, 26 Mar 2024 10:05:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 542D6F80587;
	Tue, 26 Mar 2024 10:05:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22E82F8025F; Tue, 26 Mar 2024 10:02:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFE22F801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 10:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFE22F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=xVo5qX9g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711443682;
	bh=ixR84/hC5ObDuk4xPuGOBtJ9kzC3VnB6M3PMiFfGYYw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xVo5qX9gWM7zCDSwnSrhWrJ89WQvr7Mbc8CNeGAKCYK8/DNDNUah7EFJtxQsJQteW
	 pwHub4vWv7+ankvLH9iVnb3NilI/G/gn5g4ssqgBuAMsTkG0XhBKVGw4mg2Qq5nPpO
	 croR8uM9EiMqWkOpeGDYUWP4vMdJbgFKuUn/xTItahZ7+NaWD3vz2hgCiZGvbbtZ+a
	 oWifTWYZw2g2fRnlXx8xQYfX9I7Pn6yFQyGaKZnyTth+SqgOzxAhMeo6rwwjZaKjAd
	 3cevRIaBA+SSmFVdKAFeITWqCF0EzI7DS2OH7ViPquRFEKRIM+JoZaqX4qhH3fEzVH
	 jl47zmQ8nbWbA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 15BA33782082;
	Tue, 26 Mar 2024 09:01:20 +0000 (UTC)
Message-ID: <eb4b5b1d-90dc-4355-8fb0-5fb7f2bb2426@collabora.com>
Date: Tue, 26 Mar 2024 10:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/22] ASoC: mediatek: Add common machine soundcard
 driver probe mechanism
To: Mark Brown <broonie@kernel.org>
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com,
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
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
 <20240313110147.1267793-6-angelogioacchino.delregno@collabora.com>
 <6b9dd2ad-a24e-497a-8a5c-c7c04475cf5d@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6b9dd2ad-a24e-497a-8a5c-c7c04475cf5d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ET327NGFE6SH5ILFOYYKZHD5RNIKR25D
X-Message-ID-Hash: ET327NGFE6SH5ILFOYYKZHD5RNIKR25D
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ET327NGFE6SH5ILFOYYKZHD5RNIKR25D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 25/03/24 15:18, Mark Brown ha scritto:
> On Wed, Mar 13, 2024 at 12:01:30PM +0100, AngeloGioacchino Del Regno wrote:
>> Add a common machine soundcard driver probe function that supports both
>> DSP and AFE-direct usecases and also provides a hook for legacy machine
>> soundcard driver probe mechanisms.
>>
>> Note that the hook is there because, even for legacy probe, a lot of the
>> actual code can still be commonized, hence still reducing duplication
>> for the legacy devicetree retrocompatibility cases.
>>
>> This common probe function deprecates all of the inconsistent previous
>> probe mechanisms and aims to settle all of the MediaTek card drivers on
>> consistent and common devicetree properties describing wanted DAIs,
>> device specific DAI configuration and DAI links to codecs found on
>> each device/board.
> 
> This breaks allmodconfig builds:

Oops. Forgot to test this commit without the next one constifying stuff around.
I'll recheck and make this one right. Good catch!

Thanks for notifying!

Cheers,
Angelo

> 
> 
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In function ‘mtk_sof_dai_link_fixup’:
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:18:41: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>     18 |         struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
>        |                                         ^~~~~~~~~~~~~
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In function ‘mtk_sof_card_probe’:
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:58:41: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>     58 |         struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
>        |                                         ^~~~~~~~~~~~~
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In function ‘mtk_sof_find_tplg_be’:
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:76:41: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>     76 |         struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
>        |                                         ^~~~~~~~~~~~~
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In function ‘mtk_sof_check_tplg_be_dai_link_fixup’:
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:116:41: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>    116 |         struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
>        |                                         ^~~~~~~~~~~~~
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In function ‘mtk_sof_card_late_probe’:
> /build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:147:41: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>    147 |         struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
>        |                                         ^~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> 
