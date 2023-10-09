Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 906FE7BDB91
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 14:21:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 158C6DED;
	Mon,  9 Oct 2023 14:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 158C6DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696854108;
	bh=ltBHVfNpOMGPjjWoCkqTtFcFuhUvovse3VSY6GPftr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q7oN/PjXQm18J613LRmdg1fR+99294Xw3KezOQS5ArX5HvU8lPr/DBXsmdxVTawVg
	 FgxBBYl9nBiREt+3NBG69rr6zAym/pupOX1QpEk6yI3m1/WWQo8kR/myf8zOFvdKQ2
	 YFqjOOvkr65CWc48Ay+Ivp653er1Vqb8zfoWjkI0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59606F802BE; Mon,  9 Oct 2023 14:20:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C631FF8027B;
	Mon,  9 Oct 2023 14:20:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A6B2F802BE; Mon,  9 Oct 2023 14:20:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C20AF80130
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 14:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C20AF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=DWF+bb2t
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E698D660576C;
	Mon,  9 Oct 2023 13:20:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696854046;
	bh=ltBHVfNpOMGPjjWoCkqTtFcFuhUvovse3VSY6GPftr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DWF+bb2tcd3rtuLuii3pdK99bZopv8lB8c6HfzQOq1TrcL5yAutOz274686oyxOVV
	 ZW3BjdO4kgR8Ym4bnF/cjY2unKDQFCWCy33gyuzuGmavlvPXwEp7//oJPk3qriYA7S
	 x6ox4ErhcAeF3BloZaym3gjJdAy6hHWZWYKhCTHgMuU1m69J8xg32t1vkAvS6ItO5C
	 4GHZk9aXIVAdVmqpjs5ctx+Vu5zAEXUUyf9vEXFE/yts1uu80PMIyuKYSHtw4DDGXG
	 zAByRegOR8DOGtbl1UAwCkkn2vHgxSNOohCwZNZ9Thk0jmuWFq7jMaRdzgp4+zigHZ
	 MjzmO730nIeqw==
Message-ID: <9c28b84e-2d4e-7bc2-88f3-ad5b30d2c727@collabora.com>
Date: Mon, 9 Oct 2023 14:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [v4 2/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Content-Language: en-US
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: 
 <20231008014629.4971-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20231008014629.4971-3-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: 
 <20231008014629.4971-3-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7QNNF465N42FIB33MG4YX2XDB2A3KVV6
X-Message-ID-Hash: 7QNNF465N42FIB33MG4YX2XDB2A3KVV6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QNNF465N42FIB33MG4YX2XDB2A3KVV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 08/10/23 03:46, xiazhengqiao ha scritto:
> To use RT5682S as the codec and MAX98390 as the amp, add a new
> sound card named mt8188_rt5682s.
> 
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> Reviewed-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   sound/soc/mediatek/Kconfig                |   1 +
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 141 +++++++++++++++++++++-
>   2 files changed, 140 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 8d1bc8814486..43c8fea00439 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -250,6 +250,7 @@ config SND_SOC_MT8188_MT6359
>   	select SND_SOC_MAX98390
>   	select SND_SOC_NAU8315
>   	select SND_SOC_NAU8825
> +	select SND_SOC_RT5682S
>   	help
>   	  This adds support for ASoC machine driver for MediaTek MT8188
>   	  boards with the MT6359 and other I2S audio codecs.
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index e2416b981e1f..66f246126728 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -17,6 +17,7 @@
>   #include "mt8188-afe-common.h"
>   #include "../../codecs/nau8825.h"
>   #include "../../codecs/mt6359.h"
> +#include "../../codecs/rt5682.h"
>   #include "../common/mtk-afe-platform-driver.h"
>   #include "../common/mtk-soundcard-driver.h"
>   #include "../common/mtk-dsp-sof-common.h"
> @@ -32,7 +33,7 @@
>    #define TEST_MISO_DONE_2	BIT(29)
>   
>   #define NAU8825_HS_PRESENT	BIT(0)
> -
> +#define RT5682S_HS_PRESENT	BIT(1)
>   /*
>    * Maxim MAX98390
>    */
> @@ -52,6 +53,8 @@
>   #define SOF_DMA_UL4 "SOF_DMA_UL4"
>   #define SOF_DMA_UL5 "SOF_DMA_UL5"
>   
> +#define RT5682S_CODEC_DAI     "rt5682s-aif1"
> +
>   /* FE */
>   SND_SOC_DAILINK_DEFS(playback2,
>   		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
> @@ -258,6 +261,17 @@ static struct snd_soc_jack_pin nau8825_jack_pins[] = {
>   	},
>   };
>   
> +static struct snd_soc_jack_pin rt5682s_jack_pins[] = {

nau8825_jack_pins is exactly the same as this one, can we please commonize
and avoid duplicate declarations?

> +	{
> +		.pin    = "Headphone Jack",
> +		.mask   = SND_JACK_HEADPHONE,
> +	},
> +	{
> +		.pin    = "Headset Mic",
> +		.mask   = SND_JACK_MICROPHONE,
> +	},
> +};
> +
>   struct mt8188_card_data {
>   	const char *name;
>   	unsigned long quirk;
> @@ -316,10 +330,18 @@ static const struct snd_soc_dapm_widget mt8188_nau8825_widgets[] = {
>   	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>   };
>   
> +static const struct snd_soc_dapm_widget mt8188_rt5682s_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +};

Same here...

> +
>   static const struct snd_kcontrol_new mt8188_nau8825_controls[] = {
>   	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
>   };
>   
> +static const struct snd_kcontrol_new mt8188_rt5682s_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
> +};

...and here.

Regards,
Angelo

