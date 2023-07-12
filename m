Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 932B1750973
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 15:18:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9452A820;
	Wed, 12 Jul 2023 15:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9452A820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689167896;
	bh=3pQppWVt3H+dmm96X12NXydkwFFAb723GVzqH+1F+V4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LuLjqRB1MmxSaooGy9pL94yaiY2r80z6uOqk6pUt+rP+0AyFBXLHnkUyVYX1N+ZUm
	 Pg3rfFiCr0DDjBVc6Wq8I62prBKM1EKlw3CMs7YkLzfvk5wVmpYw6DEOipBtis4aIL
	 IAV45YlPRCmiMiVJ44beGB/wHnJkiLY8oFyUw9dA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6051F80607; Wed, 12 Jul 2023 15:14:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23C23F80603;
	Wed, 12 Jul 2023 15:14:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60B74F80249; Wed, 12 Jul 2023 14:40:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98127F80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 14:40:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98127F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=w9wh4Pkr
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-315adee6ac8so542409f8f.2
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jul 2023 05:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689165613;
 x=1691757613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SkNQv7geS5CR2LiJ7vpq5fz0PNWmI57+KWeY+aP5fjo=;
        b=w9wh4Pkr8rOHj8Cbmzkuimk9nKuqBy9JUTg8kjwlj8n8OPSxsfutY+Kk8wexoYVZX+
         5xTPaDLVpb0WZ1xVXeOGb5YPK0rqIiTmWXMM+XytwPPKhxGylqcDYQxJnXSyIpgqBgDZ
         ZlC7q6y7wxiej8SzCDfSNI2BXCYXpQaTQ3lTCUT9hSlWjyY5RbocTNvWbnF8GZT3eY0U
         /eyMserg5zIMY1c+JA19IF6abF6bzOYSBc/fPK/AeOojgY/sKEhdFQ6jL+l7TkJgJCIh
         2xG/fV/JRFf6gwsisfocp8jKlghZoi7JjGzlH/dRcdCo8U9wvoJOnlsujx7JfLc4BxN6
         YDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689165613; x=1691757613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkNQv7geS5CR2LiJ7vpq5fz0PNWmI57+KWeY+aP5fjo=;
        b=FzVY3xx297fvVlZYi1Hrju3ZeivWavCVxc3bcAXVbPf89plvtTY0PdWGsEibf9/RY3
         FDfwBb1yHJiZlj7/Kmj6nwB3nOy3GbQ1+fC65lECbFX2k3QP2WrxninvDwD2iE9xO7cQ
         261XXK6CG7dJxjfwwBsPUCxOiQg0eNYCHR27ybIl3RLnMrTAPR7cUWg2JaMK/nHwvOkX
         SuVpVAk0RpIGf6atmcDhEz2Aqti9u3/IYkPV7v/ipzXr2bsI4xdnwrRY3xiuFvLkFZvb
         4zxeXMPf0/iGz4mr376iv5KLcu7U02abJnV+/NW9wd1Dqw5TYaYZ90o94205BDuYKxYG
         gaGA==
X-Gm-Message-State: ABy/qLa+uefjasmWmf5ubcKmorDsDnuPZPjXhxE9CORLVZhj5VDayzyq
	gtfr+Ctw8CuGW0kMkjBHWRtg8A==
X-Google-Smtp-Source: 
 APBJJlF5yLpkbdjZuR9UBaY6jqLSbZs8oxILlpMjHaH5n0w7cV1ebVwGScR6HD9FlErXpx3JbkAshg==
X-Received: by 2002:adf:d0c9:0:b0:314:1ce9:3c86 with SMTP id
 z9-20020adfd0c9000000b003141ce93c86mr16299116wrh.0.1689165613366;
        Wed, 12 Jul 2023 05:40:13 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003fb40ec9475sm4978175wme.11.2023.07.12.05.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 05:40:12 -0700 (PDT)
Message-ID: <fab21c8b-13d7-1046-6b13-51a3d6684a2f@baylibre.com>
Date: Wed, 12 Jul 2023 14:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RESEND 1/2] ASoC: mediatek: mt8188: add memory-region support
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230712070821.23971-1-trevor.wu@mediatek.com>
 <20230712070821.23971-2-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230712070821.23971-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6HR2WCR3EJEJMWIPHVNTMBBUGPC2OUBU
X-Message-ID-Hash: 6HR2WCR3EJEJMWIPHVNTMBBUGPC2OUBU
X-Mailman-Approved-At: Wed, 12 Jul 2023 13:14:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6HR2WCR3EJEJMWIPHVNTMBBUGPC2OUBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/07/2023 09:08, Trevor Wu wrote:
> In certain projects, it is necessary to utilize the reserved memory
> region for audio dma. The patch takes into account the dts property
> 'memory-region', allowing for the specification of memory for afe memif
> through device tree.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> index 6a24b339444b..5e14655c5617 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> @@ -16,6 +16,7 @@
>   #include <linux/of.h>
>   #include <linux/of_address.h>
>   #include <linux/of_platform.h>
> +#include <linux/of_reserved_mem.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/soc/mediatek/infracfg.h>
>   #include <linux/reset.h>
> @@ -3193,11 +3194,15 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
>   {
>   	struct mtk_base_afe *afe;
>   	struct mt8188_afe_private *afe_priv;
> -	struct device *dev;
> +	struct device *dev = &pdev->dev;

I think that make sense to replace all "&pdev->dev" by "dev" in the next 
called functions:
- dma_set_mask_and_coherent
- devm_kzalloc
- devm_kzalloc

>   	struct reset_control *rstc;
>   	struct regmap *infra_ao;
>   	int i, irq_id, ret;
>   
> +	ret = of_reserved_mem_device_init(dev);
> +	if (ret)
> +		dev_dbg(dev, "failed to assign memory region: %d\n", ret);
> +
>   	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(33));
>   	if (ret)
>   		return ret;
> @@ -3213,7 +3218,6 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
>   
>   	afe_priv = afe->platform_priv;
>   	afe->dev = &pdev->dev;
> -	dev = afe->dev;
>   
>   	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(afe->base_addr))

-- 
Regards,
Alexandre
