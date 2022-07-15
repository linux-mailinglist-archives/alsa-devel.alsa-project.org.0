Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EC3575D77
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 10:31:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 471D218BC;
	Fri, 15 Jul 2022 10:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 471D218BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657873881;
	bh=yV+EX0IUwg0zIL0JwslSh38WgL8nzrwNzm1NDjXhZVA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tMouBqKArfoWbiWd5HfB59pZyaT5r0JVfdhkdbM+tGpyu7DsGpCEyJPF3CTJSFZzJ
	 4Tfk/N3l/7wdPDe1s72wGgT+HnpLOh3v+09/hpEtn7gf7YagSKnHXxEWPCp8E9CeDw
	 PV6dR06yWEqXBc83+mxnY99Bh5GakuBYyD0gzS30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6756F80212;
	Fri, 15 Jul 2022 10:30:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 835F3F8015B; Fri, 15 Jul 2022 10:30:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49BF4F800AA
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 10:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49BF4F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="NPw6pWWq"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6A0B06601A3F;
 Fri, 15 Jul 2022 09:30:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657873809;
 bh=yV+EX0IUwg0zIL0JwslSh38WgL8nzrwNzm1NDjXhZVA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NPw6pWWqRz6rvL3VqqcHhHNCjH4Y9tl2A+101/CFbnBZn4lp3svR7iW7ikOlN8wJz
 4mZSeZKYmiWE1+KnbpNAMSC8l61ztZCbtZZ8b9uDvS2WYv3lFngFOyOjop+aagY6W9
 +hSlgDyJD2d51NXLFw8Ows4j0ogBE8OUsW3N8bj+ojVMugDVvB5+2fnBHZxjfebGXF
 Gyzvzv9lWns3jG8KgVnh81F7Mx3hc/lvoeOBLRRwUdLoS8+d4IzbfEW9xDa4A1qiW/
 h2GYz+eKljD3NXBEYXIkEojVqe0Bm6YnKi0PH9f0UMgOrQcGWD8hSmyOBtNeovWMqn
 3TRH7sDDZFj+g==
Message-ID: <b2dc196f-19d2-4d9a-4feb-ec335249aaad@collabora.com>
Date: Fri, 15 Jul 2022 10:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: mediatek: mt8195: extract SOF common code
Content-Language: en-US
To: Chunxu Li <chunxu.li@mediatek.com>, lgirdwood@gmail.com, broonie@kernel.org
References: <20220715034223.3897-1-chunxu.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220715034223.3897-1-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

Il 15/07/22 05:42, Chunxu Li ha scritto:
> The functions related to SOF can be reused in different machine drivers,
> such as mt8195 or mt8186, so extract the common code to avoid duplication.
> 
> Set mtk_soc_card_data which include machine private data and SOF private
> data as card drvdata, then the difference between machine private can be
> ignored such as mt8195_mt6359_priv or mt8186_mt6366_priv, at the same
> time the SOF related code can be reused in different machine drivers.
> 
> Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
> ---
>   sound/soc/mediatek/common/Makefile            |   2 +-
>   .../soc/mediatek/common/mtk-dsp-sof-common.c  | 196 +++++++++++++++
>   .../soc/mediatek/common/mtk-dsp-sof-common.h  |  35 +++
>   sound/soc/mediatek/common/mtk-soc-card.h      |  17 ++
>   sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 233 ++++--------------
>   5 files changed, 300 insertions(+), 183 deletions(-)
>   create mode 100644 sound/soc/mediatek/common/mtk-dsp-sof-common.c
>   create mode 100644 sound/soc/mediatek/common/mtk-dsp-sof-common.h
>   create mode 100644 sound/soc/mediatek/common/mtk-soc-card.h
> 
> diff --git a/sound/soc/mediatek/common/Makefile b/sound/soc/mediatek/common/Makefile
> index acbe01e9e928..576deb7f8cce 100644
> --- a/sound/soc/mediatek/common/Makefile
> +++ b/sound/soc/mediatek/common/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # platform driver
> -snd-soc-mtk-common-objs := mtk-afe-platform-driver.o mtk-afe-fe-dai.o
> +snd-soc-mtk-common-objs := mtk-afe-platform-driver.o mtk-afe-fe-dai.o mtk-dsp-sof-common.o
>   obj-$(CONFIG_SND_SOC_MEDIATEK) += snd-soc-mtk-common.o
>   
>   obj-$(CONFIG_SND_SOC_MTK_BTCVSD) += mtk-btcvsd.o
> diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.c b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
> new file mode 100644
> index 000000000000..1098694f4f36
> --- /dev/null
> +++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * mtk-dsp-sof-common.c  --  MediaTek dsp sof common ctrl
> + *
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Chunxu Li <chunxu.li@mediatek.com>
> + */
> +
> +#include <mtk-dsp-sof-common.h>
> +#include <mtk-soc-card.h>

Did you mean.....

#include "mtk-dsp-sof-common.h"
#include "mtk-soc-card.h"


> +
> +/* fixup the BE DAI link to match any values from topology */
> +int mtk_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
> +			   struct snd_pcm_hw_params *params)
> +{

..snip..

> diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.h b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
> new file mode 100644
> index 000000000000..f02ba2ce3718
> --- /dev/null
> +++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mtk-dsp-sof-common.h  --  MediaTek dsp sof common definition
> + *
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Chunxu Li <chunxu.li@mediatek.com>
> + */
> +
> +#ifndef _MTK_DSP_SOF_COMMON_H_
> +#define _MTK_DSP_SOF_COMMON_H_
> +
> +#include <sound/soc.h>

Leave a blank line here.

> +struct sof_conn_stream {
> +	const char *normal_link;
> +	const char *sof_link;
> +	const char *sof_dma;
> +	int stream_dir;
> +};
> +

Thanks,
Angelo
