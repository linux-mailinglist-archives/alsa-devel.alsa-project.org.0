Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF48454DE
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 11:09:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA2FFA4A;
	Thu,  1 Feb 2024 11:09:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA2FFA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706782168;
	bh=Zbw1duyIkUff9kk8iVE8KbWbqATyvr/EHkllKd6B7Ow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q8SuTnkDoyHKFrXI00UqNnEKc7mySG49rMaIuc3CCBnyZ5PqtbUxsN0GDRGbA22/+
	 cawNN4QvLBNl2YRiUJCq90VTnwaGiOhdnk34pybfDgsFK80JTLDzxTVz9fPnFJwNgN
	 EBtpsIIgR5DY95sT6BqZwCutwMONSisQ02HwcysM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBD29F805A0; Thu,  1 Feb 2024 11:08:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3E1BF80564;
	Thu,  1 Feb 2024 11:08:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CED3F8055C; Thu,  1 Feb 2024 11:08:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90EF5F80149
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 11:08:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90EF5F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Z86UnYCO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706782122;
	bh=Zbw1duyIkUff9kk8iVE8KbWbqATyvr/EHkllKd6B7Ow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z86UnYCO3n19Iz57kNWMmT0uZdLi3ScTKbcJBmq+uANG3S3GFbOPzIJkYnPiv7imu
	 lUc7yeFkPdCt1D4SWAlRkJ8B/BsZD6IYrfSd+xZBOlFrLQ816gy5lOIt941oiRm0Ir
	 ZfDcRnAIDX5dU+tz1hR7gRSy2AOHRMOM63MJ5/Z4ih8wod/lPXx0uf9/3kfepJA2gJ
	 Z5qbo6PXrGxXuqUMFy63bWX4u+24WaAd50oE9I+koZVzdR+b9VjNd6jR7nx4l9dMTI
	 ad35+HPNKXoUiFt6v0zKjmmEKsRK/ewKAWOoey7c5HZApJ8cwmxuVO+bhpWWyUsytp
	 8eGV6rRexID+g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A3A5B3782081;
	Thu,  1 Feb 2024 10:08:41 +0000 (UTC)
Message-ID: <cace3472-7ee3-459b-ab2c-51764db99bd7@collabora.com>
Date: Thu, 1 Feb 2024 11:08:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] ASoC: mediatek: AFE drivers cleanups
Content-Language: en-US
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com,
 ribalda@chromium.org, nicolas.ferre@microchip.com,
 u.kleine-koenig@pengutronix.de, kuninori.morimoto.gx@renesas.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 trevor.wu@mediatek.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, lgirdwood@gmail.com
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7ZCNDOHVOJSZNTNXFCS4PDHKF7PJP7YW
X-Message-ID-Hash: 7ZCNDOHVOJSZNTNXFCS4PDHKF7PJP7YW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZCNDOHVOJSZNTNXFCS4PDHKF7PJP7YW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 11/01/24 11:52, AngeloGioacchino Del Regno ha scritto:
> This series converts MediaTek AFE drivers' probe functions to use
> dev_err_probe() and devm functions where possible and, in some
> cases, dropping the .remove_new() callback, reducing the size.
> 
> Cheers!

Gentle ping for this series, afraid that went out of the radar :-)

Cheers,
Angelo

> 
> AngeloGioacchino Del Regno (7):
>    ASoC: mediatek: mt8173-afe-pcm: Convert to devm_pm_runtime_enable()
>    ASoC: mediatek: mt8173-afe-pcm: Use devm_snd_soc_register_component()
>    ASoC: mediatek: mt8183-afe-pcm: Convert to devm_pm_runtime_enable()
>    ASoC: mediatek: mt8183-afe-pcm: Simplify with dev_err_probe()
>    ASoC: mediatek: mt8192-afe-pcm: Convert to devm_pm_runtime_enable()
>    ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
>    ASoC: mediatek: mt8195-afe-pcm: Drop .remove_new() callback
> 
>   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c |  78 +++------------
>   sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 108 +++++++--------------
>   sound/soc/mediatek/mt8192/mt8192-afe-pcm.c |  95 ++++++------------
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c |  12 +--
>   4 files changed, 81 insertions(+), 212 deletions(-)
> 

