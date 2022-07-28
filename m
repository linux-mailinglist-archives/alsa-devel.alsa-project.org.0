Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B7F583EBA
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 14:23:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95D761622;
	Thu, 28 Jul 2022 14:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95D761622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659011029;
	bh=pusAq9l8E37DPZByTOAjpAichLsvuCW8FLa7epC69Iw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qz38RI0TCSxIDxZnGu6enOQIv3yIWfW434axYCjP0cD417YWPut5T4r0rVRjA6tEe
	 1OQ/r/ST/ykrNSyhTn6GUFoUjifF82sVJxk9FvSpzrlumzBV3LpzYSS4gRPUlz3ZNx
	 cidVSkPGA6U3T12wBY3j6rmpsg0PvxyhthaIvERU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F67EF800FA;
	Thu, 28 Jul 2022 14:22:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EE9AF800FA; Thu, 28 Jul 2022 14:22:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B08F6F800FA
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 14:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B08F6F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jLlXxHNb"
Received: by mail-lj1-x22f.google.com with SMTP id b21so1774583ljk.8
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 05:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3DW4w/4ZUNYPAF3II/PgaJFeN+0spaAaHoZXNagVUT4=;
 b=jLlXxHNbA+iWPUCPzeb0rVr9SauWOCOFVWLGUwgdFOY1Vi30LTg0DGWqEjXQZy5m7t
 hqowKlT+9ZFGsXA3UKCQlEnot+7zvvH8kE0CNB84clxJN0faNLPuek1rpJGcLP2ELwap
 3K9ZbCNJ9oKwMhYTcd0SJid7G7H5+g7muCaUCjRB8yLB3blQ2QZB/UifOr2t6xpZS0zP
 WmOu3zXEewccBUW+HP0x8zmxCsgy71VGzGXlTsrwcoDEWhIug3HgubzZU9eriHCgrRAX
 05x/WSgqj4ApbPlhJR/oc30HX/ZJP9QsmHBqHz/bjokxLnGSuoZ8Gmf0g2v4tFv5RLDS
 cFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3DW4w/4ZUNYPAF3II/PgaJFeN+0spaAaHoZXNagVUT4=;
 b=yW/1IjPqaESgKF9GMXQ4cS/H8dvnpmPMlCn43+uvuCfHikZi6IOVB1NHTgB53gU0ow
 0lawbyqpkPWzYvnCdYiDRqHs24V91yA6UQkFJ0e/Aei8g+F6fx/oEfMm0cx2FZzUomSv
 v+uUqqC9E52yqOEKZcsURgXFZwbEQFAcWqYKGiKeSxlmT8++ZQ9OF130BxwrwhIHXPTx
 iWXohY7h0QGuf6QkIpYpLVVPGNLYRSJ2echokBnA1Eoimg2jzaN7cfLpXUhAaLpWR5fc
 yAgoaRarmeQ2dNM0RVTE+s/reCn+Ul3xqWc7YNT7YGNrAWYyAMt6PonS6VhUjBGI7TJD
 8mVg==
X-Gm-Message-State: AJIora/CVymeLymnwygAE9M9vow9sWl7c9J3bOIzCNmizMFaNvSxje1v
 zQdE15YspHwyYmZwfIA0QwX4Rg==
X-Google-Smtp-Source: AGRyM1sjEQmQI2ZdM4nyj5KDHaohbrn+HJAjJ+4EFXb/MkZ1uaLiRPkivjLUpP9najq0SVmF9EIugw==
X-Received: by 2002:a2e:9303:0:b0:25d:ffd7:6553 with SMTP id
 e3-20020a2e9303000000b0025dffd76553mr7847498ljh.299.1659010959625; 
 Thu, 28 Jul 2022 05:22:39 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no.
 [78.26.46.173]) by smtp.gmail.com with ESMTPSA id
 f7-20020a056512360700b0047f8790085csm178167lfs.71.2022.07.28.05.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 05:22:38 -0700 (PDT)
Message-ID: <c801afa4-a40d-9363-1ebd-9e8e30c21df5@linaro.org>
Date: Thu, 28 Jul 2022 14:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add sample format conversion
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com
References: <1658931983-31647-1-git-send-email-spujar@nvidia.com>
 <1658931983-31647-2-git-send-email-spujar@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1658931983-31647-2-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 27/07/2022 16:26, Sameer Pujar wrote:
> Presently "convert-channels" and "convert-rate" DT bindings are available
> for channel and rate fixups respectively.
> 
> Similarly add "convert-sample-format" binding to fixup DAI sample format
> as well. This is added to simple-card and audio-graph based sound cards.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml | 21 +++++++++++++++++++++
>  .../devicetree/bindings/sound/audio-graph.yaml      | 11 +++++++++++
>  .../devicetree/bindings/sound/simple-card.yaml      | 15 +++++++++++++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 5c36867..d7491038 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -24,6 +24,17 @@ properties:
>    convert-channels:
>      description: CPU to Codec rate channels.
>      $ref: /schemas/types.yaml#/definitions/uint32

Missing blank line.

> +  convert-sample-format:
> +    description: CPU to Codec sample format.
> +      Value    Format
> +        0        S8
> +        2        S16_LE
> +        6        S24_LE
> +        10       S32_LE
> +        32       S24_3LE

Why some random set of integers? Just use string, must more descriptive
and you do not embed programming model to DT... unless there is some
reason for this approach?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 2, 6, 10, 32]
> +
>  patternProperties:
>    "^endpoint(@[0-9a-f]+)?":
>      $ref: /schemas/graph.yaml#/$defs/endpoint-base
> @@ -70,6 +81,16 @@ patternProperties:
>        convert-channels:
>          description: CPU to Codec rate channels.
>          $ref: /schemas/types.yaml#/definitions/uint32

Ditto

> +      convert-sample-format:
> +        description: CPU to Codec sample format.
> +          Value    Format
> +            0        S8
> +            2        S16_LE
> +            6        S24_LE
> +            10       S32_LE
> +            32       S24_3LE
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 2, 6, 10, 32]

Ditto


>  
>        dai-tdm-slot-width-map:
>          description: Mapping of sample widths to slot widths. For hardware
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
> index 4b46794..df8a994 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
> @@ -32,6 +32,17 @@ properties:
>    convert-channels:
>      description: CPU to Codec rate channels.
>      $ref: /schemas/types.yaml#/definitions/uint32

Ditto

> +  convert-sample-format:
> +    description: CPU to Codec sample format.
> +      Value    Format
> +        0        S8
> +        2        S16_LE
> +        6        S24_LE
> +        10       S32_LE
> +        32       S24_3LE

Ditto


> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 2, 6, 10, 32]
> +
>    pa-gpios:
>      maxItems: 1
>    hp-det-gpio:
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index b261d49..6decd73 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -77,6 +77,17 @@ definitions:
>      description: CPU to Codec rate channels.
>      $ref: /schemas/types.yaml#/definitions/uint32
>  
> +  convert-sample-format:
> +    description: CPU to Codec sample format.
> +      Value    Format
> +        0        S8
> +        2        S16_LE
> +        6        S24_LE
> +        10       S32_LE
> +        32       S24_3LE
> +    $ref: /schemas/types.yaml#/definitions/uint32

Wait, you now put the same property in four different places. Don't you
have something which could be shared?



Best regards,
Krzysztof
