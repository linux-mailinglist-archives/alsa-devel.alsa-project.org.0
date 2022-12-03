Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50868641696
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Dec 2022 13:14:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C03AA186C;
	Sat,  3 Dec 2022 13:13:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C03AA186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670069668;
	bh=W9VVib11EAlwJXY+3+2i2ZR52bPeUwT4LfQskoWKQOk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YrMvaEMF0lR1XDLKYSJz5MVcL0sJs2AjmwgPdATZfoFOm3V/u31BOHe8S1F0WvjUm
	 gootdO5AFjqsa1fNhsZOjFuTItcs7LsxQOm0UKqiRgVk3+C3xly5hxcCCGB0ejvJBc
	 Mlo08Wh6dj0rlK6kjZYInLtquaZpD++SvnospyIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B753F8030F;
	Sat,  3 Dec 2022 13:13:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F407F800AB; Sat,  3 Dec 2022 13:13:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C4D7F800AB
 for <alsa-devel@alsa-project.org>; Sat,  3 Dec 2022 13:13:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C4D7F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TnNs9Twi"
Received: by mail-lj1-x230.google.com with SMTP id a19so8275289ljk.0
 for <alsa-devel@alsa-project.org>; Sat, 03 Dec 2022 04:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uTLYaWLVJ3C0TmmrxY/Wlk5QB4gl21jsIw90UM9GCgw=;
 b=TnNs9TwiVoGP6+Qg+OkyabJ+bgPHJieiTBkcYu9dRVC7i7WSf/fLJTmB5udj48+2U1
 zfcETkFb6ZtHlxR244bg38LCsPI4tBoriYkymcYllJA3WzhHh6gA90CumAWcuJ6IqdJw
 /MwXajb+AfCNJQeKsj62EiNwaz86Bcz/ILQqrt3qXXnjRMYXzUAex5avXCUwn+pHRG6A
 Y1t1UDahXHcinAPAHqqln/psjNoTLBVZH4GLHX7DIsvyE+Bxq/t+N3kuqZxML5odrYp3
 xS+ZpJe5ctync7cXMXCTYjw3J8Sm5pL9ZszMY/SxE3ihtIxsfijlj71faNqcwRvRCgia
 FUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uTLYaWLVJ3C0TmmrxY/Wlk5QB4gl21jsIw90UM9GCgw=;
 b=idQUDMvtQTKX+vV92zJJXdajPww2Y0mV7qWvV/kVKF6ZoJ4urlFN033Bir41j7mGW5
 1+NEClt0KEJp6OA8POLW3KfNvzP6AWStBmAP3UjJVhzU5TkTiWzz9PwveDPlMuv6Kv/0
 BSxrI4xD/gY/9ME56WF/Qcj8q7ptSkNCwmyGjpuFHLsgdvHWe4rwf1ZBxZ8nQGrYOONn
 7iQbbwGUmjpLO3AekvwAwtaiqBTinvDdK34Fc39uiuYLXszQ97EHmzn9raOMIdUAjlBv
 qcQOND1tDO0z3oOMOe9H5wN7/SdES58x1O+uIGQf8JdIc0MhXd3rExw4UYq2PZ7zttN3
 WzCg==
X-Gm-Message-State: ANoB5pkJwj8osEniH9d9p8rgsBDA04YNG+zZrRhTGV69UEKglHEu2oe3
 5UotTpPgsTvfJYKPtpovrK3ljA==
X-Google-Smtp-Source: AA0mqf6qff40XMjznJ0Uc00ZtXlqwql+i8LRDjdpsFjDBTZPaIiihrY4OqHpg8vJFPboQPskLEyh4A==
X-Received: by 2002:a05:651c:213:b0:277:e01:610e with SMTP id
 y19-20020a05651c021300b002770e01610emr22567717ljn.181.1670069606462; 
 Sat, 03 Dec 2022 04:13:26 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a05651231cf00b004b4b0a68f67sm1380403lfe.185.2022.12.03.04.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Dec 2022 04:13:26 -0800 (PST)
