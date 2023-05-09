Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A196FBF2F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 08:23:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E9A6112D;
	Tue,  9 May 2023 08:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E9A6112D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683613402;
	bh=jD6xnOQR6X60RYiWhjA09qHPMAsA8VBDV5RizFfQo5U=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e3HCwooL1oSe9fWBxP/S3KDmKNHuR9KT5tKjYHd90OV5lnz+zBqu0rAHLDX/rQ51X
	 qL4/2IxiGYXh0rG9bqJOcp9pFp28mq3Axq9VhyyqMyeIyQVfrKL1/9rilQnzSU2gSA
	 DCcdf71vw3Ev+VaDa75gZPpRowdQJwHFJJb9GFCA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E99DF80310;
	Tue,  9 May 2023 08:22:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27839F8032D; Tue,  9 May 2023 08:22:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F8A7F80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 08:22:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F8A7F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BkH3hVBh
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bcb00a4c2so8664132a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 23:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683613340; x=1686205340;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSk3BBRb80++KvV6yBoEHi1ZcG547dRguukVjiWaCfo=;
        b=BkH3hVBhfe296BxZCCdcCJemE65cyCuzU4VhhkE8Fj4BvCOa7v/FzrkRv+7DQ06xNs
         V5h/TWMT8/l+x9LAHweghEfKuyful7QUVFxjJQR1OQpFFr1SlCiAqX3ehKjCs5DRtij3
         VVXTgMc3kUyTe+BDKjL1LW3jroypRejnsBk7NoFBmxr7Lqx6WJvKhOgIf3MTyZ63btns
         9TK7ek4JN20j0A3pnhrZdZr8IuehWP1vWG0iHLPNHPhx+eMiaCSNlWtR8JUDO/bTl8EM
         M9XEm8OkmE2EH68eSi+mLIqHfXjfbO5+kbhG3RUQGyHqvDxiJcRW9xa/gwDYxBFeWX8b
         rg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683613340; x=1686205340;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xSk3BBRb80++KvV6yBoEHi1ZcG547dRguukVjiWaCfo=;
        b=I5D3YjhqckSIUpXs0ycXN9Rt/Qoemsm7PIQU9j6e/X4CbqdNP+yJzHlfuSF0uEdkqg
         t7CjFUGfr9uG8iG3mhZG66GUBuy1Eja66qZ56k8j8HbBmxOqK3nDj1Su4NpV0l/cmY12
         xjTVYtAY9ai6cViGZy/c5JtjNhmBn7MGR6/3PCrH2LLa7exvHBe9y52QYP/9ypwJCIn5
         IKz4/pasxbwcaikRYTTLdj0fDMx4X8XCCrp7h7DUImAa8ID5B+zw9SomNI0dBaoag47c
         HDq6K3XGIezARM5ctOcrcrGs8GGBnbnlZHkOtl00SvgdY93WHnuSTknynQhAxYpwb0fu
         a/3A==
X-Gm-Message-State: AC+VfDzyj9Fs+nt6Pltho9yQW9cas5XfF9FtMUl7dJQayD2bPczqMBK8
	fyLBrsAzNkGmQFFNw28BLRJcOA==
X-Google-Smtp-Source: 
 ACHHUZ4EDptqZnZAt+rMrr1h4oH5mF+fETdOlNU33plUO1L0RlFjSaGf2UHIpVHfpSsYqwWvSKGQ6A==
X-Received: by 2002:a17:907:7e86:b0:969:b2e2:4f3b with SMTP id
 qb6-20020a1709077e8600b00969b2e24f3bmr2318000ejc.51.1683613339846;
        Mon, 08 May 2023 23:22:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76?
 ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id
 v9-20020a170906380900b0094e1344ddfdsm890096ejc.34.2023.05.08.23.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 23:22:19 -0700 (PDT)
Message-ID: <16770b43-9ac2-d261-62fd-bba463b49f6d@linaro.org>
Date: Tue, 9 May 2023 08:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: dt-bindings: nau8825: Convert to dtschema
Content-Language: en-US
To: David Lin <CTLIN0@nuvoton.com>, broonie@kernel.org
References: <20230509051054.480412-1-CTLIN0@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230509051054.480412-1-CTLIN0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: S37VNYI4DZMHBDEFCGWAYWEIY46LAGHR
X-Message-ID-Hash: S37VNYI4DZMHBDEFCGWAYWEIY46LAGHR
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S37VNYI4DZMHBDEFCGWAYWEIY46LAGHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/05/2023 07:10, David Lin wrote:
> Convert the NAU8825 audio CODEC bindings to DT schema.
> 
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> ---
>  .../devicetree/bindings/sound/nau8825.txt     | 111 ---------
>  .../bindings/sound/nuvoton,nau8825.yaml       | 220 ++++++++++++++++++
>  2 files changed, 220 insertions(+), 111 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nau8825.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> 
> diff --git a/Documentation/devicetree/bindings/sound/nau8825.txt b/Documentation/devicetree/bindings/sound/nau8825.txt
> deleted file mode 100644
> index a9c34526f4cb..000000000000
> --- a/Documentation/devicetree/bindings/sound/nau8825.txt
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -Nuvoton NAU8825 audio codec

