Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E73805F33B6
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 18:39:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20B0A1841;
	Mon,  3 Oct 2022 18:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20B0A1841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664815199;
	bh=8ZyRk9dXMaK7v6PWLMCx0qUsO6vvYkbZ7ud6NbBnipI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q15Gu04bL6dACdqIoc8+oEDloRSFWXJzojcdFqW19wmst0Gl2G53tKDqNKo792npo
	 0e9JOI5sUQhUn7ZX6QKLn6o+3r1SGkxSRSjEthOGMYtrrumKbeT6aJFuDa7Bma+gVC
	 Dxz2q7RlVJ56/y67X//QjAfIND4UtbD74mYicOe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DCA1F80431;
	Mon,  3 Oct 2022 18:39:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2944DF80269; Mon,  3 Oct 2022 18:39:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 229A6F800CC
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 18:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 229A6F800CC
Received: by mail-oo1-f44.google.com with SMTP id
 c13-20020a4ac30d000000b0047663e3e16bso7098745ooq.6
 for <alsa-devel@alsa-project.org>; Mon, 03 Oct 2022 09:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=/z8QKfMMd+WonlTY8n0DPm8aF8FNJazKFMMzbtj3WIs=;
 b=K+nQW2+vFswE9RWHy71SQzpj80pTM3uW/jD+PSJcMB66GTKd7BhXbgqFxk7wwwOwq2
 HHDv0l6zX5u5OYQs24gR5DGQgMEv2x1SaIZIKxOlwLct4sfxGqvhqDzWRWYM7xZv5FZN
 q4TQu5wVVYrjoDf+koW7keKG5Uj96LnhBdDgcf2GqDSVUSNzBUym5NjE5qOHkbElgQOL
 CnwQE/KAjuKKib3mdPhtRLbgS43o6nCo7oRAjDeGUMaTpRpiSuNVnwThH2R55YrrBK1g
 2lrXxd9enQt5VBoVasz1D0iB1IXyKQopqgrWVFNlwCsC1GpmP2rhOhMnuLcmG9amt5tD
 dYNQ==
X-Gm-Message-State: ACrzQf2j70P+UKY202WBJKDGpk9YhJi5F4FA8UYCRsdIaU3KxO+ymHey
 AeQ6F3MSy2pCUp8gw/mjCw==
X-Google-Smtp-Source: AMsMyM4lszwFBCq6xZtL8Y5wePiwpGG3IHD7bBaryZPr5QpC4yM9+bd2vnHC3Cb5CLrmbhQmc34z8A==
X-Received: by 2002:a9d:4c83:0:b0:655:f666:801d with SMTP id
 m3-20020a9d4c83000000b00655f666801dmr8543844otf.303.1664815132666; 
 Mon, 03 Oct 2022 09:38:52 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l6-20020a056871068600b0011e37fb5493sm3089089oao.30.2022.10.03.09.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 09:38:52 -0700 (PDT)
Received: (nullmailer pid 2422556 invoked by uid 1000);
 Mon, 03 Oct 2022 16:38:51 -0000
Date: Mon, 3 Oct 2022 11:38:51 -0500
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH 12/12] dt-bindings: mediatek: mt8188: add mt8188-mt6359
 document
Message-ID: <20221003163851.GA2414624-robh@kernel.org>
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
 <20220930145701.18790-13-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930145701.18790-13-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
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

On Fri, Sep 30, 2022 at 10:57:01PM +0800, Trevor Wu wrote:
> Add document for mt8188 board with mt6359.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8188-mt6359.yaml         | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
> new file mode 100644
> index 000000000000..57c7c5ceef8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8188-mt6359.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8188 ASoC sound card driver
> +
> +maintainers:
> +  - Trevor Wu <trevor.wu@mediatek.com>
> +
> +description:
> +  This binding describes the MT8188 sound card.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8188-sound
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
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

Don't need quotes.

> +    description: The phandle of MT8188 ASoC platform.
> +
> +  mediatek,dptx-codec:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of MT8188 Display Port Tx codec node.
> +
> +  mediatek,hdmi-codec:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of MT8188 HDMI codec node.
> +
> +  mediatek,dai-link:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description:
> +      A list of the desired dai-links in the sound card. Each entry is a
> +      name defined in the machine driver.

Names have to be defined here.

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
> +    sound: mt8188-sound {
> +        compatible = "mediatek,mt8188-sound";
> +        mediatek,platform = <&afe>:
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&aud_pins_default>;
> +        audio-routing =
> +            "Headphone", "Headphone L",
> +            "Headphone", "Headphone R",
> +            "AIN1", "Headset Mic";
> +    };
> +
> +...
> -- 
> 2.18.0
> 
> 
