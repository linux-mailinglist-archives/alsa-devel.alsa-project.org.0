Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 521B754630F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 12:03:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED90718EC;
	Fri, 10 Jun 2022 12:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED90718EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654855415;
	bh=dsiCCp9lnFOmS3obijt8p1edAXlox7FEodLqv3vHvrI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ijyNlQBzHt96haHl72mgi1SyLbmD7Zd6gpn+JiIoPlc8n3zgZZHEYUdv5jf5cj+FK
	 ZEsbcD1QtEY5WSPX5zuFML4mXvu9gu/xfShc9ZSYD5wM4kCS6V1KwDUS6Vm4NzNMPA
	 ioOAiq/6Pl7YynAGkcTufsOhD05IsojzmYfjNFmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF55AF80515;
	Fri, 10 Jun 2022 12:02:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3131EF804E7; Fri, 10 Jun 2022 12:02:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41B05F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 12:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41B05F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="AxXNVxBE"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 11AAB6601739;
 Fri, 10 Jun 2022 11:01:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654855316;
 bh=dsiCCp9lnFOmS3obijt8p1edAXlox7FEodLqv3vHvrI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AxXNVxBEp5VJxMcRieatCKA2EW2szeAAaQSKNFIYWXLs3xkgJSyCStafvGlTeoK1S
 60qyl/A4H0X8WG/V5ll8BuJKlAKrOrYXAauH7k6N1KBvpshZpFS+dD0n3XxmUpZ2id
 ErAn5N50Jy4ibtO88VjwuWC705RtWYIIXPIV4AJxhLYEVh3oNmEtD3jCiYDWpRDK24
 Djq9U+fG2wldu+YVUSJg6Jny7q8gVZpwRNA8iug+QoiSF4RNXevM3tf0jaCo2D1cjX
 krpFNdLFxNxVVmPM5JFKMdhCOifaXVpqTfHRhshMKU5bCDIYWbe7oYYXBF5LETJsiR
 6gQtGSyGCc9tA==
Message-ID: <d7934e1e-6a57-2c9a-76f7-42f0da180699@collabora.com>
Date: Fri, 10 Jun 2022 12:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 3/8] ASoC: mediatek: mt8186: add mt8186-mt6366 common
 driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
References: <20220610082724.29256-1-jiaxin.yu@mediatek.com>
 <20220610082724.29256-4-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220610082724.29256-4-jiaxin.yu@mediatek.com>
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

Il 10/06/22 10:27, Jiaxin Yu ha scritto:
> Add mt8186-mt6366 common driver for mt8186 series machine.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8186/Makefile            |  1 +
>   .../mediatek/mt8186/mt8186-mt6366-common.c    | 59 +++++++++++++++++++
>   .../mediatek/mt8186/mt8186-mt6366-common.h    | 17 ++++++
>   3 files changed, 77 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-common.h
> 

..snip..

> diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
> new file mode 100644
> index 000000000000..94e1128e8128
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// mt8186-mt6366-common.c
> +//	--  MT8186 MT6366 ALSA common driver
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> +//
> +#include <sound/soc.h>
> +
> +#include "../../codecs/mt6358.h"
> +#include "../common/mtk-afe-platform-driver.h"
> +#include "mt8186-afe-common.h"
> +#include "mt8186-mt6366-common.h"
> +
> +int mt8186_mt6366_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_component *cmpnt_afe =
> +		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
> +	struct snd_soc_component *cmpnt_codec =
> +		asoc_rtd_to_codec(rtd, 0)->component;
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
> +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> +	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
> +	int ret;
> +
> +	/* set mtkaif protocol */
> +	mt6358_set_mtkaif_protocol(cmpnt_codec,
> +				   MT6358_MTKAIF_PROTOCOL_1);
> +	afe_priv->mtkaif_protocol = MT6358_MTKAIF_PROTOCOL_1;
> +
> +	ret = snd_soc_dapm_sync(dapm);
> +	if (ret) {
> +		dev_info(rtd->dev, "failed to snd_soc_dapm_sync\n");

This should be a dev_err().

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mt8186_mt6366_init);
> +
> +int mt8186_mt6366_card_set_be_link(struct snd_soc_card *card,
> +				   struct snd_soc_dai_link *link,
> +				   struct device_node *node,
> +				   char *link_name)
> +{
> +	int ret;
> +
> +	if (node && strcmp(link->name, link_name) == 0) {
> +		ret = snd_soc_of_get_dai_link_codecs(card->dev, node, link);
> +		if (ret < 0) {
> +			dev_err_probe(card->dev, ret, "get dai link codecs fail\n");
> +			return ret;

You may at this point just 'return dev_err_probe(...)'.


Regards,
Angelo
