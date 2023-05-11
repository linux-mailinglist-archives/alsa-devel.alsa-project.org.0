Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5E76FEFB2
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 12:11:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B79D200;
	Thu, 11 May 2023 12:11:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B79D200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683799914;
	bh=DrKpTd9Bdtm/2cXUYc8D+iAlKYGbQgfeXsqmRFzadsg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uI8aFNeeVbpXhzzKzMDxyctAA5nqRNnEUPIVxG7CLODy0QJX5bE8woqCcNsIN1VOi
	 qCsunWFhfsxFaK/hqAZpboUC++HmKZ0P8hY/F2K2U7lbbkJHzpH0G2GovYr+d1yTxz
	 K0yQEPNQPVtBNJKiyYgk2fDXngEqwAgzWd/qSJao=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34307F80310;
	Thu, 11 May 2023 12:11:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7985FF8032D; Thu, 11 May 2023 12:10:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56A50F800BF
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 12:10:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A50F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QKKUILJ1
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso15256588a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 03:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683799851; x=1686391851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S/wUxk8mb0F4+0m9tdABR100eghiMPixillF1+W81tk=;
        b=QKKUILJ1i6uW/2PZox53+u9cR2YS8BDWDr74NzdKwjacBu2H7a+mYUd8KgHI252F23
         yl9NUCxvsA+gWNKKJb2cw+vpO47RtsSqI9V/ZpLFM4ELHq1k7dOeohTd17s+wxD7fXak
         1h63062C4OjDodYz8tsw5I3Aue0VbcC30auZEsMN206oCyyeFKC2o3AHtF3jvWdin3nq
         WNQG0ru+LbXQ3U42nVejew1upAgZggdfZJDYCcReHJ3+GpYvmR2nvhKbHNv7rcd+Oduj
         PQx82ue45JWqsMG+LTTwa+kzfAYAfgCaaXtU1np9sxr7aswwMuJRW4yA4fV9gHAV9Al6
         3zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683799851; x=1686391851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/wUxk8mb0F4+0m9tdABR100eghiMPixillF1+W81tk=;
        b=aKXpzIbJHLWHaWY3rHe08YqaAGi9ArNngrf4plAlRTJR8+5OZt+vrNPBCviTOXQ+qq
         TrmDUbopftFUtwSq+51NHu/7QFD/NIXdbRPR5OcLbrRkGE+F5Xq2cQBZ4kZq634ktTFw
         24ZX9HQ55FAzlXFkSf1fw57bWqXFC7Fi/DkLp6swfdV9PHbqUU0fLR2D85moxYZ1V98i
         bYJ7rNRriPYBT//0dyzQtjwfHnxfQTXvq8DF42rMG4fNgqZOTHOrulTKfluIU6smoiv9
         WpYtah0H35P2p4KeAmvSPocHxuaXJY6WhCwSoM2as/TYQeq8ClVnRlUQdivYEjoRcPA2
         czMQ==
X-Gm-Message-State: AC+VfDzHC2hbfrK6GCKKLS+sCcWP499OAo4G2GEnMxv66btOsk7nHtTB
	BxHGYuYJ9D5rI6wUWddsnJnjPA==
X-Google-Smtp-Source: 
 ACHHUZ6YUp8pR6//0HIAOtdezKk0ftjN8kg3Iigpnmrh1Js0rzh2aSz+iqcJ7x1EDbVkL0W6kYlhrA==
X-Received: by 2002:a17:907:9816:b0:96a:77a2:bba with SMTP id
 ji22-20020a170907981600b0096a77a20bbamr824087ejc.60.1683799850859;
        Thu, 11 May 2023 03:10:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:41e7:1b68:d38e:1348?
 ([2a02:810d:15c0:828:41e7:1b68:d38e:1348])
        by smtp.gmail.com with ESMTPSA id
 z4-20020a17090655c400b009660449b9a3sm3787760ejp.25.2023.05.11.03.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 03:10:50 -0700 (PDT)
Message-ID: <d826ded8-69a0-013a-5bcb-256048d62702@linaro.org>
Date: Thu, 11 May 2023 12:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] ASoC: dt-bindings: nau8825: Convert to dtschema
Content-Language: en-US
To: David Lin <CTLIN0@nuvoton.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
References: <20230510091914.590752-1-CTLIN0@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510091914.590752-1-CTLIN0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NVXE25C57LYYDXD4TDKQJQ57HYYDADWX
X-Message-ID-Hash: NVXE25C57LYYDXD4TDKQJQ57HYYDADWX
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NVXE25C57LYYDXD4TDKQJQ57HYYDADWX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2023 11:19, David Lin wrote:
> Convert the NAU8825 audio CODEC bindings to DT schema.
> 
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> 
> Changes:
> V2 -> V3:
>   - refine node name from "nau8825" to "codec" for generic purpose
> 
> V1 -> V2:
>   - add interrupts properties
>   - add maximum to nuvoton,jack-insert-debounce and nuvoton,jack-eject-debounce properites
>   - add a enum item for nuvoton,short-key-debounce properites
>   - add default value for most properites
>   - add maxItems to clocks properites and mclk entries to clock-names properites
>   - refine wrong indentation from clocks and clock-names
>   - refine dts example for interrupts and clocks
>   - remove headset label from dts example

Thanks.

Still few nits.


...

> +
> +title: NAU8825 audio CODEC
> +
> +maintainers:
> +  - John Hsu <KCHSU0@nuvoton.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nau8825
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The CODEC's interrupt output.

Drop description.

> +
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
> +    default: 1
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
> +    default: 2
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
> +    default: 6
> +
> +  nuvoton,sar-threshold-num:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Number of buttons supported.
> +    minimum: 1
> +    maximum: 4
> +    default: 4
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
> +    default: 0
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
> +    default: 6
> +
> +  nuvoton,sar-compare-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      SAR compare time.
> +    enum:
> +      - 0 # 500 ns
> +      - 1 # 1 us
> +      - 2 # 2 us
> +      - 3 # 4 us
> +    default: 1
> +
> +  nuvoton,sar-sampling-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      SAR sampling time.
> +    enum:
> +      - 0 # 2 us
> +      - 1 # 4 us
> +      - 2 # 8 us
> +      - 3 # 16 us
> +    default: 1
> +
> +  nuvoton,short-key-debounce:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Button short key press debounce time.
> +    enum:
> +      - 0 # 30 ms
> +      - 1 # 50 ms
> +      - 2 # 100 ms
> +      - 3 # 30 ms
> +    default: 3
> +
> +  nuvoton,jack-insert-debounce:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      number from 0 to 7 that sets debounce time to 2^(n+2) ms.
> +    maximum: 7
> +    default: 7
> +
> +  nuvoton,jack-eject-debounce:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      number from 0 to 7 that sets debounce time to 2^(n+2) ms
> +    maximum: 7
> +    default: 0
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
> +    default: 125
> +
> +  clocks:
> +    description:
> +      list of phandle and clock specifier pairs according to common clock
> +      bindings for the clocks described in clock-names.

Drop desription.

> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      should include "mclk" for the MCLK master clock.

Drop description.

> +    items:
> +      - const: mclk

You probably want also sound-dai-cells.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false

Best regards,
Krzysztof