(...)

> +  nuvoton,jkdet-enable:
> +    description:
> +      Enable jack detection via JKDET pin.
> +    type: boolean
> +
> +  nuvoton,jkdet-pull-enable:
> +    description:
> +      Enable JKDET pin pull.
> +      If set - pin pull enabled, otherwise pin in high impedance state.
> +    type: boolean
> +
> +  nuvoton,jkdet-pull-up:
> +    description:
> +      Pull-up JKDET pin.
> +      If set then JKDET pin is pull up, otherwise pull down.
> +    type: boolean
> +
> +  nuvoton,jkdet-polarity:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      JKDET pin polarity.
> +    enum:
> +      - 0 # active high
> +      - 1 # active low

Since this is optional:
default: ?

Same in other places.

> +
> +  nuvoton,vref-impedance:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      VREF Impedance selection.
> +    enum:
> +      - 0 # Open
> +      - 1 # 25 kOhm
> +      - 2 # 125 kOhm
> +      - 3 # 2.5 kOhm
> +
> +  nuvoton,micbias-voltage:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Micbias voltage level.
> +    enum:
> +      - 0 # VDDA
> +      - 1 # VDDA
> +      - 2 # VDDA * 1.1
> +      - 3 # VDDA * 1.2
> +      - 4 # VDDA * 1.3
> +      - 5 # VDDA * 1.4
> +      - 6 # VDDA * 1.53
> +      - 7 # VDDA * 1.53
> +
> +  nuvoton,sar-threshold-num:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Number of buttons supported.
> +    minimum: 1
> +    maximum: 4
> +
> +  nuvoton,sar-threshold:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Impedance threshold for each button. Array that contains up to 8 buttons
> +      configuration. SAR value is calculated as
> +      SAR = 255 * MICBIAS / SAR_VOLTAGE * R / (2000 + R) where MICBIAS is
> +      configured by 'nuvoton,micbias-voltage', SAR_VOLTAGE is configured by
> +      'nuvoton,sar-voltage', R - button impedance.
> +      Refer datasheet section 10.2 for more information about threshold
> +      calculation.
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      minimum: 0
> +      maximum: 255
> +
> +  nuvoton,sar-hysteresis:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Button impedance measurement hysteresis.
> +
> +  nuvoton,sar-voltage:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Reference voltage for button impedance measurement.
> +    enum:
> +      - 0 # VDDA
> +      - 1 # VDDA
> +      - 2 # VDDA * 1.1
> +      - 3 # VDDA * 1.2
> +      - 4 # VDDA * 1.3
> +      - 5 # VDDA * 1.4
> +      - 6 # VDDA * 1.53
> +      - 7 # VDDA * 1.53
> +
> +  nuvoton,sar-compare-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      SAR compare time.
> +    enum:
> +      - 0 # 500ns
> +      - 1 # 1us
> +      - 2 # 2us
> +      - 3 # 4us
> +
> +  nuvoton,sar-sampling-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      SAR sampling time.
> +    enum:
> +      - 0 # 2us
> +      - 1 # 4us
> +      - 2 # 8us
> +      - 3 # 16us
> +
> +  nuvoton,short-key-debounce:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Button short key press debounce time.
> +    enum:
> +      - 0 # 30 ms
> +      - 1 # 50 ms
> +      - 2 # 100 ms
> +
> +  nuvoton,jack-insert-debounce:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      number from 0 to 7 that sets debounce time to 2^(n+2) ms.

maximum: 7

> +
> +  nuvoton,jack-eject-debounce:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      number from 0 to 7 that sets debounce time to 2^(n+2) ms

maximum: 7

> +
> +  nuvoton,crosstalk-enable:
> +    description:
> +      make crosstalk function enable if set.
> +    type: boolean
> +
> +  nuvoton,adcout-drive-strong:
> +    description:
> +      make the drive strength of ADCOUT IO PIN strong if set.
> +      Otherwise, the drive keeps normal strength.
> +    type: boolean
> +
> +  nuvoton,adc-delay-ms:
> +    description:
> +      Delay (in ms) to make input path stable and avoid pop noise.
> +      The default value is 125 and range between 125 to 500 ms.
> +    minimum: 125
> +    maximum: 500
> +
> +  clocks:
> +   description:
> +     list of phandle and clock specifier pairs according to common clock
> +     bindings for the clocks described in clock-names.

Drop description. maxItems: 1.

> +
> +  clock-names:
> +   description:
> +     should include "mclk" for the MCLK master clock.

No, you need to list entries with items.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/tegra-gpio.h>
> +    #include <dt-bindings/soc/tegra-pmc.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        headset: nau8825@1a {

Node names should be generic, audio-codec for example.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "nuvoton,nau8825";
> +            reg = <0x1a>;
Best regards,
Krzysztof

