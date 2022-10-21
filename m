Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D35A6072AD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 10:43:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89F86327C;
	Fri, 21 Oct 2022 10:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89F86327C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666341791;
	bh=ixtnbYZsDUAjtbOO7dcijDfW674zD9cWoD0xTEe/SQM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3mcUXdItbqxterGi8FSaeTH550GBTRynRfDlrhSUMvwrEgwLA73YBeluOFaIC0dx
	 dd8sv+sWWYnInzxJTnR7QLh0FTF9WsJo5JyPkoI9+HZc3CAdXGZXf+XztgD9O2YIj4
	 lZoX573J3owZaielRRhY7r7gqr7MaJXfRo1r3rtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91723F8053C;
	Fri, 21 Oct 2022 10:41:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E32F9F80256; Fri, 21 Oct 2022 10:41:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75B2DF80256
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 10:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75B2DF80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="kc/Lz34l"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0650C6602532;
 Fri, 21 Oct 2022 09:41:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666341684;
 bh=ixtnbYZsDUAjtbOO7dcijDfW674zD9cWoD0xTEe/SQM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kc/Lz34lDvuXmaLXjA3lWGJ1XXjh4KahLHgw6Qg/eLQirT6/VFA4+qENEKQ7CzHy+
 DmXe8REyjQXW/J/shRxV7ntpiMvf40yTWmDvhOGP49l07EVv1V9xVbD5CtvC4Fr+8+
 j+SY7b+/ASlzPr5OeyBZQnj8sPNUS9MSJi01jQ9e/w16v8iwmh7qPFcxuuBmmW6rH6
 Dez4lLPN8acWboG/QPuQEWT6bdT7nf+CLJqeMTR3bXacgU/Ce6+GVT5g82xjebCRwM
 Ko7r8wwIxC82TrWt2nu1N+IdE5ecKXmGIrF9h8gWae4RRf5v2w0VmUsW+3DqQtGvFH
 eiCJl0ACY4RFw==
Message-ID: <de66f0e3-7694-7315-c896-9211259a1a17@collabora.com>
Date: Fri, 21 Oct 2022 10:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 03/12] ASoC: mediatek: mt8188: support audsys clock
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de
References: <20221021082719.18325-1-trevor.wu@mediatek.com>
 <20221021082719.18325-4-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221021082719.18325-4-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

Il 21/10/22 10:27, Trevor Wu ha scritto:
> Add mt8188 audio cg clock control. Audio clock gates are registered to CCF
> for reference count and clock parent management.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-audsys-clk.c | 206 ++++++++++++++++++
>   sound/soc/mediatek/mt8188/mt8188-audsys-clk.h |  15 ++
>   .../soc/mediatek/mt8188/mt8188-audsys-clkid.h |  83 +++++++
>   3 files changed, 304 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
>   create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
>   create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> new file mode 100644
> index 000000000000..1f294231d4c2
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * mt8188-audsys-clk.c  --  MediaTek 8188 audsys clock control
> + *
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Chun-Chia Chiu <chun-chia.chiu@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +#include "mt8188-afe-common.h"
> +#include "mt8188-audsys-clk.h"
> +#include "mt8188-audsys-clkid.h"
> +#include "mt8188-reg.h"
> +
> +struct afe_gate {
> +	int id;
> +	const char *name;
> +	const char *parent_name;
> +	int reg;
> +	u8 bit;
> +	const struct clk_ops *ops;
> +	unsigned long flags;
> +	u8 cg_flags;
> +};
> +
> +#define GATE_AFE_FLAGS(_id, _name, _parent, _reg, _bit, _flags, _cgflags) {\
> +		.id = _id,					\
> +		.name = _name,					\
> +		.parent_name = _parent,				\
> +		.reg = _reg,					\
> +		.bit = _bit,					\
> +		.flags = _flags,				\
> +		.cg_flags = _cgflags,				\
> +	}
> +
> +#define GATE_AFE(_id, _name, _parent, _reg, _bit)		\
> +	GATE_AFE_FLAGS(_id, _name, _parent, _reg, _bit,		\
> +		       CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, CLK_GATE_SET_TO_DISABLE)

Can you please explain what's the reason for CLK_IGNORE_UNUSED here?
Maybe we can solve some issue that you're facing in a cleaner way.

Regards,
Angelo

