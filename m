Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1774C4E3471
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 00:35:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D4D11700;
	Tue, 22 Mar 2022 00:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D4D11700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647905706;
	bh=PhOnr12pG0xpYNDNjwP6z0oQKQMRvCjIYPjC/M1pmJI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BfWkZ9Y5HFLIESeulNgKlJC2IqJAZtb0u204ZVYsYUErsFm7rOqKdm+4T1aadiDYx
	 +7f5IsV5IL2Z5spkHyrCnKlP/GiWJbgmYEh69fOMGSHymdfoCqbeQNeG9BopB09aHK
	 SeXhu/g2G9+J59yNMAt6WgDhsZjY+9stQlZXpYlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B1A5F80238;
	Tue, 22 Mar 2022 00:33:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B576F80227; Tue, 22 Mar 2022 00:33:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11B61F800FD
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 00:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11B61F800FD
Received: by mail-ot1-f54.google.com with SMTP id
 o20-20020a9d7194000000b005cb20cf4f1bso11517982otj.7
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 16:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iqlGJqAp9J3mBYn2W544lt1cPtvAWKBsX1sKB8vjaFQ=;
 b=KJwrZl+bsSvq7uZEIlJBaduaUN14xFO/bbUbeAllfSJXhfv+Cle/IxScFFdk4opfsb
 uxGFDleqngGHK4rWWZJY42blFs340Dm2KF8B9oqv78Ot6d0EEGGtkLmdz1X3hkGdEoQ2
 AwmrMHAj7MXhJQz4+tHQTxvtBdJa78MPTAHoyIdYUMYXHrU5ACi0dJOKOlhCdXJMpl5b
 pL7Ujub7Eyj2MrmQys+ZC7SeBTQtDTeWKOyRXxdGRalhzXzlyEztxitdbC/8hpnvqtd1
 jhC3SPZh7iLMAVF/LngSyXBS9xdse7Uninb9OVUqp46+/YYzIyydeAQr3PBPY68vtVNu
 dtuw==
X-Gm-Message-State: AOAM5333bUI3Y8VDZI/TYUXSUbO87+1qkVMq4809edHiKKczLnIZAitS
 PjhU4F9fR1QdSxAUzqnShQ==
X-Google-Smtp-Source: ABdhPJzxxO+k7l8znxP0vjnY2lEafBroFgaKOlvFVHd8JKFt8pjObiL7SWOFKakst91i39pW6Q1Hgw==
X-Received: by 2002:a9d:5f16:0:b0:5cb:51de:6761 with SMTP id
 f22-20020a9d5f16000000b005cb51de6761mr6071903oti.139.1647905625156; 
 Mon, 21 Mar 2022 16:33:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p14-20020a9d744e000000b005b235f5cf92sm8228647otk.65.2022.03.21.16.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 16:33:44 -0700 (PDT)
Received: (nullmailer pid 751258 invoked by uid 1000);
 Mon, 21 Mar 2022 23:33:43 -0000
Date: Mon, 21 Mar 2022 18:33:43 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v5 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
Message-ID: <YjkLVwvxvOKr30qL@robh.at.kernel.org>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-2-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220319114111.11496-2-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
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

On Sat, Mar 19, 2022 at 07:41:08PM +0800, Jiaxin Yu wrote:
> 1. Adds new compatible string "mt8192_mt6359_rt1015p_rt5682s" for machines
> with rt1015p and rt5682s.
> 2. Adds new property "mediatek,headset-codec" for getting headset codecs.
> 3. Adds new property "mediatek,speaker-codec" for getting speaker codecs.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> index a781e7aaaa38..aa0476eedd38 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - mediatek,mt8192_mt6359_rt1015_rt5682
>        - mediatek,mt8192_mt6359_rt1015p_rt5682
> +      - mediatek,mt8192_mt6359_rt1015p_rt5682s
>  
>    mediatek,platform:
>      $ref: "/schemas/types.yaml#/definitions/phandle"
> @@ -27,6 +28,25 @@ properties:
>      $ref: "/schemas/types.yaml#/definitions/phandle"
>      description: The phandle of HDMI codec.
>  
> +patternProperties:
> +  "^mediatek,headset-codec$":

Fixed string, not a pattern. Move to 'properties'. Drop the vendor 
prefix too.

> +    description: Holds subnode which indicates headset dai.
> +    type: object
> +    properties:
> +      sound-dai:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array

Standard property, don't need a type or description. Just how many and 
what each one is if more than 1.

> +        description: List of phandles to the headset codec nodes.

More than 1?

> +    additionalProperties: false
> +
> +  "^mediatek,speaker-codec$":
> +    description: Holds subnode which indicates speaker dai.
> +    type: object
> +    properties:
> +      sound-dai:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        description: List of phandles to the speaker codec nodes.

Same here.

> +    additionalProperties: false
> +
>  additionalProperties: false
>  
>  required:
> @@ -44,6 +64,15 @@ examples:
>                          "aud_clk_mosi_on";
>          pinctrl-0 = <&aud_clk_mosi_off>;
>          pinctrl-1 = <&aud_clk_mosi_on>;
> +
> +        mediatek,headset-codec {
> +            sound-dai = <&rt5682>;
> +        };
> +
> +        mediatek,speaker-codec {
> +            sound-dai = <&rt1015_l>,
> +                        <&rt1015_r>;
> +        };
>      };
>  
>  ...
> -- 
> 2.18.0
> 
> 
