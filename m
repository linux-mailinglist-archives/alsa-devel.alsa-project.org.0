Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D088575087
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 16:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 419D5193C;
	Thu, 14 Jul 2022 16:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 419D5193C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657808055;
	bh=K1pAx4yUym6fPpWmvpm8rAcGNbLZfMNPgYQz3MOq/KM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gy2L5QZjFjrWjHcuN0dXj6ynprmnGfIsd2ZzMQ23e0a7uIiHHquXCXeYMn1AIdLxh
	 +mmKUwHat+nkZLfK26TJS5Ovi9pjRvyZUdLJIMM9w1W2Nx0VFgNLbRFnTZxiy2g2DF
	 9+0jobjOVvPZx1twphGO0eJOfUu0oYtzItk+8ZOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACBB2F800AA;
	Thu, 14 Jul 2022 16:13:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BBC1F80165; Thu, 14 Jul 2022 16:13:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54731F8014E
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 16:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54731F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="KkuVebcL"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B6EFC6601A3B;
 Thu, 14 Jul 2022 15:13:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657807985;
 bh=K1pAx4yUym6fPpWmvpm8rAcGNbLZfMNPgYQz3MOq/KM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KkuVebcLx9P3YNSG5CYljp9B98IOxqVxAVxR3Z5DXxVLFCO+yM9qMTKuKQxVkUg0x
 pxpEm2JYS8pt7RkXL8eG4YquZ2Q/pIF3pUQ9QIpecnHutC6jxUFr4mIyJplFhnpAma
 AKqpbRQh/9D5UXVYx79cdq5cynV3pV8Q/Nk9xehoS4cucN25RG8a0HNRaWpdipcs2R
 PeOV6P3gCzUcTCi22FNwHoG+fgblDAhXkGhVr9pPito0xY66ujKkrbRY8Jlh183eQy
 wvUmwpMItZTzcRGfLOgoK9qXCmwUM154IToVD4OsPNoHHiXfMJc540R5WZdVutvGK/
 LYYyPSkRARddw==
Message-ID: <6991dcc6-5902-a9ed-78c4-c7bd4f60f91c@collabora.com>
Date: Thu, 14 Jul 2022 16:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 5/8] ASoC: mediatek: mt8186: add machine driver with
 mt6366, da7219 and max98357
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
References: <20220712150442.32504-1-jiaxin.yu@mediatek.com>
 <20220712150442.32504-6-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220712150442.32504-6-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 12/07/22 17:04, Jiaxin Yu ha scritto:
> Add support for mt8186 board with mt6366, da7219 and max98357.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>   sound/soc/mediatek/Kconfig                    |   16 +
>   sound/soc/mediatek/mt8186/Makefile            |    1 +
>   .../mt8186/mt8186-mt6366-da7219-max98357.c    | 1002 +++++++++++++++++
>   3 files changed, 1019 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
> 

> +
> +static int mt8186_mt6366_da7219_max98357_dev_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card;
> +	struct snd_soc_dai_link *dai_link;
> +	struct mt8186_mt6366_da7219_max98357_priv *priv;
> +	struct device_node *platform_node, *headset_codec, *playback_codec;
> +	int ret, i;
> +
> +	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);

You don't really need this cast, plus, you can use device_get_match_data() instead.

After that:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
