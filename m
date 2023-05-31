Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 272BD717B16
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 11:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 799BF206;
	Wed, 31 May 2023 11:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 799BF206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685523820;
	bh=SG+CLTihm03WjcTg8TDRR+BfoZOm46xRTVR6N1+z2pc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JZAkJW2eLmIaITlgW/Ttn5HjUDMmw40JT471zH+JT8zhIstHpbdqXo3P72XZECgcy
	 6OgPBXQEhnU/XBZwtkzuPLKx9ikRD4gbsi8wBVDgi+wkpG2umpKam7xyeu9E2Bn9eB
	 UxgrFBKWbVHJ/GKEw/b38h3EXoKnYe4/BWlVWEjY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98B24F80544; Wed, 31 May 2023 11:02:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9C6BF8026A;
	Wed, 31 May 2023 11:02:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A965F8042F; Wed, 31 May 2023 11:02:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84457F80149
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 11:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84457F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hl/FuLnQ
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-96f850b32caso1022158666b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 31 May 2023 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685523747; x=1688115747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eLGOgCTdN9b0I3RzLK+qTsPeSIXwIOR+lUiYzHLyqkA=;
        b=hl/FuLnQZIjxtgYC0n4FAzTYUV3krumKQ/xsy+UH7E/f3dgqeMgPN/5AWK3SEAbCIr
         FI5o6PsmvyimDsqt5v5W0X8JCTWp4IIqZ8x4bJAK1WuGUur4LrMbrSLlB4RyvOnzIWpj
         UnB3gYbhh4tVYaSM44gFg9i9Vmw/5b+wvnLAVnsq+U/bFznueJbE05QomY6GoS+Thfyi
         92yxam3PqKLAhtN2FkiFthHuejjWHvOd2bLzYlJhwaQRKPfYLKleciRdi3ZkGUkRYYwx
         li9VHUt3YJlo2ixD5iK57yOeNvKQ5dkacN1nQ4J0gD5U8MxsmtBUBfgxsazERnuF8oTC
         IkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685523747; x=1688115747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eLGOgCTdN9b0I3RzLK+qTsPeSIXwIOR+lUiYzHLyqkA=;
        b=al8wb6dRapLTLhKxs4zCksOIPyA9QKoB1fZ4DGpbIux+8R5EkffzJ79PxEfOu8MN/+
         gVtjxNiyP0dB058fl6h/bgvIn3+NiboDZrhID2tHQfUj5NpXi/CF3CZn+mYH/9pqv+0+
         iDrTlFVtTMD0I+j+sJsznm/ebL7G0OwgYJj4vCqcR9WQcrRvGU+1YXSwn+0psaU46ygv
         uAZ2iUc8pLnGhygKmH8FUa92s3TQrfVgDzJbLwhM/GCu1K7DLjAXxtYl/cwu9cJnoTZL
         UifH71thpe12ZgakI1BADgKCD3UT6DuN7KaYvOcD5sorp0Dn3Lw5gaReh37jQYXl/VwY
         wmOA==
X-Gm-Message-State: AC+VfDx8W60SvBwLVZrRArxorc790KyoWi+n7f2AOvHKPrLD726YjfOo
	wPaBdNxPQglCV3nrqQkRLiNQDg==
X-Google-Smtp-Source: 
 ACHHUZ6y49DNKKcWtbOKQ31f6lJ93szs/HfhYKInuhEAs8m2uleiHDoOT2aH1n4H9RrcakuD5WjtOg==
X-Received: by 2002:a17:907:7da5:b0:966:4d75:4a44 with SMTP id
 oz37-20020a1709077da500b009664d754a44mr4305321ejc.24.1685523747328;
        Wed, 31 May 2023 02:02:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id
 b13-20020a1709065e4d00b00965e9b435dfsm8560598eju.65.2023.05.31.02.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:02:26 -0700 (PDT)
Message-ID: <eef819db-4de3-06fe-8fe6-b0fe87ab5d84@linaro.org>
Date: Wed, 31 May 2023 11:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/6] dt-bindings: sound: cirrus,cs42l43: Add initial DT
 binding
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
 lee@kernel.org, krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org,
 vkoul@kernel.org
Cc: robh+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230530122112.1314458-1-ckeepax@opensource.cirrus.com>
 <20230530122112.1314458-3-ckeepax@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230530122112.1314458-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EFSPGDRT5MDNM56HUIRSFZ5B5WK2DYY4
X-Message-ID-Hash: EFSPGDRT5MDNM56HUIRSFZ5B5WK2DYY4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFSPGDRT5MDNM56HUIRSFZ5B5WK2DYY4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30/05/2023 14:21, Charles Keepax wrote:
> The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> for portable applications. It provides a high dynamic range, stereo
> DAC for headphone output, two integrated Class D amplifiers for
> loudspeakers, and two ADCs for wired headset microphone input or
> stereo line input. PDM inputs are provided for digital microphones.
> 
> Add a YAML DT binding document for this device.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thank you for your patch. There is something to discuss/improve.


