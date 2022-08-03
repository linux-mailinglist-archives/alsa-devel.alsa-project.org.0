Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC058875F
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Aug 2022 08:30:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD1B21FC;
	Wed,  3 Aug 2022 08:29:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD1B21FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659508233;
	bh=MOc1rRmo2Uf3ulGbX0hF/1ivI3AmgxdBg7DDmije+EQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d8lfOVIG+x2GlNiYYCzT6nRSUreiikgvlHd0sp+O84DGcxQnB5mSXnsG9Z++lURUY
	 OaRpCLHtI2f/o6O0aMSToExTTl677jw03UxUFwhEcF1XKHT9R/UGyW2YR4lN/FbntK
	 PDmCZVJiXoIwVQPAqYOXLr7OWmD9QO3Xs2FAXnNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BD98F8025E;
	Wed,  3 Aug 2022 08:29:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A548F8016A; Wed,  3 Aug 2022 08:29:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30D19F80083
 for <alsa-devel@alsa-project.org>; Wed,  3 Aug 2022 08:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30D19F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ovnV16wU"
Received: by mail-lf1-x135.google.com with SMTP id c17so6516101lfb.3
 for <alsa-devel@alsa-project.org>; Tue, 02 Aug 2022 23:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=h2xnvN3rkMZcaAStopByq5FB4LTsZ0396BsEMoxv4z4=;
 b=ovnV16wU7LJzAaYtctJMZD4GwKkovlVo2PAUjCPHLzzbcPBQ3vfsc/rYVQ3qYyXbs6
 4oic7KpRvY672hnjYP0yEarW1MhOUVroEGQWcnNFNkhuMj2XNfrUYDtAIaO5/O5asuNf
 5xVAzXgqwzQJtRFAOfcWlBp+KXRPpFWR6Lu0l1EtM+mqzOq2R0fBUfOtyac/zm5VoxJy
 zt/xnq51popheJe4gkNWo1NmGZUMRkgZqPw8jDQRP10gs+Qt1yX3PkYDF8neNrBQhsBK
 bvlflAZ4ZTbAo6JL+Td9X+iJBjQLU3Tb1O83fm6oSl9rx/v4xyAGR/13Penrf1Lp2W97
 eElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h2xnvN3rkMZcaAStopByq5FB4LTsZ0396BsEMoxv4z4=;
 b=WPhj2h/xRwuDgneEHdvAcAGh3ssotMlu4ldAEuj/m8J3vBQwA2vjae7f3Nt4aM82hn
 v/KYyOQJp+6blcFi20PX4hPN9BZqo1Mc1Qp1Pwad73jtf0tEHg0rT2inHbfbA/lHeUdg
 j73jC+iMyJ4+24T3IYpSLXTsvBIqBlQbj2++2PKzCJFWk1Rk+dg9rjbklclYb6eQIIix
 eeOhXYoxTQ1jYer005dPplew8GvQXYBQrzmWdKmIjIDmjPOFCR3bmzi6HA9W4hET7J/6
 AsYKovehi9rh/m1KtbYrTt2+lcGA1GcmfeH9Wgt3n3mAUqA7EIvrsnCVtO0VLFkGBF9J
 1rnQ==
X-Gm-Message-State: AJIora+v11CxSl6tIG/5tlYr4NE2OoeVwmA7vOFexoNhf0Sr8fbD6g9u
 ixHxTJ5QyfomWC/jqBdILoOyTQ==
X-Google-Smtp-Source: AGRyM1vsIr/v/vfg+vSqAa0rk6MpF5sy9zKVUL7orYXzO+Mvd7WPRVag2tcKP/G370pV2q4Ymk8GYw==
X-Received: by 2002:a05:6512:2185:b0:482:b4f0:f23 with SMTP id
 b5-20020a056512218500b00482b4f00f23mr9445294lft.31.1659508161102; 
 Tue, 02 Aug 2022 23:29:21 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a056512358200b0048afd0c496fsm898381lfr.156.2022.08.02.23.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 23:29:20 -0700 (PDT)
Message-ID: <7effc23b-b61a-9887-3875-d102b8fa270e@linaro.org>
Date: Wed, 3 Aug 2022 08:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: sound: tlv320aic3x: Convert to dtschema
Content-Language: en-US
To: Jai Luthra <j-luthra@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220802214811.29033-1-j-luthra@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220802214811.29033-1-j-luthra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
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

On 02/08/2022 23:48, Jai Luthra wrote:
> Convert bindings for TI's TLV320AIC3x audio codecs to dtschema.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---


Thank you for your patch. There is something to discuss/improve.

> diff --git a/Documentation/devicetree/bindings/sound/tlv320aic3x.yaml b/Documentation/devicetree/bindings/sound/tlv320aic3x.yaml
> new file mode 100644
> index 000000000000..6efb1d459543
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tlv320aic3x.yaml
> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/tlv320aic3x.yaml#

Filename with vendor prefix, so ti,tlv320aic3x.yaml

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TLV320AIC3x Codec Device Tree Bindings

s/Device Tree Bindings//

> +
> +maintainers:
> +  - Jai Luthra <j-luthra@ti.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tlv320aic3x
> +      - ti,tlv320aic33
> +      - ti,tlv320aic3007
> +      - ti,tlv320aic3106
> +      - ti,tlv320aic3104
> +
> +  reg:
> +    maxItems: 1
> +    description: i2c slave address

Skip description.

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO specification for the active low RESET input.
> +
> +  ai3x-gpio-func:
> +    description: AIC3X_GPIO1 & AIC3X_GPIO2 Functionality
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minItems: 3

uint32-array. Old bindings say about two items only. Mention any changes
to binding in cover letter.

> +    maxItems: 3
> +

You lost gpio-reset property. Also not explained in commit msg.

> +  ai3x-micbias-vg:
> +    description: MicBias required voltage. If node is omitted then MicBias is powered down.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - const: 1
> +        description: MICBIAS output is powered to 2.0V.
> +      - const: 2
> +        description: MICBIAS output is powered to 2.5V.
> +      - const: 3
> +        description: MICBIAS output is connected to AVDD.
> +
> +  ai3x-ocmv:
> +    description: Output Common-Mode Voltage selection.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - const: 0
> +        description: 1.35V
> +      - const: 1
> +        description: 1.5V
> +      - const: 2
> +        description: 1.65V
> +      - const: 3
> +        description: 1.8V
> +
> +  AVDD-supply:
> +    description: Analog DAC voltage.

New properties?

> +
> +  IOVDD-supply:
> +    description: I/O voltage.
> +
> +  DRVDD-supply:
> +    description: ADC analog and output driver voltage.
> +
> +  DVDD-supply:
> +    description: Digital core voltage.
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +#The pins can be used in referring sound node's audio-routing property.
> +
> +#CODEC output pins:
> +  # LLOUT
> +  # RLOUT
> +  # MONO_LOUT
> +  # HPLOUT
> +  # HPROUT
> +  # HPLCOM
> +  # HPRCOM
> +
> +#CODEC input pins for TLV320AIC3104:
> +  # MIC2L
> +  # MIC2R
> +  # LINE1L
> +  # LINE1R
> +
> +#CODEC input pins for other compatible codecs:
> +  # MIC3L
> +  # MIC3R
> +  # LINE1L
> +  # LINE2L
> +  # LINE1R
> +  # LINE2R

All this goes to top level description.


Best regards,
Krzysztof
