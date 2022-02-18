Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD044BBB15
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Feb 2022 15:55:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E60DD1754;
	Fri, 18 Feb 2022 15:54:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E60DD1754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645196131;
	bh=waAoYQrd/zon1ObYSebR32rz8jo/+xh5mii/0mQIta0=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ShS9v9h8YgcfIaf84NiohgmalMaXvFa8t4bhql0Y+uQ3J9rXgHLXAz6IaNMCtKbSj
	 iLSP9nqYXqZuBHus8iSRf8w7PkmHokixhUMfxID3xb8DXoVcpBdse+HO7hGxgF2z6P
	 wB2YYSDqr6+suTwpLYRr5oN3TcNIOrFnTWrdbKwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41702F8025C;
	Fri, 18 Feb 2022 15:54:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96F69F800FF; Fri, 18 Feb 2022 15:54:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BE01F800FF
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 15:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BE01F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="J+5IrzL1"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BDAD81F46B85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645196052;
 bh=waAoYQrd/zon1ObYSebR32rz8jo/+xh5mii/0mQIta0=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=J+5IrzL1aUstLqU1jHWBQ5y184NmlTZ1BA8PdukNZ1FcXWUD9gFtXQDbbh9hfmF7u
 XxavwG7XoNIZ/APJ3iwjJt2CEguvvFNPMJ3sLk3pv+0qQAPXSmMvULlrQXg3SO4gbo
 3Z/4jfHGHpKS8E1Fprko/SPC3zn8RurvHt5ukJ4JRaSQstIYUbnPtnk1caRtn/Z6j3
 mGRmknFUMigs7RnN/+87mHydSLVl3zdzY9lMnJ3ZbVNv9ze63b9spIfQWUoqKZIKYn
 dDJA5v4hjnLwnnBTW87vYzingVYERkjLoNe8JLafl1IJCK7JkVQZiXiUUQblhX00/T
 +J+n0x5OarDQg==
Message-ID: <b22976ee-6426-cabf-f153-fbe093611e97@collabora.com>
Date: Fri, 18 Feb 2022 15:54:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [v2 01/17] ASoC: mediatek: mt6366: add codec driver
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-2-jiaxin.yu@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220217134205.15400-2-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, aaronyu@google.com,
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

Il 17/02/22 14:41, Jiaxin Yu ha scritto:
> Mt6366 is a new version of mt6358, and they are same about audio part.
> So we can reuse the driver of mt6358.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Hello Jiaxin,
I'm sorry but this commit makes very little sense.

If you want to advertise MT6366 support, please write a note and/or
a new compatible string inside of the mt6358 driver (and dt-bindings),
then, please drop this commit.


> ---
>   sound/soc/codecs/Kconfig  | 8 ++++++++
>   sound/soc/codecs/Makefile | 1 +
>   2 files changed, 9 insertions(+)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 8fa24783ce01..6631094678f5 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -132,6 +132,7 @@ config SND_SOC_ALL_CODECS
>   	imply SND_SOC_MT6351
>   	imply SND_SOC_MT6358
>   	imply SND_SOC_MT6359
> +	imply SND_SOC_MT6366
>   	imply SND_SOC_MT6660
>   	imply SND_SOC_NAU8315
>   	imply SND_SOC_NAU8540
> @@ -1888,6 +1889,13 @@ config SND_SOC_MT6359_ACCDET
>   	  for ASoC codec soc-jack detection mechanism.
>   	  Select N if you don't have jack on board.
>   
> +config SND_SOC_MT6366
> +	tristate "MediaTek MT6366 Codec"
> +	depends on MTK_PMIC_WRAP
> +	help
> +	  Enable support for the platform which uses MT6366 as
> +	  external codec device.
> +
>   config SND_SOC_MT6660
>   	tristate "Mediatek MT6660 Speaker Amplifier"
>   	depends on I2C
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index 42d00aa4ee46..1279684feaf0 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -465,6 +465,7 @@ obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-mt6351.o
>   obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
>   obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
>   obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
> +obj-$(CONFIG_SND_SOC_MT6366)	+= snd-soc-mt6358.o
>   obj-$(CONFIG_SND_SOC_MT6660)	+= snd-soc-mt6660.o
>   obj-$(CONFIG_SND_SOC_NAU8315)   += snd-soc-nau8315.o
>   obj-$(CONFIG_SND_SOC_NAU8540)   += snd-soc-nau8540.o


