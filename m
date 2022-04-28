Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4049D5136F2
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 16:32:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEA211622;
	Thu, 28 Apr 2022 16:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEA211622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651156348;
	bh=sdJ//UDLU3OyL+dC8CHIEWDQn1EDUjjncpErjLvLwjc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FsxwSoeWxRRskX1XgLTaP+CVYRfwGtIEPvhylCxxRuGtvEmZRF+fMzeHBwHO9FTWU
	 YcuB/lhdVgJm9ksRAvbxi3pXftZZpfV8mWCztvRM16789oLydtDfrSBMOPwL/Te12t
	 XpMLAmDUTLZVX7N1wIt27Z5J2DT0/GFVXaQ4qhIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D2D7F8020D;
	Thu, 28 Apr 2022 16:31:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2B6CF8016E; Thu, 28 Apr 2022 16:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13D5DF8012B
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 16:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13D5DF8012B
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-e2442907a1so5303016fac.8
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 07:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3Pbfgb+P+Y6uKRbvZrIbkDzsXq4uSgu+65I8ansZfZg=;
 b=nWkxiuc6Avkl4wDpjJMITPqlZG/iLvdz15JHvITMl20PBNnqvBSlcYCKu4szkGae3S
 MV8zJEMes7ILgOax3iJBPd6fQjdfiYv3QRLZW+tkF8WjLTDXaqWN5bOTzucfcx5FcGYS
 +Tt0n/e2aOX6nJZ/Mvkxs0tqFsutgr3hQicoLVAAXIjvFkWizapmqEO9d1caEc5ZSivL
 BQRvMr9YCAPDxJI3G7FW5skk/W0m+agooaRYgwChkjUfJPR38COsMdZ8W8g+GWkeSaDZ
 hEgMQ3eEGZakv9aXfwzbyUuS1w9fqoD1V+KdxkKCFFu6MFIxDIVBKkQkWDCB5YyMqxkY
 zbVw==
X-Gm-Message-State: AOAM531EDvSEIVO7gCdcvLBML7BfqFz/SFJseFqUxEkgksWwBIka/DXB
 7AKxzoOxn6+8dV9CSjWpzw==
X-Google-Smtp-Source: ABdhPJx1VX5F/tJUIHYIip9Fxu6rAMhFBcqi6cHTI0eggbgDWjn/9R4RMK7nTXnkcz/rMEflMMwQ3w==
X-Received: by 2002:a05:6870:3292:b0:da:d2ff:9dca with SMTP id
 q18-20020a056870329200b000dad2ff9dcamr14140353oac.215.1651156278750; 
 Thu, 28 Apr 2022 07:31:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 5-20020a9d0105000000b005fbe5093eb0sm31088otu.54.2022.04.28.07.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:31:18 -0700 (PDT)
Received: (nullmailer pid 2184573 invoked by uid 1000);
 Thu, 28 Apr 2022 14:31:17 -0000
Date: Thu, 28 Apr 2022 09:31:17 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v4 16/18] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-da7219-max98357 document
Message-ID: <YmqlNV31FrcAyuN9@robh.at.kernel.org>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-17-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428093355.16172-17-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Thu, Apr 28, 2022 at 05:33:53PM +0800, Jiaxin Yu wrote:
> Add document for mt8186 board with mt6366, da7219 and max98357.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
> new file mode 100644
> index 000000000000..55e8649f2aea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8186-mt6366-da7219-max98357.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8186 with MT6366, DA7219 and MAX98357 ASoC sound card driver
> +
> +maintainers:
> +  - Jiaxin Yu <jiaxin.yu@mediatek.com>
> +
> +description:
> +  This binding describes the MT8186 sound card.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8186_mt6366_da7219_max98357_sound

s/_/-/

> +
> +  mediatek,platform:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of MT8186 ASoC platform.
> +
> +  headset-codec:
> +    type: object

       additionalProperties: false

> +    properties:
> +      sound-dai:
> +        $ref: /schemas/types.yaml#/definitions/phandle

sound-dai already has a type, so drop and define how many entries.

> +    required:
> +        - sound-dai
> +
> +  playback-codecs:
> +    type: object

       additionalProperties: false

> +    properties:
> +      sound-dai:
> +        minItems: 2
> +        maxItems: 3

If more than 1 entry, then you need to define what each one is and the 
order. Just like reg, interrupts, clocks, etc.

> +        $ref: /schemas/types.yaml#/definitions/phandle-array

Drop

> +    required:
> +        - sound-dai
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +  - headset-codec
> +  - playback-codecs
> +
> +examples:
> +  - |
> +
> +    sound: mt8186-sound {
> +        compatible = "mediatek,mt8186_mt6366_da7219_max98357_sound";
> +        mediatek,platform = <&afe>;
> +        pinctrl-names = "aud_clk_mosi_off",
> +                        "aud_clk_mosi_on";
> +        pinctrl-0 = <&aud_clk_mosi_off>;
> +        pinctrl-1 = <&aud_clk_mosi_on>;
> +
> +        headset-codec {
> +            sound-dai = <&da7219>;
> +        };
> +
> +        playback-codecs {
> +            sound-dai = <&anx_bridge_dp>,
> +                        <&max98357a>;
> +        };
> +    };
> +
> +...
> -- 
> 2.25.1
> 