Message-ID: <b105572c-96fe-dbad-c435-43233cfb25a7@linaro.org>
Date: Sat, 3 Dec 2022 13:13:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] dt-bindings: sound: ti,pcm3168a: Convert to
 json-schema
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Damien Horsley <Damien.Horsley@imgtec.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <cover.1669980383.git.geert+renesas@glider.be>
 <9f2a2474ec71dcc2a76e868295202a8c425a5d41.1669980383.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9f2a2474ec71dcc2a76e868295202a8c425a5d41.1669980383.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org
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

On 02/12/2022 13:55, Geert Uytterhoeven wrote:
> Convert the Texas Instruments PCM3168A Audio Codec Device Tree binding
> documentation to json-schema.
> 
> Add missing properties.
> Drop unneeded pinctrl properties from example.

Thank you for your patch. There is something to discuss/improve.

> +description:
> +  The Texas Instruments PCM3168A is a 24-bit Multi-channel Audio CODEC with
> +  96/192kHz sampling rate, supporting both SPI and I2C bus access.
> +
> +properties:
> +  compatible:
> +    const: ti,pcm3168a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: System clock input
> +
> +  clock-names:
> +    items:
> +      - const: scki
> +
> +  reset-gpios:
> +    items:
> +      - description: |
> +          GPIO line connected to the active-low RST pin of the codec.
> +            RST = low: device power-down
> +            RST = high: device is enabled
> +
> +  "#sound-dai-cells":
> +    enum: [0, 1]

This is a bit unexpected. Looking at DTSes:
1. I see in ulcb-kf.dtsi with cells==0, but two endpoints. The dai cells
seem unused? In such case shall dai-cells be skipped if we have endpoints?

2. in k3-j721e-common-proc-board.dts has cells=1, but user's phandle
does not have an argument, so practically it is ==0? The user -
sound/soc/ti/j721e-evm.c - just gets the node and does not use cells,
right? So even though dai-cells==1, it does not matter, because user
gets its own parsing?

3. The pcm3168a driver also does not have any xlate function, but it
registers to DAIs, so all uses should be with cells==1 to select proper
DAI...


> +
> +  VDD1-supply:
> +    description: Digital power supply regulator 1 (+3.3V)
> +
> +  VDD2-supply:
> +    description: Digital power supply regulator 2 (+3.3V)
> +
> +  VCCAD1-supply:
> +    description: ADC power supply regulator 1 (+5V)
> +
> +  VCCAD2-supply:
> +    description: ADC power supply regulator 2 (+5V)
> +
> +  VCCDA1-supply:
> +    description: DAC power supply regulator 1 (+5V)
> +
> +  VCCDA2-supply:
> +    description: DAC power supply regulator 2 (+5V)
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: audio-graph-port.yaml#
> +        description: Audio input port.

unevaluatedProperties: false

> +
> +      port@1:
> +        $ref: audio-graph-port.yaml#
> +        description: Audio output port.

unevaluatedProperties: false


> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - VDD1-supply
> +  - VDD2-supply
> +  - VCCAD1-supply
> +  - VCCAD2-supply
> +  - VCCDA1-supply
> +  - VCCDA2-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pcm3168a: audio-codec@44 {
> +            compatible = "ti,pcm3168a";
> +            reg = <0x44>;
> +            reset-gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
> +            clocks = <&clk_core 42>;
> +            clock-names = "scki";
> +            VDD1-supply = <&supply3v3>;
> +            VDD2-supply = <&supply3v3>;
> +            VCCAD1-supply = <&supply5v0>;
> +            VCCAD2-supply = <&supply5v0>;
> +            VCCDA1-supply = <&supply5v0>;
> +            VCCDA2-supply = <&supply5v0>;

Can you extend the example with dai cells or with endpoints (or both,
depending on my previous comment...)

> +        };
> +    };

Best regards,
Krzysztof

