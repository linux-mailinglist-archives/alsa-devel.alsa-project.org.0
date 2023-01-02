Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF1765B51D
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 17:33:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93793A1BF;
	Mon,  2 Jan 2023 17:32:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93793A1BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672677214;
	bh=ad/P6zQSNr3bD5goNCFkrTh1v4+kAxaR8Bw+rMYfzos=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DV8oFKbshg6Ehx3v8CHvYTIXtG0MXm5IdjBX/pMAD7rogmiVLeWr+Lbhnw1zFaIiE
	 PPII8OS3+d1G5PPtGGduMsVEbYHtElcMcxrQmpQJ1BqdqHmIUt2jg+DHzcEf/BKmpz
	 CFvi5ZrBEJ23zURryXvuF05rdXrwquXCk2lp/2so=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BC0DF800D0;
	Mon,  2 Jan 2023 17:32:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE828F8023A; Mon,  2 Jan 2023 17:32:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FC5BF800D0
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 17:32:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FC5BF800D0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WuNHynlh
Received: by mail-lf1-x129.google.com with SMTP id f34so42172048lfv.10
 for <alsa-devel@alsa-project.org>; Mon, 02 Jan 2023 08:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OPOWYK4xS+6xhzOdhfTnsSnUcVxUYMBnV8hiXVR43SI=;
 b=WuNHynlhNUkJUcD6KxjstzrRlxBGV8jbuBJ/hrag17I5q4FZ19LDt1kUasU+Mf/ow1
 JBdFdf/Q0EPoES9VCm0vib2w7JjQ6b0vOTXDcL9B89agvmmRsdc/EE+vKc/H2Lep6lT7
 kvujpwUNElUfG8MRBS8uQJjwjOD3nhMAo9M0FcLNOllZ8+YQVMk5PaCE3nKmji6OVgcG
 IIz+6L5GswHwQziHEeMp6UDveSxrLnfs0llc1Zs1AvixoQrFZYbEhPSGKbxY3n135fNu
 jgyNdng/nhQCdHUrDtQKR65iViyWju50338n/pJMMU4qhyrO6wxw1rk0Q8wo/7AJuJQa
 yEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OPOWYK4xS+6xhzOdhfTnsSnUcVxUYMBnV8hiXVR43SI=;
 b=rDS8fNOofkQpu/oS/4eI6Y2/PAg1Hb2Ta411hmulvVxbcT1iIRXMztMuXlT/2csCi5
 BefaPKXZSS65y/AmLCjQkREwYqvYf4/PYR7/oIPAXgsJMDaQE+LMJ6UXwrj2M8ocO53B
 VrQFv6C/pf8Htshryxnq46vnjhF6Nz+LRhnjFxwVsuhllS/LJiPfgERkMGT+oJcUsK/d
 yVOCfdNxOKDabj5qCO85ChckdYurn3sJUtnJVpvHlHdeUx67EsfuqqhIcvx3YKoO3xEk
 DH/eVjcd1pfHcguZ4+IDgUegOc3gME4GnWeK6oak9bJomMjbwxFfGx/1w76QGWVfTePh
 +fFA==
X-Gm-Message-State: AFqh2kqweKGff/CzM0vKA64bouD0UyAlxmEmynIqWU5STZikVlntfRCp
 +kmEgQTiRTRJENHVv7Lix8QS3g==
X-Google-Smtp-Source: AMrXdXtWnVOJrl54acwW1/P+lvWqyeGREQQIrliL5JrxuI2mDuRvgOBvBPJG9vCCGvebf+wH1RlFEw==
X-Received: by 2002:ac2:5fcf:0:b0:4b5:5f97:6a16 with SMTP id
 q15-20020ac25fcf000000b004b55f976a16mr11197018lfg.43.1672677144056; 
 Mon, 02 Jan 2023 08:32:24 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05651234cc00b0047f7722b73csm4481991lfr.142.2023.01.02.08.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 08:32:23 -0800 (PST)
Message-ID: <a885bf4b-253d-75fe-0224-02f8dfb44006@linaro.org>
Date: Mon, 2 Jan 2023 17:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 13/13] dt-bindings: mediatek: mt8188: add mt8188-mt6359
 document
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
References: <20221230055443.16024-1-trevor.wu@mediatek.com>
 <20221230055443.16024-14-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230055443.16024-14-trevor.wu@mediatek.com>
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

On 30/12/2022 06:54, Trevor Wu wrote:
> Add document for mt8188 board with mt6359.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../sound/mediatek,mt8188-mt6359.yaml         | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> new file mode 100644
> index 000000000000..5754c1d460db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
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
> +patternProperties:
> +  "^dai-link-[0-9]+$":
> +    type: object

On this level:
additionalProperties: false

> +    description: |
> +      Container for dai-link level properties and CODEC sub-nodes.
> +
> +    properties:
> +      dai-link-name:

Instead:
link-name
> +        description: |
> +          This property corresponds to the name of the BE dai-link to which
> +          we are going to update parameters in this node.
> +        items:
> +          enum:
> +            - ADDA_BE
> +            - DPTX_BE
> +            - ETDM1_IN_BE
> +            - ETDM2_IN_BE
> +            - ETDM1_OUT_BE
> +            - ETDM2_OUT_BE
> +            - ETDM3_OUT_BE
> +            - PCM1_BE
> +
> +      codec:
> +        description: Holds subnode which indicates codec dai.
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          sound-dai:
> +            minItems: 1
> +            maxItems: 2

required sound-dai

> +
> +    required:
> +      - dai-link-name
> +      - codec
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +

Your example looks pretty straightforward. Maybe you can use
simple-card.yaml?	


Best regards,
Krzysztof

