Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 724CA4D4CC1
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 16:26:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EFAB1FE;
	Thu, 10 Mar 2022 16:25:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EFAB1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646925984;
	bh=G44TKaXJ2702MH14xQ2xJ5CzDZDhej3DrvU8W8AmQpM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pBR8g3KIgPzfKyy1RmatJInNBphmnYw9vQlMHMDYFzwNfcAR0Yte3R9LO/P41AL7G
	 /pQgSNEENdch2s14kniIZ8PN2Gu/dqklncMBwyDVkxmwT0r5Arih0KRABD8tXcVVVj
	 IJbQOX9Vcv3Hd+kINFdNt2Etm3XUfltyEsaxZu1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D0ADF8013C;
	Thu, 10 Mar 2022 16:25:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35B0DF80137; Thu, 10 Mar 2022 16:25:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B2CBF800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 16:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B2CBF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="SXhuKhFE"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6B0911F45A2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646925907;
 bh=G44TKaXJ2702MH14xQ2xJ5CzDZDhej3DrvU8W8AmQpM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SXhuKhFEp8Pn5kLpJ9uE75VypUMiWbTDJVSbQOK8PeLRuwMErkdO4jbich+dzPauC
 qCJWCscyap4JMwtArGtY5HzKtdvHxmWP7UbBPZXUPeHdFbn2BmwfQ33I7MwQG8brbd
 fYowneCd2ko50BtGZSUUzuRyJ/wegpIExSkuV6lgm16tPDRBenjMZEc9g8r/MZCpiT
 JZBtRYcs3DiM/nITjUjJB6X2evoUXrnf21ef/sN5ap4/j6gW50i8UJIkGflgdbeBHL
 docIDtmUfdlSE6vs5URQcIca6NSmP9Jcr8vaydjsb9YA3GvDJgCzFyl9ueHgXddWqI
 r4s8PlBH5D3EQ==
Message-ID: <ead686bc-06ae-c572-999a-af22c183550f@collabora.com>
Date: Thu, 10 Mar 2022 16:25:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/5] ASoC: mediatek: mt8195: add reset controller
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220308072435.22460-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 yc.hung@mediatek.com, aaronyu@google.com, linux-arm-kernel@lists.infradead.org
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

Il 08/03/22 08:24, Trevor Wu ha scritto:
> Audio hardware is possibly used in the firmware stage, so resetting audio
> hardware before regcache records default register values is required.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> index 550636500949..72b2c6d629b9 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> @@ -16,6 +16,7 @@
>   #include <linux/of_platform.h>
>   #include <linux/of_reserved_mem.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>   #include "mt8195-afe-common.h"
>   #include "mt8195-afe-clk.h"
>   #include "mt8195-reg.h"
> @@ -3056,6 +3057,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	struct mtk_base_afe *afe;
>   	struct mt8195_afe_private *afe_priv;
>   	struct device *dev = &pdev->dev;
> +	struct reset_control *rstc;
>   	int i, irq_id, ret;
>   	struct snd_soc_component *component;
>   
> @@ -3092,6 +3094,20 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	/* reset controller to reset audio regs before regmap cache */
> +	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
> +	if (IS_ERR(rstc)) {
> +		ret = PTR_ERR(rstc);
> +		dev_err(dev, "could not get audiosys reset:%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = reset_control_reset(rstc);
> +	if (ret) {
> +		dev_err(dev, "failed to trigger audio reset:%d\n", ret);
> +		return ret;
> +	}
> +
>   	spin_lock_init(&afe_priv->afe_ctrl_lock);
>   
>   	mutex_init(&afe->irq_alloc_lock);



