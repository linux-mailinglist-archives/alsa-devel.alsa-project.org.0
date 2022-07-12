Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB2257141F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 10:13:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83E0215C2;
	Tue, 12 Jul 2022 10:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83E0215C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657613634;
	bh=Anl0EOTwA7B6Ae3DRT/Bv6ATqgn4lIiRYke/+4tBp6k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c831MBZIPRPiGeBx+kGIIbGxtxCyauOf3fZn8I0Wqi405OYGe4kFALhs+tWWYNuCW
	 1uwxqHEVkVGdNaYKtqyUOPfROamtECEVU1y7W/cJ2UP0cyg7LLjpPCOcFHSguedJtA
	 8Vrpx25tjY6/F6qKV6vlZYhJAkS6zeSsel6VWzg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D19A0F80279;
	Tue, 12 Jul 2022 10:12:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12EBFF80246; Tue, 12 Jul 2022 10:12:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0826BF8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 10:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0826BF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pOERgv7k"
Received: by mail-lj1-x22e.google.com with SMTP id q7so8971847lji.12
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4i+nNQOuAb8IG2LCXMELsIxWqCoAxgrduDi9ilKLzsE=;
 b=pOERgv7kAwfTbBdUZl2J0fvQqLb2TJPjIKf0/MLehDvfOHf3Vq/Ja+0r2KdIE2DYi1
 M7G35G9vxOc8M20VHcCFu32WI1SoeNTxsMd118uT8gxYxByoE5b88+Yrgv4g6LfHkUTH
 td4Di/pOO0qMOqxpZn9OxAv8wvyshM6pgD7B4dtgboG9zAZL5H/NocWliMDBxXS3YwvJ
 igk15uwnxeddra/y9++sEO9j5SDtIyxKJzXnbT5v8dIVHXwd/pOWCGrbsS5aW6IyFUwu
 oD1YIzv6lOD6Mc4DTFPapjH7GzEVoXtQl4j1IfnKLB+WwRl1PymgN1b0nN6AZb6U7B0X
 64/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4i+nNQOuAb8IG2LCXMELsIxWqCoAxgrduDi9ilKLzsE=;
 b=z8aeTulYOZiLKpGF6eGeR4TR5/5tVPI/p0LcLPVTnd/VVAPDTrOLQMEUeAuJaFEaP3
 pZ/B/MyKpGXO6hWLsqeft1Bs/OoYGLy2AB/u0Ie7mZ438r+pZ+KGNitCDIOBmpzBK4Wd
 aPWJmxTNBuh/L+AXU0a4XYamJ171dSwoiQDnKDmued5naWBEax6i9JmYlmloF1f1brAI
 lQ23YPMI4i67PQy/8DY3DUO6hpB/BuE+/MxQqmUvkb8ueJOqUrTUrKd0nnTUOXFn/ojX
 n4RZ3OHEI8kCdIqhBLzgGMjW2hgRDWUxJFR50N91nnxhhCL9ClpVjtvQeRpSKl3ronJB
 IUZA==
X-Gm-Message-State: AJIora/t6P2nckfy39bEKgvBIIfQ4xrh/IUwANzv5LBtTEdq7fhq0Bst
 wV9Vq5yRdLNSE9i1xIdCeCUmdQ==
X-Google-Smtp-Source: AGRyM1uUFoce+sveQIYWnlaJl7QTr6WypMjZW9F4ekLQddnWC/D9rLAkayD78wLc7Spj5OyzsVjCCg==
X-Received: by 2002:a2e:880a:0:b0:25d:73af:52b5 with SMTP id
 x10-20020a2e880a000000b0025d73af52b5mr3098674ljh.298.1657613564070; 
 Tue, 12 Jul 2022 01:12:44 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
 by smtp.gmail.com with ESMTPSA id
 f26-20020ac2509a000000b0047f6e590f08sm2048431lfm.128.2022.07.12.01.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 01:12:43 -0700 (PDT)
Message-ID: <2e279f04-04da-80a0-deaa-633740350991@linaro.org>
Date: Tue, 12 Jul 2022 10:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: atmel,classd: Convert to
 json-schema
Content-Language: en-US
To: Ryan.Wanner@microchip.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com
References: <20220711183010.39123-1-Ryan.Wanner@microchip.com>
 <20220711183010.39123-2-Ryan.Wanner@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711183010.39123-2-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 11/07/2022 20:30, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Convert atmel CLASSD devicetree binding to json-schema.
> Change file name to match json-schema naming.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
> v1 -> v2:
> - Fix title.

Still wrong subsystem prefix. use git log --oneline --

> - Fix formatting.
> - Removed trivial descriptions.
> - Fix filename.
> 
>  .../bindings/sound/atmel,sama5d2-classd.yaml  | 104 ++++++++++++++++++
>  .../bindings/sound/atmel-classd.txt           |  55 ---------
>  2 files changed, 104 insertions(+), 55 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/atmel-classd.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> new file mode 100644
> index 000000000000..9ef8c6dde8a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (C) 2022 Microchip Technology, Inc. and its subsidiaries
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/atmel,sama5d2-classd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel ClassD Amplifier
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +  - Claudiu Beznea <claudiu.beznea@microchip.com>
> +
> +description:
> +  The Audio Class D Amplifier (CLASSD) is a digital input, Pulse Width Modulated (PWM)

Wrap at 80, like Linux coding style asks for.

> +  output stereo Class D amplifier.
> +
> +properties:
> +  compatible:
> +    const: atmel,sama5d2-classd
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    const: tx
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: gclk
> +
> +  assigned-clocks:
> +    maxItems: 1
> +    description: classd_gclk

Usually assigned-clocks are not mentioned (they come from core schema),
so why do you need to add it? Maybe just skip it.

> +
> +  atmel,model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The user-visible name of this sound complex.
> +    default: CLASSD
> +
> +  atmel,pwm-type:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - single
> +      - diff
> +    default: single
> +    description: PWM modulation type, "single" or "diff".

Remove last part - , "single" or "diff" - it duplicates enum.

> +
> +  atmel,non-overlap-time:
> +    description:
> +      Set non-overlapping time, the unit is nanosecond(ns).
> +      Non-overlapping will be disabled if not specified.

Keep description in consistent place, so either as first property or
last. Don't mix.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 5
> +      - 10
> +      - 15
> +      - 20
> +    default: 10
> +

Best regards,
Krzysztof
