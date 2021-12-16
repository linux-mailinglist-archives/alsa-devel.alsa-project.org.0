Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AF0477C2E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 20:08:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89A902824;
	Thu, 16 Dec 2021 20:07:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89A902824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639681682;
	bh=pIHzMP0Lkp5ltBkFy3az7CW6UNIfeS4tS8HjUNwkSYY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aQb8qCsq7bAr48nz5GJSn8/O0GNdzdJ/J1w6JCPpW49miqkS8BXz6eyflD0xfXeQD
	 BOMj2YQ7SE7/PNVyZbsNgTeY+CTGPiRLngp3Jy4icOZ1mcMWFJgImHUip9wkj8rCzY
	 dBnq/GLGi7BNJkeWhlOK2pVT7rxYV/Rp9gW39WaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E083F8015B;
	Thu, 16 Dec 2021 20:06:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECFD0F8014C; Thu, 16 Dec 2021 20:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B17D9F800F4
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 20:06:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B17D9F800F4
Received: by mail-oo1-f50.google.com with SMTP id
 x1-20020a4aea01000000b002c296d82604so15649ood.9
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 11:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CG56Jwgd9cUomWDpy5o7T6p7P8N4Uke3kC1sOxkLV7I=;
 b=Ac3GeQO1aKFLo3cggN26ftFk8uUlZwsIcGlaAOvlhWY9712rrpyQxLWpg3GO5asgHH
 1pZXzONV/9J0mY14r19U76LtqlC4uPug0QyX2h9g4pAD6KF01IMEo7qlmivL08A/GBKC
 vQRLy06v19xdTljCsrHLCyRsmu0Sar2F4xD7dY+3+BYMHxAOO7V4kUC7c6D+7fi+4w7m
 vvjSHRVRprFh8sWttWz3s9i/CwB/hPsWrm3bCnww3+j/9iBSV/l77/1StiQEClPX/GS9
 omuXlufchSb1AD3YdhZF751APfFXYfz/5dmbSzq0BUdQbBP7nRIcpkiYYqrBWl7L51MT
 OEhQ==
X-Gm-Message-State: AOAM5307nAfUnqETNCiFrMtxSIZ2IX4Dfjb84olhibek/I1VSDUrYZfq
 anYERQBUSeN44Keq8wIiAg==
X-Google-Smtp-Source: ABdhPJw/lKVAgvYYodsYmDHJIPLbu+J7eSYgLLi1L5y8TZtPzYt8+RFx+b/nx3iF88MBdKkrVbZ9WA==
X-Received: by 2002:a4a:e50e:: with SMTP id r14mr12353606oot.27.1639681601738; 
 Thu, 16 Dec 2021 11:06:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 184sm1132342oih.58.2021.12.16.11.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 11:06:41 -0800 (PST)
Received: (nullmailer pid 579625 invoked by uid 1000);
 Thu, 16 Dec 2021 19:06:40 -0000
Date: Thu, 16 Dec 2021 13:06:40 -0600
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: mediatek: mt8195: add clock property to
 sound node
Message-ID: <YbuOQOH3esG1pFQU@robh.at.kernel.org>
References: <20211215065835.3074-1-trevor.wu@mediatek.com>
 <20211215065835.3074-2-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215065835.3074-2-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 jiaxin.yu@mediatek.com, linux-kernel@vger.kernel.org, shumingf@realtek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
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

On Wed, Dec 15, 2021 at 02:58:35PM +0800, Trevor Wu wrote:
> clocks and clock-names are added to provide MCLK phandle for sound card.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml  | 12 ++++++++++++
>  .../bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml  | 12 ++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
> index cf6ad7933e23..b57c856d0cf3 100644
> --- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
> @@ -32,11 +32,21 @@ properties:
>      $ref: "/schemas/types.yaml#/definitions/phandle"
>      description: The phandle of MT8195 HDMI codec node.
>  
> +  clocks:
> +    items:
> +      - description: phandle and clock specifier for codec MCLK.
> +
> +  clock-names:
> +    items:
> +      - const: i2so1_mclk
> +
>  additionalProperties: false
>  
>  required:
>    - compatible
>    - mediatek,platform
> +  - clocks
> +  - clock-names
>  
>  examples:
>    - |
> @@ -44,6 +54,8 @@ examples:
>      sound: mt8195-sound {
>          compatible = "mediatek,mt8195_mt6359_rt1011_rt5682";
>          mediatek,platform = <&afe>;
> +        clocks = <&topckgen 235>; //CLK_TOP_APLL12_DIV2
> +        clock-names = "i2so1_mclk";
>          pinctrl-names = "default";
>          pinctrl-0 = <&aud_pins_default>;
>      };
> diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
> index 8f177e02ad35..e4720f76f66b 100644
> --- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
> @@ -42,11 +42,21 @@ properties:
>        A list of the desired dai-links in the sound card. Each entry is a
>        name defined in the machine driver.
>  
> +  clocks:
> +    items:
> +      - description: phandle and clock specifier for codec MCLK.
> +
> +  clock-names:
> +    items:
> +      - const: i2so1_mclk
> +
>  additionalProperties: false
>  
>  required:
>    - compatible
>    - mediatek,platform
> +  - clocks
> +  - clock-names
>  
>  examples:
>    - |
> @@ -54,6 +64,8 @@ examples:
>      sound: mt8195-sound {
>          compatible = "mediatek,mt8195_mt6359_rt1019_rt5682";
>          mediatek,platform = <&afe>;
> +        clocks = <&topckgen 235>; //CLK_TOP_APLL12_DIV2
> +        clock-names = "i2so1_mclk";

Being a virtual node, how does it have clocks? This belongs in the h/w 
device that consumes the clock.

>          pinctrl-names = "default";
>          pinctrl-0 = <&aud_pins_default>;
>      };
> -- 
> 2.18.0
> 
> 
