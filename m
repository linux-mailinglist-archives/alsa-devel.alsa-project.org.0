Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 175096480D0
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 11:19:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0CB02142;
	Fri,  9 Dec 2022 11:19:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0CB02142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670581190;
	bh=yeD/mr65IDz77j7/yP+XpHTcICMFlHLL0tlwfCE+1NU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=epn1/Pu8YIVFsvry6r1pmmUcjHT+5F91qlnUodyMupZ868IfYO75VtxT9veRlxmYj
	 NhMac8G4LhJOW6PNfcpTNcFgsV0tBi11Zd7dz8WrAWxobFe/csaJATdQ9DHuqcfB1c
	 DZDpfd2KV/aDpfZqoFVWuL9mHj4FOTUL59fUKb3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58875F800F8;
	Fri,  9 Dec 2022 11:18:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66B04F8024C; Fri,  9 Dec 2022 11:18:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EE5CF800F8
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 11:18:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EE5CF800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=i3pJ5Zl8
Received: by mail-lf1-x133.google.com with SMTP id d6so6280088lfs.10
 for <alsa-devel@alsa-project.org>; Fri, 09 Dec 2022 02:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x00HNX5290w6ocB8BzuOCSV57L/qluq8fXghF2f6Urk=;
 b=i3pJ5Zl8a1/s05t+pot30xPJdKFR8X7DbUHQqO2fWpR3NS7IV9xMH7yPs/PvXLeXj1
 YsliKZrWIZ9SHauCdh+2/SMnHGrvhA6Hes4DZesF9nM5hAR3JjyoWQlRX8l8H7Sctiza
 H1oS0rJMvlteo49XLIaiR+pCt8scMj7srITdJDpVyfITifbrTK/gvqpGZoMa9JOVTJvE
 MsYhaoNDvxe/O57eIcZV6GorlescZblOMkiDtCa3cyhCOs4UtA8DdGlxSwT2RDuKcO5v
 0ovORGCdPRLBmwJFViw5nZ6TLWcO5gaoTmR6EfdW22S2Y2UJ0Siww/THZdiuFh72msGx
 Hl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x00HNX5290w6ocB8BzuOCSV57L/qluq8fXghF2f6Urk=;
 b=i0ed74CUeSuraglPBJVk2gwhUOFqMZwxiPnm9WRXU5ubnpwwtlJSFEWZrJbEvzhPDu
 sQbBlWM+I5XjisyU5rF++Sf4eYUmX2Euteprz8uSX5CU1JTo+/b1uYkOSri/K8SM59iz
 snRIAiW70ghBJ/n05KK65FJTdG697aVGbXQ2V/q0toIMxirsgB0d7EfOK3HD0WAC0ka/
 4Z/DWyIkyG0eyovoYsCm89OB/JoMhLYNiuBZU6Fx8ehfC+95X7MIaL/lku5hmajTRrKC
 NdQBMoIukf5CWOy3kBuWBOjl0eHOOefUhSBtvvFjH6jVgTk1WdLQ+/Ub6T0FI2VfG6SZ
 g+Hg==
X-Gm-Message-State: ANoB5plsejH8hnMMUN+p7gQJ1LbYji2kzoTqhtro80bngd3fP0I8gpfU
 gl4PXSURYbVcqoStuklHsZYb6A==
X-Google-Smtp-Source: AA0mqf57GDeyjbTzizTDvwgHZIWKGjktE97SxwOAvab3vKYoBljLv+Jv7y6GOFoRNsx0ysHmTjUQTA==
X-Received: by 2002:a05:6512:224e:b0:4a4:68b8:c2de with SMTP id
 i14-20020a056512224e00b004a468b8c2demr1789569lfu.53.1670581127329; 
 Fri, 09 Dec 2022 02:18:47 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 a26-20020a056512201a00b004b5aa1c4d10sm197829lfb.118.2022.12.09.02.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 02:18:46 -0800 (PST)
Message-ID: <6350def8-bb1f-8aeb-4c98-4d02a4c59aed@linaro.org>
Date: Fri, 9 Dec 2022 11:18:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 12/12] dt-bindings: mediatek: mt8188: add mt8188-mt6359
 document
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-13-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208033148.21866-13-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 08/12/2022 04:31, Trevor Wu wrote:
> Add document for mt8188 board with mt6359.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8188-mt6359.yaml         | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
> new file mode 100644
> index 000000000000..eac1c87b693a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml

Missing vendor prefix. You got comments for it already.

> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8188-mt6359.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8188 ASoC sound card
> +
> +maintainers:
> +  - Trevor Wu <trevor.wu@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8188-mt6359-evb
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      sink/source pair of strings. Valid names could be the input or output
> +      widgets of audio components, power supplies, MicBias of codec and the
> +      software switch.
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8188 ASoC platform.
> +
> +  mediatek,dptx-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8188 Display Port Tx codec node.
> +
> +  mediatek,hdmi-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8188 HDMI codec node.

Why you do not use DAI links for all these?

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +
> +examples:
> +  - |
> +

Drop blank line.

> +    sound: mt8188-sound {

Drop label, not used. Use generic node names, so just "sound".

> +        compatible = "mediatek,mt8188-mt6359-evb";

Best regards,
Krzysztof