> +  clocks:
> +    items:
> +      - description: Synchronous audio clock provided on mclk_in.
> +
> +  clock-names:
> +    const: mclk
> +
> +  cirrus,bias-low:
> +    type: boolean
> +    description:
> +      Select a 1.8V headset micbias rather than 2.8V.
> +
> +  cirrus,bias-sense-ua:

"ua" looks like microamp. If so, microamp instead:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Current at which the headset micbias sense clamp will engage, 0 to
> +      disable.
> +    enum: [ 0, 14, 23, 41, 50, 60, 68, 86, 95 ]
> +    default: 0
> +
> +  cirrus,bias-ramp-ms:
> +    description:
> +      Time in milliseconds the hardware allows for the headset micbias to
> +      ramp up.
> +    enum: [ 10, 40, 90, 170 ]
> +    default: 170
> +
> +  cirrus,detect-us:
> +    description:
> +      Time in microseconds the type detection will run for. Long values will
> +      cause more audible effects, but give more accurate detection.
> +    enum: [ 20, 100, 1000, 10000, 50000, 75000, 100000, 200000 ]
> +    default: 10000
> +
> +  cirrus,button-automute:
> +    type: boolean
> +    description:
> +      Enable the hardware automuting of decimator 1 when a headset button is
> +      pressed.
> +
> +  cirrus,buttons-ohms:
> +    description:
> +      Impedance in Ohms for each headset button, these should be listed in
> +      ascending order.
> +    minItems: 1
> +    maxItems: 6
> +
> +  cirrus,tip-debounce-ms:
> +    description:
> +      Software debounce on tip sense triggering in milliseconds.
> +    default: 0
> +
> +  cirrus,tip-invert:
> +    type: boolean
> +    description:
> +      Indicates tip detect polarity, inverted implies open-circuit whilst the
> +      jack is inserted.
> +
> +  cirrus,tip-disable-pullup:
> +    type: boolean
> +    description:
> +      Indicates if the internal pullup on the tip detect should be disabled.
> +
> +  cirrus,tip-fall-db-ms:
> +    description:
> +      Time in milliseconds a falling edge on the tip detect should be hardware
> +      debounced for. Note the falling edge is considered after the invert.
> +    enum: [ 0, 125, 250, 500, 750, 1000, 1250, 1500 ]
> +    default: 500
> +
> +  cirrus,tip-rise-db-ms:
> +    description:
> +      Time in milliseconds a rising edge on the tip detect should be hardware
> +      debounced for. Note the rising edge is considered after the invert.
> +    enum: [ 0, 125, 250, 500, 750, 1000, 1250, 1500 ]
> +    default: 500
> +
> +  cirrus,use-ring-sense:
> +    type: boolean
> +    description:
> +      Indicates if the ring sense should be used.
> +
> +  cirrus,ring-invert:
> +    type: boolean
> +    description:
> +      Indicates ring detect polarity, inverted implies open-circuit whilst the
> +      jack is inserted.
> +
> +  cirrus,ring-disable-pullup:
> +    type: boolean
> +    description:
> +      Indicates if the internal pullup on the ring detect should be disabled.
> +
> +  cirrus,ring-fall-db-ms:
> +    description:
> +      Time in milliseconds a falling edge on the ring detect should be hardware
> +      debounced for. Note the falling edge is considered after the invert.
> +    enum: [ 0, 125, 250, 500, 750, 1000, 1250, 1500 ]
> +    default: 500
> +
> +  cirrus,ring-rise-db-ms:
> +    description:
> +      Time in milliseconds a rising edge on the ring detect should be hardware
> +      debounced for. Note the rising edge is considered after the invert.
> +    enum: [ 0, 125, 250, 500, 750, 1000, 1250, 1500 ]
> +    default: 500
> +
> +  pinctrl:
> +    type: object
> +
> +    allOf:

Drop allOf, just "$ref: ......"

> +      - $ref: /schemas/pinctrl/pinctrl.yaml#
> +
> +    additionalProperties: false

Also drop blank lines between these three above.

> +
> +    properties:
> +      gpio-controller: true
> +
> +      '#gpio-cells':
> +        const: 2
> +
> +      gpio-ranges:
> +        items:
> +          - description: A phandle to the CODEC pinctrl node
> +            minimum: 0
> +          - const: 0
> +          - const: 0
> +          - const: 3
> +
> +    patternProperties:
> +      "-state$":

Use consistent quotes, either " or ' everywhere

> +        oneOf:
> +          - $ref: "#/$defs/cirrus-cs42l43-state"
> +          - patternProperties:
> +              "-pins$":
> +                $ref: "#/$defs/cirrus-cs42l43-state"
> +            additionalProperties: false
> +
> +  spi:
> +    type: object
> +
> +    allOf:
> +      - $ref: /schemas/spi/spi-controller.yaml#
> +
> +    unevaluatedProperties: false

Same comments here.

> +
> +$defs:
> +  cirrus-cs42l43-state:
> +    type: object
> +



Best regards,
Krzysztof

