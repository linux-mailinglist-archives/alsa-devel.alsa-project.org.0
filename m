Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2313746CA9
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 11:02:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 366377F1;
	Tue,  4 Jul 2023 11:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 366377F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688461355;
	bh=Sc7fq+rTOlTB0mP3kaMF9Dy8NIoMJX8FCQ4muEAYp6A=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=odB51y8o15G7Wi/rMTrcTF98/siFBY8OHrU4suQ5n+lycIGxgT0pBv3lb5J62kZ2O
	 NQwe46HkvvXbM5E/NppVJ7diDHwhN5WFgMNQmR+C8QoSl/oF/M/wo98S/yfJThwq+y
	 aBwg6igz4G+Y1+RmuutjteKXSf1mjijooJA5i4MI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 514E5F8053B; Tue,  4 Jul 2023 11:01:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8525F80124;
	Tue,  4 Jul 2023 11:01:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50B9AF80125; Tue,  4 Jul 2023 11:01:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3446EF80104
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 11:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3446EF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=O2D7hTO3
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E5D856606ED1;
	Tue,  4 Jul 2023 10:01:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688461272;
	bh=Sc7fq+rTOlTB0mP3kaMF9Dy8NIoMJX8FCQ4muEAYp6A=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=O2D7hTO3dCooM7TV2L607b3CAeHCPy9CXrnmemtTqdcNVqW3OaHCRHR7Xei0SA5X1
	 vR/6dkqKCAqnF1iRFd2yFrNM+f0POcDBln/YzdOD1ymssEJMSXIcUgLELMu/sLZEeY
	 n4zoBbPJpqXb6euNRgMglQZzpvMxg21TtOct7VM2CnY94lp7H+Vbob7KG1rg1EGRpG
	 9WfDXiRGDAc56LsxFAjplAI1ZXwOXwvFq38TS1FF5ClTKSIRaiwKJl2ftQ2qvmPGW6
	 oYmxqDzfh34SUJECqwaNwfc5Bgat0skEr9UrvPg6b38fUwaS3HauJbn4ExwnCMPnkG
	 l0WxMXD+1tSRg==
Message-ID: <bb13702f-801d-57f4-64d1-077dd977d43b@collabora.com>
Date: Tue, 4 Jul 2023 11:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/7] ASoC: mediatek: mt7986: add common header
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
 <20230626023501.11120-2-maso.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230626023501.11120-2-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3LUCCCZZVXIUGZR4WCQJ5EUPWFQ2W7BO
X-Message-ID-Hash: 3LUCCCZZVXIUGZR4WCQJ5EUPWFQ2W7BO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3LUCCCZZVXIUGZR4WCQJ5EUPWFQ2W7BO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 26/06/23 04:34, Maso Huang ha scritto:
> Add header files for register definition and structure.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>   sound/soc/mediatek/mt7986/mt7986-afe-common.h |  51 +++++
>   sound/soc/mediatek/mt7986/mt7986-reg.h        | 206 ++++++++++++++++++
>   2 files changed, 257 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-common.h
>   create mode 100644 sound/soc/mediatek/mt7986/mt7986-reg.h
> 
> diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-common.h b/sound/soc/mediatek/mt7986/mt7986-afe-common.h
> new file mode 100644
> index 000000000000..646e1be4fdce
> --- /dev/null
> +++ b/sound/soc/mediatek/mt7986/mt7986-afe-common.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mt7986-afe-common.h  --  MediaTek 7986 audio driver definitions
> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Vic Wu <vic.wu@mediatek.com>
> + *         Maso Huang <maso.huang@mediatek.com>
> + */
> +
> +#ifndef _MT_7986_AFE_COMMON_H_
> +#define _MT_7986_AFE_COMMON_H_
> +
> +#include <sound/soc.h>
> +#include <linux/clk.h>
> +#include <linux/list.h>
> +#include <linux/regmap.h>
> +#include "../common/mtk-base-afe.h"
> +
> +enum {
> +	MT7986_MEMIF_DL1,
> +	MT7986_MEMIF_VUL12,
> +	MT7986_MEMIF_NUM,
> +	MT7986_DAI_ETDM = MT7986_MEMIF_NUM,
> +	MT7986_DAI_NUM,
> +};
> +
> +enum {
> +	MT7986_IRQ_0,
> +	MT7986_IRQ_1,
> +	MT7986_IRQ_2,
> +	MT7986_IRQ_NUM,
> +};
> +
> +struct clk;
> +
> +struct mt7986_afe_private {
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +
> +	int pm_runtime_bypass_reg_ctl;
> +
> +	/* dai */
> +	void *dai_priv[MT7986_DAI_NUM];
> +};
> +
> +unsigned int mt7986_afe_rate_transform(struct device *dev,
> +				       unsigned int rate);
> +
> +/* dai register */
> +int mt7986_dai_etdm_register(struct mtk_base_afe *afe);
> +#endif
> diff --git a/sound/soc/mediatek/mt7986/mt7986-reg.h b/sound/soc/mediatek/mt7986/mt7986-reg.h
> new file mode 100644
> index 000000000000..6433cdf3da92
> --- /dev/null
> +++ b/sound/soc/mediatek/mt7986/mt7986-reg.h
> @@ -0,0 +1,206 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mt7986-reg.h  --  MediaTek 7986 audio driver reg definition
> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Vic Wu <vic.wu@mediatek.com>
> + *         Maso Huang <maso.huang@mediatek.com>
> + */
> +
> +#ifndef _MT7986_REG_H_
> +#define _MT7986_REG_H_

..snip..

> +/* ETDM_OUT5_CON4 */
> +#define OUT_RELATCH(x)                  ((x) << 24)
> +#define OUT_RELATCH_SFT                 24
> +#define OUT_RELATCH_MASK                GENMASK(28, 24)
> +#define OUT_CLK_SRC(x)                  ((x) << 6)
> +#define OUT_CLK_SRC_SFT                 6
> +#define OUT_CLK_SRC_MASK                GENMASK(8, 6)
> +#define OUT_SEL_FS(x)                   ((x) << 0)

A number shifted by zero bits is equal to itself, so, this statement doesn't
make sense. I understand why you want a OUT_SEL_FS(x) definition though, so
you could do it like:

#define OUT_SEL_FS(x)			(x)

After which,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
Angelo
