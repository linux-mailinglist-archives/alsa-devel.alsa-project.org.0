Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 733B6294F51
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 16:57:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF6FD177C;
	Wed, 21 Oct 2020 16:57:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF6FD177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603292274;
	bh=895qJyIQ675avWFFD1gIXFoQK1iCWZn2iKaHxVlq7FU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XeZTyZcgIuaMjwMMJT++JLDgzmBYngzPk3DVmxcuSKnWe9gUuMJcfzBiDx12BK+SH
	 9/ULcohKrjV/5Q53qkZZF8tZaKO5Zjm0Xcf5+TOm9kM5MPdbkKMREycyanjz41wM0o
	 Xdjzi83AjucfDfwfFMu73TgNsBUPIUm5B/tU91QY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66B4BF8026F;
	Wed, 21 Oct 2020 16:56:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A944F80264; Wed, 21 Oct 2020 16:56:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEBB3F80247
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 16:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEBB3F80247
Received: by mail-oi1-f194.google.com with SMTP id w141so2392615oia.2
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 07:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yLalAKEkjInUHTIemfTKDQJ49Jz0VY8t66NsoFtgLU4=;
 b=Wz0dIqMLkQCaB2xwA3hhY7inVG7HQMu/Lg80bmGgAU3yYO5k7WDxdK2hGb3FxxqzAT
 4HbeqrcStmh+dRJOXCjWb6XOl2EmILyamnjc07xY4T4A1jkDNqw+LyFX1LGCMhwUeAJc
 BWlsPTQ+wsy9kuB881h1Q6zJHuz4Ruf9jajJohwYuVBXKEBoR7d9yQzOi3snLHZ7VjKd
 gzUCs28WVoWIo5LjKWScjE2d6rquqjsA4FJtvoSCLI1HeW9A31iut+KrvLhXAh50IFVc
 sWvswFhfms6kv+LA8yMTC0eidKVfYceADr1xUH9aEOp3C5YyyrIX0m2UHCq21t59HUEj
 faSw==
X-Gm-Message-State: AOAM532GzoNO9v6k3Pg36vcnZwmwJLOaOZ9CeFzgt0OaiHonoWV2YdN3
 BLy/sBzNVU7umL6G8OE4aw==
X-Google-Smtp-Source: ABdhPJxy+68+KRz7O/jGvNfY0VnQsZU3nhhXkp7D0LUaX21+plv24AmcZ/0B8hoS/q6je6Yxg1/fIw==
X-Received: by 2002:aca:170a:: with SMTP id j10mr2651581oii.82.1603292166586; 
 Wed, 21 Oct 2020 07:56:06 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v123sm733083oif.29.2020.10.21.07.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 07:56:05 -0700 (PDT)
Received: (nullmailer pid 2780046 invoked by uid 1000);
 Wed, 21 Oct 2020 14:56:05 -0000
Date: Wed, 21 Oct 2020 09:56:05 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2 5/5] dt-bindings: mediatek: mt8192: add
 mt8192-mt6358-rt1015-rt5682 document
Message-ID: <20201021145605.GA2775711@bogus>
References: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603270435-3548-6-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603270435-3548-6-git-send-email-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com, tiwai@suse.com,
 tzungbi@google.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
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

On Wed, Oct 21, 2020 at 04:53:55PM +0800, Jiaxin Yu wrote:
> This patch adds document for the machine board with mt6358, rt1015
> and rt5682.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> new file mode 100644
> index 0000000000000..4c39e88906fc1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)

GPL-2.0-only

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8192-mt6359-rt1015-rt5682.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8192 with MT6359, RT1015 and RT5682 ASoC sound card driver
> +
> +maintainers:
> +   - Jiaxin Yu <jiaxin.yu@mediatek.com>
> +   - Shane Chien <shane.chien@mediatek.com>
> +
> +description:
> +  This binding describes the MT8192 sound card.
> +
> +properties:
> +  compatible:
> +      const: mediatek,mt8192_mt6359_rt1015_rt5682

I still don't think this is the right way to do this.

> +
> +  mediatek,platform:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of MT8192 ASoC platform.

I still don't understand what this is.

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
> +    sound: mt8192-sound {
> +        compatible = "mediatek,mt8192-mt6359-rt1015-rt5682";
> +        mediatek,platform = <&afe>;
> +        pinctrl-names = "aud_clk_mosi_off",
> +                        "aud_clk_mosi_on";
> +        pinctrl-0 = <&aud_clk_mosi_off>;
> +        pinctrl-1 = <&aud_clk_mosi_on>;
> +    };
> +
> +...
> -- 
> 2.18.0
