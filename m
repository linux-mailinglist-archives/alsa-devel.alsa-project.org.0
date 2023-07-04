Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB8E746C70
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 10:54:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C70D1D9;
	Tue,  4 Jul 2023 10:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C70D1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688460868;
	bh=/4dyF8HZFtyp5Y+HhxEP3bwZNJAwUnFLGbeU+g9n2hg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VBzd2FgKxrlGMwFeqicMzxW44NlF8MflBJ+irMFReipjsPyXy47GBKHaWyE3gaTNP
	 +7Ur/XuoiC/yvsb40Ep32u+fgvZgYiukJ71X16twEPFoVOv5cVQ0kxAv3ecunWzatN
	 +SMlml5uYVDyxR4h3VGCTY84kiXQzmv11u/hU2G4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8040CF80124; Tue,  4 Jul 2023 10:53:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1972DF800E4;
	Tue,  4 Jul 2023 10:53:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D87EF80125; Tue,  4 Jul 2023 10:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8815EF80104
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 10:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8815EF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=W3r6fyfF
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 26AFE6606ED1;
	Tue,  4 Jul 2023 09:53:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688460804;
	bh=/4dyF8HZFtyp5Y+HhxEP3bwZNJAwUnFLGbeU+g9n2hg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=W3r6fyfFCV1d9e3fbQqWrqlaliK8RIJShsA3JhU6t4EZyN4iWkAeaGI3c56yX1tnH
	 AIiII36iLobpWce1aQFoKmrM9lYwC30dMdNIaTPaW1W36djA7K7sMC0dGJ7po+J+Uk
	 Q+0G44HIScbow+zRuk+KM1HPRgCeaOEiDzSOPZzOJpKo3zHQ4SFM1heRe3bnfSSu5y
	 xmXWRoJsHcw6cSG+wAQSznNP/ZrZq5aSDyj43q5ijt5vopAk2Mcl8Uva0BeeZ1F1rP
	 QI6WkjLbZKkcbgMmuKEBsqyhifcfmK+wc4uhDbV2Nblw8fX8J+67YgJVCoCFbd69t/
	 WsCfOWSGdf/Mg==
Message-ID: <ef7b62ab-b1f3-b687-7561-1ab65282ba23@collabora.com>
Date: Tue, 4 Jul 2023 10:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/7] ASoC: mediatek: mt7986: support audio clock
 control
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Ren Zhijie <renzhijie2@huawei.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230626023501.11120-1-maso.huang@mediatek.com>
 <20230626023501.11120-3-maso.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230626023501.11120-3-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3MFY6WZERW5IB2W3UQKM45OIXFT4LT2W
X-Message-ID-Hash: 3MFY6WZERW5IB2W3UQKM45OIXFT4LT2W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MFY6WZERW5IB2W3UQKM45OIXFT4LT2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 26/06/23 04:34, Maso Huang ha scritto:
> Add audio clock wrapper and audio tuner control.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>   sound/soc/mediatek/mt7986/mt7986-afe-clk.c | 75 ++++++++++++++++++++++
>   sound/soc/mediatek/mt7986/mt7986-afe-clk.h | 18 ++++++
>   2 files changed, 93 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-clk.c
>   create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-clk.h
> 
> diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-clk.c b/sound/soc/mediatek/mt7986/mt7986-afe-clk.c
> new file mode 100644
> index 000000000000..a8b5fae05673
> --- /dev/null
> +++ b/sound/soc/mediatek/mt7986/mt7986-afe-clk.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * mt7986-afe-clk.c  --  MediaTek 7986 afe clock ctrl
> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Vic Wu <vic.wu@mediatek.com>
> + *         Maso Huang <maso.huang@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +
> +#include "mt7986-afe-common.h"
> +#include "mt7986-afe-clk.h"
> +#include "mt7986-reg.h"
> +
> +enum {
> +	CK_INFRA_AUD_BUS_CK = 0,
> +	CK_INFRA_AUD_26M_CK,
> +	CK_INFRA_AUD_L_CK,
> +	CK_INFRA_AUD_AUD_CK,
> +	CK_INFRA_AUD_EG2_CK,
> +	CLK_NUM
> +};
> +
> +static const char *aud_clks[CLK_NUM] = {
> +	[CK_INFRA_AUD_BUS_CK] = "aud_bus_ck",
> +	[CK_INFRA_AUD_26M_CK] = "aud_26m_ck",
> +	[CK_INFRA_AUD_L_CK] = "aud_l_ck",
> +	[CK_INFRA_AUD_AUD_CK] = "aud_aud_ck",
> +	[CK_INFRA_AUD_EG2_CK] = "aud_eg2_ck",
> +};
> +
> +int mt7986_init_clock(struct mtk_base_afe *afe)
> +{
> +	struct mt7986_afe_private *afe_priv = afe->platform_priv;
> +	int ret, i;
> +
> +	afe_priv->clks = devm_kcalloc(afe->dev, CLK_NUM,
> +				sizeof(*afe_priv->clks), GFP_KERNEL);
> +	if (!afe_priv->clks)
> +		return -ENOMEM;
> +	afe_priv->num_clks = CLK_NUM;
> +
> +	for (i = 0; i < afe_priv->num_clks; i++)
> +		afe_priv->clks[i].id = aud_clks[i];
> +
> +	ret = devm_clk_bulk_get(afe->dev, afe_priv->num_clks, afe_priv->clks);
> +	if (ret)
> +		return dev_err_probe(afe->dev, ret, "Failed to get clocks\n");
> +
> +	return 0;
> +}
> +
> +int mt7986_afe_enable_clock(struct mtk_base_afe *afe)
> +{
> +	struct mt7986_afe_private *afe_priv = afe->platform_priv;
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(afe_priv->num_clks, afe_priv->clks);

You don't need a wrapper function for just a single clk_bulk_prepare_enable() call.

> +	if (ret)
> +		return dev_err_probe(afe->dev, ret, "Failed to enable clocks\n");
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mt7986_afe_enable_clock);
> +
> +int mt7986_afe_disable_clock(struct mtk_base_afe *afe)
> +{
> +	struct mt7986_afe_private *afe_priv = afe->platform_priv;
> +
> +	clk_bulk_disable_unprepare(afe_priv->num_clks, afe_priv->clks);

Same for this one....

... which means that this file will have only mt7986_init_clock() so, ultimately,
you don't need a mt7986-afe-clk.c file at all.
Please merge this logic into mt7986-afe-pcm.c, which is also the only user of it.

Thanks,
Angelo

