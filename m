Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7727066BF
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:32:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D435B204;
	Wed, 17 May 2023 13:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D435B204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684323158;
	bh=L2mTlsU8VTc247vwq0FkEbhJOgBaKoelge6UNY1Jq28=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gQJxDmeHsPdmqLd9f1dmMWGvabffvshfhJnTlBamW8FcOBLHhWleODFAZDATpHRu7
	 D6866JISX/V7IHPKSAvxfTtep4Xa48NrreItpq5bwrdxaDzSa2eQ1EsXKS+eSHEqYg
	 xLIvgf+YXm/D9D0IS65Jkgdil9fK239Qae7ey00I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A98DFF8024E; Wed, 17 May 2023 13:31:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E690F8025A;
	Wed, 17 May 2023 13:31:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E890F80272; Wed, 17 May 2023 13:31:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2504BF8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2504BF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=dhFlWVbr
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E3754660563D;
	Wed, 17 May 2023 12:31:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684323094;
	bh=L2mTlsU8VTc247vwq0FkEbhJOgBaKoelge6UNY1Jq28=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dhFlWVbrsUUAUCO8oux7TvXYQVVNG8o7CgMnfFb9gVXKBxIuqSvsNyjv5gSAUIl8d
	 wg8O1k+IuiplGKJOsUHlIBMUot1ztw1WVetcQPD9PSAzRZWZTqflbOGbvwPdTeGTyK
	 4520iQ01nOUn9j3LLQnt18vv5nioXx26f2eC1DZDBmATH2/6NZ8My2yRS3QMVwNlCm
	 CBDdNSHIXOxAZBM6Vnx3C+p+7pvrQwhCHZXl1INby6jQntYFO2mrLPfWstzmvsz9mv
	 jk0tYFxkkyzUwqewsjTM6ZiQl10RWVcd63+ssb84QDgT55fHFp+C5m6F4iyljaTLmo
	 S8WNE20MwI0nA==
Message-ID: <154497b3-f5c7-45d6-edd5-729642b80be5@collabora.com>
Date: Wed, 17 May 2023 13:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/5] ASoC: mediatek: mt8188-mt6359: register hdmi/dp jack
 pins
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
 <20230517111534.32630-3-trevor.wu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230517111534.32630-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XDGDBGVXRPOLOTTFQXDNKSJVVXKTXGA5
X-Message-ID-Hash: XDGDBGVXRPOLOTTFQXDNKSJVVXKTXGA5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XDGDBGVXRPOLOTTFQXDNKSJVVXKTXGA5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 17/05/23 13:15, Trevor Wu ha scritto:
> Some userspace applications need jack control events, so register hdmi
> and dp jack pins to activate jack control events.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 27 +++++++++++++++++++----
>   1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index 833bc362dad2..6c3f36e2fffd 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -151,6 +151,20 @@ struct mt8188_mt6359_priv {
>   	struct snd_soc_jack hdmi_jack;
>   };
>   
> +static struct snd_soc_jack_pin mt8188_hdmi_jack_pins[] = {
> +	{
> +		.pin = "HDMI",

"HDMI Jack" is more consistent with the snd_soc_jack_new_pins() call performed
later.

> +		.mask = SND_JACK_LINEOUT,
> +	},
> +};
> +
> +static struct snd_soc_jack_pin mt8188_dp_jack_pins[] = {
> +	{
> +		.pin = "DP",

Same here: "DP Jack"

> +		.mask = SND_JACK_LINEOUT,
> +	},
> +};
> +

Regards,
Angelo

