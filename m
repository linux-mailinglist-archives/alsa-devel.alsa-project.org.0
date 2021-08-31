Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3282A3FC0F3
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Aug 2021 04:59:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACBC61736;
	Tue, 31 Aug 2021 04:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACBC61736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630378769;
	bh=Z14Qi8SHVgfiDWBUFzxIcbQXIF1ZoETaRiQ51tRlyeM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mtoTurY2ABlojp2yD5orU6RJ7D+jovMmZL45iWCdjBLgIsLvhe/Z3dZrzy0mZ0ETS
	 U23Xduwet25hwhxeQBgRbZFFjPM/4tBm9LjtBvtSkK3qIIBz5GMUW2QBZpDAFNS8iz
	 bz9b/XjlecPutuHSLnL/wzQuWjbSfOQUOgDRL0Z8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D7F4F80269;
	Tue, 31 Aug 2021 04:58:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32DCDF8025B; Tue, 31 Aug 2021 04:58:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7AECF80127
 for <alsa-devel@alsa-project.org>; Tue, 31 Aug 2021 04:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7AECF80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="vGqMtn6Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=6bWlZrjczUiP7EZOqide7LZDeaMc6AyGD2CmjTuWKWY=; b=vGqMtn6YJ7xkPoqIo6XDG75UYF
 jNnCxOkBlk3zRUx9esaU2FbGYJ4iMvQphHkgoNIFMohCar2nZ51uO8LLDS0IPR3e+je1m5k7hc2Z/
 xzkVmLblKIX5gv0KG8FazKFvNz9SE8FOKAovUv2gzVhr29CEJG08LAZ0F7zK/CZwYrOwFNy0Wa7C3
 Go8Pbcjs4iM2x4qE9FFesTuLkMlx1L9nlEroO7GN6N0gddid0OEe3CmBh6U737C/qWZNLDGCN61Lc
 QyJY6TvkusHCYgeTnw1eEsg/fgDsIESb6bOo3SqsFABhehond4c2IgDhEqpxZFyfwo+ykQq7kOHge
 6CAua5Dg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKtyC-0011vi-EV; Tue, 31 Aug 2021 02:57:52 +0000
Subject: Re: [PATCH] ASoC: mediatek: mt8195: add MTK_PMIC_WRAP dependency
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 matthias.bgg@gmail.com
References: <20210831021303.5230-1-trevor.wu@mediatek.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1630c5bd-7f9a-ef63-0476-74c6077adb7f@infradead.org>
Date: Mon, 30 Aug 2021 19:57:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831021303.5230-1-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 8/30/21 7:13 PM, Trevor Wu wrote:
> randconfig builds show the warning below,
> 
> WARNING: unmet direct dependencies detected for SND_SOC_MT6359
>     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MTK_PMIC_WRAP [=n]
>     Selected by [y]:
>     - SND_SOC_MT8195_MT6359_RT1019_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8195 [=y]
> 
> Add a dependency to avoid it.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.


> ---
>   sound/soc/mediatek/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index cf567a89f421..f6bf0f9c91e3 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -197,7 +197,7 @@ config SND_SOC_MT8195
>   config SND_SOC_MT8195_MT6359_RT1019_RT5682
>   	tristate "ASoC Audio driver for MT8195 with MT6359 RT1019 RT5682 codec"
>   	depends on I2C
> -	depends on SND_SOC_MT8195
> +	depends on SND_SOC_MT8195 && MTK_PMIC_WRAP
>   	select SND_SOC_MT6359
>   	select SND_SOC_RT1015P
>   	select SND_SOC_RT5682_I2C
> 


-- 
~Randy

